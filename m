Return-Path: <linux-media+bounces-19175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EC89936A6
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12FA71C23BE7
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C0D1DED47;
	Mon,  7 Oct 2024 18:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYyiS4Ic"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622F91DE4FF;
	Mon,  7 Oct 2024 18:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326938; cv=none; b=VnCGkZwmG1bGe9BK3cmUTVWW+8C6rgGhO7hgpjCJBWYfynlX5+KHPGUWJYmlj5BJMJ4Coy1wj/R/PLHejqqn+P6lV1X1KO53t0lpOOwe8A1VbdoKZ76PStiUjg23rmNYzTAa7Ydrr8tVhnahzHerkNc3ZAUcA41CWcZFK0vvJ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326938; c=relaxed/simple;
	bh=riQB/ps7KNocNV/AUMqu2fP1J1RbHtnimUeTAOvwnFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8sPLEwXq0nYDqI9QEGRRarqQCbeasYOEw8cJ6TM5VVoS6dWxll8HkLpLq+Q/d5N8LBQnrGwnoHLwlF74fAHEo7MG0SrMP7tMMceBS9mNbnvdZjNxvNCm+K11LmsfSYIHEQo8CSp4AG/U2FgQ50XlCZbNUcJfopDV/EHQYpBGSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYyiS4Ic; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a993302fa02so296665566b.0;
        Mon, 07 Oct 2024 11:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326935; x=1728931735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPJcAbqbEoGBWHFkHsMcRX6T1qK9wGSCrUFWEpC9TBk=;
        b=hYyiS4Ic2wGmcW6anw1WbpNGouBk/F6hDJM7KI6LictmddTW+x20ut8Di94hILr5N/
         bL/mHpZzN7Q3PeFV/sKuVEv5fRgB8Lk/SimvmWm7lN6e2yc9uToG7xdZLQRusaEjStPe
         AqALPHUe3fW90MPZY7G9PN/xQwgQHSGcABxxqSItdC6ZOFc3OP+gRz+iujkozdBSCeMt
         FMMKPtRlfRCx8jNom52yZTdKcBk/JJA7xNbVdT0CIXr9Sc3GTBcuZIII4xaejLNvYuRt
         aXnFe3kCcUF0nwKSVihQo9iqNVctK9+zURv86SjihF1/UyhjcOUEH6lPG1PFFnETpCuT
         SqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326935; x=1728931735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPJcAbqbEoGBWHFkHsMcRX6T1qK9wGSCrUFWEpC9TBk=;
        b=LKpx9r7liIYmwpi/LUmI+S2mIMR43cJ9dJuwKzrOaKiah0sBp9K6u4Pm5qHFDxUE7Y
         D91qDJncUKO3eSaf5hA7dE8LXG+pnUTrib7esFtVY6I/NMSGn1ug2cRag3biGKrXsLF0
         W0gLhdBGtvjEEymFx1hJ+v5zNfwg1ZNlLVFRcrT1y69SPFqQ6Xx0iRq9pBejKLXWYiMz
         oNE95OPVKuxOeHpA48Cdpda9dbr+eQ1ZtG1GEZvn2bf3xvfnTwHZmEkYv7NGiKUFEDp9
         pS1t7mz7jrE7aWsikDNLw487QPtFH4//1Zmg5Y+Nnm5WapgUnvt8694+kHfjXRh7Ya9y
         89BA==
X-Forwarded-Encrypted: i=1; AJvYcCUg+iaB+wq8dabBMbXHypOE7jCwGltT5A1y3RKKTS1s8BJtzwZKGnqdJzsU75b0NEpjmYt2XXhCoZwjZbVOx2ch6jk=@vger.kernel.org, AJvYcCXC7Ny+PQBh5WNMzdE7KC7rEOBoGPnsQSF8Jnb4J58hvOEGT9Ps4dknxckuX1MZX62HTvKM0Wd/9EuKo/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY6y2nOHKOvMgIiGWqpF5RhXlLg18qY3TJc4oqOJ+w0f6fpcYD
	bicvUOjHE+mM1085RiQoC2ebaMXjm0rmDP1srH6jR+An5nBG0ubej9AwAQ==
X-Google-Smtp-Source: AGHT+IE4mqA1SJnJGSK52seX2mcpG1qGXYEwMr3ZgZh1f8UXb2TJKUZr14Myqrxu+Beq00OoaEbdRw==
X-Received: by 2002:a17:906:dc91:b0:a99:4780:1af with SMTP id a640c23a62f3a-a9947803f37mr703686666b.31.1728326934370;
        Mon, 07 Oct 2024 11:48:54 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:48:53 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 06/17] media: rzg2l-cru: Retrieve virtual channel information
Date: Mon,  7 Oct 2024 19:48:28 +0100
Message-ID: <20241007184839.190519-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/G2L CRU needs to configure the ICnMC.VCSEL bits to specify which
virtual channel should be processed from the four available VCs. To
retrieve this information from the connected subdevice, the
.get_frame_desc() function is called.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  5 +++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  5 ---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 34 +++++++++++++++++++
 3 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 174760239548..8fbd45c43763 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -31,6 +31,11 @@
 #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
 #define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
 
+enum rzg2l_csi2_pads {
+	RZG2L_CRU_IP_SINK = 0,
+	RZG2L_CRU_IP_SOURCE,
+};
+
 /**
  * enum rzg2l_cru_dma_state - DMA states
  * @RZG2L_CRU_DMA_STOPPED:   No operation in progress
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 700d8b704689..aee7d4ba70b0 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -18,11 +18,6 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
 };
 
-enum rzg2l_csi2_pads {
-	RZG2L_CRU_IP_SINK = 0,
-	RZG2L_CRU_IP_SOURCE,
-};
-
 static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
 {
 	unsigned int i;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index bbf4674f888d..7cd33eb1939c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -433,12 +433,46 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	spin_unlock_irqrestore(&cru->qlock, flags);
 }
 
+static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
+{
+	struct v4l2_mbus_frame_desc fd = { };
+	struct media_pad *remote_pad;
+	int ret;
+
+	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
+	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
+		return ret;
+	}
+	/* If remote subdev does not implement .get_frame_desc default to VC0. */
+	if (ret == -ENOIOCTLCMD)
+		return 0;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(cru->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
+		return -EINVAL;
+	}
+
+	if (!fd.num_entries) {
+		dev_err(cru->dev, "get_frame_desc returned zero entries\n");
+		return -EINVAL;
+	}
+
+	return fd.entry[0].bus.csi2.vc;
+}
+
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
 	unsigned long flags;
 	int ret;
 
+	ret = rzg2l_cru_get_virtual_channel(cru);
+	if (ret < 0)
+		return ret;
+	cru->csi.channel = ret;
+
 	spin_lock_irqsave(&cru->qlock, flags);
 
 	/* Select a video input */
-- 
2.43.0


