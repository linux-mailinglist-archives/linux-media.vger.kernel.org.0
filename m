Return-Path: <linux-media+bounces-48392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1ACACF7B
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 12:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0424C304067C
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 11:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962833128C1;
	Mon,  8 Dec 2025 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqEErDaK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C22227B8E
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 11:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765192612; cv=none; b=lhY3C+6PJbncVzEv9HpwccN/MGJzH4Mambjspkv+5bjSAibqe0zph2Gfk311/ZjEAtkdEgQScZk/GcIr+IL4yz/IBUd1C997Nwdmxx6m4vYehJsUvGkiBj9Kt2qeqwHfHBuC3uvKhy7G0OTrY9nNne5i2TyWo/ZUTV2myJ9pPmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765192612; c=relaxed/simple;
	bh=SOUqlzQpcjCK0fTaxI1RTsijxJFfgOEwIrAYv7Vz+lk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rPghwegg0JrP22MrCKjYR1Z9WOepJCG9Icz+v6Ih21ol/OzOHYXyE5qWKLA6wSOlq2+WYmZzISLDj77N0dGw0hFya2904wMHNJnJt8eUh6/sEyMKpHFWBFHFYD/BAlIgbz4AAS2odYCNEK0zu2YWbVdhdEQizh5m5mRSLbZONCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqEErDaK; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-5943b62c47dso4260657e87.1
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 03:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765192608; x=1765797408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k1FcJaTt57JlbJy66zrOJwhugl21WOuVNYEAfr8aZYo=;
        b=VqEErDaKPyr6weReXIM1+Q3kai+gMtGc0a8mbfJs73zF0NUg5WkfEurwUkjTIg0Zuj
         3gOsHk0514wQkhc5btjSHOGO2G0xCLjg3EXD1YRFlsWgKQIS9KlAuAnxI+iduZr01Lg5
         KfHP+SAnw8NhD6tx2Bw2SCqV5eUf1NQ0HpHacR+aNsmGm/N/DyncnAo547yhR0ACuZUX
         /gUy9yAHDjGOe7nZvxxxQxuyyx5G2+OauF0ZmJnWNo0Bkl/iq/B8tZ6tjV7aL2uY106P
         Jkh0hKnJaI/O8xEFcSTBbiRkm0KbfQMC+8ceRqT5QmjNSMxzWCWpJNTEXKL3qBXnX6aD
         1r3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765192608; x=1765797408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1FcJaTt57JlbJy66zrOJwhugl21WOuVNYEAfr8aZYo=;
        b=rZJq7tr67W3exJyI5sa2xQzBJsDJI4hskzJoeczBLGQBSLH44WXncXXEMkgIBtMiE+
         5sWDfdqPMbGU5UKHD64eAxJ0KTfmDN1/BwQwNVqqdtlcb77mIykr7RgKdEHL/hobQHyt
         u+xcwxWigtog4xDN/TUcS78q78IRh1/d72U7h1sKoK4AvuYKY6+wK00VLuGOkmPwCXUx
         3lMHDIOYx+k/b3ubeQTjNLCRkfVM7QyoVXj45fIL2n1ogXDZRtAC7RH4N/LbqIKTo4Ya
         sX9R4SR2CECoz0ODyGHfe7gzHSzsXiQndR8LldgA0JmPi0u4QnandTojHZ1j/OUAhnhz
         achQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWDDXw5oageDt9z0Os4tjKDzeVBofaZ3S5uP0+Ip/8VRj8AhclNzWwzXaU2y5XZMmLmuxVVXwx+6dkgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSfDjCh4WRdIRpfIGyHb5o1sii4OSVkXFtKvebjYmN89rCqd0R
	67vtjd8wC232T36+udHpsmZYF4P84xI1RN0TEIgT3L3DD07FamUJ467D
X-Gm-Gg: ASbGnctDEJ82+9r42v7ig+nYaFhGnwkxWzOxxKeVoZshBkxh+A2dQ28bDwSIq0CaS9p
	F+ssLuz1qALiibn7JWhp/MRyOlQfekJ4MmAK5ThRdw6Bqf2iLHovOvtaXzUo1OYTXbSZfA4/hsj
	09Mh54x9/AKTZqPA3fdJ+oCq5JWcw1j29ELnC5/zwRH59ojfN149ZeZMcl1wMWXyqBT4CgAwp4Q
	nPXmmSpQhtljkJnKQpBr7exiqfKRkNdIpH335YsCzR6f9YC0UUXoNIOb06ODvbexNd6f8aeWnHk
	ug8L+i/yEAUigmapcd7cV5Em7C/bPxg/rgN8mK7EfGFu18vLRfDLLTzLF6NU3/V6E65UtY6evWd
	PGhssdfSyfQZHVhh5NUr8iEVtAT/voFfaIfVgni5F0kUQyWm4RvJOC94nDxcIq+Z8BDo/BbhTBO
	QbpnVUCcvY8Z4hk3ICh7QP1aBNR0fhNIHo7Wktc6x60PIjP/f8G0j7vGBP0g==
