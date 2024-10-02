Return-Path: <linux-media+bounces-18996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A766A98D873
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 16:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15B6D2839D9
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 14:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AA51D0E3E;
	Wed,  2 Oct 2024 13:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zv/jXlx/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7301D0945
	for <linux-media@vger.kernel.org>; Wed,  2 Oct 2024 13:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877530; cv=none; b=ukKmAAZeFGde1o42GBVI+CISR6OW0SieqTfCkkNimRzwu6HxTZWBx+PN16JYymSERty3o6VcALaPs+7XfTsauiJH9svrCrPA9u2SR8l/aADuglZyGDIP4VYrbuQvc+/VTU8w2wojYMbLhmvRD9q7zUKZ1x19/qjJ0oJnAw1iVWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877530; c=relaxed/simple;
	bh=w/TsS5a5WSIwSit4DOj5OdV/UkcpVwCNKIGyvLGXZ10=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vhn2EA4JlwutiTIkqy484Q6u0ngq5Rkw+HxoRFmVEuJDvn1RB4nzLBdCVJU3cBsEFxN1nJQdhl1YE2IzGNMYeu+z2dRxkIftvP9YCryGCgLxX+DX07vDOuB64azXQofAVuSyNR1PYpbOzyr6sH9qLw9LJmr/d7zt1vCyblgbuKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zv/jXlx/; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so45347441fa.2
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2024 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727877526; x=1728482326; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vjkUf/KOswIaFLt+uxgBBXXb9ZTlg8u5LbZllnxNp+E=;
        b=zv/jXlx/o8WhnCz2mVGTCBsv1sWe1XDLEXgXzReL+9u/wubU0zJ67JhK/WRAxgpuvU
         AF6t2fcp1puhIEoNElxAZgsqLyOV1Wka9szvz1vDNumvcbKw4RNVXtTolKc9kCCppM5G
         01w4B5Xlo1Iccva5CONG3Slfl1ZcighKXxXSHqiGwb1SlkWNrERZGLUKjN+IOXzaZniI
         jnhy0OGwAIcMRcdngQ22vzVnZLUHMFQc7O5sbvS70BQ4ut+o86sDilGNDz/3FFqySQtp
         oP/Dij0B6nSbKvWjSWgRNvIJ44JmMuOA1Y9VcF3Iomq0cyKCw9XFqQkZTRm5DJACnwMq
         fooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727877526; x=1728482326;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjkUf/KOswIaFLt+uxgBBXXb9ZTlg8u5LbZllnxNp+E=;
        b=l/TQhILyWMuGWb1gk/sfkE7UcMM7S6jUSKNNrXNVGXIBAv7QsF8HKsvjeNzrGkZ19o
         45/maTQcxMRQFzZQNHwhLyKCTBbeYhViWbAIjGDiG+I3JN4FlqfM22nGLcCic4NvlnqA
         sJsRSCpbcpvhusRiXCScB3As0tcd9iaOjVsQNs3CRZ0GWzKvUDb1oIHnF/hWpurAL5TK
         xMflARQZghxv/l7IU3b96kCDeYcb998NbCfhieZK1iTADjq1UVL60mdk99SkWH2+C7C+
         dEgCHxcP1Fg1+1GH8Xo9L0uhmRxkK2Gjbcvv2glcpz1MfVwGsLyHLinEfFyNoq8BJ76c
         xU2A==
X-Gm-Message-State: AOJu0YyMEe/9qo83GSDs+cnkV3MGgCAso162qS/hn8lbzknU3QWILz7a
	UHC3cWi/SkxPEYnWKmtvqutSLHY3rj9RjRYi0kJnk/IAzjU0ha6Bg8ajQbIjxKc=
X-Google-Smtp-Source: AGHT+IHKPfFKCDz15I2AQo/8+ee7h8+OVRelgEjVRDYNycVseXvprzE24Rkekp8B2/0JUQk52UjhXw==
X-Received: by 2002:a2e:bc1a:0:b0:2fa:d84a:bda5 with SMTP id 38308e7fff4ca-2fae10224admr35391861fa.7.1727877525761;
        Wed, 02 Oct 2024 06:58:45 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882405b19sm7577346a12.11.2024.10.02.06.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:58:45 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 0/4] ov08x40: Enable use of ov08x40 on Qualcomm X1E80100
 CRD
Date: Wed, 02 Oct 2024 14:58:42 +0100
Message-Id: <20241002-b4-master-24-11-25-ov08x40-v3-0-483bcdcf8886@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJJR/WYC/43NsQ6CMBSF4Vchnb2mvZQWnXwP43ALBZooNS1pM
 IR3tzCYuBjH/wzfWVi0wdnIzsXCgk0uOj/mKA8FawYaewuuzc2Qo+QnVGAkPChONgBKEAKwAp9
 4PUsOjeqk1kSkSLIMPIPt3Lzj11vuwcXJh9f+lcS2/sUmARysbKvOtKWparrc3UjBH33o2eYm/
 FiCc/HTwt3S9Ukrg7wRX9a6rm+3HB/QEQEAAA==
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

 .../bindings/media/i2c/ovti,ov08x40.yaml           | 116 +++++++++++++
 drivers/media/i2c/ov08x40.c                        | 179 ++++++++++++++++++---
 2 files changed, 272 insertions(+), 23 deletions(-)
---
base-commit: 2b7275670032a98cba266bd1b8905f755b3e650f
change-id: 20240926-b4-master-24-11-25-ov08x40-c6f477aaa6a4

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


