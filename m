Return-Path: <linux-media+bounces-34726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDDFAD87FA
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37FCE3ADFF2
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 09:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49ED2C3768;
	Fri, 13 Jun 2025 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+6teXS1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BDC1ACEAF;
	Fri, 13 Jun 2025 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807218; cv=none; b=EBp6J11fJ2p7+T8gDC+jx2bkkMbL53l9lKNYXYobAHX5qC1SB2ptEPXUYXrsZOCbJ62l1eUC/vMNWEpGSNwZzosJW9dICC9HGUMs7T7NCrBjtr/ezsmtsR7bEn5gqANZefrgGpqap1mdV9lFpUg5QoYiHL+Rc9CugQRCrFOpcAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807218; c=relaxed/simple;
	bh=i5Pf6Oznv55GrsWogxX5kmhEiTAMxh9TsID82AiML3Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o1H7p88zyq/EJLGDbSEekAMHAjNBoxHnv0XVprfYtWs7qpWb9dbXzEcY1SSnVAaUvNSozrrNo1Ehg+vS4zH5nFBh2gCpkBwGaZtZV8rDsIs6a+5dP9NISedDJADD0Q/nUAr4JzHNpAZ81KJhGuz7p43Zsp7vx3rjgeswxK8M8SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+6teXS1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F4ACC4CEE3;
	Fri, 13 Jun 2025 09:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749807217;
	bh=i5Pf6Oznv55GrsWogxX5kmhEiTAMxh9TsID82AiML3Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=L+6teXS1T5Unxh1aMNXnLi+T3Pf2YrRV3HC62I4vL0zzyMYohQQ8bS2d0dWaJiKGM
	 FXSUJUaRb9y8JO232i40qyll6HPwRq7eL0x6Hx8NkrUXi2S9DZJ4EUQkmnfk5wVjT/
	 KMnVS4HrpsFoDo7T7pe0sr5ggrt9p9EY302a+2RVPywsz6lUSEJIOmdTtr/RufaEtB
	 eM1hc79qDUtBYvARqGZYbqs3Crc+Dyqr5UsN0upgNVPkVls2wEBKURHktRR4KWZeoL
	 5Fd51UJJN7r/be4jIgC1r+746iuaBrrRP2gqWodtRaF5cRAaYNVvz9l9CP5t47FP3d
	 eu+WfquKRA9IA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7E9C71136;
	Fri, 13 Jun 2025 09:33:37 +0000 (UTC)
From: Vincent Knecht via B4 Relay <devnull+vincent.knecht.mailoo.org@kernel.org>
Subject: [PATCH v5 0/4] CAMSS support for MSM8939
Date: Fri, 13 Jun 2025 11:33:26 +0200
Message-Id: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGbwS2gC/23OwY4CIQyA4VcxnMVAmTKDJ99jswcGqJKoGNgQN
 2beXTQmumGPf5N+7Y2VkGMobLu6sRxqLDGdW+B6xdzBnveBR9+agQAUKEfu7KkUPl2V4XWOxM2
 IRDhJI83E2tYlB4rXp/j13foQy0/Kv88DVT6mLwtEZ1XJBbcSnNdCaEtmd7LxmNIm5T17YBU+A
 ewBaID2yqNDSwPqDlAfgPrnA9UAckZ6ifOMvgeGN6AF9MDQAAUOxtFPZGb6AyzLcgenXWBgcgE
 AAA==
X-Change-ID: 20250517-camss-8x39-vbif-975ff5819198
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749807215; l=4058;
 i=vincent.knecht@mailoo.org; s=20250414; h=from:subject:message-id;
 bh=i5Pf6Oznv55GrsWogxX5kmhEiTAMxh9TsID82AiML3Q=;
 b=2pRtnf6EQ/OQ0rv2g+LD7BCVUlddoVZtLWAlJgAXmQi/uvheBpGb5hAsvhNvE4i03Fsfcx0HD
 H8/70EE2cIwAphRYXLu2fxtY96H0MxJveM8HjAycouveQS2GilaJeV3
