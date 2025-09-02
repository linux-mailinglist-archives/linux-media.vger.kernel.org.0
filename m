Return-Path: <linux-media+bounces-41519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67567B3F672
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE39E1A86412
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECB42E7198;
	Tue,  2 Sep 2025 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IuXX+fRw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E68B2E62B1
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756797563; cv=none; b=ZiC5q43y27DvYEjqHIAA8JhJSJgZXluv7+k44TnqDbPnxP9gw53aK0muv9KZ8S70XUDKh1Vgcl5JITPBL5+uqd8YYOE7ApjhNUZ6BRi+DNYDtObwepDVloQS7pgq2zfJdyF2p7ISa/d/Us2A28Ywz2qpz3plDEhu9XvqAhs2t1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756797563; c=relaxed/simple;
	bh=YTfRT7nZucuC+rOqT8u2JhzeMS4C8wWEnl7OQP5jGSg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KCh/5kQXyc97yMvvlraT9odgc0BTl9kr9lEjgeGGcxzDNez7qH4t02VCdU2IJ0TBbglchoqkqbFo2g+2hZcisC0Q2eN52U65cu4lLceamweEudlSMngoj3I1CU5xwWfge2068OAXF/+05oi/ne/6lkE4w4iuVFh/DdOo6aJEPdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IuXX+fRw; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45b869d3582so13155285e9.1
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756797560; x=1757402360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1NlE9a+9Bxy62hv5W1CTcG6yDEPlaJidN+buC/iKCU=;
        b=IuXX+fRwqLZUveEYqTeMzzTXap8mAfEhhI4OO4o7h+kohK4xNqjLjyrFbPWYZnHZzl
         YOMnFwzWdJWfNHYdpH90lH2CSbiRKyo/Edx8fsNqfeSPNF/Ly9lX7RO3rrjufEE4joFX
         KLZyTTTd1Iy4IpSlJawqy6CPscFvJG8BmGtv8UFqTPja3o0TXBWMSiskllR2UNb8qXf9
         sBCCMtkzWp75hs3kAI3u9nanlzzyFI3h1feNa7j1f2Piz9zHhsTwrwE3o8q5cZPF7ocO
         2tl2vHbu23NIMRhCuII6PxExYe1pVDxvh4B4RqOlw3sK1eKAzWHN9OdJXHA0oJ8LA8ia
         LC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797560; x=1757402360;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K1NlE9a+9Bxy62hv5W1CTcG6yDEPlaJidN+buC/iKCU=;
        b=nFRp4bGYujCkDW9hA4NY8/+H/DTCbtQyOZv2cXyjGemYltN7zXXfo0tPnskNff2EEQ
         MRR8GxxcPKgdj5/CbEJkTQxJkHdRXD7ae1ruB7/2iZdJtf2cgeYOXmqLUnlT8u7y4Kdf
         v2vl3m5jTkhVnKKhjOiPBNAkjMJYpJgULYozSAs+bWpqiYaY89lb3cno1NlvcR255RIV
         uHVu+V0XHysFVM/dypJs+HdJLrewPX7JNJyCJrh47KLLMnYPoOOLDmwsYl7niVk1gidO
         Vnf5LU1bGlVTS78U5KoqwsRf43IcAICIvx8DD6y40uexVkuGoMEIv+KVLVemOCJfsEHP
         fBfA==
X-Forwarded-Encrypted: i=1; AJvYcCU61VXlpedm+djUIvcQXb9c8su/rAxJsUMueMuMby+VvslX+UUWUCrIGN7GZC4OHUraQkFcLWOn0epY8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw+kWjGzZPJTdqViaGa1GDLFbXDJQJmKUkFMEW5MiejP8ouK46
	0uRPXkqyAzBDYNCpNqqjXgwCYv6lekjFDFX6ornCvh24g+9zfE9OB9ny4LuDuWcMruQoUSXKzlV
	aBuAd33FwGg==
