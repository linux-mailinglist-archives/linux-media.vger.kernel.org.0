Return-Path: <linux-media+bounces-47230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E07C66157
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 21:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 761B84EB375
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 20:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93508325731;
	Mon, 17 Nov 2025 20:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PztX19rh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F344633556C
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 20:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763410463; cv=none; b=t/ZU4+zNLNeFv/pw/5gvHhLbDbQxL/CKwdWG6y8wGPyrQL7thKJxVVgzV3ouoBaZP4k1LamUSXkaSwvBEBShLb+LDDCFbj7iXA+qf+KasE462bGQFQrBB19EAtdtc8fpJMtl/lQUzQkgTZkH3D4p903RAN18KPBSORosVyfEs7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763410463; c=relaxed/simple;
	bh=PDXeoHjilGLmsgGYWs2pF2jFpc8Fek8OZ2Tb7dK3KHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=itRkYtv9zf2JKOW9jFvi2JG5y+jtD70B8j6WeYzvJWIKqWZZOf4dmX4E/jnq5Qz8jmwjK30puMRZ+Tk4kfbGZWg0bR7KdYG+QIy0RIEjOLP+TGspmTjQ8YNbGgoLCp4lHQPOx3pO55e31ggeiq75E50eDR3GnmZPDQJ5QA2XpB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PztX19rh; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37b996f6b28so44606041fa.3
        for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 12:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763410460; x=1764015260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbLn7Tq1LCaFET/TnEDu5Mn2s8865xnIcHY2GnqwqUI=;
        b=PztX19rhPiie997q8mtTerXXbf2+F8okODOozgEy+OaL3JJFzyIqQsECZCpStvGKlp
         QN+HhtOrfzao339FpOxlqhl+hLvoA3t+Yd6x0+8W8XhmXmdiz+G2kBZSEI5KtjsXj7aT
         o6rCvkUQor3IVrlr/rS9RliHyYpEdHsU3ODag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763410460; x=1764015260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fbLn7Tq1LCaFET/TnEDu5Mn2s8865xnIcHY2GnqwqUI=;
        b=u79MoomoZcb9GE2sI3UiRyb2wISDbD3YvJ5Io4lmO7Xsq3jSqaJa7aKNvbrnKX2jPT
         MDjwKFxVcRUIq9Nvo3m6UOX9uEJj5KID0rWqY+5TII6RmskhEhZn/fG88yD9EqJ0fTzM
         3m6SPHNINUN48dUErXqXmt7RZptdIapqAHiMv7Vd+AooWGAh8aROY2xXSqHM/G3cgHTz
         EOOeet9CNAG9aSS/I6mBn5u9UeEx9lweaBIjq5Xkz/ff2L8wCq748Vq9ClQPKcYZvUfn
         JjohN+TDwDFw6DjtQ15rsRJGAHPOUFhrSJS3uUu/CP76ulyGuvfn7JzPcWSCVkbeJoNH
         zPag==
X-Gm-Message-State: AOJu0YyMMsvWK7YTgOf0+kNKG5yqVq0NOaDx3gNdT1vOQuzy7YQO++Um
	J1+ekC4IK0lCl428aICpqWf9r8OCWgL/789/+3asvv4lnijCT4bqZt+G4ZY79jWVtr1XzCsyw3v
	JUxLWEJvi
X-Gm-Gg: ASbGncuwHNh7+/0O+ueWzR9/FJSQgF05c7wxdgfgUhxMaYHuNYjKy9Ch7Rhc+3+nP8Z
	5OZ6yJUL8QW6tfSmwnxCIfRlEmBVf0opwfjsFYbJzBNWLid9RddIh5cuODhzdQ5qmochk1oOnbl
	TJzb28hOeRhxusO8x1DUVaXt1+lbSnx7MoB526kbdbey5SXmcNvAM9K7ZBs5DR+l7cpOJkfi+wL
	iVl+RlRp8V5IvEnmMk67wxpxvl98FVXrOpm7UYppN7d29vit0W3URPl2z34eErfKYkBBRrNU1U5
	jmbsfhS9+2Ht++kUvNFeN1uwayjEswMSJ3Xddt7EyBJOU2bvfHstZP9+nFpjH99MAj5lS2ZVn6T
	3rayuS9HIwTAaaPyD7Ukl7c7HU8up0vV1XCgHlztGYbxmt6bhniE//mm9Mn97zpazHq52RvQpB8
	cFmKxpDBMelTj1FjKOgC5zo1DmOe/2aoXYTbm5T43pqrZZ8mrM9Bik3wZ2rE7RFA==
X-Google-Smtp-Source: AGHT+IGHMJO5hFsbeAdTfXDrkQ3dodtkLlSLucMoWep7XxCSBof4UP5umUgUewkik/7Fm/oml3AtYA==
X-Received: by 2002:a05:6512:3e07:b0:595:81ce:ff83 with SMTP id 2adb3069b0e04-59584209400mr4209898e87.25.1763410460056;
        Mon, 17 Nov 2025 12:14:20 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003a4sm3413302e87.59.2025.11.17.12.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 12:14:19 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 17 Nov 2025 20:14:18 +0000
Subject: [PATCH 3/4] media: uvcvideo: Announce deprecation intentions for
 UVCIOC_CTRL_MAP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-uvcdynctrl-v1-3-aed70eadf3d8@chromium.org>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
In-Reply-To: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The UVCIOC_CTRL_MAP lets userspace create a mapping for a custom
control.

This mapping is usually created by the uvcdynctrl userspace utility. We
would like to get the mappings into the driver instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/drivers/uvcvideo.rst | 2 ++
 drivers/media/usb/uvc/uvc_v4l2.c                       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index dbb30ad389ae4d53bc734b4269ebea20ecdd7535..b09d2f8ba66ecde67f1e35fd77858a505ad44eb1 100644
--- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
+++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
@@ -109,6 +109,8 @@ IOCTL reference
 UVCIOC_CTRL_MAP - Map a UVC control to a V4L2 control
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
+**This IOCTL is deprecated and will be eventually removed**
+
 Argument: struct uvc_xu_control_mapping
 
 **Description**:
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 9e4a251eca88085a1b4e0e854370015855be92ee..03c64b5698bf4331fed8437fa6e9c726a07450bd 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1044,6 +1044,8 @@ static long uvc_ioctl_default(struct file *file, void *priv, bool valid_prio,
 	switch (cmd) {
 	/* Dynamic controls. */
 	case UVCIOC_CTRL_MAP:
+		pr_warn_once("uvcvideo: " DEPRECATED
+			     "UVCIOC_CTRL_MAP ioctl will be eventually removed.\n");
 		return uvc_ioctl_xu_ctrl_map(chain, arg);
 
 	case UVCIOC_CTRL_QUERY:
@@ -1158,6 +1160,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
+		pr_warn_once("uvcvideo: " DEPRECATED
+			     "UVCIOC_CTRL_MAP32 ioctl will be eventually removed.\n");
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
 		if (ret)
 			break;

-- 
2.52.0.rc1.455.g30608eb744-goog