X-Developer-Key: i=vincent.knecht@mailoo.org; a=ed25519;
 pk=MFCVQkhL3+d3NHDzNPWpyZ4isxJvT+QTqValj5gSkm4=
X-Endpoint-Received: by B4 Relay for vincent.knecht@mailoo.org/20250414
 with auth_id=377
X-Original-From: Vincent Knecht <vincent.knecht@mailoo.org>
Reply-To: vincent.knecht@mailoo.org

This series adds CAMSS support for MSM8939.
It's mostly identical to MSM8916, except for some clocks
and an additional CSI.

To fix black stripes across sensor output, and garbage in
CSID TPG output, 2 VFE VBIF register settings are needed.
So the 1st patch adds helper functions to do just that.

Patch 1: adds helper for VFE VBIF settings
Patch 2: adds CAMSS_8x39 version in CAMSS driver
Patch 3: documents qcom,msm8939-camss DT bindings
Patch 4: adds camss and cci in msm8939.dtsi

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
Changes in v5:
- Patch 1: no change
- Patch 2: no change
- Patch 3: (bindings)
  - Fix alphanumerical ordering wrt. underscore (Vladimir)
  - Add 1.2V mention to vdda-supply description (Vladimir)
  - Correct vdda-supply regulator name for 1.2V in example
  - Add empty line between properties and child node (Vladimir)
  - Remove clock-lanes property in example (Vladimir)
- Patch 4: (dtsi)
  - Apply ordering and isp node unit address changes from patch 3.
- Link to v4: https://lore.kernel.org/r/20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org

Changes in v4:
- Picked up tags
- Patch 1:
  - Fix alignment to match opening parenthesis (Bryan)
- Patch 2: no change
- Patch 3:
  - Wrap line at 80 chars (Krzysztof)
- Patch 4: no change
- Link to v3: https://lore.kernel.org/r/20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org

Changes in v3:
- Patch 1:
  - Use braces around multiline (Bryan)
  - Rename vfe_vbif_reg_write to vfe_vbif_write_reg (Bryan)
  - Get rid of switch block on CAMSS version (Bryan)
- Patch 2:
  - Get rid of switch block on CAMSS version (Bryan)
- Patch 3: no change
- Patch 4: no change
  - Tried to get rid of CCI camss_ahb but this resulted in device
    freeze+reboot (Konrad)
- Link to v2: https://lore.kernel.org/r/20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org

Changes in v2:
- Patch 1:
  - Fix devm_platform_ioremap_resource_byname line to not end with
    opening parenthesis (media-ci/1-checkpatch)
  - Move camss-vfe-4-1.c handling of VBIF previously in patch 2 here
    (Dmitry)
- Patch 2:
  - Declare regulators in PHY entries, not CSID ones (Bryan)
- Patch 3: (bindings)
  - Fix bindings checks for new errors (Rob)
  - Fix properties ordering, code-style and example (Krzysztof)
  - Sort reg-names, clock-names and interrupt-names alphanumerically (Bryan)
- Patch 4: (dtsi)
  - Move #address/#size cells before status (Konrad)
  - Aligned CCI with msm8916, thus removing ispif_ahb mention (Konrad)
    If "camss_ahb should be unnecessary", it's still required by qcom,i2c-cci.yaml
- Link to v1: https://lore.kernel.org/r/20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org

---
Vincent Knecht (4):
      media: qcom: camss: vfe: Add VBIF setting support
      media: qcom: camss: Add support for MSM8939
      media: dt-bindings: Add qcom,msm8939-camss
      arm64: dts: qcom: msm8939: Add camss and cci

 .../bindings/media/qcom,msm8939-camss.yaml         | 254 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi       |   4 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 146 ++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-ispif.c    |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  12 +
 drivers/media/platform/qcom/camss/camss-vfe-vbif.c |  31 +++
 drivers/media/platform/qcom/camss/camss-vfe-vbif.h |  19 ++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   3 +
 drivers/media/platform/qcom/camss/camss.c          | 157 +++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 13 files changed, 645 insertions(+), 2 deletions(-)
---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250517-camss-8x39-vbif-975ff5819198

Best regards,
-- 
Vincent Knecht <vincent.knecht@mailoo.org>



