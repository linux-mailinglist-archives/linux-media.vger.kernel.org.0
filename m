Return-Path: <linux-media+bounces-50952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BE5D38F6C
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 16:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E036C300A53A
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 15:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81D024E4B4;
	Sat, 17 Jan 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbIGeomJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137EF217704;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768664182; cv=none; b=oEtYO1KWxsehOy87nRl46KlO4k7oQMubKQHXCc/u6GM+lpQ1R7m9T6sBdFjNShpgwtc7bKcYQLyHkm9BVzK5RXDEIL8CiK7SCK0wy+Z+mcirjI5ug/5eiWogfEl+Jzsb9HwGYqFqtK7Ex5Vsmr0dIPAZSce3iGCiAaaDv/6omtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768664182; c=relaxed/simple;
	bh=V/kaEQX6C9SzR/d+NfS8UjTNWsrCLCWH8jNuXnCCVxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s0ogyhNSvlcW58E0oB0j9+mU5yWVNTQylNqV9wcMoMPSmsIZSTItG62Jo9w/RwKtsJc4tuz+Qt/yq39jnE45H0rMKdXpgPcQ3OMaX7jL73WA7D3aXe4NP466QXR4ea49Dvqve9cEH5l5BCCVecGK+Xl8AjZQD7thSpCz52OegDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbIGeomJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7235C19425;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768664181;
	bh=V/kaEQX6C9SzR/d+NfS8UjTNWsrCLCWH8jNuXnCCVxk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fbIGeomJsSIMjvDQaj6zU3bHJ+Sor+z1+9N4aaPh4BJzbvbiprRhVJqPbcspyYUCQ
	 wLS9N/Ev97Ziufe3OyS2yMxykWQKYczpbNBlgh/qQAth2CxntFBDGeaL+4tu65vEGu
	 dB+NigKi3hqTMHbqTmxPVTKZAQ8JZW9ONjpHiWLS9cC2/HrO70annONDGyu2O7Nx3X
	 rQN5pHezwAZhE353HHLAW4ZgeYbe7EhJKTDnv8vlEhM6wEkhTX8r0i5293I/AOPzkp
	 hNY3KE9oMlMfYvgUTu5MMMYSfICVEqo+to4+WAix4yktp8nhN7AJ+mpslWSs2F0PHg
	 yaflnhSTWuL9A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD832C9832D;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 17 Jan 2026 16:36:18 +0100
Subject: [PATCH v3 3/8] media: qcom: camss: Prepare CSID for C-PHY support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-qcom-cphy-v3-3-8ce76a06f7db@ixit.cz>
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
In-Reply-To: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=VE5OUEM0X//rg3dmLrS4SJXKFfJ1U9PcL8DiivLtXg0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpa6xzITwS/qRe5tCt5L/y7dS4eFjQyWEM91iFf
 Ze39edfJGeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaWuscwAKCRBgAj/E00kg
 cgmCD/4+0b1str0cfp4PXBJrESYb8LEnUw1FKC0yicVMLpcrdojfw1/yBTNJ6nY/7uJ1QsU5C/I
 FgTK+htUhY4Lejj7qrl5PZQe9x49m1N57X2b14SKGTek1khbctUmDgLxAs+0AhQZZgNzcPySgNc
 znU3cZFNwfBLMzE4mCwAkMoU68maAqOwNnACf9iA0aMn5WeL/hbtxnaHaPT1bB6lL+3Zw2nUpsX
 W+1QXus9kXgUEDajcszgUG52QcfNsIliYH0aYAa/2BCZPGwNN8pwxEOSDkF7rIbU8A88PuNLwY1
 YGNH99dsgnO9XuZjPcbnKuuTadaQSN8Okvmk6q9cmb6C/nKsVWLM8IiB51nQF0np3w9n7Qvnu9M
 4wBXuujEN6TnQaBCvcpRcWq0QBbN74hCJ8yYihTXEIYl2+BCv/MMBl4O47vmH92ARjCXsPrWrfq
 CMrUEuJjrEUECsT3+gJn805C/LvWTZBDZqAIPpNGd/rm3TRsSMjyIz80CJIcwVKdyHb2DT/RI2n
 er3xig6JevPz4MX3tdcKC9/yG/ioP0CoeyeTS4d059XO59tCHZmlExsbin/zhNWWx1aICgqtswX
 GLxLDe/XheHIJZZdkFLZoOATcAC7OcjX4HWRjq8hXedp+H2NwbX4e9wdLTVXLKSvJ6peOT9FHr8
 IzlNlbo/MJjbIjw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Inherit C-PHY information from CSIPHY, so we can configure CSID
properly.

CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
 drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
 drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 2a1746dcc1c5b..033036ae28a4f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -183,6 +183,7 @@ static void __csid_configure_rx(struct csid_device *csid,
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
+	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index ed1820488c987..b50b0cfe280c1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1275,6 +1275,7 @@ static int csid_link_setup(struct media_entity *entity,
 		csid->phy.csiphy_id = csiphy->id;
 
 		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
+		csid->phy.cphy = (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
 		csid->phy.lane_cnt = lane_cfg->num_data;
 		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index aedc96ed84b2f..a82db31bd2335 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -70,6 +70,7 @@ struct csid_phy_config {
 	u32 lane_assign;
 	u32 en_vc;
 	u8 need_vc_update;
+	bool cphy;
 };
 
 struct csid_device;

-- 
2.51.0



