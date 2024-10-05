Return-Path: <linux-media+bounces-19118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A99FB9915F3
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 12:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EC301F23617
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 10:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F083413CFB6;
	Sat,  5 Oct 2024 10:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="luA4lAtc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E53137745
	for <linux-media@vger.kernel.org>; Sat,  5 Oct 2024 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728124271; cv=none; b=peHIlWCl9r62JiHIx9vKOohUtTuvb8d0yEqg6MFV3/kBHnTAizw+CCebGRLw778zqvVZuC0ocu9XaVy5IL4UWgcFT6pY9oceQCvOx8zs0//sID2hVWYFdxoS9DP6imAbHrraNu5X9kiF1AHHDPtmSxiIt1vJcBUVjOAabFYHMOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728124271; c=relaxed/simple;
	bh=Pij+6FhctUgT45PYcO9Wc7sOysLVBbXPyPt2wqIlGhA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KnRM+g9lmZ63pk+hic6gnS1Qu4DgF+D9Yh0225xh+sgTUsU3u57EDM1sI2AA3a/1eydHb1fm7vh6qRNQnegvdHFxzaCBAwjnCaQZ+ZXGQrUMbyBk5MddiOSrq7GOnL5iOkpHupEBt7K6xHhFPKBig1S9mHxvthz4z+nhZPiFYko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=luA4lAtc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a99422929b2so17363266b.0
        for <linux-media@vger.kernel.org>; Sat, 05 Oct 2024 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728124268; x=1728729068; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p2Scx6qIga+XDSP8TrnSyjUo0WD/tL5TkvTo8bpNEJk=;
        b=luA4lAtcOtLI/jjNZFqGE04eeuOF2zCotJwNkej6DVZg3e/p7RUTJ6xIVkr23kukDM
         nmhS6tEpkdkAcJHSPyB46E1WppxcafBBO0DfkCxxvR9gVEwB4b5LKKIs5Yg8ddwFU9jM
         7MAOzAEwl2XS2aEjmZbZ2r73D4BOXkCLJtjrAMvZ08q3wO55TR1NBjWMrJ5UBvzfSUVZ
         A5NZJ2Y6IbhZeRUO8/4Cf2rxYT07Efi6gJnVzuhnLlWjglJYpiZRwFRW4yG5vEgQVlgO
         +OhJv4fE/q7sYZ0AWbsIXqIcK+vsGLMv9W/1ZK/uOTLFXexhIsuUssSNJpU0YYCuxsC8
         VzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728124268; x=1728729068;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2Scx6qIga+XDSP8TrnSyjUo0WD/tL5TkvTo8bpNEJk=;
        b=DHVHe9i3Mz0d/AKHPZhiCrl/yCE9SKWKNciZTF6zgl1HUARIN56Tq2w5GrGRSY2Of4
         6ZUm91D7zRqjBjv9QaLdfOmUMioa1Sdx7QQfBFnH43ee7vLE8X8X+VKhgkCzOce7ZU2r
         MJ+0UrhQFGCoC+VNJTtJ6huuF0FaRaXhtnxJCJJ2w6agBzaFjd3UaF6VXPepxLlEYGh9
         rcHEtRXLle1tsYTMd9uL5VsAFFwALrDZ5MPi51/YjYWL78MyCxV4A0xyEJF+UpHtGQfX
         mizDERHF/ePwQ/21Ctkf5F0WQiWETkmEfUNekJ8Zy6UnQ5Rhf96ScRi4rYfI3fJJzCIc
         ZdiA==
X-Gm-Message-State: AOJu0YwyWJj593w4D+DuWahcYU3JFC/bx88geyDxJDF2+0QxntPoAie0
	SfW2u3UAHlmr8eh6QxJhdKpNu78dvKutIG8xOPi/JGz6xKRH1rKjUv55wJDpLaU=
X-Google-Smtp-Source: AGHT+IFbacpLSnc4rOMpY5+dmRRZziIlusw3JZmkgHzp0UUQlnip7OEkK3q13Utpc9eyONEmI4HwlQ==
X-Received: by 2002:a17:907:5cd:b0:a99:409a:370 with SMTP id a640c23a62f3a-a99409a04f1mr81222166b.49.1728124267726;
        Sat, 05 Oct 2024 03:31:07 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e7856bfsm116315566b.138.2024.10.05.03.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 03:31:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 0/4] ov08x40: Enable use of ov08x40 on Qualcomm X1E80100
 CRD
Date: Sat, 05 Oct 2024 11:31:02 +0100
Message-Id: <20241005-b4-master-24-11-25-ov08x40-v5-0-5f1eb2e11036@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGYVAWcC/43Nu2oDMRCF4VcxqjNBGo0uTpX3CC50W1uQrIJkh
 I3Zd4+8RXAwLCn/U3znxlqqOTX2truxmnpuucwj1MuOhZObjwlyHM2QI/E9avAEX66dUwUkEAJ
 QQencXohD0BMZ45zTjtgAvmua8mXFPw6jT7mdS72uX13c13+xXQCHRFFNPkqvrHv/zLOr5bXUI
 7u7HX8twbnYtHC1jN0b7ZEH8WTJRws3LTksstKHGCZrrX6y6NGSmxYNy6SEgdQUgw1/rGVZfgB
 dZCArqQEAAA==
