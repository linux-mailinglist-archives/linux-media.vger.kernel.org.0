Return-Path: <linux-media+bounces-40259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDA1B2C31E
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94C6D625BE0
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC3B33EB14;
	Tue, 19 Aug 2025 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZ4bi7lQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BDF33CE9C;
	Tue, 19 Aug 2025 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605808; cv=none; b=ThXCTDcwzGQhDZfdRw7hH6DWNt2uRJ/eyUJQvV6E4BR29mE9ZiY1moiB5TK+ogzK7gVwVYhIfbOU4u8Z+KOOPt9JYNq22/7bPRA5qkk0s1Jy7Sd0rUtDnMOQfiAg47k0E6Fon+pKSZCQ5TjJ5gqUdp6bSqpVNCz1K6vUZ07FPS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605808; c=relaxed/simple;
	bh=J29OlXcWnov4zepEBMUdze8UQOIYB4NtqVr5tKZ7MHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIUF8aoCq54uf4n/ux47WjD8XCaI2eDIPh8bgZkRomWBB6US5TzAjxrCZfYPINh0+Iz1cnv8w88nGhJYs0xzWY/AvnHXER37v47Aa7essW3k9W1IJREDxJrteTgdrA1jTDkuiQlPmteStce1OkHBxuK7L+F8CExwYsNDrP81bZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZ4bi7lQ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so696136866b.3;
        Tue, 19 Aug 2025 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605805; x=1756210605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wPpJDpKwCk8DlHPLkdpXMZ7CU88+N5YZ57h5JDdv0c=;
        b=KZ4bi7lQMQYmCXLXt+gOrm6WV+HNV3rsbjk46G12h1WLnjCAyKjPbxL3exlrRoqftH
         gpIALYU08RHHiHoCi8dARRTt3DYBD5819myRu2biBkzTXI+YiS0fzs8J+Dtz4VmQjRfA
         P/8IurIUGOklTnzqMvEwtihnrMIIaLK34GUBoYejfaCvKGjTgi8keo1NzELhyKD5fqjP
         K3hFumpuo0BbKVy8xTYzTSkT7Pyo+5kIstSFCbIZ8q3uYgYa7W2CZThVAXXMDEwmA2Yu
         3bWzojTeDHmn1R+Y4kjuvFa/PnF+nOehqB40zcz0/vHMIoShKwMeS1XDJJpR3V/uW9lT
         RLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605805; x=1756210605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wPpJDpKwCk8DlHPLkdpXMZ7CU88+N5YZ57h5JDdv0c=;
        b=BvcfsoRkhIrFqdDlICguwjKKeGVNTTQkjSH5qvmymVAlIhRK1WK/1JmrJmIvmo9sLh
         K4W4fTJZBwwTjmekMYZddszFce+V4vklD5kXkyUQnP79vij+fuRx5Z6umPDF7VG3fVen
         YeLIsF8XxKvpVnhwn4j0JmSDC4TqCLz8WLGEzsFTnPQQGY5EbJBQ9PYe9NPPT8uqkG94
         wCAcNrwKptHFDgNj5eEVtrGU5eu2o721BAarUfIE749vPvRvx8yRyHtRhD/tF0vDC/h8
         +G0GORYFzVN3U/jA+hYgr4pwBNkWGten1eiC9w8VW2WCiyD0hCeH7hgQ/LuT18TWD8/j
         UtYg==
X-Forwarded-Encrypted: i=1; AJvYcCUzlnotXacvCGnKZJx/gRYoFzG/lnk4ZhjSlfZMKNwnZFi0+aGzSK0cibDbDyvEbjSaX8ETo+FT4ysdOcA=@vger.kernel.org, AJvYcCViCAGREC1ypAOwRJLY1WFu6yXkqE67iWyShV0jfIdQsJu6SPjiYoLgpzAauSKZtG+9G7LGhgKpduifKRoC@vger.kernel.org, AJvYcCVkI4qrCgihnM27QG/YraKhLxD5c24xhWXYh2bqTR7IN1sEf7LnOtCoeo1OiKNUJR8MjiiTeddKHZ+2@vger.kernel.org, AJvYcCX7e8p3HuGYGmRtWWPglASZCue3/hhTHZLRlC1xI2H5nmTWyhBnn/XzQVHnbp/JBZ+RyVolhlJUkjSa@vger.kernel.org
X-Gm-Message-State: AOJu0YzxOHKLJIoLUoZA6zx3HM+MtuCp6mJwtDYXKfPBg4r5uGL+BQCF
	aJeDh6JjlqqRZvFS9e3Q5tx8uXlHDETtAsJ9FTTE2ERHJ8y5QbP7Xa9W
X-Gm-Gg: ASbGncvNovFW+s2PGafUmlVKYNeaE3zO0Gy2xpe3uqhtQdX3du0MYH5L6tUno1Z0P4D
	OMuyY0ZkWSSCAbZhPbtEmw6FfzqNJbbSCwd4dkZwpqUwSFWPGS5cgIUEiLDROT7oeTJtRlc7v6+
	nG+JvFE5JcmpYUoEGxHCqAuzdKI6vo6tibTq3HNuSp2/EcJI4A6jy2SKNwKB2hB6mymly7bG4cV
	mUkdCvzAkp/isvjJHCZQeMpNUCRBVR3ZP9u5Q+gXOkfahnrVgfnnVyOc3VQLjBWNC9kiCkjccog
	ZTj07vBeTTft8HacjuVoj7hrYCN+ia75RAyKynf62i3KLobrupronXbzYAthGT1/tni2QHEjN+w
	4yyjYnHgyDFtTGA==
X-Google-Smtp-Source: AGHT+IFmaPaAq/FduUBB1m9MQ2NkpWZueEPAYDNEeu+6/eKSUzGZ0f4FXW8JsCOBd9mrL2w0lEtK2g==
X-Received: by 2002:a17:907:2d25:b0:afd:d994:cb2 with SMTP id a640c23a62f3a-afddd24961emr211057366b.64.1755605805046;
        Tue, 19 Aug 2025 05:16:45 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:44 -0700 (PDT)
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
Subject: [PATCH v1 02/19] dt-bindings: clock: tegra20: Add IDs for CSI PAD clocks
Date: Tue, 19 Aug 2025 15:16:14 +0300
Message-ID: <20250819121631.84280-3-clamor95@gmail.com>
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

Tegra30 has CSI PAD clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 include/dt-bindings/clock/tegra30-car.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index f193663e6f28..14b83e90a0fc 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -271,6 +271,8 @@
 #define TEGRA30_CLK_AUDIO3_MUX 306
 #define TEGRA30_CLK_AUDIO4_MUX 307
 #define TEGRA30_CLK_SPDIF_MUX 308
-#define TEGRA30_CLK_CLK_MAX 309
+#define TEGRA30_CLK_CSIA_PAD 309
+#define TEGRA30_CLK_CSIB_PAD 310
+#define TEGRA30_CLK_CLK_MAX 311
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
-- 
2.48.1


