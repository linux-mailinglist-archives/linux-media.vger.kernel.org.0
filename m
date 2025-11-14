Return-Path: <linux-media+bounces-47139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B602CC5E1B1
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 17:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CD02E35EA68
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 15:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB793451DB;
	Fri, 14 Nov 2025 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahrcm51L"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBED340D81;
	Fri, 14 Nov 2025 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133621; cv=none; b=OQUviqhYn+E9Hr9ql4K8NIE7B7VYSdPgu1QuULrzRs5dXYkeikY8Qk/W1kApjr4gY1ozwoU5kpSR93lE8OeSUqX1lTWg7DaTcw7SmDa+jdOWZ+NeM0vs934UKXs3ouHa7DJtYIy5dU2EGcman+tPijVyUDzwkmhVTc16M+hHuRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133621; c=relaxed/simple;
	bh=69R/dgMaUTHNQDK0PKLoCtuW6EWBImqfW0Ki7yZtLCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dLdu+PlEfUbYSff/rGNfJb8CNhem7l2vY3LstqP0EHBHYuIq65fcyZTg3X1v1cOHI1VtN4dkuFe16YaJeCUGNpInFlhkWh6R+L4v9XbDmpSD8oC57C3NphT3ufhcRueQQzslbjDWtkE9y/V0dHBCH71MgLyaRHf1r2DPUjppAkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahrcm51L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7B78C2BC86;
	Fri, 14 Nov 2025 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763133620;
	bh=69R/dgMaUTHNQDK0PKLoCtuW6EWBImqfW0Ki7yZtLCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ahrcm51LkfcCHcXoT18vtAmjUDZ7WIQT4LgocHiEvHSpiyqjg/uBDVKY7K0pdMkCJ
	 9isXaKj6D884axODt2xgFdSVesE1ARikgWH4BoRm4pgIac4GSYzTXWWDc6KwQu2QY9
	 fY02Rg5zgJ+qr5MgDn6vnHIxSCzTICsApph+Npz+R724g0LakAbOhgeNcdEhjVn5GY
	 Yt91bNZ4ew5WItwiTRewHCQij4KKuOPY9zQRM4jmY+sIB7eK20R9O7PGXGfi9qNEUc
	 IYMTyIX4cNjKGzaTCuEbtLR6F3GB9THsRGB+I/raUEe+mxCnRaYw58KojXGfZ1DZOa
	 S/Z8RLH+2ke8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDB5CE8D43;
	Fri, 14 Nov 2025 15:20:20 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 14 Nov 2025 16:20:22 +0100
Subject: [PATCH v15 11/14] arm64: defconfig: enable rockchip camera
 interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v15-11-8f4915ee365d@collabora.com>
References: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763133617; l=877;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=81ZusjM5KxQyAL7FhST8rDN6grI5hqe9TzQy093k8Zs=;
 b=RW7xkBfdpjnMhr7/Hx6W3YWCs+IWWdQTvAweKZv3hlffRomiucTLdUfNVz04g7cNrEMhUm6fU
 YKDhbBi1//ICPToB2UvT9GnVxGDlveCnEG71Sc0VN8IgWX0G8KqI2Tb
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs
in different variations.
Enable the driver for it in the default configuration.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..8eae6c70bfdf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -883,6 +883,7 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_ROCKCHIP_CIF=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m

-- 
2.39.5



