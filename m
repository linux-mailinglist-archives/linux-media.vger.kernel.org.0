Return-Path: <linux-media+bounces-55826-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE9xKpdWt2lsQAEAu9opvQ
	(envelope-from <linux-media+bounces-55826-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:02:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E3320293336
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 514453004CB2
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 01:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7192248A8;
	Mon, 16 Mar 2026 01:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0zpa52m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B95721A457
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 01:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622922; cv=none; b=R9IRP7zsPHcY+P/AKf8yTnO/yCgcK1Y1Tmpv2mYpakR/BgttAXO4rkDlvOE48J4EoXv3H8DVm4GPcTVQoIuJ4z7ExqhoZlfFjxbBUCdvMpgIlk1TtA8UgQ03yixRMDVwSvdaLJs3vewsgnkRTQzOLerSnS2U+THqn6P0/M7ZTlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622922; c=relaxed/simple;
	bh=E04ZsxdW+sUygnuuKTtdPVjs5IKVcciYZH4GdzsYq4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g73RnNWUrIV2FH9iEO2Vmj3g/Hc23W4+U4+ied5y824NBLaEwUiMzA57YRvAsoyn712N04JcSOp8XySso4b/BCBp50U8h4OLx6AZvaFLWyxe/VQodqZ/fwSo4SzbF5hnCbu1nLc/f8dNeGxOlHYdUGH+4Ur1z5GKXU0QaSGGBuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u0zpa52m; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso2820430f8f.3
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 18:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773622919; x=1774227719; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dmNed8XjS4hqRKUsB8O5wL7RxV8eIW6XMV+LezMOWk4=;
        b=u0zpa52mIDf9uZTtVUeqC2huUU7YbgSo29b1/GGrvnpn3FfKrnn6RWG3I6CAsm/8uG
         7RJ3UmcVkAoJ6v9T1LtAJEY01s8a0CiCLwXXYrFWS2OnjJRFBkbBRO9HsrpuKUD75PLh
         FX+L6bk3l8TFgNC3j3ujk1ZQTbfMlyvod7dch8R43ihIsyQJYzw1mRU1A9RqUD02faR4
         34zJdSmNCIqdc/IxinvIy5Zf0ynmggpGE/I+lfsMvvz58pnJDw1yeiicGCbjTkybVZKX
         u+oDa/iZuya+DwgpRcwyatFyukrrTYWiXgsMtnrzwM4PT0+s3j9uYE8egoKNFZfxxSgY
         67WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622919; x=1774227719;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmNed8XjS4hqRKUsB8O5wL7RxV8eIW6XMV+LezMOWk4=;
        b=mtNvgpuAvnfEj4i6hFsv/b+j6kqZRfm/v1GxQvAaYe3J1WUfFo7XCD78tWkUyQLWtS
         NULmPiTFb19kpbjEC5eXXH2DOdSy37q2WuaGyIbTBivOp0fhFJODiw5owQq9OSs0gSme
         YC97mJ4CbXFki/bl9BXfWS6UzWs+t0ezAqxAk+oKXwXLEFAEEmjZ+7FY89eLDhhZgvzP
         C1V1DxOMXGVa/s0abkQAaHXpg8nVo0Wbn3QkXg2PCML1VAYGDQ7gUyBswFo6HywdMvPE
         qblHTpRjimgYewH0F25cwGMJ9nyV3WVDLXVuT/0eUrB21uTLCb+xtL+Ise2LjZ6CtsU4
         5X+A==
X-Forwarded-Encrypted: i=1; AJvYcCUEn+JaX0Re9HszpTD2HVVXhKrA4JlrrXkJ56XEVuJAwBaA0ZxCF5LOSGvoU9GplbSX7FXnq/q59OBBrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTLIhWVj3q1sveu18485RzSyNk/ZwWp1es/wCOE36Nsrf89/10
	vH7BB47NWylef6DS5o6WPubST94dPkwyCqKqVc7LeVTczwD8WltTCSnpGW/WMwJLd+A=
X-Gm-Gg: ATEYQzyhpJCM9aCBPMZx9pviAi87IQSTuq81HMVdWEyViV2Kw6En6c4erBFKqsdK83I
	hUIgDctqV4y4S8eQyYEMMAtDqFsqe9WrEDL5heyhCyeZecUMmP3I9srcoCLWHc9k1a4CGPe4iQQ
	+7JCTqgyBwKN+6/mzIkexCuSxWqeHRexIv3gRR8qkNuIixk4l3ly85sjO/LdlkglX+LLKniEYVY
	9mwk+vqVmxqc3EnBO4RlmtPKPZnRH3F0Awdbh3t3LYm+99+EMKA6AO0AG9L3f6bFgtRIB1xSUa6
	oHRbK1hNFyYDrv98b7kcD6t24Wa0W4l2W9SffuwnoDa+k9MS9KBMvFTPi0C8WtoUUP3JLlzoqV1
	8sRkOWESWs7wU3SuytPVNjANweX98lubKZ79w+wOY4TJP5/5yT9v/zM61W2J6NRLXqJgoXzCpXL
	28n1DJoXxQxWzND3iMkhhHyWmSoHpzFpSoa6M=
X-Received: by 2002:a05:6000:1846:b0:439:b486:ba6b with SMTP id ffacd0b85a97d-43a04dbbee6mr20665126f8f.39.1773622918578;
        Sun, 15 Mar 2026 18:01:58 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe228986sm34729700f8f.35.2026.03.15.18.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:01:57 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v10 0/7] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Date: Mon, 16 Mar 2026 01:02:00 +0000
