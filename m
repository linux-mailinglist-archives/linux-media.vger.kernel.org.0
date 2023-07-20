Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60FA375A6D7
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 08:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjGTGre (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 02:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbjGTGra (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 02:47:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A36B212C
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 23:47:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C809D617DC
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 06:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9505CC433B9;
        Thu, 20 Jul 2023 06:47:25 +0000 (UTC)
Message-ID: <6d55593a-514e-03f9-0cb0-38858a21d0eb@xs4all.nl>
Date:   Thu, 20 Jul 2023 08:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: [PATCHv2 1/3] media: cec: core: add adap_nb_transmit_canceled()
 callback
Content-Language: en-US
To:     linux-media@vger.kernel.org
Cc:     Zheng Zhang <zheng.zhang@email.ucr.edu>
References: <20230612135839.254935-1-hverkuil-cisco@xs4all.nl>
 <20230612135839.254935-2-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230612135839.254935-2-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A potential deadlock was found by Zheng Zhang with a local syzkaller
instance.

The problem is that when a non-blocking CEC transmit is canceled by calling
cec_data_cancel, that in turn can call the high-level received() driver
callback, which can call cec_transmit_msg() to transmit a new message.

The cec_data_cancel() function is called with the adap->lock mutex held,
and cec_transmit_msg() tries to take that same lock.

The root cause is that the received() callback can either be used to pass
on a received message (and then adap->lock is not held), or to report a
canceled transmit (and then adap->lock is held).

This is confusing, so create a new low-level adap_nb_transmit_canceled
callback that reports back that a non-blocking transmit was canceled.

And the received() callback is only called when a message is received,
as was the case before commit f9d0ecbf56f4 ("media: cec: correctly pass
on reply results") complicated matters.

Reported-by: Zheng Zhang <zheng.zhang@email.ucr.edu>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: f9d0ecbf56f4 ("media: cec: correctly pass on reply results")
---
Changes since v1: sparse noticed that call_op was used instead of
call_void_op. Since adap_nb_transmit_canceled returns void, that's
the correct way to call it.
---
 drivers/media/cec/core/cec-adap.c | 4 ++--
 include/media/cec.h               | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 241b1621b197..a9b73fb33888 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -385,8 +385,8 @@ static void cec_data_cancel(struct cec_data *data, u8 tx_status, u8 rx_status)
 	cec_queue_msg_monitor(adap, &data->msg, 1);

 	if (!data->blocking && data->msg.sequence)
-		/* Allow drivers to process the message first */
-		call_op(adap, received, &data->msg);
+		/* Allow drivers to react to a canceled transmit */
+		call_void_op(adap, adap_nb_transmit_canceled, &data->msg);

 	cec_data_completed(data);
 }
diff --git a/include/media/cec.h b/include/media/cec.h
index abee41ae02d0..6556cc161dc0 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -121,14 +121,16 @@ struct cec_adap_ops {
 	void (*adap_configured)(struct cec_adapter *adap, bool configured);
 	int (*adap_transmit)(struct cec_adapter *adap, u8 attempts,
 			     u32 signal_free_time, struct cec_msg *msg);
+	void (*adap_nb_transmit_canceled)(struct cec_adapter *adap,
+					  const struct cec_msg *msg);
 	void (*adap_status)(struct cec_adapter *adap, struct seq_file *file);
 	void (*adap_free)(struct cec_adapter *adap);

-	/* Error injection callbacks */
+	/* Error injection callbacks, called without adap->lock held */
 	int (*error_inj_show)(struct cec_adapter *adap, struct seq_file *sf);
 	bool (*error_inj_parse_line)(struct cec_adapter *adap, char *line);

-	/* High-level CEC message callback */
+	/* High-level CEC message callback, called without adap->lock held */
 	int (*received)(struct cec_adapter *adap, struct cec_msg *msg);
 };

-- 
2.40.1


