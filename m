Return-Path: <linux-media+bounces-21802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1219D5C2A
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13C381F22261
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE011DE4C2;
	Fri, 22 Nov 2024 09:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bxophegV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F0A1DC1B7
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732268902; cv=none; b=W3AMHjy6Spytkt9RqOoyq+qNy2+mnCwVTTxS07QwAQaQSpSkwB6/ibfsBBB1KA3DDLxCBfZ7YGigNXxbYXCuoixYGolfIhFgjnQYJNA8dS38a0SzN8yTwfENeALGLr5EDMP2hgbiJKokg0CNMGgA2HnCW377eFm29A8FAvRq/Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732268902; c=relaxed/simple;
	bh=w9LCIWUOMl/uTKpIvXEyGapEo1u86swQRW6MRCHY3D0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gve27xEComAkbAUvDfWT+9GfVruwKCVkTVHJj/Gi3vjyZmeFKAVH/DfrUt+4ncxbVl43eMz3IsK43chsBnbwglTm1UVVRJZ57y2SPOTzfYeQyigaayD0AkxmGLyqI5BDxjPmjcYfP3Z6wuixAGXl4RShXPQWN2xFw+/12CA9Imo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bxophegV; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-460a415633fso10709901cf.2
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 01:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732268900; x=1732873700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/BFNmnXBO58C7oe88M+ixtZQGuz6wm+Rt7+horX5NE=;
        b=bxophegV0qAeFpYhJAVl/AFaeEm2uRTWoPgNLgEsKfH2O5EzErr1+Bfjb6NHusm4E6
         bEQFa2oH9nq3H8m/zfMspitRKAbdH2ddonPWyO+7HSOEnmZNVpqTUM/CAM1wkYIkOxyi
         5aY1cwcHKHAGpj9ZoVFgRo5XEk+ZriS8B9z1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268900; x=1732873700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/BFNmnXBO58C7oe88M+ixtZQGuz6wm+Rt7+horX5NE=;
        b=goRvdeph7BM8CVHeuHSypgJED1XWd0NUTfm1+nv8Ac+YpKPeP4DxqfQTK3mB4mLVYl
         jATtA25A5zU/671c06lt2H6S2Knrppf16/4ZVMewXf3JJMao44eFN6zdEUQayPKlPKJT
         aOcw9COz8IeR4fUACmSh771aIIMYQ4qyVV/r1dHiCy6RMGk05MAjHcL6xbLbQi2x7BfX
         OUdqRa9WwOOALOAKmj27tyiamQd90pNN0ERd5FTeycoNqmvnwOTVp8Pry7/VVFDaQb3T
         xdJHZT74RQwiyCmaOAvZHTRTfu6QzI2Fovtrn6EEvABr/ghnP6nV11i2xrX8hwmQ1ziD
         rXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc2H7tPiZplMDqkg0OT42WG2zYAbF9hvpdIzy8KrIGDQ43JaTGB+BfZS1RP9aPzUkx+C3pQImafIiB+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3qjtcJhn9VYWZ76libB36pxcxMnpaOeE4o8tk0qjk9AVvj3CK
	xa0UMxJdn4vsHpnR1TRshkPBw8aUxsgOQ8MklJ8l4N6HLNs9y1+AOt8XVCJc2g==
X-Gm-Gg: ASbGncuMwVoQ4OmdtXlVmothZbqItWpz3XGdupVjlAlhodLGhq90jQr49WqpDqWbnbO
	X/6GJWKsaTNjsYX53Pax+vx6UdT4iX0fcczfgAW4zlE9AyyGcROsnwGvjXeStrpww+vGj1XV5Us
	jdsml+XbdowmaHOLhRGfGh1UY3BxZm7pKB0MArB053g8krVDCTpK7PKMShjBl8nQYeaapjCEe7U
	LLojEkz4oR8ynhRyhF5K73RNFgFZEFAtSLCqULpakMUW5/tEk4/StjFwReFVtDeyKjujKJ3I4xe
	Lqg1LKd/aYzWOfdlb/9lcL8X
X-Google-Smtp-Source: AGHT+IHHdb/bCzojxcLvKgiZFS7wveq70HirCmNUp9dbcD65FOXFHZVsY9GQS/ctk0cY1TQI6tOweA==
X-Received: by 2002:a05:622a:1e8e:b0:460:ab29:e6b1 with SMTP id d75a77b69052e-4653d617eb8mr30106331cf.44.1732268899812;
        Fri, 22 Nov 2024 01:48:19 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c47f124sm9282731cf.62.2024.11.22.01.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:48:19 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 09:47:58 +0000
Subject: [PATCH v2 1/7] media: ipu-bridge: Fix warning when !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-fix-ipu-v2-1-bba65856e9ff@chromium.org>
References: <20241122-fix-ipu-v2-0-bba65856e9ff@chromium.org>
In-Reply-To: <20241122-fix-ipu-v2-0-bba65856e9ff@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0

One of the quirks that we introduced to build with !ACPI && COMPILE_TEST
throws the following smatch warning:
drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented

Fix it by replacing the condition.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index a0e9a71580b5..be82bc3e27d0 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -774,7 +774,7 @@ static int ipu_bridge_ivsc_is_ready(void)
 
 		for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
 #else
-		while (true) {
+		while (false) {
 			sensor_adev = NULL;
 #endif
 			if (!ACPI_PTR(sensor_adev->status.enabled))

-- 
2.47.0.371.ga323438b13-goog


