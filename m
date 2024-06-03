Return-Path: <linux-media+bounces-12446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0518D7E9B
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 11:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95E65283564
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 09:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C180E84DF5;
	Mon,  3 Jun 2024 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Sdyff3U0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8516584D09
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406939; cv=none; b=BPZhP+E3M4wdVB2dA+hwbEdGmtevM91nLPeKr12V5Xdh2WWV0NqPmo5MLZSljDXLXCDwGOeWWPympHaFgxIL3uL1JbH6QxjLcVe1o64ER+CJ1s36KfNwA88SUgCEQs4EDzTwtibWjJQLK7WFQluRWjEo5DUF3+/bg0BFCIvevoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406939; c=relaxed/simple;
	bh=ExH1RE6J3JZqUHzT1HZoynPSJurb8BdI2ZdsEFrAr1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTfNYiTx2+0ObhVUG6x5kLce69yN2MuZtMdWIJ0ohuLRbPikoVhp463vTzcv3KSm8AVtKhC3GIAy/IFSW0lRYuV+7cKJ4WmaxIo9WHXvV8Ltgpa//IZb85lyRQ2XC1xmt1EUVsxE9+P2H6egXTIBswPm3sTTUDvkB25r+GiMYIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Sdyff3U0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=V8NJYfnjjH8D2WEiTjZz2n/d2672IqQpNfvAhuAj1sg=; b=Sdyff3
	U0BTaHQsInCDZHb8Bc6RezKDiKWcUl+GncS01OVtJJXemT86Zz4nJJ6z8Wtid6UW
	a5gPSRulJRF/feBG4xDzLHuowjSJOxwSt1x/+a2EyHG9aoYVm/rVatjP5ey3bWmb
	xY4D9dzyp+G76rEJhbAa9kwAewMGd43vOm/IHhgKZoWr2QlbvNooMGXMW6ajwNTv
	hT5GB5UOyj6O6MZD09GEEfyVNTZzGxpdmhul6iNLYN6Zbn9Yy/nUgapB3g8u6/nO
	3JTLagJbbT27B2TPx+rcftPLiloTndT2sdbeys9p7t8Ce9OGURCEdlWFeFgPnK/9
	NDNsZDeoOIewy0aQ==
Received: (qmail 1903301 invoked from network); 3 Jun 2024 11:28:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2024 11:28:52 +0200
X-UD-Smtp-Session: l3s3148p1@0WEe9vgZRtcgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 7/8] media: tegra-vde: use 'time_left' variable with wait_for_completion_interruptible_timeout()
Date: Mon,  3 Jun 2024 11:28:38 +0200
Message-ID: <20240603092841.9500-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
References: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_interruptible_timeout() causing patterns like:

	timeout = wait_for_completion_interruptible_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/platform/nvidia/tegra-vde/h264.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
index cfea5572a1b8..d20b7b9fb79c 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -628,14 +628,14 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 	unsigned int read_bytes, macroblocks_nb;
 	struct device *dev = vde->dev;
 	dma_addr_t bsev_ptr;
-	long timeout;
+	long time_left;
 	int ret;
 
-	timeout = wait_for_completion_interruptible_timeout(
+	time_left = wait_for_completion_interruptible_timeout(
 			&vde->decode_completion, msecs_to_jiffies(1000));
-	if (timeout < 0) {
-		ret = timeout;
-	} else if (timeout == 0) {
+	if (time_left < 0) {
+		ret = time_left;
+	} else if (time_left == 0) {
 		bsev_ptr = tegra_vde_readl(vde, vde->bsev, 0x10);
 		macroblocks_nb = tegra_vde_readl(vde, vde->sxe, 0xC8) & 0x1FFF;
 		read_bytes = bsev_ptr ? bsev_ptr - vde->bitstream_data_addr : 0;
-- 
2.43.0


