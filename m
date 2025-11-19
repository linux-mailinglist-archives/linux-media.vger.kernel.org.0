Return-Path: <linux-media+bounces-47403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA93C70D94
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 20:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 0D478294DC
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 19:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9055835E526;
	Wed, 19 Nov 2025 19:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dU0UKT9e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1933624D0
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 19:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581041; cv=none; b=MAWJAmrY1ZugnfiAXWP1RXQSVCqs7tUCQ+oIJwI+dJ/r92RAqFFx6XvXOVRsiihz8FBxfrHF8rO60icMro8SqPYOf2eAZ6pIRW5E8u1U3+9nSoRTarjdgkBLEM5s1dK289u4COi53ZtRLpJYqoKZwHsnMFeJrtpAx5uggWq+nCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581041; c=relaxed/simple;
	bh=smsLWyIhFZI4LUQsucb98+3IzvKG+sVE9pphNiqEeWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6y3j7YG9D6UuDDUGLCiOBy6J8AcujstQvvnswp7dkt3t0V3TYPpjMNyhK/oaV2iUtinjVfT29NQNNTWiR/N98fhtfynmHS9Yhpq44QtTHmsBsPq337bbnY5YrhBAMsmOooXZgej9TeYLlqz7nj36pisX/WsLYy4KDYgN4yqUg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dU0UKT9e; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5957c929a5eso42637e87.1
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 11:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763581035; x=1764185835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhkxKxNdiC2wNdpzuN+YHorPAGBUt1TQOUtGQjnuPb4=;
        b=dU0UKT9eoCEZn4t9Z0g/7EWmLK7rsez+HGyJCWm6f67AlxFfQ+NWP+LnCr9ukH/By+
         Rc4ApSfTatVytTGAm9d2W3TJhkTaC3CxVZmy8tY8RLy1n9xZYKZrBqnBWzQz0imSo+7U
         nk/Bqg79/c5jxBCHcvqqZ5uj4tsubSKXfKfvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763581035; x=1764185835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mhkxKxNdiC2wNdpzuN+YHorPAGBUt1TQOUtGQjnuPb4=;
        b=nRfCj5JStzIioTX9dS480wU6+qn5cZB5K9P3iF4psVzf/UHpiBXBrYuK/puotM2+dk
         eI8Cn3goMAajLfwvplN8HJ69dU+reBmufrZFdbrEkQw9jwF27FF1SDLNe7w8uu5fyXUm
         ci9DimdMnNzHgnEaIw6eSM/Ii+fB8ylqW1NrJ5UUj1aGOzeSKZIerguK3vCUf0IJyvjv
         63XbC0OEyhG3LdZEL3neawduBG0afgt+J+S8kKqcQ7MLGEsoQruKz2tUjKmC4K1DlSPJ
         yUjG8hmZKDv5XxAYbqMz92FzCLzOswMMuYMSIZTlY6v4NDWw4NdhUR6MpmmnQ3fDCAl5
         yF0w==
X-Gm-Message-State: AOJu0Yy2FVSEM/nu6cctWQn4udFeIX1d1e65cV8HZ5g2D9D6UXFqs3z5
	ggEsEwgXpgb3YFUCl/Cl6k8qqFAW9ryNNRa0Gr2YpdYiKKsO0cBVfVeAV0TOZ7xQKw==
X-Gm-Gg: ASbGncvcZe3eyNBoWTp+Q0eIPLjyvLr/JTeYZb9eJMgf4xGULFm1CZQzhRRYMRqkz2b
	l7hSrN9qvkKyX/bU7XvREogPggddFxYZYAUOTW08ur1aNPEtlujH1cJriezRusyUYYokqX58w7O
	zE7wEhn85cb+rmCbBBCwYooULYVy8nE/Bi03/QyiKVNKjNmpQ97tEBXULhtv7a+dcYpDxXSm4Lj
	3gjCwZ6enndv3Z4XlRwnV8nXCHmD15cQDiR31ovEw55ykd0IQPgUHNMLHO7712QAZW3KsyV+KC4
	mdxZusLvlWc/yR2TvODtq1cemjqcw2tgG/fryW4D+q3e6FjYYcPKD4ffeNdyxJvWpAxAWz1mc80
	/Tg/L48ZAsVexzaFwpqXTwE02MUOBoDPKNTdpJe5nkjbRJaxwRc57J8JbIjZqBo+UvllifvhidC
	g3yR5JqhpyKPQJvg5X15YuIwrzaWAZ0vVChojge7k7JIgpkyFoWRaz9lOzBuw77UbZBH3KgYax
X-Google-Smtp-Source: AGHT+IGJe3V2Yc1Ik3PSIeoKVCn2YAJLOADNcKsHyJgQGXCsFRO6F5ZJLhmJqnTvgFCXCK6GL6NZ1g==
X-Received: by 2002:a05:6512:23a6:b0:594:2f72:2f7f with SMTP id 2adb3069b0e04-5969e2b505emr37039e87.6.1763581034759;
        Wed, 19 Nov 2025 11:37:14 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbd15a1sm65790e87.98.2025.11.19.11.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:37:14 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 19 Nov 2025 19:37:12 +0000
Subject: [PATCH v2 3/6] media: uvcvideo: Announce deprecation intentions
 for UVCIOC_CTRL_MAP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-uvcdynctrl-v2-3-0359ffb98c9e@chromium.org>
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
In-Reply-To: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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


