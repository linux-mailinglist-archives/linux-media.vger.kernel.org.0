Return-Path: <linux-media+bounces-29171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 141B7A78320
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 22:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C440B16B9CA
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 20:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50ADC20F072;
	Tue,  1 Apr 2025 20:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="McxaLl9u"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F142036FA
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 20:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743538169; cv=none; b=Geww52u3PJrQpOYChxM0Ft4p+aus0zm489XIOKdSAQnkIxwzK6Djxk9Al9VndYvfY2qHOyqTughPnRNo1gp4MQHouFsP+W6XmQKvFuiun6Y39VUEnpJwhfqRYRz26aazlWARltTsXpFDb4b+N24A5ccEDhv1UatnBaQrb9nh3A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743538169; c=relaxed/simple;
	bh=hlC42dn4e4QbF7VkS+rGlrk9dU/4NCKyxYnulvn5lMk=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=iq20rsnSDqbooKgVvxWWE+NJfLOOYqyXYtcFs9+0SmhbxGmPYkntYXxYWNp5MiXN7DWO7LY//4cTaHkBbsUlVxmfRm51bnflBIx8/5HsUmVgGR9rKho7ar+TdYfeszeLa24UwEEEJCcykggeGY1fKJU2aopH9ajQ0shsEyC1MC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=McxaLl9u; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743538165;
	bh=hlC42dn4e4QbF7VkS+rGlrk9dU/4NCKyxYnulvn5lMk=;
	h=Subject:From:To:Date:From;
	b=McxaLl9uSKX24Q5I5Yh1lMQu/NqiPCay3NTQiiZB/d7kA2YY6WIWF1+8ddDQboBPx
	 MRflbYsVn+JHRrtQA2xPmMzhDdCJTKOXGvfbeH8RyG9EEbHxHsLZTUzGq8Ecjr2wqr
	 alSyEhm3A6lssyqtAnhleXJeWE+zfSehmbaZQ/8UmYZ0DLzv3bU0XqH2r2SHXLB+02
	 6WKYcWBfjeO0duM2bQmra5SSnRifGyvi0OV5N3JIjRgfAcJSB05JP+Kr6xqmKo3EQZ
	 1pV0qET62NRJdxf4VRCvzsTCi1alSdGWh9hc+drTG/y+3M9tJpTjKOED9eG6yKgHMl
	 NWEiqlyCcH8Eg==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4271B17E0B2D
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 22:09:25 +0200 (CEST)
Message-ID: <fc348bb52d60acaaa15d3221aaba8217d67d349c.camel@collabora.com>
Subject: GIT PULL FOR 6.16] Enable 10bit and YCbCr 422 in RKVDEC H.264
 decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Tue, 01 Apr 2025 16:09:23 -0400
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

The following changes since commit f2151613e040973c868d28c8b00885dfab69eb75:

  media: pci: mgb4: include linux/errno.h (2025-03-07 12:05:42 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6.16-rkvdec-h264-high10-and-422

for you to fetch changes up to 619d9391efd5ed93f805734279034fa34f537347:

  media: rkvdec: Fix frame size enumeration (2025-04-01 15:25:07 -0400)

----------------------------------------------------------------
Enable 10bit and YCbCr 422 in RKVDEC H.264 decoder

----------------------------------------------------------------
Alex Bee (1):
      media: rkvdec: h264: Don't hardcode SPS/PPS parameters

Jonas Karlman (10):
      media: v4l2-common: Add helpers to calculate bytesperline and sizeimage
      media: v4l2: Add NV15 and NV20 pixel formats
      media: rkvdec: h264: Use bytesperline and buffer height as virstride
      media: rkvdec: Extract rkvdec_fill_decoded_pixfmt into helper
      media: rkvdec: Move rkvdec_reset_decoded_fmt helper
      media: rkvdec: Extract decoded format enumeration into helper
      media: rkvdec: Add image format concept
      media: rkvdec: Add get_image_fmt ops
      media: rkvdec: h264: Support High 10 and 4:2:2 profiles
      media: rkvdec: Fix frame size enumeration

Sebastian Fricke (1):
      media: rkvdec: h264: Limit minimum profile to constrained baseline

 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst | 128 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c                       |  80 +++++++++++++++++++++++++++++++++++++-----------------------------------
 drivers/media/v4l2-core/v4l2-ioctl.c                        |   2 ++
 drivers/staging/media/rkvdec/rkvdec-h264.c                  |  64 ++++++++++++++++++++++++++++++++++++++--------------------
 drivers/staging/media/rkvdec/rkvdec.c                       | 239 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------------
 drivers/staging/media/rkvdec/rkvdec.h                       |  18 ++++++++++++++++-
 include/uapi/linux/videodev2.h                              |   2 ++
 7 files changed, 410 insertions(+), 123 deletions(-)

