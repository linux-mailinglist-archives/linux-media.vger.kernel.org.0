Return-Path: <linux-media+bounces-49876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8FFCF13DB
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 20:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3311C3010CD9
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 19:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2521314D24;
	Sun,  4 Jan 2026 19:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/KXFfz4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F59314D02
	for <linux-media@vger.kernel.org>; Sun,  4 Jan 2026 19:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767553571; cv=none; b=Lhdq2IQJ8/R4ZAyav7Mfey+u23z9F3EJEu7qLSpCtTULwgweznUOYTrwWaEpiupKOeIAnbRLMkbxO9bn3dMY77OyVgaE/dei8kpOUuMuMDe4b3AkpXH23Md/yq5cObfFjDB/orbrSy7ZPk8KmcP59xrSEYF+7xB2g4SmrlhyKbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767553571; c=relaxed/simple;
	bh=ZK5uX/GFgJyLUCjHyioeL6D474O5WD3tQ+XmE+pnOXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXOPemOFSXfP81o9WD/ERIu6lojzoujTajxQsDCXTvRAbqiWqpC7wVYB/ZnqzLji8JkGq2fPdG5f0kJWxSMBbMWZxB02NmBp5Jzp3qutyrzf5mcg8D70On8YuP5o4t+uEX9NH7R0orN/i0b714lK1/c1ZKIlBW46yeBEqyGMhtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/KXFfz4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbc305882so6341913f8f.0
        for <linux-media@vger.kernel.org>; Sun, 04 Jan 2026 11:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767553565; x=1768158365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebOgnSrN48fxkQK6SNZdklEbQHgjDwwzirduEj6RKHM=;
        b=M/KXFfz4uhkYjYVd/3lHbuegZWbcG7ha/fgAZApixkl1N3lYBzm4OUi6rHLNnY94yF
         mcrNIHtl1aiVOTDc2GujyWDQDL4RAt4WGyhONM/qycMYwOrWSo/Bw4T6orFGpTjdnGG8
         7FOgVaBRuwYICbBpECQqJikEwt5kxN+AgIF8vwFTyPf6kew0W8HvhE1VS2BFac7LPDgv
         b1NLPL+5VWYv1GxawfF1Ti30U8fF0AvNr+2fYu0DtOb2h0bdyMk53ITisT8CeadP05L4
         hDvFjGonMXNnVDbjCRhH1XwQxoqcvn/i75j2ybebO5r7EX/koWSqICEHmSdVPft+LCQj
         /kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767553565; x=1768158365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ebOgnSrN48fxkQK6SNZdklEbQHgjDwwzirduEj6RKHM=;
        b=N/rpGWcWSV3LgAPHQ4uOgXqjPfPIWwB/aBIOeyjT/x63/+qcI8D0cjd1I127UO3xz6
         msUCAqdgNZOLl948zRH09graL7uoAet8peuuGzbuRc43jk3UuXfWyYzJDUn9hxgljfN5
         OHNyb93D5DwSpeXx0BerwvLlloiG7Qp5uADq/iJKzEMW8+igZ+d0dfyqV2Lkgy+OPkkI
         rdCseujI0iN2EyyGHyo8gQhtGNriJj2p85AeKid5gUKcA6AM0MYWWUfJkSB02OqdJ5ca
         z5BxDjJTzx645eEzllwvSd2YkNNws/RJ/TVcricTPS1ESNAL0Am5ZGLgorqq5HeGf7oh
         A97g==
X-Forwarded-Encrypted: i=1; AJvYcCXUKPwTohdLObMCC9hN2N7dD24YbjUDsvNWgxj5ZnAV1ZHclv1/TBM7u2/UnVH78k4LzvmA/TxqhrxAwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkEo/tq7OVFVI4C/uA7ePbHt4j0DdnwvipgJHgxbYcIjnZqhSj
	+xOCCRV8uECzSqPjS9MTLntckH2XIZ/6DdGRMMSnV4jYcERgEsRsCcgp
X-Gm-Gg: AY/fxX4u2Yf+JRCzlsB+cDYX2unESZB3+P/sBCLBuz9Bgi5GUhdHd0Psgy6Six5NYQj
	seetxUSdLNjyarBhA2RwohhywJ+aVjHmyAgnRBM0e7IlTA5ZlTwii9HAsjHD5tRSQmHcALHqSZr
	qUkumwzeHDRGjqYuKxF1qWPi6M6eWbc+frcYukHIYLVjZ61KeR3nEHbuRkfPFYgwZ0b/8TBDjxF
	C77kAZjIIV7kiIuIrso7bySJqBGunI/ZoHxjPPxwkt7y77Fsrfayo4QBKegMlK6eKGnNF3R210O
	fvDwLG1zkgQnm6228/x9vRhrdPNCm3rM6/Cz+FlPD7cqwNhtv9w8RMgK4DRFlLuXRqtYZI/cUKi
	3BGvQ0bXHeeij/nTo7upOu+/zJGXkaSrJ+zRZn6VNXQooAMEOlheWpBIIQ3Ylf+0BcCZkN3CEC1
	47x1lcaJJQ+MXcbJmD2QYp84DemsdSp0kVVOTRqZY=
