Return-Path: <linux-media+bounces-26528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA7AA3E814
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 00:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDE8B19C2165
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 23:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0097E264FAF;
	Thu, 20 Feb 2025 23:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQcBHz2e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B098E2676D0;
	Thu, 20 Feb 2025 23:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740092932; cv=none; b=f8GrU0KOorQa96KI9IJVjALRn2vJvWvLsHh9+pvcbzSmE/MW0TCPqOhzXjzkq2NehIgVb5okB1cVTZb/zyxf7xMtg8/NXiwb4fRLyzmT4UFWcefR7x+Eu7SZMPIXMfe68ov+T7EoGCpdDglZj90AzEJ5/zgeYoST+GZ5X8Z2Iok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740092932; c=relaxed/simple;
	bh=zAx5h3CW9uhScVCOaEZGPbZKRppELpmuFuRjU0AzcDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VA59lZAso7BVOsBdtfkzibvXSRotesh6CKeRB/7OodEtK23sjSjokvQwT869XenECumZ1fiR2IKzqoHG56eBdEkdzETA+8wJDHJQjXRDJZ2SIt83ifW3//4pUl1alErqmjYKw1+hjHcuppqNjZwBieFYXosLBu0EbCDy/l5moJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQcBHz2e; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dee1626093so4848980a12.1;
        Thu, 20 Feb 2025 15:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092929; x=1740697729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=;
        b=lQcBHz2eBCTn4v06JON/Oz46HFuK2u/4D/zoqCal124/TprXsDPCQUCzVJyYckW+8/
         o/Un1BO33mdXXUMXfBiZDNz01aKitnq5YximRGvhYk3XU4n07enp5nQn/FMMZsqcFRwe
         7rvVIGTNC9pVFRIXPm2/RGh1LH5xX560awpPiqEAH7RFb7Etlxav4LRXKbP5Ie7jEC6I
         DstdDvj4G7MtdW2hhnoHkIsrMFCIKwdLyYOOsJY9aLen3tBPhmItD639oawB3VmcwI5U
         IkYiyvyt1+WfhlbzktkLUjoK6MkldQmdDW8WFaMuuKCPNVlcpW4lkHpEwNpJW66YxcJ4
         GY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092929; x=1740697729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=;
        b=Cenj2941wzGT9UiyVfpPxa9bdhLxllLHGlKZDovm16hrtzhhtVTw+qNphbND4JAbij
         53EqC17EMFhLz9vrXanu1W9jvsCSPzBFTnfSj5O0FIsQ/MY8qjsXej9rYkGN0an68my7
         PRg1YaCyq5dOtEdCslcX3DiWuF6IwBgR0f6LWRk8HzsT+MsQ8yXp0XNp618wNffk9j1L
         KEb5frheuFS/cDi5osvkOgHt5OGh0TWjwJ8cjCyBIPL4qq4HqS2rr2B3RNTd3idp4yyK
         9SRut23aCWkT5ak5qXpOWvY69K6ocwkeqC64GXhLiIg3LaVbF6zzx9gVwPvVjfXRgnbH
         +mFg==
X-Forwarded-Encrypted: i=1; AJvYcCU+5//bOjkthRuDEq7rRks4K4jqG4Gf7ra0PmbpP8P3x10kYN2HcJqvSemZc0BcVZhYKTKn0+s7nHwqL+NL@vger.kernel.org, AJvYcCVjKwYfLDFFRsFICdtFHjHsr2+VWVU3I5kze8VX9vpXykovrwKkVsNXdbgTK5gqM8wwxgTQCjLk/0RJXzU=@vger.kernel.org, AJvYcCWxU7KwMm1IFv6oTsBcZEmwBdVUfG3U7u9xD/s66nd0uWKKPW6Szcz5wOJ1q6N6gKsxOXDhb6lBhbQW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw23c/1Epvr4ISi5geDbi32aonRIjMCyln3emsSqYyYGvMgfPpU
	3swkxiy4WmPXC/6nx+6MUnX4OT/yncEj1PsSBq1AJmoqNz+ARPdp
X-Gm-Gg: ASbGncsw7mefWo8bBCWwDvttcgad9yGDt6+CVXEky6UpkKT9Yoh5AtggacklHBoqW7/
	W0aO/ieDIe6Fhnh0rfqEn4OEDVzJZ1KIFUoiABIhjKqs7zzysQH33YdXDuk7vRNhJeH/4kOFU8m
	G/F3nbsXjbX2+2pMH1Ga/I12OGuddS8wBY+wD35TOLW3oEYWDSntgsPv1EHpNC3KrizyzJAlR1W
	SnfpXurnYqV+6xBPH6ShdcBbmSz0TBGXRbCGxHcWN3Sg+3Tl2Kcb5lI9ftOQ9L0i/RmHGY321F3
	6pV+nPgWzvxoi22zv17eNbnSFJLW
X-Google-Smtp-Source: AGHT+IEydEuTk0agw+AF9f8wYzDAN5oKuTWK4h1DVKaFvIYPrYzGCYHJkQgTkbLioaZGj3jOXXoyBA==
X-Received: by 2002:a17:906:318b:b0:ab7:b7b5:2a0c with SMTP id a640c23a62f3a-abc0ae1b6e9mr76032266b.6.1740092928857;
        Thu, 20 Feb 2025 15:08:48 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:48 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 4/6] media: i2c: imx219: pass format's code to imx219_get_format_bpp()
Date: Fri, 21 Feb 2025 01:08:12 +0200
Message-ID: <20250220230818.275262-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx219_get_format_bpp() only uses the code of the format, pass it
instead of the whole format to allow usage when the whole format is not
available.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/i2c/imx219.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index fcd98ee54768e..ad1965a91ae3c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -387,9 +387,9 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 	return imx219_mbus_formats[i];
 }
 
-static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
+static u32 imx219_get_format_bpp(u32 code)
 {
-	switch (format->code) {
+	switch (code) {
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
@@ -680,7 +680,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 
 	format = v4l2_subdev_state_get_format(state, 0);
 	crop = v4l2_subdev_state_get_crop(state, 0);
-	bpp = imx219_get_format_bpp(format);
+	bpp = imx219_get_format_bpp(format->code);
 
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
 		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
-- 
2.48.1


