Return-Path: <linux-media+bounces-21806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 300CF9D5C5A
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAF012812AB
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF241DEFF5;
	Fri, 22 Nov 2024 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A/sY87vJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2EF1DED6C
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732268909; cv=none; b=fIqE2PN79bhIwd2D+DcFhQVhkjBlnJyVwsRWEyLYoYFpVuLQm0eFJjlhUXc6Q/UKQ4hBvqHjezAt1vYalnGw4CG1kl07XCnlnk2VQdji/tocRZhun+4b+ir8fLbe2Vups+PW31E218ld/LGZ6f3TEmKF2DYCY86dTXXIHRGYaCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732268909; c=relaxed/simple;
	bh=4H1xI8rZic7uj8BVAr4deS1lVj9r+ITu7MlYRDSB8Ik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sItbOQ1gYHfGlPYESrLT0ClCZ8yBpuLrdBVfSc6qmMs92AzHQ9vqYy74iRFCiy6QxCdZEmctRIpxO2/bBrBWskAU8K2igjBWDzxbY2nNbDAP4V/iBrZ69pdrwrRBM7BPGGi+orI/dKMtJzHPuCTEi3CMc+JkwxIbWutipUOIdOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A/sY87vJ; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-460e6d331d6so11571801cf.2
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 01:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732268906; x=1732873706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrSmAj2jkvytw0rNLCddg1aexjt2xHCHXsrUaR3oGCc=;
        b=A/sY87vJxtLNW3pnMxjNevbIQvdRjQ4qjdxdDwQOBUUB4T7cEX9oxWyKrlDGKyfKRN
         Rk3LMSBF4ln1WUQLoY8ED0ux27iR8uspjKKZfg+K2LL14MmUks9R61PUn16FBb5ryQZF
         GWDPKk2ShrGJjhKngu+NSbYVjROvh+Mpyz9cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268906; x=1732873706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrSmAj2jkvytw0rNLCddg1aexjt2xHCHXsrUaR3oGCc=;
        b=AGcBlYhJfmY9Xj9951tT3BPErEYbrbtYH2jvVfr+G5Pz2lihWKQ9mBFpkJsa8c2nR0
         VoNj79Aqjipmwvs31n+z6lPzTG1Rksa3w3cRaOTMQQ2V54h7PDUT+1ycUU7Lm8iqa/+0
         vwAz6st3Y5UilLVdR2piByb42Ydv4WqrHdtn/0rwFTayH1TSlHE0wgbrfS3Y2w3S5HHF
         KIuF0gGbW+k3MDFd0MVZKWEb/nN8OJo5on+44F9atfyzkH0mBPDSGUbnO8Wv/n8/2d1b
         mWVfpBTyAomqftJ8G90Ag7KT2AFp4J9xcpMKAHIG+EFZa9f7smQctmN9xHzxrQWSflQX
         olSA==
X-Forwarded-Encrypted: i=1; AJvYcCWDrphV9YKZh/cu7QqkubQe5uX8bmSYVGyVzEA+naGbzcaRTM4mXuHO/V4eGpi0jSDhwVsv37I1pdXLug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfXyw9X5/uL+gNaROZ34usuC3SHadwWw0uVjuGV4RKnC9gNW+L
	xwzY1eIlX6Ej31VcTKrPec+oa+m/NYhPLO9qntBW3MBm+9yrsCPv/fKjLqtrew==
X-Gm-Gg: ASbGncvjJpNuS9IugXol3afMScY3rIutIMcZHzXinhYt8pKZozhGBewvMhRs4UZGa8W
	8ZfpM1iRtxlP74A83OLUWG5O7ODkZMx4egeEvzfFDYR9HBDc4YNIF2J6voFAJOlpdqhz8q5r95R
	f62ukiDIlH1zAK6nLxbDuoEUkJZGBT7W8cptXAgGJPsn6NiYbwZNOj5tv+3R1KTbi+9I2/tyi4m
	Wx63/KdYmWNJr2L/w43EOXKX0z5PMweXQLJwL7boBjOPRME2zrcZBPX1pzktlGCdAxgfYEYmWHs
	F0O4vOCWjoJuQPQr/TSAKQrf
X-Google-Smtp-Source: AGHT+IFru2WAUE4DOiSVjGZ5la48og7nHQB/1X/SGFbEnNNed0D8aT6/FZPgrfye+Wt1XXhUhzTTyw==
X-Received: by 2002:a05:622a:2d2:b0:45d:9357:1cca with SMTP id d75a77b69052e-4653d57be12mr23934371cf.14.1732268906271;
        Fri, 22 Nov 2024 01:48:26 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c47f124sm9282731cf.62.2024.11.22.01.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:48:25 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 09:48:02 +0000
Subject: [PATCH v2 5/7] ACPI: bus: implement for_each_acpi_consumer_dev
 when !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-fix-ipu-v2-5-bba65856e9ff@chromium.org>
References: <20241122-fix-ipu-v2-0-bba65856e9ff@chromium.org>
In-Reply-To: <20241122-fix-ipu-v2-0-bba65856e9ff@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Provide an implementation of for_each_acpi_consumer_dev that can be use
used when CONFIG_ACPI is not set.

The expression `false && supplier` is used to avoid "variable not used"
warnings.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/acpi/acpi_bus.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 4888231422ea..57298c7cfb5d 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -1005,6 +1005,9 @@ static inline int acpi_wait_for_acpi_ipmi(void) { return 0; }
 
 #define acpi_get_physical_device_location(handle, pld) (AE_ERROR)
 
+#define for_each_acpi_consumer_dev(supplier, consumer)			\
+	for (consumer = NULL; false && (supplier);)
+
 #define for_each_acpi_dev_match(adev, hid, uid, hrv)			\
 	for (adev = NULL; false && (hid) && (uid) && (hrv);)
 

-- 
2.47.0.371.ga323438b13-goog


