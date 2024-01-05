Return-Path: <linux-media+bounces-3227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDF582506E
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 10:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6519B1C2103C
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 09:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA42C2374B;
	Fri,  5 Jan 2024 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J5KYOjOY"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA86C22EFC
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 09:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704445248;
	bh=ZaIHHVqn+yVqhJs8ksXxj/gl+AZmRMrIHZFrHq0tXn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5KYOjOYtm7QxrPUOAhI6kf5FWPqhfkZwJQ0YRYLyq4KoQxkElBThVUvTjX3xtnx1
	 6MPbdBj4VdxFR1lZ47gkcN+ApjZu9eAqTf0Dh/6saVyVdCk+MaN/ywY89Qv3rrRz/g
	 AWHJjv9RM5OrWT64x4CbUg8FLa/+yMT6UyVRVTsupvBCpnyEs7je5KhktWOsV8D8Qm
	 QwDawM1H8MlB5N2cxs/m0zy1XlasCjdE967RE+Zrr40gdyx9GVweRPm+JRt83wWRP4
	 6jdSKLhavXkLMdXTcElhZnNGA5jsXWDf5WDr4nA3b0tkk0by5249xJx9fBqoAjyqmy
	 b4pQOIjTObDTA==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7BDC9378200D;
	Fri,  5 Jan 2024 09:00:47 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: j-luthra@ti.com,
	mchehab@kernel.org,
	mripard@kernel.org,
	sakari.ailus@linux.intel.com
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v3 2/5] media: cadence: csi2rx: add Y8_1X8 format
Date: Fri,  5 Jan 2024 10:00:22 +0100
Message-ID: <20240105090025.1245112-3-julien.massot@collabora.com>
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


