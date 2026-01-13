Return-Path: <linux-media+bounces-50613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9D8D1B5B9
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE0E73061B07
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66037332EB3;
	Tue, 13 Jan 2026 21:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmUcjW3/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C188B322B66;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338580; cv=none; b=YwsjSG7A25LtFZpMg+osbL6j9aqow+rhPFSlZmwkE6vaJKe+wSy2akDwxk8OdyVzjFoEsU3xq48ppO9oG6/GS7XKjFGDrVzFUF8290NTbnZuvDGyaCInzOWJGKYriJXIQJSqpojNqDcp5T5d14YFxHj7Grnh2wRfVAAUUFKQgME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338580; c=relaxed/simple;
	bh=bpnT3O6925fCbIO7LEjBQ5v1KRFPSfTpegVEiakCJD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lgoz5638J+Y0GjNoXLJQBcflX1biE91kW2Pr14sjkT7REyyTQQiuRKFvrt9Kz5zybT5ROhzKfsbciJf6TC1foCKyyRx1VShwIWAFJu36ocmh++vyv2lotMxiF0netC4qQV3MqcLPKNkWwbj9PX7vMC4wT2cN+BXC0DuhVE04KSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmUcjW3/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9749AC16AAE;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768338580;
	bh=bpnT3O6925fCbIO7LEjBQ5v1KRFPSfTpegVEiakCJD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UmUcjW3/+aoQk8xqzuvq+iLy02YrfHgvwKxY9GHiJQO+mb8PDheUKzOjxPm7qxRpZ
	 ECcM1kIqyePnmrJDcvPBhd6ba6IdHr8CrWrgHF6HTkm+RWM97ScThqsuQiKOfFn8Iq
	 QhTqvssEmo433VDVA8Sx6qfrTaW6wP95TJh9lgmEfK9QFcr7wzK6q10556qSTapZjz
	 s56gee+lTe690VwNrpj+7xZMlw3yt1n16Ux0K/InwcDYgOYIgRtPcDvMwMpbAVYn23
	 B3U2bGg/ejldjPVCz0GmLueI54xwRZpG8nYEFY+ppL1od9arDWHyvf0v79TLyPMSlU
	 YAOdd0KlPmrXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D717D30CC1;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 13 Jan 2026 22:09:29 +0100
Subject: [PATCH v3 3/3] arm64: defconfig: enable rockchip mipi csi-2
 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v3-3-16e83aa7f395@collabora.com>
References: <20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768338578; l=776;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=QSksDylUKmnutOcH6VkgoctKLG7QY5SZKJQtcx8+btA=;
 b=TZP5/JN7UEeBHmB36Zx8QMl5/8DRGEMRJp+5QRGD/cBjjG6u0SUkGsglKuhvpcjX8wgV5nZny
 Cyz2tFJFSdHDxZjLtTOoVOKvIQan69VeNs+Tvu2DthbgVqIEzWSwkw9
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip MIPI CSI-2 Receiver is integrated into recent Rockchip
SoCs, such as the RK3568 and the RK3588.
Enable the driver for it in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..898e90b79332 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -896,6 +896,7 @@ CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_ROCKCHIP_CIF=m
+CONFIG_VIDEO_ROCKCHIP_CSI=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m

-- 
2.39.5



