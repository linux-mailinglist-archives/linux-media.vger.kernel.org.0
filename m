Return-Path: <linux-media+bounces-43188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC9BA053B
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 17:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB3435E5FE4
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6351530F943;
	Thu, 25 Sep 2025 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LV5T8NIk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B5F30C601
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 15:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813459; cv=none; b=KyRVxrUQk5rOufJ3F/RuqBgbQt2g/7Ge0U3cZ6mYHGnClLv+M8RHaULgGlZtggkcoE7pgDdKeCzS5qrwZGf2BN2UbOYpVFqbgfcmzJwEAG1Uxvjtw4GXE17FAJKFCUbaGU+abGVpHc9a3QLodI+xbaZvXckaGuFnXsSoApzHW6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813459; c=relaxed/simple;
	bh=RyMqVUMoRxnLE2+LH/uDoKbsjsXYMu268PiHdfObUHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQjY6hSeUCk8ImGKpchYN8CqgSU5/cgQyXg75NQK5ve3SPBg5FzFed+Tan744KppqidoLG4UxZAuJx3GR4WTTBEeEhEkkBqgknQuhs8I3dHIWYx3Mxb/uLLEvoKeVrcdL9TBTAjazeONerMCSy/WVE9Wa3EorSbUP/vB41h1yno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LV5T8NIk; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso1344304e87.1
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 08:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813454; x=1759418254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=LV5T8NIkVevZs5a5PGuIdIdvYnfOFYkiZ4h/AN0UhOoCmDcpbiquC6ADTbljAnYxyD
         xp53rDpV9d4SdI22mL7UIV8kN3k3KOljaMFnRbecfSPipwLbX0IQ9yiHeTg5/z+rHYKU
         R0RejQEO0SHmzpkXgg4tu/VLxVaZvqBEW+yYjTUQUgSROw4AkoSO7jWVU0V/LCW3utT4
         MjxrIVVEHiL3YJAmEBkmYfI8Nh2pOS14i/tClsAcIHeHAAItABagqteZOIEb/dN1+t0C
         yaiDOQHonJ5upSXl5vLq2qe7cC4BR/4SQRS9hJ+GZ0KkApF9UhtPiYs6s9WHdokzZQU4
         fWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813454; x=1759418254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=W6WOpBTgo8BCM+fMMj0Hw2RN5l8oC/wwPDVCqt09A4lczl0y907ZUkyr+AHYq/PGBq
         ojqJ6cNdMDKU6usl2amUYiwzA80Nnea686p6XXkJDlKhHlkOlVQF4SBGlQ8xhSpmKV+3
         N8mHhBP/wWG/BFP6WSHj0IFIr7oVQqSohCLWR9hLLgLNPKGDTaTSbHyu8RZQDsxE+Ao3
         N9+7E8ooOzvxcFMSOuvLYZZ8c4NQomaDyNiyUxIFBbq8Q3pNm/0AdgOY+q2XYo77W7jC
         Ihtxb4dDHaYnOlfh4ChDjT7wAifnfYENbEVtNTbdjSuO19ssXcxQuUYhwYR90NIL11Rj
         rWNA==
X-Forwarded-Encrypted: i=1; AJvYcCVUNCVZjV12ZcKT9swZCr1FUmZWV4DXgSP4Xm7yF1tn9aYIS9TklWGujGSvK9gFlYSYtAaoKfTgY/s/zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuaDMciVBwaVpDCz7JJ08ZdWnAYMc6qYtbzAKK0Ncq7J5c593B
	GxoYK38yVgSTLMPXRsVyvTLfv/+4HFvx4GvC7YXUemCyzuR57+vk1Ddm
X-Gm-Gg: ASbGncvL0ZFUv4lVNaio23JWtb4f0pxe9OGhFNdOC4YE+Cb+28kfWJuv6rQFYB2VKn3
	JFhINvTlRxO6BoaxEoHVkvx0fC5ayPxK/5AjABmDvr7YJ5yPVGkgvEEuCC82tBP7uSjgqVYoahe
	6Gj8vlgcy39/sXxYz0YN3KtbtCXLIRTvRcB6a6rhQaJuKRLCE5eZfysXZEWwH0uQEHo/x3UYQ5/
	4WozgfqCH91DAQpmx5U8AveLNYO9L5XLU+xy2/9wEzdCg5nT7m3CsHiWueJj6m5NL9DXxIyMy++
	gj2WlLwOvpuwronCh+Eq2eZ7hEZ5fenlrGbBfmfCSfgt35/wBYgoP2YgV54JZiimpUgYfmlmau/
	6l+Z0P6cXo8D1oQ==
X-Google-Smtp-Source: AGHT+IG7KKCjilkRoVVQO6eRQmwua4ImxUfDI3+PmQybBw/b1Fvta80npFLTel5v2tEHntPHpbmfnw==
X-Received: by 2002:a05:6512:1392:b0:573:68fd:7ad2 with SMTP id 2adb3069b0e04-582d25840c9mr1251932e87.35.1758813454230;
        Thu, 25 Sep 2025 08:17:34 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v3 13/22] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Thu, 25 Sep 2025 18:16:39 +0300
Message-ID: <20250925151648.79510-14-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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


