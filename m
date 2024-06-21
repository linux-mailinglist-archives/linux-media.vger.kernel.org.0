Return-Path: <linux-media+bounces-13909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 890129120F2
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 11:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 422B4281573
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 09:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D0016F82A;
	Fri, 21 Jun 2024 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9a9Ifh+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B037B16E89E;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718962857; cv=none; b=Iiz4ar/Eh59FyIaHvwQNMa36IddVXDkDN5VVseA/UI0Xx4mHHN1anjhqs+1kw7gKr/eh8KpZuSWoHFIezP114t/3gXpvPCuanFkqB+pbY/cENIIY2kg8b7OmV55Py4g6BV0OQrtXGhg5SJUEK/hRC8fAMrMhiKHY1Mm/5YpFKIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718962857; c=relaxed/simple;
	bh=ZVXJbWByUzIKTOC7VscBLLwylCglSs2J2Rvmr2V8T5A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hQeVng7Fl/n9b3qv72QZre2ixUY9HU0GrdVpXw5nc+f8wo8MAVIw7DlRfsu2Yo5hFIYot74ab3U3Ltxj0oD1YHN9otuM1Fd8pdC4kt0vt7iYS/hvH13SP/rqgEqI87rLXv3Mi925Qlqo9rEkRGLyOE4M3dhpwj6fVjE6217ujV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9a9Ifh+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C26FC2BBFC;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718962857;
	bh=ZVXJbWByUzIKTOC7VscBLLwylCglSs2J2Rvmr2V8T5A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=t9a9Ifh+bD9lt8eMom0eEB7hbcAsRYIdOdBb9O058tDO7Kmzvxo9w6yK/fo1bvOJW
	 LIb+qkkPJn/7cO0b4W979WDXZj8MSBM7H1bwcNK/WVzwuxEvo8NgX2FUIEgWwxF+ow
	 43cPVWG7LfnCJ9llkHa9chOZE5HElIESUn4H1MBzORC1TKBtQv8u5xHQr3cB0rpKfw
	 RatY5r0g62zA7Dk4GMtJMCioqLBtsxRthEv8HJ4a+8+f9LDvgp6jQce1V3QyGaZMGC
	 7RUGohWUHmODpT/Dxv+l5onru5+eaOJfyAL64TcbuUZMBlFNCO+yjUobb66Vs7Dfl9
	 UWnSKDhToQJmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CDEC2BA1A;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Subject: [PATCH 0/6] media: qcom: camss: Add sc7180 support
Date: Fri, 21 Jun 2024 17:40:52 +0800
Message-Id: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKRKdWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyND3SQT3eJkc0MLA93kxNziYt3klJRksyQzg0TLJBMloK6CotS0zAq
 widGxtbUA0tGVeGEAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718962855; l=1917;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=ZVXJbWByUzIKTOC7VscBLLwylCglSs2J2Rvmr2V8T5A=;
 b=BnsW7oejRFpwuGmmirMaAx9oEYiaBpv3Qz/M2DX4n3OI8yXFjAvAEpaiy89G07uhalR+jN7Gy
 AaiYtcEU7BxBFzn//FTtSNerwZ79KNwxLH9n3Zcgy1FR9/ZUjzk6zkA
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
I've copied a new yaml from sdm845-camss.yaml, strip all _src clk and leave
original maintainer. If this is not desirable then i can add binding to
existing sdm845 yaml instead.

In addition, a bootable tree of sm7125/joyeuse is availble at:
https://github.com/99degree/linux/tree/camss
  

Signed-off-by: George Chan <gchan9527@gmail.com>
---
George Chan (6):
      media: dt-bindings: media: camss: Add qcom,sc7180-camss binding
      media: qcom: camss: Add CAMSS_SC7180 enum
      media: qcom: camss: csiphy-3ph: Add Gen2 v1.2.2 two-phase MIPI CSI-2 DPHY init
      media: qcom: camss: Add sc7180 support
      media: qcom: camss: Add sc7180 resources
      [RFT]arm64: dts: qcom: sc7180: Add support for camss subsys

 .../bindings/media/qcom,sc7180-camss.yaml          | 324 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 134 +++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 120 ++++++++
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   3 +
 drivers/media/platform/qcom/camss/camss-video.c    |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 218 +++++++++++++-
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 8 files changed, 801 insertions(+), 1 deletion(-)
---
base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
change-id: 20240621-b4-sc7180-camss-cddc6b60a9b4

Best regards,
-- 
George Chan <gchan9527@gmail.com>



