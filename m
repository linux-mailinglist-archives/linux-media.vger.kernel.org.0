Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8C16ED0F3
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 17:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbjDXPHr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 11:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbjDXPHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 11:07:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A03256196
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 08:07:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33F6D62605
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 15:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521AEC433EF
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 15:07:30 +0000 (UTC)
Message-ID: <6f82dcb4-163c-e551-da43-e3c88fecfbcb@xs4all.nl>
Date:   Mon, 24 Apr 2023 17:07:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: cec: core: don't set last_initiator if tx in progress
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

When a message was received the last_initiator is set to 0xff.
This will force the signal free time for the next transmit
to that for a new initiator. However, if a new transmit is
already in progress, then don't set last_initiator, since
that's the initiator of the current transmit. Overwriting
this would cause the signal free time of a following transmit
to be that of the new initiator instead of a next transmit.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-adap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index be0c38969479..241b1621b197 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1091,7 +1091,8 @@ void cec_received_msg_ts(struct cec_adapter *adap,
 	mutex_lock(&adap->lock);
 	dprintk(2, "%s: %*ph\n", __func__, msg->len, msg->msg);

-	adap->last_initiator = 0xff;
+	if (!adap->transmit_in_progress)
+		adap->last_initiator = 0xff;

 	/* Check if this message was for us (directed or broadcast). */
 	if (!cec_msg_is_broadcast(msg)) {
-- 
2.39.2

