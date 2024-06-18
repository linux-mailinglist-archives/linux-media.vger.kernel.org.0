Return-Path: <linux-media+bounces-13593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD0A90DBAB
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 20:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 532D21F22617
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72DB15ECF8;
	Tue, 18 Jun 2024 18:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NS89/eA9"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10E72139C6;
	Tue, 18 Jun 2024 18:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718735901; cv=none; b=rWu/41OX80DpSyZVV6M9vl6d1etHT9sDCimit0J9i3nFNdz+uJn0+yOJBmpunPmu9NEONKXXjRkl3p/vJ5pMHK+VM71pGhhuT/mE1p3J18VCaZhtbE3zRdy47AVZUh72cWTVCFHNQy8ve+u2pcUVMs56TVmhaYgUQjjzmNXy2JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718735901; c=relaxed/simple;
	bh=9iZR6qfhdq2inBfR21miynRAFj2tcgSizdsoz74Q7C0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kWNSnwYR/UcS243YrRlAPv7V6KJ+jT0PXGOwCBII9w9FWiKwe0ObUxY7srQ28knwRfDMe2rVjm37i9ChMa5japVU2DHyZhGo/SxmpMyHKzm1x+ECrDnNPDgSOSG6hgSgwiRrnSw7BV7LJ4zqkzNwKkYHgUoBhF1fDqOIg4Awar0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NS89/eA9; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718735897;
	bh=9iZR6qfhdq2inBfR21miynRAFj2tcgSizdsoz74Q7C0=;
	h=From:To:Cc:Subject:Date:From;
	b=NS89/eA9OrJeKUWAjWeVXDiTwGODlZRi/gQdOEt1zpb8O6WhLOoeqHZLFQ09MleWX
	 s1yBPsNUtBDO5QwUdd3jVIp9A264e9Q00yZVKYw5EMhMKbAztbX/S+u6orsN6YcFrr
	 1OVoRFg/yQhCtCpQUQJG5eXC2DJ1jb/CM9dC2HR0IO0MqKczoeYesXI6MVtg/gd1Gg
	 j0V7dZo2VPYd7c+BkebElRrDczuLJpplg2wTTe5uY6bMqoHZlVnjeiPDCW+0kLcZi3
	 vGlTjHnWlS/bqoU1qYEECNRckuEZ93Fd0C7MJaAf9pZ3NTpV3wU++72Vt6qugYOmcD
	 vm2oTrf4s3wrw==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8105B3780BFE;
	Tue, 18 Jun 2024 18:38:17 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2ABA24800C9; Tue, 18 Jun 2024 20:38:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v7 0/6] RK3588 VEPU121/VPU121 support
Date: Tue, 18 Jun 2024 20:18:31 +0200
Message-ID: <20240618183816.77597-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series enables Hantro support for RK3588. It is based on these two
previous series from Emmanuel Gil Peyrot and Jianfeng Liu, which looked
stalled to me. Considering the full driver is already upstream, I think
this low hanging fruit should be enabled in 6.11:

 * https://lore.kernel.org/all/20240316071100.2419369-1-liujianfeng1994@gmail.com/
 * https://lore.kernel.org/linux-rockchip/20240412151515.837824-1-linkmauve@linkmauve.fr/

Their series got some feedback from Nicolas Dufresne, that there should be a
plan how multi-core processing will be handled once it is supported in the
kernel. I had a look (and internal discussion with Nicolas) and came up with a
patch, which allows describing all the Hantro IP in DT. The driver will only
probe for the first instance. This involves dropping the RK3568 compatible
for the VEPU121, so that only kernels with the driver change will try to
handle these IP. Once the kernel is capable of multi-core support, the same
technique to disable cores 1-3 can be used to combine them all into one
cluster.

We also discussed, if they should be described as a cluster (e.g. by creating
some kind of virtual bus for the 4 encoders in DT). Apparently the VSI doc
describes the grouping of up to 4 instances. But there is no obvious reason
why only these groups can be used as a cluster. It seems that even the 5th
encoder from the combo VPU121 could be used together with the other clustered
cores in theory. In practice this is probably a bad idea because of the shared
cache of that encoder. Since that is handled with a different compatible, this
can be thought about at a later point of time and handled in the kernel. Thus
no special cluster description is needed in DT.

Changes since PATCHv6:
 * Collected Acked-by for RK3588 VEPU121 DT binding from Conor Dooley
 * Fix resource leak of DT node in hantro_disable_multicore()
 * Support disabled nodes in hantro_disable_multicore()
 * Use correct match data (RK3568 VEPU instead of VPU) for RK3588 VEPU121

Changes since PATCHv5:
 * Fix binding for vepu121 (use enum)
 * split hantro driver patch (multicore / vepu121 compatible)
 * move video-codec@fdb50000 node to correct position
 * change "jpeg_enc*" alias to "vepu121_*"
 * change "vpu_*" alias to "vpu121_*" (to be consistent)

Changes since PATCHv3 (VEPU121) / PATCHv4 (VPU121)
 * combine both patchsets, since there is some overleap
 * add patch to disable multi-core handling in the hantro driver
 * drop the RK3568 fallback compatible for VEPU (see above for the reason)
 * describe all RK3588 VEPU cores (possible because of driver change)

Greetings,

-- Sebastian

Emmanuel Gil Peyrot (2):
  media: dt-bindings: rk3568-vepu: Add RK3588 VEPU121
  arm64: dts: rockchip: Add VEPU121 to RK3588

Jianfeng Liu (2):
  media: dt-bindings: rockchip-vpu: Add RK3588 VPU121
  arm64: dts: rockchip: Add VPU121 support for RK3588

Sebastian Reichel (2):
  media: hantro: Disable multicore support
  media: hantro: Add RK3588 VEPU121

 .../bindings/media/rockchip,rk3568-vepu.yaml  |   1 +
 .../bindings/media/rockchip-vpu.yaml          |   3 +
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi     | 101 ++++++++++++++++++
 .../media/platform/verisilicon/hantro_drv.c   |  48 +++++++++
 4 files changed, 153 insertions(+)

-- 
2.43.0


