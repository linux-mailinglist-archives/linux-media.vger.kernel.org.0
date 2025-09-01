Return-Path: <linux-media+bounces-41409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4BFB3DDB5
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 11:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AA5E169498
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 09:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C984307486;
	Mon,  1 Sep 2025 09:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MwqZW8nA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF63C305056
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717866; cv=none; b=gFjyZYaxAigwgzxedOJjSXzYOgmQkKQ5mGYD05VyDzIt88kY2fUeAb5nMrS/ODq4vPqPxjjUUp4u0qsW0Z9B1RJV8RQkGlAkj0lf5NCsQmyIZFtwuuSarlK7dxbrQ07e0wadg8ki3NB3V3Hc4A5ieFEz7FLjcMyCaX99EBDd68E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717866; c=relaxed/simple;
	bh=C6PSeroBBAXUkCfk//yXsUzvuy7IJKNHAggHy7Mv74s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OcLZkaM8Xp1xMe0ca97Sa4YHx+gxay2dRvvZeOUDnMu1nSQF8Lae6ViQ7qxmcv9QjdkNqnIsw+h/hYkyb9fSMv8whZqCQ+WWCFiJFp0S0olEoFfqVUf1grPXObVU8ZH2gRld7si1xqyIDQem3Z4A0bpYHrV/lFDhm0R5z4SQr7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MwqZW8nA; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-61c6e3b4b89so3917059a12.2
        for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 02:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756717863; x=1757322663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0cook3tZu/pahjAdhVSuHrsuCcIggtxoSDo9eGj8lY=;
        b=MwqZW8nAtyuMlF7B2RBeVETH9FrSyktN1GKc8kQX/7DQ8o50W7y0KgSt9zUXEWQSZA
         ylpXJ2l7m0ItjUSR7zrwbQXF5XXaY9E3MGwUbmMEmuy/8CatiW9RDcBqTL1Ywh3wdxvI
         N48/n+e1pNOv1oIIL0zk18lY0ZXHAO1IhpFhvL5oiHgj8Kz1AZfi/i0MQyboU4M5oHol
         xo7bKZUeESQKVrFQAREOeFWajOP3BkCWT9VnrqdX1exmLF3aj4KBlHCzIEGeaeFWuSzk
         /xtA2L2MM5BqtwKiiiqeYJjhZzo0k0gwoM9wSkPGhOH195Rq9Z5DuLhDFeLdegfBKgHP
         i/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717863; x=1757322663;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w0cook3tZu/pahjAdhVSuHrsuCcIggtxoSDo9eGj8lY=;
        b=L6V4DoXX8DGMCPAgE6NySChWx0JfBjitUjR3lnYv5XW3t5CyyFHJBVQ14lLWWmOhl+
         7DZSEpvhlbMUh20aC/rtzFhhTboq47L7jQJHn1NVE+oEh3ZMaOwMv0vkf4DkxKidlKTP
         CoWSHIzjBloQUp5Ctl/JAqz491awwTTdyXkXVSVMZYli0Dfd6q5fiKcCkVr1EelqRY8f
         jNG0tPBF3ahXBAa+06k61TFqZ3inNcv5YO5DHa3rdAZ8rX1k5LOX/PWBaFPg0ZJIBNpM
         yQqPHWfNQGxWWcdCiMOOjgX99oC95QwnjFiFQJhtLCYW8yhq3NwfdPwaJGedbMlQF8JP
         EtLw==
X-Forwarded-Encrypted: i=1; AJvYcCVFi0Tw9qbaREetQ6l9qkZHzcqvk1hSHFyST9SoErVRW6QgQrBECFAWcMB/ZL6iQsbbZz6egU75hy+K9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ4gZrZI8ea6oiU3GJ6NQ75a+eBgqynwhblWBDLiNNNOTb+7uy
	adJnCsoSDPNM7t1vRMN9IoJzM0BcTbzEqaJAZBuSQWN+mC4XDzBOXmYYSpPaA+i+b3tm5yujyYk
	9HKPWm/A3IQ==
X-Google-Smtp-Source: AGHT+IF4+qEShLjVFt7BDIbHBSFiIQP/xPnM97kkCf5E+r9Z0xWv6LIr8w+OXj7NGIbaiVsTggH4G2R4LI8M
X-Received: from edj28.prod.google.com ([2002:a05:6402:325c:b0:61c:59a0:3f3b])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:52cb:b0:609:9115:60f1
 with SMTP id 4fb4d7f45d1cf-61d2699f676mr5835853a12.16.1756717857779; Mon, 01
 Sep 2025 02:10:57 -0700 (PDT)
Date: Mon,  1 Sep 2025 09:10:50 +0000
In-Reply-To: <20250901091050.1935505-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250901091050.1935505-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250901091050.1935505-3-abarnas@google.com>
Subject: [PATCH 2/2] staging:media: atomisp: Whitespaces cleanup in vmem.c
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
 .../pci/hive_isp_css_common/host/vmem.c       | 91 ++++++-------------
 1 file changed, 27 insertions(+), 64 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vme=
m.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index fd640e100591..d8a9aaa7b302 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -13,19 +13,18 @@
 #endif
 #include "assert_support.h"
=20
-
 /* Copied from SDK: sim_semantics.c */
=20
 /* subword bits move like this:         MSB[____xxxx____]LSB -> MSB[000000=
00xxxx]LSB */
-static inline unsigned long long
-subword(unsigned long long w, unsigned int start, unsigned int end)
+static inline unsigned long long subword(unsigned long long w, unsigned in=
t start,
+					 unsigned int end)
 {
 	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
 }
=20
 /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx00=
00xxxx]LSB */
-static inline unsigned long long
-inv_subword(unsigned long long w, unsigned int start, unsigned int end)
+static inline unsigned long long inv_subword(unsigned long long w, unsigne=
d int start,
+					     unsigned int end)
 {
 	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1)=
);
 }
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


