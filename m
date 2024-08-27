Return-Path: <linux-media+bounces-16930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B83C960C2B
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 15:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BF851F21B5F
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 13:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FE31C2DDB;
	Tue, 27 Aug 2024 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="CpZtOxLp"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A211BCA04
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724765602; cv=pass; b=LCn7+f+CYxTdJHhAkN8kTlmxkmgz/Nf3iA0pqGXgiPpoOaIy5eJIrA2yQcR4VKDpkia4dZUjkLID86GzTscEyySipJIwuQ8yV2KZRPrydIZFUyItH1kV4MSt5LFXwjZ5Q3fEv/e0ogDZRXD23q2dzMHJd+h7MJgCbktWhE41g14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724765602; c=relaxed/simple;
	bh=5RcZ2L1RzUGJmd8dcZ6grCexOLnJNv4PQYooYo8UfiQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SPKe8hoZRdPDhuD6rtwYEA/L57X/3pCKMfgdt8gKxpA1IS5lfV1UT4O9U4trjbc5R+Mu9IDMhiHAWlD6EUGFDzvUR+5aGtN2VAisS8esNNhcBk+uOAGhE/zLVE2nAIiP59hgKDBCgEVv+0hRdrbY5oald2mxZTQ25HEwaot8vFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=CpZtOxLp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724765598; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IFvW2pjJb0eGtmJ7Eql+XkmcWgoBS5Yok820dKf7eAJYz713uCuj+9OuXNsOxrGGCTSiMd30DbxkyhAkf8MSVrR5rQosxQFE9k/uBY8uy2L1GUm0Ys4fXuVKOgQJlSHi4D8E8YbW76gQ0YloNfLwOEMN8zR05bS4DY55O3GsF50=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724765598; h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=ndcdzhJ7q0NVzaAbzokmWGwtn0MOygXhYDGfEVk0QgM=; 
	b=k9jqk1SFfiVhYI9wXhOLluss6EbqPjTy8qch6ui0F/fGVc2pdi+HcLouNp/LhaIVpoxtg8WmKe1eGzDTQxLesV8PL9wJnq3BLafxmbvPQZJiFKkpiKkZWnD6w+9iI11L5odUv9P+8tHJ/0Ea9/sWGkZquhgRzDXoHPPDmtupMP4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724765598;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
	bh=ndcdzhJ7q0NVzaAbzokmWGwtn0MOygXhYDGfEVk0QgM=;
	b=CpZtOxLpevV0HZpRkINeULdFhywMoy8q3mPMGlvy2XdsWKj5WmPUFnNA9+c4hRYO
	mT3Ah25Jk6gInUqoVxX+2NPTM4D1bXkNM8D8SVzEGFN4oU8PhN/j+22QKMRbI2IFXBx
	Jr533c4DDG+PNsVb7KiUIYIwfBjbsL1yWgq1aspo=
Received: by mx.zohomail.com with SMTPS id 1724765597982770.5862516837068;
	Tue, 27 Aug 2024 06:33:17 -0700 (PDT)
Date: Tue, 27 Aug 2024 15:33:15 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.12] Various codec fixes II
Message-ID: <20240827133315.qlmwdvwmghidayzy@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
X-ZohoMailClient: External

Hey Hans & Mauro,

the following set contains a lot of smaller to medium size patches to
various drivers.
I have done some smaller fixups on the
"media: verisilicon: Add reference buffer compression feature"
patch, which have been acknowledged by the author.

The following changes since commit ea2e2ea551abf0ce8350f82e8cd431b7f8a1e5e9:

   media: dt-bindings: qcom,sc7280-venus: Allow one IOMMU entry (2024-08-25 09:16:08 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.12-various-changes-2

for you to fetch changes up to 9aad3ddbbbbc95067281acc1ac5aff5aadc2c928:

   media: imagination: VIDEO_E5010_JPEG_ENC should depend on ARCH_K3 (2024-08-27 14:39:45 +0200)

----------------------------------------------------------------
Various changes for various drivers, DT-bindings

----------------------------------------------------------------
Alex Bee (1):
       dt-bindings: media: rockchip,vpu: Document RK3128 compatible

Benjamin Gaignard (1):
       media: verisilicon: Add reference buffer compression feature

Emmanuel Gil Peyrot (1):
       media: dt-bindings: rk3568-vepu: Add RK3588 VEPU121

Fritz Koenig (1):
       Documentation: media: Fix AV1 struct documentation

Geert Uytterhoeven (1):
       media: imagination: VIDEO_E5010_JPEG_ENC should depend on ARCH_K3

Jianfeng Liu (1):
       media: dt-bindings: rockchip-vpu: Add RK3588 VPU121

Sebastian Reichel (2):
       media: hantro: Disable multicore support
       media: hantro: Add RK3588 VEPU121

  .../bindings/media/rockchip,rk3568-vepu.yaml       |  1 +
  .../devicetree/bindings/media/rockchip-vpu.yaml    |  7 +++-
  .../media/v4l/ext-ctrls-codec-stateless.rst        | 18 ++++----
  drivers/media/platform/imagination/Kconfig         |  1 +
  drivers/media/platform/verisilicon/Kconfig         |  8 ++++
  drivers/media/platform/verisilicon/hantro_drv.c    | 48 ++++++++++++++++++++++
  drivers/media/platform/verisilicon/hantro_g2.c     | 29 +++++++++++++
  .../platform/verisilicon/hantro_g2_hevc_dec.c      | 20 +++++++--
  .../media/platform/verisilicon/hantro_g2_regs.h    |  4 ++
  drivers/media/platform/verisilicon/hantro_hevc.c   |  8 ++++
  drivers/media/platform/verisilicon/hantro_hw.h     | 38 +++++++++++++++++
  .../media/platform/verisilicon/hantro_postproc.c   |  6 ++-
  12 files changed, 176 insertions(+), 12 deletions(-)

Regards,
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