X-Google-Smtp-Source: AGHT+IHIP5Wv68Zp/SZhZsLMise/WRvMupz/fef9S9rk4hz4fUw3ic6mFpAGlWl+s7LC1UyZTgG9FQ==
X-Received: by 2002:a5d:584e:0:b0:430:f622:8cca with SMTP id ffacd0b85a97d-4324e511553mr63803347f8f.56.1767553564535;
        Sun, 04 Jan 2026 11:06:04 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm96505089f8f.42.2026.01.04.11.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 11:06:04 -0800 (PST)
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
Subject: [PATCH v1 5/5] media: atomisp: Convert comments to kernel-doc
Date: Mon,  5 Jan 2026 00:05:09 +0500
Message-ID: <20260104190509.19683-6-mahad.ibrahim.dev@gmail.com>
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

Existing comments in mmu_public.h used Doxygen syntax and had
inconsistent formatting.

Convert the function documentation to the standard kernel-doc format to
adhere to the Linux kernel coding style.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../hive_isp_css_include/host/mmu_public.h    | 59 +++++++++----------
 1 file changed, 27 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 611755e88e9f..b321f4101193 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -11,49 +11,45 @@
 #include "device_access.h"
 #include "assert_support.h"
 
-/*
- *! Set the page table base index of MMU[ID]
- *
- *\param	ID[in]				MMU identifier
- *\param	base_index[in]		page table base index
+/**
+ * mmu_set_page_table_base_index() - Set the page table base index of MMU[ID]
+ * @ID:				MMU identifier
+ * @base_index:			page table base index
  *
- *\return none, MMU[ID].page_table_base_index = base_index
+ * Return: none, MMU[ID].page_table_base_index = base_index
  */
 void mmu_set_page_table_base_index(const mmu_ID_t ID, const hrt_data base_index);
 
-/*
- *! Get the page table base index of MMU[ID]
+/**
+ * mmu_get_page_table_base_index() - Get the page table base index of MMU[ID]
+ * @ID:				MMU identifier
  *
- *\param	ID[in]				MMU identifier
- *
- *\return MMU[ID].page_table_base_index
+ * Return: MMU[ID].page_table_base_index
  */
 hrt_data mmu_get_page_table_base_index(const mmu_ID_t ID);
 
-/*
- *! Invalidate the page table cache of MMU[ID]
- *
- *\param	ID[in]				MMU identifier
+/**
+ * mmu_invalidate_cache() - nvalidate the page table cache of MMU[ID]
+ * @ID:				MMU identifier
  *
- *\return none
+ * Return: none
  */
 void mmu_invalidate_cache(const mmu_ID_t ID);
 
-/*
- *! Invalidate the page table cache of all MMUs
+/**
+ * mmu_invalidate_cache_all() - Invalidate the page table cache of all MMUs
  *
- *\return none
+ * Return: none
  */
 void mmu_invalidate_cache_all(void);
 
-/*
- *! Write to a control register of MMU[ID]
- *
- *\param	ID[in]				MMU identifier
- *\param	reg[in]				register index
- *\param value[in]			The data to be written
+/**
+ * mmu_reg_store() - Write to a control register of MMU[ID]
+ * @ID:				MMU identifier
+ * @reg:			register index
+ * @value:			The data to be written
  *
- *\return none, MMU[ID].ctrl[reg] = value
+ * Return: none, MMU[ID].ctrl[reg] = value
  */
 static inline void mmu_reg_store(const mmu_ID_t ID, const unsigned int reg, const hrt_data value)
 {
@@ -62,13 +58,12 @@ static inline void mmu_reg_store(const mmu_ID_t ID, const unsigned int reg, cons
 	ia_css_device_store_uint32(MMU_BASE[ID] + reg * sizeof(hrt_data), value);
 }
 
-/*
- *! Read from a control register of MMU[ID]
- *
- *\param	ID[in]				MMU identifier
- *\param	reg[in]				register index
+/**
+ * mmu_reg_load() - Read from a control register of MMU[ID]
+ * @ID:				MMU identifier
+ * @reg:			register index
  *
- *\return MMU[ID].ctrl[reg]
+ * Return: MMU[ID].ctrl[reg]
  */
 static inline hrt_data mmu_reg_load(const mmu_ID_t ID, const unsigned int reg)
 {
-- 
2.47.3


