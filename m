Return-Path: <linux-media+bounces-55821-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB2FEzBGt2m/PAEAu9opvQ
	(envelope-from <linux-media+bounces-55821-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 00:52:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E7B2930B2
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 00:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA0B930180BC
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2026 23:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE09226CFE;
	Sun, 15 Mar 2026 23:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lSAcQIUx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CA0223DD6
	for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 23:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773618724; cv=none; b=iUQFj76DA+2t3DxZeEEkygK3Y22uOilh9L09jFkSPDjTwxzsww9VWu+IYuqhCjvt/XMUR9q+oB36cUGOv7V9NY+slub4m2ijKqz+I6JI1z4k4x2nPdC2IMEbzZGdSJJWhbMc/Pis90/7CfLwBjxtnhrgBloXkVLjxp6mDO2Ato4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773618724; c=relaxed/simple;
	bh=sMMbQEiUeWf+kDDlhoTkTh5kwD/XswPnWe+ZNrnBHTc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=etr7TeXf0t25zuT86RDSRVAUibI1eFGgC0G/QekrBhyU6eb+mWcWddp86dIjPDi+EIbufpIoO0w89Jae1BMuVW+3zAe81mvCRbkaBJPkHe1is5CwivrHfqOgCuhKsatcztuxGutWGiaRj4xaE5I9gXa0ldgO5nxP15y66NvTwAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lSAcQIUx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48534237460so44174995e9.3
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 16:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773618722; x=1774223522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CeAP1oP3Dnt8GZq/o666y9/izbW8uVxcaynApzkMhWk=;
        b=lSAcQIUxUfA1FyF7Q1gfqZe3TEUGLORQWcZB8jThZbUlrTZgR1eu03w54ecVmnlKBD
         C/jEMpuOJ7W+WA6CAWNtehBSvIGcw6YZCBBgwE1Tyy45/Uq+9hVW0YSmA6ecIlQhTnqy
         VEygoskgqZsIO4JHk5y1mS0UYTchDjyumTaNahN6WczYKiheN/KSkjtyzzSuxIlVl2Jh
         Kya2ZhqalUQpmDmUIywv+i3mdNX7Ri547OZWeYQS3YXTqMNyZEig3lA1Vo//Jovj2wHK
         7OW9dXfcG/5urUyp+IGTuv92dpu9lhf6g/Xf1JD7uZLYKFXEcIL9mRH2bt+AT+TgQtCl
         a73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773618722; x=1774223522;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeAP1oP3Dnt8GZq/o666y9/izbW8uVxcaynApzkMhWk=;
        b=kyjxKhhzFFjH/6CQEGcgjXuAtdE6p7FGw0S5qoWpZ8pmobBkuKLUWtqle1oUK5St0E
         bXnm1dj8LerKcxjr6JQX1tMDNPKidcoGd5SB+bvHJwnD4srQ6EQIZjuu8c19xoiefEo0
         RIbR5bkAtA08JnObccBtEhCO+M3V3Uzb56sj7Mp/SfzSP/FAOrNXBUop8q7p1v2vWRCV
         Q2V2jtpmVkcdcyDR6h0euDMxtY9s4xTJwkRWKLqeUTjHTm6ZGaTjStNRXPXL0x/Pn5k1
         6WGztqQlFRsojFouDhmTDk0728KfZ9vzuo/1JBv425VzpTCP1focxdQ2ArDCAssiUHX1
         +vbg==
X-Forwarded-Encrypted: i=1; AJvYcCXmaS3TgHb/suCoshfSR7uXoDpj7Lzg5etv1A0ve7XKMc77N3ldc3LFlqnJlkPy1mvihiRzn/LjzU+a7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YznAK1Nb0KlMkDde7BO3/ETgTntxxqeEAiTLZ8k4ZI2tJKjUixq
	TsVa1mES+/RwweXMqSX8eQAD4v4odO7tnLhxDy+hkJlIkp6tJpXX3OQQnekFQSup9H0=
X-Gm-Gg: ATEYQzxUXXKq3W0JVGejJd0jQRLw1/ZHkR6Kxt/ibVMGyzSx/MPGoJaDR9/jzk89N1S
	jUP0aRmc9H0Mkwhj/pYIcam2EIk60Vfw+01e2wu+YOy0DT53CA1cunNgpHRXuaGhHO89My/82sa
	EdEGbXskrS/GuFcSBSdj00rE+N/HoE9WU8ayi8iKBCAQ7JIoyl7Xt5+Swl3xzL88kgGEoAIytW+
	oUWi6wubjfNRicqeGXmxnrapbfe7lDMB8Ux7AmSk8ZH5jk3vSgdK+KsHsjeQdB12LaEEYI8eCXS
	VI2NNrBHLMc/X3NK1i1RCmXkZmsbyRxtJBzog38rRhzlQ6VQwhL5ubIAj8RPsJQzingbETNjhCE
	lGTxjDM8VJod055/fq6AZ8mRK639U3FvBZtk9DSypADbEVSesg1vt5SzX8viCkP89kTECGPKdNd
	VcppqrknBohPX+M7TvhkB/q5lrb0edAcc+wE0=
X-Received: by 2002:a05:600c:8b72:b0:485:3c2d:d02b with SMTP id 5b1f17b1804b1-485566f7a1bmr168448495e9.22.1773618721582;
        Sun, 15 Mar 2026 16:52:01 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm38233082f8f.20.2026.03.15.16.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 16:52:00 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Date: Sun, 15 Mar 2026 23:52:05 +0000
Message-Id: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACVGt2kC/3XM3QqCMBjG8VuRHbfYu8/qqPuIDjZ91UGobDEU8
 d6bQlBGh88Dv/9MIgaPkVyKmQRMPvq+y0MeClK2tmuQ+ipvwhlXzACjIyAto+d0aCdaaymk0wo
 qYUkmQ8Daj1vuds+79fHZh2mrJ1jfP6EElFEjbemccqC5uz58Z0N/7END1lLib60Z52qn+aqN0
 lg5bdCef7T41HqnRdYAqNnJqLME9qWXZXkBiH9GFyUBAAA=
X-Change-ID: 20250710-x1e-csi2-phy-f6434b651d3a
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6513;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=sMMbQEiUeWf+kDDlhoTkTh5kwD/XswPnWe+ZNrnBHTc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt0YnD2CZhIxL5ri2NHRVe2dtspeGez/CD6B4A
 FkX+F4xz+CJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdGJwAKCRAicTuzoY3I
 OnhFD/9c897WAlC1Ggfrv6XTwPfftsSynyU/kXgUm0Xl83AOAUrc5O4gC4bwlYtseFiUD64kqtf
 FW4QJgbx968EfZR82DhHgIojGU4WQsfrXfT0VuKzmYqGBpSQkjrzo3afGrzMRcEONg0JULz5d5v
 TiEAgjvJR0/nethpfExOItB4nSj9IrlyLzRp6+zN4A0lgvhe9mpUP/G34h1TjJMY817AjN0B7So
 KcvSYBjE1B19xS8zpxijdz+5n+FbeDnv0Ny5k/S+9+ePUXlvs3k+8+QKEvfMD0WV5J1XJy7bYRu
 qJxx6chxqWawgM8iT/3NplLl4f519B4a6u+rtBNq4jshxUEbzmbPuj0u3CExx8epfj/YgVL7aJe
 Ed2xN2FosVFYgzvqHqmfxilcG8jZSEuYje5QJp9x3IFvtbdhlbeoJG+Ji75/DgLG4ljOz7JYAAR
 xYGnH2lKBhvAIs4N0YucJMNvt8GZb1++gDfAR2e4Tpj41ZJfF0BiwJ55xDfr2yv1Yu4Wv0pTOoy
 pVs1iqQ5W1EzJTQl9Klf7ZmMB0T4imRgaknDjIJFky0KmZZwx/1uQmKF4bIPXQ/Ry416THX85iR
 urE0BtFlAQuFZCv4VPHnty1hcUt/IdcLbTRYqTs1DA8HhjIXwy511L79n4HKiOHXoWRQIKUiXKi
 M6DySzzJY2OxGsA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-55821-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4E7B2930B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

v4:
- MMCX, MCX and MX/MXA power-domains added - Dmitry, Vijay, Konrad
- power-domain-names added as required - bod
- opp-tables amended to capture RPMHPD deps - Dmitry, Vijay
- Switched to dev_pm_opp_set_rate, dev_pm_domain_attach_by_name etc
  dropped inherited CAMSS code - Dmitry
- Amended parameters structure to specify power-domain name list - bod
- Removed dead defines - Dmitry
- Noted in CSIPHY commit log intention to rework patterns of
  PHY lane configs into loops/defines/bit-fields later - Dmitry, bod
- Lowercase hex throughout - Dmitry
- The yaml and code in this driver doesn't care if the node is a
  sibling or a sub-node of CAMSS confirmed to work both ways - Dmitry, bod
- Link to v3: https://lore.kernel.org/r/20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org

v3:

- Resending this to make clear this submission is additive to x1e/Hamoa
  The existing bindings and code will continue to work 
  Bindings are added only, nothing is subtracted from existing ABI.
- Link to v2: https://lore.kernel.org/r/20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org

v2:

In this updated version

- Added operating-point support
  The csiphy clock sets the OPP prior to setting the rate
  for csiphy and csiphy_timer - Konrad

- Combo mode
  Combo mode in CAMSS yaml has been added. Right now
  no code has been changed in the PHY driver to support it as
  I don't have hardware to test. In principle though it can
  be supported. - Vladimir

- CSIPHY init sequences
  I left these as their "magic number formats". With my diminished
  status as a non-qcom VPN person - I can no longer see what the bits
  map to. Moreover this is the situation any non-VPN community member
  will be in when submitting CSIPHY sequences derived from downstream.

  I think it is perfectly reasonable to take public CSIPHY init sequences
  as magic numbers. If someone with bit-level access wants to enumerate
  the bits that's fine but, it shouldn't gate in the interim. - Konrad/bod

- Sensor endpoints
  I've stuck to the format used by every other CSIPHY in upstream.
  Sensor endpoints hit the CAMSS/CSID endpoint not a endpoint in the PHY.
  Given the proposed changes to CAMSS though to support "combo mode" I
  think this should achieve the same outcome - multiple sensors on the one
  PHY without introducing endpoints into the PHY that no other CSIPHY in
  upstream currently has.

- Bitmask of enabled lanes
  Work needs to be done in the v4l2 layer to really support this.
  I propose making a separate series dedicated to non-linear bit
  interpretation after merging this so as to contain the scope of the
  series to something more bite (byte haha) sized. - Konrad/bod

- Link to v1: https://lore.kernel.org/r/20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org

v1:
This short series adds a CSI2 MIPI PHY driver, initially supporting D-PHY
mode. The core logic and init sequences come directly from CAMSS and are
working on at least five separate x1e devices.

The rationale to instantiate CSI2 PHYs as standalone devices instead of as
sub-nodes of CAMSS is as follows.

1. Precedence
   CAMSS has a dedicated I2C bus called CCI Camera Control Interface.
   We model this controller as its own separate device in devicetree.
   This makes sense and CCI/I2C is a well defined bus type already modelled
   in Linux.

   MIPI CSI2 PHY devices similarly fit into a well defined separate
   bus/device structure.

   Contrast to another CAMSS component such as VFE, CSID or TPG these
   components only interact with other CAMSS inputs/outputs unlike CSIPHY
   which interacts with non-SoC components.

2. Hardware pinouts and rails
   The CSI2 PHY has its own data/clock lanes out from the SoC and indeed
   has its own incoming power-rails.

3. Other devicetree schemas
   There are several examples throughout the kernel of CSI PHYs modeled as
   standalone devices which one assumes follows the same reasoning as given
   above.

I've been working on this on-and-off since the end of April:
Link: https://lore.kernel.org/linux-media/c5cf0155-f839-4db9-b865-d39b56bb1e0a@linaro.org

There is another proposal to have the PHYs be subdevices of CAMSS but, I
believe we should go with a "full fat" PHY to match best practices in
drivers/phy/qualcomm/*.

Using the standard PHY API and the parameter passing that goes with it
allows us to move away from custom interfaces in CAMSS and to conform more
clearly to established PHY paradigms such as the QMP combo PHY.

Looking at existing compat strings I settled on
"qcom,x1e80100-mipi-csi2-combo-phy" deliberately omitting reference to the
fact the PHY is built on a four nano-meter process node, which seems to
match recent submissions to QMP PHY.

My first pass at this driver included support for the old two phase
devices:

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/a504c28d109296c93470340cfe7281231f573bcb#b6e59ed7db94c9da22e492bb03fcda6a4300983c

I realised that the device tree schema changes required to support a
comprehensive conversion of all CAMSS to this driver would be an
almost certainly be unacceptable ABI break or at the very least an enormous
amount of work and verification so I instead aimed to support just one new
SoC in the submission.

I've retained the callback indirections give us scope to add in another type of
future PHY including potentially adding in the 2PH later on.

This driver is tested and working on x1e/Hamoa and has been tested as not
breaking sc8280xp/Makena and sm8250/Kona.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
      phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 133 ++++++++
 MAINTAINERS                                        |  11 +
 drivers/phy/qualcomm/Kconfig                       |  13 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 364 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 289 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 101 ++++++
 7 files changed, 916 insertions(+)
---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20250710-x1e-csi2-phy-f6434b651d3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


