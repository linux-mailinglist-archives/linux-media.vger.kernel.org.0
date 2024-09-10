Return-Path: <linux-media+bounces-18124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A73F974143
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96FE71F21C5C
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5595A1A7AE4;
	Tue, 10 Sep 2024 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fksq4a2C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DB61A706A;
	Tue, 10 Sep 2024 17:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990868; cv=none; b=TrrqOuTiE2HU1zRlaacRStDXc24VSaJE/NC3VMVgFZ5GL4SzN9EoB1f2XfHcVLOhADUX56iAj8JViBKtiN7VgTWDKW2M4RORoJDQKP/5NPSzyXIs3pt86lOOEZNr1fptz3OuyV6bgfIZ+Nxm3x4iB4ps6Tt40AauRGflcUix/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990868; c=relaxed/simple;
	bh=rMVzxUxmL/AfHPz6X0c3/OvL4+N9WTRGjvnU6CFagwM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MZmGhUefWP1jEJxaAIabfNM406GK212PbIqIDmh3Lrk19EoTtf7uvuI1tecghiCy6EhD5jWVy/+yim8rvTAL6Ao/nPMPViyENZgcANmnG/7JBw/atF6PtpKewXB4Eg/hs5PsqIGRSu74Koexxz6fikvmsaaGHP8nxMVY/hdYmuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fksq4a2C; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428e0d18666so53814545e9.3;
        Tue, 10 Sep 2024 10:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990865; x=1726595665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqTUaY459686Xh1e9Gh+LVLup4oplxjhdBIU+XZ0cUo=;
        b=fksq4a2CAXctcHXU/E6SsHZK3Xp/O9a9rmgkbQD6rGV+S/yelzYGEnPdx+D4cKf8kF
         M2ymwkTkm6BGBd368riChVkE3brUs6bd5zpApb3yVxv3kYp0sRhKha5bPvxo/NbzKhq0
         POiOqqHocCxFVg1/3Zg2y9byuuCtZq90jZC+52C0XbrZ+O5lQwV+NEyasw74qDtH1TJN
         vtXtZDN45zmduIFVSjK2pKBJjg+LEuDoz7LopQrEtmUcIPSoOpr2aDgIfKDCiyetpNYJ
         PnTLHNJnpVKNk8db80HJchkfeI3Y1R5RTh/j8ssFpUXFsfHKu165D5zA1zKDitGf00PE
         Q7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990865; x=1726595665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqTUaY459686Xh1e9Gh+LVLup4oplxjhdBIU+XZ0cUo=;
        b=IQdYaQ4HcaF60Y0M7IKeG57WmeG13m7O45PDOEXzhtbPNWO8uyFr2NmLu+aAXw263C
         nJIXWX/ZruE+91xkvemW9PMpHcsJHUc1pkQ9ilblFikkI9Oh+BFsyh8OhHo2vDKHsNfu
         RMhXAnEvzcy6t45vrx3J4oXhRtvANQLryF86INh7S33SMHBU5wuBp0m8F8vnYC2DU8er
         xZrqYwTcKdKcDYHo9Rkzy1R69Lmk9vDz5o91WL3K683uSKtuPpbsHBTwzKGo4eVi03S8
         sSG9udLYsfSSZaXQhaJC1mPCp/IZnl7OLob+bJc2C8eMb9hOq2KOx4UmTk4pLArff3QO
         XeAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5XZALpQ9awF58z/mdpvtIDwfippQrLOvC+8IoAgoprJULUvMVSpBolKVC35L7USrDBNDpG/j905vGi5w=@vger.kernel.org, AJvYcCWT2ssk8hT0AZLoD3hHSDCufHeV1tnvb3yH1m1ahN1j6TEMxM3239aCC+MRGpC2m/xwCuFmnVawEjjwXOzGHQvtmWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbUzPD+oVZAfHuJBvNJvx0I9gBDZpA8eCiqwG70rHd6vVY5T1j
	3A47AS31QCxQo/UAgYT/nOjjD77RrDWmpd2WAEBiWA8Ubq8bVDDD
X-Google-Smtp-Source: AGHT+IEXcvS+bqWHFK+ARpO2uiWOe9AiWkU0x/NXXsTxNqdUUdoodohpICX3TzTI1JsKW9e9dZAD9g==
X-Received: by 2002:a5d:6608:0:b0:374:cbe8:6f43 with SMTP id ffacd0b85a97d-37889600838mr8903475f8f.33.1725990865297;
        Tue, 10 Sep 2024 10:54:25 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:24 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 06/16] media: platform: rzg2l-cru: rzg2l-video: Retrieve virtual channel information
Date: Tue, 10 Sep 2024 18:53:47 +0100
Message-Id: <20240910175357.229075-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index db48118fc817..75c3c4f1d10b 100644
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
2.34.1


