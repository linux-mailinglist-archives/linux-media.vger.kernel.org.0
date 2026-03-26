Return-Path: <linux-media+bounces-57097-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPfNJFuGxGl50AQAu9opvQ
	(envelope-from <linux-media+bounces-57097-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:05:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCEF32DBB9
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 421733038A44
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 01:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFD02F531F;
	Thu, 26 Mar 2026 01:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R5BaxNvF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFCE1D514E
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 01:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774487066; cv=none; b=A5UGtTfDlr0Ar1a3hHw0FqaU6yVApJnXus1zfn8WPsgzcO+8N1Mz308lDzv0NDEbK1+5fKYuwoKDlrNnRrv1CuiYBCLWOZW9ya4/bSVkcb3k7TdX5m2kyxpsvyPX+HqIKUDwUVFvDN63gIFXEwK5nbbXkDqIb312AeK2zwb7LhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774487066; c=relaxed/simple;
	bh=YvDTDmQnhx3vxUiunxT+fQW6fD6S0rofG4JhusvgMgE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JvKrs3r+ZCmTgh9sA+nzB1I3Zr/NQRENc82rifGcKBMxTlS1BhTfU7A+ngu6W5FSp1cGkNmBbaohAzgyGGrAnXIR3M6ed57IVHNp+jZIZLgSHHFuy86AvJwRCxZ2fnC0ooztX/37581z79aJw7KRNC/xphsFkQ17KHcov/RjA/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R5BaxNvF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fb439299so3990215e9.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 18:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774487062; x=1775091862; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RzOhGMXA3iY/y3X8z63jsZGinmq1HuIC9LpaciptV1w=;
        b=R5BaxNvFNocThNB7s81yXDIv87waXGroF1k4KPCRFbM5zy5nlEtOpS+sIDWAQlN8HC
         MhhiCotpj7+E5EQau/tjS26V1O1/gsZV4UsRNd5PSMC5cUt1IY200w24URjsxs7m6umW
         pOUpI4fbWWkFIChuAjqk1YXPfRGjPsLAG/ioBmc0tCuHNffIi7LSHTbRLhlx6hbgdYD8
         kTJ4h2RZBVZkRKsvIGIVTmONKhDpVZPFvynPmRLC9bJ51S6qs+RLBctljz9OpAY7m2AO
         PsD/tMde19UUz8PcRNMHkEi2LGGYENXe/lwkpGRzU4x+TY76FTVsnbpke5oTOAy6n+Bq
         V+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774487062; x=1775091862;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzOhGMXA3iY/y3X8z63jsZGinmq1HuIC9LpaciptV1w=;
        b=F1DKWwRWWoFnJHdb75J8buaVkktR8bBMERQh0c7E+uBecVtaGZGHQwMBSJVsJsVH/j
         JMksTTa3V163ZGQBsd8V4jdwwnE3Sa0dnVVytM+ommx8Mq/TavXHAr3B9e80vvVP6hyT
         Ukkl6g4/49j7Kzu8Q6lqonZdYPqa5EMGccGWc1+1DQ3zS9eXR14xBKTEM3AQPqMI3uT2
         CJTxy7/XSSMleqsmUAQrVELBNbU/fGVa2F/J3HzV3bOPNtPxqlbTAxNExKlBREyddIFW
         JwYE0aGR/dZ7EnNAsHsUUQXgn4umfW4+L2BgWGWZmyfoLssFkNvTlE6a1hzSZ4aRzHNc
         3rjw==
X-Forwarded-Encrypted: i=1; AJvYcCVDRksYTHNM4ImIWjWYEZjcZos/sVXjTfgnkSUYIVDinzTOBUO1o02N76Vp70zy2A94gAHP8SyxAga/8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsNnceUAO6udRl2Iegii7lg24g+QbuNdCJ7PzSQLw3FvLrtNT/
	nI7D1hb0AeyuslGkcPWxqVzfueT2sU7qO3P2RLC5AbNGzBYh+SumP266umGv3kaWSH8=
X-Gm-Gg: ATEYQzx+M5QbBFy1YG2NFJLVdNpnnW3j96PgZq3d/cIwgd/2/J1aDYLhxcyqYRgjtgL
	qv/Em5ayj7715fVwvgUCuQ5AKlXUABQBpdz3e8CqsNssz6MzKhMwAHLS+N0NLWJOeiARCNU+4cw
	wIisHWr9Lgplnjqxe1LwYwklv4folnUNI5oirJIDCvb79hsdim9VsOVFSLKwXxE1UilHAxC7O/q
	Q78SNhU/rnjLJ+6A8qcf+ZTDudwnO1vAURbwJRJYNcjaZ0+V7AuKv6HhmFvb8+3MxO3crFTafZn
	rvm6+/grCGls30+Pkt/n4uNOznsA8fpT6qn+mDXGyW0DqKv+8qXoIMNzedxEnKYlIumWZg5uGjG
	krfwqyoHLFe+LHX7rzj22xfZYpJmRwyeYzJdriH3iI/pfrDAkW3+KcQsC4gIby7OvY9oLtXpW0w
	/MVk+pzI6/Q3zeHcxm1N/hEgQrcxlapnQlZ/ZW8wsg72G+9Q==
X-Received: by 2002:a05:600d:486:20b0:487:386:3714 with SMTP id 5b1f17b1804b1-48716043919mr61187515e9.17.1774487061774;
        Wed, 25 Mar 2026 18:04:21 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711701804sm168552605e9.4.2026.03.25.18.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:04:21 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Date: Thu, 26 Mar 2026 01:04:42 +0000
Message-Id: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqGxGkC/3XNzarCMBCG4VuRrE9kZvLXuvI+xEXSjjZwaCWRo
 kjv3VQQteLyG3jeuYnMKXIWm9VNJB5jjkNfhvlbiabz/ZFlbMsWBGTAIcgLsmxyJHnqrvJgtdL
 BGmyVF4WcEh/i5ZHb7cvuYj4P6fqojzhff4RGlCCd9k0IJqClsP2PvU/DekhHMZdGemoLRGaha
 dbOWG6DdezrL63etV1oVTQiW6icqTXCl9YvrXD5WxddQwM1gaqqqv3Q0zTdAbIht89jAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7525;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=YvDTDmQnhx3vxUiunxT+fQW6fD6S0rofG4JhusvgMgE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIY0jpv66iOlcbst+c4xGWuCZvY5ts71aRyRo
 qoA028nBq+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSGNAAKCRAicTuzoY3I
 OkaID/4xLxYb90R6pASE02+jN9+VwdDsc8oROxx9WO62OPmPYegwdYZOHAhLSQSKuN6OGjmXCuy
 C16ZsNo/jlNj3Sfd7dc598lbYPzmkMuDphHmaQ/3K6MtN7vcjV3OJffWCLO02xZ+ToU29wHvTuP
 UwNBmprxVyl8yHnjWpm/Pe/sCiiNt4dnheEwcVYe6XL2YiaIqXvq05TMdURQ3KohX7jdKTGhYA6
 nNCUx7siTUfnYUM9r7spyruv1uGSoHgOBtqDVGzlM5/Qr7PUntCLiItsLIkYHbOpxBxIMZA9wiO
 ERcVHXt0uDhWZzhxzahL4hhfZEvydh4W0+k97/1jX9+a0ColLkOdLASAOl1jTxJIVygdwCx0VF3
 r5O+oYETOVg8JfB2fyFvTeo0AAKMcqDGomilGggkkngdxOutk//y2y/HiqMZ5wrEs6HATKrVKoo
 K/LRFpLp6k2PPR03Ti/BqKi8+6p0XpCB8BakIMPH3V9Wm8LULm7NXhi2exud8s4moMY4FHNNuQI
 5yVL1vsP6OS7OD9+knGyIV6yFh19fyGKNe7eNdY0zXFpO8cYroRaQA+u2DUxKpY2unv8teaQ81Z
 Iujj45j7AoLsJq0EklGIClW5AQAXyqKMKGvU+3KUq5U4yRDOroe1EJvqVEuS7RPFLX0EFSkonm2
 MfG74fcBpp+TBgg==
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
	TAGGED_FROM(0.00)[bounces-57097-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[codelinaro.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 0DCEF32DBB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 130 ++++++++
 MAINTAINERS                                        |  11 +
 drivers/phy/qualcomm/Kconfig                       |  13 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 361 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 298 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  95 ++++++
 include/dt-bindings/phy/phy-qcom-mipi-csi2.h       |  15 +
 8 files changed, 928 insertions(+)
---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20250710-x1e-csi2-phy-f6434b651d3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


