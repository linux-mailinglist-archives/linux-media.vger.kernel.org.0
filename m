Return-Path: <linux-media+bounces-49874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A066CF13D2
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 20:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D64A3009FF6
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 19:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88DC314D2E;
	Sun,  4 Jan 2026 19:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdaOSVNg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE20314B88
	for <linux-media@vger.kernel.org>; Sun,  4 Jan 2026 19:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767553564; cv=none; b=NfzzXJp8ZP5WpMKLBshp0qLxvfR+fxNi7HqZKJNn0Y6dm2OoHEv4WdodwS4OwVMhd9lR8qgtBMNGN7Mow0MCRqL180lmTUPFTRV2XnEgSl1dqQBjKE0qrsoxQd/qdvKXN0T0aQWO72y+qP7J17rM8UrYizuH69wKu9NI0vvccJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767553564; c=relaxed/simple;
	bh=NSa0ydNb2NewPQiwrxnfe27gMuqCMYdIWFpwwvfk7K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2DZchj7iTxoSiK6WmPFcxMFytlQXWmAMznm/WG5jc8m17rLGon6kl5HLALn21gOngYwVqI3ROQTQDtIfqWxpSr0BmIE66hNomCU2vxc8JlpV/EVrgKris3uqRUtxluTQoSKpUJazgCdfqHHPqlzYTycZkN6NBiX6k+Z0a6pz9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdaOSVNg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so31523025e9.1
        for <linux-media@vger.kernel.org>; Sun, 04 Jan 2026 11:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767553560; x=1768158360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRnKQCftC330uBXvExSnKK33O3Emg004thzOz4/211g=;
        b=ZdaOSVNgNcI/Bf0AMbzJ/1xmjFerZF06sUwqFSRmMMKDIor0HpedwVTWQOn8ZZzytZ
         RmkHRQcoPxagMk1ijhLFhwe1GyTrCi3vfdp8X3fXJfRlkO1Z8fIx7pra78wmOYIzntod
         UWpiYzJRe8kX3pAc57kV1i8ExpAbN/baekv4NSJJuk/gJFgs+4Cw7jL3Zez4R4FETsjr
         le/mmkge/g+5Jh3qjXatkInV2+msWDQ3bpfnYeN4Zr19BeWzKX0XHoeEDFGNAoOyLX+V
         pZUceW2/Mjm2VPrE+y1ZrqkY5MJUveFsK3GYlSAagC3ic01Ob3D4aqzDp0SeWAoVpaz4
         qQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767553560; x=1768158360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eRnKQCftC330uBXvExSnKK33O3Emg004thzOz4/211g=;
        b=e4fv2PAozgeFMgKggE9zyLGZlkDkP4VSQvqTgNWC753gPpwFuomHaHj0ukh3MOZcrV
         A4qC3uLuJgtP2wgB0K+BR0zgH/G/kMGxpKojbBzgRKlwdnbYiBidvLNXVDFJ3hbqCy0z
         hZv7rfTDIGRJk+0z6xLvMa4Y0O8F7xvrwQUjwmR2yQrRyWp1XsbyZBRMG76o5IsQuR21
         JBKTcRw7gzD/E+K/ln48AE8tsY93yTmZJKrseLKnDbkbkRYrTGwvsR9dcMKpFmjJbwZ0
         XQ3wXCpcGjsFBZyCyJwg54cXRRWVpg4pL63K0WJNM1VwfeMQkScr7QnB0QnqPackceq5
         kgJw==
X-Forwarded-Encrypted: i=1; AJvYcCUXX7KWNflJb0NMsLfQQoR4QPm/dNTjLuV/MrYAXLLimuvBfH2fxkFEOML11l+Cfya0f53mUIcdPhHGOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4U7/4SpO/op1XT1hL7mBYu8VWzabd1Pfr7wC6OLOgU0qPSgrp
	VG0wGoYVYBMTLQaFfz53bQLwukOb1XUnE/GQwamnnieFEFV62pjEpSLH
