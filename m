Return-Path: <linux-media+bounces-31551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB362AA6C01
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 09:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D711BC1594
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 07:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411512690ED;
	Fri,  2 May 2025 07:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZC+w1n+C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82196268FDB
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 07:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746172113; cv=none; b=i4Vf/CDyk4IxxEsiFwlW7k8BA977lkQC5FKcQTvPU8hydjOjvMkQlLTXMFZ8h6dQ6V1kW9f/zoVc7yr9W/wi2K5DLSJ1DxlHcp/fecQH/QhrxumUMTFPm3Bm8I2QaZMEIUN0df7Ix0FMqIITb6EJc0SKC8q4QkU+MvNhGENCRl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746172113; c=relaxed/simple;
	bh=c3u4M4ETGKw01PkEWUpLoKzrvoxTrkPLy2/Mmwojboc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pntRoDePE1X1aUUESsx6EuO8jkMpx2ChBQXrVOqP2cvLL6PHuZ3Rkwrxm0cY7ZMOf4BAtbFJLxZPRkaFyxz2EnnP72hhaL1IAmtA7d7X+SDkEYmZExBtqXrTZLlOkEWv3fW3qJR7oIIeZzDEy/zEBzgV9iA4d1cA9PV76SxoAUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZC+w1n+C; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54e8e5d2cf0so1994619e87.2
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 00:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746172109; x=1746776909; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u7+zbKPg7iB89F2qV33LLm9P3xFxQlDl2XkoTBiynDA=;
        b=ZC+w1n+C7N9sd/2nMoGa9++fnOtUnxK0c4F9+GJAsjUlRGg4lUtVRZMCKdRdsIA9C1
         J8nZI0ux5FoMt82Fm1OawWkL56WyNI+mPat5qrkEuFkAM2tSunIG2veyPVbZkm6C7HS3
         8MQCEeuG0QaZpvb7eiMub3lKJwLP9kHbV61I4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746172109; x=1746776909;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7+zbKPg7iB89F2qV33LLm9P3xFxQlDl2XkoTBiynDA=;
        b=Qfkd0mn2sUHpRRDydRrPmzrD8dFiqdjB9C6d17dhBjR3a/Lu6FZ46tIGdD0zWSOLvG
         xnD+3qKjNO1qHQZNECnPqEVlQKNv1iTMo0Akcu4MWs6qF+K6paJrsdzP+WHh7VT3Hh53
         FZxwXp9mOHICl851S+c5CvZ1TBwCmMGJL/d7ipx0CE6SCPCmPW8jeDTUejog2fDg0dIJ
         /P2plpVYk54GJboLXs3+X4f15yLGDouAKUrlfW0BfLYVoWUW3jrbYT05jFL7PgKcXr3V
         16emp5SdiEsU+y7aJLxjZ2YXm/BKTtJFmg4xe1EsjlrmYOOqKOHxr9B7oQ7aFdM4TkQW
         W2BA==
X-Gm-Message-State: AOJu0YzLke2tD4++dVtQPIbC3g04r+fW/KVgcn9H1xPrxTvKTRuWOjsa
	/ElBejJBfYRA2aOQZjYZR21mIdokJzQywekbvXiwk6pakInu1HcOqP2cTIwSJBi7D8kU3nN1bL8
	=
X-Gm-Gg: ASbGncsta00FwJ+wOa8qZspjlVVzyunsRE1Kac7D2VGCNm/iEFEmIFk8rN/fAIqlkb7
	EGUQAqX3cn6wsS3nzhsrodAwyQIL21BZejgqsKzZyyU64cEEXZAOjAilym0toKH5lWVThfsF7s3
	ZmkxwwUQnSig38fJzZD1WUMWFOaVs3rbojY/w3LEPr8i9r/1A42o+MGKyMiFYLcQ9YXG0D3Yam/
	pu403WupRl95q3JP8Jek46y+Gk87NbvomwTDnV9sMi9SM4CreRiqLDo7WoYEimnlQK5QpWejhvp
	bis8ZLRlq+hPwPbvtWaPRgjx7RX9NrisvU+Wg+M5jy5GyCgVYaTAb7eeqyWvHlKaDI8l+aIbLq1
	8CwpUW0OjsBjeX8Ajsnf0
