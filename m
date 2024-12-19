Return-Path: <linux-media+bounces-23804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 377219F7E24
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 16:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81569163CCA
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 15:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FC222618D;
	Thu, 19 Dec 2024 15:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dW1fJ36M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7362AD16
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 15:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734622416; cv=none; b=hRkYR3PvEAtPdC+Q+UhMxPxAw1fydjNIZI0izn5g6Kjvy3y0v7rwWYb93LbUDsvzA2T1wYJD8n3EVRCOQ4GlEtHbmql/qm7xNnI1VmMrCAHjNWd85xRX7qDM9MT2iDmisDE2zvCZS08Lsrx6T3NyCAaVeRlkM+TrpGG7kj7GJg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734622416; c=relaxed/simple;
	bh=uSoQyZB+FxYJXRIayQyk6YBc9ZHI9pWa76ndqSnd0/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PM1gpX0LOoh/tMfYtAWvqSvf4lJqTYHVl2gNKi4W077vuo0HTIeywCBQwfcx0f7LbwFasqmcKimGTFJzAaPW38AK1iPHx7+1hieyjnpUDKnUiUiYYaYo7EyGYD5CCv8rO+mroKTmMT3Im9jOOTY60wesDlIOO+t/CdI27On+GnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dW1fJ36M; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4b11a11a4f0so269456137.3
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 07:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734622413; x=1735227213; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LdwsOh/VCpcsHOjtv+CgMH/msSObJaAhWNaF4jztlpo=;
        b=dW1fJ36MCD7udeZ7d/6jK9AlkymeGXpm6FvVnnHcboeVtW2zsV4byGyoYhvplRrm7F
         2l3YH/8jtrbLGvpIt2M9LXOYhiK2YDXor5lG28tC0FREA2zv4U+nDyI6kaYyB0+caoJh
         nPy8b6V6GrEtTJ8IX773Pm0ZMyVmR+xo0KOg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734622413; x=1735227213;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdwsOh/VCpcsHOjtv+CgMH/msSObJaAhWNaF4jztlpo=;
        b=uZvCwDM7BWiM2nFMraCpbpL3RbzOPsMGI0hmazk5+wVA3XPBR7BVzPEw5f9VFOHm6E
         NGe8BskP9xyl4ATIiJnjhAYkdBONc1Q7nS8ArIJTzmWeNC8GGEcwi9GhFceUMspKzLpJ
         vTwVseGYjTQcncOXBsD5Ov61sFXEuyjHu3t7xpX6vXXJ8D3ZHBo0CbQ1k0hKgHWQJKbo
         cnI2W42MMBkVlJvKBHWtjGOfiEiAqWiBYcRr6Dh8nnRKPnQUpFQJXQMqtaT9KOtZruCX
         bfvEGso3JAyAZxwFS1S3HgsNBtdEUA7m/qIij/TVApu8ZbbDoMULCReY0fZXejq8a38i
         n9nA==
X-Gm-Message-State: AOJu0YzlXteviZlzHrYYX7lXzT2zfxsXFTfKf/hSS0Ub9N55BcHJNA50
	c0yThcwLhLt4yCW6N1qS1fTqEBWgZC0OmOP1x+SMW+Zat5BtlJyUg5DVZLLcog==
X-Gm-Gg: ASbGncsYEoqo0W48W+5QS39269oXcoGhu45dH4E9mI4wfvI8uUmWdramdsunXYN3f7M
	zDnV14paSFOgBK6XvvLnhHANsf2t6560WB8qK104IOnLwjVMOaqel3GDEYusI7pIauHH/Sfzx7q
	UFarsKaob9muAHtnRtDH8DOTtvaWzdhcoMRcS+elKv28QBNWXvIVUuR5RfbPhMtDipZO8G+QICw
	ycVzbKiwsdrKbspThZkI/pSShvXEv3Lyf+8GczSyiPkwLg6t5mJ4Gud7tnxKjFr4x5f1NClnPIf
	avvw0rEzcknvbL7/9sjzXpbg85U8X0A=
X-Google-Smtp-Source: AGHT+IHw2gDgGqg2Xo4Suy6p0e0Zk8YEKfLLZgQZotrzn/1+142XiPYK/a4pCzkDs55KPJR59fo/sg==
X-Received: by 2002:a05:6102:3711:b0:4af:f3bd:51cd with SMTP id ada2fe7eead31-4b2bbe15595mr4282118137.16.1734622413189;
        Thu, 19 Dec 2024 07:33:33 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfad38ecsm230202137.29.2024.12.19.07.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 07:33:32 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Dec 2024 15:33:29 +0000
Subject: [PATCH v2] media: uvcvideo: Filter hw errors while enumerating
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMk8ZGcC/23MOw7CMBBF0a1EU2PkX4xExT5QCjNM4ikSIzuxQ
 JH3jklNeZ/0zg6ZElOGa7dDosKZ49JCnzrA4JeJBD9bg5baKq2M2AoK8oiUs7j0PaJ0yhsnoT1
 eiUZ+H9p9aB04rzF9Dryo3/rfKUoo4TTJhx0RnbE3DCnOvM3nmCYYaq1fRhqSbqkAAAA=
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
different than -EINVAL and introduces a warning in dmesg so we can
have a trace of what has happened.

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
Changes in v2:
- Never return error, even if we are not enumerating the controls
- Improve commit message.
- Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
---
 drivers/media/usb/uvc/uvc_ctrl.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4e58476d305e..43ddc5bb02db 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1307,17 +1307,24 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
+		}
 	}
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {

---
base-commit: 40ed9e9b2808beeb835bd0ed971fb364c285d39c
change-id: 20241213-uvc-eaccess-755cc061a360

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


