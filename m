Return-Path: <linux-media+bounces-59621-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E9ILs2Y7WmOlQAAu9opvQ
	(envelope-from <linux-media+bounces-59621-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 06:47:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 147AD468B8D
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 06:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBCD73026776
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 04:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557DF2C0285;
	Sun, 26 Apr 2026 04:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GESWXF1h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2632BEFEF
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 04:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777178787; cv=none; b=TnZ/YvSZagmH9ga8W+Lm1+Qv9w/aPcuuNmqQpo0HK0TZHZAdaf9R9Qwgqp49hwG99HtZfJkFCUSP+C1sRJXNHBApdXTAwq2l9YOTwYe+bLNcs79/V+AXmGVYzC1v2dhrVqjNiP+JwyVP0j+PdEgjviurJTgxQ9L9Nzv/ua35zj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777178787; c=relaxed/simple;
	bh=iBMhq5lwSgwfGGv0sD5W65o1I5F1349MCKU+Iaq8XvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBerb2hXJXhdB6alJmG0hnmH0/0U1HL2Y94Mmy56wNsF1QHWC7VNBOBayQyQHFK37HziTp7Hvf07A/omnIR3GDInWoiaKrGcQM85zBLjuZTmIYmb44yG0/Ddv+2IEwehmiwAlBxIN+h8/QfZRFt8FMf+wy0Dv/jZBVJ+zjBoLIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GESWXF1h; arc=none smtp.client-ip=209.85.210.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7dcdd1b492eso5023062a34.1
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 21:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777178785; x=1777783585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOULwLqvgrU1wCEhAdPKlH+/9gYQPD/8K3H9nkcKM5w=;
        b=GESWXF1hGWhFpnOavWzP4j1Pd/bqRHZshsJYvargNrUuGmjmGFwrdOPfmwchSRH6t/
         aGo8t9vo2Gciq3VNCzlLpDyv2jjCaoCpy2Wwyk6JrPdV8SM3Sp9k0OqONbvugY1M3VrY
         DW7kudOD1AFqOVWPNX61b+sv5UXIkF2r/qum/0zmdQn3wWQaqtiQxK4+r90bPZKrY3qU
         2EKrgq4ILAF153Fy4E9+pKNh62mCG3snfK3VBM/CJrqMUwCTkrpxS6a8Rr5uDwL/ghwq
         Uxfri0Kd+zwo60Ot0P9Jfc+HSQvRdbnahjG2vzl53C5keLovWQm649AzrO3sVM1TIx8u
         TVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777178785; x=1777783585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oOULwLqvgrU1wCEhAdPKlH+/9gYQPD/8K3H9nkcKM5w=;
        b=csCyrWzDPMp4YmgwCUvUNmpa1p15Dn/I/ztuuFuE3mABohp4uoms8kMTvjQN9oBrYN
         h67K4PuQkw8W4sCnOBQRzoMqOwVv4Ku2zy8G43YiHgBHBSKsK3SZ/vFVn6Aj22M2P46o
         1Gc+gTMignu3itOJ2fE9YCh1C2GVZIafG9JtnSrpu1HdUfNcCM+lFpegwcyS6AZPWj31
         i/YBDBhMSHBEa4rcP1ApLEfi9zO4S7t8/1RTaTX+XDy24YGfpqIj4I9yu9eY2lMV3QmJ
         JLbZhKjxRXvK5ER/0yNoEIuhCitxTw3JMwCjBYWI5igU1MDrXA29Q+2XqljhL1twEpGf
         eQ1w==
X-Gm-Message-State: AOJu0YwXz0uKAy49/e5fgGTyHQ82caaK/fVLtmeyEhevMlZ6i99hfvuh
	zGq/lb+r6VDHYllt7FzSKPhDOvbfWONiDv/SB0RZr9T8QLyKwp/e//TO
X-Gm-Gg: AeBDiet1IdVl3/i9tCsEBW8me3vSBj5wA8LH6u/aR9Wpcoiki7yKn5YRy6bCHPlGyEi
	CTJvZ6+CS4UZ+EZsDXgMStrPxrq4CQG5TBAOn/nDQQj60WfoQHv4VTsHz09+ShyUSfPKq8mRahk
	zwIxPCqwWrvS3zTdplWbVG2ODGXWrSBGs5ey2jbvMQhMc5dj3oKH9oaN7a0OtzveoqYPFCYWMKp
	rHV1Sbeih1uAWD3BqTew2enNuAnky9TByhg8j45si8cpfFZI9tENCJQX/wuwLHBrEWFcS9+RX5r
	SkesPDz1KpcbQ09YK+sVIILMFuPdgYho6iBk2y5SLSW8UrgPm0vSwQpkQ4+7CaJGFh0ICEPLXAf
	9fAlbFVe8C/pWABJQbn5Jm8OFSYVniYSj3G/s+UgbxA346JrL08YnYlFR86EmrfMEX6UnHiaHTD
	hGEkYemFL4dglR/WJ5kiUSvcRT
X-Received: by 2002:a05:6830:4609:b0:7d9:ade1:e19b with SMTP id 46e09a7af769-7dc955dc568mr13369511a34.14.1777178784790;
        Sat, 25 Apr 2026 21:46:24 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::15])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dce5c346adsm11633571a34.27.2026.04.25.21.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 21:46:23 -0700 (PDT)
