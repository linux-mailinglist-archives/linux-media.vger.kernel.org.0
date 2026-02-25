Return-Path: <linux-media+bounces-53359-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK+2EEIRn2nNYwQAu9opvQ
	(envelope-from <linux-media+bounces-53359-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:12:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F90A199463
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37DB6305AED5
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B773D5258;
	Wed, 25 Feb 2026 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jw7yzDox"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C92119D081
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032289; cv=none; b=cHLZaYRX3lFo4459ceRvExcm+kq6f3IEX1vojK88iuSetS5aYDk+Q/zupWN2qCpl/eXzDqhyIMLpkJ2GRYlAmVrF1d788L97NaUv4fU5uxUgwSrO+6x7Bu2fCHRU+2RPLV2SlwCPsT7VR8EO9AOwCopMEczRDUWQWpdHILh6HsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032289; c=relaxed/simple;
	bh=ICAZHZyj3ycLji9irketEEZEQxOftQZnPnkMYk7H75c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DyHAQS2JQDWt7FNKMH23P7p4IBZoUTepFNwBpO7PVNdisntT6WGmoK5h1PejbXq9WpW8ZUXp1Mdv8J46yldcFeSnOAof2JX+q/0e+M7QQav93YFyzMURVTr1vXJaLhr8IKLNG+zHtM+cAEu7R2RS8X+4JhWzSaZ6vcwG5W+r2cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jw7yzDox; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so42199845e9.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032285; x=1772637085; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XWZKtY1uNQV/THOxPKg6BCimDKPb5Do9dwebKdrSc84=;
        b=Jw7yzDoxILQEVQO3Lx6lhNilrxblR3eQnT0VMXySdDZ4hEkvYPpaerlUsJx82gWhtt
         IL9Sk53iRCVG3/OGXSYjOmSsF5O+tc7hSZeyYghJ8xvBNNgryejJEK9fDpWmVEGUJIx7
         z4tqP9L2F8lj5Hq6M5/Y689CCc8HWBoLpOXklTSXOcjPB4biEYAJMkkeRed3ke6/GAq1
         gD0xXYmYKbxQFz1H8Cfgxz+0gPW8msKr/SBG6qpoZ7Xd7lhuYcQxvInTz/dyEX/ulG9G
         03Sx/756zcUXSZMy2hOTcpWc1JfqbRO41WJXdIwq3EUqlwu/mxapd7jlLeBga+8V3hPt
         iwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032285; x=1772637085;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWZKtY1uNQV/THOxPKg6BCimDKPb5Do9dwebKdrSc84=;
        b=nmsxfpbKa0UDkzeKVQnVGs5OKSJo5Yi3e2myTWdKKOc5tZgEe41//vfLKCFAdFEmio
         LmbNQduj40lkts4PdHulwPRDwMdBgagD5btbfKkVm7JRxJsgzU8IVEOe/2EJjY1rYibZ
         lqnJWaiN9U0l3ZLPJp4RfB9iD8+/NO3AkDSAEZHQsYHlWZ2aZ18ozAwP8wRl+4E35Vid
         Xs3sq7UGM9nfW3gouiMJudjDZYcJUDVd2RbzYiMFt/dAk9phgsuiI456M3M9gA/7+acY
         AyWxBTpNF3wiHa1ZZ0p7aInXG1NpbBHSKS7ocmVbHGTEy0YAYam9WPdjE/q3txElslJv
         bMAA==
X-Forwarded-Encrypted: i=1; AJvYcCUJA9+l//Spsv0wQPKu+syjccCXrv9WQGOk88V95gJG9K3zuQEqwVO/6Y74uEVDbKBafEJHfRPyPrmugA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/BSpwVkiSNHNU0qhh2yCsYAxIa6x9ngxcqF0MCbn+SPxo+k13
	AKixcJ753Y4eVHUxjzPEO7up2hFQDIr/KwnzSw2A5iCyhIv3QiZkNghkMhRYp2nhqW0=
X-Gm-Gg: ATEYQzyUfLid1y2VNKD48SKYdX9hBOdjWLc8/RTkW3EFPHrOZMD1TxZifBhscMbI9aL
	5gY2fgCWIIpY5XpTKMwxRaaB1evLAu0nMen89Ye7vrEQkk9hc9bk8YAqscnXtkC1eRLUyrGdq1o
	vKM43/fYMsxP2G8iLXyQQ9LtRBvku8ajcZ2oij3CB5H7poQO36znTZ+J5zOjwDefsQBFjilKRCv
	IyxJSadyL0S038w77ju+cMi17xHPiqSMyGW6KSf00KSDJnzaPIJlNH0naHKW+lVAIOL77ui0+MQ
	f+JUjeb8Pi6wm06n6PsPtj7q9XiaAaLpB/00bgRBCAoYPXk9zNXpg9lkKhMuVejM0k/wLg4m/1p
	SX/0jPyBcnZvyvQZU7NyzR+XHBFslcd6RNEw4mR9dgq01/WuhbOVxWwiYIjKO+ofb9D5gVlsYNy
	YQjLZnYOr/fyJ8ORmUPf2DKC74YffN0Lb6D8OsylJQYgdQhRP2efsxj/HKaNE/MuHh
X-Received: by 2002:a05:600c:19cf:b0:483:702f:4633 with SMTP id 5b1f17b1804b1-483c21691d4mr14044245e9.4.1772032284708;
        Wed, 25 Feb 2026 07:11:24 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:23 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v8 00/18] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Date: Wed, 25 Feb 2026 15:11:17 +0000
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABYRn2kC/53NOw7CMBAE0Ksg1yzyP4aKeyAK/xIsQYLsEAVFu
 TsLDSCqUM6s9s1ESswpFrJbTSTHIZXUtRjMekX8ybZNhBQwE065ooIJcBLOqb2N0MaxB66ACsA
 69CXByKKhjFLw9lIKMEV1XUnngrAEwWuOdRpfY4cj5lMqfZfvr+1BPdu/ZgY8gpHab62WW2HNH
 j9t7jZdbshzZ9Cftlxka7Rj8I772gvG+Y9dve2KsUV2hTZ1XgVreK24/rLneX4AOSdDfp0BAAA
 =
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10032;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ICAZHZyj3ycLji9irketEEZEQxOftQZnPnkMYk7H75c=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEZQQ+JKon7sxS85+4LTcL7743HYx4Z2YlIS
 sW9kAhthYOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGQAKCRAicTuzoY3I
 Ono5D/9pGZwrLdfg0Jk88Dw6AU3Sf2QeQskTopMXYZPyE9/MipnICJX3YGmsWXa4+87dO9LSW+J
 o7dN/mmYqzDmXQkpPi/+NpC/aEFC1bJGNYph4exvafEVP1G7g/RZe9nQXtgo+iC5zwRMqBArU3H
 CGJaw/etFCJvvKq0dNWdUsjL+7cX7JU4mo+zwsXu8cuPVQU8zZ0jUTM3MutUoEmRt9F3Sr0KNtu
 EBoSEscsf2rrrRL1foMi0gSh34pgmruqxYDF7kd/zGMyqSMKuUcRma1XelfGHnNjCSGeKUKiBt6
 CtCORfDoMP33uKHQYN3yyIKKhgGIJV9Hs1dSWLTuYxDHtBsDPYT2M3rG+NwgH+Ay/NhglbKTige
 h/ScKjYvOVP5jE0RHVsRNIG2GT8aVNcamJTdhpuJGSdqypZ18/0z2vokp1Cx9b3Mn4nB8rWVGOA
 ZsEScPF68PUT1FdnpirhexqKmUlwZ7PLim8xx1XHtyd32SStUlyvvOz//f2lsvQki5WzkNG5m2u
 y62TC1K0ctTp7I9C1q2VYDouiVtqOrZu+LppXzvkoMAMQVgtTLbgbcN6VQ5yRdXo0dUe4UYOzkL
 qxrxKrlL5YiH00BhXYsfPqlGqqYcLG2LoF11CexNROZ5Uo84djc9NaUGBQJEVz64X4CyNjCIcqM
 F6M63gaifWteLrQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53359-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gitlab.com:url,linaro.org:mid,linaro.org:dkim,linaro.org:email,someaddr:email,codelinaro.org:url]
