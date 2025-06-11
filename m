Return-Path: <linux-media+bounces-34540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE361AD5E58
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 20:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A69A3A9C62
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 18:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584482BD00E;
	Wed, 11 Jun 2025 18:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="BTrCvNfK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C4617A31F
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 18:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667047; cv=none; b=rqTKMlGC2gCfHL487rvnmDdvUJNVxX2G13uhJfsfwr2WdIJPe/LAnMLGGXDakAfVYtHLzvEkXrWpsNgiDbqQPzzjJg2wAqb1G80D3mJnnrVNbMlsBN4M2glFhuedeZy5ra/LYX4Wq1sUJDc7C68XaxvgUUEKnL7ISiP0zg4f+TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667047; c=relaxed/simple;
	bh=As5A0OqeYX31BcT5f8MqqEWBy/dKh075/j28h5b08z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dquRfXt/16HqPQSBMSOMi5cgZMU+L3wUk8TLfjKy6tTNzzVkdETYQYLEZkqZFgTmSRhmVf7u80gtTgysdxWurILjdMbLtyx8OnFmbK4RlLN+NmJx4C861DQ6OSUqrc0kWZkEyzATDf0qWna6jXVCA8DEZATu4HpRDbvaDm644qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=BTrCvNfK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450dd065828so713505e9.2
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 11:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749667044; x=1750271844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+P+Xcul569I8IEtQZA+nCLqa8EijcGyUC3HbPjalOas=;
        b=BTrCvNfKl8vNM9rWO9YOjOUn3mOL1wOccHTE5guaZBDMrL/7FNe1ydH2fjASKkzWoO
         PnXWoly0Ek6nNsnz7cc96FYYwP/l72245jr2HuWvreuV7yjdy8cfCkRQpzBvuOnXwOPt
         vWS75pyffHucmbjqRqVlNtX36rgNydXzvL3oR11Pdjq/eLsUzYDFZefpRiDgvHAjP4Ar
         0XutGc3pMh5ERCeiMS64vPXXbfGSHqPLAurPbWQe7KdnldeCPn0R4Num7TkOb14WDPgS
         jnM27OwDL/8viC+ai75vyAwePy35of3en6NLObyEn7/7buM025XlA84RcdicOJRtANZP
         NQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749667044; x=1750271844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+P+Xcul569I8IEtQZA+nCLqa8EijcGyUC3HbPjalOas=;
        b=MFUpsJSZrK64WBcFQ3Dy8zx3mCLq5peaQOGmUdasyBPtgKdJr7s5pWd0hpMoZo5g0M
         8KBN+NEyYfaeP93LbFFij1wpINvIt99Xtk1Z/YpsIHTcpF/gbB12A+R9vMfbeHDO2cAz
         zJaZu/bR8py4Mcbc0ZIWdXTlJ2ga262z+smWyISzvupaK8Ya3bl42RmBeHVoq5JG0TaE
         gpv2sAPxkC7k5jWYEwBBcnQho9PNY/6xmzEtsT9eRTXx/V5muscjzmFokiL0JAaJIJ+n
         RitdLI7qyWqQShFcnhOOge7h1xclmXG8A0vCLgtmkXf1nWbk/TEgig8gvXr8A7aPbYPF
         JTxg==
X-Forwarded-Encrypted: i=1; AJvYcCWtyvkcoZK50aG9rHZ9eCdZZLXk0Qoe9uxO0zQWe6U3ecIrLUAFUxcotfkTKeAic86J/UsTO5bObN+EJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3BHBsEzbOmOByC6wG/4zC2xWmVMppMV2EPuv5GANuD7QbG4kj
	vaBhA5vg3dJhbnhA7PdgsW/V+bgH/Z64OjdEA4UMb1mck8d38v0EC2J4f8iTZyyguZA=
X-Gm-Gg: ASbGncvhWH8neg4GY3+XAZR6iD8VtlGsQxZNYSvJ5fwp3FLFWlTTL/MmGxses4gfmJs
	yqueANGh66mJftkqridyC9l3J6M7mmM3iVmi8sxY+f03f8dhiemly0r9PL5M1pOvba2EMRzQ+bJ
	PUXsOzS2ChP8xvEUq7D9e3K/KyNMd1ol5nVE3GrgNwSsiKKRsvx/SD0avF299f1PPzvmY/Rgys6
	Wq6yTb/ebm2D+8SGHpUaVWKI9ZLjLQ0dVtCafKp5/bxuD+0Boy5q0sqERFU8AIByCI0Fust502r
	KOED3owbh8ti6GklG2j0XeLQYDushncTMzplTXuByZxKfVD8QYKrXUC0FQj5CKi3