X-Google-Smtp-Source: AGHT+IFU4R3moE77eHxDxOCHEP0tsIAxCKnS+8bBbj0g/HYxCv24Zem1PsGdmmHLOWneqk3oWD3pdA==
X-Received: by 2002:a05:6512:234b:b0:594:5545:b743 with SMTP id 2adb3069b0e04-5987f918492mr2689851e87.27.1765192608021;
        Mon, 08 Dec 2025 03:16:48 -0800 (PST)
Received: from rbta-msk-lt-302690.astralinux.ru.astracloud.ru ([89.107.11.60])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e405sm3975815e87.49.2025.12.08.03.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 03:16:47 -0800 (PST)
From: Alexandra Diupina <dyupina99999@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Alexandra Diupina <dyupina99999@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Cox <alan@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] media: atomisp: avoid memory leak in ia_css_pipe_create_cas_scaler_desc_single_output()
Date: Mon,  8 Dec 2025 14:16:17 +0300
Message-Id: <20251208111617.21966-1-dyupina99999@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ia_css_pipe_create_cas_scaler_desc_single_output() may fail,
so add cleanup by ia_css_pipe_destroy_cas_scaler_desc()
rather than simply exiting the function. Also add error handling
for kcalloc() in load_video_binaries() and load_primary_binaries().

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Alexandra Diupina <dyupina99999@gmail.com>
---
v2: add kcalloc() error handling
 drivers/staging/media/atomisp/pci/sh_css.c | 41 ++++++++++++++--------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43a8c..c1239e910fdc 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4528,21 +4528,20 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			  NULL,
 			  &cas_scaler_descr);
 		if (err)
-			return err;
+			goto ERR;
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kcalloc(cas_scaler_descr.num_stage,
 						  sizeof(struct ia_css_binary),
 						  GFP_KERNEL);
 		if (!mycs->yuv_scaler_binary) {
-			mycs->num_yuv_scaler = 0;
 			err = -ENOMEM;
-			return err;
+			goto ERR;
 		}
 		mycs->is_output_stage = kcalloc(cas_scaler_descr.num_stage,
 						sizeof(bool), GFP_KERNEL);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
-			return err;
+			goto ERR;
 		}
 		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
 			struct ia_css_binary_descr yuv_scaler_descr;
@@ -4556,12 +4555,19 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			err = ia_css_binary_find(&yuv_scaler_descr,
 						 &mycs->yuv_scaler_binary[i]);
 			if (err) {
-				kfree(mycs->is_output_stage);
-				mycs->is_output_stage = NULL;
-				return err;
+				goto ERR;
 			}
 		}
+ERR:
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+		if (err) {
+			mycs->num_yuv_scaler = 0;
+			kfree(mycs->yuv_scaler_binary);
+			mycs->yuv_scaler_binary = NULL;
+			kfree(mycs->is_output_stage);
+			mycs->is_output_stage = NULL;
+			return err;
+		}
 	}
 
 	{
@@ -5106,8 +5112,7 @@ static int load_primary_binaries(
 			  NULL,
 			  &cas_scaler_descr);
 		if (err) {
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			goto ERR;
 		}
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kcalloc(cas_scaler_descr.num_stage,
@@ -5115,15 +5120,13 @@ static int load_primary_binaries(
 						  GFP_KERNEL);
 		if (!mycs->yuv_scaler_binary) {
 			err = -ENOMEM;
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			goto ERR;
 		}
 		mycs->is_output_stage = kcalloc(cas_scaler_descr.num_stage,
 						sizeof(bool), GFP_KERNEL);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			goto ERR;
 		}
 		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
 			struct ia_css_binary_descr yuv_scaler_descr;
@@ -5137,11 +5140,19 @@ static int load_primary_binaries(
 			err = ia_css_binary_find(&yuv_scaler_descr,
 						 &mycs->yuv_scaler_binary[i]);
 			if (err) {
-				IA_CSS_LEAVE_ERR_PRIVATE(err);
-				return err;
+				goto ERR;
 			}
 		}
+ERR:
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+		if (err) {
+			kfree(mycs->yuv_scaler_binary);
+			mycs->yuv_scaler_binary = NULL;
+			kfree(mycs->is_output_stage);
+			mycs->is_output_stage = NULL;
+			IA_CSS_LEAVE_ERR_PRIVATE(err);
+			return err;
+		}
 
 	} else {
 		capt_pp_out_info = pipe->output_info[0];
-- 
2.30.2


