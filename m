Return-Path: <linux-media+bounces-43927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE5CBC3AE7
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 09:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E37904F8BC7
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 07:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3112FC024;
	Wed,  8 Oct 2025 07:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fU7By8IJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27692FABF8
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908712; cv=none; b=KzCFmWm+RsC0nu//ac7WZ2qNf7G7hZsk8SK9x5pLZ1k5R0HgF956DBzE7tvTHA4UMuNPjQsabJ5pH0HtPY2/vnpvuOx1cT3y9UU3Z8nf4WIjNV2GrJiRrVIDTzkpCTdYjemP4nNW2YO3OqjqTewfBwKBU+rnWkaWo+Gw8erM6nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908712; c=relaxed/simple;
	bh=LMNj3RJtvSAolKc/cNyymmQWeXKMjtcs4eYn8DUf4jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POzjCXeDi4xqc91UnCudxyEZ4jy7jYFaEpS11QeUTZ2x3UQtjA2L+AVWNqxoYyojD8G2GJqmRJDUwmGEbg/LTJMyAKnJHw+Grmz3HM6Nz2Onv5u7nmriwuHUpwLWYcZM9/Udlb+EIHI8XyLyWnWeKXira8ZSAhi/ew/G/nxVK5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fU7By8IJ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57b35e176dbso9053489e87.1
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 00:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908706; x=1760513506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
        b=fU7By8IJ7Z38ZZ160nZFh8txVIOZi5d2XijmE9R4LTxngADYF/8P5QtHwI/TiChlFs
         d+acG437BoZc+5LUb1EMbOu3b/iRBi9yZjxweHRoLybIKxX9GqvHiVJBZHFly4v98oOK
         HYp1sLXz/N/w0Mgg3JmLkRaiiYjrt5Lyo27EDslG5sc1cdaXzNdGNdPayvlXeHwdTYJL
         ndVuHl04W/2xoESt1g+/JzAPDAohH2zc+f1vFMDExExSmeRcGlDLwLFly/SrUvCMoueH
         BZhwGwH0G0ltE9l/slZRPCzh/5Krv6f1IUT8KCspFIot8ZOWle2iF3ctV1RTdaGLCnc6
         Xiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908706; x=1760513506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
        b=mznOzQcn7tvzru4y+BS7ynmcp8a5NNK9wz/nm1abEs0+Vnm83X19EN3LxghneGM1xw
         gQNVGaLJhdINU/QQ2iE/4r8DnsHswpocOgdIMHhtWqmIhJGie+dMgwJ+w4w2XZ1Cp0pt
         CKk2AlObAMOoy0KZ7bMZZkd7OBBxPeidncpCAtk8Lkxv5KaS7mzI+HOL2G3oJAbx56Ay
         GKhsWfkAje407g+T24+2IXDfzEC5Yes4GaDGIkqm+twkx1CVJBh2f4GqT0x/GR9RNgDP
         EqDGi6zHC0Au58qJXIPYuNL1iofEc/L3RdXp9m2Ys2UDpQn1YTozH8VCd2BjT+dh6dFF
         EjdA==
X-Forwarded-Encrypted: i=1; AJvYcCU9pPwitdmUL3y1GjXs+e4R5GS6EqwMnb7B15xaiUmxt+pbl/E5fGMW6EB0rgrJEdvzJfxxKafRnVpODg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIxywAJzaWtHawHMLK66UTGAIfKdhLPWdDpVMCBb8hEiUnJdh1
	kTQ0alf6E4DIylpWaVbET74jbWb1zAYzNU6/Kvn4vooR9riQ07vFFAo1
X-Gm-Gg: ASbGncvXD58Hh91HEtsmA6w2u5QY7GGjLC+JAsCJFNwAJa1vXOmqa1w9CpeggMK2YG8
	XUXmNYEvR2Hc7i5FY1QEtdUjxIP78QWwNie/gTedtYYwPHKoAXEYrJ850+pEL/zsBQih7ko96/g
	++sCl5mNIHVdszYMrjy4unCLpZUHAC+8MIN8epxinAKqRQ1DVL1zaYdvxyf7HBNiCfHQfawtZo0
	jYeq7HK286puFcX7lUjxsPtSCodvgFaXNvFXoXDRRzGGKUTuFCqoaZfljv4ke3iS22ULHjjC9Fa
	cqq3w/KsAGVqnIxioMGl3i1MBb9lnewr0xF4wjltWOSjBUMdCkjXJP/bWI+Xc4ZJ2UxUspRR6hm
	pg3fwLTdlWcd1mUqkiDmKML3pxgL22c0oyzAPdA==
X-Google-Smtp-Source: AGHT+IGRZlClUUWF0NFnw8JC06wEKdlQrkDCO3jAGBg1Eoa3BWw4+yky34BfCurBVLPslna6NuvYHw==
X-Received: by 2002:a05:6512:3b8e:b0:576:f133:9288 with SMTP id 2adb3069b0e04-5906daea903mr620850e87.54.1759908705540;
        Wed, 08 Oct 2025 00:31:45 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:45 -0700 (PDT)
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
	Linus Walleij <linus.walleij@linaro.org>,
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
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 19/24] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Wed,  8 Oct 2025 10:30:41 +0300
Message-ID: <20251008073046.23231-20-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 93105ed57ca7..149386a15176 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -598,7 +598,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1


