Return-Path: <linux-media+bounces-2542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DB8816A4B
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 10:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC0C91C22902
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 09:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E8612B8C;
	Mon, 18 Dec 2023 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BXgFHurU"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9F6125BB
	for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702893402;
	bh=QAyp3vYFz0iU6e6WZyang3wOQzCJB0GP8scTt/jp+vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BXgFHurUW8drPbogi6EUvbMRH/Pssr4kCi2j0e/TW/GtDq45YPMGZuPQ/4bPLq9oC
	 yZNzXrZpaIrstpHkEYrqghAAO53cY/smedF+rfD86/tRDIUlrzwnApoogyqxW/mCpU
	 DDGxC7N1nany4tABJnw0jbXA73dtBHuoDFLVDi1w6JUMND9aY6m6IWd+DzYWuxyGU2
	 LIIEmGHN8XZAGeDXWK5gdcBmeTRNC5h3+38YMaLgbYkkhqInkUwLwQ4mcPfcKACWdU
	 cj+3Nmnb6Ari1N9E0UL0fGpqHimIQWdLvcRtSQ/osdgvwLZr6bDvrQOM1lapOFsSZI
	 kXAYI6F3JXGMg==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7B9A137814A3;
	Mon, 18 Dec 2023 09:56:41 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: j-luthra@ti.com,
	mchehab@kernel.org,
	mripard@kernel.org,
	sakari.ailus@linux.intel.com
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 4/5] media: cadence: csi2rx: add support for RGB formats
Date: Mon, 18 Dec 2023 10:56:03 +0100
Message-ID: <20231218095604.1950737-5-julien.massot@collabora.com>
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

From: Jai Luthra <j-luthra@ti.com>

Add support for RGB565, RGB888 and BGR888 media bus formats.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
Tested-by: Julien Massot <julien.massot@collabora.com>
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


