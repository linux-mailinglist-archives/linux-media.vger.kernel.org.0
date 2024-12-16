Return-Path: <linux-media+bounces-23512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BBF9F3D83
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 23:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CCFE169285
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4D51D6DA8;
	Mon, 16 Dec 2024 22:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpOTDJ+D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FB15D8F0;
	Mon, 16 Dec 2024 22:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734388236; cv=none; b=ln6sGlp5JJDURhkuLj3jSZmwKFg9qATyIsMNJMsLTU7vKzVp0nPn/CLXZY+sWkh/z1AYThetyCnMvf9ioflTeJqle/aPiL0BxcgsWjoE02vWvDEwPclbtM5YHb0Tx4TlsJLvbelHT+Ggb2m3SRyYDW4tiDYlfAkC+rgx26XqL+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734388236; c=relaxed/simple;
	bh=4bO1EjdSvXJ62M8ayQUFJJHF+pCdEsE6nbS2VHUOgYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NhNBMix5HuPQT244pDrMke6DWI6FvTjENJtCxwk2YJ2qh20CiMQh6LSFiL+HyfMBOmTAmOlDawflEHHemb9jggZedSW69EXvZg7wuGkx9g6W+QLgFiUp8QaDdO2247wfEStju8vVX4Dt+encon3Bx1OC9deXg8JOKa2I7H8A7l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpOTDJ+D; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-844cd85f5ebso386748739f.3;
        Mon, 16 Dec 2024 14:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734388234; x=1734993034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vu/gd+Psmkd9LrXVKDf+sMo8Wju/Lil3/T06jKFEacA=;
        b=RpOTDJ+D/WRPJu7ijO42fb02uNlTKiOKdfJtYOd18KjymYg4k7zCB/aQ5rCESzq/Up
         4wUuXj65HSQNdu6ImVXI4J/xLd2yvUqtZ/JDaRuMnNxoaS04UTaXZZSDaI7BIt/3ywWS
         1XCn63ZpbXr1bydgWZLO6a3RG4wXhhAVsN0RFRx2+AlqjOsleRIi6JuFtuwXbEfPDeBr
         o7GIsRxGrCxCLqwdNQnepcSYxhtpPntq0urAh/lt2s0TN32YC2PrbtsEbYJDMZd5fSkB
         9e4d2jJtGmk7JfdnELtX7pDcol1UIf6QLc03CPiUvKs+Q6fIXDceMBybLsxdEqUkFWMO
         ocRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734388234; x=1734993034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vu/gd+Psmkd9LrXVKDf+sMo8Wju/Lil3/T06jKFEacA=;
        b=FcdQ0n6/5BZnYDX8MgIGS5T70RhsKhbUR1oeJBLg5tgHJ+dElNDJ9k+GEMfC31fZNR
         y66HPKsUYA9jkYUbzK14IigepKzmd60IlCpJeW4pkFmEsyx9t1tdk3mmT7NCupHQsbP2
         Ofs3CPxM2SO4QwjDT1Jol4PVl+UHIdECPaSI7LKjKPwt28bx1pU0GegUuDxGBBGpyOiN
         VX88Avx7lQWltqzRbqqRV+WWimzQ7JX8bPwSEdUUmjYm700fSYCqW6yTyWXGxN0y/BRS
         wPdpqPBWx8M1IHAzW6mS9vIoc2CQiF+ucfkib83cHTKpNnKHghS7qD8o6uLpvKHCbH5i
         d5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUAcGPEKCFMfG6LV+oOF73w3LZ+3AIGKiZf3E5Qzo4WAP3WTeyo++LCaRI2vhRLhoBVoFEbp84pkM9L0Ss89g==@vger.kernel.org, AJvYcCVmTsn4cbrkreIzGJjNHGuTQ1qytPbfTp8UVnQ+w3l58Hgyp/RQ7o+MJCzUmw5Ox5d0YHbuNyJDq7r4@vger.kernel.org, AJvYcCWFBVx/KdNh3JyAZM+hnyqR8Gf2C0G4RmG8M85qZjMdxgSO9PwUrMnNmuqWyDE5W3aFXnQLm+buDaWpmvo=@vger.kernel.org, AJvYcCXK1mQIthkT3xD+eAh6nNT1HF/WcIpMaAjR9ZVEGeyYUgbey97m8iaA4hfqIHaBb9DQMmBVZN4S9nSJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfx8REioceALkqWvvA2XbRWwe3cB4MjSFGJGFPqx1JdV5cYqVz
	zS/JHNBehokDX3Mj9FOECSp7vEvZ5/oKRH3BDAlLXP4iFPA3XNk4