Message-Id: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhWt2kC/53Oy07DMBAF0F+pvGbQ2I5frPiPqgu/0lqCBNkhC
 qry70wrIYqyCsu5ozl3rqzlWnJjL4crq3kurYwDDRyfDixe/HDOUBIFTKBQKLmE0MFbGT4XGPI
 ygVCAEihOUyuw8GyRI0L0760BV6h704WQpGcEftTcl+XedjzRfCltGuvXvXxWt/RfNTMtwXY6O
 q87J719pUtfx+exntmtZ9aPdrfL1mTnFIOIfZRciI1tfm3D+S7bkI0hquSt6JXQG9v+2BoFUXt
 sS7ZTihvpZKD3N7Z7tPUu25HtlYuyR2kShj/2uq7ftLUO3lYCAAA=
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
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10113;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=E04ZsxdW+sUygnuuKTtdPVjs5IKVcciYZH4GdzsYq4E=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1aLlh5ATpaDtr+wnWtX1xvPCf15jvGur9ToM
 tV6r1cZOrmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdWiwAKCRAicTuzoY3I
 OrKaD/46OoYfpeLXB+HxMhRzE6S1KXFEIIe80GDqku35XNIWJBhGb33h20V8+2Bm4SCw54fm+wq
 j9blSNVVZjZOcRjCzmkIHY42UAbm9FNxPBwhmmv/j/11j+CFneiJYGDaswZwvSK/CqclKgUs0Gs
 DTSYeluDUrd+hf4PLnn7zWvleG1aJtHXEVW3yEos8rF9gmpRphmr7mefPOnpqk09BdnwiI1wfkS
 Ychy+sRhWkgxKupqN9mHG6QUVoCK28csz5YokOBszikSrTT5OiPS13GUutzIau+1bU59VN6kser
 zvNZ+Snu4QZnPfw4LFcVq00zxDDDpaSCliVsPHVxDDz/ZMNyzcgJK7NauIgSiLmhaUraPFuKsmj
 tkPXTzB4+1wqQzjZv7KoVuJX5j3G8lJrRz2lUpip+qRvf0vSyCinWkozsBRiuaA81J2q5NNkDYT
 Z1vGcaV5yJuvdZI5LAh1UZWFvYyptDscuE590PBc1PZCX8ir9yoWbdQL5BnxR3e88bzDxStRbsN
 j/IL9+lGYHTxvTOIlCrq9e2nVLp2IT/Sj7gQyYEkVSDaK2XYFLg8wFH85LooFLXyA/5phzXYDIl
 F/SBDFgxF4tNl5hmaH8FkiTex4STc1RqOTeATQkfs6LDDORIeRg3xzEGPwhKqL3jhS5kyhWh3ai
 WiA6z0xiqGSrBCA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55826-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[someaddr:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,codelinaro.org:url,gitlab.com:url]
X-Rspamd-Queue-Id: E3320293336
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
      dt-bindings: media: qcom,x1e80100-camss: Add simple-mfd compatible
      dt-bindings: media: qcom,x1e80100-camss: Add optional PHY handle definitions
      dt-bindings: media: qcom,x1e80100-camss: Add support for combo-mode endpoints
      dt-bindings: media: qcom,x1e80100-camss: Describe iommu entries
      media: qcom: camss: Add legacy_phy flag to SoC definition structures
      media: qcom: camss: Add support for PHY API devices
      media: qcom: camss: Drop legacy PHY descriptions from x1e

 .../bindings/media/qcom,x1e80100-camss.yaml        | 136 +++++++++++++--
 drivers/media/platform/qcom/camss/Kconfig          |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   | 185 +++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   7 +
 drivers/media/platform/qcom/camss/camss.c          | 124 ++++++++------
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 373 insertions(+), 81 deletions(-)
---
base-commit: b11ac7d13db32d3a232e11b09491647179a2df5f
change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


