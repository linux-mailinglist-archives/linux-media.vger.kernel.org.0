Return-Path: <linux-media+bounces-10535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2256A8B8AF0
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 15:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D74DB1F22F12
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 13:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629CF12F589;
	Wed,  1 May 2024 13:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jtBk73Ws"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706B712EBF5
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714568900; cv=none; b=kE3d0pmgQtKFGcxt6meAlLuwzxYXVkOJtCA+alMir1ExSnqY4GBa6J3lDSSJLw8q34TXN6+2hfWWdyDEoPw4OfJEx2WKCcRn3unfetMXO3AYR0ScOq5LpK2Wj+TgBvLX/2RJtRvsE273JN8138G/A4f2ilHGMfB+rgWoyVVl1ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714568900; c=relaxed/simple;
	bh=3qd79c0fqWNL/kV7Ki9qUJH7w3sWSFSFrsByKnimP58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i2c5Bubxkb/Y5NDcegTJvpEROMTtlEwHYyUSL8D8w3K71WICH8AaijLSKBNbRaoVhpQHeeoZJCZXyn3W0HQeFZ/J+ynvx6YvyfJGntRclPbHxzIiL7qCfjYhAPsHDOSSh0PZi8UzkVxFVeDXzowdciRC+tM58NHq21C/PQrtR5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jtBk73Ws; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6a0b4622ea0so22235216d6.2
        for <linux-media@vger.kernel.org>; Wed, 01 May 2024 06:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714568898; x=1715173698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJYWApOjcQI3DrHx79IErrCVRj1fLUdwiqYEPr5bQYw=;
        b=jtBk73WsghL8bZUaxeVw5X3mG1DUh5NsT6qqKA65W/pe0x9WSpT8C6gTUduWaFFiUq
         j2CsfzwrHKYtHOE6qvc3YLr3gaz3zk3lMVj2nGZlBDecMM36tiG4UoLtjWMUH+gK0/XD
         k036uyi/dkPm5TygolK8HXCUwh+qf92AKWWw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714568898; x=1715173698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJYWApOjcQI3DrHx79IErrCVRj1fLUdwiqYEPr5bQYw=;
        b=nN4Zjrn9DCtDSgB7Bzh2yzAj/mKZOJiFYZruvuc+jBKJ07DxQ+ytIf0tkh+nWlRrVB
         AgArWF8BNYuS/0Ex+zj8hr2iFQb3Utdnabmu54orFCs9TZU5Eems0jB+61L4UyGOgcrC
         71o6FCaRmm1BecmderM/i+w1oBOrgwhKH4bYMOGfIocNdD984SodlUr6x6bNcH7bjIno
         NWKkvpHuGNonHxu/WEDTK/A5PCnJh1xcBcR2gqDEkpAuZffWh76ycuPxGcKezBK8yiNo
         5c20wt99KYK1MBzqlytryaNBCO7+kx5CJbggxv/6sfKGpkZppkDJvd9KY0FPfttJlWTv
         CO4Q==
X-Gm-Message-State: AOJu0YwIyWR5Cwb8/Mb0bG3HeZotVmBgWiCuGFzDVuSXLzNYKgXgBPyc
	wEcifD+7S009P8v9MXWtjSFuhbePRgJNxSK7C4EpF1IZh2TTwYlkrbVeu/VInQ==
X-Google-Smtp-Source: AGHT+IFO+hJ+WIBkK0RGSj2Imq1aY8WSC2eYIFUm01h6JFLPZZsleUnwhnZo+GaOxy6bd3ozLRUOHg==
X-Received: by 2002:a05:6214:21e8:b0:6a0:cd98:5ad2 with SMTP id p8-20020a05621421e800b006a0cd985ad2mr3144776qvj.58.1714568898113;
        Wed, 01 May 2024 06:08:18 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id l26-20020a0c979a000000b0069b10d78445sm12430971qvd.142.2024.05.01.06.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 06:08:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 01 May 2024 13:08:12 +0000
Subject: [PATCH v2 4/5] media: intel/ipu6: Fix direct dependency Kconfig
 error
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240501-fix-ipu6-v2-4-a5629a37a0fb@chromium.org>
References: <20240501-fix-ipu6-v2-0-a5629a37a0fb@chromium.org>
In-Reply-To: <20240501-fix-ipu6-v2-0-a5629a37a0fb@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

VIDEO_INTEL_IPU6 selects IPU6_BRIDGE, but they have different set of
dependencies.

Fixes:
WARNING: unmet direct dependencies detected for IPU_BRIDGE
  Depends on [n]: MEDIA_SUPPORT [=y] && PCI [=y] && MEDIA_PCI_SUPPORT [=y] && I2C [=y] && ACPI [=n]
  Selected by [y]:
  - VIDEO_INTEL_IPU6 [=y] && MEDIA_SUPPORT [=y] && PCI [=y] && MEDIA_PCI_SUPPORT [=y] && (ACPI [=n] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && X86 [=y] && X86_64 [=y] && HAS_DMA [=y]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kconfig
index 04cb3d253486..d9fcddce028b 100644
--- a/drivers/media/pci/intel/Kconfig
+++ b/drivers/media/pci/intel/Kconfig
@@ -6,7 +6,8 @@ source "drivers/media/pci/intel/ivsc/Kconfig"
 
 config IPU_BRIDGE
 	tristate "Intel IPU Bridge"
-	depends on I2C && ACPI
+	depends on ACPI || COMPILE_TEST
+	depends on I2C
 	help
 	  The IPU bridge is a helper library for Intel IPU drivers to
 	  function on systems shipped with Windows.

-- 
2.45.0.rc0.197.gbae5840b3b-goog


