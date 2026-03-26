Return-Path: <linux-media+bounces-57102-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K9EOsGLxGn50AQAu9opvQ
	(envelope-from <linux-media+bounces-57102-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:28:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E9C32DDB7
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C36F304209C
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 01:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A409A37BE7E;
	Thu, 26 Mar 2026 01:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IQCRZu9j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61CB31195C
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 01:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488487; cv=none; b=dqOWcErAfcMKneP9rDtlPDN8R2jJLOOWu463IA3qCp6rb5hz8dksBXZsWmZnHS2EhpsTLH3Kt3LKmt3xCue4WYa7Pc7a5UA8UUBm29nKwxQB+gTbJkqIzvpzq/fFdVlSg9erWN8DBr/hvKqLqns8SFlW962ZDsh5sQwoaaxW8E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488487; c=relaxed/simple;
	bh=6Gcu8+Ao4lstBbI18dMnWxkWILaWqmEG7wVURt2eRUY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dAqS6r57prEdiZw7kny2rvDHGb2bwHHPoy6TAWoNWg1zcZvQUaHCFISxABXwHm14J4GbCzgoPfuxL25tKT2jPb7LhowGLIXRjvaJc85dGVO4BSYzqzr1h+FeFG90/lH0Z8IMyXjTAA7HJt8tFxxPZTUzoYTyV+joAsSXtNIHDps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IQCRZu9j; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso295502f8f.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 18:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488482; x=1775093282; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wmh2eSNLdbGG4DbgCFQDaehdjKO6Qs7B6uRF+sCGrf8=;
        b=IQCRZu9jbjtvE9VhHIGEDyCNwgC7kcjdXPr9gVwEH3VwD1obFdRvrCxBfXNCKIn2Cl
         /beai+IgXBRQIzDQ4jZqmP+6QaCKVifrPj5d91BIg2G2ulXTp9RsUAt8o215y6GcmZxk
         OMahHORV9bUV5V8l8CPOYZS76QTnWWK3zHoelGey1kU7agf8Fplwj4ilYk/ndsJHS6e1
         FryP1gI5McvVpaSIqkjdFfVAj8d4INUr1ZmASf6J+jEDaywBiKOGVbTHyFWVTh+U0q90
         dhs0VroADbZCF1xHX8G9Upfyg+8PQ1+fbuNCiIJR7/Ci3IFqkXMTv/y3avm7ZCpA2zf3
         vpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488482; x=1775093282;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmh2eSNLdbGG4DbgCFQDaehdjKO6Qs7B6uRF+sCGrf8=;
        b=MPfFGxCkZmIq3kSDhB0oc9Rb8w1/fQIS9ZtViYxLaAkFI/WrKlQsamXE+gF7XrC0wi
         +ko2mzTOS6PhNg5W1i4NZa89fOzGu/UPbCeBCPdlp7rX6SVKeX6eTzTSVWRGRj4CY9NX
         /OvBpmMzOWHbhjiXZS2cpEKEgxlZ1ZfKeTqnFF47LXosaUGgr02kB1p0j4qUSFFz6+Cs
         yzpJnyT8m0Z+hIGEf1CaoCQqMH17dXTX2XyTzDzhBN/PssIR7LlHPiVVAbamlWbB+auo
         k96CJ4qdgnClDpILNUBWHuLRH9c0Wa7u3JotFuE0KVx1ufidGoAMS+qBMFpOkqwogSkB
         ZkOg==
X-Forwarded-Encrypted: i=1; AJvYcCXR6gxSTG7NdrVoD0kfdZNjuUdlkPqocY9Q+HdtYRL6uUmJG3S5v2/9CNPz56r5moqg0yX4V48y/iBkfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUWJPk4DqkWPoljAnWebX61XoPR6c8wobg5ZNqJjByEfQN8pkq
	qc0zE9uIR8pnt8aEl9hZ2qQuOGpL112NWrEO9QEuJhXTrH5pm4pO/oNrw2ss6DZ5a6w=
X-Gm-Gg: ATEYQzxx5M1P9EcBqgf/j/2dNrDU97HMcXZOJEnpOfCS0/7zjEVnAEoeHLYVRV9BAj1
	xkHyljg+jY9V+I7oOqI6m57GS2nmogbFTQ/l83thJ5Udgo+P+802FOMwoHfvP7GHyW1E9k/Oak3
	Hh2Wu//yr+plz4Jrem3e24tDL8Z0/RjVkFS+T5+X93sOrxNFbGFrL9iSYSnqoH6qCpIQk5budLi
	Jc5ZKOEeFlJVvYuFV3kqrjwjppm/wqnBEGBKfUBHThIICE4bT/0gdY91sTq7m9yVOArBE6TIu7I
	Nne0Pumhc34PEjlG5+Re/G4IjZYU8Z3fnfKKIVi4LO+o2q5D6D8CcRJPvVOEDyuhKW+JdcFuNCr
	dRF1gBwhEJh9zvKI/H+JmzuYuO2AAaxggMGApBoSbx/nlTujdjExcQ6OijTBjto0Fqk2Xp7UljD
	Ow5OrPmJ+5mFaiYiQA34D5vECLBzZl955M7aY=
X-Received: by 2002:a05:6000:2dca:b0:43b:4982:fc73 with SMTP id ffacd0b85a97d-43b88a050d7mr8671025f8f.25.1774488481970;
        Wed, 25 Mar 2026 18:28:01 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:01 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v11 0/7] Add dt-bindings and PHY updates for CAMSS on
 x1e80100 silicon
