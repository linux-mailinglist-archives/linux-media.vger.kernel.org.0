Return-Path: <linux-media+bounces-7245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B15F87F6B2
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 06:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6DA0B21908
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 05:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674354438A;
	Tue, 19 Mar 2024 05:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FN2TAIY0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEBF40871
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 05:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710826206; cv=none; b=iH3dal9pqx1TTbnaNrqABs2QqOP63DS5HBmNghEborbopoQcdVzE7YKCMsIfO033Vbh8d+8RL39XOYc/p9k5K7w8zm4XXFUmuaU9A8rsQjTFWHTTPMFLkG03J/uvq/Fzc4kWm6gz1Pe84PYALb8lBfw2m1Wq6SCJNuD4QqGXR2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710826206; c=relaxed/simple;
	bh=BYLlf0xeYatuElFa5AjzMUjucwOlopnQ83PgeHTlO/A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UsmKSn/BpIpAvFlomm4LWrMBzhPhnlYz3826j6afRB4p0Fv45S6fr+cqMP2toACNC9heFdmEIia6W/vbk4HlVpUeKHgvnjR9GQIb4cifcvofKOEDTkTQYaARrtlCwamm9spBJs+OViSu/aiuU0WSHUSRZ9mhr+O7WwW3vFkmH+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FN2TAIY0; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso4256788a12.3
        for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 22:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710826205; x=1711431005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ux82N6KJgIPBgmb1fY/vaKozwBmiuJk7Va+mZlHANC4=;
        b=FN2TAIY02ZKEOz1vMaV3b1NV+zkrv2aIWMHNnM00gGZ2en971j1UrRgcWw/uOmUYU6
         NrU/8wM9szeADef/HbilD421yodwgJ2JbDS27a77Xfiea/YR5bsnKosltgrWc5j3veic
         8OEvSr2bciEZ7VwF0Fwojb8cDITJoE/XYxeAqrq7gVPwyCrWGZG5D2I+1X0hXXyWWttT
         DG8i27bNE5AQR/XbnSIWRCxwFzIBcvQuPzg35MziLUovBd61cMXRWYezKamxYhOg4TcS
         1qOPl7CCtRaX13PAJTVFbX53kiO7nFnejpSkfyximhRFNws2ZNSDJYM7MBH1CcVoWU1w
         NKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710826205; x=1711431005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ux82N6KJgIPBgmb1fY/vaKozwBmiuJk7Va+mZlHANC4=;
        b=oMFIdCNFuYBYDRhPKuGCq9L3zgBq0kiOifNZl5EdmDHqs/oSa1k13HAorLPstefXYy
         Hx+TaVlSibwsRIujImj9BzeLv3bMKHxS2lXv8pBsP2AD1x5wV3Kt3QQ+BWcLgz6APdZ6
         i/Hpm6a+rW9FckCz4pgVnF3owPWDvsTjtyixPMQAMCDNywsYWFLyfQeJrbKt9d/o4LEB
         T4BozeBCd0YCNHLwKlSDtMphPsaHDp7h0joMdVT2BU5J+O/eINHyhjUwbxUc0m53+GUo
         r2MxujTCWLfEhWGH+Esn+tY0DLlzyI9V7vrCzng3wsse5V48V3/7MhTXvN8BHfj1bR6K
         bY4g==
X-Forwarded-Encrypted: i=1; AJvYcCVgXSuPLD0k4lyW0q3IKqck7xxlhx3XXxLFWevjv/uM29JBjxxATp0Th9oI/mMMgIWXrKILh0H5PeFvQohpGXvLqrEWkUl4wR4sa+U=
X-Gm-Message-State: AOJu0YzTbbwivcEuDM1lq5kM3WLJp+gF2zyortqOPIJPCIeRhztigmBY
	ydd+jrVvYESWVvvsOXafa2joFyys4PKYtacUF1NgOb+phKrkxBu2
X-Google-Smtp-Source: AGHT+IGiiQUHphWiHEmB7izxImD/3FNOxrHbPMisEqE2+sLFWUXIjkWxeLvGllGVax2uEiO5rZzt8Q==
X-Received: by 2002:a05:6a21:a586:b0:1a3:6a4c:80a9 with SMTP id gd6-20020a056a21a58600b001a36a4c80a9mr4173737pzc.1.1710826204482;
        Mon, 18 Mar 2024 22:30:04 -0700 (PDT)
