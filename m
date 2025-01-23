Return-Path: <linux-media+bounces-25220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F209BA1A85F
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 18:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDE743ADC1A
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 17:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A41211700;
	Thu, 23 Jan 2025 17:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ORgy6gos"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDA016F265;
	Thu, 23 Jan 2025 17:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651889; cv=none; b=uH2dHqdc88qTSD1kJZ+ZEuJ35TeMeZ5a0eNjtJyTPJf4VuKQDn6SbDzVJ40ZbYCTUiYP0xobbIBEI0tlnDNTLafo2C8UvCVIHvP6juXlomfH8jjhIGW2gfrJRHUUA3ICNUKpklqh88JjhKcy+fydcd2cKP9ks772L0ftevTt3N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651889; c=relaxed/simple;
	bh=7LBi/BT+KVm+GtmM7OTDrnVrADDfpecaRpYCzrH1Cb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MsSsDagUY12JBI90CO4OLXQ7K+J7HM0Ej+6RlzLkDggTNv09ZVasD1UJfrp84Th5FLX+es44ddTgxS+lvdMr5747qn0AtEZ7HLLKeuj0HNnrvVqLFDE586I/hCNv2gR9KG+Mtn/j5jETC5+wy9quud6u6LPio3U1+z62ZjcqNQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ORgy6gos; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.103] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF0FC19AE;
	Thu, 23 Jan 2025 18:03:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737651817;
	bh=7LBi/BT+KVm+GtmM7OTDrnVrADDfpecaRpYCzrH1Cb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ORgy6gosWkqs9vKSa8oizks3NyPYQ2JTkuN4JqaWN79HSNbv3z/JeA0+BRJ22WAY7
	 9a5AEPieGZcn5WwxGhfW7IPe7oW9vTgLDIcioEt9ldhbAJG8h//A1sNUEtokPR6ZWt
	 Ln2XThqwT2hNccAVtYrroKnnF9kQOLmcq0xpCUe4=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Thu, 23 Jan 2025 18:04:06 +0100
Subject: [PATCH 5/6] media: vsp1: rwpf: Support RAW Bayer and ISP config
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-v4h-iif-v1-5-7b4e5299939f@ideasonboard.com>
References: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
In-Reply-To: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=7LBi/BT+KVm+GtmM7OTDrnVrADDfpecaRpYCzrH1Cb4=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnknalgZ/r23/85CNVGvxizArF3a83Mf10ipBn4
 xrk0sBPhE+JAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ5J2pQAKCRByNAaPFqFW
 PC2JD/9dXHHGELSh1NLcCjZhBYMkfQEFKMn+TQ5p2u1BbHPjFrxjnbfB+wB97DPco8fHESUEmuI
 fsJWinQn5SyKyb/+e7ktL07IBojXz/oq8XHohsW1L1MHnBBDsVhcz4fuX7lwUgsccFk/eSqHDbO
 cvMFEUmQtMPFrr3WFTKmbEccrsDdANsEMAL0v7ujc4E2QTVggQ6czQuwqtCO3mdhI869s8EZ8Hx
 Z0L6w/hpdiypwmTsCFnB0+nY6xNTusaYWCBZcws8Ah0vGIp6iqgmaoy6JH+AZGaAMnCEIeAsEJG
 GeQVDcZbu6GZXOr3c0fdmn1lL3VIT2ekx+q/IlWgwL6BDLKIj7aX0JEQ+GeAx6wOaH2GHKaUTVL
 Uc8pCh5Q1TRUEJzMFWKsL9Tuhw4WOJ5HEP+/Htkk4VzcjZ0k/NND8Z5yvPM9TE9L9Thlejf2RVT
 Yy+ycbV2cB0Noxmd3aiyFJ3VtJFX9UkomfpGvIYm8OaFI5X5Ea37d9B9n7xZSebZWldnXLg6YhE
 UOBCrVPU5/spq0op2BPHPp4NS0oNRFb+C5pc8VH4Tjqmw18qfx+Y6bWz1Djz1nRjIL3N7DSd2+k
 gBhrfyxhJr1idVEGMfYn5u14l9nByEdvTPberEwN2lYkvKODBpDz+cHKZXy5WhJyM8wsFMdY0g5
 I3hNmWGk1XRfKwA==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

With the forthcoming support for VSPX the r/wpf unit will be used
to perform memory access on the behalf of the ISP units.

Prepare to support reading from external memory images in RAW Bayer
format and ISP configuration parameters by expanding the list
of supported media bus codes.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 93b0ed5fd0da0c6a182dbbfe1e54eb8cfd66c493..75dde92ec35585825eb70c0faa31ff4cb1d4a3d4 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -20,6 +20,23 @@ static const u32 rwpf_mbus_codes[] = {
 	MEDIA_BUS_FMT_ARGB8888_1X32,
 	MEDIA_BUS_FMT_AHSV8888_1X32,
 	MEDIA_BUS_FMT_AYUV8_1X32,
+	MEDIA_BUS_FMT_SRGGB8_1X8,
+	MEDIA_BUS_FMT_SGRBG8_1X8,
+	MEDIA_BUS_FMT_SGBRG8_1X8,
+	MEDIA_BUS_FMT_SBGGR8_1X8,
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_SGRBG12_1X12,
+	MEDIA_BUS_FMT_SGBRG12_1X12,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
+	MEDIA_BUS_FMT_SRGGB16_1X16,
+	MEDIA_BUS_FMT_SGRBG16_1X16,
+	MEDIA_BUS_FMT_SGBRG16_1X16,
+	MEDIA_BUS_FMT_SBGGR16_1X16,
+	MEDIA_BUS_FMT_METADATA_FIXED
 };
 
 /* -----------------------------------------------------------------------------

-- 
2.47.1


