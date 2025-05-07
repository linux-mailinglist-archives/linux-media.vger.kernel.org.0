Return-Path: <linux-media+bounces-32006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E06AAED9A
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 23:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C3219C41F5
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 21:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA9D28FAAA;
	Wed,  7 May 2025 21:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jV8lAaLY"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA69672626
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 21:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652149; cv=none; b=R3EmMXsbWgiA7lrOA3X1O2Mbkh0Ie0HUu3mpvwvb9GMGZG0RT2kmfIOXIm3UPeUGkB7vXL0kaDhtxSRVRzE7QZ/jkMBL8L0F7NzAisYpTSjv5V+9m12PIHMF3wrqonmflxlPN05CBWOa9h6EPnySFFZ7czj6PxJo1FXbBxON5Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652149; c=relaxed/simple;
	bh=FVS427CbYTFPTTo09i48q822gn5wDycHYcE37eg54Ow=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=oHBW8km8bnLW1e3vQNZG54PuKWhBKyUhYGixoqKYgKsg4hoP3ngWFJL7+1D7hiadDhiDZDxVuTN8A023zrk9iNvPHvwPtMyxxo+LdSRvN+XLgi6+EaiXHCMTV2CQHphDi2QVDNYsdrUhxs+/+jOrE+VAhvXunhlxnitz9RtCrNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jV8lAaLY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746652143;
	bh=FVS427CbYTFPTTo09i48q822gn5wDycHYcE37eg54Ow=;
	h=Subject:From:To:Date:From;
	b=jV8lAaLYo59QJQT7umlmlm7W4r+JhiKAL6dWDXDIRjfjPfVj73k4YAAQCk3js3H9t
	 Kif4n7U2LMBU6I8GujUvuNkTMgfws4U3UZHQpkWb8pn8kLa3eYk6DamXkAj0Qgfuts
	 QiINC8BrntCdOlue8/GBoiVj0AhU9Lwi+UKwGCwewA+FvfZ8aHr62ZUG/pGpuCjbVO
	 6mrB3Zn3fWcZHROrSOzxkdbugx2/VZVbl6EPpaOtXus7mthLFTVNbjAiww3s5fU0hD
	 IK59LWw2+wRYAARrtiF8HkENMH2tAOzeN2Y4SXM76A1c5i6hs67rwkjxcaDdc1b+0q
	 xnPlshVnO0Y2g==
Received: from [IPv6:2606:6d00:15:ec4::c41] (unknown [IPv6:2606:6d00:15:ec4::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 695D417E05A6
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 23:09:03 +0200 (CEST)
Message-ID: <56f1ee7d5384368514cf07d0e563a99d227fa530.camel@collabora.com>
Subject: [GIT PULL FOR 6.16]  Media Codec Changes 2025-05-07
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Wed, 07 May 2025 17:09:01 -0400
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
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hey Hans & Mauro,

Please pay special attention to the last 4 patches. Hans had review comments,
which are addressed, but no Rb or Ack afterward. The rest isn't
controversial in any ways.

see you in Nice,
Nicolas

---

The following changes since commit 48dbb76cef65fabaa3ac97461eda90495e954ecd:

  dt-bindings: media: convert imx.txt to yaml format (2025-05-06 15:39:40 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6.16-media-codecs-2025-05-07

for you to fetch changes up to b27fc932e904af416b76f32b98c08e8c0221e55e:

  media: rkvdec: h264: Support High 10 and 4:2:2 profiles (2025-05-07 16:35:47 -0400)

----------------------------------------------------------------
Media codecs fixes and RKVDEC 4:2:2 and 10bit

----------------------------------------------------------------
Detlev Casanova (1):
      media: verisilicon: Free post processor buffers on error

Dr. David Alan Gilbert (1):
      media: platform: mtk-mdp3: Remove unused mdp_get_plat_device

Jianhua Lin (1):
      media: mediatek: jpeg: support 34bits

Jonas Karlman (2):
      media: rkvdec: Add get_image_fmt ops
      media: rkvdec: h264: Support High 10 and 4:2:2 profiles

Nicolas Dufresne (1):
      media: rkvdec: Initialize the m2m context before the controls

Sebastian Fricke (1):
      media: rkvdec: h264: Limit minimum profile to constrained baseline

 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c    |  5 ++++-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h    |  4 ++++
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 73 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |  1 +
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |  8 ++++++++
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 33 +++++++++++++++++++++++++++------
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |  7 ++++++-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |  2 --
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c    | 19 -------------------
 drivers/media/platform/verisilicon/hantro_postproc.c    |  4 +++-
 drivers/staging/media/rkvdec/rkvdec-h264.c              | 37 ++++++++++++++++++++++++++++---------
 drivers/staging/media/rkvdec/rkvdec.c                   | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------
 drivers/staging/media/rkvdec/rkvdec.h                   |  5 +++++
 13 files changed, 212 insertions(+), 75 deletions(-)

