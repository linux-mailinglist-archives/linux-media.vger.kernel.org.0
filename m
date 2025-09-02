Return-Path: <linux-media+bounces-41518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF2BB3F671
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C3981A863E7
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651F82E7167;
	Tue,  2 Sep 2025 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rrzEUgWx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63602E1EE3
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756797562; cv=none; b=jqSPj00KSmRYE/aRKEZpEXXJopq4CPkPlBhQcKqYecF2xismBR4hNely0RKMWu9RHmm2P/coUwd9ED6SD4Yo3MqLUJOrlnRvW60DuAXW3kWiTMKu8p0mq2EGSdHIaUh4rdD2OzGX6jtC/t4iUYkC8cK0pRceU1KeNIQIIegiysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756797562; c=relaxed/simple;
	bh=32DTjO7qjxKOvL3amKcERtyKwvz65XaqH4dROuOpLPo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=csrwmrGSo4DpgUMZMi4NnBngT/RCvKjRQIwkcLSViZL6ooVU5b2ARl2nRMgRg+SLsyiF7YTgTn6OVT6Hy5h4n843j1dKVWecPXLOdOQ0JwVPkas5/DRSkIbOFFalyVQFu/iYb+5louGyWBmlwOyAZZIFrVL71WDD+C3n0YIJ9Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rrzEUgWx; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b9912a07dso1855125e9.3
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756797559; x=1757402359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MO71ArN1mhEwmcVWMgSdyViUKfjpUyop6LWKe1mWCU=;
        b=rrzEUgWxEnZAznDpzQ62xnvLIjtDYiUut1QVh1hXqYbPhvCByLpFhR/V/z99qdk+KP
         vsyS6sDT/LZ3PBPFpAwwUQfxQ7SKSYQ+yFYg3/ICAp+ej7JunkGZNEQGx7mFv3Oij11V
         U8MLo3SfXluF7UzigbTHBIUHtZ/1xayp+gdO/k1HXS31gvJ+c33/aT2D2wFFkBk85vnX
         O9zQzHBNaS2uc2IQqExdLUNWU87B0ud2GLb6lY0RBWQK4RKO4xRoW8qpz45JsK+Jb+Ud
         cAR+SvKhd3lMLXksiRiDFqOcHTrlFJwA/Kyi0IRzfWGn68H47pFAE4JDo6sUSLF84vL9
         PkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797559; x=1757402359;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4MO71ArN1mhEwmcVWMgSdyViUKfjpUyop6LWKe1mWCU=;
        b=WetUU+3WnCZVnPOCrrzH3eUszLSf06/IY3RzL7fYz1kZF84O2ajzG3oPdZ9Vpj2HZs
         hEJ/74MEfWLmvAsesD3ieQka8UC6mjA+nGTEbKR5mIdXFp7fAx/nRoAIfkvSipZFpwea
         bNwDMPVFVN2k69XjuzeEj+/8v+JQNl1U2BmBcn/MD8gCR4DvJUeV8hIKBt261mk2QF5/
         vhcNvbjFgrCrdd7+ACCwLAEZe1VXqA2X7geMm2tRKMrJKUnl5JipSDYSjPZs64xmVTRk
         6OkEQ9wBXZH/6hS85KCuHa7Q/UXXuKIFyTeXGx+DxsOScK6TYEGRH1QKCHAFMPBKs5e+
         Gp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCViKgdu5MQk2yiwHJDw0Y496E4FXaP3gzWz85rJJNsrqmbKXIVUOoLB5xGi20amO7BAGlsbRcHh+Ot6Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTGJzAeNZQEGTwbj+HjvrVVnvl6YApsdXevMUIpOPdVHB0u17H
	bE7Jl0Fn4+SsWH8H7NmjUklcQvrxgtBmV9uNluO6r56IcUMZWuomLao3rtoLCacFdIq1NITkT13
	CAu6tL+3KRQ==
X-Google-Smtp-Source: AGHT+IFyFbgVn55iGg2zl4rVa/8dYxXzrwEiXoCnfFWi5pUvxT2OYebO2o0A+wWvDMIj4GUnnJ4rXq0gkmGY
X-Received: from wmti4.prod.google.com ([2002:a05:600c:8b84:b0:45b:9c34:e57e])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c92:b0:45b:9291:320d
 with SMTP id 5b1f17b1804b1-45b98fbf106mr8636085e9.31.1756797559123; Tue, 02
 Sep 2025 00:19:19 -0700 (PDT)
Date: Tue,  2 Sep 2025 07:18:45 +0000
In-Reply-To: <20250902071847.2330409-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250902071847.2330409-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250902071847.2330409-2-abarnas@google.com>
Subject: [PATCH v2 1/3] staging: media: atomisp: Remove typedefs for basic
 types in vmem.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cleared typedefs hiding unsigned long long type, to align with
kernel coding style.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../pci/hive_isp_css_common/host/vmem.c       | 42 +++++++++----------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vme=
m.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index 722b684fbc37..fd640e100591 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -13,35 +13,33 @@
 #endif
 #include "assert_support.h"
=20
-typedef unsigned long long hive_uedge;
-typedef hive_uedge *hive_wide;
=20
 /* Copied from SDK: sim_semantics.c */
