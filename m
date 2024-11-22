Return-Path: <linux-media+bounces-21804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8127E9D5C56
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11D541F228BF
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DA11DED5F;
	Fri, 22 Nov 2024 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SHtnu3GG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EAF1DE4D4
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 09:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732268907; cv=none; b=ba2cva/Guw3fmPSBbL57mdGXYG9X9Fg1i775KGH9RS8s13L+WmPTIdoV8nsqKzARmrTgd+UTw6dp/rzMJWdsAcKh47XKOM11fEyt8xos/Dpmcdo9jzHW0Iv4AYogs6UkzD3dmZnCCSMGg0pMTclOOUR3+9uGALIDA3LjEHKIMIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732268907; c=relaxed/simple;
	bh=s/RFQ8hC9e/8cn1SLTw55cw7d/tVQKC4RIk8exh03Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6z3LyH2/qZdKxwUulPWxikrAgWbz0dgI7lE4z61rtOppjJWaqyk6l9gqqxNY5n3NJjyqvzEpvk5cb8e1a3/8DRJrUFlpjLZlIIPbHyFjJSwfCWrERN7HzoGxjzZ1TCsi+uIa09ic0UKR5Smrex1mw3yno5Kb8sbJe5beMUvVxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SHtnu3GG; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-460af1a1154so11558601cf.0
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 01:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732268903; x=1732873703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zG7I43DMEh4GfUqzQUdimZGvwsrcdmhPZLNEbgcg8ic=;
        b=SHtnu3GGz5BW3ctFws7PPU9Y6sM2ikaYQwI90aL4/KAKHuMxMisBrBzHwgN41RkxO/
         ID+aTiMzKpRKVkjwWxFjnDP4NSzWp87Z45FqEhRp8vGcOAMOlaw/vy+cEh3y8LzXKjE5
         t/AmNzdpP99aY9TjJtU7KUHlhbvU8vtItYTSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268903; x=1732873703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zG7I43DMEh4GfUqzQUdimZGvwsrcdmhPZLNEbgcg8ic=;
        b=N/25ETMtv16mgBnxagqFtitM6RjgurovQcEZbOqws3wOwyudec3AqJHQ03sPSClpSK
         u+qukg6N/ZBrT2QSUwTd00G/KmatLqciSVPUXrhy21Ekutm+kehH7i3wQ2B6cl94EIrV
         USKoRaidn2tHmaLA+b40/GZFvGJgAcMVBTGAuI6gROiNI7vcyXUKLD1L+UTc127+JNtc
         KSHSxSG+oefcVhnpGIJACx4cNRbYmyLLaPVDp0CoR/4XKuH04QROjAWtOaB3Du/PmSps
         iFXfHMjvH8GGSRs4LIfnM3yS+LPyxWWgIMtl6Q3IMPucCjja35+G1ECvg8RSiu2Iy/KC
         VxXg==
X-Forwarded-Encrypted: i=1; AJvYcCVwftqoF5AUDyYnQMuJo3/s8U06FhwueYJtJKqDtK5H9LWwg3H5wIYUg024Tc3CTRAap1pFxoOFK70C+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIz+MAuWV+W2PJYxA/AJcZu6dqplpEwSAmc3663I+4n/0JHF1O
	Sm+z+ZgVm99cEoi6i4zjE9ScEg4v9nAJBe8TDvZfEg2AzyHYSK3+/CXmoz44hg==
X-Gm-Gg: ASbGnctvzmzhcPYsfhaYi9pKiltBT3njdEB+tLXzJcXsxHjgjV5vuNzTFs0LVwt8rnQ
	mRC/LN8QXYdmGLw7qX2ov5RZEykRtXNADVm0v1bNKtZOTnx161txX0f2esw52xALoGcaQkxCL/d
	awHxPB4Y2WVRjS/ZuoS65321FId4jUcsL4JnlmFTR7gn0df2D7hvo6jOxXb2+q9//zarcbma0sH
	/jyKpz0WZhpfNssiPmg4lWlcNCvaDpiOf45q2wXsQa+90eb5/JhPdKfz0jpN7UeXQdjaUkTRqU1
	RKbZG1mwolWGmt/d0pD8JfL+
X-Google-Smtp-Source: AGHT+IGMlQYEruhIl1CbTQvmldwCNjhRHjn9f7tEPvnZRJBnvQVCS4h0diiDqwqoJ+Hs/FtxPNpzMg==
X-Received: by 2002:a05:622a:5919:b0:460:c2f3:7343 with SMTP id d75a77b69052e-4653d5af2dcmr28382081cf.28.1732268903212;
        Fri, 22 Nov 2024 01:48:23 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c47f124sm9282731cf.62.2024.11.22.01.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:48:22 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 09:48:00 +0000
Subject: [PATCH v2 3/7] ACPI: bus: implement
 acpi_get_physical_device_location when !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-fix-ipu-v2-3-bba65856e9ff@chromium.org>
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

Provide an implementation of acpi_get_physical_device_location that can
be used when CONFIG_ACPI is not set.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/acpi/acpi_bus.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index eaafca41cf02..4888231422ea 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -43,9 +43,6 @@ acpi_status
 acpi_evaluate_ost(acpi_handle handle, u32 source_event, u32 status_code,
 		  struct acpi_buffer *status_buf);
 
-acpi_status
-acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld);
-
 bool acpi_has_method(acpi_handle handle, char *name);
 acpi_status acpi_execute_simple_method(acpi_handle handle, char *method,
 				       u64 arg);
@@ -60,6 +57,9 @@ bool acpi_check_dsm(acpi_handle handle, const guid_t *guid, u64 rev, u64 funcs);
 union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,
 			u64 rev, u64 func, union acpi_object *argv4);
 #ifdef CONFIG_ACPI
+acpi_status
+acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld);
+
 static inline union acpi_object *
 acpi_evaluate_dsm_typed(acpi_handle handle, const guid_t *guid, u64 rev,
 			u64 func, union acpi_object *argv4,
@@ -1003,6 +1003,8 @@ static inline int unregister_acpi_bus_type(void *bus) { return 0; }
 
 static inline int acpi_wait_for_acpi_ipmi(void) { return 0; }
 
+#define acpi_get_physical_device_location(handle, pld) (AE_ERROR)
+
 #define for_each_acpi_dev_match(adev, hid, uid, hrv)			\
 	for (adev = NULL; false && (hid) && (uid) && (hrv);)
 

-- 
2.47.0.371.ga323438b13-goog


