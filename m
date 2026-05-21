Return-Path: <linux-media+bounces-62461-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJJzKfP5DmoSDwYAu9opvQ
	(envelope-from <linux-media+bounces-62461-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:26:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A485A4C1B
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5958230573D8
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E613CF963;
	Thu, 21 May 2026 12:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yDtoQuCe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC093CE48E
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366017; cv=none; b=YccE5ydQbRfkvsgYa9wCnIAQVHfnaFO4TZgcGmpTJdt+SL/HJXglst4nlq8DULAxZIWvJGNkxupEp7UT7nrd0dFaEQWomBz0DSaFZX6lsaBLfOaWvUMYeVWP38/BkqzvUzYPgmex8LBy2WD+dXLFU5IsK2Z/aJZQgY+hTtYOYT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366017; c=relaxed/simple;
	bh=7m/hWiQX3n2vc6JG/2EGJ6AyMvFiI1Zw9vnDHfoz3gE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aqjehlAPOcLMoN/n4B5RHp4anNTx/GTkJpZsssPxjdJH44UPOwybZlYVTmoFhkipdiiWu3eb8KL15uJo6cDM+bnq2CDfGaPoFZo6/ZJJnSibJMrqpVd5gC5MhOh68+g0m1V36+6bxlvxQ9sulB6yViGkeQyfbvgNQarVlZpEn1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yDtoQuCe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso79601795e9.1
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779366013; x=1779970813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDcsdkpl9E4U296Yjx3tUvOW5/YDiwW/HnNWSZqwZp4=;
        b=yDtoQuCeB2XMbBwTFPOavZ9yRwKEZsBFoGB51HMJQZCDBS83eJrSRlOgYa8rknaZPa
         XPl9kIyQ7LKJDrOe4fTSU78X7PKqfIcpUp/49biyKjhVZNZsQorMHO4a88xorhYnyS/8
         4MTk4AILYgBzGhEbP5uBUOszpJkjXzTevmxCMTAhicLLMFQ9jFicadXT/u5KC57yrGUg
         T8OthtRDphICX+V+FSGzbeKiKQY0N401Knk6nf0Hn1ku+7WWT/gnVF0lMnbfFAO7j0tL
         f7YlQPfP5MN7uZa2pis4tRzqq3G2Jhii0lErhM7Rbxt3A3Oo6PMWtmbnXJeO2sAx1AmU
         sRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779366013; x=1779970813;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDcsdkpl9E4U296Yjx3tUvOW5/YDiwW/HnNWSZqwZp4=;
        b=X6o88fdDMemSmiIZmuBB25ne53JewjPd2jN/Ycbci3Z2afM/A6T/9E5Ku5GOb79Ieu
         5n0udx7+vuUChyljYsPS20YPP+dfxlJt+E17PbQ3XXuIH/QXtU8jrttcPn2vkTs0uYwR
         7LDApSK9W9m4AvrYWejvOio3ptayCKk3PqsJmmiqKHLI/ZeBq+e0ngmaJCbcqwZJ4LiU
         FN6i4pVV4v9ROwFuK1KvPzvoXLrQOIsjTmhzyROaVmsGDfs8KgPfU0Gm1nr9g8LVjZGD
         DVX42eo/qHJa+a1qD3SJfLsCobNlG2qqRpJO2PlcXAKtkSbtfTBOWRJvKUHIHAVnn6+h
         mZLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+svHDIsXK70YWGNVyFgcM2GQJHbsVGB1OYC2/7kRBInnJywLoq+JKw6bI+oJ4OAaySHC6im0UTQtz4hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5WxQaKJ4nwOEN2LulMQtyxlxROeBoReaDd6dswMeQV6VdrXc7
	TEfRUsZqSEhsFB2QzwO1320pdnNbVlrwx78bMLRQ4ci6xS2X+Xwj+hsagvzzEYk4a2U=
X-Gm-Gg: Acq92OHtoVcDm2zJXEEhVw3xgr75R4QvM8P4HhkUZb/ANGtpTw8Wx0ng9J2mdhDBYDd
	FGvdQ/gtgl9T7+X2f+1FyPuLsfX5rjrsNgCdeogzCOCzQxnd0aibz/tBfLFUKufwuk/LbDyNOLa
	N+R0/vOF/kRkYL7T95FvhACnnUMqVkli3BUmfajnq5Whg0mFaQrkpxQxxDwcvANnF1SEBIs+NeC
	qNXrZdmCyqMKZsY8koA3OO8Esk5oLx5cDk/PvruuUe0zXp3EJItFFp7+wMFZdSezv0gFaJnC19M
	sc0zOk0ocnx9kgOls0KUR7cUqWaRkkmwA5df72tGYmTELr7jBGlYp6d28JnbiCp+9MSP8o+2xv6
	3tPBtSJsIckTRLcXOh2SRZU4JbYluIM+A4bj70H1ryog26VKus6MA8uZPWxhE1udAcHUVC+KyXh
	bHH8R2KyfdPfiZ2cg1mfXw+AWmwYtAik3mUQ==
X-Received: by 2002:a05:600c:444e:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490360dbb9emr35633075e9.27.1779366013106;
        Thu, 21 May 2026 05:20:13 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.55.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caf0967sm21981685e9.15.2026.05.21.05.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:20:12 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Date: Thu, 21 May 2026 13:20:07 +0100
Message-Id: <20260521-x1e-csi2-phy-v6-0-9d73d9bd7d20@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPTWrDMBAF4KsErasyM/qzs+o9QhaSPI4FxQ5SM
 QnBd68cKE1tunwD33vMQxTOiYs4Hh4i85xKmsYa7NtBxMGPF5apq1kQkAGHIG/IMpZE8jrcZW+
 10sEa7JQXlVwz9+n2rDudax5S+Zry/dk+43r9p2hGCdJpH0MwAS2Fj880+jy9T/ki1qaZfrQFI
 rPRtGpnLHfBOvbtTqtXbTdaVY3IFhpnWo2w0/pXK9xu66pbiNASqKZpup02L3q3baquuI+uNxH
 w79/LsnwD/tcHEqEBAAA=
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8422;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=7m/hWiQX3n2vc6JG/2EGJ6AyMvFiI1Zw9vnDHfoz3gE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqDvh5ZI6sA7CiwkIIDfK20VJXLVSaDnf25icWY
 5GzaWkxTi2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCag74eQAKCRAicTuzoY3I
 OkWbEACKe0h4DZNOHwJb3x+yMVSaxW8ZM6Umn+L/n5NWYoLwXv2VnrLTY1rcNb05fCBqFUxcwor
 187Z1CLx0AWyEQWVLEiD+oeztnFDXJo+bYOJCD4eCK46w57McWp2TaH/3d5HSo1rTyDh551Scmy
 O7T6B78k+Twnpuet9N+qQvb1AFmH2bqRmomus1XC4Sy85RA625d4Fe1I3JKYKJ7hqWIgTIm5Yyz
 lfPFrgrguZar5UaO0q4xSURgHLXmeGSCnAiLzxh69LSaqbtGqEYusfow1Y3K0FIwsVC8+qCWW8R
 ee6eMBoIm+d+tgUxK+SF1qSmFT93vwB7yKUMKefcmUc3JtRwqyDDXMlfS4zDa70oa3eEcqEObhi
 8j+mo5qNnZqiROkhQ9py57o+Rwgzykd6/6s9TPfgEn0ifvLpLA6omRgBt0Fpy5TXVaTbnHr56ce
 i7FWF5FnICfYio7OsJFPLtNJJ9xEGWMnJr077oWWMP1lv89luHDGSBP608fnIsef4RTqv+exsI4
 SYqUlb3/5k76Hvu/zugt2sDkWEbz/WTRakLdrYn3xSAD/JWI9O+cBjKjzITMIrmIY94WkR52p2F
 lRW8p814e1K4fRKECUdzfDXP1XhfOrolPTSlssTrWolVeALpRjNPZOjqs6KyQlYPE4J+6wyGj+q
 D9RrZWi4wodsO5g==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-62461-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,codelinaro.org:url,0.0.0.1:email,0.0.0.0:email,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 22A485A4C1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v6:
- Taking feedback from lively debate added ports and
  endpoints to the PHY - Neil, Vlad
- Detection of split mode by way of which ports are declared.
  port@0 is always a sensor input.
  port@1 is optional and if present implies split-mode
  port@2 is always the output. - Dmitry, Neil, Vlad.
- Split mode is left as -ENOTSUPP unless/until someone with the appropriate
  hardware can take on responsibility to drive to completion.
- Extending phy_config_opts dropped.
  I think this is a worthwhile extension but this series no longer depends
  on it so dropped. - Bryan
- MX/MXC.
  Two OPP tables one for CSIPHY0/1/2 scaling MXC one for CSIPHY4 keeping
  MXA at LOWSVS_D1 - to be implemented in DT not here. Taniya, Konrad, Bryan
- Changed MAINTAINERS from Supported to Maintained.
  Hobby time for me right now. - Bryan
- Link to v5: https://lore.kernel.org/r/20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org

v5:
- Adds support to apply passed parameters for clock/data position/polarity - Neil
- Drops GEN1/GEN2 differentiation this can be reconstituted if GEN1 ever
  gets supported in this driver - Dmitry
- Drops camnoc_axi, cpas_ahb - Konrad
- Renames csiphy->core csiphy_timer->timer - Konrad
- Renames rail from 0p8 to 0p9 schematics say  VDD_A_CSI_n_0P9 - Konrad
- TITAN_TOP_GDSC dropped - Konrad
- Passes PHY_QCOM_CSI2_MODE_{DPHY|CPHY|SPLIT_DPHY} with the controller
  selecting the mode. Only DPHY mode is supported but the method to pass
  CPHY or split-mode DPHY configuration is there.
  Since split-mode is a Qualcomm specific mode the PHY modes are defined in
  our binding instead of adding a new type to include/linux/phy/phy.h - bod
- Depends-on: https://lore.kernel.org/r/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org
- Link to v4: https://lore.kernel.org/r/20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org

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

 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 205 ++++++++++++
 MAINTAINERS                                        |  10 +
 drivers/phy/qualcomm/Kconfig                       |  13 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 361 ++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 368 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  94 ++++++
 7 files changed, 1056 insertions(+)
---
base-commit: a1db83cc6f7e88a166c77d9060507ec01d617784
change-id: 20250710-x1e-csi2-phy-f6434b651d3a

Best regards,
--  
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


