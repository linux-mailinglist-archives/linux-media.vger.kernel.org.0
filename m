Return-Path: <linux-media+bounces-15810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7830948510
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 23:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D90441C21D01
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 21:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4A816F900;
	Mon,  5 Aug 2024 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="b6vlhH2y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C5616B749
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 21:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722894701; cv=none; b=L9+IbRoIxK0aN1K/1gHG3lzHTnVUROJJ0QLO27g4crpRYj3YWmBS1iUrMdg3TCW3+lk+RmugnNVUtbNQfBevXZCht+mOnrMykoWAWyaa9r1PWMnTac+d+yh3IU0cagBh0SDRBVwHIXoMdckEFL9uydqINin4MNj10bmQGIa5EIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722894701; c=relaxed/simple;
	bh=LZYhrkyc1RQuEk08+xPPpf7DwI8WSA8aMxgUobeQYbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLLvrWWSX4TQ8HjDfn8gAvIeAKBZ+P8/b3+k/bfqv9TZje2kUnj43Ic4R9KGgbAv9lGlPpLlG9kVsrg4vk4H2CH8RdPjtH49DVAa+2m5FdPQfL9owq1InQwdT64xPKgBnpBt8xYJmWrXSkQTNBGjjmaBb+CKkohJEa8TjAodhpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=b6vlhH2y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=61SJjG4DfvMnVp2bdP5k8l8MGNPVIUcfz8ktix2R7dI=; b=b6vlhH
	2yWlciBzJOGLlQu2ShEZRtLn6f3vxwseDLhOn7kO+KytDnRBFVrAo9UYHUVLo3PN
	uETy3ClfqY28uXg8u73CYeE55reruvX00bJRskE5zp485rOumrq7jW4/suiQ0VWs
	Uxrd0MmO+5xGM/Ql2a9NGoyJN02QSNqqjrOHyZn8D/KxglnA9iEP3r0jbjFPJ543
	qJbbyJypcE0SclY9sKhvHKgnuoX24BOHgXH8RGoxX86N/goKnbfPyZ2vlTZgFat2
	8b3xTN+k5GhbsiI/7EbW+wFvMssE5fYglZslJOCfi20DevO3a3Z/HsZQKCAnG/NG
	jNKDu3VGmMqvvQcw==
Received: (qmail 18275 invoked from network); 5 Aug 2024 23:51:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2024 23:51:32 +0200
X-UD-Smtp-Session: l3s3148p1@x8AcrvYeAptehhYC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-media@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Reding <treding@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 7/8] media: tegra-vde: use 'time_left' variable with wait_for_completion_interruptible_timeout()
Date: Mon,  5 Aug 2024 23:51:20 +0200
Message-ID: <20240805215123.3528-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
References: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named
'timeout' to store the result of
wait_for_completion_interruptible_timeout() causing patterns like:

        timeout = wait_for_completion_interruptible_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the
code self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---

Change since v1: added tag

 drivers/media/platform/nvidia/tegra-vde/h264.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
index d8812fc06c67..0e56a4331b0d 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -623,14 +623,14 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
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


