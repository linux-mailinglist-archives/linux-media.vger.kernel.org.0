Return-Path: <linux-media+bounces-19455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4867B99AA27
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 664741C25BDD
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8595C1D07AE;
	Fri, 11 Oct 2024 17:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5GnP08O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D851D0485;
	Fri, 11 Oct 2024 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667870; cv=none; b=KLjpx+n2CJ9KizXaQkYWnbUU5efapq1D/hUpHe9DaGukw13SJx3NSr02gzEKfyjT3Lc7DiS/TGHS3QWqgtWjhV28bKZ4zqv9CsyEtzmlXq2WDB2/PKco2HcX+v8qPOZyVS+WnHnRXZ3EnDSmxLbWvCv2DMQP6ntkd3AVaI26LkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667870; c=relaxed/simple;
	bh=R4slbuQbnwLyRfm3Uh78TiH/6+iHc6Vpb7lHlAzHkVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OB6HnRZbdKrfVpWGx9XOj/+oXFkAkOn3rgyKnoF/+dZ4S6oInrPD4LxXZTVl6bZMALaIc76tv03aKQ3K0IdBWXSI0XvR6XYzJcAQ6+f6/URIlYP5wVT5TlWJ7rmEmzeFsFPrrpahyDhnlvjGCUET0prsgHmyLsChtwCbO6rN9Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5GnP08O; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cae4eb026so20696915e9.0;
        Fri, 11 Oct 2024 10:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667866; x=1729272666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDiX1yG/K2ux0bWDrdd88+XgQUgVwzcRTQU+c6loKrM=;
        b=T5GnP08O/73wX+xzVa+J1GpRpTJ3FtRgBZMDzzKgnKmo/nO454BmC5cNgxw18RFqB+
         5I8ekAlXAbXK/5Jg82UWW78SWQz2AtNOGLX0S6uAwp53UdFc1brBKqqrShGG1ftCeY+N
         j2FVyjOvy881Iq5YNdD1ZLLuD5r3AYH9JpipHy0fH0eTfMMfWJruHH/E7xfcyBbV4A4O
         QJwvuWoNe2XXWxlpet1JJs52ee+FIwUBsK36rM2pYMGOG42hTZvRJ0Z2vD+9Eeo3v7SN
         +pRMOEjgjpdj5o3kcBBaJJKCtSs/UTdHL/Od572Q5amAK64jSrIwSy4Dv4n9zGQ7Dger
         9//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667866; x=1729272666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDiX1yG/K2ux0bWDrdd88+XgQUgVwzcRTQU+c6loKrM=;
        b=tekQhKhtZVYQyYRICuVfAQ1jhN25r3aTspk6CVz4mh/UKSsIILSHgAp0rx3jGMZcnx
         r8MGTti2bCuYlxLpFhhOuj8w2eXA41WAIQKpGRqLtZX8i3/ZV1UwKs5zOnxZwqHz1MdV
         HyUQyTsCvXULVQb05SGDvgArcioOaIAHhTJr4W+0en8FllY1+eBLljfQXatUsk2LfxvB
         Dfev3XkN4ThcHYyohxhEPd2tFJDHcbJ0Im7XRkYopp27QNbPaaBMOe5K8y4TrGF2aP5h
         +J9vvJXpIDwbK+7riULTtZKTgzHcNO+HTV784NOfriAU/KW/pKri0kodKJWNhbx/vsBJ
         VpjA==
X-Forwarded-Encrypted: i=1; AJvYcCW+JLQQSkt9N6ADiQfCXh5J1mxC3ZYqUZ6tRoQCfPQDRuqk3HF3qQJJWOUwKuGOe1jLgrtYJBbJJ4Zwk/c=@vger.kernel.org, AJvYcCXXGUX17Pc9M2JO3ZNTjtKpzpnoBKNWd7lIE5rTffETmsK4PGPpANL0uLPUtsTpJN0KMrbKidXzjs/A/YLIXBOMjp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFgLhK0GkSaqffLV2Eonyy0lS9U8cVw59gW52bwweUGaTgDGLq
	Z3uGyznvlL3PSAgh+L97gg9Pr5Ll9vPK4SzOuv2k+KpkRtacvE2l
X-Google-Smtp-Source: AGHT+IFyeWXUnEjKsNs2TEJWFOSpiKdRXIZdD+wp3OsMh5rnvvhrHwzXaAEwTgOCEZINTWtzeQEg6Q==
X-Received: by 2002:a5d:63d1:0:b0:37d:4ebe:163e with SMTP id ffacd0b85a97d-37d552cccb6mr2688302f8f.53.1728667866417;
        Fri, 11 Oct 2024 10:31:06 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:05 -0700 (PDT)
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
Subject: [PATCH v5 07/22] media: rzg2l-cru: Remove `channel` member from `struct rzg2l_cru_csi`
Date: Fri, 11 Oct 2024 18:30:37 +0100
Message-ID: <20241011173052.1088341-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Remove the CSI virtual channel number from `struct rzg2l_cru_csi`.
Instead, pass the CSI virtual channel number as an argument to
`rzg2l_cru_csi2_setup()`.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  1 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  1 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 ++++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 69cd45b26951..b21a66e2ce5c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -72,7 +72,6 @@ static int rzg2l_cru_group_notify_complete(struct v4l2_async_notifier *notifier)
 			source->name, sink->name);
 		return ret;
 	}
-	cru->csi.channel = 0;
 	cru->ip.remote = cru->csi.subdev;
 
 	/* Create media device link between CRU IP <-> CRU OUTPUT */
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 8fbd45c43763..4fe24bdde5b2 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -53,7 +53,6 @@ enum rzg2l_cru_dma_state {
 struct rzg2l_cru_csi {
 	struct v4l2_async_connection *asd;
 	struct v4l2_subdev *subdev;
-	u32 channel;
 };
 
 struct rzg2l_cru_ip {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 7cd33eb1939c..9ab7ef33c9da 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -301,7 +301,7 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 }
 
 static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
-				 struct v4l2_mbus_framefmt *ip_sd_fmt)
+				 struct v4l2_mbus_framefmt *ip_sd_fmt, u8 csi_vc)
 {
 	u32 icnmc;
 
@@ -319,19 +319,20 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
 	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
 
 	/* Set virtual channel CSI2 */
-	icnmc |= ICnMC_VCSEL(cru->csi.channel);
+	icnmc |= ICnMC_VCSEL(csi_vc);
 
 	rzg2l_cru_write(cru, ICnMC, icnmc);
 }
 
 static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
-					   struct v4l2_mbus_framefmt *ip_sd_fmt)
+					   struct v4l2_mbus_framefmt *ip_sd_fmt,
+					   u8 csi_vc)
 {
 	bool output_is_yuv = false;
 	bool input_is_yuv = false;
 	u32 icndmr;
 
-	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt);
+	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt, csi_vc);
 
 	/* Output format */
 	switch (cru->format.pixelformat) {
@@ -466,12 +467,13 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
 	unsigned long flags;
+	u8 csi_vc;
 	int ret;
 
 	ret = rzg2l_cru_get_virtual_channel(cru);
 	if (ret < 0)
 		return ret;
-	cru->csi.channel = ret;
+	csi_vc = ret;
 
 	spin_lock_irqsave(&cru->qlock, flags);
 
@@ -489,7 +491,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_initialize_axi(cru);
 
 	/* Initialize image convert */
-	ret = rzg2l_cru_initialize_image_conv(cru, fmt);
+	ret = rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
 	if (ret) {
 		spin_unlock_irqrestore(&cru->qlock, flags);
 		return ret;
-- 
2.43.0


