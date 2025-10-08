Return-Path: <linux-media+bounces-43923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DF9BC3A91
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 09:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00BA63B0C01
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 07:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80592F83C4;
	Wed,  8 Oct 2025 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PH09/W99"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED1E2F7ACC
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908705; cv=none; b=XuH/Q3mPlnGULusafC066eNlrCmqz6h6nbr430r8KSqOcQ8ELgLKVUZRnd8+1PhfU4EId0XrKqqsQ5Etqc5GHY3CCZn7Zfo6PvfQQBypYU8TUqYSviAYqZAFsXfN2JN/y2gEfP75U1ZfGg66Shjeonym5IWeGry1NvP7xFKIyOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908705; c=relaxed/simple;
	bh=RyMqVUMoRxnLE2+LH/uDoKbsjsXYMu268PiHdfObUHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q37Uohwi6SIiQxjkInkUy7kjyfZi8AlV4mrA2z/j2VzWG8TuxwULlgThG1V1fuNFVsQTM/SYIf+Etz5T3fnoOEAlYk45WEswavJe8ysUC6Xa10p24AafHvMvCHsaxpbPeweHjqM79yqQV7MiSjg1qP+GqKNoKAx/pG6iKE4bJXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PH09/W99; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57bf912cbf6so7584186e87.3
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 00:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908699; x=1760513499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=PH09/W99bZ0/mngPb4vFpXUjdZ/CJN4JF2IlYA4EvDLB8ZnG4XfweYJYD7v8WNhWUa
         OPH8q0hmzfSzx+vokBxNJsYav5VUpUN2PCHeg6O67N5NWlXkKiPAN1+uq5Cb6tmIUL/b
         eEIeWGvPLTf9UmZMumwTGKB909yho0+mb2R3mTWkfqwzc8HGsDXRR6beoWf8DSKK/2af
         +IItFBSJllCwPxv9O+zGjGzaX3oywjpez59dJ7J5B5Sxs3OkD8OEP3DlkJqb3jQLVGHW
         bAJp65/VTT05q03y3D35msG+ezoSB65aafadWVcJJ3gtS+wnklPWVMIf6olMdSO+sb2j
         MOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908699; x=1760513499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=t132AQ+HRFREgyMV/6fJzqoPLGLWMp2zhaPcw9kDQxa0XFlLfKo/dhMCAQ9kcKshdo
         2ifA/v3hPmNXcZyPNHEAYn4t1Pww4L+SimkhxY3APoIs5TJoXCQ2EXf8323dAJLusyYh
         CU07PXrLSQAvtH4wNL0VkOGqxrFhRjMoY3CHKTK+qHgqYTxt40Uc3z1A+2pGDVsiINVM
         qElYGYL/mVxGNmDUlly4g2FFERTftizTWxF+7d8E3GZ+fv45cbkbQtUtGQZQf8UfUgZw
         zHgMLIvtfMe/Vr/1JU0Dp1v9HlnEl3aCgaOCuLvVSQ3PwJ71frAXwIAfv+/0Z0zZiK9L
         gHnA==
X-Forwarded-Encrypted: i=1; AJvYcCVwWtrTIqWsLaNHBVCSN4o2UB5mQ/8Jmh/GlDryU6wec2QpJxR6vmAskimJDl87Xld0i0OMxoy8dvvXlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/KSB5GS9jF5cM/BOkyCn2gjyIs0LwtmLqkrsEytjblvgU3+J4
	ePT3AAli9fqfu9uSVILeeuzR8aV2UFaJKjELyee3soPNnjH0AU7X4/Um
X-Gm-Gg: ASbGncsT8jFjCVasU9hFdu6tOpsN1d/R4cZXDTJUYcBWzGZNC7BiIP9zJ/jWON5fWje
	HmWR7PqJB3KSD/UXXshWj0TPipYqRCN1cB0jFt0YoT9mHDksbuDOPd7Hov5YVL4nKQVqF258NhB
	WL9cRzsPCrJC93cQIHv6WgwdyQTmX6M2ByuXSBxBBG6xRZ82wsh+aGAw6DBYreMjMWwYVm/bb/3
	ufsWZeXg4GvzKu7YE4dX5pDAh+6LXdUNeWd5HMeEczBNdX1ChiHnSXuKt1wMF5EDwe9lYHe1Dy2
	coMxs3vhDC95QGTcxQhj5VyQlkK5vHOJnAz+uQL/RgnlAK0AHHM/cb3xpntezSLggXedEw/AzpW
	pHPncKRxKtgiq9G6fffO+fWtB265HWh5UKTUOqbIoTl3SE5u5
X-Google-Smtp-Source: AGHT+IEFplvbNC950NzSCz1hsTj2zh7bFgfmbElqdtfxWz+oMV6+2KVz4G+D8Gd8rLXbzooyRNyKYw==
X-Received: by 2002:a05:6512:b96:b0:553:2c58:f96f with SMTP id 2adb3069b0e04-5906db0ccc5mr608183e87.1.1759908698844;
        Wed, 08 Oct 2025 00:31:38 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:38 -0700 (PDT)
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
Subject: [PATCH v4 15/24] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Wed,  8 Oct 2025 10:30:37 +0300
Message-ID: <20251008073046.23231-16-clamor95@gmail.com>
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

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..3e2d746638b6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.48.1


