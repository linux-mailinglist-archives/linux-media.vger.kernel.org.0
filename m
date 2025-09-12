Return-Path: <linux-media+bounces-42415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A344AB54B16
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 13:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2E371B24989
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 11:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4123D2FF656;
	Fri, 12 Sep 2025 11:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyUbVphU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B2F2FF16D
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677024; cv=none; b=Cpjxjn5KpGSXitfrognVrzppshxFcmv/4yAJSyBico60yrCREKGFotdb4BpNqDgMIHlvht2F8yAE2o9M0V5KLyXQd35MXeLvAzaH1xn+kAGZnVYTZJZj2plIDym+Wjs8j6ir+MzIXm8HuNB1j0VGjkgd1wkfDNZiH4gXr3/svVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677024; c=relaxed/simple;
	bh=W/d05Ah4gZEm/6xcEdlciMhi/OilrDK1p9IjJYcMRLo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RRalK7Phyvyg6RrTDdQNJvuBVwfMgO2kwvoXDIKGOHVIiDyuyaBNt5l/s6kNJ+haevKRnYtYbt0F39soqRa/G9bgGiOVmb1QwLBRU9EUcB02VZS0zaLb4orD6XyiZr1JVzdY3cNjzk+Ssjvd75GDo5pr9EcErT53H2N0dOygJwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyUbVphU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso13647805e9.3
        for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 04:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757677021; x=1758281821; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tbnb5qYeKlx3hN1o2p4vVBHs68NjGI4FeyMjq9mKLyM=;
        b=fyUbVphUwVUmze5Vc/3hWFiAOvxhvLkhzXwzmf01l1nWYeTawF3/PyTagKYa8dbNom
         XAZyrKhsJtSDj77tZ+heZaBH3IQZni7TVr2vnmmX3rlouWyGNtLqXNLqBoYEIRLCM1da
         akObx0gAM+zJpd4mZPN3P/6EWpSjFABBgYxvAiqK7diD028/isOYgbqTSWcl27VbEmgt
         dNc6HSls3XRuUh5TnXflGGI10Fnb9cPHZUlBacClXs7RTCQwUVd5aymtyi6No0kEeFDJ
         B0y/zTzKWRAWncM4yT8CR7y6X04mY2g7pnLfKGmmwhhucrtp0GEL7ygq0+YDZ5wFPBlW
         8uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677021; x=1758281821;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tbnb5qYeKlx3hN1o2p4vVBHs68NjGI4FeyMjq9mKLyM=;
        b=fF/eWaHrmbaOvn9szRYAh/ECQvkwni2ViciDrS3F6aXIGLI7w0JWGxqeAMZnyTSDaJ
         wm6EAEYVIb0SPgudoPOQTej7uVdFmi0iMHy5PpMJFj+ZF8AHAd+DQHObIcbtwNR21Ljp
         g3LYOrXTAdvsKSicjuoEu4ZboEnkUHRJ14s9YIcRF2zES/+4GRRfI0tHMAnCJfQ76wpa
         bfS2/Spd1sFw5hBJmFKOESBDhzb3ma1VRHfxp4oWGU3ma9g/m6GneaHf2BfT1tM776wE
         27tevxiVWhRxIqqWziFraXxUVazIkByZAQ2w1b84jzaOefAs3142L+K/61QkrBYq+sfr
         bM3g==
X-Forwarded-Encrypted: i=1; AJvYcCVrcr96deFmn6a/KymL7AsN9lwdnmr0WZUKuyJFI4w5/JDH/1lsWn02iQclds5us6ZqQFPSO19zQtWIww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz43+GxbkXpGXH9uylS8ijr5gbA4lksLdnCfmDT8yuYycQ1rg8E
	+KABpN2zWcm08VWImkAFs9pnK+Du71f2ynyX27kAlk7v4x6oZi6nbzSD
X-Gm-Gg: ASbGncvQ/Gd9CcnPCIR8Tn+nP4+4mACZyQWaHvp13du6+mHsKo/Di0jS5nqC+F4fqXG
	wj9xi6yvhbaGIfx5Ibj20BbbIC/P6qqcmQg9zj8z0/aaCq06SXSFUC4XOa4L35sDeqaMf6YhjMP
	KqFEzvCi6Zq59Zc1y52kL1vWl5dC+IvJ4aq3SmkrOS0bVf69hf2rdJ3hDP+l7kVHSsJ3BMTeiAv
	PQLLykbUjdFGTsAxvy5xX61lc5w/+i4M05Rq0tGUSszpJkuBBkBRIKfY+7CPZyJdiYqSCjG8xfd
	G0CffeQQZXRTuwBvAxZgelwYbE0Z6LjoUKeLjNci23R8B5WGpQM0rjF9Y+PVtgaWCLD8V+KFy21
	QQ+FhMrI0eIneI82XGuNKzMaQbYbMvAlrpQ==
X-Google-Smtp-Source: AGHT+IHD1EhTqy1kILkNX4aqLwbC3vOYUogeq+zQjgxWO9vkCOKW7N3eFQcOHrtSmgitSOXwjOi+4w==
X-Received: by 2002:a05:600c:4453:b0:459:dde3:1a55 with SMTP id 5b1f17b1804b1-45f211f2fbemr32051345e9.24.1757677020864;
        Fri, 12 Sep 2025 04:37:00 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e015621a3sm34806145e9.0.2025.09.12.04.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:37:00 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: [PATCH v2 0/5] STi drivers cleanup
