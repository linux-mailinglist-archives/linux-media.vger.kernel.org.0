Return-Path: <linux-media+bounces-49875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20938CF13D8
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 20:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAB213027A65
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 19:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BDE314D38;
	Sun,  4 Jan 2026 19:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKV0XPw/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74466314A6D
	for <linux-media@vger.kernel.org>; Sun,  4 Jan 2026 19:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767553567; cv=none; b=OQAIr/v/RJTYxVLKgaL/VfNelAjObp1wzUOourUktkqUk+QU4vsDF3FrW7dC+ZRMKX6z8Lf9X4XauCPdgSruSqRuZLKn75rLeFWWqlp8HqwmSq9YESp8uH0nQAxzPqrSGM0o7x/bx/zzYIlMFmEJlItAJzKEdT6KU9RcxOIy9Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767553567; c=relaxed/simple;
	bh=OeWqv3x4vXNpequnFxYPQjSTl4yPG1PFNq+yGKZsjK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FaypoXrpygia1gXaHchKqagYhz7r+hhLSGStxAPJjbzW9A9NuSYo2e4YlrVZ/rhZ8Ix8NXoP9A7ab4zVJqJ++OG+LpmzSkCN2br9/bjf1gj9Ui823F/U05svdRlQ2bnZ6bMmaZMHp69RrxK4FmP3o3t4YeUODYy1ip1ja03Sz8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKV0XPw/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fbc305882so6341905f8f.0
        for <linux-media@vger.kernel.org>; Sun, 04 Jan 2026 11:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767553562; x=1768158362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ3Vo4XDf8d33cecZM2n9uZLMWmVIB6ElfJWOAil5Sg=;
        b=LKV0XPw//lThm9LXf6hqFegl4QsYZXyxGVQcs/zFNeX7IWeG4knUingu9xhdwqcLVX
         y/u4aDEr70w0/Th21nlmqhuSnUF88Y++nV1/Ft/v62U0mtpVo7qvGZBScXpBV9+NhSMu
         dkH76pdQv3H7o8o2GpwjuFp6KErgSzndBT78jMgAgQ/Yl4QgGjlzy92/0ZLW7Aq6fcpk
         i97oz7Zx3NIbeYt3Q+Aalhf5N7CXiM/UahjXHH013DCQygdP26mLqda4jRriqz4W2/mu
         +xJ7/ewhZg3ljTFR6VVMWN8dmQLVvHPJTgJbblcqa7t3oKP8rbESMh9LTRmDzf6hW6eN
         vVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767553562; x=1768158362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lZ3Vo4XDf8d33cecZM2n9uZLMWmVIB6ElfJWOAil5Sg=;
        b=GjfAZwvWM1bYWyI6vfCP1z4MmSo8uM03PQqkNywn/CKPeH/QCpJ8afDMMQO8UYZaQw
         qUZvaH5RFHFPmzSr8NwXttSiXfvim1mZnajZvvqUSKBHd8tPYgY0+fuAoJdCENwF8TsR
         qWTq7WGoEFTbZ3D+30Wzf26rsoe4iWG1TYWFtudAQoE0TH+NQ/DALWnJ90rWRosbx7zb
         tbe2qH9Ze05fL8fTXk3vCf5M5QUE5CIVr0koGJoOpRFWdlYhaPF8B8+oFS3+NHsGOMvk
         hYgHnCCboJs4LqxcnCvDbT6H5su5JYsImtvhViz5T93nPBa4/peANxEwRAGHqZIjVot6
         nRbg==
X-Forwarded-Encrypted: i=1; AJvYcCUMDtdIl2ucogkQSq0KB9xTasLwn8an9iLwse5b9anped4D5C5JWxf9qNX/rKOU5kSaKPLLNBJ+aXW48A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcnPWO92qX93VsLxiD7VRJbehctS5HBpxsjs45EQT7rTIuLzYS
	/FK8MUqAomZwVtI3wqn9vFAqZ3b3dfKuCNZLkK5dyQwl7eqPRZ1zdCCvx2M1zPsv
X-Gm-Gg: AY/fxX55n24G4/8m4iNLBO8Jk35PgfPEerGs7vpSFDJl4d2gblTgSs3IdX/jH4rVIbB
	93yNg5Gi6HvSSew4OoZ9Xhid7uMl4PShgnr3Z0yGyG3+3srakQxwOpsljiAxStyDfx80DwDXcbk
	nRNafEa0JbTkUFmtlq25DEJoxTh/MB+skWOJLb6sUyqCMKaSe/R1Qdu6K/SHxi0Wi740lZ3eY87
	syvBbszaGCgqIdJlnOae0lDus2wH0LbAkZPnx2HHgMnGcfv3qdmsDrpULOc9Emon9I7PYGjeZqf
	mwjO2KC2wdzFpoC8FyG0QPTZgoMDPGB3ULQWgjgolmGShodOxRtaIQLXpjKNDqcNef0cpTsCEtY
	vPYAmgkd0l5zRJS76Iou07m/wNTfDBELt0kFRXzbGUv6m/fc7mUqKOqmwcbbmSpYGHfQCO5Hid2
	IEMdtmqH6wXYnje6FOQymM95QA4qzEIlHLa7O84sE=
X-Google-Smtp-Source: AGHT+IFMqb+P79D6s0rZ42eMiSzskYTFWAxJDYuPAZrqbcUt6nli/XEunoys89ausHc9hjH5F7sVwQ==
X-Received: by 2002:a5d:5f54:0:b0:431:907:f307 with SMTP id ffacd0b85a97d-4324e506ab1mr61282976f8f.48.1767553562427;
        Sun, 04 Jan 2026 11:06:02 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm96505089f8f.42.2026.01.04.11.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 11:06:02 -0800 (PST)
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
Subject: [PATCH v1 4/5] media: atomisp: Fix erroneous parameter descriptions
Date: Mon,  5 Jan 2026 00:05:08 +0500
Message-ID: <20260104190509.19683-5-mahad.ibrahim.dev@gmail.com>
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

The function mmu_get_page_table_base_index() accepts only one argument
mmu_ID_t, the block comment for it shows an erroneous additional
argument base_index[in]. Similarly, mmu_reg_load() only accepts two
arguments, however the block comment explaining it shows an erroneous
argument 'value[in]'.

Remove incorrect documentation lines.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_include/host/mmu_public.h    | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index c3495ec4835c..611755e88e9f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -25,7 +25,6 @@ void mmu_set_page_table_base_index(const mmu_ID_t ID, const hrt_data base_index)
  *! Get the page table base index of MMU[ID]
  *
  *\param	ID[in]				MMU identifier
- *\param	base_index[in]		page table base index
  *
  *\return MMU[ID].page_table_base_index
  */
@@ -68,7 +67,6 @@ static inline void mmu_reg_store(const mmu_ID_t ID, const unsigned int reg, cons
  *
  *\param	ID[in]				MMU identifier
  *\param	reg[in]				register index
- *\param value[in]			The data to be written
  *
  *\return MMU[ID].ctrl[reg]
  */
-- 
2.47.3


