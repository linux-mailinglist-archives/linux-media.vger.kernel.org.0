Return-Path: <linux-media+bounces-41906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB137B46FC2
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 16:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80FE23ACA29
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 14:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6AF2F4A16;
	Sat,  6 Sep 2025 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV8JJ2WE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB32F0C76;
	Sat,  6 Sep 2025 13:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166877; cv=none; b=H37vmylT/WMarUVAeKa5QdiwpXP4NI26TvnWyC3fj7YgjCYdyclVUhT6V0Jb+YHbi+gUzVw8mWa3fKNUPQKwqq/SQfSZIu+lJUML8yMz5O26v6MFxXMZpFcoRFDh0v6G3eLKV8/JY8Lxf1ASM6GtYcSHlEE80kGvik604GKBb2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166877; c=relaxed/simple;
	bh=fJShAdTcKpZMzkDxABNR7aNe5A8MwUP+G36B3JDeLus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ORsi4FaUgDg5cVGILEhkIhl7zR/UAL7dT8pe18wTYYMMD3PTKPYDlNa6q6QU0Bl93FTR/X0R/k7l2LD4/rk51EF5cH0vo1+ppMlDZwzqBlKLucQIyI8egvBcEnWS4j61/d0/4csfMyV5guMnG6UiTpX2UpEAHYM8u4tIlZo01Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV8JJ2WE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5608d792558so3492341e87.0;
        Sat, 06 Sep 2025 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166874; x=1757771674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNTsfQxNPr67Asls944jtBoWmsz4/ks+GrA5zAOV45E=;
        b=cV8JJ2WEmrzHUlDfSadKI/fOhHpyLCuGfql74KpwU7dC0pSc268pCbxKEu/kCaU0FV
         hSUhdeylnkBcdUz49K3s2k3Eeqh1rO+ah+sF9kyb6cSMN9b0Nr8ys51DuSiHNNliJAsV
         NuZL+A33NemNdYKrWSBIPcyiz9YLQ/NHJHw20ZhK+J4l9+AAxGB7rLKSSa5aRad1MMNN
         szOql0s48Xfd7sZ3h43jqy2ZE47KWJe8MSEzUzhkRXUTqBDEzanm5p0fwP2GvC13vluh
         x4frkWgqwcC0cflQmmxDNuJHBblUaY0/e7UeXRpusVw/2WmVgTP+rJipvgh3LFruk68+
         qqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166874; x=1757771674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNTsfQxNPr67Asls944jtBoWmsz4/ks+GrA5zAOV45E=;
        b=vrh+uyFnVZC3yQiauhZDO61u6Eq+pN39P5Y+ikVbQbEtvIEMx61lu2AnAmVkJp4fj2
         xED0G6UjTGVTKqQdPoTndirMygn4fmatARxJr+rjNwajpIVLu8M0lHCG8QBaPUCSfYWB
         6BHHaAKUzLzDmNkXJpsqovINBt4P4crXepO56oqcP71FT5Dr8FklJkCE31gAPAyv5l2W
         g+CdzFJPkQDBT61hCVsPN3UK4E3AahJojpOmrDaiqkJtj7bpVYM+FX3VI95YqTnUnzXa
         hvizQJtP1WnHVgYk1CQuCaHsergnMJ4ZvNJsUVB+gP6+pPkRr7Lw4EjXqF6xKZTJmgmB
         x5dA==
X-Forwarded-Encrypted: i=1; AJvYcCV01G6BlIEjp6KjgU7yN3YsnWgqYS/ajBQx/3ZJs2h018IBICyqnRTXbL9ATmFa9YZGQ2ovxtbwlS6lKCM=@vger.kernel.org, AJvYcCV5T5ukwb+vlx814qhtZS3SXgTEJn+XIak7vs/bEUVMz/+fQiaEsLHhqY68PHP46m3QchuVsjGjLl5SXbA=@vger.kernel.org, AJvYcCW/WKVX8Gaq0BpKNDBSWZc3MAmPmPgAA7SCgxjBIdfM/cIhoLAhoD3IL4Gh35EADfXIT/ZcDy9PHfeD@vger.kernel.org, AJvYcCWWT+8tVuoavK+P1GqI/ugC7aOchybLU2QZRvbipExEJWqMVmB5Z6z2xU7DJ8mSu8dm9mrXIZe+a3QKtuxY@vger.kernel.org, AJvYcCXMZUZlAmB8dVEudGA4b2laFWqTIBLBnSoL0GMOdlbfNlPEZ9x3neSYfibU4K83Lg7NTsvqyUlAsCRR@vger.kernel.org
X-Gm-Message-State: AOJu0YxFQeAEpZKyVynEfq5OLOf08cj3ZYHWDwdYdLQoYedC1sv0jme5
	HsEFKI+7vHkQE38S4EoTEWkgNnMUFEleBCuS/tuUY+80gc4+zfw4VQxq
X-Gm-Gg: ASbGncuJCb/GHY1BHO5WYXRHZeMRBNKlAX0s/m4IolofuHPbE2pBpePAsqUsQcTIHDf
	y1A8i4UeUM7wfEEwpSb6LKjNsFdx8V1mUc6DZ+Q9YCLJWgDv0gtuBXVcbxhBGqXN67hG9O9R1VK
	4KTcg7jwWLbjOrZLK6G36XisBhi7HLJxF4jKQarO22A55T+O/AyWEL06lhQd9mGtSZtDgDkqt1B
	UMYrA4gY3AKey2r3aUBnJZC+QbLwQdtJL22Kdm6RyI7sljQd1EdJZte+k1v7VfWHDc3uUoB5TQ5
	5XaUm6zFma79nx4tJ7YOcS00/q7Hf93X8AJZN9knPhnJheGaCtIJovWQmCwZi0qB7byzoqkwx2g
	hMbOwABUKTQteU8MEGUon8gso
X-Google-Smtp-Source: AGHT+IH1vblFyXu/7o3n3WbTvyGZ3MOBFvdatO7tkrpxQQblaA/pNjQzUSIoFy2wgH3lZ8pHhTFemw==
X-Received: by 2002:a05:6512:2213:b0:560:8b56:5dc6 with SMTP id 2adb3069b0e04-5625f53580amr634047e87.19.1757166873870;
        Sat, 06 Sep 2025 06:54:33 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:33 -0700 (PDT)
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
Subject: [PATCH v2 20/23] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Sat,  6 Sep 2025 16:53:41 +0300
Message-ID: <20250906135345.241229-21-clamor95@gmail.com>
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

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index f9adb0611638..20cdcc4e01aa 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -497,7 +497,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.48.1


