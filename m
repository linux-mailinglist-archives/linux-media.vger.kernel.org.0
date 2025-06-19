Return-Path: <linux-media+bounces-35429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B26CEAE0D65
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 21:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E167E17D493
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 19:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E97244E8C;
	Thu, 19 Jun 2025 19:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AigDM1Yy"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B42A30E82E
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 19:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360674; cv=none; b=YSXxr0DaWWq4fihRjs3k0yGK5v2zIdbTmKSuzkA7gvVNpXK9ablOFu+FPZjqDXCrSbap7KXiVzLTLp73Vmex4pC8Risu/gowK+rDDo7V+wSXIXMtEdrv3+WW3J3hAbcxlBQPPz0P02Rs0Z0Jup4uh8dI25Znyg2o/cSE2EPhQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360674; c=relaxed/simple;
	bh=8KlEvFuZn3PeU3RBbKcoJA6csOMC2v3+5XLMq06to/Y=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=akVO9UWQNXso1KcqpIM5f6FFrbTF64getJd+2ua72KuO5DfXNm7R6k9xlMNyzYvQPXm+SufycPrjux9K3czYTV/ru5i0peWeAfv9JuOFszvABUG2t0Vzu5Oa7ooca2UQKUpOkUabRDVqbikEt72OL6Pl8X7EIMD+nK8wNP6z3h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AigDM1Yy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750360670;
	bh=8KlEvFuZn3PeU3RBbKcoJA6csOMC2v3+5XLMq06to/Y=;
	h=Subject:From:To:Date:From;
	b=AigDM1Yy2/riWhRBTlx8i8A7S/QWvmkbEJfDYtL3JH1bxG2jjSfRagRJ9FWTv8p4w
	 l0of38ufCa47+dPXKo0WxxAlnVub+ZbiE9h9BVDx71Fg0bA7PWOkoGLPGGdaKVbJTn
	 DYfzre2Qk4Wzj5By5znRfCDYqXrCRN/IDBUetZUERjmjRWX4zHfpELZ1l0Ikpvfv+A
	 jnYxVO2m+//jSTPuL0mzwteztr3Fhf693/IR5gE6czd0QALIkkGYxaHLXV7dNWZB4o
	 Fqh8NH6igped2KxbIz7MBAnZs1KIBJHYQRbD00vl45yX8LgRaRjDhXs9OYNPBt/wie
	 IMa329/8gZTBw==
Received: from [IPv6:2606:6d00:17:b699::5ac] (unknown [IPv6:2606:6d00:17:b699::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D82C817E108A
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 21:17:49 +0200 (CEST)
Message-ID: <01731840f28889cd10fac3d1e91b820c341eb656.camel@collabora.com>
Subject: [GIT PULL FOR 6.16]  Media Codec Changes 2025-06-19
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Thu, 19 Jun 2025 15:17:48 -0400
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
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hey Hans & Mauro,

this is a set of smaller changes I have collected, with fixes for codecs,
a new binding for IMX95 and some mother being ported to yaml. 

regards,
Nicolas

---

The following changes since commit 642b70d526ab8daa8f256dfc1eb6bf27c3290cc6:

  media: imx8mq-mipi-csi2: Add support for i.MX8QXP (2025-06-18 09:21:59 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6.17-media-codecs-2025-06-19

for you to fetch changes up to 2fee2cd2da7a98a46d2750b3a0e0f8b8d3dfafc3:

  media: v4l2-ctrls: Fix H264 SEPARATE_COLOUR_PLANE check (2025-06-19 13:19:05 -0400)

----------------------------------------------------------------
RKVDEC iommu restore and minors fixes

----------------------------------------------------------------
Christophe JAILLET (1):
      media: verisilicon: Use __set_bit() with local bitmaps

Frank Li (2):
      dt-bindings: media: convert fsl-vdoa.txt to yaml format
      media: dt-bindings: nxp,imx8-jpeg: Add compatible strings for IMX95 JPEG

Haoxiang Li (1):
      media: imx: fix a potential memory leak in imx_media_csc_scaler_device_init()

James Cowgill (1):
      media: v4l2-ctrls: Fix H264 SEPARATE_COLOUR_PLANE check

Jernej Skrabec (1):
      media: cedrus: Add support for additional output formats

Ming Qian (2):
      media: amphion: Add H264 and HEVC profile and level control
      media: imx-jpeg: Account for data_offset when getting image address

Nicolas Dufresne (2):
      media: verisilicon: Fix AV1 decoder clock frequency
      media: rkvdec: Restore iommu addresses on errors

 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml |  42 ++++++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/media/fsl-vdoa.txt        |  21 ---------------------
 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml  |  28 +++++++++++++++++++++++++---
 drivers/media/platform/amphion/vdec.c                       |  59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/amphion/vpu_defs.h                   |  12 ++++++++++++
 drivers/media/platform/amphion/vpu_helpers.c                | 123 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/amphion/vpu_helpers.h                |   7 +++++++
 drivers/media/platform/amphion/vpu_malone.c                 |   5 ++++-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c              |  47 ++++++++++++++++++++++++++++++++++++-----------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h              |   1 +
 drivers/media/platform/verisilicon/hantro_h264.c            |   6 +++---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c        |   9 ---------
 drivers/media/v4l2-core/v4l2-ctrls-core.c                   |   8 ++++----
 drivers/staging/media/imx/imx-media-csc-scaler.c            |   2 +-
 drivers/staging/media/rkvdec/rkvdec.c                       |  43 ++++++++++++++++++++++++++++++++++++-------
 drivers/staging/media/rkvdec/rkvdec.h                       |   1 +
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c              |  18 +++++++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c           |  18 ++++++++++++++++++
 18 files changed, 389 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/fsl-vdoa.txt

