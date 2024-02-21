Return-Path: <linux-media+bounces-5586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0558785E275
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 17:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEFC22874E5
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 16:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7F68286A;
	Wed, 21 Feb 2024 16:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TC2r+sho"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537B381AA8
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708531354; cv=none; b=Zri4goj4jkkfldnWF/Q2ZdAHmqAsofqM7QlCh6ifOOmSzbWOAFKIBDjzF97r9eDUkt5kV7qVeP5hIqNp7Fk7OfZ3xNS5+73IYhJXZ3K3712qhYhnsuEWZ64CU+XWgeAyx8kIHYXZCkX6+TY9p+jK4czCUZ30BrlQgmYRXUgzD1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708531354; c=relaxed/simple;
	bh=xp1En7WEY2Yy2e9YIWX40hV8+s5QANKt/pakIjV5+QE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ooRhgc+E8SAfNYuMT+TdS3zdz+8nK+3DoheAq/3pN4HSJrx/QaOolpUC40UNsL/gt+JbOuXS/GwaTbjpHyTX9/CCXF0QI2MTSYj1dJ66psGSgo/DgN9O80iZSXyGewz5t80cuRvdslflhO3Xu43dPQdG2kOesiJ3IUM05pwPTco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TC2r+sho; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6083fbe9923so15462357b3.1
        for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 08:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708531352; x=1709136152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXMOhwD5qEr4jMu4yu+cDm4xZSeU+k4T71jhjLqjWWI=;
        b=TC2r+shos3PvnTlGhemWMTI1tAZe6A9zkIbRBTvBK+uoX6/5G9J6oAwL0WH+srdvIW
         Hjk8JxwAb2MbIYVrD6oj71n5BlpxMH0WeQVaUzRyy19YiJBIf9wKGK174iEOKOevANwu
         +rGIaRYD4dB/FvwSc4KkHD4XZrAh6lsvisj+AusE+uG1ZFKt0CaJ2+dFL45ur7vsX/yl
         NRBk/oU+ZWf5g1JUWDFxpf6WG/hzCmH646Qtq0q4bgtRgdXBsGavjis6EQryswkTuvcn
         lNBFQXc2qC4cXfdDLSCY1jjeMVPIlwwXxalso1iirYnVg+Q06mnVQODCNpQiXb8nCnV6
         zOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708531352; x=1709136152;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pXMOhwD5qEr4jMu4yu+cDm4xZSeU+k4T71jhjLqjWWI=;
        b=hm7q8nlB2ttp99BLxD536QvbjqI/Qtmi24k1KywWDQOTaKC29C6yRyum6XWmDmBWXV
         jWQLwu3pHQixUwBfZ+wff3f7xb+0rdod3dO43b8PJq7yZbqnSSpNFryg053CedxJjVJL
         IyE+Bbgnov++vEbcywZqyNVGRP9VCW0owPY7ZzQMmQMJtek7Z0PbqoAb6tpto5r0qVbC
         MrQQUOO3QBAPaCqECgZDrlTczpG4Kh8bXRMgKNjy4B81wRtcphOjBowqk3S6vN9FM7YV
         wedqbmykUj56pn6Rf28ov2TPpZo+UvXuYIEciYbv1I3mzK/1mRHu7cbArO/r0tMgdIpH
         H/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7yxSK5ocLPO0bbWcMXr033BuO9Q3fyVapTEI2/Z2dHfTOkNMYHjguAFtRc1jzchaD7OI+Za2dDMMk/aVrfAhLvPIObSgrFEsrMFY=
X-Gm-Message-State: AOJu0YzFk5O0CTkZT2EHwCcGmrXnnSnS18U4LjKeca+CBQvWbuLHSarf
	E6IscoZYHGWk8LXF+7fjH8M2eL5/yFBtCuBoUea7LRB9qx/rQqagnMtQFdRk9Qp9195MKtaBWGh
	yqpDeqHwmxw==
X-Google-Smtp-Source: AGHT+IEQSmE+pix24dTxLHfotoQgbv1Z0gXzz2ZnjnupyHoB1Vw6PlSxU+BraxbINWyowl3J+NqG5SJCyd+0Bg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:690c:a:b0:608:2104:5c64 with SMTP id
 bc10-20020a05690c000a00b0060821045c64mr2767809ywb.3.1708531352282; Wed, 21
 Feb 2024 08:02:32 -0800 (PST)
Date: Wed, 21 Feb 2024 16:02:07 +0000
In-Reply-To: <20240221160215.484151-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221160215.484151-2-panikiel@google.com>
Subject: [PATCH v2 1/9] media: v4l2-subdev: Add a pad variant of .query_dv_timings()
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
	tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, ribalda@chromium.org, 
	"=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Currently, .query_dv_timings() is defined as a video callback without
a pad argument. This is a problem if the subdevice can have different
dv timings for each pad (e.g. a DisplayPort receiver with multiple
virtual channels).

To solve this, add a pad variant of this callback which includes
the pad number as an argument.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 11 +++++++++++
 include/media/v4l2-subdev.h           |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-cor=
e/v4l2-subdev.c
index 4c6198c48dd6..11f865dd19b4 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -389,6 +389,16 @@ static int call_enum_dv_timings(struct v4l2_subdev *sd=
,
 	       sd->ops->pad->enum_dv_timings(sd, dvt);
 }
=20
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
 static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_config *config)
 {
@@ -489,6 +499,7 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_cal=
l_pad_wrappers =3D {
 	.set_edid		=3D call_set_edid,
 	.dv_timings_cap		=3D call_dv_timings_cap,
 	.enum_dv_timings	=3D call_enum_dv_timings,
+	.query_dv_timings	=3D call_query_dv_timings,
 	.get_frame_desc		=3D call_get_frame_desc,
 	.get_mbus_config	=3D call_get_mbus_config,
 };
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a9e6b8146279..dc8963fa5a06 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -797,6 +797,9 @@ struct v4l2_subdev_state {
  * @enum_dv_timings: callback for VIDIOC_SUBDEV_ENUM_DV_TIMINGS() ioctl ha=
ndler
  *		     code.
  *
+ * @query_dv_timings: same as query_dv_timings() from v4l2_subdev_video_op=
s,
+ *		      but with additional pad argument.
+ *
  * @link_validate: used by the media controller code to check if the links
  *		   that belongs to a pipeline can be used for stream.
  *
@@ -868,6 +871,8 @@ struct v4l2_subdev_pad_ops {
 			      struct v4l2_dv_timings_cap *cap);
 	int (*enum_dv_timings)(struct v4l2_subdev *sd,
 			       struct v4l2_enum_dv_timings *timings);
+	int (*query_dv_timings)(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_dv_timings *timings);
 #ifdef CONFIG_MEDIA_CONTROLLER
 	int (*link_validate)(struct v4l2_subdev *sd, struct media_link *link,
 			     struct v4l2_subdev_format *source_fmt,
--=20
2.44.0.rc0.258.g7320e95886-goog


