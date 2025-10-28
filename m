Return-Path: <linux-media+bounces-45881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0370C17082
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 22:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EF9C4017CF
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 21:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD152E7182;
	Tue, 28 Oct 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HoGACLRn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C682E22BD;
	Tue, 28 Oct 2025 21:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761687134; cv=none; b=YGAwohDnVv/yox1C21XbZm9TGtejDwvZmVIBHrJf9hQ12EPGc9Iv2cKk5UNzxpfVn2tqL3gfUobTLXVHVtHu1vJsjis8Zh39RhCoGpt/ManYYdja7nGPHwMKXuUm3cDIHddXSiUswS07zwiQyOHOk57Vy/tZHtEv2JfqlAG8Pas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761687134; c=relaxed/simple;
	bh=2EEnmO6EhTOklvUkgMyvvlbcjjuWC8fHPgl82CQfRBQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LzBDQpo6ggChRq499BmVaNQbDaNFULtaFoRRMWzBkwL+fHaemPX/ZLjqlL9Mgrfwco7foEsdq9reLQjQUSx88Pf9NZXl4kW7OL3s1BxAC3Uf/3xqTmQiedgV15d3SoOl2ng8T7frqgRK3ybfUZQXn/2VLBr/OZkI9HMXkF07Y9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HoGACLRn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B89D1C4CEE7;
	Tue, 28 Oct 2025 21:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761687133;
	bh=2EEnmO6EhTOklvUkgMyvvlbcjjuWC8fHPgl82CQfRBQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HoGACLRnYFxYU74CYWmWbQwHT1ZAWGcXS6OpTT5SUBi4fo/+P0gW034VpaXSDVEa8
	 9dc6kuW5Ztq8SfkcYdEyu1RS90G7XbkZ8g4xJZtje+J0RZ4WGNN9UkeplAEscimKFI
	 1PAMkwJrx3q6QLu8XaReLtV9OJhGYaZCnpF7GrioTCig0lSt7ZH/gfeUnugFPsL5jp
	 KECqWsWB2k0RQlo0OIrE4JaiIT2aMr4ycQPLteH8vQcGdXbdQ+8bSpHtlrqfs2xU29
	 2gazJ5KIjOgYX+wSHh8xopnbl4xYptk4VDRyH93lP9BbWQKtffgWGzG8WHKTA93JGr
	 9WXRv+2iP8/+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5856CCF9F0;
	Tue, 28 Oct 2025 21:32:13 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v7 0/4] Add CAMSS support for MSM8939
Date: Tue, 28 Oct 2025 22:30:41 +0100
Message-Id: <20251028-camss-8x39-vbif-v7-0-91ee8becda85@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAI2AWkC/23Oza7CIBAF4FcxrMXw47TFle9x44IyYCdRMeAle
 k3f/dLGRY0uzyTznfNk2Sfyme1WT5Z8oUzxUkO7XjE32MvRc8KamRIKBMiWO3vOmXd3bXjpKXD
 TQgjQSSNNx+rXNflA91n8OdQ8UL7F9JgLipyuL0uJD6tILriVymEjRGOD2Z8tnWLcxHSc7PnRi
 O77Y6gLnAkocIt7e6XbX3bDxv+yaUZRy2r4FFQVGtQIDmzYQrOsngG9APSX7Xqa4IxECX0P+A6
 M4/gPwDZX7WsBAAA=
X-Change-ID: 20250517-camss-8x39-vbif-975ff5819198
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761687132; l=4718;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=2EEnmO6EhTOklvUkgMyvvlbcjjuWC8fHPgl82CQfRBQ=;
 b=I+25c++9OwHTEcTYPssguogzhJJOpAF/xdE47WVyuaw1jC0UcXnukhX5n78ghEm0ZcYLoJMPL
 nj/MzQ95NivC8HHrEO+rGX7+it8aoJMGro6h8FzvyRYB+/GTuH/SRZe
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

This series adds CAMSS support for MSM8939.  It's mostly identical to
MSM8916, except for some clocks and an additional CSI.

To fix black stripes across sensor output, and garbage in CSID TPG
output, 2 VFE VBIF register settings are needed.  So the 2nd patch adds
helper functions to do just that.

Patch 1: documents qcom,msm8939-camss DT bindings
Patch 2: adds helper for VFE VBIF settings
Patch 3: adds CAMSS_8x39 version in CAMSS driver
Patch 4: adds camss and cci in msm8939.dtsi

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
[André: Apply reviewer comments]
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v7:
- Fix revision (previous submission was wrongly labelled v1)
- Pick up tags
- Rebase on latest next/master
- Link to v6: https://lore.kernel.org/r/20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu

Changes in v6 (was wrongly labelled v1):
- Move bindings patch to the beginning
- Make the order of {reg, clock, interrupt} items the same as in 8916 +
  append additional items
- Drop R-b tags from bindings and dts patches as order of items was
  changed
- Link to v5: https://lore.kernel.org/r/20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org

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
      media: dt-bindings: Add qcom,msm8939-camss
      media: qcom: camss: vfe: Add VBIF setting support
      media: qcom: camss: Add support for MSM8939
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
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20250517-camss-8x39-vbif-975ff5819198

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



