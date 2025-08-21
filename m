Return-Path: <linux-media+bounces-40600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EF5B2FAE6
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 599AA1881F8B
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32F633EB15;
	Thu, 21 Aug 2025 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kz37d744"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADAF33EAEB
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783338; cv=none; b=ZN/8UH55R5PscwC58S1squW5bI4CoG+qDao4GFVZt+43GVqQvvZFZzZdDLN4VpvnQqaFfDHYIOHZOciX/igvbsarImUcVses944QCpfSmbwac0KOlsjfOj6pLDUgS+2DbfZshC+jyzhoOJevD/o0z00TOWepceusFh0KcgiiCdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783338; c=relaxed/simple;
	bh=wc++2Oy6r3s/7kL3+UoefnxPfMBadpuQu0bcTemREeE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cI54KOyY7d6fGnJNHtQv6qUdduSyGyTLDs6PFh+zENzjSmNJ3RxYnvLJulKpsrxT9D/W0k/b5Keab9sOguS5TxjlI0C/SRNDTS5mqd4NtbohPcf1LCQYXgLTOwu8jdn7SqkCOTiOupYvsRE+bVv7NhyPbYv+Nd9HlmO5F99o1d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kz37d744; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b4d6f3ab0so5204995e9.0
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 06:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755783335; x=1756388135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r5c8q0Ky8ajlAkdaKgOXiGJui2dC0wizBAr85LUc6gA=;
        b=kz37d744NrdOyXVt4ywwCIlngOizaUpqthab55FvcLhE7u7oSq/6Ls9dH2UUMGhARu
         XHp+Aosf4dYqfXJkLyAtguPLUpQeJNYzIxIJbesQRFUqFzpopNEYwDNwKMzb3BNKUDWP
         P1j1tP6Fn7Q3GGUMw8gbqz/N+5joPJ3ne8GZrYYnbdwdRJIR8n64V0/oRCvE2EghlTT6
         kKj0S1bqMpN3SLpBAyLYEz0QPH5bZYxzqGK8AakPAA95mcwYpoklF5Gx7rdZxmUcV2vU
         4EPFjbkHDTixVC/KxswkxaprmhgRaasUvqt6TSo+Iz7OYsMJumdZjqlgBcPYGnhS0kk2
         iw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783335; x=1756388135;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5c8q0Ky8ajlAkdaKgOXiGJui2dC0wizBAr85LUc6gA=;
        b=Q5w295i04/q0y9QSXstnBQaljp9mmSTdy50H1To4daAiuDMufqIXBCQ2qEUCA1Lisw
         1WH2nQbxnnC7aiYaMMuqpTyQ/dpK3t1v9XFdrhYboSbelJW1icw/jA7R4V8hctMRx1gX
         VL4i8qRGBIO3M6vbB265s5jh4w+xDAiBprOCtgQ7HEUTgc9dv0OtXsDPTSKieJlOyoLC
         hMJEK7hT5Y4XYljfj/D2q1ten4V3kX92L6sAIzF2eD8W8oZVx3kPjelfPDPDiJ0YPU0G
         vejzmdjixXOVo+viCTuMbfhMa3or9jKWIai8dhmE9CLjQNOC+Sd/KjI9S1MbxQHGQesx
         YH0w==
X-Forwarded-Encrypted: i=1; AJvYcCW95qQAlITqeAcPOTtE/3Y9UuNd7sNHTtqwGBaUTSv7WZnyUUKjxlpqkVXqXG80IMdiuGM607wmuDz2+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdZb4NoJDyxUyz5LQf4vTE9B9mHWmDQFSwMaK29aMyBlQWv05I
	4rqPsLGHzcjWj5yPE4bK71ckvhmVftOXqYEYIoSmjlu0YlciktPefmtuZcmFxDCKw7D3bAgyKDE
	ThE7atjh2Lw==
X-Google-Smtp-Source: AGHT+IHIRg6I19eGyKLDXrDhVh5Q1QDPm2jvIQ9GUlLEMDNmDUHP1uq8W2QMfP2fIkEEXeSTbRaTO5YZvqrI
X-Received: from wmbbi16.prod.google.com ([2002:a05:600c:3d90:b0:458:bea8:57ef])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d1c:b0:458:a992:6f1e
 with SMTP id 5b1f17b1804b1-45b4d7dc73amr28165345e9.5.1755783334885; Thu, 21
 Aug 2025 06:35:34 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:35:19 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821133521.2665734-1-abarnas@google.com>
Subject: [PATCH v3 1/3] staging: media: atomisp: Remove unnecessary forward
 declaration in gdc.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Get rid of gdc_reg_store() forward declaration because it brings no value.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../pci/hive_isp_css_common/host/gdc.c        | 24 ++++---------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc=
.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index 8bb78b4d7c677..bfda3cd13306e 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -11,13 +11,11 @@
=20
 #include "assert_support.h"
=20
-/*
- * Local function declarations
- */
-static inline void gdc_reg_store(
-    const gdc_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value);
+static inline void gdc_reg_store(const gdc_ID_t ID, const unsigned int reg=
,
+				 const hrt_data value)
+{
+	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
+}
=20
 #ifndef __INLINE_GDC__
 #include "gdc_private.h"
@@ -92,15 +90,3 @@ int gdc_get_unity(
 	(void)ID;
 	return (int)(1UL << HRT_GDC_FRAC_BITS);
 }
-
-/*
- * Local function implementations
- */
-static inline void gdc_reg_store(
-    const gdc_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value)
-{
-	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
-}
--=20
2.51.0.rc2.233.g662b1ed5c5-goog


