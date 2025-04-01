Return-Path: <linux-media+bounces-29153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D3AA77D80
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 16:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2F423AC01F
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 14:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D58204C21;
	Tue,  1 Apr 2025 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GsDBJWo4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5484D20408E
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517082; cv=none; b=SBHeM+FpTwhmSu48GmdPLFQc0VCGwDXzU1szTRvBhVzjpSjMkaoWFZkI+nb+BDTnK5m0iKZ3D7rJ8QAilzlVH9I2xHXptm4U013yIpd/fpB/QROGJicfjA5NeT9/oFWZWsiYRMOHDTJVFDMeUSn2hWyPnLFC+MyTi1Pwqo9Agzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517082; c=relaxed/simple;
	bh=JPDmnKUMglz+XsRlG2V69K0PwK6vqRugnwv8vO6nGUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M+DN1xOkeXym+Clw8a/iGejAK88g77mw4YNfVZ4XKdsoL+CTmqO7NiCYCWGIrlF1QQ4VZJEY8TMKHTPRBHfUaDXc2o7sGxOoj0YJc1rN74ebN5yLRB0n2X5oXnpoRjDgU3FDgxiXgcnQN0h1BAP1s/pehe9oE/FPCKnapfKZ2eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GsDBJWo4; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso6868988e87.3
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 07:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743517078; x=1744121878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=It3zznYp54Cp1R2/qjZYQRWQWBFmdplnsGjJ5JvUQS8=;
        b=GsDBJWo4jl5luPbc6WnSbtNJmpdZggAoecUqPlXA8psNkJTktPgq8FuhCmacOuTyBC
         3yRpwYc+41o0MgjRfbYVt794JTIj9St1T1Fk0h+xVMYHtzw4xI1sklWqvBxnyPq+uZng
         aDagdRSc+xUs/gqBW9zj7q1Vd2EFmvVnBB1is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517078; x=1744121878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=It3zznYp54Cp1R2/qjZYQRWQWBFmdplnsGjJ5JvUQS8=;
        b=KSHCspAAZLqSWDHUH+huwLo/oVyfmWqhWx1Vr98JU56asPdHSScTRJF/M+AOsXrbxX
         +h30tvsG/YG1R9WTd2Eaj6QN9aSguLOh0bIWg3csc9qJxwXfUhUSjGWBIFxAACA0e92B
         02UAAhxyYT8W0AjZ/huHT0ruFRk/mMe36W3nMbw9MZL4i4RTchCg8cMrQWT7jESpuY8R
         wAaKtbJU+wWaFQRfoKZlIhAenJ8SJPE8a5F/0lqabKB4JEvJAliEX85riLNp1VxK4rhA
         fDyxHfWjksPG/Cj/+PVUKkBLcC70aV835Xctt9IEBUEZj9HgFhc/QrN4Pe9axOLJav16
         KnBg==
X-Gm-Message-State: AOJu0YxICt9i65VMkszzxYURnnKVxBuxSxMLSn+RE9r1aV9F526z1OF2
	c2EliN/IxP3mtejkOfXH+yDBMbYDy0w4ZHamsHNu2DADSPYQHDiuFnQ6/IAjjbW31pG32/QxF54
	=
X-Gm-Gg: ASbGncu3zDtprtq/PsYkzrgPIh52oMBX3zYGU8AWILdw0BEbKsNbbYqzG7S3kCewmIe
	Oys1tSKy+UvCr4ZlZBP3/yUePfBu2wLdJWuavJQ+u68JfFNGe7Y3C6DN5iIAUgpboCua4l49SHH
	hxbpaZ7kzTEdizd7xn2yNIdPeyL7gXCFubVAI82lbDcyEYjf5v9JTohCRwFeYG5F9CwYYCTTvee
	L4pk1h5eRx44z2UbexdmJDwlHWU1A3fdjeEYCgGjjkCBg5N3oBsn2kq4DhAKhXJTpgBe2Co9HZn
	Vv8kRar49L5/0Wozqyi+Gkp0OnPVYlZSfB93YJjMbjIst/sedxZya1to5sMkQaJAZj0y3RsXyzs
	3BQXFzL1v7+F+FsInQ3VPFC/y
X-Google-Smtp-Source: AGHT+IFdyRka7MweflyBv5DeiJjMiC9PFaRXPwmxIKfE2/7XtM+eY+SzHCu4lHsET0WaqtAqx0xBlg==
X-Received: by 2002:a05:6512:3090:b0:545:2ab1:3de with SMTP id 2adb3069b0e04-54b10dc7b75mr3430994e87.13.1743517078196;
        Tue, 01 Apr 2025 07:17:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c19a3sm1377789e87.80.2025.04.01.07.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:17:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Apr 2025 14:17:54 +0000
Subject: [PATCH v2 1/2] media: atomisp: Fix Wformat-truncation warning
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-v614-v2-1-53024c4fcdc7@chromium.org>
References: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
In-Reply-To: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Gcc8 is convinced that we do not have enough space in dot_id_input_bin.
Extend the variable 17 bytes which is just used for debugging.

drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1336:9: warning: '(pipe' directive output may be truncated writing 5 bytes into a region of size between 1 and 74 [-Wformat-truncation=]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 9818771a35e550c0ce98da826caff5f834867e7c..84220359c9576b0021ea7ac7ba13548bd77e49fd 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -121,7 +121,8 @@ static const char *const pipe_id_to_str[] = {
 	/* [IA_CSS_PIPE_ID_YUVPP]     =*/ "yuvpp",
 };
 
-static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 10];
+/* 27 is combined length of _stage%d(pipe%d)\0. */
+static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 27];
 static char ring_buffer[200];
 
 void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)

-- 
2.49.0.472.ge94155a9ec-goog


