Return-Path: <linux-media+bounces-40523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D405B2EEF9
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5785E3AAECF
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 07:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C8027BF93;
	Thu, 21 Aug 2025 07:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VXUMw92o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01936248867
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759699; cv=none; b=AiaU7Z+wgZR422GDjqnWNJVhzuZrlqsEwUF/cNFnfJtH2+9o2gbx31QMee+CZKVZPD5rs20F3jEjevrV8JO48kkv9IsLKrVMvF2mgMVy7p8IUH4Ey/4PEdJxwvz2hoTXpzapkuyGwr2F9VVx2kSipbBFCLIRdx/53kMDo7EpuTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759699; c=relaxed/simple;
	bh=Lwh49xgm8E8hyfnJwvscG8id7WBz9JOebvAR2zKXZl8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I24u8OCB6m4XTYZ21Xt3pu85Fu3Nu/R/mXMJseYU1chdT7H4tmzDYf0vkJx2PA5USaRfmOkikf5FIr4ikK0G3tu0jmUgrvOKHlQ5rWQcOo7o/FPita5fQXzjMrm3g0srmBdgX85ByuMmeM0JM3oOtIRhiUw3x8F3Daxc2r14o5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VXUMw92o; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b9e41037e6so433646f8f.1
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 00:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755759696; x=1756364496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWHak7BTTuUjCdYO75xAv1rLY7D54sU+2w+NwPKTwUE=;
        b=VXUMw92o8qRu7SbSe4pQBR1nEyAmAMYpCvjRKN1YMlJpXB45tBMACaApGrN4x6NUl0
         qSb/lBVO+1yP2bAc0OGYccPjdEWweqKHQmRV/GGyY2/c4GX0SMfnwR+NciyCB336gn0B
         MzpAWFS9zy7Tcqz5Loe7FFPEPLt9X/XJ7RI8ohqW9Niyi8dPf6lL1mHpE0E3mQ0ITuk0
         hlON7N7PqJkDBRNaGxF28353c/h/3SF6bJwf60dDWSYAgbLKHOyyqxzNCfQbJso9C4oJ
         n+ku10DFM55aUhcQNPE4jIwYo20KGeon2oaUgtavB2Gha7iE0sQIt+5YWR85AxNC1Tyv
         SmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755759696; x=1756364496;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rWHak7BTTuUjCdYO75xAv1rLY7D54sU+2w+NwPKTwUE=;
        b=E6YfeJx3qkg9xIXr3bC7p6gDmVVGyD6SV6TnUh3tjBMzqiQqLCJcAX9+1y2RyYC/ft
         gsS0BF3vlxdYTtr/Y+lxpeVKeXPGPfIRh4RuNwVBNiJHF1Ubauj5eHn7yElcluteaUEQ
         y3fxQ9YyTVq70nGvjt1sG9tcgCn1vhsdEjwI+sMBnVDwNvSTuyQ9GjKLSH/pKl2XPUEE
         F18+FKmhUCoSkLvgakdn1/MoLT+qNCH4A1sSLKYDwtrcAMJqn2jZjWVTauzlkWwosf4U
         p+RKl11p3s1TrDOavEpq2oymna/e7TaWZ/0S2dhs9ml0JhCW9ZlpoGLF2uENO2OwcX+w
         NX7A==
X-Forwarded-Encrypted: i=1; AJvYcCWs4plMe+M6A0YxSHgcatrr6Q6roOopwMJVHH0Q25bxawKk2027wr5EnkGz1MKkeSTXUw2O3d8zVq9PYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXSzcsXG1xzGlDI0PLeIU9L0xZ3LrGRBIF8Iwa+diRiQT0ULZw
	mQj/G9Rn4+tHvvjDA6pMurOdwJGkvqxa25mKaLQSmfwsw3p8hrWMtwghkugD9fOyG6WWjlHYRyT
	qarrRgfeogQ==
X-Google-Smtp-Source: AGHT+IF7hlrAjiNuM/KEHKAFY8yyo63CcT8LWrl4yHVQAKYWdCNBYFgKuNHYzShQe6cb3WgyW1zJUwj7YKrw
X-Received: from wrbdk16.prod.google.com ([2002:a05:6000:b50:b0:3b7:d75e:c4a7])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:250e:b0:3b8:d1a4:bab9
 with SMTP id ffacd0b85a97d-3c497369e98mr1055445f8f.45.1755759696323; Thu, 21
 Aug 2025 00:01:36 -0700 (PDT)
Date: Thu, 21 Aug 2025 07:01:29 +0000
In-Reply-To: <20250821070130.2581766-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250821070130.2581766-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821070130.2581766-2-abarnas@google.com>
Subject: [PATCH v2 2/3] staging: media: atomisp: Whitespaces style cleanup in gdc.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Clean up coding style whitespace issues
in drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c

Fixes include:
 - removal of unnecessary line breaks
 - correcting spacing around operators
 - correcting spaces between types and names

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../pci/hive_isp_css_common/host/gdc.c        | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc=
.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index bfda3cd13306e..bd44410729bb4 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -24,9 +24,7 @@ static inline void gdc_reg_store(const gdc_ID_t ID, const=
 unsigned int reg,
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
@@ -34,15 +32,13 @@ void gdc_lut_store(
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
@@ -83,8 +79,7 @@ void gdc_lut_convert_to_isp_format(const int in_lut[4][HR=
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
--=20
2.51.0.rc2.233.g662b1ed5c5-goog


