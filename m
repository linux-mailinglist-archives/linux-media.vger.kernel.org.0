Return-Path: <linux-media+bounces-40405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FA1B2DD03
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 238D61C22DC9
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118633090EF;
	Wed, 20 Aug 2025 12:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k0xhhcAL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94CE1FF7D7
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755693955; cv=none; b=Yra5RMswR4edLndZt1faphmG4oAEVZoWiBHAermh4vKYObyqH7UThSZydcvvAwD40UntoZrle4M9TvtdtzX6X53wUGHjREQUljQSl1lvtl1qCCLmIUv/EOuHehOdwra4t6D+VfQn9JacVP2Y/6wYtcYWb1TE1o6rcYsCDLB/aFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755693955; c=relaxed/simple;
	bh=7AZ0eI9TlHe52bT1lMC6WLW7ZECYFMBF31lbfocuWEQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nzJLHJ/k6mScSrPE4NiRLQjvZzrU2i7Rgtw0whNmT+C9eY5C9AXlOTMk4uB5B7Yf/Qceig0Pv88R7xx0uU4fw5ZS0T6yZDEDmI5FVbp5+MXTPHqon2dDuwU63FwlRcdOtePEHR4Em4CtS9uKWHHbm6BXL9Zi1uTMmvRFEco+8A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k0xhhcAL; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45a15f10f31so4969625e9.0
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 05:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755693952; x=1756298752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L5gozRnSQkDuhLJMwdLaWw1qElhIPtCo1zd2N9em84E=;
        b=k0xhhcALSzIxnzXDW6H2v68LeNjJM/wx81RAUBhhs1kCM6Jm5F7ZxN6yczEEf07v74
         qyf6oaLFvDdRKBja+mjWt2SUdDZeDSOz6fYdkky9n8Z5iEb/WPnhCsuiCKP7pfp/OXK2
         qFhud2VEr2ReYqVYA43BUHHGJ+iBBAmE3NSu59P9fjPmfhBeXThZUXuVFeF57CrTCl4f
         ngdXRD52FFX5AOebDmFWA+kOZ0Rc15xZozj1ZMZXQ+w8ji0ZsZBTuwNAx/j6+FmeTH6d
         8D05WKTzcL888+X8ttQ+gKSt44IF6yus6S6JE7+h3gqioCMpCckrxVVyla5GuIWr/dCG
         rAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755693952; x=1756298752;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5gozRnSQkDuhLJMwdLaWw1qElhIPtCo1zd2N9em84E=;
        b=CLbYpP59VC+i/+7LDVVE/DBfAcIB8KTiKzDQCJhFsfy/mOiIanxO0LndSVWMzrtGwy
         hB9LA8ZiRsHOFNjqpUrLQZAbuBgJhrD2ksuW0IB2YGc1jmPjMPSY9jsXHSEk0y6y7mJI
         ym5UyM0C5Rk2vCOjNYQg59b3mAIwl6uApb6fAaSfP9JpJKYsVZx90w2ENuHfNrQHeF0f
         ayDB3bcalShAQd/fTFUCiDDm8Cya56WtGg8aby+8h5fxTZYTLVvlZLsaPcBJBW9lqQLq
         gq/YceZ74G+juRt8cWQJ63VrDFfEyKyLmlHgCedPqTrfCfd9FRV8jJhOcLbSbkdi/OeL
         8LOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDpgLG/lauib36IN8PraS1XwDz+aX/VE6bj8L72U7rVakLO40sMLNGAd4WmuvgvFlbsX0SIsagJOdaQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrl9JliKswuk+DZGS/AxgJp9z542fOPuwpLiQARuQY/mLPGWtW
	/RwTPTP667dkpW4sgRWUFO3VR5pk64hmyy7NpupvRU6fLBqXhu5eWSc9Dm+9TotVZ5g/joLYSmh
	NrzXoJZxM5Q==
X-Google-Smtp-Source: AGHT+IHVetR1KhaNo7u3MMikYnmy6Ccr19qtqBiiIGbBQ8eluV+r4wxJSlvm1cyFFrRG2yeAI2VhAGBN2H78
X-Received: from wmbds11.prod.google.com ([2002:a05:600c:628b:b0:458:bfa7:dd5b])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4a9d:b0:45a:2686:dda2
 with SMTP id 5b1f17b1804b1-45b43e6e738mr35344485e9.5.1755693952214; Wed, 20
 Aug 2025 05:45:52 -0700 (PDT)
