Return-Path: <linux-media+bounces-37632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 099BDB040FA
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 16:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5C931892753
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 14:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64ECB25525F;
	Mon, 14 Jul 2025 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6woiXXR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E29F25394C;
	Mon, 14 Jul 2025 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502023; cv=none; b=p/EzU3OtAal1H4cGxmFoLZna+PoXdSLZzDKLu8Fi+LybL/PmD2xd9S3myNtoeU2BDH0HGf8RbFRS/1Odz0j7hhmCUlIHWLZ9OnWKBBDsPSkja9daaQ3yJ+DKPzGvAtCJ3SCfwZIcDIGKyMzDweKkfdP+EU5ntaWd7wlE/ciISF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502023; c=relaxed/simple;
	bh=+04pRfrMC5bnxVH1z1JDJ55WhOxbPv/wMsPDtKE/wug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kPbCVbvcX7IOJuuUsCSRdrvuwyN9LeyLHLjRia356Y/+JlGygaGSPHxWLX5klgETnYqrBovv9lg8k034ISiTSP2OKmyiaxPJ4BeVta34AfC9HbhSbizpxG0Fvy7nicj+SZfMEoPOAFBWuSjHBhVEb1yYtI808qaR5GdmurUt7J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6woiXXR; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ab554fd8fbso18763721cf.1;
        Mon, 14 Jul 2025 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752502021; x=1753106821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A11jZ3IWs915tX3jAt6nejExoHwEI3hR6vxjjTJTwmY=;
        b=Z6woiXXROcxMTu0OCh715y0mKYkyuMa5vDDW6gSURLB2teIUiFXCzqMqmoSPWiIj6G
         mwz19fFcD7uIeIYC3fqeRk3TApIpUhrrK7Ezm4C/Yx/tG/GGoqO1De23VGXp16gZh2O9
         Wc/Y53mi16GB97V6brw4rfhHsSb3YC6OFWWP1JW48AWWSdhh76Thlpjj2u5lpwX7qYnF
         UJ+S/psiR+gAdWTJ0QXs4Y9Af5OYDa5dKYBy32Sep7AcgLo1YSKWdIsNF/R45gLcSQlx
         Y97h6rk+B2nEBP5qk63dIYr7n7yDGZAHC2bEpz7ojdE0W+GN+i4JQLsR5Gqj1FubcsGJ
         Bcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752502021; x=1753106821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A11jZ3IWs915tX3jAt6nejExoHwEI3hR6vxjjTJTwmY=;
        b=sqeTsxspdlCAVcmlkTEJ80EIu6oESfzxtXcCK5+wwwHs7I+AFygSkgUmmUWk+T93Tk
         QLWgLktYSeKiBFYXm+sOP4APSVNBCr7la3xM2IZcRD81obhLBqHePunXYhHHJJo7gASy
         XE2r7YK4ngtznXBoSL1WdU9RPyVcdsxL0BXnVtHmomZO+vXf3p/2Mda4uTluvklTSZ4i
         wFaroOjYl/vTcGBKXsaaBLrpFY/mHpYKGqJ6dOzQdWtGU2sDcRIzW2Kj0RfocfECcAHH
         lMqkskgCvPgkppMqf5/uOv2oQLJSJY0KRErRLYHKHOZscvnjS6reLqqw3hFBCYya4lY8
         Bzqw==
X-Forwarded-Encrypted: i=1; AJvYcCU//aebNWYCA8S2xF63IoBmeacbTO1wulivHpERnrPKBafzHu39AsPSPIFVgeRwkTpqa/2JMMECMuFDDG8=@vger.kernel.org, AJvYcCWjilyyVxgFQGvZMnGn4vS4IJemDy6OKnewfNclWAgn052zmVKw9dtlc4Fnek5yvs268Fq13ol55dlwFPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB4qfhv7TQnVSHhxxz9fdu9G6+6LXrov39ts7DiM7/pXRYVLIb
	1PXHoWpXArIJqWKaAVapAc3cuDnt5GiE+huKjpoLt+B+blHtmKZXrY8x
X-Gm-Gg: ASbGncuTUCryAuzneG7vLFwseD/saUsiXe8FqXU1I2HtdbYHJ65uuXfay7ACu46U4vi
	AZJVJthRPRGzT40inYtPADQyTerpNVNh8/pkmEZyXEmUTAMUHkkMxBKxilAh0RWLgt6uaCdynim
	6co7qkZaWkzEu+YBFQET7DxUhroLXoAece3xgXizrcVAazdrR88YXDM7Nl0byljT0n4DVn0CEfU
	gIEr1R1sPOlNlfujKbU3w2oZuaaoI2oN6nphZFVB40sebT+xuJz9ls2PUUCMgcEGNsOpjIPby9W
	PZpClIsUsAd4r2Q+MViSILl0gPEKonP+Vb7U0ksmYxPzAhlqMNeDLaMgdLfYEUwN8w8a8qQKX6b
	SYbcnh2IEuLoN0nY3zMeDJhs5TFSf0naprLWFbWCX
X-Google-Smtp-Source: AGHT+IEv313TLhURVuJV2ZjFg7WZOUSA5K8QH3+VOSOLnS1GhFcpirLmcVMiUuQvO1TRBLf2PHw96g==
X-Received: by 2002:a05:622a:5c05:b0:49a:4fc0:56ff with SMTP id d75a77b69052e-4a9e9ca5040mr311134641cf.12.1752502021073;
        Mon, 14 Jul 2025 07:07:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:5881:3041:2700:bc8c:6e13:ff9d:5355])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e8b7ae2a91bsm2940614276.1.2025.07.14.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:07:00 -0700 (PDT)
From: Woohee Yang <woohee9527@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Woohee Yang <woohee9527@gmail.com>
Subject: [PATCH v2] stating: media: atomisp: fix open brace placement
Date: Mon, 14 Jul 2025 16:06:47 +0200
Message-ID: <20250714140651.213850-1-woohee9527@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "ERROR: that open brace { should be on the previous
line" in isp_param.c

Signed-off-by: Woohee Yang <woohee9527@gmail.com>

---

Hey, this is my first patch, I appreciate any feedback, thank you!

Changelog:
v2: modified commit message
v1: https://lore.kernel.org/linux-media/20250714135014.212067-1-woohee9527@gmail.com/
---
 .../media/atomisp/pci/runtime/isp_param/src/isp_param.c     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 251dd75a7613..b4aac76c2ed5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -102,8 +102,7 @@ ia_css_isp_param_allocate_isp_parameters(
 	unsigned int mem, pclass;
 
 	pclass = IA_CSS_PARAM_CLASS_PARAM;
-	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++) {
 		for (pclass = 0; pclass < IA_CSS_NUM_PARAM_CLASSES; pclass++) {
 			u32 size = 0;
 
@@ -178,8 +177,7 @@ ia_css_isp_param_copy_isp_mem_if_to_ddr(
     enum ia_css_param_class pclass) {
 	unsigned int mem;
 
-	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++) {
 		size_t       size	  = host->params[pclass][mem].size;
 		ia_css_ptr ddr_mem_ptr  = ddr->params[pclass][mem].address;
 		char	    *host_mem_ptr = host->params[pclass][mem].address;
-- 
2.47.2