X-Change-ID: 20240926-b4-master-24-11-25-ov08x40-c6f477aaa6a4
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jason Chen <jason.z.chen@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2997;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Pij+6FhctUgT45PYcO9Wc7sOysLVBbXPyPt2wqIlGhA=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBnARVoLEjcjm9TuL9OFReqpJEqft90VdK51doUk
 nmz3UXVx0iJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCZwEVaAAKCRAicTuzoY3I
 OvciD/4vEXfuM9u5+VapF5+ubkcJAfOstxrMLN1t4iIeawhT/7WfmWfO12wowCTkX1kVaUQcbXI
 YUbCdzI+3cS/WLwxuJyOKssB9jmNgUk4GuhFBJ1KCnhWlsxk19C6KLBwJgekWFuB6a0Es2Xm6rf
 ZbfGt3KNSpRukqdxIFT5QYr03i6PWX7MtT+PuQoKjIqFXH0jOMRDEc1aFdXGR7nPEcy7cZVcx6e
 jMd33jKYUGa+CJBKPPUa8Lx0T8dr8cg0QkYXJZNEVnuvN7LOwcCkSgYdShZpPPlBWbwuyuVfKho
 3OMnMqz7peEOJ8jSN24PN2HRz2+lUZKuNKGC0yMT2rKdhzyK1SGp6mx3OQGDWeq0S6VsgAsUfKN
 HWhfoWus2/Twc0f32iKwoLTabaT48N1IFmu3xFEIgj9QfhNp4mSo5NrNoxviDrejKo7yhNRCaCS
 zQc4q5LJfWjNY7vgDhIt457L4amGm6zYyhGsTGROxUgNb2tAZant9y36UWQzQBtulPFgjyCqiky
 6K5I2EyxIwJglqDIGAttC5ERRAhk9SAXscg6m+psC/KhUQAmFUuYINGe02zxo5EFhfrnHco2DK6
 xk0Q5vGv6Yj9eZy4NT+6dNZvsOQlkSF1P1I1/aQu8Gk2Xoo32uc6VnG5fLQT96YGkz5aMlhdcP7
 43FS1MTnX54y4Xg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Changes in v5:
- Fixes smatch CI splat
- Link to v4: https://lore.kernel.org/r/20241003-b4-master-24-11-25-ov08x40-v4-0-7ee2c45fdc8c@linaro.org

Changes in v4:
- Drops link-frequencies from properties: as discussed here:
  https://lore.kernel.org/r/Zv6STSKeNNlT83ux@kekkonen.localdomain
- Link to v3: https://lore.kernel.org/r/20241002-b4-master-24-11-25-ov08x40-v3-0-483bcdcf8886@linaro.org

Changes in v3:
- Drops assigned-clock-* from description retains in example - Sakari,
  Krzysztof
- Updates example fake clock names to ov08x40_* instead of copy/paste
  ov9282_clk -> ov08x40_clk, ov9282_clk_parent -> ov08x40_clk_parent - bod
- Link to v2: https://lore.kernel.org/r/20241001-b4-master-24-11-25-ov08x40-v2-0-e478976b20c1@linaro.org

Changes in v2:
- Drops "-" in ovti,ov08x40.yaml after description: - Rob
- Adds ":" after first line of description text - Rob
- dts -> DT in commit log - Rob
- Removes dependency on 'xvclk' as a name in yaml
  and driver - Sakari
- Uses assigned-clock, assigned-clock-parents and assigned-clock-rates -
  Sakari
- Drops clock-frequency - Sakarai, Krzysztof
- Drops dovdd-supply, avdd-supply, dvdd-supply and reset-gpios
  as required, its perfectly possible not to have the reset GPIO or the
  power rails under control of the SoC. - bod

- Link to v1: https://lore.kernel.org/r/20240926-b4-master-24-11-25-ov08x40-v1-0-e4d5fbd3b58a@linaro.org

V1:
This series brings fixes and updates to ov08x40 which allows for use of
this sensor on the Qualcomm x1e80100 CRD but also on any other dts based
system.

Firstly there's a fix for the pseudo burst mode code that was added in
8f667d202384 ("media: ov08x40: Reduce start streaming time"). Not every I2C
controller can handle an arbitrary sized write, this is the case on
Qualcomm CAMSS/CCI I2C sensor interfaces which limit the transaction size
and communicate this limit via I2C quirks. A simple fix to optionally break
up the large submitted burst into chunks not exceeding adapter->quirk size
fixes.

Secondly then is addition of a yaml description for the ov08x40 and
extension of the driver to support OF probe and powering on of the power
rails from the driver instead of from ACPI.

Once done the sensor works without further modification on the Qualcomm
x1e80100 CRD.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (4):
      media: ov08x40: Fix burst write sequence
      media: dt-bindings: Add OmniVision OV08X40
      media: ov08x40: Rename ext_clk to xvclk
      media: ov08x40: Add OF probe support

 .../bindings/media/i2c/ovti,ov08x40.yaml           | 114 +++++++++++++
 drivers/media/i2c/ov08x40.c                        | 181 ++++++++++++++++++---
 2 files changed, 271 insertions(+), 24 deletions(-)
---
base-commit: 2b7275670032a98cba266bd1b8905f755b3e650f
change-id: 20240926-b4-master-24-11-25-ov08x40-c6f477aaa6a4

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


