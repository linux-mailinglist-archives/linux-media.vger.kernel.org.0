Return-Path: <linux-media+bounces-26783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE109A4195C
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6C433A6AAF
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDB7245007;
	Mon, 24 Feb 2025 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UEmmI4ll"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BAE23CEF8
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390013; cv=none; b=ii0uDVyxBouSR7QetZj6vJI+Aun0PbBfffHRIwGPjbevheresbja43lu2OfjOCEd9GGFr4UFgeZihBExvRsu408Ae4gRBQniY+DDnc5kA5VgwNNOewoqgof/doMU52vJUUkAbmpnq6sEqJX02j5xom5EeLXPp8Yp9MB7r8YtbQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390013; c=relaxed/simple;
	bh=sA8WO++5rNZBtjx501c9cpcdkpsxzwHOMX4IWV9Rsr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FVcJ0vCHjcYwUHDbFa0VXWtAY4op4ZOfSkHcueDVyKXFj3h7TVEIiczQS0JkPOLya+me9NSCEKYLN9Y1vCJu3RgHOaj27gAMOelJQJXaPo/HEa7xCQ0iBOZDoAYi0HTXiOc8VZSsrnnBJNg7R74mow8WeJRSkEuOVCUirx16/Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UEmmI4ll; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e67bc04a3bso47166816d6.3
        for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 01:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740390010; x=1740994810; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOH4g4FLbQyk00Mre2FH+qMcOUGd/gLcBgjYmHBMbaU=;
        b=UEmmI4llct9ULjjtoRcyDhVdz3iK5BiVMvlexADX86aFnHGnToxxIvHD1rGSOJKWJ7
         rOhCsmNhH9OQPTs8nYeq8gHYyX7oBM+ZA4gPi5CnifwddBEGwii5WtMG1IGzvcHoQKuy
         1iBVGjKz2iKth+qJEStpotXTUV+p9MCqMk+38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740390010; x=1740994810;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOH4g4FLbQyk00Mre2FH+qMcOUGd/gLcBgjYmHBMbaU=;
        b=A2C0JvO3WaFJ7dR5c6850qx2vXytue3u2KNYRqMFaw6HIsoAR5sntPq1TNPyI5MoEC
         popU7CleW6JIs3utc9cUmG3xd8gOdHyj9ONWcUJpwQbxJej6DbOFVMsMKQhHBqF+9gCg
         tnJTXrEnIEKPYMkvKql4+m5MWmmBPAOlR2l7nICPIOqgdAqw+krKG1VQgo/QJ7Fy1HFf
         nVQ68phNwgjwT/0uxVPmJ+2c/cEBr1a0CtrRmY91S6vgxqCKTYvTJIfMTrBeJ4DMeFUL
         ak6YCNsIEm5slkiZkNAC9U4DS5zkpYCfF+HzYjFblp9NzsVcGihnPUYaMlw2zdKeyCLU
         CRYQ==
X-Gm-Message-State: AOJu0YxPDdJn3KtfbD7sSUSsQDfUQJmglYIpoxN3VL+FKhRABCM3oJTE
	dXU1UQnmZXe+lPlYlMp/PNabDI2we3qzPbGQjRT9rsTiDHZ+JWrv1tK26Odbwg==
X-Gm-Gg: ASbGncvyVp/Cq4vzTigS9YfV7gTNraYoh7t39Kc5JTCmqYgmp4MW82ljS5RK1/lpYGF
	VYoXbh4jieoNTfLv40fPaBzNtNcE8BVbLP3U5epW8+ea1V4SN0B6JrYtbgZ3Yjf6vWE/ow/SOX/
	wbmrOVyvDLsBR2VMe6hfPNKuFxxyWiECYkuKD19ZNB1AoqiNy4cBVQKzZp25sArY1zxU8wCfaaP
	TDBZZC+65MJqDk5uJNBDRH46xMEYv+inK4XjwZOB3R7/jOATP45+Z+Xgn0BLvtchBavzeHu0eVk
	4boRlvVLMkH0Eq3G/pHaEvZJNoElqEdFecV5/nNoAtPlY6KVKnVxFmla6rGi8AEHfca3LUd64pI
	KXmo=
X-Google-Smtp-Source: AGHT+IF1JnvNYB15RUgRsLAqAnfBQ/3pKcNCeKY+GATLateLaGQ+wG+j6ppWfzqAdhQJOSiBAgkCYg==
X-Received: by 2002:a05:6214:48f:b0:6e4:6ff6:bac2 with SMTP id 6a1803df08f44-6e6ae9a6af6mr162780496d6.40.1740390010484;
        Mon, 24 Feb 2025 01:40:10 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e6acb6d6b4sm46641146d6.121.2025.02.24.01.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 01:40:09 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 24 Feb 2025 09:40:06 +0000
Subject: [PATCH v5] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-uvc-eaccess-v5-1-690d73bcef28@chromium.org>
X-B4-Tracking: v=1; b=H4sIAHY+vGcC/23OQQ7CIBCF4asY1mIYBqh15T2MizKAZaE1YInG9
 O6iiYk1Xb5Jvj/zZNmn6DPbrZ4s+RJzHC516PWKUd9dTp5HVzeTQiqQgHwsxH1H5HPmjdZEwkC
 HRrAqrsmHeP/UDse6+5hvQ3p84gXe1+VOAQ7cSC+sCkQG1Z76NJzjeN4M6cTeqSJ/eTvnsnIbj
 JaCtnZr3ALHL9cCRDPnWHnbBkTUTgPiAlc/HGDOVeXUNLq1wYF1/89P0/QCXxP1dmYBAAA=
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.1

To implement VIDIOC_QUERYCTRL, we need to know the minimum, maximum,
step and flags of the control. For some of the controls, this involves
querying the actual hardware.

Some non-compliant cameras produce errors when we query them. These
error can be triggered every time, sometimes, or when other controls do
not have the "right value". Right now, we populate that error to userspace.
When an error happens, the v4l2 framework does not copy the v4l2_queryctrl
struct to userspace. Also, userspace apps are not ready to handle any
other error than -EINVAL.

One of the main usecases of VIDIOC_QUERYCTRL is enumerating the controls
of a device. This is done using the V4L2_CTRL_FLAG_NEXT_CTRL flag. In
that usecase, a non-compliant control will make it almost impossible to
enumerate all controls of the device.

A control with an invalid max/min/step/flags is better than non being
able to enumerate the rest of the controls.

This patch:
- Retries for an extra attempt to read the control, to avoid spurious
  errors. More attempts do not seem to produce better results in the
  tested hardware.
- Makes VIDIOC_QUERYCTRL return 0 in all the error cases different than
  -EINVAL.
- Introduces a warning in dmesg so we can have a trace of what has happened
  and sets the V4L2_CTRL_FLAG_DISABLED.

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
Changes in v5:
- Explain the retry in the commit message (Thanks Laurent).
- Link to v4: https://lore.kernel.org/r/20250111-uvc-eaccess-v4-1-c7759bfd1bd4@chromium.org

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
base-commit: c2b96a6818159fba8a3bcc38262da9e77f9b3ec7
change-id: 20241213-uvc-eaccess-755cc061a360

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


