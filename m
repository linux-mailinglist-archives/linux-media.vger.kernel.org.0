Return-Path: <linux-media+bounces-19463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5C899AA42
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B6DAB24E0F
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E5C1D150E;
	Fri, 11 Oct 2024 17:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4JohYb/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDEE1D0E30;
	Fri, 11 Oct 2024 17:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667880; cv=none; b=AqXJpJqMZNhLFt36lXWCnmTGbYJc5J2jrGx1y4idy7ywTs+ELbyS9OriZcOeaENcCy67C5hzfaIZ/F+TD9/0e6fR4OzRaQSCP9sf2oOxgc499/FSXZO7X92FO3EHNuE+jp9S7j7YmQR00ilAJ0EhBFIALlBRrEeZpPimSyFMBxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667880; c=relaxed/simple;
	bh=XhamZKYuM0y79EZK77oBjUQjUsabnbMGOLSH3i3PDAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M058qqqml9ESalJRry0CaG3LdsNHwHDMILcdNuHvpGTVZxQQIBegohkxOUZlgsVideSxWjfvHzwYS5x8JgVXHQEu59xVc9oCqotB/0KNLmSStjpDLsy9+9Qx+EHMpvf1piLniKjOAAsp/IFbyhupfTJG1uBokRO1+Cwd0zzrFKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4JohYb/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so1319095f8f.0;
        Fri, 11 Oct 2024 10:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667876; x=1729272676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVOFkLkwo1V9dWZHHxyVDhi2i35wgRZJzR7V957XBq8=;
        b=V4JohYb/N7AnzVVaAhkjUu0qaFun4mAAlpEl20+1af+dIGJICKSgLDmkfXtqUG+wGw
         KwvelbR35R/kTog5m8ywC021lsv3U+zoySmRxZD4aoTvE9pq5/RmlsziP/fF4lwtZTaA
         P+QLcNWcIzwJ9KglN2Q3LsTY79+u/JPzXvFaFf9qKIniE9wvUWD00NIaI4Ll9p/IjyMC
         rZlvuYBMsw+9ceNoSwx+dUSe4t1hdaHYsc7V+3etu5+F7lQ04MKWrGCVu8W3r4BFfYOo
         FXPD1aHzIwLuYjPC7ajuTpFnu6wjmC0LWIhFVrRQmgdBhGVBYLjXC08PERbSRchoDVnP
         r1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667876; x=1729272676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVOFkLkwo1V9dWZHHxyVDhi2i35wgRZJzR7V957XBq8=;
        b=qrV9tXsfKc84iuOEzP6AZAjsMwmJ9C/CzRi+AzRzjkAlEhO0tPWRTatXUCVxT8texo
         SI0kGzPdFpzguqjWaL3SR04doANqU2yYk5xCozj62ggAxWW3ZRY0uIPseLAmkiX8JxiZ
         7VVlsKm3/nmFsI+Yl1FzI0cuxHFzw4IWyI+dtYQNw8v98L7Bhr+fM2t3RFLNx94TiC07
         GvDyQbaWJSAb+9VVEPDhUsGME5q85QtudyujrkmKogAaQruHGgLaWuh9Ijlo7K5E7GO1
         IhFHH42BBXrO04ZHm5X3jl9vpDgxORlCYJr93bh5pTFY7JUS5DrDGOvgFD0Fp6V/krSA
         5KZg==
X-Forwarded-Encrypted: i=1; AJvYcCULoJJs7RcvtO7eRqnumqzb1EX7tNAcLZWMD2drIGhkoZ3Rw3MB+kGjg7LNLX6MyrvV00KbjPop2YtFtf8=@vger.kernel.org, AJvYcCVbyzrwb/jiIkjXj7k5S1nckfpqI36wqmTiMNA+1zkjiKQyaF0dfK6BMUlxnHoFvCWFMhI/OxFtemCWc+bLxi7UBgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxYfe3RMITV773LJqbULXpfuFhnIqjiQ7HXfzhlrNN6SvWqTZK
	Bx4q1hbVFeSqhR/hkLypF62rpNv9l0xIIdbM2XvVpqBc+UlnZELI4K2BDA==
X-Google-Smtp-Source: AGHT+IEtOoR0J9DrRo7UrsG35o5aKXvbr3xxAE1cUtHAgDqNSZtKtMtbq8pz/a4ZNgvpZAbZiamH/Q==
X-Received: by 2002:a05:6000:128d:b0:37d:4332:e91d with SMTP id ffacd0b85a97d-37d5529f8f0mr2597260f8f.52.1728667876439;
        Fri, 11 Oct 2024 10:31:16 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 15/22] media: rzg2l-cru: Make use of v4l2_format_info() helpers
Date: Fri, 11 Oct 2024 18:30:45 +0100
Message-ID: <20241011173052.1088341-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Make use of v4l2_format_info() helpers to determine the input and
output formats.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 22 ++++++-------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 8932fab7c656..0cc69a7440bf 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -300,21 +300,12 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
-static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
+static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 				 const struct rzg2l_cru_ip_format *ip_fmt,
 				 u8 csi_vc)
 {
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
 
-	switch (ip_fmt->code) {
-	case MEDIA_BUS_FMT_UYVY8_1X16:
-		*input_is_yuv = true;
-		break;
-	default:
-		*input_is_yuv = false;
-		break;
-	}
-
 	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
 
 	/* Set virtual channel CSI2 */
@@ -327,19 +318,17 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   struct v4l2_mbus_framefmt *ip_sd_fmt,
 					   u8 csi_vc)
 {
+	const struct v4l2_format_info *src_finfo, *dst_finfo;
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
-	bool output_is_yuv = false;
-	bool input_is_yuv = false;
 	u32 icndmr;
 
 	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
-	rzg2l_cru_csi2_setup(cru, &input_is_yuv, cru_ip_fmt, csi_vc);
+	rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
 
 	/* Output format */
 	switch (cru->format.pixelformat) {
 	case V4L2_PIX_FMT_UYVY:
 		icndmr = ICnDMR_YCMODE_UYVY;
-		output_is_yuv = true;
 		break;
 	default:
 		dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
@@ -347,8 +336,11 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 		return -EINVAL;
 	}
 
+	src_finfo = v4l2_format_info(cru_ip_fmt->format);
+	dst_finfo = v4l2_format_info(cru->format.pixelformat);
+
 	/* If input and output use same colorspace, do bypass mode */
-	if (output_is_yuv == input_is_yuv)
+	if (v4l2_is_format_yuv(src_finfo) == v4l2_is_format_yuv(dst_finfo))
 		rzg2l_cru_write(cru, ICnMC,
 				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
 	else
-- 
2.43.0