Date: Thu, 26 Mar 2026 01:28:28 +0000
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALyLxGkC/53Qy2rDMBAF0F8JWldFo7e66n+ULvRMBK0dJNe4B
 P97J4GSFK/cjWCu0LmDLqTnVnMnL4cLaXmuvY4DDgBPBxJPfjhmWhMGhDOumABBg6Qfdfha6JC
 XiXJFmaAYp6lXukC2DBij0X/2TkExXYwMIQlPEDy3XOpya3t7x/lU+zS271v5rK7pv2pmvKRW6
 ui8lk54+4ovfRufx3Yk155ZP9pyl63RzikGHksUwPnGNnfbAOyyDdosRJW85UVxvbHtr60ZR2q
 PbdF2SoERTgRcf2O7R1vvsh3aXrkoChMmsbCxgd1xAftwwD+hJZXsrMRDwh99XdcfEIwIibQCA
 AA=
X-Change-ID: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10647;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=6Gcu8+Ao4lstBbI18dMnWxkWILaWqmEG7wVURt2eRUY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIu/ORb48l6eTKKq0DG1OFcPy5am7AciOOwbw
 3HK+iEc8LuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLvwAKCRAicTuzoY3I
 Omk9D/91FuHDtHeAfI1PrOIZNntqd6V+3Ba2MTiAlrrn3CurAUe8dnqKEC1nuxZar6I17tOlI0E
 bM3vI+Txh0cZbxaiGgt7sBMK7pmxQzrNoKWUSvgVHnlgVcwG5BSbL8kUPdlRW2hJmN2/ByVuqhd
 Wed5jU+uA0ol51LGSGLUc//4XWQkg/H+2fqkf042+71ZgmZjnm9G6KrLYQ9PIRBd55W9kMLVYWr
 lDFX6hs7zeVWBXv2hgJ3DijwNe/08kSLFKYG9Kj4wpU0z3+OamqHGelgBmvE0L/Oic+RLtx8Gak
 E6sK6aef6J6kdOtzOicnXrQOYG/5RS5/8QohuEwLSuUq4MModxCvkH+YrOIAiL3kFmQSphKEuUf
 8Ob9YimyTt+x7QePCUC4/kTX8InOUjD+7twc8H2hzZ+ZaBstStaOM1WxWW2JjCF7K7AYhuB//vj
 XB5p+/zT43yE6yB41eM94Iuqv+M1QekJ3FLQQIiKf70aRb+a5i2m82jdkbXmyyrC9O9x6OHtG3+
 jcaOnQwjnvLetJQVNq+C3xB05tJxmKgIZcMKx0o+3f/rKDeAKdYUwllIapu5CefFE2f3qYmr2vE
 j9s9LZcWvec/E/4YZ0DaGoxUQ2MHlA3tL72Stk0vZk2K3GYORN0PfC03DqYB5/t0g8LFApAt4ct
 fiOXjmBSU2yoAHQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57102-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,someaddr:email,gitlab.com:url,codelinaro.org:url]
X-Rspamd-Queue-Id: 50E9C32DDB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v11:
- Dropped simple-mfd in dts for devm_of_platform_populate() - Krzysztof
- Pass polarity and position for data and clock lanes - bod
- Remove check for PHY_TYPE_DPHY - PHY driver validates its own mode - bod
- Depends-on: https://lore.kernel.org/r/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org
- Depends-on: https://lore.kernel.org/r/20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org
- Link to v10: https://lore.kernel.org/r/20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org

