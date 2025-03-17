Return-Path: <linux-media+bounces-28323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17260A638EF
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 01:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18BBA188D679
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 00:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EC81F16B;
	Mon, 17 Mar 2025 00:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WLqJPQIC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D6D8C11
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 00:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742171982; cv=none; b=AvyQ46LVDv9V1VXs5hqbc7B9ep3G8nIdRKriHquhbahS2OaPKInlFdW7eoIPoL1eeEdhDoD85x70kYL38ywP5bYKsSIpDIcC5m+EXPqIPqRb/+E9r86fMe8uHCBqWH6TJ7+X6I2ZXrG/LHdC0Z9HBxsDCixJCDuNt7wvtIobk5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742171982; c=relaxed/simple;
	bh=lq6MWUn4VuqmSWjr9GE8q8zckrTPqcPbaA0nGJRbD5k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HhI5SuzbLZf30W1Q7mbAD0dTr0BluW5v2NQWCgldxOGRAbxvdq85RaaNEItx2R3PpokOZMX/dfaTnhSvcbahOoFKF44J6ziOgVErqIu9SsXN7RxZY7GZuA4tjZ01GHaACEERKUpW+TL7ky0hxElczlx9DpG1YkGjYLEbDTur/do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WLqJPQIC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso6803343a12.2
        for <linux-media@vger.kernel.org>; Sun, 16 Mar 2025 17:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742171978; x=1742776778; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sr8PdaDjjfjQft3wsTqQx0/xPfi1p/LYkmhfONHUXfg=;
        b=WLqJPQICA5g/mPg/84PDphgg7dqKSscXTUT5AyCbJq+rYasqbyRP+sxbGkO1HiQA1h
         Y82t6TMy/qY2VbJyPEzluTB7ftRbwEyeuipdaaYGHoR8cO3mzFmQWXP3GGiokbJis83M
         RX3R3VTvbDUKzpOSaAKhA2J6ov0lydoPoGQawnkc4LqrnUauNvyHcr2Ro1ACWP+9zzYs
         qjuu5m51uk+h43TJAYMQHfgQeFXrpiql4bVDK1mvnUCKfX0ClWmjtgDglRqq+iPd/YaL
         qzs9SitoyeF0kwSzlVxBXFZTcQV0HVuE3bys2Vjkf/IdLmxuooh6eRh0c6XYa6PZuOxf
         FmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742171978; x=1742776778;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sr8PdaDjjfjQft3wsTqQx0/xPfi1p/LYkmhfONHUXfg=;
        b=axjomSwhM9gWHTzGxtn7txuACR2c8/HH4Rp1T+gv7vySxMMSFhs1F6E4vY30yzShAO
         QcckMCSeaWkssOIWs+7WOSuMhrwxzv3AHeXolo0zuDmo7NDvRwOZyffCcGQYB0wJ+m+O
         YFuYzZSqMV8/X+G81CpVIW5rjoc7iOms+aGUyNcf52k6dZbWjYBVxCkCaX8x5GvvhwRS
         8C486fpoChyIUYFnPOlQLlNcCzhM/C3XVTtte47FRG19/E0VfVCz7Ttdex1rikyxVZvk
         K2AjeJQJXddMdqYcUvraIMmVH2c79NGCYCqpZ1hgtPakWMPD4peS6VdoRvjeiLfUskMi
         XI5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFV2hUe3Uu7r2lOg3buZ/PlSIdTIZ88o9+EBcypHtPsZZR7yLJkrjCZfakGfDeG+Reu0ARgXs2qv8NhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyCWV33IHzLTmWWu+Dpn7CK9EGWQotMLcqRdRjb1o/JXJa9dEy
	mLpqldtif8il6ioHEsZ/9pV+ia+TOKOMl3PW0ep20gUzYMYQHoUePdh87rkxAx4=