Date: Fri, 12 Sep 2025 13:36:07 +0200
Message-Id: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKcFxGgC/zXMQQrDIBCF4auEWdcyWoTYVe9RsrBmTAZqLBokJ
 Xj32tAyq394fDtkSkwZrt0OiQpnjksLderAzXaZSPDYGhQqjQZ7EWxeKQnttDM9Ov/AC7TxK5H
 n7YDuQ+uZ8xrT+3CL/H5/hJR/okiBQo/tyBrrlbpNwfLz7GKAodb6ARkGYeycAAAA
X-Change-ID: 20250908-master-5c5c980cfb03
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2385; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=W/d05Ah4gZEm/6xcEdlciMhi/OilrDK1p9IjJYcMRLo=;
 b=owEBbAKT/ZANAwAKAechimjUEsK1AcsmYgBoxAXLeqm8EM6Ln+ijCpBNbKP4K9a1DvPX3NsAN
 IYYCf+yf5aJAjIEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaMQFywAKCRDnIYpo1BLC
 tQGuD/dVI8gwr8NeJogDt/gJ257+fspO6NaaYkH/dEvRdGjup1CfAOfmAiu632NRwxuhcnBapPz
 /A4h/qVY5OFES7fLAtA6cBemnuD85Lgt/gKhMnkQaVNQeIrNDpCPEJnwzgs3QTQFc1FABo1PTvK
 mAfl4wTDBWmiHcuV/0/XzM9EGj8cxwOlRCugHE8ar4ff4/8On/eG8wdYbPkeqVxhZYoaXuYcsyV
 nkv2lqZTJrxK0/fKv3K+HVm6myXgv+EVUmhtxtjYPIlenUrVXP8OnfIRq/9rSXq/AeonG+A2f+V
 25LaXemjFtPFelIfrpAf9sdOZCA5z5t6JoYSLjhAaMc3UbF8Fgvi+ykgkuO6zhpeeWSAsDJ4OMg
 72FzCauHRkZ0NXwLebFweKXtbdw0UcnShdZLlAVgXUbzSEb4SlQVBD0SynMoi52zNoA8XWvR8Ow
 nEsp1c8FAjQnfQF+tJW5pwZuOl5J4OTHIhArBUHDNzbwaJUEtO4Zn3Pa5yRghrEdT8vIhXKSWPk
 u0j7RxMgLY9WJ9qBzOs//PPK9OUReku1RrHC76pQuZJ5xzMvtL23dSZgkn7Z6rXgbOQK6+/D145
 XyR/JO24SaQKWLBt7GLEoK1EPIo6QN/FaBukh6xMD1AYrwcW/3MNZaO/DpIpRjn3NqE/HQRD7VK
 OztxzeMRN/6m+
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

With B2120 board removal[1] several drivers are left unused.

Remove the following compatibles:
- st,flexgen-stih407-a0
- st,flexgen-stih407-c0
- st,flexgen-stih407-d0
- st,stih407-c8sectpfe

[1] commit dee546e1adef ("ARM: sti: drop B2120 board support")

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Changes in v2:
- Fix Patrice's email
- Documentation:
  - Remove media admin-guide c8sectpfe description
  - Remove c8sectpfe dt-bindings header
- Driver:
  - Remove c8sectpfe media occurence in platform Makefile
- Link to v1: https://lore.kernel.org/r/20250911-master-v1-0-5d5d5ea9af22@gmail.com

---
Raphael Gallais-Pou (5):
      media: c8sectpfe: remove support of STi c8sectpfe driver
      media: include: remove c8sectpfe header
      dt-bindings: media: remove support of stih407-c8sectpfe
      clk: st: flexgen: remove unused compatible
      dt-bindings: clock: st: flexgen: remove deprecated compatibles

 .../admin-guide/media/platform-cardlist.rst        |    2 -
 .../devicetree/bindings/clock/st/st,flexgen.txt    |    3 -
 .../bindings/media/stih407-c8sectpfe.txt           |   88 --
 MAINTAINERS                                        |    1 -
 drivers/clk/st/clk-flexgen.c                       |   80 --
 drivers/media/platform/st/Makefile                 |    1 -
 drivers/media/platform/st/sti/Kconfig              |    1 -
 drivers/media/platform/st/sti/Makefile             |    1 -
 drivers/media/platform/st/sti/c8sectpfe/Kconfig    |   28 -
 drivers/media/platform/st/sti/c8sectpfe/Makefile   |   11 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-common.c   |  262 -----
 .../platform/st/sti/c8sectpfe/c8sectpfe-common.h   |   60 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     | 1158 --------------------
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.h     |  287 -----
 .../platform/st/sti/c8sectpfe/c8sectpfe-debugfs.c  |  244 -----
 .../platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h  |   23 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-dvb.c      |  235 ----
 .../platform/st/sti/c8sectpfe/c8sectpfe-dvb.h      |   17 -
 include/dt-bindings/media/c8sectpfe.h              |   13 -
 19 files changed, 2515 deletions(-)
---
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250908-master-5c5c980cfb03

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>


