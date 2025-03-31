Return-Path: <linux-media+bounces-29083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8145CA76C18
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 18:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A23431884357
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 16:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DE2215064;
	Mon, 31 Mar 2025 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aUaH3Enj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE5A2147EA
	for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439128; cv=none; b=WzKk+UWLVSL9PfnRYs0V8YJkU0Id3g/vylg0ZwEZPS+SG/ICjopeUE8sYQlFuxFJcW3fa14cKg1GfErNDYn0ZGYGhvCjojFomTtr8rrLTfcEtQlrnLnG/54aYYTn/6Z9z/8JnpiNnv2DIDYBpsXkBM24VkUbx8kvYYDfI13+8To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439128; c=relaxed/simple;
	bh=yUQjN5KrxuKptMOriL54MdCLqGINX17eabOmAVDJrrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HWL1joAruX4ZHRLBQlqU7sA7FtLpQk2tB1kZ0WF+BV6OBnKIlAqxd0TUfoxZNPY5CjZNIK8JSFntD2Zi2bhetgIH7PA5EOiYt3PRxZLsBdyzLP2pd0mayo6UvUnU2xZk8sXUoSFU4yHFM940hfWbug7Tnzj1X953Uhx5atXHYII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aUaH3Enj; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54996d30bfbso4106033e87.2
        for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 09:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743439125; x=1744043925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIVGQ0u30Cds/QcwRGX6gsTWFhIPKgE+VrlFy9b//yw=;
        b=aUaH3Enjdl0kwVuv4ZMoqjza8y+bIztUs7Cv4ocP+GP+Ds4sZ3vqjr1AYRr0mm2rAO
         Gm8dpevidwfIJpagEdMJXcaaR+63oWe3hXg4cX3cnKdkTIbu6kD0j0mFQ2mL1opkmTon
         a1HLxSU2ZQZHcbE8wuZdqS+e49XcnI9oSppQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743439125; x=1744043925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIVGQ0u30Cds/QcwRGX6gsTWFhIPKgE+VrlFy9b//yw=;
        b=k37BLduiHJMc7ParWqhc/0IfxvZOrW9C+Arpn8Fd0RBiwSWyQfrHo0vgz2XwFwOBFn
         yjeqJ34WrH5pXCmm9op3ra664rSBVz0BYdwpflDVuFfy1+XtZjoHJkpQmJ2HuOqNqCXP
         DqQECj4hfSksn8Uzg4S6W5tKO8H/Nv+oM6c6/g2SIprM6lFuxTGCwZfjmaBouSQIQ2wZ
         lKXm6AXpejhuk4W/SsZ41zXrPTvebEJNssQSoQHldFq25qxrk+QsIjNVB+1M6bMohqyG
         lqBHdLFlVInX8hPixHibpXjTknsX/w/u0YzLZv5slz9d61I43sT91TRLynC125NPUQ1p
         7oPw==
X-Gm-Message-State: AOJu0Ywe2p397SeKVv8cQ69qNbULz1PUCrU0FpYw+H7IZ5vgJBM3on8y
	qBeK5DS/K/xqLCdjuvUy+IbDmnvt0c3Fn7a3g1cs5k4gltmzJxBa9qTZ555fdw==
X-Gm-Gg: ASbGncuh7No1+hGNWeHabVa5Iln5au9Jvn/UeEiRiH45AcoZX2pQt6da4s4SZ+qZZY2
	6S2Z7vCHTGEGDGmpO/uO9Jq0ZMryCUM4XdpA7j6glwadADAj1CEewGM4VCLgK1oLSrPL/0CB3b0
	ZDIq3Y/SCbm5E/1fI6FJoriWCdrpuRJvuWiwLNAg7Pf2NbKgQ4LHRoFNSDvFKdMMy1Ntj3IXqlp
	o7jvx+xl/b9jtbpQaNYpn25/KGm+7NPFGaMOilh53efWVj8mR6+p2pR8MpjFTnF4OEqReOvtvRt
	x+Oywdu26e67SdJdSTgLHSwaYclfQXJLesZiofc/DrxtgNDF0PXxG/bp9RUHmEalUKfMonWuE1q
	9sMYh9LR7m/vgOyk/qVJ/Qf5A
X-Google-Smtp-Source: AGHT+IH4ThQvA67GMn9BBP+BpW9UKkqL1n9PxtnEWwkqY1wfdsPSyC6iLFZ0LnE7iFq1L3YeQU9DMw==
X-Received: by 2002:a05:6512:3d0b:b0:545:d7d:ac53 with SMTP id 2adb3069b0e04-54b1100eda8mr2784360e87.34.1743439125136;
        Mon, 31 Mar 2025 09:38:45 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09590fd3sm1151796e87.188.2025.03.31.09.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:38:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Mar 2025 16:38:43 +0000
Subject: [PATCH 2/2] media: atomisp: Fix Wformat-truncation warning
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-v614-v1-2-9bc69a873720@chromium.org>
References: <20250331-v614-v1-0-9bc69a873720@chromium.org>
In-Reply-To: <20250331-v614-v1-0-9bc69a873720@chromium.org>
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
Extend the variable 17 bytes. It is just used for debugging.

drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1336:9: warning: '(pipe' directive output may be truncated writing 5 bytes into a region of size between 1 and 74 [-Wformat-truncation=]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 9818771a35e550c0ce98da826caff5f834867e7c..45af23f09c0ae67a2dd62e79457b548831b8c21e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -121,7 +121,7 @@ static const char *const pipe_id_to_str[] = {
 	/* [IA_CSS_PIPE_ID_YUVPP]     =*/ "yuvpp",
 };
 
-static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 10];
+static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 27];
 static char ring_buffer[200];
 
 void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)

-- 
2.49.0.472.ge94155a9ec-goog


