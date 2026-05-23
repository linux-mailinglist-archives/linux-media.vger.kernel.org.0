Return-Path: <linux-media+bounces-62663-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Om9MlEWEWqvhAYAu9opvQ
	(envelope-from <linux-media+bounces-62663-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 04:52:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D635BCCDB
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 04:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98D8A301571A
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 02:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5515430ACF1;
	Sat, 23 May 2026 02:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OdcB7WiX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B387B23B62B
	for <linux-media@vger.kernel.org>; Sat, 23 May 2026 02:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779504538; cv=none; b=OVKGcvjzV1dh/TNDa0UQpYTH4j0bwnGwhkLkaYvyBHBrtCbB3zrSykDAqxAD1TqTJ1b1YtskJMa+v3QB9V74T2nhkYGa7qUNeNiz/P8wm9EXIWkJkG3H+O+bEWyMVTyCvgSk+fjGCZWfc26F+Skg0mvKSvJaaJ2UbAQPkQffQtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779504538; c=relaxed/simple;
	bh=Nej0oQa3vqYl952JRaqlayT9WNmSkPnhMmSkwYrr22k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P0c5Km0c6g4LHnt0FWzyeAdkYTXyckPEgtsT4Dnnd0vkaPwz/YuYj91EigmhcD/YjNAYUKxhq0cOfkR++GitpdgxfHrLrQW/Angmf3hcWhz5fsOlHxdxl8qWLkeyE+sQam5hPoBYP9iaG+wUd+aVuLNC3ze+kKFdB5VKb6/6qe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OdcB7WiX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903fd19957so19289845e9.1
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 19:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779504533; x=1780109333; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BExoLbiODonMM4G0WFkJCuEkkOxAvgNJFQq4OgtjaUI=;
        b=OdcB7WiXBoE9v9yX86G6GfHW+AY8hn3Tr8F6SXox8jn4uuZHQ9CK7e3KQUQEFoLlE5
         2RJZpvgmyq5rVdKsoyAUgbekwotLXvswuukamHeb4Z1t8iVMNOYCMVB8UkRoODLQN7nW
         45XgArmgln54knaBz55eF0eJdSNO5etthSY9Dklzp0riaR3zSz9U2D0rEwB6ZrL8MnXP
         xSsxo41UbRulDNGtbezXKTh4NDCKgFBQplB2zHtJB6Z0QVDbln0G55gtCS+mmOTQWuSF
         pKQWmSqZw5oQ1UAwsNCEfWzgn2u0QhzRyOCWh4NULrMSb5p94csnx/ERBqtE99yx6kEg
         vnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779504533; x=1780109333;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BExoLbiODonMM4G0WFkJCuEkkOxAvgNJFQq4OgtjaUI=;
        b=rdEpcfivjUaRK6wdMePxnPnd0TVpQeI4BA3Kem64UUBvK3MFbINBLNNII0m9aMeRT4
         4OVJa6FpLtqQ/VvL61FFN/6b6ZKbw5fWruNE7nUuNlKAHszxSb4eaYZMRu3lLUKZq0hT
         mTHRntemz+jHbrC1sjF5P1bhWoOY8s2z5/hFPosYgpPsOHv7POe69YpfB+tMnQvDBOhD
         o19VUgU1hgmR/xp8qkhYhKe3I8JuqtEncra45ulLYK7lJ1VDaHAOK1yLM0cJdPita5RV
         IUNOi04nQy6VetKY1Z62k/9IbQfQtwrm6ggev3NZKHX1CuUbR61HGYlyWroY/88JIpIO
         lHmw==
X-Forwarded-Encrypted: i=1; AFNElJ8INkvbEj3uE2ku11CMblfODh1S5er7pXrkh725wMoBv3lozPDS81Z5lA0C+Noy3hHRMvGScB/qCJputg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFrJ4/2nbQe26/1cMgbBrgt2Gg9IjxkdGMP56pkVvx/eHcmKGw
	QBmjwUCt4F7HlPFftIduunO2cgU93SKKVAkCddR6WPcUyVbQP/rpUcPxFZZZRVq7JwlIcYCndcJ
	1Vi+dyu0=
X-Gm-Gg: Acq92OH+XjoTvbpZEVw2krH6pY4ZuChI8O0EU+wq2IYiZsXqOfPCnc7t6HHr3vaVKRW
	q73AwAe2Nez75DnH1ozaudNJxopSYzh60Tih2eodo6vaNGJe6p22QambPidUiHBCkqDHX44dZM9
	1pUk0fhcsARLURdcqGCGPjCr+EtQZSN+XSyLMzLa0IcTrxo1rKtd3yBrwckj+/oWUuY2Q72f4DN
	rRbGwO3pjIPTLhLza/1saDtUFIyslVwC653owk07Jjn7wacZN7qv/saRBXv5LJyIgS7zZeS664p
	g0E3pMj57aP6V+D4yN5aGVNkIIRBsWrEqIlPROHvxg/lGOhjjjPlf7fno65hTsnP56ExiklMzRH
	Pvlu28s4bi9k02Ak/SviCxEO2R1ktCqbTQMQsiAa51MjwKfJU38/Bho8f/LBQm3Vn3AUTGdcjP+
	Fmv/hlc+l0d3p2kYWP9cvlGigJkTNRSE0v3A==
X-Received: by 2002:a05:600c:4652:b0:490:3b84:c106 with SMTP id 5b1f17b1804b1-490428d3b7fmr57208975e9.26.1779504533073;
        Fri, 22 May 2026 19:48:53 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.145.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca50sm77938765e9.2.2026.05.22.19.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 19:48:51 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v8 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Date: Sat, 23 May 2026 03:48:46 +0100
Message-Id: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQy2rDMBAF0F8JWldlZvTuqv9RurAejgXFDnIxC
 cH/XjlQ4lp0eQXnXkl3NqeS08zeTndW0pLnPI012JcTC0M3nhPPsWZGQAoMAr9i4mHOxC/Djfd
 aCum1wig6VsmlpD5fH3UfnzUPef6eyu3RvuB2+k/Rghy4kV3wXnnU5N+/8tiV6XUqZ7Y1LfSrN
 RCpg6ZNG6VT9NqkzjVa7LU+aFE1YtJgjXISodHyqQUet2XVDgI4AmGtjY1WO91sq6or7oPpVQB
 s362fWhEetN62oxHR+WgitTc3e00HbbZfc8EjWei7qP/odV1/AE/WSp0dAgAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10133;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Nej0oQa3vqYl952JRaqlayT9WNmSkPnhMmSkwYrr22k=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqERWRQUdZn0i6DI4OcmhVnfl4oKWY1AWsL7xiz
 TJsYOcoiFyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahEVkQAKCRAicTuzoY3I
 OnFBD/4612F/OeHPQBZvfUwI6U3PHVOwiB8s3ARcAMrTp/9Rgko0qeNAAZ6c712nZiSP5kYp777
 mnBmlWPyY/hKLKhZc+2Qprs96xywXSqFdBgY3l1ayBkoH6rPPXzEtyOVKOU6jxID0Rczx5JA6pB
 fKjeFovnz8oaDBd4F43FMyep4/HxV0xq5zPbhT/6vPj4/W9ja0KDUEDwadfD/KctXUw/G3Qc1sF
 4Fd6t7gAkyeCUA9kp4Twzw4PdO+bBKlu/3Z1U2+qeM6WDpGG7YM8Izscdk0EIeeMtIEC0ZJx4WB
 oBHu7weby6iwmB8wk0oTBDFUqtFNNuhcGF1wGDzrBmmldtXkHnW8R+D+NpF0tT4bSa5dyliSqn0
 v4aowAGuzHfD0X7S1W6ji+tAS0xhWx7y/0ac0aDaZJnbAG5c2DXcWaJ5Y6D2UrYud9pEhyhWhdW
 AKC6dP6wLBzKoxe4/2vCFGoWJ83ki7Z9R6D5QX0pec4Pq/onla/HXFjV42E/yX7m2GynuspyZQP
 b0k+ma5lJKa7IuEi9zpTxn+zNGkk6S6pXISFB2JY52pJgASsYUZvgq7+afZZf/zbEig2Idp5aTH
 c1ItGUdlTo1pRnd42WUqJOvXrDDdou/m5NKQTLIB7JKt9fX7XabAKNsozUAO5+MYHGCyzz/qUWD
 yP/xGtTeVyyoyeA==
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
	TAGGED_FROM(0.00)[bounces-62663-lists,linux-media=lfdr.de];
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
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url,0.0.0.1:email,linaro.org:email,linaro.org:mid,linaro.org:dkim,codelinaro.org:url]
X-Rspamd-Queue-Id: 69D635BCCDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v8:
- Fixes two dt verification splats I missed by passing the wrong yaml file
  to my checking script :( - Rob's bot
- Fixes the polarity offset error - thanks Sashiko.
- CONFIG_PM implies CONFIG_GENERIC_PM_DOMAINS no change - Sashiko, Bryan
- Implemented suggested unwinding by Sashiko
- Leaving the flagged settle_cnt alone. Requires invalid DT settings and in
  addition the result is just a long settle count. Not real bug - Sashiko
- Link to v7: https://patch.msgid.link/20260522-x1e-csi2-phy-v7-0-79cb1280fad6@linaro.org

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

 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 209 +++++++++++
 MAINTAINERS                                        |  10 +
 drivers/phy/qualcomm/Kconfig                       |  14 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 376 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 402 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  95 +++++
 7 files changed, 1111 insertions(+)
---
base-commit: a1db83cc6f7e88a166c77d9060507ec01d617784
change-id: 20250710-x1e-csi2-phy-f6434b651d3a

Best regards,
--  
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


