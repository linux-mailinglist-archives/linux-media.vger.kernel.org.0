Return-Path: <linux-media+bounces-59620-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EYk1M6aY7WmOlQAAu9opvQ
	(envelope-from <linux-media+bounces-59620-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 06:46:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F424468B78
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 06:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B29E3019521
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 04:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416C9296BCD;
	Sun, 26 Apr 2026 04:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJ13n3GR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com [209.85.161.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FFA231A3B
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 04:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777178782; cv=none; b=cVUpD/Xjppw4qesKly74+L5JcGLHwehN+EllQXxiTMj/RV82eS6lj5+Jt9Lz6LeVEyraNMhUkDPlsl1ypT1m5kcX5N/Ko/EEP16bYEEseo5rICEnsoikFENVPLEucEm8n8Oir1o1meEzxXZ+KcWuvjqipUFMgS8dQeJKqzz23Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777178782; c=relaxed/simple;
	bh=iBMhq5lwSgwfGGv0sD5W65o1I5F1349MCKU+Iaq8XvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jWAeD5RC1ph7h9iMjOUe3s2F7y1/rsuM2uNJEDGtFUZKg0IJY+f94h1/cg+/E59KOz1CNyB6f2uyzSyMzgFu2JIQqhnsUXCqPCfpxpv54NOGTmzX98RFaiYO7IwYP3RC7SPn6d2DhTrQeY+G2orsL2S5fTKySnhhaWmYgfzf8DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJ13n3GR; arc=none smtp.client-ip=209.85.161.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f65.google.com with SMTP id 006d021491bc7-68244d317e5so5421002eaf.0
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 21:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777178780; x=1777783580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOULwLqvgrU1wCEhAdPKlH+/9gYQPD/8K3H9nkcKM5w=;
        b=aJ13n3GRyfvqq5/Y6nq03x5xBNHhtA9bRelM+M5CyPfe7/UGkMiZuAGaOyvS7V12EW
         /M3cl/rmmVnlKgtkZClP6GVK8UaU+TwQVDX8JwfXwjONbexIh2UMI/YgyioqevQifP3d
         cVHHdY+s4EFL0qLbgBTWD7HupWTe6ce1GNonJ1cU18Chu8a1gPApKJCHjw8gozsDq3Ls
         D8/uhiuSHjVK5w/uRLOEbBIk1rKvD8Ikkm1AZmZTzYg40utEaouDLWW8KkLr4sCKumpp
         cyUDy6QQweL5PTUi5ZjqlCqs17a0bgFp0DsvuBjfWWPXeBwKFjV5MiYlGQWfGYCofG+c
         chZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777178780; x=1777783580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOULwLqvgrU1wCEhAdPKlH+/9gYQPD/8K3H9nkcKM5w=;
        b=qcBdlkyC/+MjWhk835BkwssiHzZ+0UWZFKGXumywhlLH9SHzr5NCCn8NNEcab6Arxw
         A/ME7JyMxpcWN0yBErGrb0UwTJBlbzlYqjX+TK5uBNp5hJkyuzLzuk/vBa+fnFliDESS
         RT9+WfO5tu2VxBHbVxyXirC70DiKURv29zhJmKgi8PyeDA7GLWHKq8NGfq7VUopAKdEv
         U4sdM12ouKI7EcCUkmxyVub3PiIiAA+znWqtn0bnpwYkf4r/4hnSzDbVDiDE+eXGKV+b
         gRNBNMPNtDlVtc1TNZyYUzuYKsR7NCRg/52cRHxfEW198wC3/YgThVbMw9+i5DJKETht
         8Hdg==
X-Gm-Message-State: AOJu0Yw40QdU3czU2UNFtg4xtDH0Jdzr8fi8yrYrc94tXsdhNb2ko2ID
	NzjGVGMCV/E3xRdp3OyP8ejv9ksW6cOpmsaK3w+XUPy4RWlgGlcljxhd
X-Gm-Gg: AeBDievDmWiADmBge/HtwiHKmhVkVcl35+1FvKNj92JJdBq1XkvYil0w/3B02BFHsFC
	+S4kLwDINQIWeE+nqpksA5G8VuYbheI5DjRY1KSnSRrFK3Tjk0bLNDcSai4kx2sZYl7ZOlb2Uzj
	lMMbZrHXEUL733WH4NnKmV4FuAlK9OActCLORTSQF8IrgKCESwTuJQVzJpnATlAbs4UbsAwExg9
	ineK4RqFu6wBSH9wr1YAcwWmPYe/Ivnj+8CIw0PjenHHFPnspJyD+rdT0Ooh3SeJ7FCpMkjnmrt
	kcY/su0eoGDKVeY1mcKM7baMfa75svdTTce3HhhVyjivZOKwyCJXZSOdhd14NEmhQsYTffcgLmi
	cEd+Ejml30aDJPwYuvIBMOf0h1F1oOx6vcTwBNKoWvXR98xsBRuQAlrlbPpvovjOCTohinLXaO+
	fBqYb4WUGBkvr7wfghJjH+LYrN
X-Received: by 2002:a05:6820:1c9e:b0:694:9206:5bdf with SMTP id 006d021491bc7-69492065ff0mr14588821eaf.4.1777178780263;
        Sat, 25 Apr 2026 21:46:20 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::15])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42c054997absm19260684fac.3.2026.04.25.21.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 21:46:19 -0700 (PDT)
From: kernelcoredev <sonionwhat@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernelcoredev <sonionwhat@gmail.com>
Subject: [PATCH] staging: atomisp: fix coding style issues in mmu_public.h
Date: Sun, 26 Apr 2026 00:46:13 -0400
Message-ID: <20260426044614.6067-1-sonionwhat@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1F424468B78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-59620-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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


