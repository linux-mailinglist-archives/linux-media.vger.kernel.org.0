Return-Path: <linux-media+bounces-24644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93634A0A28D
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 10:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C4E6188A864
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 09:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABED018FC65;
	Sat, 11 Jan 2025 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bdc85i8u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04F418BBAE
	for <linux-media@vger.kernel.org>; Sat, 11 Jan 2025 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589448; cv=none; b=UB8AlwaV0qze2ULZyUMr2qdHG2FMTgUw+GdF3mbHw9SsNHOOLfUNZrb/ww1hx6af85bg0meb0kUO+U0Hy6xP9kEiq4ennS9z1TIvkdoRLGAZqWlIjRFJkELyVxvpILGySwOOc18Tk1HATlIrfxmubFRYAG9eNheHXFbCYEgqIKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589448; c=relaxed/simple;
	bh=cStbx8ZaYmZolD6tO7APtbFhAJbDHwZPJmei9SGsuww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cHrR82QhhkxKZlNXAATGsF0bRDh8ni5Pi8k/9lMMUoKMTELiVpOvJ2208Z/zs5xPuQ5WuFma5Lp+WbcKkrTQFBoS35zzSLSqYVEz/AUn3tHQcovX6CPC+qyHDsaVx3s/Z3ae23FUyXb+B4cYubUKqTMVCeeGO4J+MqffwYInNBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bdc85i8u; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d900c27af7so24639466d6.2
        for <linux-media@vger.kernel.org>; Sat, 11 Jan 2025 01:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736589445; x=1737194245; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wWYpqWkxf1bRzCbDdGJ7RzDCS9SsdFbJCnGtm7QXimU=;
        b=bdc85i8uGyRkUN+JTpxZFSx0pHxLuuZW0Heh5F0H6cxjkDeYRR10qlpKGEFiQeQsfh
         TdJQYo5ql6DP7ofLe08jva0+bpycHQvXWTvZUS++ErP34VFZ1HDlxyK6ct5Hl35seQfD
         1gz7FiSrHQcI4RvJcX5b/fooVd9gYEKNyq9hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736589445; x=1737194245;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWYpqWkxf1bRzCbDdGJ7RzDCS9SsdFbJCnGtm7QXimU=;
        b=QzNnpnY+GrvM6SJiZMpKcaIgoeT/tqAaadmHa0sjlpB0u65EkNPHsrXEwILDEwXiIX
         GGyS+jTMM24dHYQPYwARACwUNAy9G8l/HYKQuWdbvgldX4s4tXabo+05HdanJpL6ehTv
         cFgHBCngiUt2gKI5bIzdcDS7uT3+N0I0f1gHdrV1LGczda/3qtRgXXLUHwyCvZJKJ5T1
         oiYTYewKo6Ip2wsjfe2tjv4f/vu0PEHPuP/aJ2sKKnY3eyjE70Nii7Zi/+ByIQMoGGLN
         GLs/uk1UFuBvNXxvmZoCF3Ou8KE0xicsznUI+wBfLWuSFxRZIVqJsNUw0znupCkhHbon
         KRsw==
X-Gm-Message-State: AOJu0Yyhv8cMN6szidJsjVHT2lJl2G742RQCN1OKh4/cj7NKrSjX6TKX
	2F6a97/5QNagdbh+sbTEUJhoJL/M3ClVi0dKDQ7QBzNiIdu41xUUEhg91l7zzQ==
X-Gm-Gg: ASbGncsXRkxiRcwVmRMssR81FjZYwYP8VSiOYEX7dYSJeFrnHnuOBOpxgHl1WLMjM9w
	FIaJMe/jd+DbRQXJ1UPGfLlZadUcziHY4+qlj9qtCfP4xmzNXt8QpmofLfyuF5R0swXq9kz8Qv9
	PsnfVB+kj9WxY4WziQYwuPfVjuMR/6cMR4ERS4GV3TbwLQruhkWR9392kVqD5GIC+x9E+gyf5pG
	WHeCrn0D/vRm6cJyFAVriZZ1JOeTQbOaVFd5sJhL245H/uvOTF7WLGvUKqgs7D/NovjpVYeo9kl
	OkuZZwhFxxl1Rh0PXsB4O8wGDSmFx4SOTpAg
X-Google-Smtp-Source: AGHT+IHDJ1WeGcXp4fwpqZ2fDjeVKJoB6xDikWEJMZB7Bl76HGDtKHCczeNTH/47kpOeFOMWLYIQGA==
X-Received: by 2002:a05:6214:238c:b0:6d8:af2d:2a44 with SMTP id 6a1803df08f44-6df9b2cefc3mr224765816d6.32.1736589444850;
        Sat, 11 Jan 2025 01:57:24 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade72b59sm18434356d6.87.2025.01.11.01.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 01:57:23 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 11 Jan 2025 09:57:21 +0000
