Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B72F46C805B
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 15:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbjCXOxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 10:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbjCXOxE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 10:53:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18AE1A1
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 07:53:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 47F7B62998
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 14:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE96C433D2;
        Fri, 24 Mar 2023 14:53:00 +0000 (UTC)
Message-ID: <5ea067ed-178f-2f0d-3ee7-44684b723d52@xs4all.nl>
Date:   Fri, 24 Mar 2023 15:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: cec: core: not all messages were passed on when
 monitoring
Cc:     John 1000 <john1000@telfort.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The valid_la boolean is used to check if the destination logical
address is either 15 (broadcast) or our logical address. If it is
for another logical address, then only adapters that have the
CEC_CAP_MONITOR_ALL capability can pass it on.

However, it is also used to do more detailed validity checks,
such as whether the message was broadcast when it should have been
directed, or vice versa, in which case the message must be ignored
according to the spec. But that should not apply to monitoring.

Add a new bool that just checks the LA and nothing else.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
John, I suspect that this will fix the monitoring issue. I think the
TV is incorrectly broadcasting these messages, and so they are ignored
per the spec. But they should still be monitored.
---
diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 4f5ab3cae8a7..769ea6b2e1d0 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1052,6 +1052,7 @@ void cec_received_msg_ts(struct cec_adapter *adap,
 	u8 cmd = msg->msg[1];
 	bool is_reply = false;
 	bool valid_la = true;
+	bool monitor_valid_la = true;
 	u8 min_len = 0;

 	if (WARN_ON(!msg->len || msg->len > CEC_MAX_MSG_SIZE))
@@ -1093,8 +1094,10 @@ void cec_received_msg_ts(struct cec_adapter *adap,
 	adap->last_initiator = 0xff;

 	/* Check if this message was for us (directed or broadcast). */
-	if (!cec_msg_is_broadcast(msg))
+	if (!cec_msg_is_broadcast(msg)) {
 		valid_la = cec_has_log_addr(adap, msg_dest);
+		monitor_valid_la = valid_la;
+	}

 	/*
 	 * Check if the length is not too short or if the message is a
@@ -1227,7 +1230,7 @@ void cec_received_msg_ts(struct cec_adapter *adap,
 	mutex_unlock(&adap->lock);

 	/* Pass the message on to any monitoring filehandles */
-	cec_queue_msg_monitor(adap, msg, valid_la);
+	cec_queue_msg_monitor(adap, msg, monitor_valid_la);

 	/* We're done if it is not for us or a poll message */
 	if (!valid_la || msg->len <= 1)
