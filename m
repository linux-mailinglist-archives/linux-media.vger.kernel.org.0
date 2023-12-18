Return-Path: <linux-media+bounces-2539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E18F3816A48
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 10:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DCD51C228F8
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 09:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4761B125C3;
	Mon, 18 Dec 2023 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G9nAnGHi"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55456125A7
	for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702893400;
	bh=ZaIHHVqn+yVqhJs8ksXxj/gl+AZmRMrIHZFrHq0tXn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G9nAnGHiXk4ITYslYMhXjjODITQBLybjP2VDYuopc+6NcvwEYIoEr+wOvdSpHMybR
	 k6T9ev3qFKmYUdxwCwl236pI+TxVPJowbpNKqVh+sUpLwUtWyomBHSR/SaueEQDsgb
	 UTcc9ZABopsQ4Jv/1i53jYB8hi0cpY+eB6tgsjU7iQcvMg9pCcjsnnEafIn4cuXTja
	 5JV+kpwqfOZ7xtOaOTcSZYsGiIueLHozxqYRkBCGC3EeBz3S5GqvMtP6L+OqBrLftT
	 Y6yoiA6pb/WyMVULBSXXVaXrN3NvC5iq9uZPjQlzWhszojtY8AnvEm6K0png3ciij2
	 tHPNXh2nsoHSg==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D77A73781493;
	Mon, 18 Dec 2023 09:56:39 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: j-luthra@ti.com,
	mchehab@kernel.org,
	mripard@kernel.org,
	sakari.ailus@linux.intel.com
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 2/5] media: cadence: csi2rx: add Y8_1X8 format
Date: Mon, 18 Dec 2023 10:56:01 +0100
Message-ID: <20231218095604.1950737-3-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218095604.1950737-1-julien.massot@collabora.com>
References: <20231218095604.1950737-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for MEDIA_BUS_FMT_Y8_1X8 format.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
Acked-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index e83b877c48da..2ca4a8cde75e 100644
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


