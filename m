Return-Path: <linux-media+bounces-49873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D774CF13C6
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 20:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 827A930071B4
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 19:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37006314B8E;
	Sun,  4 Jan 2026 19:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHW2JD1c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA2A3148D7
	for <linux-media@vger.kernel.org>; Sun,  4 Jan 2026 19:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767553561; cv=none; b=kselGSEqFwa4KjVAOlL0cAkydFxclch7PbHrbYTRsIpPh1ZX7RR5fO5hsR1gPfj8Evxrrm7HWOjxcJoHtlD19AyZgPZI3Y9QTblu+ZoBxOhMizMfzp9Q8ZMjJHne6n3ib5kw3d1HDT2VuDZloCqnT3hxa6Ars+maEoZd/j2G1Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767553561; c=relaxed/simple;
	bh=W6NyjsgqJpje0GxOZQmAwqJGhMN1MSoT9QtbYe3sD84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dt3ZmBlCW4xGinAbUbqhq/iw/HDIUvjsgDj4wYInWpY3l9oia+1K3UOyM1utjtMU9yZZGAUxi2IsThMKrSLUoo/DBtCvxa4ihrvTx5Dk5Ciq35cyGX0lRz3uSCMwtAq2SdBdeK6GdfQ9qCr90odAeUG4QXowJP5GhJcU+gLbKQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHW2JD1c; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fb5810d39so8815998f8f.2
        for <linux-media@vger.kernel.org>; Sun, 04 Jan 2026 11:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767553558; x=1768158358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPN4xTgI6JHPvReSWeqoK8IgjRhln3sF5NWInwVvHG8=;
        b=cHW2JD1ctGV9jl/zTZxE3kqvjnsLhDScY+NXucRTI2zVeNEwugupJLi6fbJ/0Hfk3p
         1k1oHTC8gc1SnyfN+0GU4DxQX2JF517GRs1k4Gpm01/hf0yvbNxNV3icKhol7fLOSAcS
         8mtfKDnguV5R4oH2LUvNwQxYjD/Nd2Drop+ItHI2s95yVdHyLQvoXAP6JnrosAg5s/Di
         bn5m199o7LzhV0i9CkaORhkq7lCgt58jmvyC9+gN3xhPOcpbWfOjxjbWSuAOT9SVV01+
         QdVIU3q5fkwKbgt78ST4DdbYSl+JCXd2KB+uvx3hBOrjTs/aY7uJ6H2yC12o+VHU/AaW
         Z5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767553558; x=1768158358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mPN4xTgI6JHPvReSWeqoK8IgjRhln3sF5NWInwVvHG8=;
        b=pbLiqTRXj902MR1rb8mVRgkKrltjJZgaxhnfe1E6fYd/tIyoQg8R3GYzAsVJhwF1Sr
         Hgih5VWLiR3GHx/1ndK8A6ZOSYdn+uGBdD3oaQGD/Bv7la1qKUYWcWsTNViX45AUVuEQ
         370js8i6Av9dbiFbA8u8NrKnYzyOCUQKYDVjouthiNRP16YaxstUCfSUJo6trPaaiPqP
         5twyo/+tReZtYU6fXkl/lBQpXqlnNBohX+/xos8Y06Z3oriwFVvQRRe4MKKpD6KM4bcb
         kd9ocRxAAdVWIvB8ohOJaIuULiGLzt4YZQSOkPJHvcE+VYQC6RSG4/erIRXKqzI4I1xY
         wNGg==
X-Forwarded-Encrypted: i=1; AJvYcCWofhUg1Uyo1T8Ao0ogr2YGRC98+buDKwR1nslehKyqKNAOgSE9GxQ/LUOMVPh4Blr3FZc3XIL6q8InPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQXuokWazdamEpOJ9Qc7g1jmo7QsjEwrXBUeX8B0LmWRmrAL9E
	fAc7RdOkSHnwfG+HWvGwR6zhmYDyCGkcKPOFgUG29YNL8Qh4dULbZ07D
