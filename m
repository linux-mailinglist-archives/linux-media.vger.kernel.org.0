Return-Path: <linux-media+bounces-25662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2BCA28305
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 04:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B9BD16380D
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 03:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0834A214220;
	Wed,  5 Feb 2025 03:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcEhfNlg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DE32139D7;
	Wed,  5 Feb 2025 03:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738727427; cv=none; b=XEnBlJCY0X616w9tRayBbrC8i9+LAfaVuAmkQSJWh9JYUw4nwwMDjB310o4qKnBKEwd8e1xSVXHtSLriUpa913s49DkcGeRH5nB6Pad23ch3bp4RCj+42jHyxxgCSeLMc4uG8TBneETLdGyUGtyh4qn4ktu4/IiWWFqHXYzvqAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738727427; c=relaxed/simple;
	bh=EpWQWjImqyRYqEcLnWSHB62PXoo8u9X+HQ45MLJGTQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLOCDEQGe4ZOr+4VmzFW+TK5xKuht0mfxRPgS6b+bf+vQy28ysQx9kn+1w7quSBXYglfUZuxJx2CNs+tWLeVv7iP10nL/ncF3viQeqgfzeYD1RenCunRrFA11sqAyJD4qL64NsufHA0XvA6sRHdew5ivepavHApJ7IowVpVp+ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcEhfNlg; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8f99cb0d9so51972586d6.0;
        Tue, 04 Feb 2025 19:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738727424; x=1739332224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oY/LRQrEONhpx7jV7tRjQrWKGlOM9UwhZOdagg+z6r4=;
        b=mcEhfNlgFEhijZJzcO3dkpeXJSXyD/gKYVtLNa6s5ACpN+o/aYd11hAqvaF/1EHZGY
         Oh0zd/52mnVWESJ15Dn/0kQLtmkqZXNQsEX6hoEpburpif0mwVCSpnPsn14D8mfWYTP2
         ZIqBMVZr/dsueqMyaXzjQmVO3EiqXeljV6Fbz0vihk1uJaoxF1N5hqEdAtL3iU4opBc0
         sPqFgeZQokhjkFjhLna+8bPmEX+KC3j7pEX4jsDNRI9GB/z9ipjpWuPLKyJHFbLoqL0E
         ADV7PzdTyltYjgnqjgKQa7TL+3ptYCvF6DQcS1HaLzfjLC1Y8fd3EBmJ/nvP7q2iY77V
         drjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738727424; x=1739332224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oY/LRQrEONhpx7jV7tRjQrWKGlOM9UwhZOdagg+z6r4=;
        b=oBXl06kFkPr3Or9D5X57R5xwgUmiK8rK5M2bnIhd3hhKmH5QoEbkJmkgOzv55tDzDr
         Py7f5LmP70DIflv9mKjXYWRgFzyrGk1agl9oXR9yyiG/w8xX4Kgfmvo628SH2+hIzPPd
         y2oV1w/B1eUprz+M+Dd4FJ69G9Tlsq0l1zYLrzpxoDugAR8bVD39/cex8Tx+/18nOrbM
         3QR6fSCBSH9VQ2wIVDjiFEBDgy7Tdm7DlOPfBLmQW7soq4kiUgXucBj6FNN66zEsXC2k
         92JYB1aX4lZSVHpVu+RnvaaGBF1i2sNKsxXPPUx3lbQzWHpwq6kccBsoNju7MyMRBuBW
         LMCg==
X-Forwarded-Encrypted: i=1; AJvYcCU3ldNMIyiFhl4YZp/eHuPq+k4n4p8tOoRI+BSGNyPkHAbvBZa+FlSw6J/3fPnIppJ0MVLWcFyAlpg3@vger.kernel.org, AJvYcCUEXmbECNEqKv7paJA52j5bheWwhXTVOZjafWVkRb4f6DIVj9tJx2OB1Rg+gE8EUVUvUSF4iAvrOH+fyOG92w==@vger.kernel.org, AJvYcCVyhqWh6NMmck5b3H3kjoqE4zKM588QtTenBHHzjUl/o87F93ckmB1UvQNaM9dwa+2noHNCOmf6idfq0gU=@vger.kernel.org, AJvYcCXdu/DJi1oJl0zZMyyGzpSrK6TXcFlMJynzioM+z/KHtqlwdHV/C6i51nAb3bZOgv+oZfJ4QdjoXEtx@vger.kernel.org
X-Gm-Message-State: AOJu0YzJsAXMbhYc/UDr8yAaP8cMduAwcf01ju1BmG096GlEabkz+ZJS
	0jZU7iWYFy9DYKYAaedUAFjeTMrJc5ua2Pb36MCgvWkIhsNB9dEZ
X-Gm-Gg: ASbGnctHmE93sDUJhVNI8f31F5cxyH25HEu4h84McEvSh+Z402MfvUl/btzbFt3Cl9f
	xLpiPQvAGp1wF4td8weZA4IttVHcW63Q6qaMjxwiUYRTxv0bjkAQXpJGTFDPy7lb8LRg6tMQ2OF
	5Yt/EaME5R/0P1U6hU2fpgreeI/J1ECyV8JlOMSVYJHuC8GorJwq8iyoPAmaaB2lHRBK3kUegV+
	+vg1x6wTMeT16z/wPlfesbp4k3yR6do9zz7+wR271hEzPgKvYYVSiVRV2HcYVzUPAG1wzv45jxE
	rZk=
X-Google-Smtp-Source: AGHT+IHGf3nij/gEdTKMxskmjbS80/KEflVLRuwNf0FDZLwPAgq1ExaaW7h92l/VxUwH73gxI0a3KA==
X-Received: by 2002:a05:6214:5085:b0:6d8:9677:fbe4 with SMTP id 6a1803df08f44-6e42fb0a9b0mr20303146d6.9.1738727424516;
        Tue, 04 Feb 2025 19:50:24 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::2692])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e2548141aasm69890786d6.28.2025.02.04.19.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 19:50:24 -0800 (PST)
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
Subject: [PATCH v10 0/3] Add SDM670 camera subsystem
Date: Tue,  4 Feb 2025 22:50:14 -0500
Message-ID: <20250205035013.206890-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the camera subsystem on the Snapdragon 670.

Changes since v9 (20241218231729.270137-7-mailingradian@gmail.com):
- add Reviewed-by from Bryan (2/3)
- drop applied camcc patches (previously 1/5, 5/5)
- rebase on media.git branch next and sdm670 dts patches

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

Richard Acayan (3):
  dt-bindings: media: camss: Add qcom,sdm670-camss
  media: qcom: camss: add support for SDM670 camss
  arm64: dts: qcom: sdm670: add camss and cci

 .../bindings/media/qcom,sdm670-camss.yaml     | 318 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 197 +++++++++++
 drivers/media/platform/qcom/camss/camss.c     | 191 +++++++++++
 3 files changed, 706 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

-- 
2.48.1


