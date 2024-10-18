Return-Path: <linux-media+bounces-19867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 955A79A3FDD
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30998289AC2
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66738201029;
	Fri, 18 Oct 2024 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbVyK/Zt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7CC1FF61C;
	Fri, 18 Oct 2024 13:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258505; cv=none; b=uOclrvw8E86O+LEJ8W3hb7l9MycH52Ko6yjHtocxfsRA2vU3GkWZvoR7/ZVHU2z/h3guVENwpBezoalgjCxwM+Ig3la0LtEvU1UjYecByfRsScCC3I7QaEta8zXR5eHABbE1KlbLzM8FUXzpJwnEr4RFmluQUsZS3j4xFbYDKuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258505; c=relaxed/simple;
	bh=riQB/ps7KNocNV/AUMqu2fP1J1RbHtnimUeTAOvwnFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XTAErutNSl7rJx27rywEC4jgMT1cpntr6S4kruSgMiCvxvAOZIxdQHurYznDRicWqgU1jGnFtE+Qxdb3yYUc3oC0glWI5AgHaTFdB9Z719qOP/UWMh+J5jHlOlZicQIn2HciNcKR2aSucj/GXr7+XyBZl0E3Ev4BJJfrKup799E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbVyK/Zt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43158625112so19957025e9.3;
        Fri, 18 Oct 2024 06:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258502; x=1729863302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPJcAbqbEoGBWHFkHsMcRX6T1qK9wGSCrUFWEpC9TBk=;
        b=BbVyK/Zt0SmsCrvt324MvrqyIuoED88Xctn697wh9k/LLMPz54Fl74tZ/Jm56pDw1t
         7vFg1F/LC8IdMvQClvb5jZWmVoLY+rpTGK2PbVp+BP3stIWW9/Nsgm1wphuwcR3o9iYo
         G+49kjuM0DkuYAH7Es4svFy48Anjw9kJQL3pFIGq+IQ4mW62ZK0HYDjCdvL98t2Te+ni
         H+N6pM+WNo0fOe9i4AfHuAuC5jpBr7zfx/HvOlAYIIEi2UoRHzg9E7kl1TuOsYOWPBLU
         G3dtJfDHJH5XP93ETjbW2YH+z1WcAEBA0942xmP475waFVAMILdEzOmtKal13w/ngDDs
         7l5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258502; x=1729863302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPJcAbqbEoGBWHFkHsMcRX6T1qK9wGSCrUFWEpC9TBk=;
        b=qVVztu70GY4WjCZvsblkUZJvY2RVfv1YmLcJTLdU5wYp/hkcpdiEX01/l1uc9GxJFJ
         kOKYQGfkALitbI0gVIDwM31o2ylaX+ZwvF3g+xp3maD1lYKEhn+YSkJN9HuoWb0uequw
         JCtrcQbHAPbojPmmlaoDqF2gO1bq7AtXPliS3eOZUHZwRYtzarMg5Adz1YleqqxV4X8w
         T9r/Zadb1FQ1fbAJZR5ONnQZP1fgzaRp2A6EUzwiPAGjxO/BDDn75ZiPTA3Y1MYjVspu
         qNb1HjYu2RSM9vXJy/YkeQ2sfpL8Qa4FjY9F7h7x5DTYl3IH2VMGhJ1Dq+sRbW1EXwTr
         qPVA==
X-Forwarded-Encrypted: i=1; AJvYcCWlOtnIf7M4mRe87UsK9i27slqaKmLifchaga793WoPLCVSriq00MYxRNvPJGuBhikReUtgCq43r613TRD9hp+BxnY=@vger.kernel.org, AJvYcCXP5Gop5dj+h7kbFZ+t8rQvgn0KlV7Z87lHj3h72lYZprilVKOTn8wONViGSa+gQsL0tPzTKFIdd+rKHNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YywYvbETF2Wb09m2uj+qELLesbUllRk3xOMowo9KCO8e8Zu5YaQ
	OVof4IEhk8LzPGC1icTOW0j4VTC7qu+LpgLysBXJ9lmRFgRNWqzV
X-Google-Smtp-Source: AGHT+IGCIJ7fQT8myaKnPfVnZXWnBmyVNgmFxZAzpjbDb/rq5PNK2MlO7MbGZgTWzylRT5WNQ4zy5g==
X-Received: by 2002:a05:600c:1547:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-4316163c947mr17076615e9.8.1729258501505;
        Fri, 18 Oct 2024 06:35:01 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:00 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v6 06/23] media: rzg2l-cru: Retrieve virtual channel information
Date: Fri, 18 Oct 2024 14:34:29 +0100
Message-ID: <20241018133446.223516-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