X-Gm-Gg: AY/fxX748dcEwbRpORxhUHMdRe9eKUOlguDgTKBCvz2BpjN4H+PdIjw2J/StlfHNXcA
	V5c1B0e0OwaTtcSpe/zWYuOoCZnu4syEh/0DdNYmu7UC6XOQHwMKzCFTr6k1Wz4rr7i/0fHGHnL
	CWripA7E4YLNVx4a/5+wELRoqiAGuXpL05kEVUSj8xBA9LbyMNMJkfZy8sDMGnxbfgEGzG3HaS4
	IAUg9qusmZGy/xiV7MV2HrfmbunYbV4nbmIGJvApzv3wW1lb5yls7SDo6HtRJKc1DbvHkvc+Hlc
	m1eU0iL0HkD9zB5iH2G5III52vqZcy5fGah73+FJ9nbfYYB+hneKpyg0uNHoDKll8QXZKJ3OgXe
	l8jMNJ44NsWfrOKMBPXi67bhyDPXz1vl6TeohFlrcIMXjArwFi25/ke6hY7YbxxKQghNZuKEZoR
	HkiBIiwiVVf/zSg2x5D4BZ02ubkFgtI2fHngtQU/U=
X-Google-Smtp-Source: AGHT+IHsQnN2VPxYp9iDD0AHlXOkhb01+CEtZhlhG8AY1CequXMX/3Y8Lilm3EOsO9rHTI988aVnkw==
X-Received: by 2002:a05:600c:470a:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-47d1958a61fmr575821605e9.31.1767553560265;
        Sun, 04 Jan 2026 11:06:00 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm96505089f8f.42.2026.01.04.11.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 11:05:59 -0800 (PST)
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
Subject: [PATCH v1 3/5] media: atomisp: Fix block comment coding style
Date: Mon,  5 Jan 2026 00:05:07 +0500
Message-ID: <20260104190509.19683-4-mahad.ibrahim.dev@gmail.com>
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

Fix checkpatch.pl warnings regarding block comments.

Add missing asterisks to block comments to adhere to the kernel coding
style.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../hive_isp_css_include/host/mmu_public.h    | 74 ++++++++++---------
 1 file changed, 40 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 90a2e4e8f510..c3495ec4835c 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -11,45 +11,50 @@
 #include "device_access.h"
 #include "assert_support.h"
 
-/*! Set the page table base index of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	base_index[in]		page table base index
-
- \return none, MMU[ID].page_table_base_index = base_index
+/*
+ *! Set the page table base index of MMU[ID]
+ *
+ *\param	ID[in]				MMU identifier
+ *\param	base_index[in]		page table base index
+ *
+ *\return none, MMU[ID].page_table_base_index = base_index
  */
 void mmu_set_page_table_base_index(const mmu_ID_t ID, const hrt_data base_index);
 
-/*! Get the page table base index of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	base_index[in]		page table base index
-
- \return MMU[ID].page_table_base_index
+/*
+ *! Get the page table base index of MMU[ID]
+ *
+ *\param	ID[in]				MMU identifier
+ *\param	base_index[in]		page table base index
+ *
+ *\return MMU[ID].page_table_base_index
  */
 hrt_data mmu_get_page_table_base_index(const mmu_ID_t ID);
 
-/*! Invalidate the page table cache of MMU[ID]
-
- \param	ID[in]				MMU identifier
-
- \return none
+/*
+ *! Invalidate the page table cache of MMU[ID]
+ *
+ *\param	ID[in]				MMU identifier
+ *
+ *\return none
  */
 void mmu_invalidate_cache(const mmu_ID_t ID);
 
-/*! Invalidate the page table cache of all MMUs
-
- \return none
+/*
+ *! Invalidate the page table cache of all MMUs
+ *
+ *\return none
  */
 void mmu_invalidate_cache_all(void);
 
-/*! Write to a control register of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	reg[in]				register index
- \param value[in]			The data to be written
-
- \return none, MMU[ID].ctrl[reg] = value
+/*
+ *! Write to a control register of MMU[ID]
+ *
+ *\param	ID[in]				MMU identifier
+ *\param	reg[in]				register index
+ *\param value[in]			The data to be written
+ *
+ *\return none, MMU[ID].ctrl[reg] = value
  */
 static inline void mmu_reg_store(const mmu_ID_t ID, const unsigned int reg, const hrt_data value)
 {
@@ -58,13 +63,14 @@ static inline void mmu_reg_store(const mmu_ID_t ID, const unsigned int reg, cons
 	ia_css_device_store_uint32(MMU_BASE[ID] + reg * sizeof(hrt_data), value);
 }
 
-/*! Read from a control register of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	reg[in]				register index
- \param value[in]			The data to be written
-
- \return MMU[ID].ctrl[reg]
+/*
+ *! Read from a control register of MMU[ID]
+ *
+ *\param	ID[in]				MMU identifier
+ *\param	reg[in]				register index
+ *\param value[in]			The data to be written
+ *
+ *\return MMU[ID].ctrl[reg]
  */
 static inline hrt_data mmu_reg_load(const mmu_ID_t ID, const unsigned int reg)
 {
-- 
2.47.3


