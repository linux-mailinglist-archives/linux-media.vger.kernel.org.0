Return-Path: <linux-media+bounces-27520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B232A4ED14
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 20:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66D8116C140
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 19:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87E425FA2C;
	Tue,  4 Mar 2025 19:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfPiTJ58"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB05A25F997;
	Tue,  4 Mar 2025 19:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741115843; cv=none; b=NuTDVGzk+k/tzevs6Fvt7QTM3voUAvzXYX8j7Gr55S4PSa2d7K0Uai+6crXISfqmy7IZenb/gGCYCjXj/3d8iIneGdm2iljXXyUfDE6KFT+Ik17vY/bZgoMt0lFgMnkXegx9veg/fCv6i8bGNRkC1XeK6eMdvg12V0O421l9nto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741115843; c=relaxed/simple;
	bh=+3TnaaiKsskpcQv6UBYy6QQ19+PBCAU0vOzbt5MY4vI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gSOnfGFgQyw0wxukmR1bqz13c1SjOuv4ftnHH/lZH6Mo6O2TMwOjrue2RbogafmWFT8kntl5gS2XfDKiQm79SeolgjKBFHmxxVBEUGEUza+qwddFhP4P/Ta3PHlu0UiEOI4FY3Kqzat9vbukhUcFygPxbFWte6wOhRFVlji6y3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfPiTJ58; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e894ceca36so6851196d6.2;
        Tue, 04 Mar 2025 11:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741115840; x=1741720640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPNRgokQS1smuyYwJH2DBN5QkQ8kEEg0GsmvHdeco38=;
        b=LfPiTJ58moRQW7R9GkuPfuxzxc2muTUvXmhz08mqh5ec3A15KarcDsZbnkjOyiCS7R
         tKbSCGYgDJrLy3cyMVFJt7i4eAbI6OfOaiw30ozCtfco42XcaEX9tc6ajrzha7vRQr9D
         50h7pWZ3cJqUiV2HX5ooILXSMpjzNEsjw84LxOKUTzRDGhuatrJXIc/LZoH4ypkO4CO/
         uYuNFAymu4jH5DVWC0iZwMQ9kogYWP46JnndnirsHLDxqDATIyb55kIS26PEOmxvkUEd
         M8FIGdE6Y5NHFEqYxnKbyNWT6mbh0JIwSbmAX4AzhqyykVfKxfaA1M65qgJghiLdKqxm
         AmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741115840; x=1741720640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPNRgokQS1smuyYwJH2DBN5QkQ8kEEg0GsmvHdeco38=;
        b=LpUXjG9Nz1UlcN3mIFB15kYaEF3i+r+YW8wNvSSWjnBZQX1wx4svfpJimJ/E0UIkML
         0d8UKpLjpbBozjrQrQdmYE1UvxL3SOkB9NBETJlsRK0LlbpH5e3Z39CN1CsQet9uGA5S
         pp1FcuNBmNPaOWk/4eqkAA81PCPGe1N6qDZn6VXylWsK9XmyY4CSCkhEpNSjoSe7K4/v
         JtTwqBfA3ac1paG+LxPJGY4InIQx06KWdSJ8bbUX2cLzm6vZ7wfYbJwbvWpXeyuRXkS1
         E50GqpgakHTEB2eLyYP9Ei8kD3L8dWDvCVLa7Zl5TQBKpSJK1AgzqE1pjJP7wI2Msrza
         hppA==
X-Forwarded-Encrypted: i=1; AJvYcCX/UjK4jAlr/WJCIxMiE7NKgky5b6+DF1DdiboOpmv0ONITkN1+j+lGh3J3rFB5/qllvMW6uhYfLaed5RA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdGxQJM5S67f6K64Seb4g7/mSIcidkvYyqoLzhpjyVsfJLxtCo
	7p1p8ES0dYxDVHYOOSO3SmGReKsVLrzST99x30P5fLJxNRXvVu1V
X-Gm-Gg: ASbGncssLrvcnqajQKxv7PAeZ4Cezc20oJHqy4VwJuvkNU6Fe6JWwb1AxiokkRjl5VI
	o6wOPChkVI3poY1+fUNO5/j6LbUlhcICMVN1k4N8UnXJF0wbYpSmxnMllm8zsM74HdrakSxRKMN
	ShjAWnhC0MiP0vFQclaa6HFWQMCNMo8lpO61xpYHgsXksdJiUvlPUU13iQRhtc6nR3Q4FPY+DXi
	GO/Jk/LVFbLz1ig0rw8GR3qcMiYT5rPimVLkPwbek8y3Wv+xvEkx8e6RXQ3DtossERgEitiBVKU
	v8zw/oHm0O+RDmdpIZOswfb/SVxedXvJPZZ06XInf5+28ElKEXj2rhg59wNPdbX5UasbLUC6l42
	3H8CyYRN+dQ==
X-Google-Smtp-Source: AGHT+IE4bLBqvIsJZtISUvAHgmTAGCix7cCELNHbGoBo8b0Oz83U+Rjf8tiD0EJp4c0EKyyA9DlQdQ==
X-Received: by 2002:a05:622a:1212:b0:475:6af:9fc4 with SMTP id d75a77b69052e-4750b4ce81fmr1330261cf.12.1741115840504;
        Tue, 04 Mar 2025 11:17:20 -0800 (PST)
Received: from matt-Z87X-UD4H.mynetworksettings.com ([2600:1002:a012:8f2c:1c50:24c:178b:a9b3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474f351687bsm24079351cf.19.2025.03.04.11.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 11:17:19 -0800 (PST)
From: Matthew Majewski <mattwmajewski@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Majewski <mattwmajewski@gmail.com>
Subject: [PATCH 1/3] media: v4l2-common: Add RGBR format info
Date: Tue,  4 Mar 2025 14:16:59 -0500
Message-Id: <20250304191701.2957096-2-mattwmajewski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304191701.2957096-1-mattwmajewski@gmail.com>
References: <20250304191701.2957096-1-mattwmajewski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing RGBR entry in the v4l2_format_info[] table.

RGBR has identical format information to RGBP, as it is a
big endian variant of RGB-5-6-5 pixel encoding according to the
description in videodev2.h.

Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 0a2f4f0d0a07..b33035760e12 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -250,6 +250,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_ABGR32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_BGRA32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_RGB565,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_RGB565X, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_BGR666,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_BGR48_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-- 
2.25.1