Subject: [PATCH v4] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-uvc-eaccess-v4-1-c7759bfd1bd4@chromium.org>
X-B4-Tracking: v=1; b=H4sIAIFAgmcC/23MQQ6DIBRF0a0YxqUBPqB21H00HegXlIHaQCVtj
 HsvmjSpjcP3knNnEox3JpBLNhNvogtuHNKQp4xgVw2toa5JmwgmJBcc6BSRmgrRhEBzpRCZ5hV
 oRpJ4eGPda6vd7ml3LjxH/97ika/vcSdyyqkWhtXSImqQV+z82LupP4++JWsqil9e7rlIvLZaC
 YZFXejmgMOXK8ZZvueQeFlaAFCN4gB/fFmWD+ZdKKcnAQAA
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

To implement VIDIOC_QUERYCTRL, we need to know the minimum, maximum,
step and flags of the control. For some of the controls, this involves
querying the actual hardware.

Some non-compliant cameras produce errors when we query them. Right now,
we populate that error to userspace. When an error happens, the v4l2
framework does not copy the v4l2_queryctrl struct to userspace. Also,
userspace apps are not ready to handle any other error than -EINVAL.

One of the main usecases of VIDIOC_QUERYCTRL is enumerating the controls
of a device. This is done using the V4L2_CTRL_FLAG_NEXT_CTRL flag. In
that usecase, a non-compliant control will make it almost impossible to
enumerate all controls of the device.

A control with an invalid max/min/step/flags is better than non being
able to enumerate the rest of the controls.

This patch makes VIDIOC_QUERYCTRL return 0 in all the error cases
different than -EINVAL, introduces a warning in dmesg so we can
have a trace of what has happened and sets the V4L2_CTRL_FLAG_DISABLED.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Hi 2*Hans and Laurent!

I came around a device that was listing just a couple of controls when
it should be listing much more.

Some debugging latter I found that the device was returning -EIO when
all the focal controls were read.

Lots of good arguments in favor/against this patch in the v1. Please
check!

Without this patch:
$ v4l2-ctl --list-ctrls
                  auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
         exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
     exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1

With this patch:
$ v4l2-ctl --list-ctrls
                  auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
         exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
     exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
error 5 getting ext_ctrl Focus, Absolute
error 5 getting ext_ctrl Focus, Automatic Continuous
   region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
--
---
Changes in v4:
- Display control name (Thanks Hans)
- Link to v3: https://lore.kernel.org/r/20250107-uvc-eaccess-v3-1-99f3335d5133@chromium.org

Changes in v3:
- Add a retry mechanism during error.
- Set V4L2_CTRL_FLAG_DISABLED flag.
- Link to v2: https://lore.kernel.org/r/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org

Changes in v2:
- Never return error, even if we are not enumerating the controls
- Improve commit message.
- Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
---
 drivers/media/usb/uvc/uvc_ctrl.c | 43 ++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4e58476d305e..9d7812e8572d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1280,6 +1280,8 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
 	return ~0;
 }
 
+#define MAX_QUERY_RETRIES 2
+
 static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl,
 	struct uvc_control_mapping *mapping,
@@ -1305,19 +1307,44 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		__uvc_find_control(ctrl->entity, mapping->master_id,
 				   &master_map, &master_ctrl, 0);
 	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
+		unsigned int retries;
 		s32 val;
-		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
-		if (ret < 0)
-			return ret;
+		int ret;
 
-		if (val != mapping->master_manual)
-				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
+		for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
+			ret = __uvc_ctrl_get(chain, master_ctrl, master_map,
+					     &val);
+			if (ret >= 0)
+				break;
+		}
+
+		if (ret < 0) {
+			dev_warn_ratelimited(&chain->dev->udev->dev,
+					     "UVC non compliance: Error %d querying master control %x (%s)\n",
+					      ret, master_map->id,
+					      uvc_map_get_name(master_map));
+		} else if (val != mapping->master_manual) {
+			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
+		}
 	}
 
 	if (!ctrl->cached) {
-		int ret = uvc_ctrl_populate_cache(chain, ctrl);
-		if (ret < 0)
-			return ret;
+		unsigned int retries;
+		int ret;
+
+		for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
+			ret = uvc_ctrl_populate_cache(chain, ctrl);
+			if (ret >= 0)
+				break;
+		}
+
+		if (ret < 0) {
+			dev_warn_ratelimited(&chain->dev->udev->dev,
+					     "UVC non compliance: Error %d populating cache of control %x (%s)\n",
+					     ret, mapping->id,
+					     uvc_map_get_name(mapping));
+			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
+		}
 	}
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {

---
base-commit: c5aa327e10b194884a9c9001a751f6e4703bc3e3
change-id: 20241213-uvc-eaccess-755cc061a360

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


