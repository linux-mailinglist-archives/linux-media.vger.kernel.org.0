Return-Path: <linux-media+bounces-8746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E71899F3A
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 16:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A99A3B213E7
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 14:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AE816EC1E;
	Fri,  5 Apr 2024 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NoHgHgf4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE8F16EBE8
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 14:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326505; cv=none; b=Q3RTX80R/TR2iDLMYXW/5k0l+kfzzP7hR9eCjtwPMdX2WxBocVrepDmYLKyR5o/p1xvqIdDqCDDhlU9ESr4F6SWpqfg6P0Vs2I45Z2ZddBWgzv4vlREwAW4OasXtblvCtDJLM//8v/tjF2N+s2BQoaOyegGGLN3UGKBmEJ5oKgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326505; c=relaxed/simple;
	bh=5XRJmffCvoTFmT8VVV2m0fHxLKA4GHevMj3V5iq7Qd8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nZ5VBsNDGi/b6yXXMDZAQikIWIcdoC52LG6JQeXt/Tk04QhrdmxTUVCkhLJeI78HxwXjO6ghH1U6V9NFJr2dRnoNhaF5lmXcUINL2OpVjR9WDGbR1OZIua1ZMTQkQKUnousNUzZfcN/nQaBJrH5GTNpBomFRRPL6F8KhjjDWaSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NoHgHgf4; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4162501ba28so11537385e9.1
        for <linux-media@vger.kernel.org>; Fri, 05 Apr 2024 07:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712326502; x=1712931302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnT4iGgtwWQMG15A5RV71jOjD3/1N8JXSjbIzrqMBWI=;
        b=NoHgHgf4dxBorDPnOm1HhYp+TU+A6W7awm1ERggt9ry6y4s34IZH6OJnurh1inBy7w
         p+9R2TMXipvSLut8Q+0OwJzVkzUj85XtT963Qw8FqjEMXw+NRGrj83bXd4sskoEj1vsm
         Dhx+bhuZVXscvcVLw00TAoQMNekqPrjlXQYOEpLiMyrML60gDD5zAMIFXhYtYKZjrTlu
         pjMWUQujFM3r13E1JaVYjVqOyAjRAaKQr5ny258C8eyplzfCUyMdKX0p2NlpyLM150YI
         tnjwH8wHsVBrGymsjNTmc96Ph+4qPQRX+FJE+ApkWwLuPyNOwc0Zdx4gosGVkY5aE5y5
         Z09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712326502; x=1712931302;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jnT4iGgtwWQMG15A5RV71jOjD3/1N8JXSjbIzrqMBWI=;
        b=Lb8g6WOJz/iKh3lgYF86lbX587ffSyTFm/194giWOhYByDB+E+Cp4Ovo8xIChn7aXP
         y2ghmzmL+cIm0PdQGYOwnlAn6GdSbTmE9mS866KCvBqa+MimqboLLYIc2xGvPBps5SkB
         fZj34SBbEHWMJQijPJqOav/vgViw3/eJrt102GHOMV9g/ei4iN0h9fC2+1IKpeHBvoxs
         w6VWRCYd1o5Nc/6gUE9SokxeqM7T+repHuNCKo5GmqwsgnWMqLKf5uf84+gZjzR3ZyuL
         kbu4kqeauh676ZFnTihjFpc0vOjzl4Mfh7zdV3TkU4r3JQp0JESp4lHXEuBnzhy7fEz7
         gp9w==
X-Gm-Message-State: AOJu0YyYYlS/o0dSgyyYiemVXsHJo2P92vYnZFs9rgcM4kchMyCRIaQD
	TB0E8L73sCQT96YX/711Wxm/Hs0AsQMQ9S8IpOrzbmHIOlxIUEwiR1F3XvhZeB4IWUS/ntsFxnU
	H4XQlZEjQ/A==
X-Google-Smtp-Source: AGHT+IF7fT+tsywJe0mO2bG/yk2w9c89FveDuuUwn/6Zcv/Ube9lm7A2JE006Ic154bx2/3VtCB/27lzySO0ug==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:470d:b0:416:3307:a047 with SMTP
 id v13-20020a05600c470d00b004163307a047mr17569wmo.2.1712326502095; Fri, 05
 Apr 2024 07:15:02 -0700 (PDT)
