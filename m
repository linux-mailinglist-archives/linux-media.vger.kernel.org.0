Return-Path: <linux-media+bounces-23504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABD99F3CA3
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D0E5188425A
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 21:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938EA1D63E0;
	Mon, 16 Dec 2024 21:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i+n7Bm4s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321D81D5166
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 21:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734383848; cv=none; b=QH5PxmaykUwIYyCBxYzMTdRuWBVyEYZQUso/roocnxhUn2XcMB288jLmk53H2t1EL4QehcxNhOXkXvPRZBKsYWw4X89pTUYeVIb39WssLjiR9OcsDxTURUPKzHeLfhpuFJgx2UfbQTsVJ05/4gScDHxvxeuq9DGt8IGiOSBMi20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734383848; c=relaxed/simple;
	bh=e7SFMwzDWsXgzO/ZNzsWTCVExP8H4avRE4Psyn2EYBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lbZlqkvhlP0ETCopVsUqQw9UsJ81lK/o2eENSicJvB8L0/2U8RLYuejPkAONBnJVEOF322j4yX24eHNPxTUXm2d2LQkZohgccXkiZrS8COA560V0MItpXRLGvsh5+yMH/va94j45jkPJUMpQszdcQKuNBdqEWAaLqqW9bWXd3oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i+n7Bm4s; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4678664e22fso43342091cf.2
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 13:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734383846; x=1734988646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wrx/XZpVy8CcSfrt0QCmmOTT7oU2GR+FF7o9rBsUVb8=;
        b=i+n7Bm4sReOYy2is0Ik2ld+rfDnMgcXNbiTuFJ1dnSXDVn3+nUqdzXnM4x2DVcAuj9
         6QmUyC5Ak9ZyJ60EkyD7e1aDHLcbwFvuVbSDl9sfmnEpeDRHc0MTSMemosc9KEATuTj0
         1k1dFsHB4MThXVJpPJt6OAQrErapz1VA+sCFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734383846; x=1734988646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wrx/XZpVy8CcSfrt0QCmmOTT7oU2GR+FF7o9rBsUVb8=;
        b=IS1Scc93dywfrML0hvSK6Yq3sKC588QhcWrJd1XRrTXhLv5CRq5uEdhA+wgxEkE1J+
         kVgO2QhVs9SRe6rR8OYhAPaaiwJKpdNlNJHXdOIGqW9uywyOAunm/vDE730aa3rXx0vW
         HxxNOWp41vmsoQSNHVZcLwPUsnUCfCk3FGjoEAWndKkMNQQRaPoxp1NOsuYM8kNdIvgl
         mISjlr+CVEVen4IDw36futYaSCCgPWiPWO7Q3hC7GAxQK8qXgsFBYnWPZowVQgnFiIU8
         KmOOjfQBgpRI2zmAhQcwrlfNYV6H5SHZkTG4YQXkZU8Swv0wgANTCqMQbICviCmayYGV
         d2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVlrQbD4Kc51pspnobA2fdvcwNZtGm3c8GZyfgFTe5pf0jRLfkGJKs/l6KcZhLIywBkhtASErKskVaNlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQSViI8jiVwmBOUy24hUg4BDFvZ7nNJIjkmff8GiWkS7a/BdRr
	uTVWhKtOPoCt520zfXfiIDHWLsUOqjo3ZMdgruCw09+UrdEIai7L7RaNIA7TEw==
X-Gm-Gg: ASbGncuMqyE0+93vX/MUGGciiQOah3KRDmZ1AdI9NNyqQc3IMvud2Fsa0tne/c+IMun
	vGuh+27ZlJBRZrtCEX4zAHsrr2CdP0OyDqW2JdTfbTER21o8RO2YMGrQySjv3EKxcOu/k6Pmtpa
	q0jnNwCzwT049Bd6WcRU0ju5cXbX+gPVVhEBI3DTk0s5hUGcbmdDUZER6OybUGX0A2fAbQ95Th9
	+lHz7/afXxyvxdSIxlCm/161OZt5eE4/45vSzFHCJ5EZ+AbAu/gA2pneE0f5zXiOyQBf+RXnzlQ
	6eB4vMJeqsFsDeUaYQLW/kK11U2U5FE=
X-Google-Smtp-Source: AGHT+IFe0W9f2W39cOFyxGiYpi+wHrRevZyo7XAuH0Mr2XhLF/7Z6NTzZgUOvov+yVRzbUrbAYKkSw==
X-Received: by 2002:a05:622a:115:b0:466:9a61:273a with SMTP id d75a77b69052e-468f8b66f1emr17164551cf.52.1734383846255;
        Mon, 16 Dec 2024 13:17:26 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e85c03sm31927501cf.69.2024.12.16.13.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 13:17:25 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 21:17:16 +0000
Subject: [PATCH v5 2/7] ACPI: bus: implement for_each_acpi_dev_match when
 !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fix-ipu-v5-2-3d6b35ddce7b@chromium.org>
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

Provide an implementation of for_each_acpi_dev_match that can be used
when CONFIG_ACPI is not set.

The condition `false && hid && uid && hrv` is used to avoid "variable
not used" warnings.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/acpi/acpi_bus.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 19f92852e127..a9b5a5204781 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -1003,6 +1003,9 @@ static inline int unregister_acpi_bus_type(void *bus) { return 0; }
 
 static inline int acpi_wait_for_acpi_ipmi(void) { return 0; }
 
+#define for_each_acpi_dev_match(adev, hid, uid, hrv)			\
+	for (adev = NULL; false && (hid) && (uid) && (hrv); )
+
 #endif				/* CONFIG_ACPI */
 
 #endif /*__ACPI_BUS_H__*/

-- 
2.47.1.613.gc27f4b7a9f-goog


