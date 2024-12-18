Return-Path: <linux-media+bounces-23736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 450049F70A2
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CBCC188952C
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4611FCF62;
	Wed, 18 Dec 2024 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLfs7cNd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE0E1990DD;
	Wed, 18 Dec 2024 23:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734563950; cv=none; b=pecyEJ/tEwM8cYePVVha+LR1tS8str3P06ZbMqLBXzGkML/Bh+BTdYuPXLdHTbfEx7poTY65wA4N0qrXMsFVK1mZG9nSblLWSw5D+CFJusbyIqcOc6By40RFCJEys1PWxI7drbitVHsGZvxwfUSP9SIOvlutAxD8p+NxDwcWbVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734563950; c=relaxed/simple;
	bh=5lWyqAKBQQzlKOxofYfBe/29egE0gMGHYLVeG0+gjtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BvhUNWiR3WAPMfLrOtmdULd7/107ZvhTTU/Kk3gbWrHX+ieY+xBxxOS/XTkJbdoAxdXtaXBJfhad0MBvUA6dx4h96mGne+xOfB1ypaPEIbcU8HtCqAPUomTnZj03bsfPWMRfZgbYnox7SljwABzXnHat73x3sf1xiQoJfmjHZaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLfs7cNd; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-844e394395aso6966039f.3;
        Wed, 18 Dec 2024 15:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734563948; x=1735168748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MFo10ymNX90KMAY4dEzEmsTfQjx2KhjHu16RVHSRHtk=;
        b=SLfs7cNdXmCV/P+/m20WAndCe5IPxgdxJ9mImtotfZ1NxIi7Iqr+dcBoOHITpXYiIL
         KeyH+ufxLM2GXsN6fs95iquycqFH0n+mo+0VhBPjCIrCDgKXTxwsgs7cGyUPmgKavHNX
         3h6YoiE0QpjrNEKALqU2ydt6OXGyEaC50RZIkt4DKUImTXfSa89eulI2jS6aVyK62HgU
         2g9pKzOwuZUoQe7323PVQf/zVdCjiOpqoPbLuiep5Cqcy+Iu0GS6wqw116hhtVlfn/6j
         9PCWOCWFH+EYcwCGlZEUzE6v0G9EVddA3Ro9hDMDJr5En0r27edV/e0F9QAcN4/hWNm1
         QLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734563948; x=1735168748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFo10ymNX90KMAY4dEzEmsTfQjx2KhjHu16RVHSRHtk=;
        b=K0+qOu5/P8nO+11028q+4Jmcf3Gq/1iSf3YVX2EVO0p653q6IxNWAejvtx5zAW50Y2
         N3MLRGX3CSOlceScw0d1vqcdVpBkUrV/Lnrt0ACoBtdbeisqCQ0AH83XqasXRakWXG7P
         gAudw2PRWPIp+U+UzXb6RFLqQvhPiPeHJbZP/zPwv0diIFXPFHTCviEuU9QIXM1r8wx/
         pYjHWMNuP1TqZCVusm3azzWTPYzy/VlQTr3d5O6OYEu5r2unSvddrmqv4JC+sQ0t8Ckm
         zgZWo9Y54RVwTx2epBGL9MlmBbZvfouht1Tbq9ipf1NwK1B2GBu5n7kwY9teufit1tQc
         euHA==
X-Forwarded-Encrypted: i=1; AJvYcCU++jke8mUIqkx2BJ88bp0YOh8owy9LqnlHN/0FnFaUUH06QgqoY5Rvcg1QdT0BrIMlLubEgCxoE2GcNGo=@vger.kernel.org, AJvYcCWlaUrLgim55FahyJaeZeBaMQJvfNhprusXokumfK6h9tmd+XisPWde6Ll+SqhOfviYr8kUXy1l0JsUMnqukQ==@vger.kernel.org, AJvYcCWrIUNk9UHSjUG4K7/GIjXqNMQ4/R/iRpI0s5SRaYsFeU7XHGKln6PUTRG+w8j37Ah9JnKToNnn/zrX@vger.kernel.org, AJvYcCX+iH8Nqicy6hjCuPaVaE3oGmWy2pfvPv9DtGf6JI48V5HAhcARXa0LWV6Ce/YkQPlb02VHWe8x0osN@vger.kernel.org
X-Gm-Message-State: AOJu0YzEjVwoRPRRutjABZeuVuSoRVzNR2aXFK9CsHJfYH53yEbZNulH
	qqiyPT7zQ5nchc7CTMnFdIIGBBj/TYViHt4sk7hdVjNnOD8eyq68
X-Gm-Gg: ASbGnctqcK5YXCFVy78NFlLk4DsiPhXJAvVhyDJCSoRf5BVGdTUZeF0mgggMXUdyr3U
	on+dxHUHKJiKWsoV+MryoxiRP3OP1lD1JL/UYtJBYJVCazbM1K+oVTFFJ+1s5/GwRqNdOGOU0nu
	gMjbJ5oLOraBTOJWv6LdROJlrShM/5DDN1KgPSHVXJY35YnFrFQr5dcZ2qoK0Bc4QPZYZjo2SpX
	7spQ80/RXQFkr11N6Zwi0fTFkBuMXobfl8gei/Tb/Q=
X-Google-Smtp-Source: AGHT+IGK5vDq1fleMJI88wDUTvnO1SOVNyKgGCsMr38TxFbxqyw1bonljbML+ZVRTH4iBiJOEDlZ8Q==
X-Received: by 2002:a05:6602:1486:b0:837:7f1a:40af with SMTP id ca18e2360f4ac-84987db6213mr166406939f.14.1734563948400;
        Wed, 18 Dec 2024 15:19:08 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::eca])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-844f628f18bsm257432439f.23.2024.12.18.15.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:19:07 -0800 (PST)
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
Subject: [PATCH v9 0/5] Add SDM670 camera subsystem
Date: Wed, 18 Dec 2024 18:17:30 -0500
Message-ID: <20241218231729.270137-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the camera subsystem on the Snapdragon 670.

Changes since v8 (20241216223019.70155-8-mailingradian@gmail.com):
- revert clocks before interrupts change from v8 (3/5, 5/5)
- pre-declare endpoint nodes in dtsi (5/5)
- rename camss node to isp@acb3000 (2/5, 5/5)
- add Reviewed-by from Krzysztof for camss dt-bindings patch (2/5)
- add Reviewed-by from Vladimir for camss dtsi patch (5/5)

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
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 207 ++++++++++++
 drivers/media/platform/qcom/camss/camss.c     | 191 +++++++++++
 4 files changed, 721 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

-- 
2.47.1


