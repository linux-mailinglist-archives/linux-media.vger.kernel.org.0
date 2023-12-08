Return-Path: <linux-media+bounces-1982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5037E80A745
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A4ADB20D0B
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351A23033E;
	Fri,  8 Dec 2023 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YmZtA6Us"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170BCFB
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 07:23:43 -0800 (PST)
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B36DB66073BB;
	Fri,  8 Dec 2023 15:23:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702049021;
	bh=9N0swWfoVJntqQNSUCJQF364aRZyi/YUqtvJOic3SZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YmZtA6UsY/klCRz2AMHBbelCRwmqDFb3j4KPK0lE77FeAZNlK2XaMQW31sAe3uHrV
	 CCYppJBGsaEJE954q3M+Dms6rUY+OI7bydkYMtcMHLK/Z8gC5B4p4A02iuMjepUkrq
	 fqQHv68KIhTe/cQ2xTE/9T4yN35X71rJU7EvmhqEHBcaq9BuQXA0NiqapwzMgNg+mp
	 6og9QkPwmd8SklVWHa/OEgJeXbUUOf36Y1TDVuH1TBz6CCzna+WDdtG+2wuOfD2aio
	 JuCaXARvDk75BbXCRGZcFT5Oy37ikizaT83hfoWMghJegVP0Keg4Fn8JsR5c02V6X+
	 Cv+lngcSA+71g==
From: Julien Massot <julien.massot@collabora.com>
To: linux-media@vger.kernel.org,
	j-luthra@ti.com
Cc: kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 2/3] media: cadence: csi2rx: add Y8_1X8 format
Date: Fri,  8 Dec 2023 16:22:54 +0100
Message-ID: <20231208152255.472467-3-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208152255.472467-1-julien.massot@collabora.com>
References: <20231208152255.472467-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for MEDIA_BUS_FMT_Y8_1X8 format.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index b9356cc7a192..d24880e27607 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -114,6 +114,7 @@ static const struct csi2rx_fmt formats[] = {
 	{ .code	= MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, },
 	{ .code	= MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, },
 	{ .code	= MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, },
+	{ .code	= MEDIA_BUS_FMT_Y8_1X8,     .bpp = 8, },
 	{ .code	= MEDIA_BUS_FMT_SBGGR10_1X10, .bpp = 10, },
 	{ .code	= MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10, },
 	{ .code	= MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10, },
-- 
2.43.0