X-Google-Smtp-Source: AGHT+IF9+pEVGxeluwE6Cu/shEOucLgY1/21K2rB/PuNxx8VUUO6XEcsQ8Es/nbAGtAXGwUqiHT7PGj6FScm
X-Received: from wmsr1.prod.google.com ([2002:a05:600c:8b01:b0:45b:8501:3c72])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:418c:b0:45b:72a6:4861
 with SMTP id 5b1f17b1804b1-45b855fa346mr64547185e9.24.1756797560190; Tue, 02
 Sep 2025 00:19:20 -0700 (PDT)
Date: Tue,  2 Sep 2025 07:18:46 +0000
In-Reply-To: <20250902071847.2330409-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250902071847.2330409-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250902071847.2330409-3-abarnas@google.com>
Subject: [PATCH v2 2/3] staging: media: atomisp: Whitespaces cleanup in vmem.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Whitespaces cleanup to conform with kernel style and improve readability.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../pci/hive_isp_css_common/host/vmem.c       | 83 +++++--------------
 1 file changed, 23 insertions(+), 60 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vme=
m.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index fd640e100591..aa67638a09a5 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -13,7 +13,6 @@
 #endif
 #include "assert_support.h"
=20
-
 /* Copied from SDK: sim_semantics.c */
=20
 /* subword bits move like this:         MSB[____xxxx____]LSB -> MSB[000000=
00xxxx]LSB */
@@ -35,13 +34,8 @@ inv_subword(unsigned long long w, unsigned int start, un=
signed int end)
 #define move_upper_bits(target, target_bit, src, src_bit) move_subword(tar=
get, target_bit, src, src_bit, uedge_bits)
 #define move_word(target, target_bit, src) move_subword(target, target_bit=
