Return-Path: <linux-media+bounces-40003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C810B28AD5
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 07:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D1D7AE668E
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 05:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03CC1F866A;
	Sat, 16 Aug 2025 05:55:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094401F460B;
	Sat, 16 Aug 2025 05:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755323717; cv=none; b=jdzpSEzt4LbzNT6Rm397FqiAciZQJSdPP2DTJ8jAgHP77RlTSyGCcF2t5hSX8ispoYdX4lndMvt+uyZmTXc1hHu/UTNVRiypflCI8u/AQmr+ln6bzawsamijSgAArMKaydxaqzXTjWFnGHkVxuCwgfm4oqKfFlRmL7sQy7E17A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755323717; c=relaxed/simple;
	bh=bWYYKAYxGMlobHiI6Ave2YFgHIf/DZ9zZtd20i2n5WI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VdJbrgb+dSoDrqouS8Xg0MZOnpjU0j2daOrenu8ghaj5Ur0lE7lSfgo5U/qVkVdLw2esKV4kqHsJ4fvFKsHcGKGchNcaEwYiPxhkQsOy2JK8sjwDfFOibVOTwyS3BIS4bqNvlqZiVckWf5I/rbmNjO9goUjpfmP4K+MiG++aWew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e434a0118so1224989b3a.0;
        Fri, 15 Aug 2025 22:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755323714; x=1755928514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8l6ugMORWdZnLG6DvtshikPFCBAakpfJtq8I9fLIE8=;
        b=D7LF1D97WlJQ2j86EqTQe5oDcKZhkXhS9zTAOfFz/9HglX1j6AdJNmRPZeWXK0WF/r
         u109nasUN9+NaDaPbvnG1IJXGYd0HIrs5Pa4uht9WBtEraRAK43OML0i1rWl1SlDLDrG
         neQZP0Sc2O5ZNtIRicvMY/ojKw5zNZ41pxkR+/nMoQBDpLFDh5hJ+Tz0auhiN6sZ4cO5
         pVH7NbdiOeDf2VS0B7gptnghjNU6S+FIYRl8scPD0dnpTCfenhk5Eq/spCBbIjhNddPj
         DKkjHseHCNqZYHvDKOQ6c0oWE68niK7Im4DMlK+M/mgk8+UIuKnY1q8Jol9AStRnJvZH
         y1QA==
X-Forwarded-Encrypted: i=1; AJvYcCVxw6DFpYEMzWAuRm9BFOX4SEjS/SqG3EQKQU3wqWplfxClf9xXYfmHDluQusuawA2aLL5Vz+Bfv9cJ@vger.kernel.org, AJvYcCX0tGeDHQ/O3LBgj6D3JZE8xHkZxBv2MMZpmy1B0f51kZ+bpRzyGgow6ZgcK7ebeu2ZGcV3G5Sk3euyZgP2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx60Ojdr73GLxN5bcLtaPRpRbkAWM6kxAQ+wOwvFxOwObVkuZMJ
	id2py0ITp8mH+3m2SnOjkqakAyy7CHGEC76KJfqIcr40CMfAM45Q5iKvH8vo4X91/fk=
X-Gm-Gg: ASbGncvAKY6brtO57e4Bci0ezoPb2RSXpaUom04cHkrjNQmp7bQ93i6BwtpAXVSYKVf
	PUGW0NanIu+ny1fsgH7Kk0gmbqVjF0uBmUAaLVdTNZLbO46ocRr1Htbt1UvSJVVe2vj28EThp5d
	T47Rq7/Agqsn0LVJgphqrMWAYvf/ysxgJauVAU97rv0bkBFAzLXcsSwSOQ6W0XWWNkcnL8av1EP
	ZtRSmynaABJSu7yp+kv9WMMz3uSkptqUYPviyH4/7zWD6Nd5U0EUYZLcmA6McR84Nkj+DuwhXA7
	kng/gS+Xi15xNhmNyAdMG0UMj2CtDP+bqYoPdeGS5MiB/wHhTdTUJJygghIRthvqS11xYq8RPyP
	vprUHZp1QZH0UChvkmRbrKZOEaFE5SgcW/ERBSthx6lBeaK7zgoPmcLcBfTUoOIP7yvY=
X-Google-Smtp-Source: AGHT+IH81cWB4GjkvFKEzW81dhzt3dL/rd6gx+vJKvrcqnS6KC21zI3Q4A79hOEHtHnPPVw+l8vHwQ==
X-Received: by 2002:a05:6a20:7f96:b0:240:f96:3153 with SMTP id adf61e73a8af0-240d2e69f54mr7365229637.29.1755323714119;
        Fri, 15 Aug 2025 22:55:14 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e452663f0sm2402730b3a.21.2025.08.15.22.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 22:55:13 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: Add Sony IMX585 image sensor support
Date: Sat, 16 Aug 2025 06:54:30 +0100
Message-Id: <20250816055432.131912-1-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is v3 of the IMX585 driver.

Changes in v3:
  - Remove ClearHDR support.
  - Remove HCG/LCG switch support.
  - Use full parts number as compatible string.
  - dt-bindings: fixing sync mode values.

Mainly the change is to remove the need for driver specific V4L2
Controls given the review comments in v2.

Features
==========
  * 4-lane or 2-lane MIPI-CSI-2 up to 2079 Mbps/lane
  * 4 K and 1080p @ 60 fps 12-bit mode, monochrome variant.
  * Blacklevel adjustments through V4L2_CID_BRIGHTNESS.
  * Multi Camera synchronization mode support.

Testing
==========
  - Platform: Raspberry Pi 5 and Raspberry Pi 4B, 4/2 lanes

Series layout
=============
  1. **dt-bindings: media: Add Sony IMX585 CMOS image sensor**
  3. **media: i2c: imx585: Add Sony IMX585 image-sensor driver**

v2 Link: https://lore.kernel.org/linux-media/20250810220921.14307-1-will@willwhang.com/

v1 Link: https://lore.kernel.org/linux-media/20250702063836.3984-1-will@willwhang.com/

Thanks for reviewing!

Signed-off-by: Will Whang <will@willwhang.com>

Will Whang (2):
  dt-bindings: media: Add Sony IMX585 CMOS image sensor
  media: i2c: imx585: Add Sony IMX585 image-sensor driver

 .../bindings/media/i2c/sony,imx585.yaml       |  114 ++
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |    9 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx585.c                    | 1358 +++++++++++++++++
 5 files changed, 1489 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
 create mode 100644 drivers/media/i2c/imx585.c

-- 
2.39.5


