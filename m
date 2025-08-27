Return-Path: <linux-media+bounces-41142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8D3B37E6C
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38DD63B2E33
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 09:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323D734AAF6;
	Wed, 27 Aug 2025 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BYls46lp"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A323451A3;
	Wed, 27 Aug 2025 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756285703; cv=none; b=FLizaSN10ZVaYVRfKGk+XDI4LvhMsQHvrwAUjquxCOpjBvEgKbmU3k7tFrXC/7ynFNPVp7zfby7AK5a/caRGAe73cO3ZETQ/iNWDjA3XB2lC51HLBHLDBNxDW3njbNF6LLlZ/2QhdEiYfGzlKZVjlYTkc9Yw8bWda7iXPAugxWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756285703; c=relaxed/simple;
	bh=7oF5B1NcfXS5Ejllve18Lu8CkCdO1s4cDKW0kAkJT9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUY5Hhwr5+OAYycibp/roWClsIO+FS9zUw2y4QcwENiwVnp+HjvHFzBsrdELaCiaMPQd0jukCyu40IeVRVj/tlEKRbOX0282Zd9a4dBVBSzRrrmPvfhIzf056l/0yErgciT4GLj+OGFQKcDyp4B5F/TE26s46rkrnq8nsOAmTyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BYls46lp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756285699;
	bh=7oF5B1NcfXS5Ejllve18Lu8CkCdO1s4cDKW0kAkJT9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BYls46lpujxTxM7N/tSNSzrIau2E1ZcS7Rlv2EV0UrWJl1zAnWsTF8Ru+y0rUPMC4
	 LBWM1xfAQ3sJfEhKAuWjcXW+bb0BlVDBtMZaT5FAkU4f/1e6xZ10leiQ0N0InwHadA
	 fWn8dpB8xlIJ8gGPgbxz7PR97zniRWXmzOpZiFWjFE9DcRrqrjSctqrft2vw2sCU5f
	 hmME174if+hz7l14Wd2rp8ZMu1ZvlLUQ3wLrrlSy9ktWxF3wBm3w1rouyx7yGG7Zl/
	 4YqH7CxlqFwvax2NjS9qzZMXYodnZiGJs0dnQQw7BRy99tbige2KcqmHcuZej1ocgJ
	 FfDGmAUp5Fwpw==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4be:99b9:5069:3bef])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 264D917E10F3;
	Wed, 27 Aug 2025 11:08:19 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v8 7/7] arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
Date: Wed, 27 Aug 2025 11:08:03 +0200
Message-ID: <20250827090809.34555-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827090809.34555-1-benjamin.gaignard@collabora.com>
References: <20250827090809.34555-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Verisilicon IOMMU used by Rockchip RK3588 AV1 hardware codec.
This hardware block could be found in Radxa Rock 5B board.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in version 8:
- Include board name in defconfig patch commit message

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..04547bcc904b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1470,6 +1470,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_VSI_IOMMU=m
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
-- 
2.43.0