X-Gm-Gg: ASbGncvs2t0iKcsx3f3wyKzQ19wrzlg3guQ7FUPeNVcQ/ARB+w0hkeT5HrNYqR0JI/W
	t2BgMiIY905KRD/GKLYNk0xZlRwT0eEiW4gWRub338TdjkmFmdXjfqlHlLsLZJr2GBEpoEcfpq9
	eIIFaOn2ALwEMvuOFPRTrD5DNj6huTt9AQ+ZTRyiyRCX814qyC5t5eyJSmTjtl+/sFAcbJk0xBG
	9GSrTnKrixKWc+cBnudspOe42wRhazQHweK+jV0kjR+49grwNoSgeNinyrI8o67mnte8aRqNNYK
	t05FV0twRlJ9XbJJmwtKmORWxBvm7RMzHDj7oksNUjItJhwq2VMIB1G9wQ5lHdTNSSw2p1wD65I
	o0vTeh8+eYBkWWsiSOKG+w4M6Us6oiXJKHas83HFjfUjIULLo98+jjIN7UpsSJcukRGRW
X-Google-Smtp-Source: AGHT+IF8PTYK3xfW7mS1hzsEYB9LJ60TiMPESDLbQMD4vX6LqxDvnHTh1NPkPw61QckYHPhmtX3kAw==
X-Received: by 2002:a17:907:60d5:b0:ac1:df33:25b9 with SMTP id a640c23a62f3a-ac3303ab8f3mr1259274766b.40.1742171977970;
        Sun, 16 Mar 2025 17:39:37 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aefadsm562407166b.8.2025.03.16.17.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 17:39:36 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/8] RFT/RFC: Import IPU6 ov02e10 sensor driver and enable
 OF usage of it
Date: Mon, 17 Mar 2025 00:39:32 +0000
Message-Id: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERv12cC/x3NwQ6CMAyA4VchPduka5mgr2I8IKvaA5vZFkJCe
 HcXjt/l/3comk0L3Lsdsq5WLMUGd+lg/k7xo2ihGZjYk7gBXz0uGmzCOS1Wq+aCUbeK7JEEnWB
 aidURsuh1FBqCH2/Qcr+sb9vO1eN5HH9i7bWyegAAAA==
X-Change-ID: 20250317-b4-media-comitters-next-25-03-13-ov02e10-23e68307d589
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>, 
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>, 
 Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

Similar to Hans' progressive series on ov02c10 I've picked up via Hans the
IPU6 driver with some additional fixes from Alan Stern.

https://lore.kernel.org/linux-media/20250313184314.91410-1-hdegoede@redhat.com

I've made a number of initial changes to this driver sufficient to get it
working on the Dell Inspiron 14 Plus 7441 with the Qualcomm X Elite
x1e80100 SoC and its CAMSS stack.

link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.14-rc6-inspirion14-slim7x-camss?ref_type=heads

This is a first pass which adds in the minimum to get the sensor going on
the Qualcomm platform. What would be nice would be someone on the IPU6 side
giving it a test.

A big TBD here is the YAML for this file but, I'd like to make sure nothing
has broken for IPU6/IPU7 with the modifications before diving into
Documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (7):
      media: i2c: ov02e10: Fix initial indentation and spacing
      media: i2c: ov02e10: Drop IPU6 FPGA specific handshake GPIO
      media: i2c: ov02e10: Convert to regulator_bulk API
      media: i2c: ov02e10: Rework MCLK clock get logic to facilitate OF
      media: i2c: ov02e10: Implement specification t3 and t5 delays on power-up
      media: i2c: ov02e10: Remove redundant dev_dbg() and some extra dev_err()
      media: i2c: ov02e10: Add OF probe support

Jingjing Xiong (1):
      media: i2c: add OV02E10 image sensor driver

 drivers/media/i2c/Kconfig   |  10 +
 drivers/media/i2c/Makefile  |   1 +
 drivers/media/i2c/ov02e10.c | 978 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 989 insertions(+)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250317-b4-media-comitters-next-25-03-13-ov02e10-23e68307d589

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