Changes in v10:
- compat simple-mfd added to CAMSS allows probing sub-nodes.
  The other way to do this would be simple-bus however, CAMSS
  is really a collection of devices in a block as opposed to a
  discoverable bus.
- csiphy nodes are sub-nodes of CAMSS.
  Sub-nodes as pointed out by Dmitry will allow us to show some love to
  older platforms.
- Depends-on: https://lore.kernel.org/r/20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org
- Link to v9: https://lore.kernel.org/r/20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org

v9:
- Adds phy handles as optional nodes
- Adds minItems: 5 for iommu entries
  I believe this should be acceptable as maxItems: 8 continues
  to be valid
- Makes CAMSS-level rails optional for x1e
  Similarly I think this should be OK as the legacy binding
  is still valid it is simply optional instead of mandatory now
- Supports CSIPHY nodes adjacent to CAMSS while leaving
  csiphy regs intact.
- Pushes dtsi drop to another series everything in this series
  can go through linux-media
- Depends-on: https://lore.kernel.org/r/20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org
- Link to v8: https://lore.kernel.org/r/20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org

v8:

- This version rebases on latest media-committers/next - bod
- Adds support for "combo-mode" PHYs in the YAML.
  It will be possible to build out the code to support this later - Vlad
- Maintains the upstream model of connecting sensors to CSI decoders.
  Every other upstream implementation does it this way so
  CAMSS will do it this way too.
- Reduces the number of IOMMU entires in CAMSS to those required for
  CSID, VFE/RDI/PIX respectively.
  Including all of the IOMMUs implies we will also "stuff" CAMSS
  with ever increasing lists of registers but a better approach
  is to have individual nodes for functional blocks.
  For example this series supports CSIPHy as a separate block
  CCI is already a separate block - and we will add ICP, BPS, IPE
  etc as additional standalone nodes.
  camss@someaddr {
        //existing bindings vfe, csid, csiphy go here
        iommus = <just what's needed for this>;
  };
  bps@some_other_address {
        iommus = <bps specific iommus>;
  }
  In particular this model will save us from going down the same
  path as the vpu which has ended up tripping over the total size
  an iommu entry may span.

  Nobody really likes the legacy binding much so instead of
  continuing to bludgeon more entries into it, I've conciously
  not included BPS, IPE, ICP etc.

Depends-on: https://lore.kernel.org/r/20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org
Link to v7: https://lore.kernel.org/r/20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org
Working tree: https://gitlab.com/Linaro/arm64-laptops/linux/-/tree/qcom-laptops-v6.19-rc8-camss?ref_type=heads

v7:

- Reimagine the PHYs as individual nodes.
  A v1 of the schmea and driver for the CSI PHY has been published with
  some review feedback from Rob Herring and Konrad Dybcio

  https://lore.kernel.org/r/20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org

  Both the clock name changes from Rob and OPP changes suggested by Konrad
  are _not_ yet present in this submission however stipulating to those
  changes, I think publishing this v7 of the CAMSS/DT changes is warranted.

  Its important to publish a whole view of changes for reviewers without
  necessarily munging everything together in one sprawling series.

  TL;DR I moved the PHY driver to its own series review comments there
  are not reflected here yet but "shouldn't" have a big impact here.

- Having separate nodes in the DT for the PHYS allows for switching on PHYs
  as we do for just about every other PHYs.
  &csiphyX {
      status = "okay";
  };

  We just list phys = <> in the core dtsi and enable the PHYs we want in
  the platform dts.

- The level of code change in CAMSS itself turns out to be quite small.
  Adding the PHY structure to the CSIPHY device
  Differentiating the existing camss.c -> camss-csiphy.c init functions
  A few new function pointers to facilitate parallel support of legacy
  and new PHY interfaces.

- A key goal of this updated series is both to introduce a new PHY method
  to CAMSS but to do it _only_ for a new SoC while taking care to ensure
  that legacy CAMSS-PHY and legacy DT ABI continues to work.

  This is a key point coming from the DT people which I've slowly imbibed
  and hopefully succeeded in implementing.

- In addition to the CRD both T14s and Slim7x are supported.
  I have the Inspirion14 working and the XPS but since we haven't landed
  the Inspirion upstream yet, I've chosen to hold off on the XPS too.