Date: Wed, 20 Aug 2025 12:45:19 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250820124519.2287171-1-abarnas@google.com>
Subject: [PATCH] staging: media: atomisp: Whitespaces style cleanup in gdc.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

NFC: This patch cleans up coding style whitespace issues
in drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c

Fixes include:
 - removal of unnecessary line breaks
 - correcting spacing around operators
 - correcting spaces between types and names

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../pci/hive_isp_css_common/host/gdc.c        | 33 +++++++------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc=
.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index 8bb78b4d7c677..69d709888c05a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -14,10 +14,8 @@
 /*
  * Local function declarations
  */
-static inline void gdc_reg_store(
-    const gdc_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value);
+static inline void gdc_reg_store(const gdc_ID_t ID, const unsigned int reg=
,
+				 const hrt_data value);
=20
 #ifndef __INLINE_GDC__
 #include "gdc_private.h"
@@ -26,9 +24,7 @@ static inline void gdc_reg_store(
 /*
  * Exported function implementations
  */
-void gdc_lut_store(
-    const gdc_ID_t		ID,
-    const int			data[4][HRT_GDC_N])
+void gdc_lut_store(const gdc_ID_t ID, const int data[4][HRT_GDC_N])
 {
 	unsigned int i, lut_offset =3D HRT_GDC_LUT_IDX;
=20
@@ -36,15 +32,13 @@ void gdc_lut_store(
 	assert(HRT_GDC_LUT_COEFF_OFFSET <=3D (4 * sizeof(hrt_data)));
=20
 	for (i =3D 0; i < HRT_GDC_N; i++) {
-		hrt_data	entry_0 =3D data[0][i] & HRT_GDC_BCI_COEF_MASK;
-		hrt_data	entry_1 =3D data[1][i] & HRT_GDC_BCI_COEF_MASK;
-		hrt_data	entry_2 =3D data[2][i] & HRT_GDC_BCI_COEF_MASK;
-		hrt_data	entry_3 =3D data[3][i] & HRT_GDC_BCI_COEF_MASK;
+		hrt_data entry_0 =3D data[0][i] & HRT_GDC_BCI_COEF_MASK;
+		hrt_data entry_1 =3D data[1][i] & HRT_GDC_BCI_COEF_MASK;
+		hrt_data entry_2 =3D data[2][i] & HRT_GDC_BCI_COEF_MASK;
+		hrt_data entry_3 =3D data[3][i] & HRT_GDC_BCI_COEF_MASK;
=20
-		hrt_data	word_0 =3D entry_0 |
-				     (entry_1 << HRT_GDC_LUT_COEFF_OFFSET);
-		hrt_data	word_1 =3D entry_2 |
-				     (entry_3 << HRT_GDC_LUT_COEFF_OFFSET);
+		hrt_data word_0 =3D entry_0 | (entry_1 << HRT_GDC_LUT_COEFF_OFFSET);
+		hrt_data word_1 =3D entry_2 | (entry_3 << HRT_GDC_LUT_COEFF_OFFSET);
=20
 		gdc_reg_store(ID, lut_offset++, word_0);
 		gdc_reg_store(ID, lut_offset++, word_1);
@@ -85,8 +79,7 @@ void gdc_lut_convert_to_isp_format(const int in_lut[4][HR=
T_GDC_N],
 	}
 }
=20
-int gdc_get_unity(
-    const gdc_ID_t		ID)
+int gdc_get_unity(const gdc_ID_t ID)
 {
 	assert(ID < N_GDC_ID);
 	(void)ID;
@@ -96,10 +89,8 @@ int gdc_get_unity(
 /*
  * Local function implementations
  */
-static inline void gdc_reg_store(
-    const gdc_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value)
+static inline void gdc_reg_store(const gdc_ID_t ID, const unsigned int	reg=
,
+				 const hrt_data value)
 {
 	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
 	return;
--=20
2.51.0.rc1.167.g924127e9c0-goog


