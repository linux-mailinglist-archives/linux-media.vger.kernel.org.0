Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC84DC2E71
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 09:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfJAH4n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 03:56:43 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38289 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726672AbfJAH4n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Oct 2019 03:56:43 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id FD1SizB9qKKNGFD1WiSula; Tue, 01 Oct 2019 09:56:42 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jiunn Chang <c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cec-funcs.h: add status_req checks
Message-ID: <623a9afe-7c14-e547-17af-424d6b785e21@xs4all.nl>
Date:   Tue, 1 Oct 2019 09:56:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPumYDffZenlr59ZOKLV0/yEoXJJOnxrCvY1uYl8Pj14WROarQVfL+8kQS2azaEeRDqzA3J2N2ucO8yf9cIav6Snh+RBoIHWjGFPun0p2q51HISyPtwf
 ctO4Q3xBmL5ignJAaxl4gLgRka4xC+TqKi0R8Do1IIK3RU63qUhYTmPSlShVkUDm16hZAMpNbXc5v8E3YD6ptoY1++wrJ+AdyXQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CEC_MSG_GIVE_DECK_STATUS and CEC_MSG_GIVE_TUNER_DEVICE_STATUS commands
both have a status_req argument: ON, OFF, ONCE. If ON or ONCE, then the
follower will reply with a STATUS message. Either once or whenever the status
changes (status_req == ON).

If status_req == OFF, then it will stop sending continuous status updates, but
the follower will *not* send a STATUS message in that case.

This means that if status_req == OFF, then msg->reply should be 0 as well since
no reply is expected in that case.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/uapi/linux/cec-funcs.h b/include/uapi/linux/cec-funcs.h
index 8997d5068c08..4511b85c84df 100644
--- a/include/uapi/linux/cec-funcs.h
+++ b/include/uapi/linux/cec-funcs.h
@@ -923,7 +923,8 @@ static inline void cec_msg_give_deck_status(struct cec_msg *msg,
 	msg->len = 3;
 	msg->msg[1] = CEC_MSG_GIVE_DECK_STATUS;
 	msg->msg[2] = status_req;
-	msg->reply = reply ? CEC_MSG_DECK_STATUS : 0;
+	msg->reply = (reply && status_req != CEC_OP_STATUS_REQ_OFF) ?
+				CEC_MSG_DECK_STATUS : 0;
 }

 static inline void cec_ops_give_deck_status(const struct cec_msg *msg,
@@ -1027,7 +1028,8 @@ static inline void cec_msg_give_tuner_device_status(struct cec_msg *msg,
 	msg->len = 3;
 	msg->msg[1] = CEC_MSG_GIVE_TUNER_DEVICE_STATUS;
 	msg->msg[2] = status_req;
-	msg->reply = reply ? CEC_MSG_TUNER_DEVICE_STATUS : 0;
+	msg->reply = (reply && status_req != CEC_OP_STATUS_REQ_OFF) ?
+				CEC_MSG_TUNER_DEVICE_STATUS : 0;
 }

 static inline void cec_ops_give_tuner_device_status(const struct cec_msg *msg,
