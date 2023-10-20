Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5907D08A3
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 08:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376317AbjJTGlx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Oct 2023 02:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235621AbjJTGlv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Oct 2023 02:41:51 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B9EB8
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 23:41:49 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-41cb76f3cf0so2693571cf.2
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 23:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697784109; x=1698388909; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LOOBS4fShFQvZXeGJZoPo7g48H6f/x/nWjcHkmoHkOo=;
        b=K/SHXtr7W1QlI/Iq0Cq64d2oeXyVXZS05ziIq3fWa8ZMKZGOdGxMraZaqltI6zRN+6
         yhlGKLKNitps7vtGnc0S/QbUOHjxWOD0aE/LaAxQUS/yvyoaOvVSNIUOm/dWk8SUS7/f
         q038Fk8hJAwJdogy/hK4FWS4QNyadXPTjP+PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697784109; x=1698388909;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOOBS4fShFQvZXeGJZoPo7g48H6f/x/nWjcHkmoHkOo=;
        b=qTJSoQYcQEPD0659HAhIh7DZkEiVCqOr7IjQld6tdEl/Fqs405olTJD26i9zZOWo0v
         O/7YXC2MeQAsWPQCOqbUl62sDtS+CVMU9DwDZw9Mo9jL4SG+fglQEChrICn6RGIHD3e9
         5Je3TXwfYmOA5ndmJiwoxK4uN6OGxhFKCpwriTkkSBdLUOfrZAVMD7GjaJuxptUBzwic
         N2GpZaNBMhlyVg+u7k6sLq/CEArBVbs1p4OT0Dj4NM86WXdlvruRSl5/KXR4Rl5I5ky6
         MkiU3FhQs+ZLTpmXPSxKmG1jpVHFDaZgd0HOY9q57kqx7CQMaij8znpeEpGWc5j7I2Bi
         hzQw==
X-Gm-Message-State: AOJu0Yx8DrYLkq7gTBSLx9PbO8Q7iA0ynT+bOG/kLAJvguKq4yK/Am2u
        cujdPdjDAyVxhLOt2qYYccSJgAQ1t0Segn2To34z2Qdx
X-Google-Smtp-Source: AGHT+IGcVlxAQI6tGFdXgku7SLpcj2Eataepy0HPFriqR4PX3pEwOLmVIzPGRcE22xZEdc650EnzjQ==
X-Received: by 2002:a05:622a:6:b0:418:2b:acb2 with SMTP id x6-20020a05622a000600b00418002bacb2mr938870qtw.30.1697784109079;
        Thu, 19 Oct 2023 23:41:49 -0700 (PDT)
Received: from denia.c.googlers.com (112.49.199.35.bc.googleusercontent.com. [35.199.49.112])
        by smtp.gmail.com with ESMTPSA id g3-20020ac842c3000000b0041977932fc6sm385334qtm.18.2023.10.19.23.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 23:41:48 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 20 Oct 2023 06:41:45 +0000
Subject: [PATCH] media: uvcvideo: Implement V4L2_EVENT_FRAME_SYNC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231020-uvc-event-v1-1-3baa0e9f6952@chromium.org>
X-B4-Tracking: v=1; b=H4sIACghMmUC/x2NQQrDMAwEvxJ0rsB2bvlKyMGy5UZglGI3phDy9
 4geZ5llLujchDss0wWNh3Q51MC/Jkh71DejZGMILszeBYfnSMiD9Yt5zp6IcqJQwHyKnZFa1LT
 bQ89abfw0LvL7B9btvh+GRYyrcAAAAA==
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Esker Wong <esker@chromium.org>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the frame_sync event, so user-space can become aware
earlier of new frames.

Suggested-by: Esker Wong <esker@chromium.org>
Tested-by: Esker Wong <esker@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
We have measured a latency of around 30msecs between frame sync
and dqbuf.
---
 drivers/media/usb/uvc/uvc_v4l2.c  | 2 ++
 drivers/media/usb/uvc/uvc_video.c | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index f4988f03640a..9f3fb5fd2375 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1352,6 +1352,8 @@ static int uvc_ioctl_subscribe_event(struct v4l2_fh *fh,
 	switch (sub->type) {
 	case V4L2_EVENT_CTRL:
 		return v4l2_event_subscribe(fh, sub, 0, &uvc_ctrl_sub_ev_ops);
+	case V4L2_EVENT_FRAME_SYNC:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 28dde08ec6c5..1d4b4807b005 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1073,9 +1073,15 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 	 * that discontinuous sequence numbers always indicate lost frames.
 	 */
 	if (stream->last_fid != fid) {
-		stream->sequence++;
+		struct v4l2_event event = {
+			.type = V4L2_EVENT_FRAME_SYNC,
+			.u.frame_sync.frame_sequence =  ++stream->sequence,
+		};
+
 		if (stream->sequence)
 			uvc_video_stats_update(stream);
+
+		v4l2_event_queue(&stream->vdev, &event);
 	}
 
 	uvc_video_clock_decode(stream, buf, data, len);

---
base-commit: ce55c22ec8b223a90ff3e084d842f73cfba35588
change-id: 20231020-uvc-event-d3d1bbbdcb2f

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

