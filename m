Return-Path: <linux-media+bounces-49804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81437CEBFEB
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 13:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B6573032AE5
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 12:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F390B3168E3;
	Wed, 31 Dec 2025 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ijs1SRiR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9487261B9D
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184815; cv=none; b=nLzn5KUoGWKpdV53wqmkdsBs6vYNpiNzK5BMY0ZC9rVbpOGt+Xn4yc0REcuO89P0yl6gTPI88XCOrcB7Jau/qzxO1+QAZfa5qkrGU6Xmu16q5Z4hAefpfXrIgaJ2+9M38mKm6faDq9+9OuZpPSJTvAXOQ6lCfvGJX2IWVSHe5yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184815; c=relaxed/simple;
	bh=QeOzoma0bEwKJTmy78B7HhWmFn2PQZkre2zLCJd9faw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iyduz82WYIb3yxznWPLBEsWHStEWD13nhQ7FTsaSj17MyyMV2zh+0q1raSUkDJ17a+I8cPLJ8WhkD4isSWthrUvFrhMRumH5plL1LOUygESbIMVtLdXuRn2zjQyxlAGReUMMiRhCAF+xK4Zl/DDGccB57Ec24FwkuBaDhrX2aSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ijs1SRiR; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78fb9a67b06so82984257b3.1
        for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 04:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767184812; x=1767789612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xO5H5t3OeipHl8rga8srT12DcrRvTCrCfotIF69iAAk=;
        b=Ijs1SRiRqjPK8XxiOOU/0HE30fg3eh+xa9AHpcRJb0DjflofVbJij7WwoH6rwAEKC8
         LT9I/2a/EiEkKExo8Mc4cu9nv6FtBnAWy4VbzXKCFSG74IKlDtTVsKlHPvTA0Znm2XHT
         gbjC0vshFnOTldB7Bd3Hy8yaFsGRE/Ibd+TZvZY5v3obkIAiQc3SGeDmSfljiEGA8F68
         HXIv/xzaw3rozXirPf+l4QWcIOqVV3Z8EDibmiBNwCJPndTcSsSlHH5UFvN4QjkaUuuk
         XUBoDsIECQLVC8X0lX++EEdLLPbDVpPINjFvc/2YoSRjMejU3JUoqzu6uqPVnnhOBRd7
         i7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184812; x=1767789612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xO5H5t3OeipHl8rga8srT12DcrRvTCrCfotIF69iAAk=;
        b=ZS+b3Qr+b8242z03ss467f57DU2QCUMLMFlMz6R6l+YW7br1vtYLgHPYhgIjtK6IpD
         UePshKZ5ogPONDO5IXfEG5UneX33YXNLAvYnO031rViRDd+52tv9NAuDw6V0FmNlf6Cj
         gmP0dlT22eIqZ3XniYCnvQInf51X5YtIkyvg9oEIdUYDxh5GQLZeh2wiTytj30S9JVPj
         vEFijyBUm9tBtIdlgcTLsLwHUbzM2WEuX/3uw6U8cWFgkKIyT7zk9yV+jdAWXL2U+DYa
         ewCdSi4J6XnhVnZEER/qJPtJIUKb80LWLbEEtRUvIUx0NxfUXFBr3JEWQr9EcuI9W9jq
         0cLA==
X-Forwarded-Encrypted: i=1; AJvYcCUEw7g4rzKtYeyL+5N/1uPjYG1HKPeCGamTA/M3L0PAI51RY0yEBAmmvSasLsgrfMt4lfNrvgvUGtp5RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYih/MEPJbENNlQOwCPd+hYt6wa/wr4cAXHVyYDQwFiWIoWH6n
	WXV8sszmDodFviLgG0wnMjxQaqWWg8rbkDnqLWJdKISPFLVXVKHG6EnD
X-Gm-Gg: AY/fxX500uM/YcCVqqKXl/bfJQzmNOnpVhELvqXrGGUnfYZAAvC7g0DUfo1vY4o2eGY
	SbEgl83Nr/YFuKTkFi1dG+gGbd0yb+ogLnQFqm6WUm8F3hOgErm1gNWFSmW7xyYIV8jryBv5jQG
	CNDLET2bz+b0CHiYJKPulK8cfdKu4oXkgJLCqfGR9S1gddBwCWa9BOYuB10W23RvlmBnEQOvYMi
	LeFxSRm/eGC75t2ju4MOhvc1ADapetAQJOkDFsDgGHSL0eu1jil2mBaLqFQnigZUuSUQdZmS+6x
	D7L3ihf8sDmBn+FQH1qcx4WDGoQHHi8Tcv+OLQamHaf4HK71FjXXUY/ziYjE9B4z5k7cS3lC3GK
	J5FPCOOez+ZTwx5w/bM1cby++z0w/gnA25dJOBT1f7kTy9mo9cU65JnHfKcnWfkXkzU8zaVthZ7
	gLNoqq/unBXFvAqJVfHHPtbp5PshrAOzR/FvR/xItB8GAB1SC88wnFeUDZZAfEbNj2unLbtPtrF
	U/VfUs=
X-Google-Smtp-Source: AGHT+IGJFWHmis9CdJXj7mgYsSVBx6L8ZVMm9aBmS3lTkz+kX5H35E381Fw8LrQh+Ej4t0OC3yedUg==
X-Received: by 2002:a05:690c:64c4:b0:78d:6254:d162 with SMTP id 00721157ae682-78fb3f517damr306846497b3.31.1767184811814;
        Wed, 31 Dec 2025 04:40:11 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb43b2690sm137555257b3.18.2025.12.31.04.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 04:40:11 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: linux-staging@lists.linux.dev,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	mchehab@kernel.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 0/2] staging: media: tegra-video: clean up shared SoC declarations
Date: Wed, 31 Dec 2025 20:39:53 +0800
Message-ID: <20251231123955.277384-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up tegra-video SoC data declarations shared across .c
files by moving them to the corresponding headers.

No functional change intended.

---
Changes in v2:
  - Add exact sparse warning line to patch 1 commit message.
  - Add patch 2 moving tegra20_vip_soc declaration to vip.h for consistency.

Changes in v1:
  - Initial version.

Sun Jian (2):
  staging: media: tegra-video: move tegra210_csi_soc declaration to
    csi.h
  staging: media: tegra-video: move tegra20_vip_soc declaration to vip.h

 drivers/staging/media/tegra-video/csi.c | 4 ----
 drivers/staging/media/tegra-video/csi.h | 4 ++++
 drivers/staging/media/tegra-video/vip.c | 4 ----
 drivers/staging/media/tegra-video/vip.h | 4 ++++
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0