Date: Fri,  5 Apr 2024 14:13:56 +0000
In-Reply-To: <20240405141411.1807189-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240405141411.1807189-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240405141411.1807189-2-panikiel@google.com>
Subject: [PATCH 01/16] media: v4l2-subdev: Add pad versions of dv timing
 subdev calls
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: kieran.bingham@ideasonboard.com, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, tharvey@gateworks.com, 
	niklas.soderlund@ragnatech.se, prabhakar.csengg@gmail.com, 
	charles-antoine.couret@nexvision.fr, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, skomatineni@nvidia.com, luca.ceresoli@bootlin.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, 
	"=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Currently, subdev dv timing calls (i.e. g/s/query_dv_timings) are video
ops without a pad argument. This is a problem if the subdevice can have
different dv timings for each pad (e.g. a DisplayPort receiver with
multiple virtual channels).

To solve this, change these calls to include a pad argument, and put
them into pad ops. Keep the old ones temporarily to make the switch
easier.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 33 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 14 ++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-cor=
e/v4l2-subdev.c
index 4c6198c48dd6..07759cdd0844 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -369,6 +369,36 @@ static int call_set_edid(struct v4l2_subdev *sd, struc=
t v4l2_subdev_edid *edid)
 	return check_edid(sd, edid) ? : sd->ops->pad->set_edid(sd, edid);
 }
=20
+static int call_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
+			     struct v4l2_dv_timings *timings)
+{
+	if (!timings)
+		return -EINVAL;
+
+	return check_pad(sd, pad) ? :
+	       sd->ops->pad->s_dv_timings(sd, pad, timings);
+}
+
+static int call_g_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
+			     struct v4l2_dv_timings *timings)
+{
+	if (!timings)
+		return -EINVAL;
+
+	return check_pad(sd, pad) ? :
+	       sd->ops->pad->g_dv_timings(sd, pad, timings);
+}
+
+static int call_query_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_dv_timings *timings)
+{
+	if (!timings)
+		return -EINVAL;
+
+	return check_pad(sd, pad) ? :
+	       sd->ops->pad->query_dv_timings(sd, pad, timings);
+}
+
 static int call_dv_timings_cap(struct v4l2_subdev *sd,
 			       struct v4l2_dv_timings_cap *cap)
 {
@@ -487,6 +517,9 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_cal=
l_pad_wrappers =3D {
 	.set_frame_interval	=3D call_set_frame_interval,
 	.get_edid		=3D call_get_edid,
 	.set_edid		=3D call_set_edid,
+	.s_dv_timings		=3D call_s_dv_timings,
+	.g_dv_timings		=3D call_g_dv_timings,
+	.query_dv_timings	=3D call_query_dv_timings,
 	.dv_timings_cap		=3D call_dv_timings_cap,
 	.enum_dv_timings	=3D call_enum_dv_timings,
 	.get_frame_desc		=3D call_get_frame_desc,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a9e6b8146279..a5213411ef2b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -791,6 +791,14 @@ struct v4l2_subdev_state {
  *
  * @set_edid: callback for VIDIOC_SUBDEV_S_EDID() ioctl handler code.
  *
+ * @s_dv_timings: Set custom dv timings in the sub device. This is used
+ *	when sub device is capable of setting detailed timing information
+ *	in the hardware to generate/detect the video signal.
+ *
+ * @g_dv_timings: Get custom dv timings in the sub device.
+ *
+ * @query_dv_timings: callback for VIDIOC_QUERY_DV_TIMINGS() ioctl handler=
 code.
+ *
  * @dv_timings_cap: callback for VIDIOC_SUBDEV_DV_TIMINGS_CAP() ioctl hand=
ler
  *		    code.
  *
@@ -864,6 +872,12 @@ struct v4l2_subdev_pad_ops {
 				  struct v4l2_subdev_frame_interval *interval);
 	int (*get_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
 	int (*set_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
+	int (*s_dv_timings)(struct v4l2_subdev *sd, unsigned int pad,
+			    struct v4l2_dv_timings *timings);
+	int (*g_dv_timings)(struct v4l2_subdev *sd, unsigned int pad,
+			    struct v4l2_dv_timings *timings);
+	int (*query_dv_timings)(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_dv_timings *timings);
 	int (*dv_timings_cap)(struct v4l2_subdev *sd,
 			      struct v4l2_dv_timings_cap *cap);
 	int (*enum_dv_timings)(struct v4l2_subdev *sd,
--=20
2.44.0.478.gd926399ef9-goog


