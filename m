Return-Path: <linux-media+bounces-12669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 803B28FF15B
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 17:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3033E1F235ED
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61004198A24;
	Thu,  6 Jun 2024 15:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ekkM/LzS"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6028D198A17
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 15:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689342; cv=none; b=rq6GD0PiWom4fRIrWau6ien/VYvX9xvABr58+Y04AM0DH3unMRq5nfcVS7qMsQGxC3cac296I7oUp8jkj8NGQ7ykwwPnQeeTQtb08fxlmic770FeOJY0HHiIZGmWhOMDTrH0GlE3ROeomyj1J/0qGD2mDpywD0RZBrobaKtHLak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689342; c=relaxed/simple;
	bh=qUHnzxeyaHxdTYNRmGOiGWksGNnSwBaQ7SbW/1t7DDo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eXAqtOGBm25aRab3EICfbWvPgUcrLx+Iv5x5THk4yZCKzS07TOSI933rUB/yiZRNjNEbG79shi3neDBXbAfV594rTxcqX3W1XNkEV8GDSugLb4ojxGheLVtu67DUvTiFxLsZhQmugVCLmTXaG4QUOS+rihlA9vCXc/9xMQmFsz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ekkM/LzS; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717689339;
	bh=qUHnzxeyaHxdTYNRmGOiGWksGNnSwBaQ7SbW/1t7DDo=;
	h=Date:From:To:Subject:From;
	b=ekkM/LzSbmOZDmiVX8yEFCLioywFcaZ8SWf4rHWpnBdM4X40UaQmfNpmjtbzKK/tX
	 wif7MJsFVBOGpGS2a4akr76y1VYbd5iNykZCiLKHaqg3KOSOSEK1NzgtRx7W28h5ph
	 1Ij8NYPGWXyosJea+u0YfssrnkMJPN1FWzcF71dZPiXSvkMaDCLF0qrjRaAj4RSju5
	 SZDRlbFldi8M7jS8hSMv6YKMHFzJw4zGDU8NxZ0x3cCSH01HylVpMtX0+d7dNad9hm
	 GARm2BajWSRcNWrB46D7Eg1Gzdsbfp9PR157jiuzbGiNSkYvqhqXvEp76KTq7el1xZ
	 f2UQiHbaWb/oQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8A42737821C1
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 15:55:39 +0000 (UTC)
Date: Thu, 6 Jun 2024 17:55:38 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT-PULL FOR 6.11] Various MediaTek VCodec changes
Message-ID: <20240606155538.rspfssdzau7j5hn5@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Hans & Mauro,

please pull the following set of changes.

The following changes since commit 1aea3d1d4a21e3e7895663b848ffae79ee82e065:

   media: av7110: coding style fixes: avoid_externs (2024-06-04 16:19:56 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.11-various-vcodec-changes

for you to fetch changes up to 267dcbd18e41cc6ab843dced6c54f5a9384df07a:

   media: mediatek: vcodec: Alloc DMA memory with DMA_ATTR_ALLOC_SINGLE_PAGES (2024-06-06 12:53:55 +0200)

----------------------------------------------------------------
Various small changes for the Mediatek Vcodec driver

----------------------------------------------------------------
Douglas Anderson (1):
       media: mediatek: vcodec: Alloc DMA memory with DMA_ATTR_ALLOC_SINGLE_PAGES

Irui Wang (1):
       media: mediatek: vcodec: Handle invalid decoder vsi

Yunfei Dong (2):
       media: mediatek: vcodec: add decoder command to support stateless decoder
       media: mediatek: vcodec: Fix unreasonable data conversion

  .../mediatek/vcodec/common/mtk_vcodec_util.c       |  3 +-
  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       | 60 +++++++++++++++++++---
  .../mediatek/vcodec/decoder/vdec/vdec_vp8_if.c     |  2 +-
  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c |  6 +++
  4 files changed, 63 insertions(+), 8 deletions(-)