Received: from localhost.localdomain (60-242-113-118.tpgi.com.au. [60.242.113.118])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902ea0800b001def99dc4d2sm7213110plg.96.2024.03.18.22.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 22:30:03 -0700 (PDT)
From: Linh Vu <linh.tp.vu@gmail.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Linh Vu <linh.tp.vu@gmail.com>
Subject: [PATCH] media: uvcvideo: fix incorrect minimum value mapping for relative ptz controls
Date: Tue, 19 Mar 2024 15:42:00 +1100
Message-Id: <20240319044200.32488-1-linh.tp.vu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When mapping from UVC_CT_PANTILT_RELATIVE_CONTROL
to V4L2_CID_PAN_SPEED and V4L2_CID_TILT_SPEED,
and from UVC_CT_ZOOM_RELATIVE_CONTROL to V4L2_CID_ZOOM_CONTINUOUS,
the minimum value of the movement should be negated of the maximum value.

For example, if a UVC device (e.g., OBSBOT Tiny 2) declares a pan speed
range [1, 160], its V4L2_CID_PAN_SPEED mapping has range [-160, 160].

Currently, calling ioctl with VIDIOC_QUERY_EXT_CTRL and V4L2_CID_PAN_SPEED
returns a minimum value of -1. When calling ioctl with VIDIOC_S_CTRL,
V4L2_CID_PAN_SPEED and -100, the speed (velocity) of the pan movement gets
clamped to -1.

To get the minimum value of V4L2_CID_PAN_SPEED,
uvc_ctrl_get_rel_speed is called with
uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN) as data, 
which should be uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX).

The same thing should be done for V4L2_CID_TILT_SPEED and
V4L2_CID_ZOOM_CONTINUOUS.

For V4L2_CID_ZOOM_CONTINUOUS, uvc_ctrl_get_zoom does not add the
sign to the returned minimum value, so it's impossible to zoom out.

Modify the data that is passed when querying the minimum
value for V4L2_CID_PAN_SPEED, V4L2_CID_TILT_SPEED and
V4L2_CID_ZOOM_CONTINUOUS.
Also add sign to the returned minimum value in uvc_ctrl_get_zoom.
Thus, the correct minimum value for relative PTZ controls can be returned.

Signed-off-by: Linh Vu <linh.tp.vu@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e59a463c27618..00fd7e74e6d6b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -415,6 +415,7 @@ static s32 uvc_ctrl_get_zoom(struct uvc_control_mapping *mapping,
 		return (zoom == 0) ? 0 : (zoom > 0 ? data[2] : -data[2]);
 
 	case UVC_GET_MIN:
+		return -data[2];
 	case UVC_GET_MAX:
 	case UVC_GET_RES:
 	case UVC_GET_DEF:
@@ -1322,9 +1323,16 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		break;
 	}
 
-	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
-		v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
-				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
+	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
+		if (v4l2_ctrl->id == V4L2_CID_PAN_SPEED
+		|| v4l2_ctrl->id == V4L2_CID_TILT_SPEED
+		|| v4l2_ctrl->id == V4L2_CID_ZOOM_CONTINUOUS)
+			v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
+						uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
+		else
+			v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
+						uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
+	}
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
 		v4l2_ctrl->maximum = mapping->get(mapping, UVC_GET_MAX,
@@ -1909,9 +1917,15 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 			if (ret < 0)
 				return ret;
 		}
+		if (mapping->id == V4L2_CID_PAN_SPEED
+		|| mapping->id == V4L2_CID_TILT_SPEED
+		|| mapping->id == V4L2_CID_ZOOM_CONTINUOUS)
+			min = mapping->get(mapping, UVC_GET_MIN,
+					uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
+		else
+			min = mapping->get(mapping, UVC_GET_MIN,
+					uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
 
-		min = mapping->get(mapping, UVC_GET_MIN,
-				   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
 		max = mapping->get(mapping, UVC_GET_MAX,
 				   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
 		step = mapping->get(mapping, UVC_GET_RES,

base-commit: e0b8eb0f6d652981bfd9ba7c619c9d81ed087ad0
-- 
2.34.1


