Return-Path: <linux-media+bounces-38499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A68EB129A7
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 09:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5BD618875C2
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 07:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4C6219EA5;
	Sat, 26 Jul 2025 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1NM4WUa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6EC21D3D6;
	Sat, 26 Jul 2025 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753516409; cv=none; b=IqsDYHBP/FWHetTMGjI4tIc7xtohcASfwql261/QBd7H8dLCKZ8GlTQYkZxphaueVoROARQOWQete89ni2z10ebSxDw843ShdFpA+UeQ08ixaoQEnS9Q2fhhG1twmMtZxYRGWZ+xFSVtYIAIucSQJ3xHmxhHagE8C8RSnu0jIzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753516409; c=relaxed/simple;
	bh=752J59Up9Dkl2wk6wtFop0+RMo2J7LXtlEHlg3GiSyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fDfsYQSa9brkO/tPOtolL6622zxIgKWZDmBF72ax8rXL4DTbP/JgqHPVZZ3zm8kDgvmeT/JbdMbgMAeEIArW71d8v0XX2XSAZMGIZUx87wc/4wgg3GrO6aZm2KnGFZv0Tb9Btmtpq6Fekv97aT+Q99f27d5cd+Xw3WeVi2jLrlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1NM4WUa; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso2640727a12.3;
        Sat, 26 Jul 2025 00:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753516407; x=1754121207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1A/xIfVprRRXxQtXJqBwfAOsQMkFGtKU8TZczTnKVAc=;
        b=T1NM4WUaRJjHwC7zhcnFlMtOgOZ/nBaCJoB+ugbH5KvVK2kv/lN1IluuLkBIb34+Uj
         jcuHqvaEgU4FXM51xpD11wSFTv4sB3qsYCmVFZ1WiQ35JHigKR53FKCWJYuHcGrKugrz
         bdRDBbSBSK+GZ+hLR3Pw6zexQ+CphjgjPF5a1Doz6+VEE9zZmfg0zo0kpSppzGoWIEc5
         ofyOAZIPn+8kVM9Cu5JwCKcNLfhEKpXwDYK/axXYFGBvdkDdybMQc32yz3QhEVrijv3O
         I0irtQjEyTezmkjne2p4O9LFD0vkZTQ+QUkc9w3w8KT4ReJdeJedKyT4pReQd1aW/WLx
         m6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753516407; x=1754121207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1A/xIfVprRRXxQtXJqBwfAOsQMkFGtKU8TZczTnKVAc=;
        b=CH61SPVie7e/CsIGDFQQmwfiLxEd8QhFsxztVPJxl0Npn4FUTcIXsjHjdpmv/0WKjU
         9sTOarRM2ww8MsbbFyOP34OY9Kbv2Gt4Nf/xuOZ4A2qNC8z+2K7/M5i4niAEqKJiT1+x
         Ku6a2+Cv18Mxv3LfeAKeA6MJ+yfI4ws+IEufjoFnKQMhBa9IuG5dDOBFmYsuMIZWw0gT
         jLOpnSsL6mrNGRteL3lYoK+kL85JjMla5Gy4WCIvwyxjJMBxwj9pxH7gKOdGi7pQ+wl0
         iPEclpJRky3vAsWPYlx0cODDGUFgwXE5PBrweyXXGN/d9uDEl9l9EEgPSNH+31B2zx6j
         rDfw==
X-Forwarded-Encrypted: i=1; AJvYcCUwGnU1Cz/+joTSsc1fxBocsz7V57QlS1kxNu0FS1PNhbRS4U+uDaYtjv5ObNamz+Ap44fUs12z2cw7BMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRRyI7A9tl+4dp2FMb5Us+Qo1h0yIq6VdwOg/7uEnaqB0eEauU
	9V0qCPsBBm81GF0eilqCRxhYtSbujVREbe5U8maaDfo9s7bZZveNYFHY
X-Gm-Gg: ASbGnctfy1/jdcAytQoxteMDocf5gdzsXG7IwySaFRaEOhNQr51RA10O5BH6WC1nmQU
	KBx858TKokRRLS+RA+UB5Q68MDutYPlQmEimyow+N/3IKOwNlqSgFk8/MBVYWipyjpGQk5gqMWg
	lVfbwcoPFoHoGwCSUaa+glI4ohgYigRSBZBiWQy1NH+HnpepXk3mOkRPY8dNy9H8siomFu1la35
	Rgd3dlSffZGk00rUHmBifPObwrWAxeEWh6FflS52Fm+YC4Dp4RP/YHtLQCQn7FeEEkBt8m1tPHS
	6htryUKU1eZWAdlKSPZGbCvZtNopiOB72gNTiriguG6iecUTgyIEmLvnf8be/jJCAMr+Lp92Fk8
	Eb87re3449Za3101Doxcj3NNMJ8zsLocoLzZwp/p/mMS7EmTvpo1rBFWfSDVVdQJFbTBkQI9SHS
	s/4ylOuJcpAg==
X-Google-Smtp-Source: AGHT+IHjJRq6VZqcLgvT1R+VegR+hAxpAKInrmmF7hw2IZT0ZDQ+i27BRZuow8t2ibBfElLrXNoKKA==
X-Received: by 2002:a17:90b:3851:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-31e7787c9f8mr7661418a91.10.1753516407356;
        Sat, 26 Jul 2025 00:53:27 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm1234979a91.1.2025.07.26.00.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 00:53:26 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sat, 26 Jul 2025 15:53:13 +0800
Subject: [PATCH v11 3/4] staging: media: atomisp: use designated
 initializer in anr config
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250726-new_atomisp-v11-3-46eba1953fba@gmail.com>
References: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
In-Reply-To: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, llvm@lists.linux.dev, 
 LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753516395; l=1203;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=752J59Up9Dkl2wk6wtFop0+RMo2J7LXtlEHlg3GiSyM=;
 b=AUGGt6oYO1sWmd//49PfvQNrepM5uFn981+eaeQb9PLeVD4BVuaum0VF6BbmkScjGyt4ki+fj
 WoLMdm+dumWCFgq52gQ3wGy32R6D1kMBqA5957XtYjkV+WInBzQrMyQ
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Improve readability by using designated initializer for
default_anr_config.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 49c22a68ec552ed163e3268db2b823fc4ea73b36..f4dd3ca03d75c32a0ac3798af031c6a3423a73fc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -11,14 +11,14 @@
 #include "ia_css_anr.host.h"
 
 const struct ia_css_anr_config default_anr_config = {
-	10,
-	{
+	.threshold = 10,
+	.thresholds = {
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4
 	},
-	{10, 20, 30}
+	.factors = {10, 20, 30},
 };
 
 void ia_css_anr_encode(struct sh_css_isp_anr_params *to,

-- 
2.43.0


