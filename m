Return-Path: <linux-media+bounces-7003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B435887A82C
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 14:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FCAF285475
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 13:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F371E4085E;
	Wed, 13 Mar 2024 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="obwLYdw3"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAE63FE54
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710336027; cv=none; b=ZsHQp/QsGtliMPbuy4iWsmm+zK/Ry7pw2radbEhqiyQv8AEQvpRKS/HPPJUQre0vK2i/l+43d9eu3vcQB84I0m067NU9d2Ohw7MLgPpAh82JEQ+Ml71kEgV6RwYfu6hhjDrYIglPK4GLfssq2k/OBVuO/MBi9w6tt3/2fNthOHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710336027; c=relaxed/simple;
	bh=E4ln0+NtygMcShCxylWW8yRBjZxg1QUZ6IzI/RSMSCc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NnIBEOEyiBhf0nSQhdbyNz2sd09IiRi2gZk7qziqPMU9FMj/G4uRc2aAGqtBwDnODyjrDE/42pDP3+TEcGuQlGJjexRVa6XD+dpuEncuYe+yQO1oEgIejS525N+PArGJzjtfPdJnGFmT4yo99MG7VlEK0oNuKHlAPa03K4Aj75o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=obwLYdw3; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710336023;
	bh=E4ln0+NtygMcShCxylWW8yRBjZxg1QUZ6IzI/RSMSCc=;
	h=Date:From:To:Subject:From;
	b=obwLYdw341RhQtR01dhU/gJ+8X/dwsa1i/NR1QVvGuOONKBKmwsrTQgt/G/h6v+Zk
	 2SC2bQfZRTLhnw8pu/If6lwNKqeb86AZchwVImveHjkKik9GLRoJNnhooCIpQ+Ajzw
	 JvVrSd0IWrfghvRa2trBg154+WNh//IxWPBl4SLcoozOJ+KMSiUqR23oKRZiEywvt/
	 f5XlXYfxyDk/fiMFpb4G+Gs8jIwutF4+V1daJjDRJycmywO7in8KdySEeR/p5HcNcZ
	 nyxEfBNE0cbch3b/oC5puSZqz1M3rRkytGIl/rVueioSkOKoBAIxL2oCzN1Kl7jcBM
	 qCKEP3W1KKnvw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E96CA3782079
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 13:20:20 +0000 (UTC)
Date: Wed, 13 Mar 2024 14:20:19 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.9] Mediatek MT8186 encoder & media fix
Message-ID: <20240313132019.6o6ave7mfy3sdvod@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Mauro & Hans,

just a small media change, a little DT binding change and otherwise DTS
changes.

Please pull.

The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:

   media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9-mt8186-video-encoder

for you to fetch changes up to 48241e83cc161c24745a04c5660808b31a0ffe77:

   arm64: dts: mediatek: mt8186: Add venc node (2024-03-09 15:50:26 +0100)

----------------------------------------------------------------
One small media fix and a DT binding addition for a video encoder on the
MT8186

----------------------------------------------------------------
Eugen Hristev (5):
       media: mediatek: vcodec: fix possible unbalanced PM counter
       dt-bindings: media: mtk-vcodec-encoder: fix non-vp8 clock name
       arm64: dts: mediatek: mt8192: fix vencoder clock name
       dt-bindings: media: mtk-vcodec-encoder: add compatible for mt8186
       arm64: dts: mediatek: mt8186: fix VENC power domain clocks

Kyrie Wu (1):
       arm64: dts: mediatek: mt8186: Add venc node

  .../bindings/media/mediatek,vcodec-encoder.yaml    | 31 +++++++++++-----------
  arch/arm64/boot/dts/mediatek/mt8186.dtsi           | 23 +++++++++++++++-
  arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  2 +-
  .../mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c    |  4 ++-
  .../mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h    |  2 +-
  .../platform/mediatek/vcodec/encoder/venc_drv_if.c |  5 +++-
  6 files changed, 47 insertions(+), 20 deletions(-)

