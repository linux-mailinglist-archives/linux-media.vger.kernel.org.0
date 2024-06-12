Return-Path: <linux-media+bounces-13073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C9E905A08
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 19:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BE5D1C2131A
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 17:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26DB184103;
	Wed, 12 Jun 2024 17:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="rLiCeW0i"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86978170824;
	Wed, 12 Jun 2024 17:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718213546; cv=none; b=hkwN5AxdEchwJQljRAdf9j59yRYaku0gUerB7xxcJv3MjahGXDahD7jNVCQFjYCzBuH3aQwgfFrOlIP75pGEzoNcFw9jo1L44YQtix/rgkYv2Asf+61gvjSkgXk+iTNIEK8aCqxS84AHjaDDyP54uiHgUcHZI8wITyhKklikX6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718213546; c=relaxed/simple;
	bh=H+1Gh32TLe9//W5DEjtFjRYrLhHpR4ykiLSiVsQC96s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B1JUKRyN4WjAOqe5cjv6mzfUq93tQ4oZES7eEU0xGLpNfbJLySWsfRq9CIGMIYnwaUn621h9oNg0L+vJxIraEnv9MGxQnm/iCtv4CFmsk7UE3B8RATgWwaZQKFfKFatT1b+AiHUE3g9QsElfMAIyFY/B/6O8nOLn7cqlJqfjJGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=rLiCeW0i; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718213541;
	bh=H+1Gh32TLe9//W5DEjtFjRYrLhHpR4ykiLSiVsQC96s=;
	h=From:To:Cc:Subject:Date:From;
	b=rLiCeW0iJDT+jJlR3bYdUqudRoD6iXy2Z5kB2zdmWqiPWgu2smHSHKdln9Y7OUUDC
	 F4/TYcdQ29dmUBoYPgbCNxbTI+gJpTpsel0GjhdLCV7P+NV+bv7RYG3Ir24KJz9opu
	 PKAxif+1wQMOKokJ4iWkgPLex2dfZDzNot/+gktQKHeovfImt8MX0t1bk7UhT+Ylji
	 MED8xsU2AKugrDLgfTJ09SAIWdHV4y7OLRHhAICKDhwGvG5hEuwKxDoTXZVsRsiPyS
	 Ty7J0xcTQWfEGQISIQqjgZ9SDzMg8nT1O3iTklXwE+1bW4dcRrT30ClicWA8t64poL
	 /1HJcfS3le7DQ==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A8DE03782191;
	Wed, 12 Jun 2024 17:32:21 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5958C4800C9; Wed, 12 Jun 2024 19:32:21 +0200 (CEST)
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
Subject: [PATCH v5 0/5] RK3588 VEPU121/VPU121 support
Date: Wed, 12 Jun 2024 19:15:40 +0200
Message-ID: <20240612173213.42827-1-sebastian.reichel@collabora.com>
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
stall to me. Considering the full driver is already upstream, I think
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

The series is based on Heiko's for-next branch.

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

Sebastian Reichel (1):
  media: hantro: Add RK3588 VEPU121 support

 .../bindings/media/rockchip,rk3568-vepu.yaml  |   5 +-
 .../bindings/media/rockchip-vpu.yaml          |   3 +
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi     | 101 ++++++++++++++++++
 .../media/platform/verisilicon/hantro_drv.c   |  38 +++++++
 4 files changed, 145 insertions(+), 2 deletions(-)

-- 
2.43.0


