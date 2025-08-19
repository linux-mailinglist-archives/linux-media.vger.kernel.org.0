Return-Path: <linux-media+bounces-40263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC19B2C317
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8ACBA7A8436
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83981342CAC;
	Tue, 19 Aug 2025 12:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghltZxBT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E66341AD7;
	Tue, 19 Aug 2025 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605815; cv=none; b=nKAOQvnYiArhbfa9y6UsLyTCXyGczxAHoIhzbnUJAGyC83kMI457t0BlvmaxN5/Lx5JZGrrcLGmvTQYqS6UKQciOqtDuxgDBMhJtfElIL4xgEbqjwRI6s83DHbyf1UU3RY/lTgbohU3MWc2IljE8ALAnqAYyZCVVQvuF7Ei1Uj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605815; c=relaxed/simple;
	bh=EkGBXhItwLWxgQ/aIBX1I+SuRG7//x8trI9XTwjIFpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+FX8hslJywvbamf1paA3HsPu+xL5pz/kHyQQgwTEcI2q499JF4PyEjrZE9/0DZpG3ZCBCS2yWEc/cB6Er4HorW+mFIUuBZGzeO0Lt9pTuj+2bCVxtE8KN94jT3rz/21wavHFNeMPUOOCehRG6Ponqq1xv2Getc3sSsLtYq8eDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghltZxBT; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb731caaaso724747366b.0;
        Tue, 19 Aug 2025 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605813; x=1756210613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=ghltZxBTevBHxHARoMG9uTkMaShB9lrlzVnLauTF7IgklSQKdTbsQk0XfMINLU0ZmH
         s8Id/fZQfhG7Q+mteeG4/kb6b53wnzQAd+LxKmm4qXvHtyQ8rj11ETIk2FQVtBD0GUfi
         BXWRi6VDCKRIolaLCFXp4teKnV/6SF7kVTJsoKEX8BzhNCtRgbHeW+5gRhzugYwfOT8n
         dfQuKjnGiicjKzg6gVi6G3V6C69dklVzOGdK8f+0tBSQadzPUTwaqxKYFI3d3+7dmQOu
         lqP4HjzctNeH69og6WgSp62J0hIMogr9KNXImiFA47OUuYzTkZMnfdWt64Go9LmaXVdY
         Bv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605813; x=1756210613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=vC7PCSBkMvd7swS88guW34qre/gNYiBGpF8yGiKjb9JRZTgPXHw0E38TGUPsuzGKzP
         1A1o2eP5GvzhF5iytWJCOL+xdfWjBOdu3rGtmf+u9/EWhWMm9LaHWVYMJSPRg0+YEo1c
         ZSuZVKuWUMG0J5g4nInG+wVoBXkqLunWQbf7OIlJQq2gPc4nQsJYWV3dycjBKp76Xq/r
         zCwXrklZ4zh9TN8JTh99xm+X3ITG50j0A/w/SE8MLYvc6f2dsEoyKBzh8HFNuyLUk6DI
         S63Fkqu0XmVNALFJZ4/Ls5VAVs77z2RqK3D3KbOVO1rzuh/IiNlhkwLkKwfZ+I2KfLhQ
         3zrg==
X-Forwarded-Encrypted: i=1; AJvYcCUOKYNnY48I1fQQ3QeqtktT6VDFaH/eGPDVZECP8RW9uIgy2sjw3d0kVnk990VZL/tByTFTvW8JW7wb@vger.kernel.org, AJvYcCUQgOXILqJrpvtmV02dKyXXrw0FJl4TGQX1EVcBVwxv25Y4YEX5JapwMBTAb66TTjizFPnDbwSP+woC@vger.kernel.org, AJvYcCVFR0h5UIG6cRu/w5BQlH0P6UhvKCNUPt4nohBlylwI5fHV8frMKBG26CP4MU8gCcMEv9OYMpDqeeDbXCNW@vger.kernel.org, AJvYcCVgDy6EioNG3JeIkEpbDFOW43wxlvDouYFQtUvk5dHlTKxnkXgnRv3gjbAVzlOIUBdPttyq8nCroLFLKB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF0JbKcauM/I6hjRWaQsof9dn6EULLxO0Vr4cdLdwyXlRpDCVV
	aGxsRFD0VvmPUB1ifHjWVQSDUgiIdt53HsbIa+V4HNcShPu/LftbRfM4
X-Gm-Gg: ASbGncuOQMIDdd6TfwSfJ+YPPKpQSOP7QvrnANO4hz8Ud9tPVP5IUCJPrfaBv4luEax
	x9O4YEFtjQ6YQcswsIY/Ttlq5++EeVuBoFVmydHBs3NN8G8GrvYLQr551VTAl1lnGHEw+vkiar2
	qCn2tl8b3z2q6zEzZarpspfw5JTIkj5ExEvH72k4J59nj6rzBGElgiEll7zzBKuw+tQYzzcZXgT
	QD+dVV7EhZlTLIzxKwtAJurHyHGHoBWn627fIZHdC0VWNVbR0eR8kR5q5u92oV1Eg8/iyjEkJAt
	dlftn/KTOWZR5uFC4oa3YKPyDvgWw5y50vCGgl+jUyGcL6NoRjgU8ljp0FaFJObh3MalKElplEu
	FH/UKsktO9rEb3g==
X-Google-Smtp-Source: AGHT+IHy3F/e1kSRDlbofyboq4p2pglFSUtVJLGVczC1I6BCAnBxgMTYMS6YyE/2e4b1RIBWu7NZlA==
X-Received: by 2002:a17:906:c113:b0:afc:d5a3:90c1 with SMTP id a640c23a62f3a-afddd21a8c1mr208971666b.55.1755605812119;
        Tue, 19 Aug 2025 05:16:52 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:51 -0700 (PDT)
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
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 06/19] staging: media: tegra-video: csi: move CSI helpers to header
Date: Tue, 19 Aug 2025 15:16:18 +0300
Message-ID: <20250819121631.84280-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
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


