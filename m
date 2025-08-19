Return-Path: <linux-media+bounces-40265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0B3B2C31A
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59AA61BA5D51
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F9134321B;
	Tue, 19 Aug 2025 12:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4YFVdEb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC243431F0;
	Tue, 19 Aug 2025 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605819; cv=none; b=dRSGagdO86ohQnwC1dN80gpYuFicTDNuu+rp8OUS+I0XID1t3IbR16NKcgF010aeYdfbiXFs/yaYkl6GtppqAkhNXSTYb+iiZ4lzwAEbQwKrvCIFKH8av+2HtxUAbO0lUpK+vd7OM6T5xjUOarHo5amB9Z/HE48A4MAdpKczNuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605819; c=relaxed/simple;
	bh=87Z/cmYg9Ze7/UgPpKn9GNeEOuNlOtwsIr0hlMdHq0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugTss0pbyuMP8EES0IhZv7pR8QUo67oaBWLgrYpEmy5Ts/13gJvgDPdPFjHJQ48mvGpM26B/1t1PFcEpphw70nJZdtFvBjgqyqbOS4OM/6fz2tOQbJ0l6ZEMIq8RSVZahQoTHRgZN/mliKzW1/Mxo9IFqHSTIaTmqZmWkHDqWpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4YFVdEb; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb73621fcso608243966b.0;
        Tue, 19 Aug 2025 05:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605816; x=1756210616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fkU/a+xa7cLVNmfOA736vjbmCxRfQxiZ58RMOVvwos=;
        b=Y4YFVdEb7D7KsMwERvtDXe0ZotCiMDPrVPYqhVdU46S+uMHajJtyZNPyoJb+hWl6vv
         qzX47Q/e11Nswtr+AGjCQGVeHQrTKLhCRTOd5L7BEGTULR3LACcj+JcPLpoGtInHydou
         l8bn1pOzF2EZpAtwudTQJCsJSeUvSB6PGQHYB4I1ZhoLZSnxTdVN8fc284Z1kggERbE9
         AEUCo5axO0X25KCQMXZzcvv+B8zYEOw+B2qypGCYO44oThRCaY3Nkvrug2MJUmj5qCF+
         +ZfF8RmIfny7Ipctv9jZmq9G7zYnRFqb2nYJBtO5TiR8aCWM61kjAXsUAQgwa60ohH2q
         ppDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605816; x=1756210616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fkU/a+xa7cLVNmfOA736vjbmCxRfQxiZ58RMOVvwos=;
        b=VmHT/N7559mvnrHBG7b/WOKwqwQpLGg61TLzR3tLQ6WIEQoMNTatWphieIgz8z6148
         ki18vokFVx0uSBgjqDFzrNMHLU0EfvuzRYKiJx8usFd4Y2q7sICThak1tQbwuhd1BLAi
         TriF7K8uP20hnnPP500NXooDYoiV95FNFblfdNfikjyUkiPq13Mt9K362gHdwkWMYJIF
         Rtdx2yMvi+tP6nmHuUFaCeXeHX26562hizSwO7JQ7sM6wE5ePyQdPCSBJXcZw2AqntAw
         PrIkZ6gaEMtFLpw5peKui4z36wG4aFeLKiLcTafdzoRv+sMkHjjGpgFvQ3cp9A9VZSYG
         h9Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUSQowlF8F6CASgN71DMBPcqCbey62h7UQiEfJEfSoQwLRvN4WClMWIgO+XjaZIySnOsxOXmlSRBBfwHViO@vger.kernel.org, AJvYcCVLScmlTTLumqdRkz/m0UqKwPPI9cNjxbacUX+4P1v3yaC6lgk7N/3c8XyZeQEDrSJkfBv43cR3zflj@vger.kernel.org, AJvYcCVyFYIL2/NTVlbgTn3FU482vL/aNvBEvr7HP5uIp7gbbugCiIMelNDupWjCSxDGDN85HRVdil1h+YV9A5c=@vger.kernel.org, AJvYcCW6mjGYs+WoAxYjhhyU8ePsHzKKgrS/s0p+uMuhgU9kN7CAWgOhXSBQ+Go/QOQa158Wiy96auVGkHty@vger.kernel.org
X-Gm-Message-State: AOJu0YxiElesITAlaKod/56Gt9yFpqiPSymumdOIn5WO6WWsZL3NjGUZ
	FwUbn54AklhUIw2/+PJipf+S0lG6v1nqpQNPIZYE1Dk+Ppq1xBTD9KFI
X-Gm-Gg: ASbGncuZ/ykjBhUFIGf9UfzPeiIXOynT98ntRaYwCflCEnaAqyYYR8b4SmLpYhgBq1t
	h1+UeZKoKMRMHgO7zTNX/c5QKaYNhW2JVBJRQL8x3w3oeuCSXeUN1r6jlKaoSYgpY7H+vSJBe77
	cn+h+JyEkqRP+k+z90pH6m+kyzlbJneoGb95U+0JlFGwtoVNrEKbfUwhIqXdwvDTqmOgg3bW0IU
	u5wjHIcXI8OYUKTOUduTUgAsFcdAWVZ0fwOGVl3jpRsVwn1s8ejKz+MvMijtbdw9FaJ8KLpHvtI
	iguTGegMqLzzxPKIiMMWJna9zzNiGn7C0vSq6AMoYxwKx8goH4ikZbmyNXXvlTXJvnKgW4al59D
	d7cVvoSrbeQBKsw==
X-Google-Smtp-Source: AGHT+IHJ4yXxyFDH52h3CZln8jXl9xdbMpK8BdgfQdr6A++kmO6oEQ+K4jjTD9jwnpkwnFwOUoSZIQ==
X-Received: by 2002:a17:907:d78a:b0:af9:36b3:d695 with SMTP id a640c23a62f3a-afddd1fb2c8mr241450666b.43.1755605816012;
        Tue, 19 Aug 2025 05:16:56 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:55 -0700 (PDT)
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
Subject: [PATCH v1 08/19] staging: media: tegra-video: vi: adjust get_selection op check
Date: Tue, 19 Aug 2025 15:16:20 +0300
Message-ID: <20250819121631.84280-9-clamor95@gmail.com>
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

Get_selection operation may be implemented only for sink pad and may
return error code. Set try_crop to 0 instead of returning error.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 71be205cacb5..4f67adc395ac 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.48.1


