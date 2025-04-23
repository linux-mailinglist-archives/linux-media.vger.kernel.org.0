Return-Path: <linux-media+bounces-30875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301FA999E9
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 23:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B31E25A2D91
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 21:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B83426FD85;
	Wed, 23 Apr 2025 21:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lCHRRMMB"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B05746447
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 21:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442446; cv=none; b=QKWo9pzj4ww2hVhRhVPtBKOZ5I7AqkwjQlQXS3VosV+e1p7m+4N0z2L9GeqbBtJENLXfzdM1+mn84uFEBAtci0Oyhyzn33ddxRSn90RdbW3c/Trbs0psPnpMtkqylOT6XqTFt7GZTuj0aqiDwVqUilACefCvvNlh+/+svzRNeHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442446; c=relaxed/simple;
	bh=l6hntWV/RGlU32rLy8aHrU/G1nG0zQoYK71W4SCWN0U=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=tALBzKoYeEUAseJgPM7Hyp6+HCpwTF0hU5kkI0qjN69DW/W3G5jDUIS5khGhiJ7IMVqpr7deBdCwtPGz6a1TPzJXbTQLYZVM6wIud9rr0ih7+RElEiQSM9pu1lIUZyFj8zNIpv1tLW9GlX6f8VcaZaMDSLf/sxNPFn1faayv58w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lCHRRMMB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745442442;
	bh=l6hntWV/RGlU32rLy8aHrU/G1nG0zQoYK71W4SCWN0U=;
	h=Subject:From:To:Date:From;
	b=lCHRRMMBL/E+MKsHDQq2Ll7PrzKFqxKH/XAmIXL8TpqOZeS/gl5j4K2pyYwI/JOH0
	 tNCGKskwh/SpyiRW9kp36/qxZ397gffj3AYAMSBqUeoLBhtkET/tdmp1EysiIwqFpK
	 LRzJvSCqfIt7DJXymUo/tRF+FVuF6rG1vXvSa7zkYV5O/+u8NwwqNYlZvwGHmrAV/7
	 06IkyoITEAWkIMj3Em1Ep4hdg6WU4yPBRV3qRoSCe68b5fVq/Ppcp3H3t7DWCN2SYU
	 CR0MIMg1ICgJK9DDRjd4unAVBI28orwf39FiLsqGA32BccSo8s8FMxIcFjrztmtbkO
	 Bsoo0e3ywA3vw==
Received: from [IPv6:2606:6d00:15:9913::5ac] (unknown [IPv6:2606:6d00:15:9913::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B56E17E0B56
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 23:07:21 +0200 (CEST)
Message-ID: <d4202a4ecd1ad89b559804a72998bbe802986dc7.camel@collabora.com>
Subject: [GIT PULL FOR 6.16]  Media Codec Changes w20
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Wed, 23 Apr 2025 17:07:20 -0400
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

The following changes since commit 1d1e564fce1bc361af1a1980a7f915a0475a008a:

  media: rzg2l-cru: Add support for RZ/G3E SoC (2025-04-23 10:55:54 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6.16-media-codecs-w20

for you to fetch changes up to 1201c4fab296dcc7f05327fe78bc1a5ae87b4429:

  media: imx-jpeg: Check decoding is ongoing for motion-jpeg (2025-04-23 14:54:40 -0400)

----------------------------------------------------------------
Various media codecs changes

----------------------------------------------------------------
Christophe JAILLET (1):
      media: amphion: Slightly simplify vpu_core_register()

Haoxiang Li (1):
      media: imagination: fix a potential memory leak in e5010_probe()

Ming Qian (6):
      media: imx-jpeg: Drop the first error frames
      media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
      media: imx-jpeg: Reset slot data pointers when freed
      media: imx-jpeg: Cleanup after an allocation error
      media: imx-jpeg: Change the pattern size to 128x64
      media: imx-jpeg: Check decoding is ongoing for motion-jpeg

Nathan Hebert (1):
      media: mediatek: vcodec: Enable HEVC main still picture decode

Nicolas Dufresne (1):
      media: verisilicon: Enable NV15 support for Rockchip VDPU981

 drivers/media/platform/amphion/vpu.h                                      |   1 -
 drivers/media/platform/amphion/vpu_core.c                                 |   7 ++++---
 drivers/media/platform/imagination/e5010-jpeg-enc.c                       |   9 +++++++--
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c |   2 --
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h                         |   1 +
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                            | 132 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h                            |   5 +++++
 drivers/media/platform/verisilicon/hantro_v4l2.c                          |   1 +
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c           |   4 ++++
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c                      |  14 ++++++++++++++
 10 files changed, 138 insertions(+), 38 deletions(-)


