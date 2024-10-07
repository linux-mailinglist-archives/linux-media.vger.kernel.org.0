Return-Path: <linux-media+bounces-19176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0217A9936AB
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A086B23A68
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FC71DED6A;
	Mon,  7 Oct 2024 18:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSmHIorF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2D31DE89E;
	Mon,  7 Oct 2024 18:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326939; cv=none; b=VflPQod7qQ/HfUWyJlwm2rbFz+h78OIES+fRXZ7JxLzCEiou8n8rR/j4BtY9F/lH/jkpzgpq0+UpxKnvxG7rzLUi7tv2fh/0rREsGZc15lGOxjjRSTjZvfbPq0CJiU3wtR2FwWarX2Bpdwrer5AJwCLQ7M2ReSdJJt8D706Www0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326939; c=relaxed/simple;
	bh=R4slbuQbnwLyRfm3Uh78TiH/6+iHc6Vpb7lHlAzHkVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+9rlNIs/meWR1rS8/wnRDuwe9mZ1m7zbmuTMPnIDChchfNMKfA+jN7BTbqXlKLfkVLcjTbGTh9F4olyt3qnW646jaEDGeHL+c6rGBtlbRpHUjg+PRJgav1bfkEJr9XzEvBgLcPT/2jkWnyfmdUL/ZD8wFFxsoHd/ZOGCu3p+xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSmHIorF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a993302fa02so296666666b.0;
        Mon, 07 Oct 2024 11:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326935; x=1728931735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDiX1yG/K2ux0bWDrdd88+XgQUgVwzcRTQU+c6loKrM=;
        b=mSmHIorFKBT2cDim/BZ9cCB3sOUxmXo87buT5jVgJCYcmtMzCvE60yunBtSsxojfeT
         txNMCJvYCrvFxrxYo3BnHyJ5N5WReNAKra/uaU6mmUD3RKXlHrHi9WJMhqTeyXsd0rC/
         nPlXaRtMjSbiSp8IwC4U8fqlZInIIpffMbN8Svw/hrd8XWJdTZdxJcDh7sW5A0depYAo
         x4w3fNQ8tnjmsbaBQ3fW89PnBooo5lAm/OZiugdMZygTHoO/HyaxfAAkoEcnRe3pT5Dk
         RUVskx4LDe5xRFHl4wRCqWc2CARO05LfhbVwjuZxtzt/McshT8q0GJjqUF6JpdM/y7Rq
         LquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326935; x=1728931735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDiX1yG/K2ux0bWDrdd88+XgQUgVwzcRTQU+c6loKrM=;
        b=ABAa5Ek3NQXzQMSM67HAG0semq4Ts73F0mjIqmccjKLtgTRQhW9RYNylYNEQeWZE/4
         49f3DDF+X+evLye99C0slAuUiXDluTbTIaOE1616E3qlAdkCs3+4Hu9D9lA+nM7gjwQX
         TregTOz5mHY5SNP6JQvhhkHVwwFPw7t7aZTTHrHIPY7vMUFEh9FLd1MnymYkddNH5pGZ
         NFkNYD5ldCMGJbpML+4wm0LornPV3EtZYRaid5zNxrX1RlIaZLsNVhw7PQDE8VuX73ko
         MsCvHP6TgA5f1+PlyYzTuQFgmrV/fS16uuFDm7G9aYjXJj9mCsXOfiqt3YQyQgFkbdj0
         L+Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUw/mBmp5puCWqD5zqo1Ek4jsJWkcy7zaGaOLiP16w1GiSOy5tsxD0Be93KzGS+GLmN6X2mZ2+qChy6V3M=@vger.kernel.org, AJvYcCXa2mg/4dnwvpi4929WVf310+Dv56w/opVbszTlTNKIGR4pGig92GrE7T66ENreVX2ONYY9kTVrGWGYCBBaHnQb/00=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb8ML7UfC3je9d2l0c5DqQeYohBfCMcHTJr5vfXh4i8aywXsu1
	P20tGk40treSUUtv5/w5OKQHseBzescgNeD8p0M7oApCvFRjxjPjwJuUlA==
X-Google-Smtp-Source: AGHT+IFH8rxA6j2sGotJUzvUqMblzrgM0r3cvwiPMFO0XBIe17I+9jjGsBulxWovTR06yhDlccvbiQ==
X-Received: by 2002:a17:907:60d6:b0:a99:4ba9:c965 with SMTP id a640c23a62f3a-a994ba9ca53mr689684566b.44.1728326935296;
        Mon, 07 Oct 2024 11:48:55 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:48:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 07/17] media: rzg2l-cru: Remove `channel` member from `struct rzg2l_cru_csi`
Date: Mon,  7 Oct 2024 19:48:29 +0100
Message-ID: <20241007184839.190519-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


