Return-Path: <linux-media+bounces-24346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B932FA04428
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 16:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED9151665FF
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 15:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B1E1F2C39;
	Tue,  7 Jan 2025 15:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G0PTXVkf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481E31E1041
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736263424; cv=none; b=ifKBUTEIycyUTJ/faY7DYotjtwXPR3rpImmsTDkzDA/RpCprpU2siwFI5dl7gmrG/AGgC5xABUnEsa+GB4SQfBNY9jsm226BZYr8pRQdcvgw4sn+vM7i0zcvILjWpsDpJTUH6yAa7Ev26sUUD2dV7Q48LfKGeKz144Tky6B71zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736263424; c=relaxed/simple;
	bh=Sj9hUan73Ec622PoPDJGjTAagERBAGH09/QZYg9H7SA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mE3zTZlYKEyGRiPuh67cfHBWudU/5hqRT4bkykuGcr2xi7BPy+9Fb9cBxeAV9du1KfAIXLDW/OO1BtUluljw1rIqqVAYTxC8UcePWFCy9GNfKVohdUk+oKoV9b8L+o6FCBRbgODnoAjUXIeIVwAq55vO7VvOh3yV195h+v2CkgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G0PTXVkf; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4aff31b77e8so5191860137.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 07:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736263420; x=1736868220; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=txt9C05Azavh1d6lKAx/rakp7gfsIdtNOiWVgM2m56I=;
        b=G0PTXVkfBDpW488RRnNJ4oBbt3xXaaOJ2hkVd5584uWqIWt5ypqRceXq3Lmbw72Mpm
         By1PepQOr+onMS96QzjaoZR6MStVfgOcx9qrUByETNrfvtE0AvPUa2YyogBQ5YZoTWlA
         YGLaexBTsZiMGV4eA1IHHI4Upu1FxGtbip1ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736263420; x=1736868220;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txt9C05Azavh1d6lKAx/rakp7gfsIdtNOiWVgM2m56I=;
        b=d9Cb2wVustKQI//KAuX5tq40AEd4t6orTSDcuyetcNHG+TkXMngE62z2u0/ltIASd8
         jRychDbC0N1Wt9kzJbg1j87buxIJHN5BDhZV/J92kn8+nuarN/DWB30D5z3OmTpdfxX3
         j32i6d5VLroZb+PMs7mb91CtLyHixUbZL/wMLnWhhWDo0TpWi+XyRGEwGKF/fxAaWBg0
         G3fqiIVHTuIjCXISt2Gr9/NIWlhN0G9KFsquKz3RV+BZA4+N69F2scDQ/W9unGOBy7s9
         qa/mml4UMsfFmNb9WLqxs/QIougn1azyvRQd0NuECE/ZFbTF6ykzg+8HXxXQOwB0BuN/
         IT8A==
X-Gm-Message-State: AOJu0YyeaOa7L12/daZ0zCnl45a3vGFFw0E52yxE8QUsBeojI8kgBvm7
	3BeQVjTcnbf5oL81Cc6Qwal6kYU3AAHHf7H3la90NDBrGxsTHPkWrXcYD8MB7cmNLrlBTMkxBfY
	mnw==
X-Gm-Gg: ASbGncvXzhSOZ0VEVECuU63ie9T+IM3YhIjjw0SaumF1sJGcqCt9kTU4xSFnFTNRBI1
	P0HnQEgV2ypPA8w7tmpYG9dTd7CI+u4fHoKnUJIgXf8oTD+kbcLbgqZgaay2omxkU6Nl+8CeDYw
	TjP/d4ffKfsQ8L1tE+Nnf2rPg/GHOEJfj2IVhJeCRNgWVk1zBYAhErKXUjQNeLloiQ2dzQyDn7Z
	LTcU9Dpg8pAkPIvviCP6aOYdUFZOP6TlBMcRrfzCqxLYELkWniybR7HwonbuvIgDU0U5+877kbw
	hSY99vz9R/B6AzJY1So3bzGDxD7Vw3eT8Av+
X-Google-Smtp-Source: AGHT+IGh4ONZ44qnwldtexGBq+3szPow5XWsqDzBusHDbDQ9KdOedZ3AszSwm/ZvlpUI/CKvQ4yClQ==
X-Received: by 2002:a05:6102:50a1:b0:4af:d487:45f3 with SMTP id ada2fe7eead31-4b2cc49a842mr46825080137.23.1736263420157;
        Tue, 07 Jan 2025 07:23:40 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfad517dsm7977915137.31.2025.01.07.07.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 07:23:39 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 Jan 2025 15:23:38 +0000
Subject: [PATCH v3] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-uvc-eaccess-v3-1-99f3335d5133@chromium.org>
X-B4-Tracking: v=1; b=H4sIAPlGfWcC/23Myw6CMBCF4Vchs7amF6joyvcwLmAYYBZQ0kqjI
 by7hZUal+ck379AIM8U4JIt4ClyYDemYQ4ZYF+NHQlu0gYtda60MmKOKKhCpBDEqSgQpVWVsRK
 SmDy1/Nxrt3vaPYeH8689HtX2/u9EJZSwmmSdt4jW5FfsvRt4Ho7Od7Clov7k52+uE69bW2iJZ
 V3a5oev6/oGzZRM1egAAAA=
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
Changes in v3:
- Add a retry mechanism during error.
- Set V4L2_CTRL_FLAG_DISABLED flag.
- Link to v2: https://lore.kernel.org/r/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org

Changes in v2:
- Never return error, even if we are not enumerating the controls
- Improve commit message.
- Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
---
 drivers/media/usb/uvc/uvc_ctrl.c | 41 ++++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4e58476d305e..d69b9efa74d0 100644
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
@@ -1305,19 +1307,42 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
+					     "UVC non compliance: Error %d querying master control %x\n",
+					      ret, master_map->id);
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
+					     "UVC non compliance: Error %d populating cache of control %x\n",
+					     ret, mapping->id);
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


