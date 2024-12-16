Return-Path: <linux-media+bounces-23507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D2A9F3C94
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 489BD7A602B
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 21:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8361DD0EC;
	Mon, 16 Dec 2024 21:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OZKlqkrt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86561D9339
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 21:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734383853; cv=none; b=Byc3lMZ3/vuGZAqJ02uoaui3V3L6qvpYRnzG9UmqBpsxSw7mggt2pvZRP7xJsYX6udrVsP9UNlCsko8xwryJ8X2aS8XDxSMPbPIquuNA3HDl/nvR9JJpuXZjGJ7B+6qPtWBOr76NySj3J/xCvtAkY0G7HxSaGjxzeuo+UQzlMfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734383853; c=relaxed/simple;
	bh=95QUI19i+vnnT5+G1KHFOpDSO/pMrFLiSHBGkodQPoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVz4Nw5NH807cIfQRQAbMr85WctH8aQh92gBIph3Q1EI43ByejrGhY0GhJbprOuLo7onAWmK2thQCvUuvf8FSqBa6YhtEeYxov4IOKNNHl2pQtD5EZPMT7vC6KwwrljbOanM21lnSuqHjBa3sc5B5uN8pR0dY3aSkedF2BEWJKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OZKlqkrt; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4678afeb133so49880491cf.0
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 13:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734383850; x=1734988650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9wRik7VAWXozMa2pBEsGGs4ayCPfnrgn33kguAxeWI=;
        b=OZKlqkrt9/2ONupx19ZzXA18kP6cweiU/xz/phCbkZJv0oh8Qajw9vF0Y1tWpO8MBE
         R1kwkFWtqtyfkzDbyWgXHOPB53jkFsqq0SJrkILJ+zKZUmHrjcGbbzW+G50g+LblXBPs
         iCbi9ciTLTmUskmHGwYd1H7CDftzpPmg98WFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734383850; x=1734988650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9wRik7VAWXozMa2pBEsGGs4ayCPfnrgn33kguAxeWI=;
        b=xMXiGdGGwYT4f9meeuGEKfrB5bbkXD0sepApqvvXfUZLYdPxapP8KeKRAhgUM+WtOA
         xrhLt807dsSuNiPRIeU5fTvum3n57stKCwWSsqFJmpsIvj7uhF5gcLe4P7NBAoOttrKR
         myQFQDCqDZWjjQl3BuwLshrIaq1Sy7Vd1sxpt4lCBTMPNQjWEY2laEVYda5Sx7Nqy8Nb
         Fw0n91Zl7qz6vfgPdOTJlVs1099XMdB/SIGhjd9azdlKtIdlwE2cZZzev/zBTbtucH3B
         OGbLdUO91vZb6YIxdoi0thLDdbdCPgIkTA0AcxSl3QbH8Dnixmc3vzTvwTNCTLlXayO2
         aChQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHSAv9GkAqx0uzGtkDEn64pmMCVMJtdxxknxEPssrPKbxlXpBICMZmyjEwnidhfOHzWPozMCy/7CMwJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQntbosudp4Vc7CozHwdauWkXbauocZfnXl1FrTkCbjI6qCDGS
	P0iol8U8zfNOKJmCPr6kbld9JMTEQFLPVs4iAVDCTBUxN7PMhUjhXO485RqYqg==
X-Gm-Gg: ASbGnctFvwHNs3Wedmd9cSApmfqCwJ8sr2icja5HeYHDASBIKzOCl9Cnc50HRNjmAqg
	OIwbzqk37jgNQhgjNjJAEsvdakcBB+J3MW+cOP2UVIsGbu5N0gYl2KXYEhd4oVLRkVRzRDPNxBn
	6KgMzrvNs42bDbIOsGcMdeNwlYfqA8WyG+A6mumgcC6rpK1Cp/T/ojDbV3JTy5YXF0MObb/U6ko
	/9m3pHXP8va8DMMSg1c0RZ1RfeFg0mOfQC+MIVY0ysmIQ+fablSj/75hbbn3y1lcTOlnnrwRSaF
	hmEGACXh0iNgUhG0uXV0iDXto+m9Gbk=
X-Google-Smtp-Source: AGHT+IEWoLxfSlaf8rXHfYGdo/dNrMIk3fj9viLQXfHndjp90WcsgvICJeewTTVu5HvfhfYK4N5nnA==
X-Received: by 2002:ac8:570b:0:b0:465:2fcd:cb0b with SMTP id d75a77b69052e-468f8df3bcemr12486021cf.24.1734383849763;
        Mon, 16 Dec 2024 13:17:29 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e85c03sm31927501cf.69.2024.12.16.13.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 13:17:29 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 21:17:19 +0000
Subject: [PATCH v5 5/7] ACPI: bus: implement for_each_acpi_consumer_dev
 when !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fix-ipu-v5-5-3d6b35ddce7b@chromium.org>
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

Provide an implementation of for_each_acpi_consumer_dev that can be use
used when CONFIG_ACPI is not set.

The expression `false && supplier` is used to avoid "variable not used"
warnings.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/acpi/acpi_bus.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index f38e8b1c8e1f..68c0e2fb029f 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -1009,6 +1009,9 @@ acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld
 	return false;
 }
 
+#define for_each_acpi_consumer_dev(supplier, consumer)			\
+	for (consumer = NULL; false && (supplier);)
+
 #define for_each_acpi_dev_match(adev, hid, uid, hrv)			\
 	for (adev = NULL; false && (hid) && (uid) && (hrv); )
 

-- 
2.47.1.613.gc27f4b7a9f-goog


