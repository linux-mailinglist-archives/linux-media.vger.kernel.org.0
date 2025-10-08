Return-Path: <linux-media+bounces-43919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE90BC3A40
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 09:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32DDE3B422B
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 07:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA3A2F7AC5;
	Wed,  8 Oct 2025 07:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnepocsP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754582F618C
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 07:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908698; cv=none; b=eDTE/VG+KpVmebCZAVtlQEBTtqJk569HmEk0dshIDP9gYsUHBE0y/+VbJ+D8PauX+3+hqYpC/J9de9gZxteA3unBiHZO2QwHgVuFxmy5DMwC5V+V2EtnOG2Zt+Dnn+dlptfmyucSDE/V3YysXwgtqIoJmV1zxH/hHNrIndXLnuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908698; c=relaxed/simple;
	bh=1E4pIC1QsHHkQt4ekahhKEIh+y+kem4KLZqEezDk7/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b8hE6nyHcakavzMPuxmdeD4m7E7HIbwe8Elju2pMm2uRS3D60SN6wX2Bk1dm9p3CY8u52zp7AKNXVlMazpML1vJ7mliMOw/QnQLhKva2H0IxWUAvfaH/2RA6B3zIi9Bw4L2VBXhCKQd6HXRMFbnToayFzWMqzbdI+n4LVAgc1NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnepocsP; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so8424276e87.0
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 00:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908692; x=1760513492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J0PH9dJMfz5boSq++S0Cav+gbesPYUNWBRR+flsya0=;
        b=WnepocsPt8VyJCuWn2hFHE02Mohn/IgFbO0gW4nKF5DBISyk4/N6lDchGbyjXkuZhQ
         wWQmw3zdjqrF1BmRMfz0skbK/oFx5+OQTss4XVEroJ9mMMc3w0qzWrtBYI43pd0CJrWW
         awrs9FKtXFeJoI++CkOUONGJ8Cv5EvHlMtJTEHUBE3JsnGeN1sYI1fXaPkN9JjFWN5yG
         i54aWFk+nWzzWH3M/JNZc4rOdVpi0fCZKDrHIDP7vb0gFFnPccxWfM6m3j4baKqGzk1B
         w7IFoezNsH+dGxouwj54xcDlzzh8y2/n9QUbF/hgyfUBOIiCoSS0wSVqx7X3rCUQ+jbH
         H18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908692; x=1760513492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+J0PH9dJMfz5boSq++S0Cav+gbesPYUNWBRR+flsya0=;
        b=ptKoac2oqrHh/J8bZyCTynxw9gpc4Qx6aF8AC7fcOPKhIvXq7JovuxqV9RyiOt4Gzw
         s+sYtVsBQ5uA9CnGuTpGTC2N9MJ4z5qxy8SkG1ALP7/zLPiLz/VH7vCEnNIhjmyoXiez
         xuSAjixY5NFa2D2oBCwmyFd3SlW4/xh4Z/Ga2a9aglaxnFfhp1n2pGaPhiVrXkJoAv4f
         jiAA4ruAiri8ghco9LRCXD93l6lUUgnIahnJLSAu69RXeKa20MMw2qOx8m8TkMwPNMuU
         HZKLQKPClqFLGaayCkteMzCZ6+jYBKTEUFiNKKiDarkwnJ4AV1RIUybDeudflGsSoGuN
         Ndmg==
X-Forwarded-Encrypted: i=1; AJvYcCXyQ44+RqBKGFiWFFIEo9ShIhrh9kwN7OysIEwlfUfypdgwy6j4YHCYlQEFDT336OLqvXDjWl/lVX64fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9CPx6LI8LjxOETU2ub1Cah3lG7u6qJSWysIbNZy+A6n9tjVj
	4tGTDLwFP++ssiHU5z7WxkqB04oWqQ0CJ9TgAAbmg+kvpPwEkH/DdYdY
X-Gm-Gg: ASbGncvmDAdUAPa7HfJjDA9hBOLQTjsCZOowaybblYCyLTodeUkLnn9h8mSPvO5iooe
	VA+5lHmrryIgKmmbszyN/rnr0XYTajCGzh65MUPjapMRV9Do5k/Oz31oAf15eCKZuwtu6XStRV+
	9VrMdyu5n5F3QN27mdA0Zt3cIbs+2RIFCjXrpx9Hy10yhmm/cqWtKJ4+OU7ZzqCEFAtkYXck4EK
	ynpNH9uy6/zRnRoqVXdmsq0WA50ZQV8CyRo+PnvH5daQqCd1Z4MqqcHCNXsx659Ea5eSS5Q5/el
	htmjoGBtY0J9LgtRRTlMUgd/v8flsSlWJYEMgcxgMrUSE4yyREaz21W80oW0NOwu/MedEcCZt7W
	77loZxnylBupFgeAJSDXW/3//gYkp/leDVjUaqg==
X-Google-Smtp-Source: AGHT+IGohM+FjzJZWI2mxJtv1ojEP0dXBrfZwMch9BdyXmNUeB5wEHKzwj5zcjMl3VMz4m5oNM6M4Q==
X-Received: by 2002:a05:6512:3b8f:b0:590:651b:10e4 with SMTP id 2adb3069b0e04-5906dd54146mr641087e87.37.1759908692226;
        Wed, 08 Oct 2025 00:31:32 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:31 -0700 (PDT)
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
Subject: [PATCH v4 11/24] dt-bindings: display: tegra: document Tegra132 MIPI calibration device
Date: Wed,  8 Oct 2025 10:30:33 +0300
Message-ID: <20251008073046.23231-12-clamor95@gmail.com>
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

Document MIPI calibration device found in Tegra132.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
index 193ddb105283..9a500f52f01d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - nvidia,tegra114-mipi
       - nvidia,tegra124-mipi
+      - nvidia,tegra132-mipi
       - nvidia,tegra210-mipi
       - nvidia,tegra186-mipi
 
-- 
2.48.1