X-Gm-Gg: AY/fxX4U/HZKRUr1SGKNWjrL6orWMU40qFO+uBCuN2+oEyWGX6IFNbArw3wfEHOWNrA
	VCbn2Cedi+Uw4RfZXvP5YL2NzsiNaRvT3x9lGfXNo6Z6YrXQlBMgfH4GhWoCiFedspwxUUObD8e
	529Y176LqQ8X/jllQ1Y8DQyGdrVzNKgzWGqGX2EoTHnllTX2IT53uTit+vKk8lerjZnx8nAK+6J
	32zF19HquPbjFZDw0TWRtLpEL2OojECWG9F9NCHYy2U+bG0q+9atpsLthRvdU0r1rLbAbuQeDKC
	5JvJCvRDCVDH9utjmvzJrURjYN6ZG7N9wVwi8lKXTm5cz2p2oNn6SxXU6abcOMVHrgnctbTczzk
	Tiwz4DC7uSl35C1twfj6ApVokHgiFBPZjHY2iIbQaYuI77KSWqclUony0EqlIfdMylq/uhYR7gQ
	dU1wSpcTsD3QCv7t3DyZgxonpPp78F1mT8BbnH0H0=
X-Google-Smtp-Source: AGHT+IGG1wvzUbObPV/Nlzp0VzBlVYRvQA5fZ35AlHFfaESwLJK1dRu09w7xLw8bYO2P1pz4+O+HKw==
X-Received: by 2002:a05:6000:290b:b0:430:8583:d189 with SMTP id ffacd0b85a97d-4324e4fb659mr64947627f8f.39.1767553558167;
        Sun, 04 Jan 2026 11:05:58 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm96505089f8f.42.2026.01.04.11.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 11:05:57 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] media: atomisp: Fix function signature alignment
Date: Mon,  5 Jan 2026 00:05:06 +0500
Message-ID: <20260104190509.19683-3-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260104190509.19683-1-mahad.ibrahim.dev@gmail.com>
References: <20260104190509.19683-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings regarding lines ending with "(" and improper
spacing for indentation.

This change fixes the function signatures for both function prototypes
and static inline function definations in mmu_public.h.

The kernel coding style prefers arguments to start immediately after
the open parenthesis.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../hive_isp_css_include/host/mmu_public.h    | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 2fc137ef46da..90a2e4e8f510 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -18,9 +18,7 @@
 
  \return none, MMU[ID].page_table_base_index = base_index
  */
-void mmu_set_page_table_base_index(
-    const mmu_ID_t		ID,
-    const hrt_data		base_index);
+void mmu_set_page_table_base_index(const mmu_ID_t ID, const hrt_data base_index);
 
 /*! Get the page table base index of MMU[ID]
 
@@ -29,8 +27,7 @@ void mmu_set_page_table_base_index(
 
  \return MMU[ID].page_table_base_index
  */
-hrt_data mmu_get_page_table_base_index(
-    const mmu_ID_t		ID);
+hrt_data mmu_get_page_table_base_index(const mmu_ID_t ID);
 
 /*! Invalidate the page table cache of MMU[ID]
 
@@ -38,8 +35,7 @@ hrt_data mmu_get_page_table_base_index(
 
  \return none
  */
-void mmu_invalidate_cache(
-    const mmu_ID_t		ID);
+void mmu_invalidate_cache(const mmu_ID_t ID);
 
 /*! Invalidate the page table cache of all MMUs
 
@@ -55,10 +51,7 @@ void mmu_invalidate_cache_all(void);
 
  \return none, MMU[ID].ctrl[reg] = value
  */
-static inline void mmu_reg_store(
-    const mmu_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value)
+static inline void mmu_reg_store(const mmu_ID_t ID, const unsigned int reg, const hrt_data value)
 {
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
@@ -73,9 +66,7 @@ static inline void mmu_reg_store(
 
  \return MMU[ID].ctrl[reg]
  */
-static inline hrt_data mmu_reg_load(
-    const mmu_ID_t		ID,
-    const unsigned int	reg)
+static inline hrt_data mmu_reg_load(const mmu_ID_t ID, const unsigned int reg)
 {
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
-- 
2.47.3


