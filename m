Return-Path: <linux-media+bounces-13997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A939E913F25
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 01:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAB5F1C20EC8
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB81188CC0;
	Sun, 23 Jun 2024 23:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2kMbeVl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F8D185E66;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719184976; cv=none; b=e4bk/yFCJPMvk3BSyygRmgXk5RcW8Aa9TzlAAa9WTn3iNee/KQ/1jIEoqvk3Qm26YdT3D8ZXe1KsOLg1cbokiLG0qBume2C6whphzZqZkiZ/OLvMonSA92ZqDfsWzCH7pQOYxGUUqwWHKe04ABFx7pZSqBdTDhIMorwlrpIAsV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719184976; c=relaxed/simple;
	bh=DhTilDr3SIjitHMdJcG3ZDB6dsKcEVqpxMzh5u/CJu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sQ5ePLCilvWFN558rjwk5Xo9RESg0PZ/7XotGl5VpsjjbhHHIMAl1GlTEnTo4egOISOy3wJlRrLQKwmN9wehG5/p6xja+HyWrGQh5Q0TIHEKEMPkwF09GYBfnsVJmtK05KUcEJaL4V25NDm0dSckFHWItYHsv7o6WIHdPcW8NA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2kMbeVl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1458AC2BD10;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719184976;
	bh=DhTilDr3SIjitHMdJcG3ZDB6dsKcEVqpxMzh5u/CJu4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=K2kMbeVl9tS7cTvAqEjn0Bnw9tAfvAS6mFioz1wjugzTPCvjYcwA/AQkA6Eu7bptJ
	 /s2YvjlUUR7KWhL9bwYuLXGVrbhET4yCSFjmjDM2DV3zjYGzXfSsauBNf+OZCr81t0
	 yYEZ4ThfQkK6qToB5a2GvwwdouKBYCIgrJmADZOzC7kQHmgbKc/Q5iURf3oVdXsbep
	 mDls03pdGxrn2YJ23vcPDj+fP1xXdYVFjJ5SS1y1q4jxfBR18pNKZZhSnhxMZWSkud
	 enXtEHBF1sTVl2HKT6iwkN39Ly9n8ToywTSUk43yaHhBHZHJ6IfeIh4PFFcHRxvLMp
	 DaSNb693Hyzgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08375C27C4F;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Subject: [PATCH v2 0/8] Add sc7180 camss subsys support
Date: Mon, 24 Jun 2024 07:22:39 +0800
Message-Id: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD+ueGYC/3WNQQ6CMBBFr0Jm7Zi2NGBdeQ/Doh0KTCJgOoZoS
 O9uZe/yveS/v4PExFHgWu2Q4sbC61LAnCqgyS9jRO4Lg1HGqsZoDBaFWn1RSH4WQep7akKjvAs
 WyuqZ4sDvo3jvCk8srzV9joNN/+z/1qZRobaubp1xQ63ibZw9P860ztDlnL9m9ZX1rgAAAA==
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Chan <gchan9527@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719184973; l=2579;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=DhTilDr3SIjitHMdJcG3ZDB6dsKcEVqpxMzh5u/CJu4=;
 b=d0e0eTFGCBdEmAlzwkVaV5EVF3iIUoGTcFxwLBM3ga77ZM9sLJ18B2N32eUL7OrxxfMBIxttB
 2G+5mhvy5w6CdRKn6kN5+TczlinA+so5/9BV8PZNW2SV9nFHR6BPhbk
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=Ac2fkTqgUBlj2sns9hRIWJTYhWHO1BsmHbdBb5UpUUY=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20240621 with
 auth_id=176
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

SM7125 is the SoC found in the Xiaomi Redmi Note 9 Pro(joyeuse) cellphone.
This series adds support to bring up the CSIPHY, CSID, VFE/RDI interfaces.

Since SM7125 is a low-speed variant of SC7180, SC7180 testers please
take a look and have a test as well.

sc7180 provides

- 2 x VFE
- 1 x VFE Lite
- 2 x CSID
- 1 x CSID Lite
- 4 x CSI PHY

The sc7180-camss binding should be comaptible with sdm845 yaml.
I've copied a new yaml from sdm845-camss.yaml, strip all _src clk and
put new maintainer information. If this is not desirable then i can add binding to
existing sdm845 yaml instead.

In addition, a bootable tree of sm7125/joyeuse is availble at:
https://github.com/99degree/linux/tree/camss
  

Signed-off-by: George Chan <gchan9527@gmail.com>
---
Changes in v2:
- Revised dt-binding as stated by krzk
- Added dt-binding item power-domain-name as stated by Bryan
- Combine patch #2 and #3 as stated by krzk and Bryan
- Split eror-print log for clk name from patch #5 as suggested by Konrad
- Reformat dt-node of camss as stated by krzk
- Corrected phy init sequence for v1.2.2 as spot by Bryan
- Added 3 more debug info for missing clk and low clk-rate issue.
- Adding port info to ports sub-node
- Adding required-opps node to dt
- Link to v1: https://lore.kernel.org/r/20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com

---
George Chan (8):
      Add qcom,sc7180-camss
      Add Gen2 v1.2.2 two-phase MIPI CSI-2 DPHY init
      Add sc7180 support
      Add sc7180 resources
      Add debug log info to camss_enable_clocks function
      Add debug log info to msm_csid_subdev_init function
      Add debug log info to vfe block init and set clock rate
      [RFT]Add support for sc7180 camss subsys

 .../bindings/media/qcom,sc7180-camss.yaml          | 327 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 135 +++++++++
 drivers/media/platform/qcom/camss/camss-csid.c     |   4 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 135 +++++++++
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +-
 drivers/media/platform/qcom/camss/camss-video.c    |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 218 +++++++++++++-
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 9 files changed, 828 insertions(+), 4 deletions(-)
---
base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
change-id: 20240621-b4-sc7180-camss-cddc6b60a9b4

Best regards,
-- 
George Chan <gchan9527@gmail.com>



