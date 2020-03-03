Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C91C8177454
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 11:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbgCCKev (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 05:34:51 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:47275 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727830AbgCCKev (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Mar 2020 05:34:51 -0500
Received: from [IPv6:2001:983:e9a7:1:d0e2:a5af:5d0f:8e60]
 ([IPv6:2001:983:e9a7:1:d0e2:a5af:5d0f:8e60])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 94syjj3aeEE3q94szjzEuH; Tue, 03 Mar 2020 11:34:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583231689; bh=SXdqJfJKVfPYSrqOW5vjvt2NB5wmJ66J6mr+MBG7I+U=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cFT31b50f4afk2yUYyDsNobhYgolX22bPRhynp6HiShY8UFZNdAA1Yl4wgf4XmMJb
         Epl6BnVZbfm/19TDRGl3rjKno131d9v1Ty7ioA0G0B3hkjkAldz6y++wP97y5Si5D8
         Zn290Kw9ltDJ6AP9t5NJ0WcIm1VTLuKZXmQLJmUbHzx2shP9QZAQRbo+XpHAC1lyRf
         3BWCqhaz0l0vse9NrAOWly9frTFg26m/E5VTa+dwhDPgH+MNXFmgjQKj2YKs7Dy3ex
         1ElXVkhX5FtktJygBfBdqlsJ63z/kmNnE35hQACV+fhkzIz6i4LotatVDfXY1ySCs3
         9JdYmOzaid+ug==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-ctrls: v4l2_ctrl_request_complete() should always set
 ref->req
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Message-ID: <7be79448-bbf8-3abf-f757-004a6187039b@xs4all.nl>
Date:   Tue, 3 Mar 2020 11:34:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI6+EYqP0gE24ajLlCyrb4efutCDt3KAXOYpKkh97tDKWq1cIKYs45y1whLgvP2KN0fUarWXSDNRqTh/drt7Z00M5lg35F+fdy0MjDTEftDHx2+nRIzV
 TwfbUSaaiJiI/TK3OAvZABTlqniyORqzHmP9mC4CPCphkaAWz/qOpKa8bln8SINJwkCdFMB0uD7LqmxaWEYTMYLh67C7nRHZsiKHldxSmvzxWanq77pyOu7n
 8ZnJv+MZd2GYGdL+ROci+vV4qgVvHTn35Us8J4ivrEuQZqWvhHcl5a71NAHpwoK09P5ztAdScSS5/mSn0G6Hyw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the request is completed, all controls are copied to the request object.
However, when VIDIOC_G_EXT_CTRLS attempts to read control values from the
request it will read the current value instead for any control reference that
has a NULL ref->req pointer. But that's wrong: after completing the request
*all* controls should have a non-NULL ref->req pointer since they are after
all copied to the request.

So set ref->req if it wasn't set already.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 2928c5e0a73d..93d33d1db4e8 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -4296,10 +4296,17 @@ void v4l2_ctrl_request_complete(struct media_request *req,
 			continue;

 		v4l2_ctrl_lock(ctrl);
-		if (ref->req)
+		if (ref->req) {
 			ptr_to_ptr(ctrl, ref->req->p_req, ref->p_req);
-		else
+		} else {
 			ptr_to_ptr(ctrl, ctrl->p_cur, ref->p_req);
+			/*
+			 * Set ref->req to ensure that when userspace wants to
+			 * obtain the controls of this request it will take
+			 * this value and not the current value of the control.
+			 */
+			ref->req = ref;
+		}
 		v4l2_ctrl_unlock(ctrl);
 	}

