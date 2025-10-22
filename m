Return-Path: <linux-media+bounces-45252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF57BFC7A7
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BBB00352A12
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275C434EEEF;
	Wed, 22 Oct 2025 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lT3YQ9Gc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A7E34B40B
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142904; cv=none; b=uUdfZuVs/GyU+HyUddkm50X1q9jqio3eWS+C5na3K5SxXzZmZ9m3+SAIDEohtZujFvcp+cy5s5bGs63jgU+2E7gcqdfiPEizdJ8mT9YNkg+1n1VDx5/odC6ZGfyfc26oHXrg/AVEjzgDVo3SbvgVFlgy9JWid1bfA+hG9mqc7pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142904; c=relaxed/simple;
	bh=EkGBXhItwLWxgQ/aIBX1I+SuRG7//x8trI9XTwjIFpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EJp0oKtwj7cSLIaK5oGYwYt8FnTetrhxSnw49VQ6XdCIgceNi377SHebEeljWD60BZKW/BST8gq+BxQBHrfYaauhzfXXDIFJAAbM1SMusR5XO+9CxH4dYu2o9ogMnvPzw/BGGtelITKadmgIfCGOlwHWcKR6YDMy2VlSAFT/O9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lT3YQ9Gc; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-427091cd4fdso3418428f8f.1
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142897; x=1761747697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=lT3YQ9GcruPN+lVPATeN+AeMLQ9HuT9T3lRtwrQTTtpiAeeEyeDgV11dPEy+lRdIcs
         dB5tdNavAiXbZusN/vPISKlN5VA9I518xHEukkRh0vgyCi8IFuQXi8K+SOlMcFTjBWrh
         TuOUkuige4UxvD7CENUTFhOSd5Pdm/zkgm/PdoVZBp2m9B/6C3I/j/VaUEFuJaP00gpF
         +NN4xmNSBd/c+vnntwWQd7d5ad6s9gz48KKsI0t9b6Ij790/47VBssEdqoXIblxrG36H
         BI/+SsVzrIEsSVg8j61Aqgjd+6oXP6WLSWwW/aRZayFaQ9CTWhjXQtSaa7S5J2EXAXvd
         L7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142897; x=1761747697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=WKNgOG9pwKvsacbG2cRMiFJOqLC4q3HzEIJmF71oNxsK0GT/MsNhntThHDqEbjQ8E6
         2CXGg5xj/2G4mXSUTHVJuE3tldvrIbt6iYv7XiMW2tkeMLbT53oGsZolevcRBstOZytz
         z4Tnp2OS9YLKAdrdfHG9IKcYqECqfQ4Yc+XKVLI7ZJggF3uw3DnKpFVpdZwYv15gCpk6
         +u9VargkcYGsJhN6Q1Wx4JYVdfGo3bujpGpMP5EFK0sc2Q/qGuA7CQKpC9Rv1eorp5EU
         Kyyzo2qcXvFecwb41YHlIWlcHXEwLeHOq49kqTdqutAzUvyzPc0u8UZHrcg3yiMC1KUf
         bRKA==
X-Forwarded-Encrypted: i=1; AJvYcCWiau4xuNyZfU71iyEsIGNO7ayc6cXWaBpoeoCDnTPpxEaAaXVU6iv7JyA9LNuMjNoGhl3I8e9Tw6Y5eA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1o+uSXi/k0Pu3JtBaWXEZDwOOabAnSvmb74siXc/YG0zK+T6q
	keNZlzo5WGHGYsJe9vV5nvKCOKoRR78kt2QZtAZV8gw+s/l+iuIPjmIG
X-Gm-Gg: ASbGnctDjufaOdjoaVlr5rhgW+mbuwR9XDgEg6t4seRidwmThpSRfR5xRBHmtqO8hFc
	kMPGVGfjjKdMcFOB9dlOWxb5OEUypg0AMyCTJlOQxGUM3EDdwOFVWkQHnK0jr5mPAbz+uHlnLd+
	S4ce9tGdNp6KAG3wKIRm7qO6EryZOSejbXguZRzompkfK6eX+VtWZziBgt0fXVkBSYhk6YutZap
	dmPcGVLEnp6AYkfQ1pn9SV28+WFGYxqAFyDIlkmnkJN8kVlSG68k47bfNMv846KIgzHlSETzt20
	kJwlb6gO3n7+zqgxEFwgr3NDlLfYtRZbnBZiUSzrcxIgpxymwfiehIq7OlsXjl9HCkoHLNHuWdq
	F6m7Qo/wUJj+kpNcoMi5M374h1qZyvZ3RG7HcC67URiS0I/GB3bM1j1Pp9o+ntQRtSQX3DOi8ZM
	ZZ2g==
X-Google-Smtp-Source: AGHT+IEQ89eeh/r2+ipRz7waSS8oqSfLxP7wC0ZsoklWA5VZX65aruo6BpxwArM9GCWrpFvdCs8Ryw==
X-Received: by 2002:a05:6000:2308:b0:428:55c3:cea8 with SMTP id ffacd0b85a97d-42855c3d365mr1542726f8f.50.1761142897063;
        Wed, 22 Oct 2025 07:21:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:36 -0700 (PDT)
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
Subject: [PATCH v5 08/23] staging: media: tegra-video: csi: move CSI helpers to header
Date: Wed, 22 Oct 2025 17:20:36 +0300
Message-ID: <20251022142051.70400-9-clamor95@gmail.com>
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


