Return-Path: <linux-media+bounces-33638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4794AC8A4B
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 11:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ED644E2DE7
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 09:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FF6221700;
	Fri, 30 May 2025 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jt5gQHGa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC1C1F03D4;
	Fri, 30 May 2025 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595609; cv=none; b=E0qged8domkxOVCveQtHkybv0CAj5IGiSBMxbKH4Nx9NzEUITpDj0SXPZkqd7Wg8bKy77m9R7b40HQn6QynOcJfPiDAUg+rH7AgwmPXsKJlYlWljg21vCFLjgCA8E0N6gpNXVs2WSSbquNlzmwyUkdBcwcfXegcrJVHxNlZ5qOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595609; c=relaxed/simple;
	bh=lo6cRx9o+drjhg7VDcWUgYxFCl5gvqd6ftI3ofIqaGo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m6i7vQTjk8iZNoJPdaMtvVktNqj/A37ldYyX+bDSfq2OdCgsJL89cHEtBSIVtyTfeIHvANVKcT8vUhGs8R0kC1NeI9XuQRxw97j4IkWmUwUm/C1jQM3Dbk24/YXaN8HKXaZziHUixznvIXtfmBo1E6AQcJ2NIc+rS8syQGFXUic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jt5gQHGa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7B6EC4CEE9;
	Fri, 30 May 2025 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748595609;
	bh=lo6cRx9o+drjhg7VDcWUgYxFCl5gvqd6ftI3ofIqaGo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jt5gQHGaXBbQi/9RGf3H/STesPZDyri1NAA5cXOsHHIrrrqahpQWG3HtkPBnSU7M9
	 1+5VhX1UJPknpwWMGYRCe6jKoeCq73J3CGZZfkcAJa2z3yffp58GK1pb225RU6lsJH
	 2sb20xI3uo0eILgJQiMoBg+J3w/7AZ0I5DcE012pgRwg6fJXLIkPU6gLORin5pvaot
	 57LRvVYfrNLXqBhpmtYfN6KwPNPnb94W4pwS7tZsfmy0YAS9b3ixnmepS3lCQ+U7dl
	 M3Alo09OfUHcf98ZlXZXEKO5sH5FPkiL3CqlrAGN/PG24S97nQtWiV6zU/1Dz3JJLj
	 lg6zHmhKLDzuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFE0C5B552;
	Fri, 30 May 2025 09:00:08 +0000 (UTC)
From: Vincent Knecht via B4 Relay <devnull+vincent.knecht.mailoo.org@kernel.org>
Subject: [PATCH v3 0/4] CAMSS support for MSM8939
Date: Fri, 30 May 2025 11:00:03 +0200
Message-Id: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJNzOWgC/2XNTQ7CIBCG4as0rMUAdWhx5T2MC+SnncQWA4bUN
 L27tHGh6fL9knlmJslFdImcq5lElzFhGEvUh4qYXo+do2hLE8EEMOANNXpIibZTrWi+o6eqAe+
 h5YqrlpSrZ3Qep0283kr3mF4hvrcHma/r1xJsZ2VOGdVcGCsZk9qry6DxEcIxxI6sWBa/AOwBU
 QBpawsGtD+B/AOWZfkA7xH++vAAAAA=
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
 Vincent Knecht <vincent.knecht@mailoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748595607; l=3197;
 i=vincent.knecht@mailoo.org; s=20250414; h=from:subject:message-id;
 bh=lo6cRx9o+drjhg7VDcWUgYxFCl5gvqd6ftI3ofIqaGo=;
 b=2X3nAXxC8dgDav+pjFV0VCY7vdzHiuDugWFeHPbY2DgmfB9LSI8gdoKUNb3qsZVgFxqhKThwg
 U6UJ6gCc4WvDHphyHfTrmcYpV0wYiyI/4yNqtGFbleHytxoqh3jlTfs
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

 .../bindings/media/qcom,msm8939-camss.yaml         | 253 +++++++++++++++++++++
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
 13 files changed, 644 insertions(+), 2 deletions(-)
---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250517-camss-8x39-vbif-975ff5819198

Best regards,
-- 
Vincent Knecht <vincent.knecht@mailoo.org>