X-Google-Smtp-Source: AGHT+IF1Yn65Mub7loOvq7kGChofkol27OAbpsdRV7rKwMfiJYP0fcihDARf+loj/t9rGT+R/EVs+A==
X-Received: by 2002:a05:6512:4021:b0:549:8c86:9bf6 with SMTP id 2adb3069b0e04-54eac2387f1mr390280e87.39.1746172109253;
        Fri, 02 May 2025 00:48:29 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f17f0sm279550e87.163.2025.05.02.00.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:48:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 02 May 2025 07:48:28 +0000
Subject: [PATCH v8] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-uvc-eaccess-v8-1-0b8b58ac1142@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMt4FGgC/23OsQ6DIBSF4VdpmEsDXkXSqe/ROCBchEFpQEkb4
 7sXXRqTjv9wvpyVJIweE7lfVhIx++TDVEJeL0Q7NQ1IvSlNKlY1rGZAl6wpKq0xJSotCCF4wyU
 wUhaviNa/D+3ZlbYxjHR2EdXPAM5ORhaU097Wjahsq1VvHtqVmV/GW4jDrjqf5hA/x8Xc7vb/N
 7ktEgMwTIMRIORZ6rZt+wJadnlX7wAAAA==
X-Change-ID: 20250403-uvc-eaccess-8f3666151830
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

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
- Makes VIDIOC_QUERYCTRL return 0 for -EIO errors.
- Introduces a warning in dmesg so we can have a trace of what has happened
  and sets the V4L2_CTRL_FLAG_DISABLED.
- Makes sure we keep returning V4L2_CTRL_FLAG_DISABLED for all the next
  attempts to query that control (other operations have the same
  functionality as now).

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Hi 2*Hans and Laurent!

I came around a device that was listing just a couple of controls when
it should be listing much more.

Some debugging later I found that the device was returning -EIO when
all the focal controls were read.

Lots of good arguments in favor/against this patch in the v1. Please
check!

Without this patch:
$ v4l2-ctl --list-ctrls
User Controls

                     brightness 0x00980900 (int)    : min=0 max=255 step=1 default=128 value=128
                       contrast 0x00980901 (int)    : min=0 max=100 step=1 default=32 value=32
                     saturation 0x00980902 (int)    : min=0 max=100 step=1 default=64 value=64
                            hue 0x00980903 (int)    : min=-180 max=180 step=1 default=0 value=0
        white_balance_automatic 0x0098090c (bool)   : default=1 value=1
                          gamma 0x00980910 (int)    : min=90 max=150 step=1 default=120 value=120
           power_line_frequency 0x00980918 (menu)   : min=0 max=2 default=2 value=2 (60 Hz)
      white_balance_temperature 0x0098091a (int)    : min=2800 max=6500 step=1 default=4600 value=4600 flags=inactive

With this patch:
$ v4l2-ctl --list-ctrls

User Controls

                     brightness 0x00980900 (int)    : min=0 max=255 step=1 default=128 value=128
                       contrast 0x00980901 (int)    : min=0 max=100 step=1 default=32 value=32
                     saturation 0x00980902 (int)    : min=0 max=100 step=1 default=64 value=64
                            hue 0x00980903 (int)    : min=-180 max=180 step=1 default=0 value=0
        white_balance_automatic 0x0098090c (bool)   : default=1 value=1
                          gamma 0x00980910 (int)    : min=90 max=150 step=1 default=120 value=120
           power_line_frequency 0x00980918 (menu)   : min=0 max=2 default=2 value=2 (60 Hz)
      white_balance_temperature 0x0098091a (int)    : min=2800 max=6500 step=1 default=4600 value=4600 flags=inactive
                      sharpness 0x0098091b (int)    : min=0 max=0 step=0 default=0 value=3 flags=disabled
         backlight_compensation 0x0098091c (int)    : min=0 max=2 step=1 default=1 value=1

Camera Controls

                  auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
         exposure_time_absolute 0x009a0902 (int)    : min=2 max=1250 step=1 default=156 value=156 flags=inactive
     exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=1
                        privacy 0x009a0910 (bool)   : default=0 value=0 flags=read-only
   region_of_interest_rectangle 0x009a1901 (rect)   : value=(0,0)/1924x1084 flags=has-payload

