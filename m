Return-Path: <linux-media+bounces-66929-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UkyVJMOUTWro2QEAu9opvQ
	(envelope-from <linux-media+bounces-66929-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:07:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB07208A2
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:07:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=yi53TwDR;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66929-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66929-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B52C303FFB4
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 00:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837A93A1CD;
	Wed,  8 Jul 2026 00:07:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4894A33
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 00:07:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469229; cv=none; b=LE3QXNbtVdcnSJLtdPDL6EgFG94hQ+GGDli7spbqoQuAp59n0ynUAeD0z6XmoulGcrv8Q9tdkPoaGnA31EnX00V6OlvBZhuqWt2n24+wIlV0yvb4AfGrHp2wQDLCyQjSGP80qMCAOypAjrVKzToiAeLWdx3hiB81ysAKlUtLvWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469229; c=relaxed/simple;
	bh=Yt7aOeVHllyNoz8w+5/gCd8J0nSG9GjWKfMjcWqUGdA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NQ+qkhSzjVl4lvSHIYsS5b1NAdHisYec2yit5tr2nipwWdVdo6azXOwL5FGQBFEK1pp5sXRP9+A0IfsxWGolATfH6ETHq17hjNJZL7yb5eVlS70+VcA2bgm/q4x06vBCWNAzP92sJKQ8pIybHWlbIBhd3fZXOYF1slGZCZ/uXlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yi53TwDR; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47dec32798aso91516f8f.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 17:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469226; x=1784074026; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t1U5LAGgqxOXs4+GmCCnVfsxpbmD7Yxy59mrl3C2FeE=;
        b=yi53TwDR/WjEfkKzz+EzjbatZHwHvB8RenIbXDIWlwevPsCZLy7k8K4A8weiyW6Ryy
         5A6ESZaxrMj6q+MgGMmDUpl4f7Pjmn2YZZTUkfR6pWDWONDkuJDJCQ5Y+6UuTahmTpF8
         XfjFwKC4YNz/ubsq0TWtQ27+Fxa4A3zaAUBsz1P2xKlchaOmnbSZ0UYrGslYfcODA31E
         djkuKSQiYbMKrYbI73B1lyHVr9hDVH7kfxEY89eQ9vuHkdaRjMd1/p7pDTmcG/hM4bhf
         cS9Jc0ouWdCJRFolxgsICaqFSP3SY6y28qTN/AT4e21+uqBI+MFcQT3zu2xgwikLh73s
         7KIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469226; x=1784074026;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t1U5LAGgqxOXs4+GmCCnVfsxpbmD7Yxy59mrl3C2FeE=;
        b=h+MXq/g3doD93EWcI5K5tcpCracvTwTm135ZfPCH2l+nsmkeYa9GAsl1LUgNm+eBtr
         oIrA6rfYZfKej9zJzgNlwFPT0jpqoav6WZZ2rFzO+VV7PvJw5/DxuYQCU/omVleuqs63
         z4EHU4VaDJ5MEgzlyrEPzudgl3jZxo84NVqJFA2TS58SfQ9kxoiSi+rhmzRvlNrGxxB0
         QJMnqAs4eawR7hsvR3dCkEouQFXwYnlIokvTK1qQ6MBqGX4n9vK1oOpDc6n45q9Y/F4P
         dQuDZsq9fe5wd61E/czQ7IAUySYza8fuqvLWzE9b7KTC96IOnh0JIcf4kJL6X9JSNq8h
         muvg==
X-Forwarded-Encrypted: i=1; AHgh+Rqy2UD0zt4rtvTgHsBtQNUrwdrdIcYXlJM52pjC55vbBowek076NnfT1Cwyl2v0feN/FbTeYH4DXRUTCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyrpBV1jT72qlkquWy2r3wuUKZW0eVSErJHYGK0q5oY8NLS3eB
	jdA3ipUrtDy93Dd1ZW4rWA2m18CDOqKA/scr3IhYeWcRIuWjTIA41/UmbyrfcvANvJk=
X-Gm-Gg: AfdE7cluPPa8e9wlN5jjWX41vl7UxB5490ZMNx3xmhwVglOh1EW0/zXLo5+mx0lDNAd
	urt2XIpUJvfv1B4DktcIQVseypJ9VHO/tHIczYn6hypq1S0Z75fK90VfEb3g2NbNGI1jeDJ0tzR
	JlfVzhwoegQheDDhwwAjvHCNANJvTzqFkvpSGYnnkj4xXGayX66evwmBQwPCg0BDM0gbk/VM6np
	JHWu63WgL4BlMtNRA6tHQUxXY5ni0n7FZ569lLwBT8yZt/PoLa8PcsoeHwFLf7414z2tnJAPLzN
	m0hwF4UGCOWwUJUtfqXlSrylMh7DkDKO19MwlqFPqh7gJZtuH/FyzasC+IyUM37fnzcPKueSMJY
	p/NrFB72t7/gzbxeM7yBFl2PGApipZrD8E1+SFdBIm3kvVtcFqaH/fSWdlvtvpnSdVNdpSQEyxN
	YUKx4JYz/wyVRZdOHqfrCf7s1/8AM27M8Uqg==
X-Received: by 2002:adf:e387:0:b0:475:5e4b:588f with SMTP id ffacd0b85a97d-47de6610e75mr6947629f8f.16.1783469226167;
        Tue, 07 Jul 2026 17:07:06 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:05 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v12 0/6] Add dt-bindings and PHY updates for CAMSS on
 x1e80100 silicon
