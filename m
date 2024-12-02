Return-Path: <linux-media+bounces-22472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C1C9E0B32
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 19:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A25E0B38E2D
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8E07C0BE;
	Mon,  2 Dec 2024 15:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ToMIJWYd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC60A42AA9
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 15:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154442; cv=none; b=Bks4AN9sHwuIEz4lmPGMeznvadIi7oI01/3bznnagip8nv7S7fqBg/EB2jax2FFey+Vexynbl5Hjxasqab9Y4I8TkHpTqYC3NZPAmMFOC2eFg69o/+FnlvbJUDFXKkK9lYDBBJWHMp5tWQuCXnHBbnsli3MtUIq/FtCrLlWN2kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154442; c=relaxed/simple;
	bh=8u8fF5ha9BCebV7dj4HE28mCFH9G7mXA1hYQMfM+p5U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kuhRasXXIkld68XqSmlosfqxaZqwMacGygcAPjEUAqRtwpb/dvACGyWwYk1eFBe7kQZ4oVaO+1xiTkZyLKZjC9dHn2IYK4JY/NX2Mq3IqFdp1vL53gZpoTwks2LySngoyj88jpzjX2yBc2OXyHU5Q7UliLvvejUTEWl+FDN1V6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ToMIJWYd; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3ea33a922afso2111489b6e.3
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 07:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154439; x=1733759239; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QNctqgbgKX4M7vIwY0GeY040xXoP0R2au1vBq2qCPD0=;
        b=ToMIJWYdjn1xjRNOSE7806aXxCZX3OETaQJaAjQRFuaoSkOeO1dUmVOlW/2aEzZI70
         r2WHSEfa4rS4xxfVkw+es8Im6eaDw884Ck4Sgna9YI4YCIP+aNKJjawdYMEEjkTC/+8m
         auvhAd/zsa7X9NbSuoKyWeQztCuHgMR+vwDqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154439; x=1733759239;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNctqgbgKX4M7vIwY0GeY040xXoP0R2au1vBq2qCPD0=;
        b=pS6flz6w2ZpkJnCg2TLdutsUobKsQ1Of582Alou06UXAlzZkACylt37PLIMzmvuQq/
         5o5i0t7GGLVPY4u7TOJorXcv3xDgeKk8G6vEshFhB8x3BvcRP2fHkNmI8PQdVygbleFY
         vqRGei4tFPUxfwQLlWxcXgXhMhI9wuZlpV5NnNU+SSRHVYlY4gBMZTVnFfNScWTvgE9m
         /UwO2Pe1bQsZsD7Xl+nTtz8pIGJMTc/anAUHFVA++U5OLkSBLuoCaJ15GB6xtT3MWSaQ
         mvXnajrceJlwxDxoF+FJnuA276LgotheuwQu5I/H1QD/OFA0kGkH/RKSYDU2z2ohFVe/
         1UUQ==
X-Gm-Message-State: AOJu0YzJQgH8HvSE6zhPvSnyvOMUzdGQ/mcRilaR6Q0xWJNJ0E0uk2Y9
	+Vr/UB2RE4lBe+Qmm0DYc5v59iOSp2x6PmU4p4v3qft3cORVppLbqsa6GiouV+SaJKaRLp/Wla0
	=
X-Gm-Gg: ASbGncsz8oLYkKYvCS5QbHU49k8Y7LxakZydps5DrqUgcVhVnVH+ggTWtKP7OZZO+Y/
	UFqva0F44aMBCmr5HqVCRCFZMqXazpXx6Q5atNVAkdkpg7c4ye8GNbwYTvnFPa0XTQ1bqh1L/IU
	A+5SPWOrckWkUE8BIuRqa/hjM6PdEj4O7h/mp25C6e7VA948uVsd2VH4P+RczOY5J91vLj3m6WS
	onfd5HBHPzaGkkPrgt13uhdpZS3vyrWTiZ6uoeufiSCptQ6FGQj3U8CG++JlrGkHqJSZJTbB3H1
	r9oBB/4cpURUYOhFtwKmrNbA
X-Google-Smtp-Source: AGHT+IH/7hpTfNse9nN9Jr+DgfzObAaRxU/S7oa2RXexy0e4f94BDSUNP4uGp0FObZdTBwMHoHxTgQ==
X-Received: by 2002:a05:6808:1589:b0:3e6:2471:4d10 with SMTP id 5614622812f47-3ea6dbd43f1mr21613568b6e.11.1733154438947;
        Mon, 02 Dec 2024 07:47:18 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:17 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: Fix warnings with llvm9
Date: Mon, 02 Dec 2024 15:47:14 +0000
Message-Id: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIPWTWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIKGbllmhm5NTlmupa5JskWJuYJpsmWqcqgRUX1CUCpQEmxUdW1sLAOK
 puwFbAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

When we tried to build media with llvm we got some new warnings, lets
try to fix them before llvm is part of our CI.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: cx231xx: Convert enum into a define
      media: atomisp: Use the actual value of the enum instead of the enum
      media: mediatek: vcodec: Workaround a compiler warning

 .../mediatek/vcodec/encoder/venc/venc_h264_if.c        |  6 ++++--
 drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h            | 18 +++++++-----------
 .../media/atomisp/pci/hive_isp_css_common/irq_global.h |  2 +-
 3 files changed, 12 insertions(+), 14 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241202-fix-llvm9-4c8d705c9e3e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


