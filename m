Return-Path: <linux-media+bounces-45264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36856BFC858
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 531A3188A9DE
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216E936CDE4;
	Wed, 22 Oct 2025 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qhec2zHm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4120A351FBB
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142927; cv=none; b=XpZ7CVx2NR/DN6leFS5hHLj+VhdRVtz1WLOjh6FG8iSTYqiUSBuFH5WTtU8H2YS3KSa/jQKkVKIEc4lV/SisHNhIZmnEyVEjhKcP/IA979aI2spjxA5p8SSMd7ZbAkq34nBbeH75DvXfsF3BNqAdTMvPHMaBWBFJ3JFoiyc9bEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142927; c=relaxed/simple;
	bh=DQG+inBx8ZXDHcXJybTvBi9O4BMU38YbAkGRkU7JaQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UmbUgP2ypjWZeDoLnaE/W0AZFJRe0xO5Tkc9o25wy1LJInA4Vx5ygrBjmxDtdY3Fwd8CaXh5N+sFFOTrs0ZggQuJEa6HCTtci44GZwRHvGpB7e/Ok6bP6O/V7CGcpOAPbmAFxyKl/w8ZFFz2c9BzQaPEByNo5jYUEzwRA/t0ayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qhec2zHm; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee12807d97so6410966f8f.0
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142919; x=1761747719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=Qhec2zHm/T7JsVU3osGmI8BQsS8DYjJwhZ2LaPla6qkzLZVXdli9geRpBg1hx3Km3Y
         DXAo8duRdrtM6bobPNMCnD/eqGrZ8/0NC53nil1Sh+8+DJTO4sCg6K4ACVLW8hFkse+H
         g34cUacGIVuq+U79Q7iDtKiH9H50MYwBICfseRsC/27lDZxCu0mcEBvQJBnDaP0Nup15
         XvPF82r6MVEc6kmp+It110/ikCxuFZhXN8I5DkJgQo2O82XxX48W7WLbKHsl/QcYoToK
         J44bFv6IZsARXD9yRY7Gg0ibCcNwUlHrU7qj8giUTJ9odrCeMrD+dIMhdWybum+HaP7T
         uqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142919; x=1761747719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=NvQPJXEOvzQIvruBdiIau6aEWiSkhcGqQVWCr7cunilq7OgjvtPCIJJ1SU2d8kJEFM
         TGPsvoiuyopJ6v5NoKTESZ1sPo98FYrLFiJc3xzPY5VJj8QBCGmc81klYrm7mHmnslz8
         IXYAz+2j2+6pzJN2cU125TgqC1R7OjZ4gwKoKmQ1Cfn/NSFvzOWerFgyPjRktIXUGGyA
         VvcCFM/Ta9w1aOjOSeKQgN1ZseDOwedbnP9lfGmEbyLBxo81E6+P0MC+c58KMAPYkYnF
         oHE2hkJbS1voodS7/x2NZIu63/hyHU54MJkEL+eqmWRIoE1FI5t7rTRZ5p/Dtn1yKnAP
         qKnA==
X-Forwarded-Encrypted: i=1; AJvYcCVuR71UXITcfcfKTJDZiB7sEwsCTod/oCcHy60kLw0Vnwd4eS71JPB8We2CUt+U6MekrGFJWc0kYVfFeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS9QdPsFVyDHM3sHBctkCq0aCJacGWXw+WzqgJpKKEnHwp/GYO
	tnlG0Obic4DuyZRXONuc0EK1HlqQjsQLAaf/KX/y8vG6PN52rxA0FDLu
X-Gm-Gg: ASbGncvZxMbBZo1gdxutqA4Ch4VbUiCEV31Jp09l3ma2zb5BGKQMdCev/RbhWYyHwUq
	mw/Fnz/snd/1gU4YkuV28dhw/jW4owKUM49iEjKGpYa1Zj6kk4xpohwEtsYJMBfU18DJMG9Oot5
	GP+UjateKWaHdcfyByA/ra/ZLSVqRDAY0nXsi3kj5HVZCEjhLHoVVb79PP99/w15d1sJNGsMJ/e
	OoDmkaJ7AndE7Ltj1XZ25Oh8h8MKwjSNHBBJLlaCesndbGiFp+z9JchM8It0pYMuT6A5GTVWf1X
	D0PN/Sxw/o6Eh6c197m7cmeEAApjjM4EFTrxcU2C0+h4dDYGetWt50wsHqS6wRzEHVsRtpNb3Ka
	WHUs0Dc0euNEkroWQf1RM0eMZ6dyhEYBMXpTl8nx56vnjwK7T2KbEaeIVnxm46RkfKvr/07YO6D
	Wp+A==
X-Google-Smtp-Source: AGHT+IHXd0IcgPPuddYC43FouBDl7JZ23qUq6zvhrCcNdJja7V9zzVEVqdzVMGBz5q8/P63zDQWKhg==
X-Received: by 2002:a05:6000:2913:b0:428:3fbb:8409 with SMTP id ffacd0b85a97d-4283fbb8df6mr11330113f8f.46.1761142918838;
        Wed, 22 Oct 2025 07:21:58 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 20/23] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Wed, 22 Oct 2025 17:20:48 +0300
Message-ID: <20251022142051.70400-21-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 0457209b789a..626f34543853 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.48.1


