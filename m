Return-Path: <linux-media+bounces-29799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE537A83186
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 22:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD2E216EE25
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 19:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9DE213E6A;
	Wed,  9 Apr 2025 19:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YMKcHakg"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10F4143748
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 19:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744228268; cv=none; b=kdl7vRieZ6dLmGWujDDK1MFKjXbLpz8nVbv5BXCBYb1fG3SE0qi6is5cVnsUv3lpP+LKnJZdUuNkgtKk0P1eGYv1OvMphF7Lg+tBT/jK6QbWds92sCzQIwJJRRPiKTJcYx95RfePljNEn/bGzUauTetUQrA1+gZhbjEaqM5XHGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744228268; c=relaxed/simple;
	bh=cTou1VJ/90idVb2sBezowwt2I3ioQel1H/jChXVLtkc=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=e+smd1ziaMshsg5gyhf0+lhdjx6hNEjUvCb/PSo6pnLXwUCNStUbeSGD4iJTBVJzP6kLUnlTfbhbzFiaDfHwk0IYYvOpnvce2ewhfiQkue8xUTx5/sYIn3O0F06uPdj73hwYO+7PupzszWqsUcGrl9BM5JYYp/TdZmLKdtyDFY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YMKcHakg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744228264;
	bh=cTou1VJ/90idVb2sBezowwt2I3ioQel1H/jChXVLtkc=;
	h=Subject:From:To:Date:From;
	b=YMKcHakgk2W1wbD4OvMkXPD67OderEuXZr2egZPG7DR6PYqHKyJteedyXhoF0mgkX
	 idSjD1u696nT5BZ0qGkWJwMkHsfj5XApjQ14zEfK2ZUha5/+nYglOtLpcWWw2mPQuR
	 7XaxOoSNS8APOQzazaFehbuU2gPt+WstUsZqb1g6XvrEgFtdzvlVHQpgySVH+S1sOQ
	 SWF9A6KlfxP3Vwhm2C4XOlLfJE1zq4l1tWqOVyahHqXNpTZP0/6tWJbWcQ8REvPxxb
	 D0EWT0NVQSBBnSRp7sTSS5EcJJzFaLQV53zM+GkxQbqSLq7U1O1axA+L5T6KRHICCt
	 zanos85+XRmuQ==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 961A017E09BF
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 21:51:03 +0200 (CEST)
Message-ID: <50f743e2e28c114cc85037f59d2fdeee02e02013.camel@collabora.com>
Subject: [GIT PULL FOR 6.16]  MTK VCODEC fix and MT8188 support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Wed, 09 Apr 2025 15:51:00 -0400
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hey Hans & Mauro,

The following changes since commit 9ddc3d6c16ea2587898a315f20f7b8fbd791dc1b:

  media: mediatek: vcodec: Remove trailing space after \n newline (2025-04-08 07:21:21 +0000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6.16-mtk-vcodec-patches

for you to fetch changes up to 07c8841fe44d674889ee932d15fc51e033080beb:

  media: mediatek: vcodec: add description for vsi struct (2025-04-09 14:39:42 -0400)

----------------------------------------------------------------
MTK VCODEC fix and MT8188 support

----------------------------------------------------------------
Fei Shao (1):
      media: mediatek: vcodec: Correct vsi_core framebuffer size

Yunfei Dong (3):
      media: mediatek: vcodec: remove vsi operation in common interface
      media: mediatek: vcodec: support extended h264 decode
      media: mediatek: vcodec: add description for vsi struct

 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h          |   2 +
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c | 652 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c |   2 +-
 3 files changed, 563 insertions(+), 93 deletions(-)