Date: Wed, 08 Jul 2026 01:06:54 +0100
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/53RS2rDMBAG4KsErasyo5elrnqP0oWeiaC1g+Ual
 5C7dxIocfHK3QhmhL5/GF1Yy2PNjb0cLmzMc2116KlA8XRg8eT7Y+Y1UYMJEBokSh4U/6j918L
 7vExcaA6SUztNrfIFswUE4NF/tsZRgymdCiFJzwg8j7nU5Z729k71qbZpGL/v4bO+df8VM9Mlt
 8pE541y0ttXeunH4XkYj+yWM5u1rXbZhuycYhCxRIlCbOzuYXeIu+yObAhRJ29F0cJsbPtrGxB
 E7bEt2U5r7KSTgcbf2G5tm122I9trF2UB2SUIGxvhgUvchyPthJdUsrOKDoVbHVf6ztHph4Dr4
 KRCHbJJ6Y9+vV5/AGkEta8SAwAA
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
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11063;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Yt7aOeVHllyNoz8w+5/gCd8J0nSG9GjWKfMjcWqUGdA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSlsdpz5IHi3UgtKsCS0lZCC6prvu+31GYAa
 tl13m4UVVqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UpQAKCRAicTuzoY3I
 OjXyEACThdXtE/ytH+jnSpTyabeuIhEKihkUPRkbrlbvIRZJLlPBPxntGiItTbuYvbXVGnTm5wZ
 Z1Dkz0sqS3VFZAB1XhajQGD38QUi4xrJyW+OE3vSL7Zs8aYi79397nSwW6Jq4nZQMkNDsRoKodL
 WX/QciCpvoIShR0gu/tkoihH8kIWULh0vpwlEyrbUfFdt95iC+i2HnOetAuMJKf3OPoWJyPVT8b
 b3t1HZ7X+WG0/4/dWE7h8NrHLqiGzyIcKT4MmTWIWyq7xxnnlCJnSi7cuI3kaBYeGH3KB7tG7gq
 DTiryWy72ZvSmS5H1W4zTagHBbTZ4gj7bHOXLrl4lpmZeqtMGTdvCtS3E7qHLi0/5tFWHAs/lNe
 sqvZnF+f8z3HFGQ7905moH6PSGlDglMw7a64wZz4YJlf4XaTtB0D5u7REIPaOtn+geRqcg978Nm
 xlKJoAGAFrOuDsxCmfjTNShy87/8ZcbCqHDbaQ87v3apifHVv13p/aIKW4xSp1Ga/jAqjJtnzax
 aAHlgwKqTOsqscJzB3aOSf0TD7lAwQOfiyQxTkenIGa/JmrXX91WganmIcPO2XtMY6VlgbC83ZP
 9/PKVIhp6E1X/M/jFD3qZvXu4ilsOjUrBD9CpwaoAGT/1pYNMnUpqZ7xIlzT5zsthgUxW9su1XU
 JW25aSkxGZ6abSg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66929-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,oss.qualcomm.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFFB07208A2

Changes in v12:
- Updates camss sensor find method to find the sensor in the CSIPHY port. -
  Neil, Vlad, Bryan
- Drops dependency on passing polarities and positions. Moved into CSIPHY
  port as agreed. Neil, Vlad, Bryan
- Omitted mux to CSID as discussed this will be done when splitting CSID
  out as its own individual node. Neil, Bryan
- Updated Reviewed-by: - Loic
- Link to v11: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org

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
Bryan O'Donoghue (6):
      dt-bindings: media: qcom,x1e80100-camss: Add optional PHY handle definitions
      dt-bindings: media: qcom,x1e80100-camss: Describe iommu entries
      media: qcom: camss: Add support to populate sub-devices
      media: qcom: camss: Add legacy_phy flag to SoC definition structures
      media: qcom: camss: Add support for PHY API devices
      media: qcom: camss: Drop legacy PHY descriptions from x1e

 .../bindings/media/qcom,x1e80100-camss.yaml        |  59 +++++--
 drivers/media/platform/qcom/camss/Kconfig          |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   | 179 +++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   7 +
 drivers/media/platform/qcom/camss/camss.c          | 143 ++++++++++------
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 315 insertions(+), 75 deletions(-)
---
base-commit: 2e41fb778334db3d260c52c6be4c4d44fbed87ac
change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a

Best regards,
--  
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