, src, 0, uedge_bits)
=20
-static void
-move_subword(
-    unsigned long long *target,
-    unsigned int target_bit,
-    unsigned long long src,
-    unsigned int src_start,
-    unsigned int src_end)
+static void move_subword(unsigned long long *target, unsigned int target_b=
it,
+			 unsigned long long src, unsigned int src_start, unsigned int src_end)
 {
 	unsigned int start_elem =3D target_bit / uedge_bits;
 	unsigned int start_bit  =3D target_bit % uedge_bits;
@@ -51,7 +45,8 @@ move_subword(
=20
 	if (subword_width + start_bit > uedge_bits) { /* overlap */
 		unsigned long long old_val1;
-		unsigned long long old_val0 =3D inv_subword(target[start_elem], start_bi=
t, uedge_bits);
+		unsigned long long old_val0 =3D inv_subword(target[start_elem],
+							  start_bit, uedge_bits);
=20
 		target[start_elem] =3D old_val0 | (src_subword << start_bit);
 		old_val1 =3D inv_subword(target[start_elem + 1], 0,
@@ -59,18 +54,14 @@ move_subword(
 		target[start_elem + 1] =3D old_val1 | (src_subword >> (uedge_bits - star=
t_bit));
 	} else {
 		unsigned long long old_val =3D inv_subword(target[start_elem], start_bit=
,
-						 start_bit + subword_width);
+							 start_bit + subword_width);
=20
 		target[start_elem] =3D old_val | (src_subword << start_bit);
 	}
 }
=20
-static void
-hive_sim_wide_unpack(
-    unsigned long long *vector,
-    unsigned long long *elem,
-    hive_uint elem_bits,
-    hive_uint index)
+static void hive_sim_wide_unpack(unsigned long long *vector, unsigned long=
 long *elem,
+				 hive_uint elem_bits, hive_uint index)
 {
 	/* pointers into wide_type: */
 	unsigned int start_elem =3D (elem_bits * index) / uedge_bits;
@@ -99,12 +90,8 @@ hive_sim_wide_unpack(
 	}
 }
=20
-static void
-hive_sim_wide_pack(
-    unsigned long long *vector,
-    unsigned long long *elem,
-    hive_uint elem_bits,
-    hive_uint index)
+static void hive_sim_wide_pack(unsigned long long *vector, unsigned long l=
ong *elem,
+			       hive_uint elem_bits, hive_uint index)
 {
 	/* pointers into wide_type: */
 	unsigned int start_elem =3D (elem_bits * index) / uedge_bits;
@@ -128,10 +115,7 @@ hive_sim_wide_pack(
 	}
 }
=20
-static void load_vector(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from)
+static void load_vector(const isp_ID_t ID, t_vmem_elem *to, const t_vmem_e=
lem *from)
 {
 	unsigned int i;
 	unsigned long long *data;
@@ -154,10 +138,7 @@ static void load_vector(
 	udelay(1); /* Spend at least 1 cycles per vector */
 }
=20
-static void store_vector(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from)
+static void store_vector(const isp_ID_t ID, t_vmem_elem *to, const t_vmem_=
elem *from)
 {
 	unsigned int i;
 	unsigned int size =3D sizeof(short) * ISP_NWAY;
@@ -166,9 +147,9 @@ static void store_vector(
 	//load_vector (&v[1][0], &to[ISP_NWAY]); /* Fetch the next vector, since =
it will be overwritten. */
 	unsigned long long *data =3D (unsigned long long *)v;
=20
-	for (i =3D 0; i < ISP_NWAY; i++) {
+	for (i =3D 0; i < ISP_NWAY; i++)
 		hive_sim_wide_pack(data, (unsigned long long *)&from[i], ISP_VEC_ELEMBIT=
S, i);
-	}
+
 	assert(ISP_BAMEM_BASE[ID] !=3D (hrt_address) - 1);
 #if !defined(HRT_MEMORY_ACCESS)
 	ia_css_device_store(ISP_BAMEM_BASE[ID] + (unsigned long)to, &v, size);
@@ -179,11 +160,8 @@ static void store_vector(
 	udelay(1); /* Spend at least 1 cycles per vector */
 }
=20
-void isp_vmem_load(
-    const isp_ID_t		ID,
-    const t_vmem_elem	*from,
-    t_vmem_elem		*to,
-    unsigned int elems) /* In t_vmem_elem */
+void isp_vmem_load(const isp_ID_t ID, const t_vmem_elem *from, t_vmem_elem=
 *to,
+		   unsigned int elems) /* In t_vmem_elem */
 {
 	unsigned int c;
 	const t_vmem_elem *vp =3D from;
@@ -197,11 +175,8 @@ void isp_vmem_load(
 	}
 }
=20
-void isp_vmem_store(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from,
-    unsigned int elems) /* In t_vmem_elem */
+void isp_vmem_store(const isp_ID_t ID, t_vmem_elem *to, const t_vmem_elem =
*from,
+		    unsigned int elems) /* In t_vmem_elem */
 {
 	unsigned int c;
 	t_vmem_elem *vp =3D to;
@@ -215,15 +190,9 @@ void isp_vmem_store(
 	}
 }
=20
-void isp_vmem_2d_load(
-    const isp_ID_t		ID,
-    const t_vmem_elem	*from,
-    t_vmem_elem		*to,
-    unsigned int height,
-    unsigned int width,
-    unsigned int stride_to,  /* In t_vmem_elem */
-
-    unsigned stride_from /* In t_vmem_elem */)
+void isp_vmem_2d_load(const isp_ID_t ID, const t_vmem_elem *from, t_vmem_e=
lem *to,
+		      unsigned int height, unsigned int width,
+		      unsigned int stride_to, unsigned int stride_from) /* In t_vmem_ele=
m */
 {
 	unsigned int h;
=20
@@ -244,15 +213,9 @@ void isp_vmem_2d_load(
 	}
 }
=20
-void isp_vmem_2d_store(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from,
-    unsigned int height,
-    unsigned int width,
-    unsigned int stride_to,  /* In t_vmem_elem */
-
-    unsigned stride_from /* In t_vmem_elem */)
+void isp_vmem_2d_store(const isp_ID_t ID, t_vmem_elem *to, const t_vmem_el=
em *from,
+		       unsigned int height, unsigned int width,
+		       unsigned int stride_to, unsigned int stride_from) /* In t_vmem_el=
em */
 {
 	unsigned int h;
=20
--=20
2.51.0.318.gd7df087d1a-goog


