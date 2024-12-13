Return-Path: <linux-media+bounces-23380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 213BC9F0AC9
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 12:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FBF616A4BC
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 11:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2A01DE4C5;
	Fri, 13 Dec 2024 11:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bRgXNTjH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E411DDA39
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 11:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734088869; cv=none; b=fYoJDBP8OXYfPQr9lGRCS5gWARJByzU++PHuVynll0m/0QOcSky+4bv6mr6P+LtMgN6EMeuDCqWKj+sJKFEuNvFRUr/jAR+JNwEdX/ZzP/Cy0U/sWJdcTyh5WjD7JSyZnmVDKmKn/C7AgsIdaY4RqIpKUy8+P4TOfEtG3fdT86o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734088869; c=relaxed/simple;
	bh=r91TcR4H4Qda9i3ih8WZhOxfkv/5tKme0aANXJbKMfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eJ6zQRbk2xaAkjxbh3ui6MUqQqGq0AVMtz2lc/98lUj08JN5VYfP+H89dF4yObPdNVu8eyDknicbyyH8B8BswSB4wET7IPrSydFtFkGukwAp0U8IWIO/HypVrAGr6xNqhHu/IBRJSl1OSgGmp9WoFlT5crYa7qbL/NcdcTzZ6dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bRgXNTjH; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467a1d43821so10120871cf.1
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 03:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734088866; x=1734693666; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+/b0qpGL8geq0m5EZNK7pNyK7gxUILcFZV9hbWhObc=;
        b=bRgXNTjHTRYfiuIOt7iaUC4yhRopaLtXUwdT3mS1QBErWXC/wFatCWxsJLUHQrI5VC
         BTJeVsiJ3wjDS7UHc9I3EAC4SdvIFdGBoSK1nJz/lJpia2aKPegHsChLejc11iczQTGl
         P2fBNOk3iSkG9RL3lo/uZJN5ZvcoMFARVc5Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734088866; x=1734693666;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+/b0qpGL8geq0m5EZNK7pNyK7gxUILcFZV9hbWhObc=;
        b=tqoi5KJgeMM1EL5sa5SXcbirlvudfP6g7Pv2iYIkqn4+908xADPAutSr4nGgaZxUsq
         FGRSbUzEQnCW9QxUiBcDUFOkM5olG5aD0LCXoMwf9IuA+Uo+5fH7GdScxR64TTa1U4Iv
         +MuSrMz9GzMB+myLcZlrrMN+bav91mKsJsrFIAo27yQaYdy9mW5z8XVXSUY6XkGl0pfQ
         ac/lw4JE29fZobr/6ctqNs3n3iBwIWZ5TkqajXrgk45dqcKXBxFeZh8cIRZKnnqJyzuc
         5S4kYyS/Rp9Zx4kqsE2Hd2iJkNKXDwNhD7RVsqBaKYiYYB6tMBjONX1wbSh7F6PzELtL
         fChA==
X-Gm-Message-State: AOJu0YwzhVfe6xq0GfaFddfLLLreZSmsCTUP/m7l+ksiuWPT/KeJQiGf
	ptVRMjeHOaw8s7tLLQTF7NH/S8cNwKAhyV9e0cnD8oigb5c1WzgU7DLpfpqv94eX16RzTtyyOhY
	=
X-Gm-Gg: ASbGnctsTfsUeYXaj2NXmCRd6KuwcbkLbzYEgVHeYbV5qbMBbAu1U5plShtTGVAwFOa
	GHrTYImAIzrwwWlY4pS3pVsMf5MegwOY9q5Y/nAVhy1Wdk7qcL7HwtlHdzwjSWgSHY0TrzMdOVt
	HL179WK7rmUZt2xzSimDPysawg1kJoVPnPMfwUSWnyVNxvfS2piZ6sMHVV2BXqXnnULFlh8MJyV
	kRyKRdBHlmNn3+kIv5Qka1wyZfBUO6XhQ4VkI8Mazwm8DKn7I2DMDKPN2SmRBmh7wsv6la0oj/Y
	V1rytkx6t0rInJgG5uWM6JCf6h3pxzg=
