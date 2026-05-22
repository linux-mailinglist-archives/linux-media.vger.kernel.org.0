Return-Path: <linux-media+bounces-62625-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EICeOit3EGoZXgYAu9opvQ
	(envelope-from <linux-media+bounces-62625-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 17:32:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C485B6F2C
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 17:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D4F2306725D
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 14:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E264534A2;
	Fri, 22 May 2026 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uYjbNmHi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88819423A8A
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461119; cv=none; b=D/hhVOY/spowudMcsCsDHvzkLK1KNEXyM0UQ1HsOLQHP8j1h52HMxPpNP7eDsRiuZCejsAeJTydgYTAANIJLu5ToAK7tj3jBeYB+VF2QHGWn+rHvJwAr28a8GQBGeq5r8mNmPznGwYY+c9aM1GOD+c3AttjTXKwg62pgEaH0NMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461119; c=relaxed/simple;
	bh=ijE8FotOF1OqdoUIcI++flPFl387vF2gOuXqP/h5gUI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sS3dZUWne+4vqp56r5Jc4YAJwWkA/LhSa3xWnMwqJPY1Oay11CZjiZLk34ZsDJeIQcPvgrJL1Ju6hXgwxylUOrE4/9Mc6RTEcpneGdIo6uicMjBkQp6ppuE8DmSUvU9VA9dM5NvVVlj0stiD9DUVmqJ/Y4WmywuCY1BQOJxzDdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uYjbNmHi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4903cbfad68so12718715e9.0
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779461114; x=1780065914; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+UV8j+dbRgTzxiwmllf1AzhXJ6JlFchfzPu/b5u02Bc=;
        b=uYjbNmHiP+Dti1ycLzFm333gIkO3PoQFzHbF7na69XYhNvUxALI+fX9lisJdvZk7F4
         Vr9JiuVzjFdFeRmQntnv8IVkcw5+fI0E3adbSwHJiJCQ2wxdpsJtqm0dfQT2uWDjZD2q
         xcRKiyZaNzbjhJgcEFdR6vR9/v+s6S29Ty3DWuI+dwLFyKoQcvVNxLno8QyR9qZ+9Vcx
         oeCspfKNKzMeLUC2qlb39uDJWJPmWHLdGqGK0U+E9/aLPv5ZyYQCBN5s1PTcKf7do/EK
         oKNCiwqgsUoPmRZ5HWYGBQEU3k8S+avJT5BYlQEgIwFn5pGJJghm9y141afoe2lyEMqi
         hzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779461114; x=1780065914;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UV8j+dbRgTzxiwmllf1AzhXJ6JlFchfzPu/b5u02Bc=;
        b=Hxh/ufhQDS377VhIdymbjyQLctI9xLywvPM5vtB8lcptaZNwMUn6bZj3bA8BjBzS4M
         0vNXtsNgzGNhgH+2z7Ke2ECuSDuNZvCF5OG58W1MdxaV840zczjha89eh83VO3gQJ3kl
         eFZ53bInXm3LydrBYkUHcQRlJBklJ94QiDT6do3nJ4aVzjHdTMJO1/5TBUIK1MtU10KB
         UR+0a6KFcChiMVsUyd9O2h6ktzwQKhtCucmfRI1Fi8DS2xz1Mwe7G2SKDl/VzJA2Yhun
         eJXNciaXfffz5Pmv084xb+ARw6rQmbpOlYphffFLwZCaYY2aS7sor2L7iqdgvuT7p+5j
         YLEg==
X-Forwarded-Encrypted: i=1; AFNElJ9Up1wA6CYTLvbots/P/MvZAZO5Qyp6LMXt8JrjCwJaOJxgRRLnZZV2U4UVDklX3YQ3MKzShWbHaK2+zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnZa6wnwAn9Z00HhFj2lJCJx7si2DJG3m8CoyDueuCPm70dEsZ
	2pzKkGY4tamdNGsbxu4zPhBenbx5PJLuYHXbljb2NDmkCEqAFDCBhiDg8ADXWyejKJ4=
X-Gm-Gg: Acq92OGvT/s4KYZ34oCeNqgub5/lA+Mu8246AAvZvbHf7NdEkERCmr7LKyjiN2IrTLO
	+pH1Xc6wWg85I+ad4mRPjc+/ldWx9sprs2C7YLtXJkbKter3E50YrpFqa8emMStvOrQ5rPKtM0H
	XYFBFnu9mjOb4G7lG/6fK6m8bCJOgAdw4S5fkeT+/DVcBsAogbrmSsKvwTLcABSyxFByjK7YOtc
	u6G/jg/GlgdrTTV22TP7zicBDG+Vu3oiGOLFHPDExrw/Fgv4LNiJNWpYb3KqG30EonWVeY6ctI+
	nhtFauuvi0/MzRbVnSjFnAQoCW3vRqLFZ/3rQcZUH5e0tAXYN5fTsJgOpytsld5JxfiEduBi4NO
	2lgxeahBqYX55OwI7ZMh3iUGrYRXv/HjIpiCRxZFRBBDlL7xTV6hPqohLtkNyIGP9078eZvuQwp
	ZtZvKMcmUGS5GwQnMZIvW5HeBkNvHsO05ySRRfkwutOPZ/sw==
X-Received: by 2002:a05:600c:8599:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490426ade02mr36627145e9.15.1779461113724;
        Fri, 22 May 2026 07:45:13 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.110.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490469f61b0sm12216385e9.5.2026.05.22.07.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:45:12 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v7 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Date: Fri, 22 May 2026 15:45:08 +0100
Message-Id: <20260522-x1e-csi2-phy-v7-0-79cb1280fad6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPy2rDMBAF0F8JWldlZvSyu+p/lCz0ciwodpCKS
 Qj+98iBktSiyztw7pVurMScYmEfhxvLcUklzVMN5u3A/GinU+Qp1MwISIFB4BeM3JdE/Dxe+aC
 lkE4rDMKySs45DunyqPs61jym8jPn66N9we36T9GCHLiR1junHGpyn99psnl+n/OJbU0L/WoNR
 GqnadNG6RicNtH2jRavWu+0qBoxauiM6iVCo+VTC9xvy6p78NATiK7rQqPVi262VdUVD94MygO
 2/9ZPrQh3Wm/bwYjQu2AC/X35uq53gfYrDN8BAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9584;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ijE8FotOF1OqdoUIcI++flPFl387vF2gOuXqP/h5gUI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqEGv2hrOmLYutmEtdqQC/LdmNHHmL28VhI5lNZ
 oGlVEQzIcmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahBr9gAKCRAicTuzoY3I
 Or7ZD/0VoprNOc6Ld5d8FeBcrHkRmuBqUnqipAKv5sZ2t5yfWZGFF/9DBXmitRI74s2s/ULSKJE
 A4/omgt1OOHMHNchQSGvqCb2xshJdtfq7YL1Mvr+i4yhWHMTvx3kOeHIGAPg+H+RGe/ggFLPSaK
 5vfnyWC+yDnaCMvIwzIGxgJxWiKnNo7MWDPxtw0kIyr3e/nrrlV3TRVtfXrG8ow5wLrdOfUMNBu
 xpNn9JebkMKODF3cltbH8wlAMsiBlAhZW3RbycZ3EwG7W5WG6V2Y5cbJEsxEnrGB7ncypXXPk4O
 b19wdJGNxod++03pxpst1AoaU5iS1ENecnD2yRA68JSzW1fk6YzAHFLz1LowxdSCg5W1ZIRazcd
 MK/fW+DyCCyhpKroigiDFtepRBWq6rr8SYvDmbegpIIIh3gz/hxUIlAPY0sT8VlHAavlUsubqYX
 bIX49gZVJyRHWvA0tRHmAWJXKTw74jE3sJ5fH/uiBhsEqGxBwyJrHGrrV4aQvnmL+FhefrS7mAB
 BTCzR1tFszr4dGz2tKFbgH31ZePe8DoxlkF0wF8gC81XOAja868d56Hav+CwurLIJ+8/hpIbshH
 +l/TEbsUYf8Hyzku3Xn0C30KC96V5htuN715Q4lM/OGEIFOvDztVr8mrkoGPlfICvrD7nB5VDfw
 IH6Lab81wAtavOg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-62625-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,linaro.org:email,linaro.org:mid,linaro.org:dkim,0.0.0.1:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,0.0.0.0:email,codelinaro.org:url]