- There is another proposal on the list to make PHY devices as sub-devices

  I believe having those separate like most of our other PHYs
  is the more appropriate way to go.

  Similarly there is less code change to the CAMSS driver with this change.

  Finally I believe we should contine to have endpoints go from the sensor
  to CAMSS not the PHY as CAMSS' CSI decoder is the consumer of the data
  not the PHY.

- Working tree: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.16-rcX-dell-inspiron14-camss-ov02c10-ov02e10-audio-iris-phy-v3
- Link to v6: https://lore.kernel.org/r/20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org

v6:
- Removes 'A phandle to an OPP node describing' per Krzysztof's comment
  on patch #1
- Drops Fixes: from patch #1 - Krzysztof
- The ordering of opp description MXC and MMXC is kept as it matches the
  power-domain ordering - Krzysztof/bod
- Link to v5: https://lore.kernel.org/r/20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org

v5:
- Picks up a Fixes: that is a valid precursor for this series - Vlad
- Applies RB from Vlad
- Drops "cam" prefix in interconnect names - Krzysztof/Vlad
- Amends sorting of regs, clocks consistent with recent 8550 - Depeng/Vlad
- Link to v4: https://lore.kernel.org/r/20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org

v4:
- Applies RB from Konrad
- Adds the second CCI I2C bus to CCI commit log description.
  I previously considered leaving out the always on pins but, decided
  to include them in the end and forgot to align the commit log.
- Alphabetises the camcc.h included in the dtsi. - Vlad
- Link to v3: https://lore.kernel.org/r/20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org

v3:
- Fixes ordering of headers in dtsi - Vlad
- Changes camcc to always on - Vlad
- Applies RB as indicated - Krzysztof, Konrad
- Link to v2: https://lore.kernel.org/r/20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org

v2:

I've gone through each comment and implemented each suggestion since IMO
they were all good/correct comments.

Detail:

- Moves x1e80100 camcc to its own yaml - Krzysztof
- csid_wrapper comes first because it is the most relevant
  register set - configuring all CSID blocks subordinate to it - bod, Krzysztof
- Fixes missing commit log - Krz
- Updates to latest format established @ sc7280 - bod
- Includes CSID lite which I forgot to add @ v1 - Konrad, bod
- Replaces static ICC parameters with defines - Konrad
- Drops newlines between x and x-name - Konrad
- Drops redundant iommu extents - Konrad
- Leaves CAMERA_AHB_CLK as-is - Kronrad, Dmitry
  Link: https://lore.kernel.org/r/3f1a960f-062e-4c29-ae7d-126192f35a8b@oss.qualcomm.com
- Interrupt EDGE_RISING - Vladimir
- Implements suggested regulator names pending refactor to PHY API - Vladimir
- Drop slow_ahb_src clock - Vladimir

Link to v1:
https://lore.kernel.org/r/20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org

Working tree:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/x1e80100-6.13-rc3

v1:

This series adds dt-bindings and dtsi for CAMSS on x1e80100.

The primary difference between x1e80100 and other platforms is a new VFE
and CSID pair at version 680.

Some minor driver churn will be required to support outside of the new VFE
and CSID blocks but nothing too major.

The CAMCC in this silicon requires two, not one power-domain requiring
either this fix I've proposed here or something similar:

https://lore.kernel.org/linux-arm-msm/bad60452-41b3-42fb-acba-5b7226226d2d@linaro.org/T/#t

That doesn't gate adoption of the binding description though.

A working tree in progress can be found here:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.12-rc7+camss?ref_type=heads

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (7):
      dt-bindings: media: qcom,x1e80100-camss: Add optional PHY handle definitions
      dt-bindings: media: qcom,x1e80100-camss: Add support for combo-mode endpoints
      dt-bindings: media: qcom,x1e80100-camss: Describe iommu entries
      media: qcom: camss: Add support to populate sub-devices
      media: qcom: camss: Add legacy_phy flag to SoC definition structures
      media: qcom: camss: Add support for PHY API devices
      media: qcom: camss: Drop legacy PHY descriptions from x1e

 .../bindings/media/qcom,x1e80100-camss.yaml        | 128 ++++++++++++--
 drivers/media/platform/qcom/camss/Kconfig          |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   | 189 +++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   7 +
 drivers/media/platform/qcom/camss/camss.c          | 127 ++++++++------
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 374 insertions(+), 79 deletions(-)
---
base-commit: b11ac7d13db32d3a232e11b09491647179a2df5f
change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


