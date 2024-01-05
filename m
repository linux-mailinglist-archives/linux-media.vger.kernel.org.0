Return-Path: <linux-media+bounces-3229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 815A8825070
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 10:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3100E282A6B
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 09:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8381F24201;
	Fri,  5 Jan 2024 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EhRaCwgJ"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72B423740
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704445250;
	bh=+ePzdhzVbybhbXl3OadLC3MDt569ZUzvku4bIw9dAfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EhRaCwgJKLU5odiodCLd+k6C+uWJovWEvVAi9QMIV1DyWr4zOYdVwupox3rxBr/7C
	 LTyCy+IlO43yrGH81msF9r8CvxzUYHqDQmbcIO/xUf9a4+bCtwU0QvoDWGIZNm8jmM
	 WKe4FYxDpAsU4dW9A3dMMNhtfg4YvXg2SJEh5/O2FrOZ75jqit/x1dp8BLDdikKuws
	 WIon4SFdWpgsEhwNpgwLpSC9MQVV69dK5n2UhvJLXpXNub1N2u6sLwpqZx8P2skKeT
	 7qukWHOJUwSwhYwNey8a+vTg68WzmOnx5/4NeKj6os7nlXtpktBg2I34dW9erMBpLg
	 dvGI9i8WNV1Ug==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7B51E3782035;
	Fri,  5 Jan 2024 09:00:49 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: j-luthra@ti.com,
	mchehab@kernel.org,
	mripard@kernel.org,
	sakari.ailus@linux.intel.com
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org
Subject: [PATCH v3 4/5] media: cadence: csi2rx: add support for RGB formats
Date: Fri,  5 Jan 2024 10:00:24 +0100
Message-ID: <20240105090025.1245112-5-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105090025.1245112-1-julien.massot@collabora.com>
References: <20240105090025.1245112-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jai Luthra <j-luthra@ti.com>

Add support for RGB565, RGB888 and BGR888 media bus formats.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 2ca4a8cde75e..aa08733172a5 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -119,6 +119,9 @@ static const struct csi2rx_fmt formats[] = {
 	{ .code	= MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10, },
 	{ .code	= MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10, },
 	{ .code	= MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10, },
+	{ .code	= MEDIA_BUS_FMT_RGB565_1X16,  .bpp = 16, },
+	{ .code	= MEDIA_BUS_FMT_RGB888_1X24,  .bpp = 24, },
+	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, },
 };
 
 static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
-- 
2.43.0