X-Rspamd-Queue-Id: 03C485B6F2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v7:
- Made CONFIG_PM a dependency. Sashiko commented on the pd_list being NULL
  and suggested I check the pointer but, we need to ramp the rails when
  switching clock rate so we need CONFIG_PM full stop. - Sashiko.ai, Bryan
- Added unwind operation for performance state error path - Sashiko
- Made clock-lanes genuinely optional for the supported use-case. - Sashiko
- Fixed the enable of lanes. Thus far we have had forever it seems
  val |= BIT(lane.pos * 2) which I've never looked at much because it
  has always worked. But looking at how to switch on polarities I realised
  the relevant register is a linear bitmask without gaps so the correct
  method is `val |= BIT(lane.pos)`.
  This needs an update in the legacy PHY too in another series - Bryan
- I opted not to do any of the "but if DT send junk into your driver" fixes
  from Sashiko since TBH I think the code would be Spaghetti afterwards.
  We trust DT and if DT is wrong we fix it, we don't try to graph its
  relative (in)sanity.
- Fixed my example in the yaml. Sashiko
- Link to v6: https://patch.msgid.link/20260521-x1e-csi2-phy-v6-0-9d73d9bd7d20@linaro.org

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

 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 208 +++++++++++
 MAINTAINERS                                        |  10 +
 drivers/phy/qualcomm/Kconfig                       |  14 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 371 ++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 386 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  95 +++++
 7 files changed, 1089 insertions(+)
---
base-commit: a1db83cc6f7e88a166c77d9060507ec01d617784
change-id: 20250710-x1e-csi2-phy-f6434b651d3a

Best regards,
--  
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


