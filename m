Return-Path: <linux-media+bounces-51039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7635ED3A599
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 11:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 579593115047
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 10:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CFC357A58;
	Mon, 19 Jan 2026 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkuyDe+E"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82483FEF;
	Mon, 19 Jan 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819417; cv=none; b=MhiEY3WPu9bIvWz2/oM+nm0fK3yDIH1iMJ8zjz1NMv48CqAdCy/OJ+sF3KWhUvLEVc/4aist8p5zLYP38QiHbto7SVOzRY4hdfBi7vdKpup/LQojWkRi6u3AiqwtGTG55myjKy0u7luZXGyZb+a+bLBx/hf7kbO3DkLkrB2XXGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819417; c=relaxed/simple;
	bh=SBMojAQMLBEsq97VBBgUN3ogr+3rX2KzJ0Dl48KhAsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hruurKvupK8H57uVy51ofdeLA4bO4TSSlwGdjxqB6a+HxPjno47KRof2+dd37tuPbh2TFGVRo6GMZ250P6b5jWiOWBKUd1Neo1v8Hp3mNm18vht372aGHH2W1PC3NobQkMTSjjQcHWOqLUGvtfE03ot73SgyMh/l8RiQkCE+D44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkuyDe+E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8245C2BC9E;
	Mon, 19 Jan 2026 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768819417;
	bh=SBMojAQMLBEsq97VBBgUN3ogr+3rX2KzJ0Dl48KhAsI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RkuyDe+ExkcPHo/mrgpS+JMdSXGp91d8Du4ZHMVJGbCGqay86qPqlP/ZKFc0IZCRD
	 IH9+C3t2gMz5fp6z2aL98Lyu6TAjzvBEj5Cz22phalaehF1LoPSJMES7SOkRlT4+kq
	 KYnhH17rdfcTCxsOWsz1SyH2MhQYX5s+K809n8SQXtrfUlczNohFCJH6I32PFgiyBC
	 XRGdlLbaIs9zoADDEEvj5+bscA5MeshsPUDhJ0II4RRX1j039jphmyY5OoTt1UkNV6
	 dVeEiEUTE7t2Mg4aHJUpGqXziji66OPsW0iIWErMDv63yss07CkR9BiZg1K82LzhOG
	 tkw2mrBYxhywg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8BCCA5FF6;
	Mon, 19 Jan 2026 10:43:37 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Mon, 19 Jan 2026 11:43:37 +0100
Subject: [PATCH v7 3/3] arm64: defconfig: enable designware mipi csi-2
 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v7-3-42ff419f9b51@collabora.com>
References: <20251114-rockchip-mipi-receiver-v7-0-42ff419f9b51@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v7-0-42ff419f9b51@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768819415; l=786;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=4/e4J7LessS5jdywMTVpeb4iDs9BMTFRupZRi4shvqg=;
 b=fuGnvx3Vg9ehc+99lHBmiG8z4gaPPI9KQ+QqmK2PHxxH+v1HPVBSwsN83ExbpsaCD9ptw5QzB
 odV6ClhYdtZBqgLPzIFCd0lnGgK/5hOXYJJE7/EdvDWwJ1GIzK3zTV5
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The Synopsys DesignWare MIPI CSI-2 Receiver is integrated into
recent Rockchip SoCs, such as the RK3568 and the RK3588.
Enable the driver for it in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..58bda738819a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -873,6 +873,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
+CONFIG_VIDEO_DW_MIPI_CSI2RX=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m
 CONFIG_VIDEO_MEDIATEK_VCODEC=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.39.5



