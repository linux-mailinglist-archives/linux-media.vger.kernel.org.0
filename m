Return-Path: <linux-media+bounces-45552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 041A3C097F4
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A2111AA6CC6
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA89E3054EE;
	Sat, 25 Oct 2025 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mt9xNRMO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3761E2957B6;
	Sat, 25 Oct 2025 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409151; cv=none; b=PpoYaKsE/J4lEVJvjfXIdOIdM7oGCSdXet2aD+henmKkEYA8iN52BbmyjZXTl4nuLYpyfOAhvk4jnGAW4KkAQNNfuVh0GOl6ml3BlsVNqduk8q8SCm7Cy76kzVxbOBdMsDDxU+G0eKh5Nj4U5h61fflcU+csPVV/aL9VBcoyJDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409151; c=relaxed/simple;
	bh=OLf6/ptVNL1scBdHLwHemDk/GF1yF4+2HTt4hWme+NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IoWJL77R2uLaDk8oN7hOh+wymtSXfgvnFrzjVmToXdU2ZhR7Rot/UvrT9We8p83VpXRKXlsUFPUSRz2WhUXlFhCg0G5CkgKENi0+HsW9GBqiqs0Cqp9mrbBdADTV7hkprR1kt0sjA/N9GQTUZmIY5bZApFd4oEhi8mRKtdSooN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mt9xNRMO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BF7C4CEF5;
	Sat, 25 Oct 2025 16:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409151;
	bh=OLf6/ptVNL1scBdHLwHemDk/GF1yF4+2HTt4hWme+NM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mt9xNRMOYDRpAaUUM8CvL0XC+H+JcdOuIU7Lffadyar1A1x6XnZrOcmv53Knbc7ts
	 dMnjKZC2lMV8CcOXNcfDaOvcm5QRV7KAgeE4SEcA5VRqzF9YT0iTAKoiUlEFPuyZaV
	 7QAbRzr8ARLc134/rLGEe8sbUw1SL4EkjWh2tqszpeo+a5e7wX7kpoxkEQtNvUeBem
	 qo1nOONoNm0mmGK1mmnFzq65dv0mchFlWAXMW9g+/FVOh1PAvtHG68FscOUxxI9adM
	 vzW/kARoqwVAnPZDL83jcrH3JvAZMbPqb6crV9N1Yw94KGcXgzqq09/1KTtrFo77vA
	 LATCUn9wLOnjQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	rfoss@kernel.org,
	todor.too@gmail.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17] media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1 init sequence
Date: Sat, 25 Oct 2025 11:57:30 -0400
Message-ID: <20251025160905.3857885-219-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

[ Upstream commit ce63fbdf849f52584d9b5d9a4cc23cbc88746c30 ]

This is the CSI PHY version found in QCS2290/QCM2290 SoCs.
The table is extracted from downstream camera driver.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- User impact and scope
  - Fixes non-functional camera PHY initialization on QCS2290/QCM2290 by
    adding the correct D-PHY v2.0.1 register init sequence. Without
    this, CSIPHY programming is incomplete and CSI2 links can fail to
    come up on this SoC.
  - Change is tightly scoped to the Qualcomm CAMSS CSIPHY 3-phase 1.0
    driver and only activates for `CAMSS_2290`.

- What the change does
  - Adds a SoC-specific init table used by the Gen2 programming path:
    - New `lane_regs_qcm2290` table programs the 14nm 2PH v2.0.1 D-PHY
      sequence, including per-lane settle count override points:
      - `drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:403`
        through `drivers/media/platform/qcom/camss/camss-
        csiphy-3ph-1-0.c:483`
      - Entries like `0x0008`, `0x0208`, `0x0408`, `0x0608`, `0x0708`
        are tagged `CSIPHY_SETTLE_CNT_LOWER_BYTE`, which
        `csiphy_gen2_config_lanes()` will replace with the runtime-
        computed settle count (see
        `drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:702`).
  - Ensures the Gen2 path is selected for this SoC:
    - Adds `CAMSS_2290` to the Gen2 detection so that
      `csiphy_lanes_enable()` chooses `csiphy_gen2_config_lanes()` over
      the generic Gen1 sequence:
      - Gen2 check updated in `csiphy_is_gen2()` (commit diff shows new
        case for `CAMSS_2290`), which is used at
        `drivers/media/platform/qcom/camss/camss-
        csiphy-3ph-1-0.c:957-960`.
  - Hooks the new table for 2290 during init:
    - `csiphy_init()` selects `lane_regs_qcm2290` and its size when
      `camss->res->version == CAMSS_2290`:
      - `drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:998`
        to `drivers/media/platform/qcom/camss/camss-
        csiphy-3ph-1-0.c:1001`.
  - Identifies the SoC variant in the CAMSS version enum:
    - Adds `CAMSS_2290` to `enum camss_version`:
      - `drivers/media/platform/qcom/camss/camss.h:81`.

