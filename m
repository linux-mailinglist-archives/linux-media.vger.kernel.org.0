Return-Path: <linux-media+bounces-19876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B4B9A3FFA
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E97F284D17
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5459420409F;
	Fri, 18 Oct 2024 13:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MY1A5Hgx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF039204020;
	Fri, 18 Oct 2024 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258517; cv=none; b=Qi6hR8Xmgn4gFGNbgkjovgGDIa+BUlbzHh3LKgIHy206raL9w3sbKi3kgjg7ARfqCYolJCm9+Zwr+7os2dGHOQCbKWdbsypFpFaETYGgrxYKLkCRLRXM2vh5gMDxpiClYdcHJeTmzsRubd/6lHT2jsxyOoJJpXOWhuNVwvSPUrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258517; c=relaxed/simple;
	bh=thXl2/TczZGuXsqW1hCg3NABlmoFkFxqDMk3QB443UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAvj7xJmrq6eLmSjuOCSU+0eSfoFdeRx1hdmYkIymppEyM1Wf2oj5extr0vwNTuWxKtlCTVXh8npRlj6VLjsOaGj58RyYO3aI4hKxk0h2PIPxnaoYJSLaNVclTQlXK0ilev+3nMxm1LGMZ6xNcQozYxMJOAvR9dxWC3WM2l8fZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MY1A5Hgx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d4ba20075so1596186f8f.0;
        Fri, 18 Oct 2024 06:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258514; x=1729863314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liSecY/iWyb1X6LpZ5dLf6/KtZZR3s29c8vcS1XDL9E=;
        b=MY1A5HgxEArpCY6L8K2eN7LZ82tQ0MWXQQOpjaQOw0ElnypmmEh01xEXWb9B4gRQXi
         laAxSDM/0Na4D38XPowB+SSF/IDcfife/8Fla4DfmwtXdV6hr1pr2sc19OWQPC48AmxQ
         FsdU83YB6coKQPnTT36DwHs84BdWfkKvY3YR3Zc8yegq10jkAhHIt/cNwnsgBaIdtmnC
         OR3zL2nX5u/WYG0x7sARPLAOmbJ7zip9COMmEg6PDwhC3Da9vKB7W+ZTrEJMDP/Z9TLx
         VRkw6IoATnZtrSq7fm3UdpLKd10b+Gb0ZlAmWHdqsZNWstVCzl1U0jvZUvyh15gjy/gv
         0Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258514; x=1729863314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liSecY/iWyb1X6LpZ5dLf6/KtZZR3s29c8vcS1XDL9E=;
        b=ZY8ret5Ghf3RomgiHQ33XybETaLDF0Jsonyab8oWccJdrVRz1Nj+SmJ70SMROX+Id8
         c/U7BmHlOiSHuPmF3h1DsIna2ZP+rXOySR3dWosvIqJ5PEK7136bZx3zP/j4hcc7fz1V
         3yxrt8ZjroE6VhQ2AliZQDdKFP2js8EiyFdLVnbzujefvijBKoX0ruiwV0ES6ByT1jGK
         2NEiVRs1VhQAVY7ESZOVdUsj9k7ZxkHgVOpY71yoYTjqXCyw13x6cUhAQ+VOyGOiywZa
         LqUU8qfc7lY2ON2/6Qj3errwpcRGGUrIjhWP6fD6cVzT/kK54hvIJlCbGtCth3yIm4NL
         kQdw==
X-Forwarded-Encrypted: i=1; AJvYcCXba5PzEFnQS2qp4wTb6besfuyQtk4aBg+BorRFw7waL0BVFwHZQLl1hHfewdsiV4PT7vn+Uolow/i+mR8=@vger.kernel.org, AJvYcCXo5VeiA4q84rQS+3Ol2lv289X3HNA42aWnf0ffpbiEhVgKThjRHF34zm91qjekcZyr/V1YJjbERM2dwlW5VJkpRMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCHns/et6uhC6Ia5rzcFSG0DR4K5+PC5W/4A0fzTT8WIG5e9P5
	DfhSBAggX5BXmTlTncL97wfj2w7U+rICUzGD++WTPRIZdyYqd2y1
X-Google-Smtp-Source: AGHT+IF85UNxOEJJfAsBpcXrcodNoSc9yv/7LgqHzFQ814R2FDOorlgTwf0UMegKnMZzcXQ7MbWeSg==
X-Received: by 2002:a5d:5310:0:b0:374:c31e:9721 with SMTP id ffacd0b85a97d-37eab6e49d5mr1821339f8f.42.1729258513743;
        Fri, 18 Oct 2024 06:35:13 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:12 -0700 (PDT)
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
Subject: [PATCH v6 15/23] media: rzg2l-cru: Make use of v4l2_format_info() helpers
Date: Fri, 18 Oct 2024 14:34:38 +0100
Message-ID: <20241018133446.223516-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