X-Gm-Gg: ASbGncsnC3x34aghyxcV8usYR+79rG7zFSDqyp1pC72WkfJiiCe7DqSM/FQHVSMsXt4
	OZWeOjmcO8LmDc4s0B7x7tcObxwAtKfl74pPFIGVB8whiadNb6US+BM2KVeTQliiwCw0PEBa+lm
	1AjDr62icvOsN3imSrBQscaFEKdOHDnM37R9lti5JnEWKRcSmebDbwqq5Fxc+1oIswi22CHgjTc
	cOZ9x6OvZQKrk/WYE8b0d3yKoV1I04SG1vFeSRjZGda
X-Google-Smtp-Source: AGHT+IGnLLpyZCuEg0pqJ311+yDQplg1f+LNm4Cj153Us2EyDvB5emkRG3xn/iF0kl9t7QhMyMUsSg==
X-Received: by 2002:a05:6e02:1a83:b0:3a7:7ec0:a3dc with SMTP id e9e14a558f8ab-3bad384bea9mr14518105ab.14.1734388234328;
        Mon, 16 Dec 2024 14:30:34 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::d916])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3b248228cb3sm17990695ab.22.2024.12.16.14.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 14:30:32 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v8 0/5] Add SDM670 camera subsystem
Date: Mon, 16 Dec 2024 17:30:21 -0500
Message-ID: <20241216223019.70155-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the camera subsystem on the Snapdragon 670.

Changes since v7 (20241210233534.614520-7-mailingradian@gmail.com):
- move regulators to CSIPHY blocks (3/5)
- move clocks before interrupts (2/5, 5/5)
- sort clocks alphanumerically (2/5, 5/5)
- rename example node to generic node name (2/5)

Changes since v6 (20241011023724.614584-7-mailingradian@gmail.com):
- set unit address in node name to first address in regs (2/5, 5/5)

Changes since v5 (20241001023520.547271-9-mailingradian@gmail.com):
- sort reg and reg-names alphabetically (2/5, 5/5)
- drop CCI I2C patches since they are applied (formerly 2/7, 3/7)

Changes since v4 (20240904020448.52035-9-mailingradian@gmail.com):
- change camss interrupts to rising edge in dts (7/7)
- change IRQs to rising edge in camss dt-bindings example (4/7)
- move gcc and ahb clocks in camss dt-bindings example (4/7)
- add reviewed-by for camcc dt-bindings patch (1/7)

Changes since v3 (20240819221051.31489-7-mailingradian@gmail.com):
- add specific sdm670 compatible for camcc to dt schema and dts (1/7, 6/7)
- pick up patch from Bryan for CCI driver (3/7)
- stop assigning CCI frequency in dts (7/7)
- add maxItems for sdm670 cci clocks (2/7)
- remove empty line at top of camss dt schema (4/7)
- move regs and reg-names up in camss dt schema (4/7)
- move gcc and ahb clocks up in dts and dt schema (4/7, 7/7)
- add reviewed-by from Vladimir for CCI dt-bindings patch (2/7)
- add reviewed-by from Bryan for dts patch (7/7)
- add reviewed-by from Krzysztof for camss dt-bindings patch (4/7)
- add rewiew tags for camss driver patch (5/7)

Changes since v2 (20240813230037.84004-8-mailingradian@gmail.com):
- drop unnecessary assigned AXI clock frequency (5/5)
- drop src clocks from cci (5/5)
- add unit name, remove mmio properties from port in example dts (2/5)
- correct the reg-names order (2/5)
- add parent_dev_ops to csid (3/5)
- remove CSID clocks from VFE (3/5)
- remove AXI clock from CSIPHY (3/5)
- change subsystem part of the commit message summary (3/5)
- add reviewed-by (4/5)

Changes since v1 (20240806224219.71623-7-mailingradian@gmail.com):
- define dedicated resource structs/arrays for sdm670 (3/5)
- separate camcc device tree node into its own patch (4/5)
- specify correct dual license (2/5)
- add include directives in dt-bindings camss example (2/5)
- remove src clocks from dt-bindings (2/5)
- remove src clocks from dtsi (5/5)
- add power-domain-names to camss (5/5)
- specify power domain names (3/5)
- restrict cci-i2c clocks (1/5)
- populate a commit message with hw info (2/5)
- reword commit message (3/5)

Richard Acayan (5):
  dt-bindings: clock: qcom,sdm845-camcc: add sdm670 compatible
  dt-bindings: media: camss: Add qcom,sdm670-camss
  media: qcom: camss: add support for SDM670 camss
  arm64: dts: qcom: sdm670: add camcc
  arm64: dts: qcom: sdm670: add camss and cci

 .../bindings/clock/qcom,sdm845-camcc.yaml     |   6 +-
 .../bindings/media/qcom,sdm670-camss.yaml     | 318 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 195 +++++++++++
 drivers/media/platform/qcom/camss/camss.c     | 191 +++++++++++
 4 files changed, 709 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

-- 
2.47.1


