Return-Path: <linux-media+bounces-40271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6D2B2C32B
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 163747B4E2A
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B248C350837;
	Tue, 19 Aug 2025 12:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efcaqOLp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E84346A05;
	Tue, 19 Aug 2025 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605830; cv=none; b=kXVP/uwQXgUtfKHoKUInMewOJE0UAuX/Re2klu/mJy0dGd5H/uDLEZY0Uz3pqAD17wyVGumyRMoLRbijEJWsjtohZlSe48aJ3WCZpunUIh8e1H7eo2qbbuKTZf/CcMNWhWjngFyviHFH+FRzLxT/FnJh71yjEovR+WY2vCyEYG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605830; c=relaxed/simple;
	bh=MSZYGNJEFcpn6E15xp6m+06imWAuOLjbBEWI9PBWdeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldrHvBfHoMJHY4vOF0PPKWJBMZDaWVjn3SAfIminy8TtNrJdPFR5mReCiVEyB7UVqyZrRD+L0R4EO18YIN3rayRCd6gqnVBR8kttz+Vi5rVhBotKHtxCUGhmFmICGXCuIUlbqKx6dmq6T0+AWwEuXrYalXiUUTJgf/310bf3SNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efcaqOLp; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7a16441so804951066b.2;
        Tue, 19 Aug 2025 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605826; x=1756210626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruw0ucM84Yq0/DRMCy2d/jkgPYOwi3Fpd3K2L5RAUSk=;
        b=efcaqOLpgeA0gAZB6kyN7csLNT9FY2bqENiLWSwvS+Y/H9iuagrvl5HVZqR6WTsYEj
         Uv4uO0Mz6GqWQ6sqrubIGIZfVhgyFd5Dw0DUTUtQWsRcRKXCH9mP27y5kIgU83Ct67lt
         nJic2zH5mbRun+IVBIkw0UQH0tkj2eaxhwOgcnQT3id2Z4gVSHQ+wvOz/bTP1eN+MlMc
         7ZdU/8A2EKMTswOjZvSE0jLDggRuwsnzYshn0JN688HXtlW6XW7JGAwwkxGoJI7GbqC5
         R4V0/lXuRRkhdHeCyGngG90/3zNdfvZFAiHs85HFDW+dvI1MPp6DcjRW0HeKdrs3u2iP
         7Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605826; x=1756210626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruw0ucM84Yq0/DRMCy2d/jkgPYOwi3Fpd3K2L5RAUSk=;
        b=iDWjxOYkQAOg7bHeBkiQyTY+SOZtJ75K07piYvOM4C29Md17PjUSZVU2W4rb4sjPi4
         vZSmBSHMz4llHuyDKlKPNqb7XQ92gDTQRkxC/+eZB/tMBOs2wHyhTziLrR9yYaRCYLvQ
         1dLeKjyMTQKPrvIrb2GRTTBuyrM9zMKzEbYaTPICqj/bK7obHZD7XDLKbISY8sDI9o/H
         uJFMc4fEtHr2lVd3DG6tiKO60DCjZQII0C5WvsHIZ5IlRqsPT77pniQxROVwETvPufB6
         qxF2CELuWEuitGd6Byv8X3yexU81i7v5uxTbq1GtQhrCZy34oIKT50w08MJTHKwXxRuI
         ahgw==
X-Forwarded-Encrypted: i=1; AJvYcCVR3u2SWfGv8SCu6hK2E5Rb8eSvACAWaZMKaKpS8vEhNmN9rZRLk87x4lyc89U7rnN+MB9rybORXrOg@vger.kernel.org, AJvYcCVoZV1YjO7jGsf2dnSXJeW+lqbFMJys7KYYoZ24QeRMnSUPiRbpq/SuM0QEuoDzslCwL4RVUNqFMzSW@vger.kernel.org, AJvYcCWdz1Oc/y8455+mu0EXF8rgCMTzHkHjknWbOcfG5xVwRParCGwSILQWDeScM7GVVQDswbe5oqO4kOiYSdth@vger.kernel.org, AJvYcCXm3XB9W7nxNhz2ZTIKFcMnUaQ0nuWT6GfAq7avNafOntS7CzGhzzUdutetuIvzLatp74r1TXOrBVyhj5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa47NKypTykwj0a7yZE+TOI8NWLk8SStbGYmd0Tf61lxTyOh/u
	oSMLoyzLhGzCcFO9VOvsUqin7ynav/YavbUZ+jE+rKReg2Xrq8A3FC9T
X-Gm-Gg: ASbGnctZ0ZsgY8sjPaDQUyfVWy6VxgFVYcQrcywbHNxaj03eMch/AeD9EcAW05p0sG3
	pbZcUds+A7eNqEovWIN3kyJpgdVkV2oshWiSXPKhD3K/BNTcDynwm9J6PJx91bBkO4k2PyWDl0s
	NYV/fqCd4zC8NRj09ArMhqG/oJ9YuOjbFAFlP9UvCz82UkutJKw3seRQ/WH+JaPw+TWu+LKJjGF
	qkcmNzO33eV9UEwwiqBK2/mXZXl3E147+we6Ri9FMcAaImc9YWmZIv8vY9qEnOGId6F2rvivUvu
	l3NjapE+s4uAygD8j68XXI9skuPAsPw7h2pevRkv6J2hZ6Yolx7fjDoqPTflDXVnwIwezx3HiCX
	CYWGy/vA9K6a+vQ==
X-Google-Smtp-Source: AGHT+IEaH+8GjnNNMFbsi7+SYVJyxwBXDv0Ziy+pvr7sQlX7uGXafFVlDGk7vl7NvUBiWatUvLDKKw==
X-Received: by 2002:a17:907:d2a:b0:add:fb01:c64a with SMTP id a640c23a62f3a-afddd1e72d9mr235789366b.43.1755605826436;
        Tue, 19 Aug 2025 05:17:06 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:06 -0700 (PDT)
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
Subject: [PATCH v1 14/19] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Tue, 19 Aug 2025 15:16:26 +0300
Message-ID: <20250819121631.84280-15-clamor95@gmail.com>
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

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 71dcb982c97b..67631e0c9ffc 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -589,7 +589,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 1, /* parallel input (VIP) */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1


