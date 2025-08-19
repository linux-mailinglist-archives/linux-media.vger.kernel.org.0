Return-Path: <linux-media+bounces-40261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F4FB2C311
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25D431BA53E0
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7EC341AAB;
	Tue, 19 Aug 2025 12:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hinRPa1G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CE6340D8B;
	Tue, 19 Aug 2025 12:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605812; cv=none; b=JfLGOXko2LtZGOPKEftL8kc8YWpU3RNBmE/m367zugWiLlXc/VXaU/jBFMnlG04ye9d7Za//mcZTWkV2jIOO8jH72A1koH5z/NhPnAWYKnTaM3yyoP0e5xdMM2FnkBMvmkraEGYm0NyIsHA8uQ4D2I7cKuKfnSvqEMsBJ+yDv1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605812; c=relaxed/simple;
	bh=QB04jq4IYYg00bcogqXX0zWmismqWYxIpmmcyXPbdhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjljW7iC5TOo6l7lfetVNjROVqJIe/mlzySKuKhnY5CTVpqUdeZoxmZfX9nG0PaaZWUFJLLkBsR5SsSy7aLJXt0pcyizvOyka3RMTppMp2iC8C3D0x13V4R97h5ElkDNsLlxhkDo3ITiBxniCmIlRUlqks9KhZX48T86mPU5rgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hinRPa1G; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7abfc5cso892426966b.3;
        Tue, 19 Aug 2025 05:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605809; x=1756210609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sjH8RUp6s40CO/RK36IN6IhxncowpuFZjH0TBpbicI=;
        b=hinRPa1GmOr8kIFJgwctj+Oo1E0HdfsqpaD9QZmgTn+mZLqXvuS/izaa3lKY3/iirz
         GanvNZamt60+q654usluM30vXJx59fkaF7vrRyc4lE5PUsP8vOFDqkzMAF7bTWsvoEef
         FRlrEil4HKdwArMOJrzLiEOzh4FoTcPb8zj0TVgJox8wx2M1JfYF2il9wmS7wYYUqQbp
         qHYPZaq76aKZnJCpcP9k/5p1phEhfbtIO58ym0qaPXtQ7sjHd614/rnHNU2FGAT7+cK8
         YKiaDRhPB1hR8bEN4IA/ENwaRkitZP9oNvvG5eWPSfBFYLVuFU32CgIoX5xCN+z6vtBT
         eibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605809; x=1756210609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sjH8RUp6s40CO/RK36IN6IhxncowpuFZjH0TBpbicI=;
        b=P4EypMDWI870h1AA7sNymdCl3sGYI6/rgnmRDXXWSQOUWJnpJSr9Xj382WcOrewfIu
         mWwvCJrECYtnSFJ+eDar/mzKQu9ZyIVDmChAs6gklRxABIPPUXCcHoIyuneJufXhx4+I
         qLuuuA7Xkcj5QmBhnk49GjfqytKW4Uz/GmV05BwMu+RuBOVPPIt/Zfab3nqJVbWqU2q1
         yC0DJ1PJopTbNkffn2cmljDkqsD6UhXa+rFW7SEkV/s3qHb/wtoTGY2csw0OWpqDaOxf
         vS7v8z6KqaoR96xb9QnZT5U3RGCBWo5jhngusvShAO3m87BOm75/NXBxZIugzw08M/+a
         BNSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3UFCw40XqCY0DWYKcWu+5DSi50b8QbetjygnbvR31r2f3xjtvRSLhkg3UxMjfyW/hrzECWJ2pFaKC@vger.kernel.org, AJvYcCUsFWJNt/BhKo16OkYwF990XTWyXiHHQVCl5BcR8AwaFneWtrJnkEu4yoaQuogjhW1PuLJC3h+rKR84DTU=@vger.kernel.org, AJvYcCWa/wW8wkLEJ+9hGmXHQY4YtuWJsOGiP5LeECs1zeg/HuIbsreAjIFyws6E1GIOvfKADR6sxT7Kldr8ppLq@vger.kernel.org, AJvYcCWhLV8FbiCRYDq7C2o0bXDI5IMiLbq2ifEjAUTW99IZ2CrizjVr+e1WuVUan++Ib3/ESsDpLVD/P7cd@vger.kernel.org
X-Gm-Message-State: AOJu0YxbvuRQv/NtMmQGwFIplJFdx+1oKoOmLZcyIw7ROY4DniJAamly
	wZ+r3yhPJ3mQoB/ddHzkdphgPpvEyoriV5d7chKq6sykbJTtonzNDVsS
X-Gm-Gg: ASbGncuu+QpFOpfN5XSEJw40Z0zku2hBsjr5pnzIaDBKrMIy8q+bz2oZZZMj2gjXjsy
	gcGO5iH80jx604PjWXUjG02hypkfmTXBYsg0kCqNCHGRlUl9sfCj9tBQCYO1SYaYhrZur96ze1s
	2dblNshoGPVBMqnAKrwOAMAJaEPYvdXvN5kOpgbjNX1ImMW5stiljylqsZFhbb13au3nSV2ezjm
	DFtbSlSJBUvOZrdDK/WWTiWV8EU1A9oC2l427fvZUC94+frA9iBiTFe9j4vTZZPYxeTvWNApnka
	Mn/oC3zvrzNGkN3Wv2TAK+K2d6tPKRHDpK6NF8cDKApk4xpCLzChoEwH6UnqbnfLWOaVe3FYPXA
	WeLeMprDlMf2a54JPGsCNK/2w
X-Google-Smtp-Source: AGHT+IE9FHFJp4/Ab+MrMhT2z2lpcQguRQVSFzb1lmInT7SSEmay/CM6C6jPXgOsbIUafQrfyxsCMg==
X-Received: by 2002:a17:907:d9f:b0:af9:c1f7:802 with SMTP id a640c23a62f3a-afddd0b539fmr236610566b.31.1755605808550;
        Tue, 19 Aug 2025 05:16:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:48 -0700 (PDT)
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
Subject: [PATCH v1 04/19] dt-bindings: display: tegra: document Tegra30 VIP
Date: Tue, 19 Aug 2025 15:16:16 +0300
Message-ID: <20250819121631.84280-5-clamor95@gmail.com>
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

Parallel VI interface found in Tegra30 is exactly the same as Tegra20 has.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
index 14294edb8d8c..39e9b3297dbd 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - nvidia,tegra20-vip
+      - nvidia,tegra30-vip
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1