- Context in the subsystem
  - QCM2290 CAMSS resources already bind the CSIPHY instance to this
    driver and versioned resources set `.hw_ops = &csiphy_ops_3ph_1_0`
    for this SoC (e.g., `drivers/media/platform/qcom/camss/camss.c:518`
    for `csiphy_res_2290` and
    `drivers/media/platform/qcom/camss/camss.c:4330` for `.version =
    CAMSS_2290`), so this change fills the missing CSIPHY programming
    piece required for link bring-up on 2290.
  - The Gen2 write path (`csiphy_gen2_config_lanes`) consumes the new
    table and applies settle count correctly at the tagged offsets
    (`drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:702`).

- Stable backport criteria
  - Bug fix: Yes. It corrects CSIPHY initialization for QCS/QCM2290,
    enabling a non-working camera interface on supported hardware.
  - Small and contained: Yes. Adds one SoC-specific data table and two
    switch cases; no broad refactors or ABI changes.
  - Side effects: Minimal. Only affects `CAMSS_2290` via explicit
    version checks; other SoCs are untouched.
  - Architectural changes: None; follows existing pattern used for
    SM8250/SM8550/etc.
  - Critical subsystems: Media platform driver (CAMSS), not core kernel;
    limited blast radius.
  - Stable tags: None in message, but the change clearly fits “important
    bugfix, minimal risk”.

- Risk assessment
  - Limited to 2290; if values were wrong, the only impact would be on
    camera bring-up on that SoC.
  - Enum addition is internal to the driver family; not user-visible
    ABI.
  - The settle count path remains computed dynamically and is properly
    injected into the register sequence, matching existing Gen2
    implementations.

Given this is a targeted fix that enables camera functionality on
QCS2290/QCM2290 by providing the correct PHY init sequence with low
regression risk, it is a good candidate for stable backport.

 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 89 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |  1 +
 2 files changed, 90 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 88c0ba495c327..a128a42f1303d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -319,6 +319,90 @@ csiphy_lane_regs lane_regs_sm8250[] = {
 	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* 14nm 2PH v 2.0.1 2p5Gbps 4 lane DPHY mode */
+static const struct
+csiphy_lane_regs lane_regs_qcm2290[] = {
+	{0x0030, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0028, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x003c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x000c, 0xff, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0010, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0060, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0064, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0730, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x072c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0734, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x073c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x071c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0700, 0xc0, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0704, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0708, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x070c, 0xff, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0738, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0760, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0764, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0230, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x022c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0234, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0228, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x023c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x021c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0200, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0204, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0208, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x020c, 0xff, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0210, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0238, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0260, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0264, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0430, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0428, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x043c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x040C, 0xff, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0410, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0460, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0464, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0630, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x062c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0634, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0628, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x063c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x061c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0600, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0604, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0608, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x060C, 0xff, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0610, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0638, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0664, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 /* GEN2 2.1.2 2PH DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_sm8550[] = {
@@ -744,6 +828,7 @@ static bool csiphy_is_gen2(u32 version)
 	bool ret = false;
 
 	switch (version) {
+	case CAMSS_2290:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
@@ -829,6 +914,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sdm845[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
 		break;
+	case CAMSS_2290:
+		regs->lane_regs = &lane_regs_qcm2290[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
+		break;
 	case CAMSS_7280:
 	case CAMSS_8250:
 		regs->lane_regs = &lane_regs_sm8250[0];
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 63c0afee154a0..377707d91ff2f 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -78,6 +78,7 @@ enum pm_domain {
 
 enum camss_version {
 	CAMSS_660,
+	CAMSS_2290,
 	CAMSS_7280,
 	CAMSS_8x16,
 	CAMSS_8x53,
-- 
2.51.0