Emulating error with:
+       if (cs == UVC_PU_SHARPNESS_CONTROL && query == UVC_GET_MAX) {
+               printk(KERN_ERR "%s:%d %s\n", __FILE__, __LINE__, __func__);
+               return -EIO;
+       }
In uvc_query_ctrl()
---
Changes in v8:
- Return error when != -EIO
- Fix typo in comment
- Link to v7: https://lore.kernel.org/r/20250403-uvc-eaccess-v7-1-033d0c3d6368@chromium.org

Changes in v7:
- Only retry on -EIO (Thanks Hans).
- Add comment for retry (Thanks Hans).
- Rebase patch
- Check master_map->disabled before reading the master control.
- Link to v6: https://lore.kernel.org/r/20250310-uvc-eaccess-v6-1-bf4562f7cabd@chromium.org

Changes in v6:
- Keep returning V4L2_CTRL_FLAG_DISABLED in future control queries.
- Link to v5: https://lore.kernel.org/r/20250224-uvc-eaccess-v5-1-690d73bcef28@chromium.org

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
 drivers/media/usb/uvc/uvc_ctrl.c | 55 ++++++++++++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvcvideo.h |  2 ++
 2 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 44b6513c526421943bb9841fb53dc5f8e9f93f02..f24272d483a2d77f01e072684fc9f67899a48801 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1483,14 +1483,28 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
 	return ~0;
 }
 
+/*
+ * Maximum retry count to avoid spurious errors with controls. Increasing this
+ * value does no seem to produce better results in the tested hardware.
+ */
+#define MAX_QUERY_RETRIES 2
+
 static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 				      struct uvc_control *ctrl,
 				      struct uvc_control_mapping *mapping,
 				      struct v4l2_query_ext_ctrl *v4l2_ctrl)
 {
 	if (!ctrl->cached) {
-		int ret = uvc_ctrl_populate_cache(chain, ctrl);
-		if (ret < 0)
+		unsigned int retries;
+		int ret;
+
+		for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
+			ret = uvc_ctrl_populate_cache(chain, ctrl);
+			if (ret != -EIO)
+				break;
+		}
+
+		if (ret)
 			return ret;
 	}
 
@@ -1567,6 +1581,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 {
 	struct uvc_control_mapping *master_map = NULL;
 	struct uvc_control *master_ctrl = NULL;
+	int ret;
 
 	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
 	v4l2_ctrl->id = mapping->id;
@@ -1587,18 +1602,31 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		__uvc_find_control(ctrl->entity, mapping->master_id,
 				   &master_map, &master_ctrl, 0, 0);
 	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
+		unsigned int retries;
 		s32 val;
 		int ret;
 
 		if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
 			return -EIO;
 
-		ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
-		if (ret < 0)
-			return ret;
+		for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
+			ret = __uvc_ctrl_get(chain, master_ctrl, master_map,
+					     &val);
+			if (!ret)
+				break;
+			if (ret < 0 && ret != -EIO)
+				return ret;
+		}
 
-		if (val != mapping->master_manual)
-			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
+		if (ret == -EIO) {
+			dev_warn_ratelimited(&chain->dev->udev->dev,
+					     "UVC non compliance: Error %d querying master control %x (%s)\n",
+					     ret, master_map->id,
+					     uvc_map_get_name(master_map));
+		} else {
+			if (val != mapping->master_manual)
+				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
+		}
 	}
 
 	v4l2_ctrl->elem_size = uvc_mapping_v4l2_size(mapping);
@@ -1613,7 +1641,18 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		return 0;
 	}
 
-	return __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
+	ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
+	if (ret && !mapping->disabled) {
+		dev_warn(&chain->dev->udev->dev,
+			 "UVC non compliance: permanently disabling control %x (%s), due to error %d\n",
+			 mapping->id, uvc_map_get_name(mapping), ret);
+		mapping->disabled = true;
+	}
+
+	if (mapping->disabled)
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
+
+	return 0;
 }
 
 int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b9f8eb62ba1d82ea7788cf6c10cc838a429dbc9e..11d6e3c2ebdfbabd7bbe5722f88ff85f406d9bb6 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -134,6 +134,8 @@ struct uvc_control_mapping {
 	s32 master_manual;
 	u32 slave_ids[2];
 
+	bool disabled;
+
 	const struct uvc_control_mapping *(*filter_mapping)
 				(struct uvc_video_chain *chain,
 				struct uvc_control *ctrl);

---
base-commit: d0faa9505840c711740eca80e255fdabafbcdb1a
change-id: 20250403-uvc-eaccess-8f3666151830

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


