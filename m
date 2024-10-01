Return-Path: <linux-media+bounces-18919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B6598BD2F
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 15:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0053E283613
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 13:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76221C3F1A;
	Tue,  1 Oct 2024 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ih45VQBQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7033F36C
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788558; cv=none; b=psRYB0iOSWaLm62Zjn1eiG8xXkbz++I9Kdcpy3dG78C27fMAHrSboPmWqrvHEyK3sZNTKc0wdlLEUfaOt/BJGfDLxW3CRK26+LEaMI3Y69IyWGAwyeD62PFUf4DFFjj7tIIdANmkLQd9fLJgoLyrB2beprJvlvjMtXjCYLYkQgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788558; c=relaxed/simple;
	bh=ZnF7wm42EvgCWGiJrdHox4g3kg/iuW1AhL5etYPRUM0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sU8MXCq441joN5xrPu796NFUD7JlJ4zgSOB6WfzHh/SRPhB7Zj5nEaL8kgaLHF/HBqvgJWEIZQoPxcyPrvti/ZrUle0X/kvYM0bOzJL8JWIinGBRNtTuRwh4Vzmysfms6UJqEbikP/uoHkZXe+2dF5OuO/A8GerKihQ2QRMTUzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ih45VQBQ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so10091699a12.0
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2024 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727788554; x=1728393354; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uHNq/8fEpEpzhzO15Rr2H0soDaHS4wrw70IWmYALeO8=;
        b=Ih45VQBQUZEURatoJocLOJc5ZSx/FOPOBJPJv4GURHMDmxACryISZT0gXPWuIH3PKR
         ZOaBmHV6lS6KO50Zg9W2w9qLi9uI9oOYAImvpQFZSUuO04hoQLl6m2U4Bg9GIN7wp4rQ
         VD2KOFDZqALLzMbGpAx/xAN1jJE+zmw3D+NU2XDkfhvANe1+/rSmnLuvZLxSybFCnBRL
         YfBZ3ecN+1HyLh23rEJW0ZbYwfpdGNX6xmyRQRqJl4gR3c6Ym5WodbclZCo6ZOxTRogp
         pDPxFN+3VfmxOlIw3xA5CGgCxbImEvclxbjxviL3fPqxoD/R4bIo0E411rgaSX/jpEu4
         gfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788554; x=1728393354;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHNq/8fEpEpzhzO15Rr2H0soDaHS4wrw70IWmYALeO8=;
        b=XF1CKW8rI3p45wTU1lnW8pnJzdWe41+Q4pRo3UI9Hef605FJ6r7pFFTSWWGRrqS3A6
         rU3c8iMZVRhrWNN2F0ulKmD/awwL54JfPOOtDmxUwqRZgOgn8T0mss4aEKj0onI721M6
         VZ5JEyFYOVptzM2xr+NY09jp6VXaaKx59ChjEEfRVX4CYxlCxk7rJI0n6LQ/L36xeXlV
         78OnHBRFeAQebK3NuCs7TCVq/jAPY+h97b5731YMWJcoGWWoVp9fvqqXgNohnLUO7/z8
         Xbbv9QFhypUOYctE8e6T5hw/WFvveejYEZZQfiPhoNAQK9hjSaRI0zvb7zzMMMFJYtGq
         BhzA==
X-Gm-Message-State: AOJu0Yx4NUeX1xgQyPo9exEJSMER3iATpFMw3ebcBYO2K83mfbWxSZb5
	qdp7sjToIA/FT3tkd1FQ0ZudPG3Bew1ykzoYy0zWjh8aAE4zzacYbEzU77PW+Zw=
X-Google-Smtp-Source: AGHT+IH2WkOGnSVNvyKKZPS7PClTVofiofQ8J3AJTG5TUP+u9T23cfrzaZKl2s3Chl0l9bdUxeu4VA==
X-Received: by 2002:a05:6402:4406:b0:5c8:8844:7874 with SMTP id 4fb4d7f45d1cf-5c8a2a1c8dcmr4373156a12.10.1727788553718;
        Tue, 01 Oct 2024 06:15:53 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88248abf5sm6170875a12.77.2024.10.01.06.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 06:15:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/4] ov08x40: Enable use of ov08x40 on Qualcomm X1E80100
 CRD
Date: Tue, 01 Oct 2024 14:15:48 +0100
Message-Id: <20241001-b4-master-24-11-25-ov08x40-v2-0-e478976b20c1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAT2+2YC/43NTQ6CMBCG4auQrh3T1vKjK+9hWAwwwCRKzZQ0G
 NK7WzmBy+dbvN+uAglTULdiV0KRA/slw54K1c+4TAQ8ZCurrdNXW0Hn4IVhJQHrwBiwJfiom81
 p6KvR1TUiVuhUDryFRt6O+KPNnjmsXj7HVzS/9a9sNKCB3FCO3XDpygbvT15Q/NnLpNqU0hcY4
 036xQAAAA==
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
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2245;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ZnF7wm42EvgCWGiJrdHox4g3kg/iuW1AhL5etYPRUM0=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBm+/YG1UwWihgb4Yf2TiSAHh7q4sNFfQhRAlNTI
 ElQPXSMVquJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCZvv2BgAKCRAicTuzoY3I
 Ogj5EACrJpfXay6BFxWy81j1/8KaUoVCS6Uhe8eG4G88Rk15zYVvSZMhGAal8cxt21LDD8W8GIc
 w3JtoiBTG1C+kb1E026ApqmFrGBZEopowRqJCf38SwFHrPrDiICVbsgRSRik9NTna3VN2MsUCT6
 CW6vm8dI5JFNGdPvJFl6+H8ujY6iwWo4QK/iXesk+ad8nllagsKx4W6Y4A3N74w+XCTgHRGBOWf
 bJSPRibUh6ZPgNQ5Nva4uwiCx08XN0ULrxcmtZp2eyFlBWrkAhGBLNok+TOfQxMD6AXJ+W3eYzY
 jgXZ8NXsw3c3x0ZGNGz8N8dwvdt874Cja8Lmyr4gVKfM46gUnoIepYLTnYyy7WUUFUSlVmQcdgn
 boKKwYUFcFyJKMnrUJDv5nOhVm3c/IcJMkCPBBa1NYxi7IJczmwb34GkDxtcOlu0URrOHKEDADW
 xXdQxpPaspqdXvJc4YUlwtKqtl/h//2TfQVC7/4XspLZ0mYM9GCPtVOqiD84Pxcr6OD+soryCdw
 4cdPovUsgGaxnVztX8UzeLh6Wh0Zg6pJH7CnwL0D9TfJEMYQw99+TDh9lGAk35uX8tQ6cJvQl7K
 s+EqYqnzC8ut/0VY0Bedf+D34x9aEdErIfqmDiZuduwU6WWYg7bELwu2PDmLB35+rpZ1B9OIKW3
 edBeRkv8HhpBY2Q==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

V2:
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

 .../bindings/media/i2c/ovti,ov08x40.yaml           | 120 ++++++++++++++
 drivers/media/i2c/ov08x40.c                        | 179 ++++++++++++++++++---
 2 files changed, 276 insertions(+), 23 deletions(-)
---
base-commit: 2b7275670032a98cba266bd1b8905f755b3e650f
change-id: 20240926-b4-master-24-11-25-ov08x40-c6f477aaa6a4

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


