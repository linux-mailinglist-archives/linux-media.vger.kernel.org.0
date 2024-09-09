Return-Path: <linux-media+bounces-17985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 562509715DA
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 12:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C29E1F2401D
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 10:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA061B4C51;
	Mon,  9 Sep 2024 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVHjulL7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12CB1B5309;
	Mon,  9 Sep 2024 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879517; cv=none; b=tZJyT2FNYxFceQ6w3dxfnb/O7tgRLsZV8YDpcahRn1aTHPeAIT5oHdADcf6KQvL+bAlkWIO8uOtIm2pF9ePnv7RwoKwc80rwwAMLZumRhItepg58yAb1YuX76tgUUVjJQPOayKPa91doPOeca98JE5WFBqijqkm9QuHxll/RAdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879517; c=relaxed/simple;
	bh=sw3VHlMQq/cC9AvQC1DvEOM0QpRdIHMXSXQTnNz6RE8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jxEk2VKuoximMy8l3x4qMdbmPde3RX8kW2km7vnx0lg2DCmj0FatB8FvNyJCs84c9vGMVIA8ET+Un8F0oVosfyYKUyHeILGsILSEwMbABYEnpCuQmxOi7+c8Zx95JP86JxbUT6WNKCkLfj067mo/dlFN6blxJ4FmXqsLQp0bjnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVHjulL7; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8a7929fd64so506286266b.0;
        Mon, 09 Sep 2024 03:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725879514; x=1726484314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4+VabnlfFbekRCvdKNnxfFp0FWhubNQMhQcPys4Q4q0=;
        b=LVHjulL7LB+oTNGVN9LNpQBr9neVtHnw35JPNu8EpN+t/cak5ze/goErDxAqYLL1+k
         P95w9CR8vlx1VS9bjwHiKV2rFVZL4Ej/U10z7D2RXIacRY0vBPDCfH80DOaSAc4XeLHb
         NBbMunWDhYfASg7CBWZ5lK7mL+ENeSwM7yLuEgMoQaOBqm06ZiNz5plFw4oYqmYCWCYH
         xjLh0H9HfFDd58YCjWVLqhYNxlnuu1AsZlWmcX0ie85M/oQiH3qmTvknEQqxRwfVV6o4
         ahCSAMME/RRp095WJ+dijCPgXMRsVn6xulHUoOvJnZgvId0yVJo/MVnlU/DvSYY8X7+I
         Ec0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879514; x=1726484314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+VabnlfFbekRCvdKNnxfFp0FWhubNQMhQcPys4Q4q0=;
        b=tjUkcL2ntN+el22mksi0o1OMAYxwEHMEH63G9jE8gqb5g1YclcfurEfPZ7JWctdroz
         sott2k2BI3FCe4yLkuRGVD/IIUEooey0XkNzEqHeJyuJYahp289Aj2IKMjf+z7pLnjk1
         gBZzLLdRem78zl4bhAFoQ81pIMArLU8z1v0B3ABCN1SFbxL6kL+HazH8lRWlm7na+8op
         2pVjKuCX63Tnf/qq3ngH2VoD80ufD35s8CwMPBnw9NOYgaQItcBgirJkrtJscCTW9yco
         aOzcYrSz9vpcPmXA/+FZHCUFAA/pgAST3GhLIeHFL1R2IMa0IB+1IoQw3iubJTLap1KI
         ILxA==
X-Forwarded-Encrypted: i=1; AJvYcCU3z09qRf5LlsJpqiqr3w8CYEuLkxiIOSb/hNDQmUvN1bFgOllfADCJXK/6rV+rBrLhVCoPphc30AXisTM=@vger.kernel.org, AJvYcCVx62IjlLcghBgjSPZcAY8p0KKJpzL3SxPgGVJgEPHTQpMQqUiAfGYjUee0Opm8foobMGRKa8llYk9sPxw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr8X/at1NIfy3kemfkQvJ6AZhPnInxA4PLV/X6blpTdJBRDYin
	kVNzeZjSv5a2WnYH0Cb9jHzrTThzQmug+fd85Mk28xdSDM+QjD3n
X-Google-Smtp-Source: AGHT+IFNxUJYpEsCJCXM7xpjgJSvO4TVSto/4vsBImL63N5dDFBUG7uokxcYSfDuiGmAA9oqRgRm3A==
X-Received: by 2002:a17:907:9487:b0:a8d:67d5:5e16 with SMTP id a640c23a62f3a-a8d67d56038mr69208966b.57.1725879513327;
        Mon, 09 Sep 2024 03:58:33 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-48-58.cust.vodafonedsl.it. [188.217.48.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25a2b281sm328281366b.92.2024.09.09.03.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 03:58:32 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	tomm.merciai@gmail.com,
	mhecht73@gmail.com,
	michael.roeder@avnet.eu,
	hverkuil@xs4all.nl,
	Martin Hecht <martin.hecht@avnet.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] media: i2c: alvium: add camera sysfs attributes
Date: Mon,  9 Sep 2024 12:58:29 +0200
Message-Id: <20240909105831.684371-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,
With this patch I'm going to add some sysfs attributes to the alvium-csi2 driver.
This patch adds the following sysfs attributes:

 - cci_register_layout_version:
   Shows current cci regs layout version of the camera.

 - csi_clock_mhz:
   Shows current alvium camera csi2 freq.

 - device_capabilities:
   Show the capabilities of the current camera.

 - device_guid:
   Shows the current device guid as programmed by the vendor during production.

 - device_version:
   Shows the version of the alvium hardware.

 - family_name:
   Shows the Alvium family name, like Alvium CSI-2, GM2, FP3, ...

 - genio:
   Generic camera input/output xfer for using user programmable part of the flash.
   Reading and writing camera's user programmable flash memory.

 - lane_count:
   Shows device current CSI2 camera's lanes number.

 - manufacturer_info:
   Shows manufacturer info as programmed by the vendor during production.

 - manufacturer_name:
   Shows manufacturer name as programmed by the vendor during production.

 - mode:
   As stated by the BCRM Ref Manual camera can work in 2 modes BCM/GENCP.
   This attribute is responsible for switching the camera mode and check the current mode.

 - model_name:
   Shows model name as programmed by the vendor during production.

 - serial_number:
   Shows camera serial number as programmed by the vendor during production.

 - user_defined_name:
   Shows camera user defined name as programmed by the vendor during production.

Thanks & Regards,
Tommaso

Tommaso Merciai (1):
  media: i2c: alvium: add camera sysfs attributes

 drivers/media/i2c/alvium-csi2.c | 484 ++++++++++++++++++++++++++++++++
 drivers/media/i2c/alvium-csi2.h |  25 ++
 2 files changed, 509 insertions(+)

-- 
2.34.1