X-Google-Smtp-Source: AGHT+IFRiMo9YbmkS9prLVR88FjtQeMzkss4HutCc+qpf/GarrMWgiwM3ArO3aDzJzimFDxHBHXoEg==
X-Received: by 2002:a05:622a:11d1:b0:456:919a:11e4 with SMTP id d75a77b69052e-467a5b408a9mr34708931cf.20.1734088866554;
        Fri, 13 Dec 2024 03:21:06 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6d801632esm458685285a.7.2024.12.13.03.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 03:21:04 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 13 Dec 2024 11:21:02 +0000
Subject: [PATCH] media: uvcvideo: Filter hw errors while enumerating
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org>
X-B4-Tracking: v=1; b=H4sIAJ0YXGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Nj3dKyZN3UxOTk1OJiXXNT0+RkAzPDRGMzAyWgjoKi1LTMCrBp0bG
 1tQDy2ooOXQAAAA==
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

To implement VIDIOC_QUERYCTRL, we need to read from the hardware all the
values that were not cached previously. If that read fails, we used to
report back the error to the user.

Unfortunately this does not play nice with userspace. When they are
enumerating the contols, the only expect an error when there are no
"next" control.

This is probably a corner case, and could be handled in userspace, but
both v4l2-ctl and yavta fail to enumerate all the controls if we return
then -EIO during VIDIOC_QUERYCTRL. I suspect that there are tons of
userspace apps handling this wrongly as well.

This patch get around this issue by ignoring the hardware errors and
always returning 0 if a control exists.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Hi 2*Hans and Laurent!

I came around a device that was listing just a couple of controls when
it should be listing much more.

Some debugging latter I found that the device was returning -EIO when
all the focal controls were read.

This could be solved in userspace.. but I suspect that a lot of people
has copied the implementation of v4l-utils or yavta.

What do you think of this workaround?

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
 drivers/media/usb/uvc/uvc_ctrl.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4fe26e82e3d1..a11048c9a105 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1283,7 +1283,8 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
 static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl,
 	struct uvc_control_mapping *mapping,
-	struct v4l2_queryctrl *v4l2_ctrl)
+	struct v4l2_queryctrl *v4l2_ctrl,
+	bool can_fail)
 {
 	struct uvc_control_mapping *master_map = NULL;
 	struct uvc_control *master_ctrl = NULL;
@@ -1307,17 +1308,28 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
 		s32 val;
 		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
-		if (ret < 0)
-			return ret;
 
-		if (val != mapping->master_manual)
-				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
+		if (ret < 0) {
+			dev_warn_ratelimited(&chain->dev->udev->dev,
+					     "UVC non compliance: Error %d querying master control %x\n",
+					      ret, master_map->id);
+			if (can_fail)
+				return ret;
+		} else if (val != mapping->master_manual) {
+			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
+		}
 	}
 
 	if (!ctrl->cached) {
 		int ret = uvc_ctrl_populate_cache(chain, ctrl);
-		if (ret < 0)
-			return ret;
+
+		if (ret < 0) {
+			dev_warn_ratelimited(&chain->dev->udev->dev,
+					     "UVC non compliance: Error %d populating cache of control %x\n",
+					     ret, mapping->id);
+			if (can_fail)
+				return ret;
+		}
 	}
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
@@ -1420,7 +1432,8 @@ int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 			goto done;
 	}
 
-	ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl);
+	ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl,
+				    !(v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL));
 done:
 	mutex_unlock(&chain->ctrl_mutex);
 	return ret;
@@ -1513,7 +1526,7 @@ static void uvc_ctrl_fill_event(struct uvc_video_chain *chain,
 {
 	struct v4l2_queryctrl v4l2_ctrl;
 
-	__uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl);
+	__uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl, true);
 
 	memset(ev, 0, sizeof(*ev));
 	ev->type = V4L2_EVENT_CTRL;

---
base-commit: a7f5b36b34824415c28875d615c49a3cf5070615
change-id: 20241213-uvc-eaccess-755cc061a360

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