=20
 /* subword bits move like this:         MSB[____xxxx____]LSB -> MSB[000000=
00xxxx]LSB */
-static inline hive_uedge
-subword(hive_uedge w, unsigned int start, unsigned int end)
+static inline unsigned long long
+subword(unsigned long long w, unsigned int start, unsigned int end)
 {
 	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
 }
=20
 /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx00=
00xxxx]LSB */
-static inline hive_uedge
-inv_subword(hive_uedge w, unsigned int start, unsigned int end)
+static inline unsigned long long
+inv_subword(unsigned long long w, unsigned int start, unsigned int end)
 {
 	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1)=
);
 }
=20
-#define uedge_bits (8 * sizeof(hive_uedge))
+#define uedge_bits (8 * sizeof(unsigned long long))
 #define move_lower_bits(target, target_bit, src, src_bit) move_subword(tar=
get, target_bit, src, 0, src_bit)
 #define move_upper_bits(target, target_bit, src, src_bit) move_subword(tar=
get, target_bit, src, src_bit, uedge_bits)
 #define move_word(target, target_bit, src) move_subword(target, target_bit=
, src, 0, uedge_bits)
=20
 static void
 move_subword(
-    hive_uedge *target,
+    unsigned long long *target,
     unsigned int target_bit,
-    hive_uedge src,
+    unsigned long long src,
     unsigned int src_start,
     unsigned int src_end)
 {
@@ -49,18 +47,18 @@ move_subword(
 	unsigned int start_bit  =3D target_bit % uedge_bits;
 	unsigned int subword_width =3D src_end - src_start;
=20
-	hive_uedge src_subword =3D subword(src, src_start, src_end);
+	unsigned long long src_subword =3D subword(src, src_start, src_end);
=20
 	if (subword_width + start_bit > uedge_bits) { /* overlap */
-		hive_uedge old_val1;
-		hive_uedge old_val0 =3D inv_subword(target[start_elem], start_bit, uedge=
_bits);
+		unsigned long long old_val1;
+		unsigned long long old_val0 =3D inv_subword(target[start_elem], start_bi=
t, uedge_bits);
=20
 		target[start_elem] =3D old_val0 | (src_subword << start_bit);
 		old_val1 =3D inv_subword(target[start_elem + 1], 0,
 				       subword_width + start_bit - uedge_bits);
 		target[start_elem + 1] =3D old_val1 | (src_subword >> (uedge_bits - star=
t_bit));
 	} else {
-		hive_uedge old_val =3D inv_subword(target[start_elem], start_bit,
+		unsigned long long old_val =3D inv_subword(target[start_elem], start_bit=
,
 						 start_bit + subword_width);
=20
 		target[start_elem] =3D old_val | (src_subword << start_bit);
@@ -69,8 +67,8 @@ move_subword(
=20
 static void
 hive_sim_wide_unpack(
-    hive_wide vector,
-    hive_wide elem,
+    unsigned long long *vector,
+    unsigned long long *elem,
     hive_uint elem_bits,
     hive_uint index)
 {
@@ -103,8 +101,8 @@ hive_sim_wide_unpack(
=20
 static void
 hive_sim_wide_pack(
-    hive_wide vector,
-    hive_wide elem,
+    unsigned long long *vector,
+    unsigned long long *elem,
     hive_uint elem_bits,
     hive_uint index)
 {
@@ -136,7 +134,7 @@ static void load_vector(
     const t_vmem_elem	*from)
 {
 	unsigned int i;
-	hive_uedge *data;
+	unsigned long long *data;
 	unsigned int size =3D sizeof(short) * ISP_NWAY;
=20
 	VMEM_ARRAY(v, 2 * ISP_NWAY); /* Need 2 vectors to work around vmem hss bu=
g */
@@ -146,9 +144,9 @@ static void load_vector(
 #else
 	hrt_master_port_load(ISP_BAMEM_BASE[ID] + (unsigned long)from, &v[0][0], =
size);
 #endif
-	data =3D (hive_uedge *)v;
+	data =3D (unsigned long long *)v;
 	for (i =3D 0; i < ISP_NWAY; i++) {
-		hive_uedge elem =3D 0;
+		unsigned long long elem =3D 0;
=20
 		hive_sim_wide_unpack(data, &elem, ISP_VEC_ELEMBITS, i);
 		to[i] =3D elem;
@@ -166,10 +164,10 @@ static void store_vector(
=20
 	VMEM_ARRAY(v, 2 * ISP_NWAY); /* Need 2 vectors to work around vmem hss bu=
g */
 	//load_vector (&v[1][0], &to[ISP_NWAY]); /* Fetch the next vector, since =
it will be overwritten. */
-	hive_uedge *data =3D (hive_uedge *)v;
+	unsigned long long *data =3D (unsigned long long *)v;
=20
 	for (i =3D 0; i < ISP_NWAY; i++) {
-		hive_sim_wide_pack(data, (hive_wide)&from[i], ISP_VEC_ELEMBITS, i);
+		hive_sim_wide_pack(data, (unsigned long long *)&from[i], ISP_VEC_ELEMBIT=
S, i);
 	}
 	assert(ISP_BAMEM_BASE[ID] !=3D (hrt_address) - 1);
 #if !defined(HRT_MEMORY_ACCESS)
--=20
2.51.0.318.gd7df087d1a-goog


