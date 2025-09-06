Return-Path: <linux-media+bounces-41894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDDFB46F7F
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 15:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75A7F561E5E
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C20D2FB98D;
	Sat,  6 Sep 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StntR/Gd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7232FA0C7;
	Sat,  6 Sep 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166858; cv=none; b=iIkv6hRgWlv6xzbcSGdHLNQ0rMGUyfTDzuYn30sgRqgUCdrR9jyAmd2R/OQuPkJntNIj9YzRaX0t6hzE+6JTy5giBSS6kmzS8KAFKhc9vC27ihMk0ZV9P/flbU4mG5imLCiFbRvurtVO30SgCezQo+Z/yMpGbyMoWRyWK11aoAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166858; c=relaxed/simple;
	bh=EkGBXhItwLWxgQ/aIBX1I+SuRG7//x8trI9XTwjIFpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UHHouRxz6PKOzm8isRpK1AjOBBDfZGRtVneIG0AJKW5b7l1YoiC7xSvOKcaDlvHcpKZa93ER+AGXOUU2w9/UGP5Kh7EswmqEYPVSKMmnjW69EEZzcDZSj9c4RU8eV+I12FA4tUjFEa8qn0kqsur00AMPsQO23Q2oGjGwUA0EBqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StntR/Gd; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so3094568e87.2;
        Sat, 06 Sep 2025 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166855; x=1757771655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=StntR/Gd2D+oxZ/LpfZo+9wDePITt2daIVZ6xUJeioB8fnznqrOVDdJsa2DSQKal18
         wJfWuMs7ASLfm8EJ4q4n36zWCQCYzVk53+RFKqMV69eNOQywg0iFOeyVCKDcZjTF7QH6
         S9YQH7cFsJH0aBe7YltVP2GmP9tTh0IPB98YN9BuXPK+6joyi2IDqmmyE3Dp1x8FJ2av
         bwawBUq6pZ/83EERASpKHa8vy+wGbbyXoejp8cyVaaBpDLLWWNlz8t8RxdTobHRfJ4yx
         fYWHL5fIi8JEOPWjQbdlwguJMuNrkRKhw6UQoSywENIUKxHFOfauF2e3y0gwf+yd3A8T
         5jIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166855; x=1757771655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=kzkVsw1q903S9UdO1DhrSFwnodC8Ljy6WtIbd1EJ6Ii+uRlVRP8Y86GYoq+ydhvswt
         lnTw5y5IclnlYLw5mSf3O6niTC64Cb0eXfRa8zIn7Ccj5wip75XMrlf2xt70UZlpdAtg
         60cwDHyRGmEFd8+H93XtDa18hUVp7uW+Z2H6e+DN+9OBXnBUyeoY/vheXOOd+ffTXVqj
         G6YGX8nao6RqRR9hk4NEzkXU0NX7DAlsYUSZml7IHktWwnsw75RQaF1O2oTBx5QtP+aV
         iN5vovcUXVvD9Rt6FJAc1O/QjO26yL9J7Zc4GpGticxIcn3utWzRLm+a+b44XrIsuBSP
         JQRg==
X-Forwarded-Encrypted: i=1; AJvYcCUGdSSlpmaGRcMlrLtyAmVIL9UBZ8lWKM+qarEk5IRmdOJm+jSfDc9AWeGl7KK3RlWYKxqevVwe0DP2X8F7@vger.kernel.org, AJvYcCUrox8mTR9ryMGnxAitkGRFvA3K5RxSivrHurN7+2zjr/37JXerOtsq4g61EKbNutXffDdOr6dfolLd@vger.kernel.org, AJvYcCV3f32BBQLEQHR97C8mBg26vuouQrqTO7t4kHgY4yqu4u0CIm4eI8nYKwu2UiYklBDcd6fS0tQln76Z2YM=@vger.kernel.org, AJvYcCVW5IjDOO7wCFCMhVifvChid62rCxG8CehifzGAJir/qLoIc9GHDhwTLmb5q7oomgFneCRHbqSrYhve/8E=@vger.kernel.org, AJvYcCXGwAxidqCyXl2l1p/IDqWSZsaA1u0zb1TeDMLRqdzbqcrYwI1j4/7u3Ew5JwCLjXeVFw9pnj+IG9H2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl+2L2JNLIH2WpZaBKqFaiqLMD8nwdMha53jG1fBFLNAU5qcdl
	JjFueulO4dxZrYXXfXa0vr2kmhfBcLdtH3gSCBm0lu4A+dnjLaYInSxGFJLJFA==
X-Gm-Gg: ASbGncukQ2mldGoAoJ2TJ+sWNq+jLwLuqlRQbPF0LVP4Rv70yIXy5dVN0hHxrqrW6eL
	GJl3deS509e9bDmSI5QpitvF4rTxbxtCuK44sUEi9QMqbyhSGJfkEGFX7Zpzhv6vY5J8884Boro
	W3a3UpglJgowSSUATFr49oc9TvundsxEw3Teur5w55j3PPjAC3bGzDHBU+p/wQY2lhltHv3NAQt
	7TfeLa5KEZBTK+UCTNEW0aqJXu9OjPpsRi7OF0UtVJWxxvgNPFVjcbfwegUyIZxdrcB5F46hKE5
	gzg0NOij0rQUPIjec05gClmMvvCikNCLASGbDwWFBDPrCEHtl/x6Wyh1nAJBYVjpaTYOw2ImBY0
	gb47VFrMQAprdtA==
X-Google-Smtp-Source: AGHT+IFJ1CwuflLWYrmyiSyRWTAzKVjGXj+OEC/CNxiHekgIHk2zT4rRYD0MencyqeeFU/tqUUarsQ==
X-Received: by 2002:a05:6512:128a:b0:561:9635:5b1a with SMTP id 2adb3069b0e04-5626275d86emr572346e87.36.1757166854707;
        Sat, 06 Sep 2025 06:54:14 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:14 -0700 (PDT)
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
Subject: [PATCH v2 08/23] staging: media: tegra-video: csi: move CSI helpers to header
Date: Sat,  6 Sep 2025 16:53:29 +0300
Message-ID: <20250906135345.241229-9-clamor95@gmail.com>
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

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..74c92db1032f 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..3ed2dbc73ce9 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -151,6 +151,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.48.1


