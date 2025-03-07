Return-Path: <linux-media+bounces-27828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C08A56513
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 11:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84B0018939F7
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A57920E020;
	Fri,  7 Mar 2025 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrMSHBYO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027E316DED0;
	Fri,  7 Mar 2025 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741343051; cv=none; b=DZJOEemBySoYC6UL0JntSsE6R/wW36EXdfmKwxT2+LfoxC2cbmjjWQINOW5A3WMTTnb1PXoS2c1i9u2YJdrNNgyTRBWiRKpOa+2AQY+pMM323hC3yFhDC1WJtsg8qrFcJI29y0NeDKOO7S6CqOoZVekJXF+ks1cXatrUEVmCCrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741343051; c=relaxed/simple;
	bh=2Dw4ZzZnDmhCYD8Y3MnylO37nujICIb8mg2uubPBiu4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SlPlHUX/6x9IZRzl7H3qtHM7q6OiSXvRuukv6GwxJExqeIckKn1OZa/5n3xj5GH355GM6Ux8v1lBNEwL4nxyA1DUm6PoQ46jzE2mXY02iLQnftY2yY1DROVTpcwfR2JJLbFn4vmf9ZZHmIyZdBxbIi7izdPW4ziTYAmyx5J5XSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrMSHBYO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACEDC4CED1;
	Fri,  7 Mar 2025 10:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741343050;
	bh=2Dw4ZzZnDmhCYD8Y3MnylO37nujICIb8mg2uubPBiu4=;
	h=From:To:Cc:Subject:Date:From;
	b=IrMSHBYOZYJEIiItrKzY86ihEbeitO2VuC+IAcSLeixPBVQWfMKJpMQJq5JqW+s9H
	 gzvhkD8xzIN5y3LOUMMkchDngZbx2s9tQ1/BsCs9ZnfuaBux4kGJ3ecjFsK57Jh+KJ
	 XGoziZ6pnVjyQ0DCaakSQlY3FqIjVb3bF9xPkqWuWuH1/QC0gggguJu+NqywzZ3KSK
	 XuCGF0KaIVkzFBNPzgJfYP2My7SQJBj9WI6KOcSPUiSSiUkXgbvGX1/I6YKq1pAHpK
	 IHQTMxp/7L9PEcaiJkCfSGD4+6yj5SVyLVmlpKc7sluGCnB4WnTXgG69yPtQBH2nHo
	 AQziHmOYgUF+g==
From: Arnd Bergmann <arnd@kernel.org>
To: Shreeya Patel <shreeya.patel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dingxian Wen <shawn.wen@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: platform: synopsys: use div_u64() for 64-bit division
Date: Fri,  7 Mar 2025 11:23:56 +0100
Message-Id: <20250307102405.56313-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

One open-coded division causes a link failure on 32-bit architectures:

ld.lld-21: error: undefined symbol: __aeabi_uldivmod
>>> referenced by snps_hdmirx.c
>>>               drivers/media/platform/synopsys/hdmirx/snps_hdmirx.o:(hdmirx_query_dv_timings) in archive vmlinux.a

Another one uses do_div() with a temporary variable.

Change both to use div_u64() to avoid the link failure and improve
readability.

Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 4ffc86ad6c35..438536d88c7f 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -296,7 +296,7 @@ static void hdmirx_get_timings(struct snps_hdmirx_dev *hdmirx_dev,
 	hfp = htotal - hact - hs - hbp;
 	vfp = vtotal - vact - vs - vbp;
 
-	fps = (bt->pixelclock + (htotal * vtotal) / 2) / (htotal * vtotal);
+	fps = div_u64(bt->pixelclock + (htotal * vtotal) / 2, htotal * vtotal);
 	bt->width = hact;
 	bt->height = vact;
 	bt->hfrontporch = hfp;
@@ -396,7 +396,7 @@ static int hdmirx_get_detected_timings(struct snps_hdmirx_dev *hdmirx_dev,
 	u32 val, tmdsqpclk_freq, pix_clk;
 	unsigned int num_retries = 0;
 	u32 field_type, deframer_st;
-	u64 tmp_data, tmds_clk;
+	u64 tmds_clk;
 	bool is_dvi_mode;
 	int ret;
 
@@ -418,9 +418,7 @@ static int hdmirx_get_detected_timings(struct snps_hdmirx_dev *hdmirx_dev,
 
 	tmdsqpclk_freq = hdmirx_readl(hdmirx_dev, CMU_TMDSQPCLK_FREQ);
 	tmds_clk = tmdsqpclk_freq * 4 * 1000;
-	tmp_data = tmds_clk * 24;
-	do_div(tmp_data, hdmirx_dev->color_depth);
-	pix_clk = tmp_data;
+	pix_clk = div_u64(tmds_clk * 24, hdmirx_dev->color_depth);
 	bt->pixelclock = pix_clk;
 
 	if (hdmirx_dev->pix_fmt == HDMIRX_YUV420)
-- 
2.39.5