X-Google-Smtp-Source: AGHT+IFoP50tmhgFnoHamwtAePqFHuyZl0kIlu1pe1rTBJjxaOHhQLNNJiWGEyddK2iuPOKOY76sBw==
X-Received: by 2002:a05:6000:26c7:b0:3a4:f70d:dec3 with SMTP id ffacd0b85a97d-3a5606c7a11mr367720f8f.16.1749667044189;
        Wed, 11 Jun 2025 11:37:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a5324364d4sm16119390f8f.55.2025.06.11.11.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 11:37:23 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 11 Jun 2025 19:37:16 +0100
Subject: [PATCH 4/4] media: tc358743: Return an appropriate colorspace from
 tc358743_set_fmt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-media-tc358743-v1-4-708556026f9d@raspberrypi.com>
References: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
In-Reply-To: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maxime Ripard <mripard@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

When calling tc358743_set_fmt, the code was calling tc358743_get_fmt
to choose a valid format. However that sets the colorspace
based on information read back from the chip, not the colour
format requested.

The result was that if you called try or set format for UYVY
when the current format was RGB3 then you would get told SRGB,
and try RGB3 when current was UYVY and you would get told
SMPTE170M.

The value programmed in the VI_REP register for the colorspace
is always set by this driver, therefore there is no need to read
back the value, and never set to REC709.
Return the colorspace based on the format set/tried instead.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/tc358743.c | 44 +++++++++++++++++---------------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 4d3dc61a9b8b..37ebc760f73b 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1708,12 +1708,23 @@ static int tc358743_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static u32 tc358743_g_colorspace(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		return V4L2_COLORSPACE_SRGB;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+		return V4L2_COLORSPACE_SMPTE170M;
+	default:
+		return 0;
+	}
+}
+
 static int tc358743_get_fmt(struct v4l2_subdev *sd,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct tc358743_state *state = to_state(sd);
-	u8 vi_rep = i2c_rd8(sd, VI_REP);
 
 	if (format->pad != 0)
 		return -EINVAL;
@@ -1723,23 +1734,7 @@ static int tc358743_get_fmt(struct v4l2_subdev *sd,
 	format->format.height = state->timings.bt.height;
 	format->format.field = V4L2_FIELD_NONE;
 
-	switch (vi_rep & MASK_VOUT_COLOR_SEL) {
-	case MASK_VOUT_COLOR_RGB_FULL:
-	case MASK_VOUT_COLOR_RGB_LIMITED:
-		format->format.colorspace = V4L2_COLORSPACE_SRGB;
-		break;
-	case MASK_VOUT_COLOR_601_YCBCR_LIMITED:
-	case MASK_VOUT_COLOR_601_YCBCR_FULL:
-		format->format.colorspace = V4L2_COLORSPACE_SMPTE170M;
-		break;
-	case MASK_VOUT_COLOR_709_YCBCR_FULL:
-	case MASK_VOUT_COLOR_709_YCBCR_LIMITED:
-		format->format.colorspace = V4L2_COLORSPACE_REC709;
-		break;
-	default:
-		format->format.colorspace = 0;
-		break;
-	}
+	format->format.colorspace = tc358743_g_colorspace(format->format.code);
 
 	return 0;
 }
@@ -1753,19 +1748,14 @@ static int tc358743_set_fmt(struct v4l2_subdev *sd,
 	u32 code = format->format.code; /* is overwritten by get_fmt */
 	int ret = tc358743_get_fmt(sd, sd_state, format);
 
-	format->format.code = code;
+	if (code == MEDIA_BUS_FMT_RGB888_1X24 ||
+	    code == MEDIA_BUS_FMT_UYVY8_1X16)
+		format->format.code = code;
+	format->format.colorspace = tc358743_g_colorspace(format->format.code);
 
 	if (ret)
 		return ret;
 
-	switch (code) {
-	case MEDIA_BUS_FMT_RGB888_1X24:
-	case MEDIA_BUS_FMT_UYVY8_1X16:
-		break;
-	default:
-		return -EINVAL;
-	}
-
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 

-- 
2.34.1


