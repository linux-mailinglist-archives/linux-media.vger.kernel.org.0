Return-Path: <linux-media+bounces-23506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA439F3C8F
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1817163B5C
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 21:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26A01D88AC;
	Mon, 16 Dec 2024 21:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fkTiktYF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2811D88BF
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 21:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734383852; cv=none; b=czuolP1WAKk01/RRkB3nRPRIF6j0hcjcYA6u6W65K516PreJ+lLIfGPZeDRYapOEH4Yrq19vQhLpIHJHPlp/hMTY9P5kLrP5lIuPVXZ39nB3S1VdsczPTxis2TezStHkU7oi4np8PZRGP2x7jzBRPkGaqDE8k8r0yFxkEQSMJNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734383852; c=relaxed/simple;
	bh=OSI5+enbqVnK80hh3GRt2v2/xjuyertlyl2dDt3BvaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s5q2K0xFEeZYYb0d2miQS+0Psi3dHQ18QuHDk4fx5MRpt5ZZ32E1frkE6PVFeFy9pa35EDq9m1QcQ6UExIIrPX5KIvzm884uJLncIsJdUGT82m+BgPwf/eeASaacvr88C3gWjgWdmdHpZ7gao2/xmiqZkfPzhDz6wxUu8+s3YMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fkTiktYF; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467a8d2d7f1so29564681cf.1
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 13:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734383849; x=1734988649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94GpRvEFGP1zDl7TooYa5XXxiXoizWnVF+RBMjgEO9A=;
        b=fkTiktYFTPmDeU9C4JP925QArvW+eKnHcm6j/H5w2zAykkSRytleeNs+VWy4zzwKTB
         +aYKjrb1UEjiGE6Du8jzPlIzSkdGhavIKg0Gbnk2WkrGHnPO3naJwCBiMxKlW8mBpNuN
         GOsPXWogbrd2ZH1g8Gj1fL7YemXx3isGnfgSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734383849; x=1734988649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94GpRvEFGP1zDl7TooYa5XXxiXoizWnVF+RBMjgEO9A=;
        b=VeikKSnJI1yWS0f4eMq/uDln7Eq1GjPioaea7Rk8FutO9biraWZRKLTTFk+sVttKk2
         eLlsTZIigY04WYftNVihYlIrI8LRJgumbe4ICg1umz/9fRK8YCphBQBaIByUNFoo5oUS
         VC8LpIEn4NSm18+9zDPtn2sEbQxcfCHSaHdtEmkqP1hzriIelmB0hs2oIBhQwvh6Ae1N
         kgCQfYZxBjH2+WzHUm83M/A8Fz2xomDhqFgeDzxvczdVRgdqlKZChE4/HrB//1rFFalZ
         v8yH9lTe2b6afyrTXybmqxRK7Rg+VD65LtBs4wMpPSUkZGLFY/2/+L2Sy8u2pxfRn+g3
         qd9g==
X-Forwarded-Encrypted: i=1; AJvYcCWVsTR5gfS/yV4nCFFDOKDw8uQ4SwT5cGPjGWoo6kSLq2iBnlcQR3n1XXgr1itZcclAHLUmZKSS14RH3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YypGjLW6wJtLuo2Cxi6OM3OXEmt4orPVTh88q92TBct0wC2EnH2
	FuXyTwOvyk0vaT4mUkIRsttH8DXe0iZTBvRajzqtnnfCy3+NLPQDhsJDpwdcvQ==
X-Gm-Gg: ASbGncunTsTJw1wlrnD69EU90Q0v2CfPrP2vrnk4ADpQ1Tmde6TgTjDPbkV4VeMuY+T
	c96aaJd/H/0gLMU0C9Dq2DBRjHq0qCKmvbOt6JbrB4+332JRTfSXz133vQtawPIU3vqnh8qNzw/
	Gs/t53HyRuUafzRMWdTQqfCwio2n6J2IN9LMMhBvFD/+53kd+2iFWdn9Lw3Bz+/cNlEzkFJ8GUS
	nVS89b4sZaWE3Mi7E6k2oy6LtEHdASigIKX8I5R9B9n5h/O8EvntVjI/NbLpFT88kKm7qjfilBF
	hOxeTVVMrDrjiHJihPwn5cn646Kv0VU=
X-Google-Smtp-Source: AGHT+IFyzGw+gglrqm8+RhNerLly3LfTpt0cYg/FTCF385N1SMb70IaANKI6otHSuU62jnflMlYR+g==
X-Received: by 2002:a05:622a:1210:b0:462:e827:c11a with SMTP id d75a77b69052e-467a575a86emr267051701cf.19.1734383849004;
        Mon, 16 Dec 2024 13:17:29 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e85c03sm31927501cf.69.2024.12.16.13.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 13:17:28 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 21:17:18 +0000
Subject: [PATCH v5 4/7] ACPI: header: implement acpi_device_handle when
 !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fix-ipu-v5-4-3d6b35ddce7b@chromium.org>
References: <20241216-fix-ipu-v5-0-3d6b35ddce7b@chromium.org>
In-Reply-To: <20241216-fix-ipu-v5-0-3d6b35ddce7b@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Robert Moore <robert.moore@intel.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.13.0

Provide an implementation of acpi_device_handle that can be used when
CONFIG_ACPI is not set.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/linux/acpi.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 05f39fbfa485..fb88f21bffb2 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -854,6 +854,11 @@ static inline struct fwnode_handle *acpi_fwnode_handle(struct acpi_device *adev)
 	return NULL;
 }
 
+static inline acpi_handle acpi_device_handle(struct acpi_device *adev)
+{
+	return NULL;
+}
+
 static inline bool has_acpi_companion(struct device *dev)
 {
 	return false;

-- 
2.47.1.613.gc27f4b7a9f-goog


