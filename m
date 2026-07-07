Return-Path: <linux-media+bounces-66927-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z+nfMlWOTWpY2AEAu9opvQ
	(envelope-from <linux-media+bounces-66927-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 01:40:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C0720732
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 01:40:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=tiFdu7vD;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66927-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66927-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE30B303E4CF
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 23:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846413A83BF;
	Tue,  7 Jul 2026 23:39:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812183783C3
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 23:39:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783467552; cv=none; b=Ommh3WIAg/61qpHEaE99czwq5tsClIhIUJGNP9wRdnq0irXdOOo5KcEZNl1QTI8NOF48rngI+hhs7BPwr61XfxA6CpGAfLWBDvUbCX0zsO60gkTfb4vvXDGCy5Pk2z7sa+2PEhqA+ydnGedQvcy40Ci0wtjyjOlg0qqn4/b3p2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783467552; c=relaxed/simple;
	bh=yu84B4EGX1U0vgJe6N+WECUic/mCb0gOwDDhIpHX3Ds=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EhTZTw6a+x5ElhnopbXlBsfGVMSmLP+OqNAlaCLpArbfFUq/tE3y2b30A/kWODpq2yGM9r9jF10+q3bLlDQ2A75AZtQG3jOYipNhHXlkRdcq6o9gBDt498sPZ9+tFUiqoxlOmpSJQsRgUh7dCJa/UDs8k9rQevh9F9trTXnyCW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tiFdu7vD; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso501205e9.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 16:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783467547; x=1784072347; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6OAYzHROO2vqRhl3/plcsBW1bNoOcrWrLJeh4jr5KfY=;
        b=tiFdu7vDMnKl4tjiZHRcHN7uJRj/egFU1rUmrASxUla6D/uXzKXfJzNj/wg6cbxpt4
         VZEt9Ew76a5inyJyA5ErRa3TK8By+Ui7kM6o7KJd88L3gd6oDYwCTi7BkDR6f9tt2K4A
         4piYjDge4gnUEtJLkl3MIBY44UpJtnYwlKU33RiwxDrTu2/7nukd6NXh+5MsGuov+t/w
         qjN6hPn7vRo3W8eNcs04SpGJsjm5lMo1YLPL0B70Fs10umbMuYLgBqQhNEq/WT2Heo6z
         cpf5OIooaiMyquwjMSh6ssPIK2Uyw3ouRzLBfQH1nK2ziGnhn+e3z40+HEZ6WxqzgkRZ
         Qy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783467547; x=1784072347;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OAYzHROO2vqRhl3/plcsBW1bNoOcrWrLJeh4jr5KfY=;
        b=iULdZawwHaIcE/jgZLNKYoSZiPlUuQtck3lEd9IcSPZCMTdG1SqG0bivnedskOrlW4
         Qrrbzh3vQRUbfkfvH5P+IvCmjgvKO7cI2XuJ8NeR9hbCCUHf02T75vBa93jcjDdYcEUR
         c0fZ3wjHzeg3SyXfofVpAQiTPJlXuPf4Eutgl92gmLZVywa+RcZUjKFN3+KUVUbDyvkx
         sUK2nAiX6p8E54QS2HXGfpeKG3Pt2ichYDZxW+JukDLfFnT3z4Icxj1ITrTyJ1TFsnPs
         MTkVtzuJDFSblwjCyInpDoTPwaXZ8lz2EIZid9XLpXdiIRAyFczmnAfZKTBXdfH/YN/f
         xOeg==
X-Forwarded-Encrypted: i=1; AHgh+RqOeyI0S0/0LNw86wxnIWYlToIStyg9s2VwZTpWCs+CGXt2K+ZrpJ8gAiZ1s2ZgJuxMXIgJVVU1Y+HYcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAk2V3/O/yxyi2IwJ0OZ6fFsYkGb77AUedrdlVAIN6863//xbU
	GjePxjqrFgVLH2mpdRl2UYIahtP5z5EVZhBBBCfhvaB31whAw0Qp+WwyR0TrcotqTUY=
X-Gm-Gg: AfdE7cnD03Q36PnQTrg+eQAf/tC2vSBrrrMMv46Yi6NfnSQXai+4LCUtqIAYhKEWAb1
	iIDpy5eSjxdCCUv5U2dD4JVIM8qhEJHmFUb7VGkGfeTk/BzRiTr2tRaHUCjL2HlwPvHOmGfEtJy
	sOMeNsptLY9VdpatZwlJDxpIcejewUkucNm9Guf/5gmLbtehI2eAXRmuhEaHYxtdjkeG2cUzI60
	4LK08dkwbvZWltPC+tdo7H23w48xizJZ8WNuoAWM7HLHbr+cUIsx/2MCc28vNEZB53ZLjvO5/jF
	PT+9Inq7raOsAIJXIK9BarDwWX6DHSZax8ZsDyddhE+R7HGaSClh58i45togH43bhXkVFSR/R8F
	lrekyg+VAUL2u+puETnVnpdtBw1W+6byNIWIluvJc/RRXDYU304pVeSQ/NaP7OhXIrtXN0qo5XS
	4c0uZvgk0XiHfIkrwyjngqueI=
X-Received: by 2002:a05:600c:1d0a:b0:493:bed7:6d7c with SMTP id 5b1f17b1804b1-493df0a8eb6mr79578415e9.25.1783467546720;
        Tue, 07 Jul 2026 16:39:06 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm82398655e9.13.2026.07.07.16.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 16:39:06 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v9 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Date: Wed, 08 Jul 2026 00:39:01 +0100
Message-Id: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQTWrDMBAF4KsErauiGUkjqaveo3ShP8eCYge7m
 ITgu1cOlLgWXY7ge280dzbnqeSZvZ3ubMpLmcs41MG9nFjs/XDOvKQ6MxSohQHBr5B5nAvyS3/
 jHSmpAmlI0rNKLlPuyvUR9/FZ577M3+N0e6QvsL3+E7QAF9woH0PQAQjD+1cZ/DS+jtOZbUkL/
 moSiPqgcdNGU06BTPau0XKv6aBl1QCZhDXaKRCNVk8t4ditqnYiCodCWmtTo/VON9266oq7aDo
 dBbT/pqfWCAdNW3cyMrmQTMJ2c7PXeNBmu5qLAdCKzidqtN1redC2am81kVXa1dX+6HVdfwBnP
 6EnWwIAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12073;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=yu84B4EGX1U0vgJe6N+WECUic/mCb0gOwDDhIpHX3Ds=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTY4YL4asrRTssnxZRLP58vmngSDc4sFHjy/Jy
 +YeTdqOmLOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2OGAAKCRAicTuzoY3I
 OlugD/0Qw8rI6H4JDUeKgns5DGu+ruDosYHY1WPFGXSPf4s21WgeeK0lOTkeHsWgdLTKYHDHHYI
 AmptXsmLMF1/XG9MdMc1TGPrprmNotBdgwNa8et70xQmRXj/YMXw/rT8vAWFPcYNhAGGPJX7xGY
 eY+gZ2h3jHU0qngVIENIi63acVWwlsAnWiXK3/WMAOXwku8rA6uMhpdtFV/rpdARIqNrHZHICbh
 z6hRyRGU3H9Zm5w9AtvlevBzAJ0B/EUlnK/JpvWLESHvIq2KpIBhxLvGZQPcDkC4ADUeHZAnOdB
 q3bFepAyG83mgwUkM1Q+ImStHshGEl94nQ6/Eq3T0csQmdxZ0qgdGHwQkxObT3wTFz81JLMO3aA
 tbCtc+ga9vauYEftCrZcLqiEzqvbAPhWQ4xKvr90iBH8otLYzviKBnAA1ZSNylNaGAdgniAIvSS
 mc8OuRzS7cA2aHS//qIp0Ivy/txU9dPKqB+Ur1jxdXhhJBF3Z7WGGKtNDXeUMsQ9FnPwBYvswDZ
 Ap1tyvGtgBDELu1mvePBgexbOi7ecxB0klNWlgigG+wf/hnxrkl4DkBoZy6B0rmWXrRVkZgDFAv
 dvhfSmqvLKYrIRs1S0cjYGWqLmFLtkCRzM30M+BXDrHCC692e1Xc/wKwQE5JK689BXneAECKTDU
 2fbpicLYUecHH1A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66927-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codelinaro.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A6C0720732

Vinod, Kishon what do you need to take this for 7.2 ?

Key advantages of implementing this logic as drivers/phy:

  a) Per-PHY power rails become declarable and enforceable on a per-PHY
     basis.
  b) With future adaptations of CAMSS routing the PHY output to something
     other than the CSI Decoders becomes possible.
  c) Standard framework contract. phy_configure(mipi_dphy opts) / power_on / of_xlate.
  d) Introduction of CPHY in this driver will elaborate CPHY for Linux in
     general as there is currently no mipi_cphy_opts structure.

