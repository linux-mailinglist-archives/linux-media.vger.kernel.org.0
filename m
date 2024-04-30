Return-Path: <linux-media+bounces-10450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 557548B7664
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 14:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C58EB230DC
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DC3172BA4;
	Tue, 30 Apr 2024 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KdBCq68q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63930171E68
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714481751; cv=none; b=UlA/lNRdohkZJb9+awn5LNSnG6OjapQ+H97Z04BZjFrMTXZNdafxg0pAW8d/VVe2uox9TYBeazLIB0VvMZwhpBKGTl7Q6xPHrgsK+Xt9K19I6lBkQ9KBOVVUde9u2vhE3Y1MlB1r6dsjUNYH3l/LYecgadUuu35E1tqN/OAUVC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714481751; c=relaxed/simple;
	bh=xV1K4KLPnklnDF7lOie2R6AQ5cvRhbfpv/8EnvxSB74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAwIwU1sECQOus9XybXOofewFAx6aLdA9DnHpz5CR8fGahZTY4B+Z7jmShqkABcNwZBFOH8GjP8ZHGU7c3YzafqiXutA2/eQ8qMlJEMLCQPEctq9YjrxF0di4UPQRAsNTaNkNUyxE4tnNJxQ8HTi3GuhY+2SngCqwxGkLTIzEv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KdBCq68q; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78f02298dc6so477635285a.1
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 05:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714481749; x=1715086549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GcAbiNwsFkaasnu7HjDiQ9YZzAJwofieKdp6b+SC5I=;
        b=KdBCq68qghDeddcHy9merFA2tKDmVR5kcetHWX+YIP9xGutiSSmBcEsFwdD+SLZyTe
         nz5NYdloKrNOwHaP3uJVAr72LY5nhi50lrCBm7EgJRWvev7sJXBxvInIUW9GLi0AO7Mp
         4dFMJ8oqmmxNWCG6ZZBd5hmcMn+JPjkyG1VA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481749; x=1715086549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GcAbiNwsFkaasnu7HjDiQ9YZzAJwofieKdp6b+SC5I=;
        b=b0ujowMszN1CmQ8vyRxbKci9F0pyovpY47mR6Gk/pGWKASo5QTKcbxN/jgDYuIQBTV
         xiuqdcjN8QukTUiz/mnwfXAd5Q6oibC/SW6ANmY7GLVfekBSOPw0uY1yoblBzzNMft+9
         E+FQMTpXQXigU4j+GyvBtUdK+2PYcq+4oBVGBPiFDrC1IQ43jtd+KPLxlOCDkSFEM7Pm
         QauLb7YOq+SmXHh8FHle1IrmH1fWSePAKC1bJa2weanMmxEqgI8BLRbq3r/1kUEvW4zV
         ZttIfRf/CEdEgdlMwTZg/mXfkNNXzbYgrMCaYLOBYiocfD9R8ZmraXOyGd05nhBKA7P6
         lNJA==
X-Gm-Message-State: AOJu0Ywd8IJnYkKkuEcRWNsQFL8x3towBINJuyoh4CVGCuxMfWLrzjdZ
	GhISfe2xGAlngIFLd6n8WDAalk/ZZSX3g7iYM+KBZ70mxeSTGjVwsOWco7Aglw==
X-Google-Smtp-Source: AGHT+IHNUD/YiHktyxC/S/O2UQl0N67mb9RwGDBuz8dW13b6LjI/xcWOtt6224r6GWtpcizS5VcWeQ==
X-Received: by 2002:a05:620a:40c1:b0:790:77d4:5e7a with SMTP id g1-20020a05620a40c100b0079077d45e7amr4364674qko.20.1714481749374;
        Tue, 30 Apr 2024 05:55:49 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id o16-20020a05620a111000b00790f90ffc32sm1553667qkk.22.2024.04.30.05.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:55:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 30 Apr 2024 12:55:35 +0000
Subject: [PATCH 3/4] media: intel/ipu6: Fix direct dependency Kconfig error
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-fix-ipu6-v1-3-9b31fbbce6e4@chromium.org>
References: <20240430-fix-ipu6-v1-0-9b31fbbce6e4@chromium.org>
In-Reply-To: <20240430-fix-ipu6-v1-0-9b31fbbce6e4@chromium.org>
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
2.44.0.769.g3c40516874-goog


