Return-Path: <linux-media+bounces-21803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFF69D5C36
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 022E6281CDA
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB6D1DE4FE;
	Fri, 22 Nov 2024 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XKlev80f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5881DDC16
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732268904; cv=none; b=BWSPX0QFKhUv+UDHYcEPXlQZQWTblIliYYLjQHTPaE5sSW9S5v0aFCEAEI7g23BuHwhfZUrd5xfdtWflxuEO69zC96/o4SviTX3I5ZUMuFd1FCEifVpzIsOBp8RHmst08St6m8/hmLfgtdobNCL2eUOdtpzZQ3kJs3f1ByK6A0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732268904; c=relaxed/simple;
	bh=sHpIqPIcR2Hbo49SEnSkc9fxU6SdQ6Gky5F7X03Wuxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I/qKnHA84PbN1JOE3guR93VvvQsrEV/cagqXzrbI/AhwkkOs2UhukxbnV32BAdV5etrBrFbMr/bkZwXTiDE5RQIt8sliy3UGYGn3FqKSeW6N5r+kohFscamYivmrWqxFxpVjruRea+/eWZ1NTbOfzFj05WkegNdEr34oPQjHExQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XKlev80f; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46097806aaeso11988811cf.2
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 01:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732268902; x=1732873702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9GJCP1X0CqpJdW1fWNKDOtb2VgDbT9PrS/YhQ90tFA=;
        b=XKlev80fU0zJRVhQchANLOn003FtfmXIhADc9RkN5HhvL4TZs5vbqbSQTSq5LIZfsI
         jrLrxLYzGBoOBXJ7uNx4hLU2NItVB1JtpZ1tc7zy45EFMLjAQSWKqWLohz9SKSedIekJ
         jF9U3fl2dxHT5ZhqOTnrcvZMKFQAO+Ej1xqAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268902; x=1732873702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9GJCP1X0CqpJdW1fWNKDOtb2VgDbT9PrS/YhQ90tFA=;
        b=A2ATecLa5bptlDLhsPTV4/Ljyku+tfOgRuMh72hYKGNthmFS+vJx4n8dDzMuAiUI/K
         hcr4AijxQljCCzkvzDE9N+6mMZs3Po7zNt9ap6Qtd0ZPaw41XY8A57PZcRpA3dFW570o
         DEkDdVYBulyUxZ0YmikfUUhnX+Rew/xgla8Xc4pkX1GUPeeWwtxsq6w9+Ma0PDLOj9Jc
         CRcnu0CjCoO6VICedkeyHUEGlRaFTlNC6r8kdszY2+b9Y+fdQ2XzZxAUVGYB6eVC1YjQ
         V/+NCn/txA9Vo4sDrjX52RlI7Tuo6NRks3OMP6G255wnxcOHWFtKamZMuZ6AP7lQ7IU/
         m1OA==
X-Forwarded-Encrypted: i=1; AJvYcCXK3YbZbrX4VDDUqpdyNX6sva1vk9m5tLLIYu5enr3TJjL+jBZZ/XfSff2f0jZjLoqzih+ZaC7FDtrTmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYwQ9Rvc4+L3KecYBYv0y1PS0wNdcVE3mGZHmnWqbFDkekWelh
	pt+WFUk1hL6NwtQJWMg9gL7r3cjCnDcqrMedQ8V7su/ipZAXibTVGOUpmngNHg==
X-Gm-Gg: ASbGnctLJe3ieQF4b9oQkM4Esmqj1QzowNKowGvTL6XM8hIWBe6t2L4asDaC3j0axqU
	trpbhM/dE0FgMJPh8FsxgZacV1go33DTb9FhvGWKuZwA0IeAFdDO5Ujpbah4v/E/0jgPKitJEWO
	cCQL+SmIzFq7mcb1P9WvmrDx83XbKfF/Fu59hHE2rg3EE3zRQcQj8P1B5XjKsWuZ/y/KriU5+pL
	kL29yicTcCc7f/BdpfYUcQCzlmOOFdzBwNj1bvh9YF6LLtGcy86B/M5mfbF/K6DDbF1z88mPTry
	agn/n3tbwokn6KCFxxjEso+V
X-Google-Smtp-Source: AGHT+IF2+E7hA5csqndp9Lp4Yhj03h88SxplMlYhJShe/LVL3nGthWIokV9jzsEcGM0TTVk5jNqFjg==
X-Received: by 2002:a05:622a:590f:b0:458:33ce:dcfc with SMTP id d75a77b69052e-4653d62c171mr29716911cf.48.1732268901824;
        Fri, 22 Nov 2024 01:48:21 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c47f124sm9282731cf.62.2024.11.22.01.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:48:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 09:47:59 +0000
Subject: [PATCH v2 2/7] ACPI: bus: implement for_each_acpi_dev_match when
 !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-fix-ipu-v2-2-bba65856e9ff@chromium.org>
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

Provide an implementation of for_each_acpi_dev_match that can be used
when CONFIG_ACPI is not set.

The condition `false && hid && uid && hrv` is used to avoid "variable
not used" warnings.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/acpi/acpi_bus.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index b2e377b7f337..eaafca41cf02 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -1003,6 +1003,9 @@ static inline int unregister_acpi_bus_type(void *bus) { return 0; }
 
 static inline int acpi_wait_for_acpi_ipmi(void) { return 0; }
 
+#define for_each_acpi_dev_match(adev, hid, uid, hrv)			\
+	for (adev = NULL; false && (hid) && (uid) && (hrv);)
+
 #endif				/* CONFIG_ACPI */
 
 #endif /*__ACPI_BUS_H__*/

-- 
2.47.0.371.ga323438b13-goog


