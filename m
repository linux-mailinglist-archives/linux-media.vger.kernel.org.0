Return-Path: <linux-media+bounces-64409-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aOOBBcpHKWoPTgMAu9opvQ
	(envelope-from <linux-media+bounces-64409-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:17:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A709668A6A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:17:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fhoVTNSX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64409-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64409-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC7ED303DC90
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7238735FF6E;
	Wed, 10 Jun 2026 11:10:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0612C3FE373
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:10:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089825; cv=none; b=W/BstavnGrvuJWMq9sh114wfqMa3QTdTs4XhlhCYD/Z331BAffnWr2cqYO/nllcJd98cpEBL4NZibGpjcC4VuhNANxDKDBltf+hzifDInTligtLUAhoCB2fx81W64tEazcZbJlBpa2+OfuScsQMEuH/2H4Gyf3AnE+OVCSwo0Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089825; c=relaxed/simple;
	bh=AeMf5Wr6Pe7z04trz/jF9RfVqQlRMCsK6v0jvJ8gVWI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fa/P25c36BdulAzGAmQps4YusGmdUWS1UR9UllmHLa25YWnr2uTkDEbGjYBDDg2vXO5CFKTdJ3mrhWTe+ckD3KON1GH9ReSIFfxopH67V1OCfp6Y5fSWyfx8Gp5h1kjpG8If1MQPeVc3wYmnMKxDTJHOe1msq7QVxGxBkDmBqaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhoVTNSX; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso59532365ad.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 04:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089819; x=1781694619; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ONdaAz3lAyvZtpSLEpD0avPz3gy5OYFvenkxhDXGSww=;
        b=fhoVTNSX6pMa9cZQ0lVHJDYBt7GzzofA9HeZ9YGJxJMVxetbCx0qWsndAFLNDp3g88
         ILYlzLHkXr36UG+MzsC1Pon7F883xZ64PWKMyNN53sJqbql31806NnsH+oWo+bZAglji
         /nhP3Wj2/ivAq+uwd2HVlEGhITf7hrV1Y8cu98KXdavePFybdn/dGTo+5kpgfrbp6Gpw
         TiI2QvLFs8gyLa3aL+Z7jk1sS3Uocau7dhxyeI2xBoOQHGFuCT9nPyuyDcHue0cc2z11
         luoy0mzmv0HDsc9VBKsM4tkzHbXze+EQAziBBkZ+S8TbVcGdACmYdzdtGo/q3YjrlsK5
         5cPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089819; x=1781694619;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONdaAz3lAyvZtpSLEpD0avPz3gy5OYFvenkxhDXGSww=;
        b=LSPLGXMiCTvT8B4W46voIrVXsqxF5FGaV0Y5OL0YTVDoZoLPvmz6bqV0H0V9uKRj4Y
         xuWYwpSWrgMjbtAyN0JUMv/3dL9Z3n1YseArK5+F9WVV21vgjeCfap7uVWqakSHp8Cra
         eLTkFub06zOWzlkg36GhcNxgaNxKoRcCqIr6Kqf3PIan5zAwx0TZFJ/CsMNiP4eYm/+7
         KSRNxJPXdLX334gMEQ844cb5+uOzfKbSC6LarqWiyn3Hjcdcf7IM4JDQVIm5nqJ7KTGd
         +X4jwn/MqBn4laHI32UXzviwdYuk7tXdnErxbm+L87+hYBz134YstBNqav+cQyHoFRCV
         dXLA==
X-Forwarded-Encrypted: i=1; AFNElJ9ih73T6am/g2ttg3QvOf5RBYmmoySKxXuarbNn8sSpoUFfT9dtiRCce4iO4V9qS+OwLkl+Byhqk1qFIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3NJw3IPDUNsYGfUvHx28kIflQ3I9+ih1ZLbmi1bYEXK3lbHLj
	oSKzw29+BhF5CDuRjAbj1H3UsutWDl1nHtVgGdalCzBc9QWyw2i9FIpe
X-Gm-Gg: Acq92OFaPR98RuuVLRDjfSmBjQ9DA3OYFUNKiMY48MVAMjufMwiVZDKZEE/rmkoY7fr
	WS7wlapZdKP8rvAxP9d5jYKzSYVGPFna6yYmnUXeM3+29DGyCqgFKoHvn3QgrtIvxfjQd/IlszD
	Y7pQeVwebP+FnlOZoNaaopXngwZ0fykiwEqt3QyjaXQ0VPhmBPm3DU/WKKb1rTgj4lREGblqBWx
	VhnRAZq9uNqHivV++DTcgYCp0pMqLnTpkYyO9n3Rs8ZdSyc1IeBRVldN7ao0QvA5x4GuYkGDKHf
	1hEXY7M2MPLiDnRDsNHx8LvutTzo+2l0fRRbaynpLhK+7/7gu0PiqMnXSlHUR24VgTA/jpClB/Q
	KV3N60/EXVbmFEAN43Tn27cJgw66VEO8DpF9h7eOjBaw5h/H5NpJZl05eyoYGnJ5d3gJJ+FcS7+
	9kC0XNbA2f/QGVp3XrxiBainKxqJSaV0GbaChnHg==
X-Received: by 2002:a17:903:94b:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2c1e85c736bmr283708325ad.33.1781089818833;
        Wed, 10 Jun 2026 04:10:18 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:10:18 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Subject: [PATCH 0/9] media/arm64: HM1092 IR camera and ASUS Zenbook A14
 (X1P42100) camera support
Date: Wed, 10 Jun 2026 16:39:25 +0530
Message-Id: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WS3W6kMAyFX2XE9WYU549ktFr1Papq5SSmpCowJ
 TBlVfXd19De7E9vkAz2Od+xeWsqzYVqczm9NTPdSi3TyAV8OzWpx/GRRMlcN0oqJ50MAsGIvgy
 4iX4AGZSIMUWSSgXsqOGx60xd2Q7J+4ePuq7xidKy63x2zPSystfy0dYMVCseXpfT98NKKyvyt
 f8lrjjjUAVtC407nLiBkCK53FkbgvIG757LiPN0nubHH4c8Lqk/pJQxyoAPEQATkZLGMWdog/T
 ZW5TUxais1PvUvwhWabEBiVSLEjvKzbMzeuucNzZYBX87/y+GE9EI7ls3MXIIwbmkFqBFXmrZ9
 b0EyYE4ZOVsezgbgzZgI7mcvw4X096nIIEyGHNwgAQdHwlkTsa1EnLyEtOfUy5r1xGiRsW2OnS
 +JTQtYsu70shjTN1F98VKmO+6zq/485NXMa7iDx5jAOXS3VTr+WXF5zQNw5kfB3TEymvkN2W5n
 Ezgv8V7SUmiT7r15AFiCnyRjOB9bpPjS6Xm4f39N7otzSKfAgAA
X-Change-ID: 20260609-a14-himax-hm1092-bbcbe0229afe
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5829; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=AeMf5Wr6Pe7z04trz/jF9RfVqQlRMCsK6v0jvJ8gVWI=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYM2l5gT0Awhq5dKGACM7kdseuFqcEgj2gyc
 pzwu1jPtKiJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGDAAKCRAVlYpeERwF
 3oYxEAC5nHpEAyEA4fCAKgzeJ3lXKotkjbpCfMKRL1zBudNQMlIs/HN/H6t1AeZEM4KAJlukbyr
 Cf0bp+Clcv3fFxIMECzY0r7qGBa8BPsCFskwq5uUaTWeWSWwAbEXnIlhIE5xWZOy92UDR9rNICf
 Ozf87E/nTvTNcbyiX0/7cD03kS+Sxgg1uILpWdg4OP0QrM/sq/smE0utdPrII6qScg/ZofQPGIr
 vkasL+LeylBhPRUlIBKSsh+XKHtA95aKpGSEEH4WhBOXmFIA+W5KWofEFd6HFwez+XLa90Q3hhX
 fhD+NHC0QlnKCORmN16z3I09Ojb2ycpUuxMmJKxF4jRAckFsFbFFyxkZsVKoDnt73Xjo3xHlqKW
 lyArs1KCQQl7QxyQjB0zmiV+7TcpS/o8bZtqLIT7LcOGKkP7vh0qs2rosXKazXSmhjmjyamUYMK
 tonVC+6ztjPNK9zs28u18evTXJg799+tw7cL70XFcZfSUiSR9CeT4o9m11F26bNurs2ZMxVV+fn
 xWREw3eebSBnDuGAUIob+hIhzQ4f81vt+hAFxDJSG9WeMCO5eyDwj99fivDCDuc0rwzfoVxi2cN
 lI6LDH+LK2XP26lYxq/zgBTwA+/MfYcNNKmACnMcfIiE0AugLWSvInWnQLN+Km8aVGNnp+0LDcw
 8qC2h4Fbj7ir0hQ==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64409-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:rshouriesh@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vinarskis.com,vger.kernel.org,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A709668A6A

The ASUS Zenbook A14 (Qualcomm X1P42100, "Purwa") has two front cameras
behind the SoC CAMSS: an OV02C10 RGB sensor and a Himax HM1092 mono NIR
sensor used for face unlock. This series adds a driver for the HM1092 and
the device tree to wire both sensors up on the A14.

The HM1092 binding, driver and MAINTAINERS entry do not depend on the
rest of the series and can go through the media tree on their own.

The remaining DTS and PHY patches are the A14 camera enablement. They sit
on top of several series that are not in mainline yet, listed below. With
those applied the series builds on next-20260609: the A14 dtb and every
module it touches (hm1092, qcom-camss including csiphy, and the
qcom-mipi-csi2 phy) compile and work: both sensors probe and stream
frames on the A14.

Prerequisites, in the order they apply:

  1. phy: dphy: Extend phy_configure_opts_mipi_dphy to support position
     and polarity (Bryan O'Donoghue, v1)
     https://lore.kernel.org/all/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org/
  2. clk: qcom: videocc and camcc for X1P42100 (Jagadeesh Kona, v5)
     https://lore.kernel.org/all/20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com/
  3. phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver (Bryan O'Donoghue, v8)
     https://lore.kernel.org/all/20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org/
  4. media: dt-bindings and PHY updates for CAMSS on x1e80100 (Bryan O'Donoghue, v11)
     https://lore.kernel.org/all/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org/
  5. arm64: dts: qcom: x1e/Hamoa camera DTSI (Bryan O'Donoghue, v3)
     https://lore.kernel.org/all/20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org/
  6. media: qcom: camss: Add support for X1P42100 camss (Wenmeng Liu, v2)
     https://lore.kernel.org/all/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com/

From the videocc/camcc series only the CAMCC block (patch 6/6) is still
needed; its clock drivers and bindings are already in linux-next. That
patch adds the camcc node and sets the Purwa camcc and videocc compatibles.

From the x1e/Hamoa camera DTSI series only the CCI and CAMSS-block patches
are needed; its CAMCC block duplicates the videocc/camcc series, and the
x1e80100 board patches do not apply to the A14.

Patch 1 adds the OV02C10 node. It is Aleksandrs Vinarskis' work, carried
here with his Signed-off-by so the A14 camera support stays one chain.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
Aleksandrs Vinarskis (1):
      arm64: dts: qcom: x1-asus-zenbook-a14: Add on OV02C10 RGB sensor on CSIPHY4

Ramshouriesh (8):
      media: dt-bindings: Add Himax HM1092 NIR sensor
      media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver
      MAINTAINERS: add entry for the Himax HM1092 sensor driver
      arm64: dts: qcom: x1-asus-zenbook-a14: add HM1092 IR camera and wire cameras to camss
      arm64: dts/media: qcom: keep PLL8 out of Purwa camss hot path
      arm64: dts: qcom: hamoa: reorder csiphy power-domains for v8 CSI2-PHY
      dt-bindings: phy: qcom: add MIPI CSI2 mode constants
      phy: qcom-mipi-csi2: accept PHY_QCOM_CSI2_MODE_DPHY phy-cell

 .../bindings/media/i2c/himax,hm1092.yaml           | 118 ++++
 MAINTAINERS                                        |   9 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  32 +-
 arch/arm64/boot/dts/qcom/purwa.dtsi                |  12 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  | 227 ++++++-
 drivers/media/i2c/Kconfig                          |  14 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/hm1092.c                         | 685 +++++++++++++++++++++
 drivers/media/i2c/hm1092_regs.h                    | 223 +++++++
 drivers/media/platform/qcom/camss/camss.c          |  16 +-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   3 +-
 include/dt-bindings/phy/phy-qcom-mipi-csi2.h       |  15 +
 12 files changed, 1326 insertions(+), 29 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260609-a14-himax-hm1092-bbcbe0229afe
prerequisite-message-id: <20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org>
prerequisite-patch-id: 471e9403130bb3e65cea1d2365d75ef664662306
prerequisite-patch-id: 075fa72fba3c4f51138b88972e6a5e240038d90c
prerequisite-patch-id: 4edca361ad7d370a338641d1ebb5ca65b114a244
prerequisite-patch-id: 32dd1b55ba678d00088b376e33e12d9da6241aca
prerequisite-patch-id: 24424189b11acee204622997908d85a0efbb2503
prerequisite-message-id: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
prerequisite-patch-id: dc660c63d4382e84af51241381727954bd5ed013
prerequisite-patch-id: 237410e8df475d80bede4590288b6b053b1483e5
prerequisite-message-id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
prerequisite-patch-id: 6e8e67cd3ab96a602971bbeeb7dfdeaf3f1426a2
prerequisite-patch-id: bbf431fcabc17c30fa5e804eb4accb8275198b37
prerequisite-patch-id: a7fbea14628b62a8de096dea420473b283010aba
prerequisite-patch-id: b6b6c4e7a5818e1b93fe2758902bd32d2be48509
prerequisite-patch-id: 4f11e3d079a484008a03ce750952d6e2933c0253
prerequisite-patch-id: 5f5504fd7b5eee72c3fb8c045fa57219fd2f0456
prerequisite-patch-id: 570b65b326f4c684d813f6ebeda152378dc2a47f
prerequisite-patch-id: bc5b9321c124abd961ae1f60610dc46701dc80ac
prerequisite-patch-id: 6d36feaa3a210039f87ea47aa74423a670260fb6
prerequisite-message-id: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
prerequisite-patch-id: 9430f9db2ca3486da39606aa806db3c1973ad2d1
prerequisite-patch-id: d90c86fbd38851530f9480562647703c32a86a91
prerequisite-patch-id: baa498638bf0da1bdc25a3c5e827c351d3b78e79

Best regards,
--  
Ramshouriesh <rshouriesh@gmail.com>