X-Rspamd-Queue-Id: 0F90A199463
X-Rspamd-Action: no action

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
Bryan O'Donoghue (18):
      dt-bindings: media: qcom,x1e80100-camss: Assign correct main register bank to first address
      dt-bindings: media: qcom,x1e80100-camss: Convert from inline PHY definitions to PHY handles
      dt-bindings: media: qcom,x1e80100-camss: Add support for combo-mode endpoints
      dt-bindings: media: qcom,x1e80100-camss: Reduce iommus to five
      media: qcom: camss: Add legacy_phy flag to SoC definition structures
      media: qcom: camss: Add support for PHY API devices
      media: qcom: camss: Drop legacy PHY descriptions from x1e
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add MIPI CSI PHY nodes
      arm64: dts: qcom: x1e80100: Add CAMSS block definition
      arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m regulators
      arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
      arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add ov02c10 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on CAMSS RGB sensor

 .../bindings/media/qcom,x1e80100-camss.yaml        | 170 ++++----
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 453 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 106 +++++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  61 +++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 136 +++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 128 ++++++
 drivers/media/platform/qcom/camss/Kconfig          |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   | 185 ++++++++-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   7 +
 drivers/media/platform/qcom/camss/camss.c          | 124 +++---
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 11 files changed, 1228 insertions(+), 144 deletions(-)
---
base-commit: f69743819496c1b9ff12960dfd67e7093b4f5ee9
change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


