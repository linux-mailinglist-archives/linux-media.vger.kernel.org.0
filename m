Return-Path: <linux-media+bounces-29789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E3A82EDE
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 20:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1E1E7A57F8
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 18:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6E9277805;
	Wed,  9 Apr 2025 18:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SB3KUuUu"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C75517A319
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 18:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223746; cv=none; b=m6C8j9JWlHAT+u3IXco3YUIfmdKPRA+P9Bxvm8v43hqQGuLBfTtMtyC/XcImsjLYPgtQfT8QEE69ugRKhJkYhbMtNPiahxN1El7vPa+m/xoK8N/zqDTP694r8Wk2jtG7zX6LdOgAckZQywjJT13QaSP3ta1HBTV9w94JO1NZUvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223746; c=relaxed/simple;
	bh=tLalouPwiAPHryogWC72r0UGS3tWhNHvQ3zAD7t5DLI=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=qdulz7MkZxhcYKhGjRpXEkLW8xONqEzNzCRiiioVDNIb4Fq+7OIxlqSIQBgBDurHnWvLQXP4OOVc7cEmO/nX5FFHJZHWZChx4lRVZhOcvYlAghRzaCMbo8ybsMwySMnQvUeHVx4seotfiZVjPOl+h5waWl4FWErKVeGYLTEmIQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SB3KUuUu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744223742;
	bh=tLalouPwiAPHryogWC72r0UGS3tWhNHvQ3zAD7t5DLI=;
	h=Subject:From:To:Date:From;
	b=SB3KUuUu7ILb4a1I5ETcV+nSfhS8sSCBeTBjGE6bTUUuwYfNQ5VvlX5Sr/WiF6Zid
	 la6w5m6sBhPsEWgcgAva0TBDJyBZ3CQupHJxL2TQAuXOAPaWbjbZP9EENOVpSD1fOv
	 UEKUQyz0J9qQfMRCuIDOC/EAUkwq4LoGRg6WIGmvbJJo1+hC30IAxe6CKrDfTpyzbi
	 gvEwONpfc/1Sj6KVEtVgaM4yfsg9F/PcOWQnd0YAV/FiFklGKZG7Tcf3cV4Y2fDpH3
	 mSxiV834aSfYZw1y6c+wuJzWdA7jI/4xEcMwpyUmX9C0FzDZfyUPyJuJXuhJeUZAgo
	 7S9Wispt176lw==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C84817E03C8
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 20:35:42 +0200 (CEST)
Message-ID: <af39457adb978e0fc1c38042c3cab5401f99cadb.camel@collabora.com>
Subject: [GIT PULL FOR 6.16] Enable wide 4K in Hantro AV1 decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Wed, 09 Apr 2025 14:35:40 -0400
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

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6.16-media-hantro-wuhd

for you to fetch changes up to 19391c07164c6b949ec8dff075e3e009125ba72a:

  media: verisilicon: Enable wide 4K in AV1 decoder (2025-04-08 14:51:18 -0400)

----------------------------------------------------------------
Enable wide 4K in Hantro AV1 decoder

----------------------------------------------------------------
Nicolas Dufresne (1):
      media: verisilicon: Enable wide 4K in AV1 decoder

 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