From: kernelcoredev <sonionwhat@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernelcoredev <sonionwhat@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix coding style issues in mmu_public.h
Date: Sun, 26 Apr 2026 00:46:14 -0400
Message-ID: <20260426044614.6067-2-sonionwhat@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426044614.6067-1-sonionwhat@gmail.com>
References: <20260426044614.6067-1-sonionwhat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 147AD468B8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59621-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sonionwhat@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]

Fix several checkpatch.pl warnings:
- remove leading spaces
- fix block comment style
- avoid open-ended lines
- remove unnecessary return in void function

No functional changes.

Signed-off-by: kernelcoredev <sonionwhat@gmail.com>
---
 .../hive_isp_css_include/host/mmu_public.h    | 94 +++++++++----------
 1 file changed, 44 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 1a435a348..58b1af384 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -11,72 +11,66 @@
 #include "device_access.h"
 #include "assert_support.h"
 
-/*! Set the page table base index of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	base_index[in]		page table base index
-
- \return none, MMU[ID].page_table_base_index = base_index
+/* Set the page table base index of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ * \param	base_index[in]		page table base index
+ *
+ * \return none, MMU[ID].page_table_base_index = base_index
  */
-void mmu_set_page_table_base_index(
-    const mmu_ID_t		ID,
-    const hrt_data		base_index);
-
-/*! Get the page table base index of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	base_index[in]		page table base index
-
- \return MMU[ID].page_table_base_index
+void mmu_set_page_table_base_index(const mmu_ID_t		ID,
+				   const hrt_data	base_index);
+
+/* Get the page table base index of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ * \param	base_index[in]		page table base index
+ *
+ * \return MMU[ID].page_table_base_index
  */
-hrt_data mmu_get_page_table_base_index(
-    const mmu_ID_t		ID);
-
-/*! Invalidate the page table cache of MMU[ID]
+hrt_data mmu_get_page_table_base_index(const mmu_ID_t		ID);
 
- \param	ID[in]				MMU identifier
-
- \return none
+/* Invalidate the page table cache of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ *
+ * \return none
  */
-void mmu_invalidate_cache(
-    const mmu_ID_t		ID);
-
-/*! Invalidate the page table cache of all MMUs
+void mmu_invalidate_cache(const mmu_ID_t		ID);
 
- \return none
+/* Invalidate the page table cache of all MMUs
+ *
+ * \return none
  */
 void mmu_invalidate_cache_all(void);
 
-/*! Write to a control register of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	reg[in]				register index
- \param value[in]			The data to be written
-
- \return none, MMU[ID].ctrl[reg] = value
+/* Write to a control register of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ * \param	reg[in]				register index
+ * \param value[in]			The data to be written
+ *
+ * \return none, MMU[ID].ctrl[reg] = value
  */
-static inline void mmu_reg_store(
-    const mmu_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value)
+static inline void mmu_reg_store(const mmu_ID_t		ID,
+				 const unsigned int	reg,
+				 const hrt_data		value)
 {
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(MMU_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
-/*! Read from a control register of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	reg[in]				register index
- \param value[in]			The data to be written
-
- \return MMU[ID].ctrl[reg]
+/* Read from a control register of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ * \param	reg[in]				register index
+ * \param value[in]			The data to be written
+ *
+ * \return MMU[ID].ctrl[reg]
  */
-static inline hrt_data mmu_reg_load(
-    const mmu_ID_t		ID,
-    const unsigned int	reg)
+static inline hrt_data mmu_reg_load(const mmu_ID_t		ID,
+				    const unsigned int	reg)
 {
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
-- 
2.53.0


