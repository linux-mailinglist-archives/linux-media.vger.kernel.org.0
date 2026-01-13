Return-Path: <linux-media+bounces-50490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C184ED1627A
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 02:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D66AA3091454
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 01:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AB926CE2C;
	Tue, 13 Jan 2026 01:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJkGBYNO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF527081F
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 01:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267345; cv=none; b=o1VhizE9r8HvNgIXc4CV7LKsNIp3E46aA4COMAbBMyJupOPiWncF6GVHSnqlb0TcH6mMoKcVYOedyqA3hTSeaYJ3ftwK8QX1yfLOR8oK/HlkRqK+sKngaS36sj8+Y5Cm30M1BCUa8U+4jRVe1ZqUMhag7ChxPbVo/iy3pzpP7W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267345; c=relaxed/simple;
	bh=VCwkzMHtIplTr8Ryi3CRjRu4i1dHJUUxBmT36Pv+lus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PyKf8hslA25ko21UYTIS2niDa3tR99B9sF8FRC8skQHhm0N24I1hi05OH67HUH2ZCqzc4pxJmOFW6GBrWfRXistZkNOrqwcNfmYfvxAOd9FUmWu3jV20w0tXLU9euvS6jj12PdZRfYQgImFt1TURamlxPJhT5sLwUgJViOXBbEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJkGBYNO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3E3C116D0;
	Tue, 13 Jan 2026 01:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768267345;
	bh=VCwkzMHtIplTr8Ryi3CRjRu4i1dHJUUxBmT36Pv+lus=;
	h=From:To:Cc:Subject:Date:From;
	b=RJkGBYNOpyRQSTtClSZjz/YfyKGHNpV//xNV/OzYI7ujyHq7ltSM7qvBbPidwJ0zF
	 0iuu5iVNxRM3+kVpfqA3iFSGOnsYbPqYlS71JbqaL3WyDiX0Tx0GsiM74gK+HTqUsW
	 JBIxH+4r3/qiwa4/tkyrZFxWw+ZlsWD4aCPRbEZz5Y3N7TQFP74zlJleGAHp/Y0MYJ
	 eynW0q1QDcoBVZYgaBz0F5SRmQOSi2I7wyuzXD3Oeef6I3Saz1tpqYjPemK2byt0Wz
	 aHe7otrZUyHCNkvNMfnkXcYEFmwqnrqFE6qJlyfPYgee8FJNv5FqmLACOf4poAoMDY
	 Jp22fdpunYQhw==
From: bod@kernel.org
To: bod@kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org
Subject: [GIT PULL FOR 6.20] Please pull platform-qcom-camss-6.20
Date: Tue, 13 Jan 2026 01:22:15 +0000
Message-ID: <20260113012230.5907-1-bod@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 3aa9296a23ec41a8424e9a2346eea59fb6cb7d8c:

  media: i2c: add os05b10 image sensor driver (2026-01-12 08:43:11 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-camss-6.20

for you to fetch changes up to 17bce0a2ae9674b707ed6ed2171f1b59cab8f05b:

  media: qcom: camss: add support for SM6150 camss (2026-01-13 01:10:35 +0000)

----------------------------------------------------------------
This tag includes

- Support for a new SoC sm6150
- Support for setting CSIPHY regulator loads
- fwnode changes to simplify remote-endpoint parsing
- A nice bugcatch fixing inappropriate array indexing
  in an ISR
- Two further minor fixes for clock-enable and an unused variable
- A final yaml fix tightening up PHY supply descriptions

----------------------------------------------------------------
Alper Ak (1):
      media: qcom: camss: vfe: Fix out-of-bounds access in vfe_isr_reg_update()

David Heidelberg (1):
      dt-bindings: media: Correct camss supply description

Hangxiang Ma (1):
      media: camss: csiphy: Make CSIPHY status macro cross-platform

Loic Poulain (1):
      media: qcom: camss: csid-340: Fix unused variables

Vikram Sharma (1):
      dt-bindings: media: qcom,qcs8300-camss: Add missing power supplies

Vladimir Zapolskiy (3):
      media: qcom: camss: Do not enable cpas fast ahb clock for SM8550 VFE lite
      media: qcom: camss: change internals of endpoint parsing to fwnode handling
      media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function

Wenmeng Liu (3):
      media: qcom: camss: Add support for regulator init_load_uA in CSIPHY
      dt-bindings: media: Add qcom,sm6150-camss
      media: qcom: camss: add support for SM6150 camss

 .../bindings/media/qcom,qcs8300-camss.yaml         |  13 +
 .../bindings/media/qcom,sa8775p-camss.yaml         |   4 +-
 .../bindings/media/qcom,sc7280-camss.yaml          |   4 +-
 .../bindings/media/qcom,sc8280xp-camss.yaml        |   4 +-
 .../bindings/media/qcom,sdm670-camss.yaml          |   4 +-
 .../bindings/media/qcom,sdm845-camss.yaml          |   4 +-
 .../bindings/media/qcom,sm6150-camss.yaml          | 439 +++++++++++++++
 .../bindings/media/qcom,sm8250-camss.yaml          |   4 +-
 .../bindings/media/qcom,sm8550-camss.yaml          |   4 +-
 .../bindings/media/qcom,x1e80100-camss.yaml        |   4 +-
 drivers/media/platform/qcom/camss/camss-csid-340.c |  10 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |  18 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  21 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  19 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-480.c  |   6 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 586 +++++++++++++++++----
 drivers/media/platform/qcom/camss/camss.h          |   3 +-
 19 files changed, 980 insertions(+), 170 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm6150-camss.yaml

