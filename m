Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E022D11035D
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 18:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfLCRXY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 12:23:24 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:33985 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726422AbfLCRXX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Dec 2019 12:23:23 -0500
Received: from [IPv6:2001:420:44c1:2577:39bf:ca7e:6fc8:fad2]
 ([IPv6:2001:420:44c1:2577:39bf:ca7e:6fc8:fad2])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cBtOi81fLjpCOcBtRiW1vC; Tue, 03 Dec 2019 18:23:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1575393802; bh=nBhHNww5w3r6P7laB68iEm3ISZrEZ9SPBQdNQMVWadA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Fmw7FlnMtgukHkOSIo3NrR7EFeu1lPLiG3MfEDltbSzm5bNI4ZrGnOWKVxsIiB+q8
         xLAxXmIR2QcNTnUPBnnFhWM5eyst40EssF1NsNYlcZqem4QVtlobnQd10R6CA6avL1
         hxkzeMJ5zKYvPS9mnWdWqMFflOjYASCwKEBhcAqC1Ger02m+wT8D3sBOldeiqps4EW
         Fv74o7hPUZpVBJIYmc4P9QW7QOsWhF0BZ0jgY83izD1Fwl6RXqnIpr1kJyCZ5SkM3C
         06Xjeb7VnwtBWU/yVywxxIF+EkSlzE+VxQiUnOOWFCI5z69TBGYYP4aiqmsDXXf2qo
         EV2Sg0e8X4NTw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.5] cec: CEC 2.0-only bcast messages were ignored
Message-ID: <d5300db4-82c3-4ea1-7421-75062cf16a0f@xs4all.nl>
Date:   Tue, 3 Dec 2019 18:23:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDcSzWsaNBJFMJ+3Bo4JdHbqzFO6Ti1XpiyRBTMd4HRMmc/iUXcdfS9R0p5aXy6j5nqIvglHxm4X1q+/qmB2lNDkW3V6+HX+e+YR6sjtDR1nWgS/mtfi
 5pAwAmf3GYhASP5HiOCSIjE/T1WsPngFku06gKeqYbxRl5VjkDQk6NcDxMEp0bhPmE1+iju7I+uHYKB4aFjjXMFUImId8YRadgnBe/7CvItUkMXLMSve3sy2
 zKzAil6nEqxXERVpmtatYd8NuGtbEbZ7VtVkQCd1QiWMauHSViVOQErc+fZRcpyV
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some messages are allowed to be a broadcast message in CEC 2.0
only, and should be ignored by CEC 1.4 devices.

Unfortunately, the check was wrong, causing such messages to be
marked as invalid under CEC 2.0.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: <stable@vger.kernel.org>      # for v4.10 and up
---
diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index 9340435a94a0..ce64d0bbcc00 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -1085,7 +1085,7 @@ void cec_received_msg_ts(struct cec_adapter *adap,
 			valid_la = false;
 		else if (!cec_msg_is_broadcast(msg) && !(dir_fl & DIRECTED))
 			valid_la = false;
-		else if (cec_msg_is_broadcast(msg) && !(dir_fl & BCAST1_4))
+		else if (cec_msg_is_broadcast(msg) && !(dir_fl & BCAST))
 			valid_la = false;
 		else if (cec_msg_is_broadcast(msg) &&
 			 adap->log_addrs.cec_version >= CEC_OP_CEC_VERSION_2_0 &&
