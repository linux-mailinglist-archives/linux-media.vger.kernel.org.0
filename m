Return-Path: <linux-media+bounces-34151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CDFACF5CF
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 19:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D526C176332
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 17:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80671DFF8;
	Thu,  5 Jun 2025 17:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ETjM1jqi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6592798FE
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 17:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145989; cv=none; b=t6c1HvUwNPnAPw546QPB9fkhQbAyAVMQTIDNsCaI7nGd+JMlW9NCJsfI98aIVby2lByQCuziHCqC8eqMG7Bs56VByADaFXgCrIBa6kB0Texf0ypd6QpY04UiF8pkyYZNIwNfxXbFtEobuJlZV6xLbmzrneMF/Eo08rUshcfQ5AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145989; c=relaxed/simple;
	bh=V3mF7pLDoaruyqIzAwwMyJdM0YQYzWL05/erg95lnDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=anW6CH3UAA0hemT+6qLptp2Cid/KMAFCUgh3VDqIBxJ+PITD3KZEYSZ5gfmMODZ1Wc1u9GO1ESdiNvHkoTwqhfAH2evTheUYkfryk4QLZQ/fknKxxCmhxRcvvWdvIuMs0nCJGHZxrVDyaifhdkd3J6H9W+qRKlYIvP2EW22aRUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ETjM1jqi; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55365c63fa5so257669e87.1
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 10:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145984; x=1749750784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8OIPxZw+kNtaX9XsRliFjEOnUVpjIedNlprBesFBFM=;
        b=ETjM1jqiveXzdwPDQFMdlninWX7WCzWyBBTNVcW8rRYgpQ9RBIljJU1/Z4o4pYaX/E
         ho9z0jjgKf6qSxZ5fghWCD/nUGaOdMY0r3O5cfwPsx6FHPvxDVWfvcfWQgD956eFgjyj
         gwNfHRFdK2iaQ2xUr6iRIhtPpoIHBQRoN6HSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145984; x=1749750784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8OIPxZw+kNtaX9XsRliFjEOnUVpjIedNlprBesFBFM=;
        b=t4Q8ohndFXtjNZ8p5T9QiNSExjzvkte2YDJ+/StJ5eLXpIvoiaVKZrjQ+ZQmvq3uHF
         IuiWwYPqh+tpDE+RhwgR/2ReQaOneWFvqSBJNQELyj/5QLoIm+MUEMpoMiXOi6i6nkDL
         rlml9wf8ZGQlU4kA7fdluDGbYGQ7KCURqxwlOaRPzh0bhMvYj8kakj5Nb+GzFBNmscQA
         L2wkljmE/6VsK8jL3ANSaMOBYoZFklgR8h9zT80uPl7k4EhybhjN0C1McKalb/wJb65V
         zI+0mVgnPkcN2ZsKOabfeUr8CzvWyVZRjmwmIpA0ZpWMad3YX79sz9Ik9c4Z+XZM2Feq
         643A==
X-Gm-Message-State: AOJu0YwIWebfdCfrTV/lNNsy0nQe2HxxHgi34KIqb+oyO87XbcJhln8c
	b9KW0nNQmLSs9y1YWsuXyCdNG9/3tV/iYkG1XZ5+U4gpCrneFmdzkVhUog7UIvUDNQ==
X-Gm-Gg: ASbGncsYDrs1bhEt8pw7jSKRUXP6kkuOTQjII3t51nrP1twftP6ckVdupPnNqQv93EI
	EvBxcZZGbsT8Us0nCBmNuztbFc4FmA3+pcib/Nog9PB40qMPEF+U4hkCT74WfLpBsDS9wLU+f9u
	Et6VlwHXv8ZrKfLmgvgXAwtFv74UOxEkxP3OpBOpMHwn5PwtxrHhPMEOg69ui9eCtcZDFsJHk55
	S76jF/bXDAE8c5mUQ3Dt/FDH0rkyL4BUrsc54/LQ/LhfmdJn+bNLYtRSop64I8DU5rVqCHB+knJ
	gl0ZZxbfnsqIzb5WZQeYS2iFVCmqqKfUlEzGwWbhFyctEVlPixVVIDLW8tG8xmaVIVMBqW+EXoK
	lv+m9a1+WvI4L5bhz0Rxu0xO3HB+uuiZ94HSkQaH7TVSCE5I=
X-Google-Smtp-Source: AGHT+IGs54mK0grF5GpYvNrIRBVyl5RIQTl5wT33xEXZ6lSNp2Qm87PtJXgiSarLAOoqtbFmQtgqJA==
X-Received: by 2002:a05:6512:224b:b0:553:2bf2:e303 with SMTP id 2adb3069b0e04-55366bf9034mr20502e87.30.1749145984304;
        Thu, 05 Jun 2025 10:53:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:52:56 +0000
Subject: [PATCH v2 03/12] ACPI: mipi-disco-img: Do not duplicate rotation
 info into swnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-3-5710f9d030aa@chromium.org>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
In-Reply-To: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The function v4l2_fwnode_device_parse() is not capable of parsint the
_PLD method, there is no need to duplicate the rotation information in a
swnode.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/acpi/mipi-disco-img.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/acpi/mipi-disco-img.c b/drivers/acpi/mipi-disco-img.c
index 5b85989f96beeb726f59ac9e12e965a215fb38f6..b58b5ba22a47a4afc5212998074d322f0b7586dc 100644
--- a/drivers/acpi/mipi-disco-img.c
+++ b/drivers/acpi/mipi-disco-img.c
@@ -617,21 +617,6 @@ static void init_crs_csi2_swnodes(struct crs_csi2 *csi2)
 
 	adev_fwnode = acpi_fwnode_handle(adev);
 
-	/*
-	 * If the "rotation" property is not present, but _PLD is there,
-	 * evaluate it to get the "rotation" value.
-	 */
-	if (!fwnode_property_present(adev_fwnode, "rotation")) {
-		struct acpi_pld_info *pld;
-
-		if (acpi_get_physical_device_location(handle, &pld)) {
-			swnodes->dev_props[NEXT_PROPERTY(prop_index, DEV_ROTATION)] =
-					PROPERTY_ENTRY_U32("rotation",
-							   pld->rotation * 45U);
-			kfree(pld);
-		}
-	}
-
 	if (!fwnode_property_read_u32(adev_fwnode, "mipi-img-clock-frequency", &val))
 		swnodes->dev_props[NEXT_PROPERTY(prop_index, DEV_CLOCK_FREQUENCY)] =
 			PROPERTY_ENTRY_U32("clock-frequency", val);

-- 
2.50.0.rc0.642.g800a2b2222-goog