Changes in v9:

- TITAN_TOP_GDSC retained. Further elaboration in below link. - Vlad
  Link: https://lore.kernel.org/all/d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org/
- Consumer selects PHY mode - Rob Herring
  Link: https://lore.kernel.org/linux-media/20250710230846.GA44483-robh@kernel.org/
- Incorporates two comments by Krzysztof I missed previously - krzk
- Changes 0p9 rail name to 0p8 - Konrad, Sashiko
- Uses port@0 and port@1 to denote input/output - Vladimir
- Label phy@ instead of csiphy@ in example - Sashiko
- Drops additional entries in example opp one is enough - bod
- return 0 on timer_period_ps < 6. - Sashiko
- Use power-domain names and a "scaled" bool to flag if
  a power-domain needs to be scaled or not. Allowing the code to
  attached to all PDs, GDSC and RPMPD alike but only scale the
  RPMPD. - Sashiko
- Fixes error cleanup flagged by Sashiko.
- Checks args->args_count. Sashiko
- Performs checks on pd_list == NULL. Sashiko
- Makes opp-table required. Sashiko
- Uses const "core" and "timer" when getting clocks. - Loic
- Adds AHB clock - Vijay
- Revert v7 lane-enable change, BIT(pos * 2) is correct: data-lanes
  are logical indices, CSI_COMMON_CTRL5 is a physical bitmap - Nihal
- Adds a comment to explain clock-lane - Nihal
- Link to v8: https://patch.msgid.link/20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org

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

 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 202 ++++++++++
 MAINTAINERS                                        |  10 +
 drivers/phy/qualcomm/Kconfig                       |  14 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 387 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 431 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  98 +++++
 7 files changed, 1147 insertions(+)
---
base-commit: 8dac27bfa2f994ecb11f01a63641527d17d48fc1
change-id: 20250710-x1e-csi2-phy-f6434b651d3a

Best regards,
--  
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


