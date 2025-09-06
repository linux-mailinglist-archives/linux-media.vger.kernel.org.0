Return-Path: <linux-media+bounces-41900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CF9B46FA0
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 16:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E56497BA9EA
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DA930103A;
	Sat,  6 Sep 2025 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNvf5Qy/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279282FFDF0;
	Sat,  6 Sep 2025 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166868; cv=none; b=CUUT0bwUUMGOH9L5WEmCPsVA2Qm8P8DqCMT+H9WamqAXM8m4YSBvw2tbDniv5wG4cMrXIIYO6gSfr1UzJCun8LzQLUabg6iF6YsqScWN5HjOc46AoqEwhbX4PVWHCLME5Ev+nwkBbQno/odNDpF+2kAm8ITfDQzMLbH/d0ws2hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166868; c=relaxed/simple;
	bh=yUPRW8PzJhxqKEYGFHeoRk0hg2dhQG1xB9Q++hNVuuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOg/5bHIu4VNQfaGoXyu+wla2WM04Amf1/tgFuvNawh6aug+f5ZW6YflUZ4jY0oTFFGdDhPU5heiAG9qnQczhawv4VfO1NJqTxT+gRzHvWXPKUnol8Z8YkxYPeFEz9ANmQ95a8SZmDwDQ6/Lcex5eJwu3h9q8x8mAMk7wl7y7c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNvf5Qy/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f98e7782bso3576484e87.0;
        Sat, 06 Sep 2025 06:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166864; x=1757771664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rFbfOnw0ovhU07hOjO5egRNR9/9PjyUG+9rcYSQ22M=;
        b=BNvf5Qy/DUk0BjRMwRsEcbG9/Jel0imlBMWl8VCtJ1MuijL6oq3Lh1vvx9jYlRYkkW
         ernrflTmljCIC8MAGSw5697hkOtMhYWu6/jxWrYSAPeSmEShqTK3jAhWWkK+7U165YIQ
         rifafUHPp1Tww9ojOwSpSxDCeDcTvybcRU8Srqvig8X0qCSC9xXZUgt0kMdCayneU/15
         sHZFkQw2O6YvdvBe/RSxu4CH7ksS7i2Kq2qhoZTqI0Unzx+FOC0WETE2d2rLYx3w7/zJ
         9oIfLUyQfrsAZQNGS4rQfwu7GZbDivoEqhgzIg7v4ztMyZ2UOSGAqsEl2NmVovFEDhCl
         QmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166864; x=1757771664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rFbfOnw0ovhU07hOjO5egRNR9/9PjyUG+9rcYSQ22M=;
        b=tl+VpVusL8oCF62+1v8P6uGPZvzXYyENxaCzOVcLCNJ8lziNnbhVbrvJ1RagB7pG0L
         pt+WerqFs2JdT9oNx7+EHd6rCxcDmJAPJu2TQ7ClYooxn6zSkCK5PsKL/8tWC48SRB4p
         xPLYxq3y4Ui2hCZy2R5IH9n+yc4ClUOj1gzuGRFKckgaUBnExgdN2l+TTzWQ+H1nIgSg
         hlfZqb0R1meCCTcfmyDz3YPmeEhiiwk8BDNUrfnsTzz4QdavcFCC1tKhd7A9qXcLbNSo
         o0szxm40RB0agA+OeFRcpMCWgCoMUf6qhI2ohwHa9wwndWYU+RlYjEcb3hR2bfDyI/Oh
         NKMA==
X-Forwarded-Encrypted: i=1; AJvYcCUig2JRnS50Yad/IA+h4HPhyWLWZeLeQE9a/2KhLV3WrTzmvyunv5yyMaJgWvM2JxMiZKVkgVKt+T0Xz8U=@vger.kernel.org, AJvYcCUybt5r5nVEIh4E8EBsa3tR4g7YfW3ZGaa9wwcet3W7UVYm5+UadOl/iN9cyK45ltrAFgqVn60RZtw17f0=@vger.kernel.org, AJvYcCVVd5vvfpIzuqJ8fxuiE1EPU0tAny1cbgbNpomUpisX//a4SPvJbJl+Qpjhjc1SyZ8F1iFYhsowxXnk@vger.kernel.org, AJvYcCX4PE+BaIQToDK+sIlY4/0MtgYiKSv6ScJG1Y1pw74cgK7MqmDw1SKixSkBx2ETaPyYUIyfanUsukFYzSnL@vger.kernel.org, AJvYcCXOZPNpAZY2EId2M/A+aJZ80uFyvvAY5AJWA5HnN20lzogIYLAbWaUYDHuHedwBWR/R0u+taQkPhr7f@vger.kernel.org
X-Gm-Message-State: AOJu0YwYYP+qRSxKQPpb8ucRFejRjCq1sAzkUtU1+ugGoVliSr1IJ+m4
	7iYXLFJlKwv4Bjzio30NeZqKEYsbDZgnBtwNsPIv1qwNydqJNOyTz1IX
X-Gm-Gg: ASbGncthVXgTGRvHbl/rhkR9Zz1GbNIM1zfdXb0uKcSjs7I09YjrhfGGUfhZxNaGngU
	JETt2I2wOzI/n6lxt+cV8bjHH11XAK+HpiRkI9gyzg4WQqD7cd7jaOKA6Jlq4KfdVsjKoZcp8WT
	8RuBiSLq465ICjgUtmAmyL0/6qWrfDmnsNWg//DxmfOLD/dAb9Yd8FGHZIuo1FwXu0+V4Ul4mIj
	U4bibO1hCTq0+GQC6Wtse+Ka08i1YI9TN8C4zcuMOZ9yIfWeeNc5NvC5cvAxRuOrbFTceJBzLww
	B7lNpdAOfcWLCWTvyEE9JOoSQg2Yse9HsZqzL0nNvMj7pYM+tmfcvYJpt+u0i2AJrof7i38uo64
	plgaCdHprcJ6Cxw==
X-Google-Smtp-Source: AGHT+IGLEI0q+3ulE2AcGy+vQLvJcnyT7yWeDJ/WZ3nBnLMGXX3O9kNd1Z42W2XvmsQg5afDS7/KKg==
X-Received: by 2002:a05:6512:b05:b0:55f:4072:d34b with SMTP id 2adb3069b0e04-562761985b5mr636622e87.25.1757166864108;
        Sat, 06 Sep 2025 06:54:24 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 14/23] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Sat,  6 Sep 2025 16:53:35 +0300
Message-ID: <20250906135345.241229-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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
index 461593c49594..3dc26f5552eb 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -24,11 +24,10 @@
 
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


