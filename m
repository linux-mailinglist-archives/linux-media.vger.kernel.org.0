Return-Path: <linux-media+bounces-50405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87506D11A98
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 640F730B2C02
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 09:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76522765FF;
	Mon, 12 Jan 2026 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="JyxEpLk5"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4B027B34C
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211763; cv=pass; b=GPd9U92k5CYw/3GPhntlPj0eBTYgSj1cQLginyj36aNkfcI2vT+YEMJzYh5VjHMgWluElpbIYCuv+65QaoAdC2bngcucT0NzulA/Zb0ump76tdBmtNT4YBMkrSKRlwElan4BdaRnfZ3kSrMIICj6EwWKPK1zhXtdROcHoA6bXCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211763; c=relaxed/simple;
	bh=JRANjBFF8UxsY3O8IykRo5SvDke5s/Hnyw+aIs302fw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUo+xMb4r569PgxZm1T4KKgfto1dOWsvVNPBsDNlrsClIVad8rjx5eC9r2Ecay0dwFiYImiul2FRurgtxcHa7lKQcizfGg0z/KIQNqw90B4OG3PsZ9faVUSn4M2hf03fUhoBS/9SBtD6lCHo6Uw1UbBDO13SQtijT0S5CzdoP7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=JyxEpLk5; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4dqSRy0td2zyQH;
	Mon, 12 Jan 2026 11:55:41 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1768211742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=2iJs07fFmf5cdxCOZ10EGoV1dKbCEO+NrRPDzF0H6ws=;
	b=JyxEpLk5Lygonac5WPcYz2CcUuJZAeoXV3sEUkBlDuUyTZJrOUhwreew3T1hkx9byaftSG
	1u/Tub/6cJjiZmc650M1d63dLJsEWGUGNSu6w51gKz9SehYcVmJ4tzIUwaQAsURFxjVRKa
	TQu/tSu5wWyBlIv3AaKsGBeoaTVty3Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1768211742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=2iJs07fFmf5cdxCOZ10EGoV1dKbCEO+NrRPDzF0H6ws=;
	b=ROWmM/NeQj3lvV5Ei+dhGPG062ZM0lyA2DdbEPNtW1RaD1bNvvVid/CXZesCcHiCS88GpW
	16pCIIWKpXP6TzanPWRUEOGNyM1qzFUNJL1A34bEwmIMFLhDW1+D1tgXFjnUI47Rqm5Xzd
	fJj90uQ4rz/iXy4Z+YQI1V3Ir3oHpCI=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1768211742;
	b=yS2hVAIzwfLc8trP2XBf+hMWY3Ki4DWKXC1sIAY3T0ULnbVP+Ew39adSUr7YuyB5/O//NF
	LULLM9oZKVU2HAkvNApnLCS/oJCqSuZoNYrydchj5TLvW2hKqlcBUQmnGaAK7v5xXq5Fmg
	KRpf7ba/RQ24pHs9x9rTBafeTa0S7Z8=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 929D5634C51;
	Mon, 12 Jan 2026 11:55:41 +0200 (EET)
Date: Mon, 12 Jan 2026 11:55:41 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.20] OV01A10 driver fixes and improvements
Message-ID: <aWTFHQrQIisyxG97@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Please pull.

The following changes since commit 336367fab9b96db7b0ee174443c426fc6c53b912:

  media: chips-media: wave5: Fix Potential Probe Resource Leak (2026-01-05 15:56:32 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.20-4-signed

for you to fetch changes up to 229f425d39557ffa6b4417f9b3dc59afa707f4a2:

  media: i2c: ov01a10: Add ov01a1b support (2026-01-12 11:13:58 +0200)

----------------------------------------------------------------
OV01A10 driver fixes and improvements for 6.20

----------------------------------------------------------------
Hans de Goede (23):
      media: i2c: ov01a10: Fix the horizontal flip control
      media: i2c: ov01a10: Fix reported pixel-rate value
      media: i2c: ov01a10: Fix analogue gain range
      media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() calls
      media: i2c: ov01a10: Fix passing stream instead of pad to v4l2_subdev_state_get_format()
      media: i2c: ov01a10: Fix test-pattern disabling
      media: i2c: ov01a10: Change default vblank value to a vblank resulting in 30 fps
      media: i2c: ov01a10: Convert to new CCI register access helpers
      media: i2c: ov01a10: Remove overly verbose probe() error reporting
      media: i2c: ov01a10: Store dev pointer in struct ov01a10
      media: i2c: ov01a10: Add ov01a10_check_hwcfg() function
      media: i2c: ov01a10: Add power on/off sequencing support
      media: i2c: ov01a10: Don't update pixel_rate and link_freq from set_fmt
      media: i2c: ov01a10: Move setting of ctrl->flags to after checking ctrl_hdlr->error
      media: i2c: ov01a10: Use native and default for pixel-array size names
      media: i2c: ov01a10: Add cropping support / allow arbitrary sizes
      media: i2c: ov01a10: Remove struct ov01a10_reg_list
      media: i2c: ov01a10: Replace exposure->min/step with direct define use
      media: i2c: ov01a10: Only set register 0x0305 once
      media: i2c: ov01a10: Remove values set by controls from global_setting[]
      media: i2c: ov01a10: Add ov01a10_sensor_cfg struct
      media: i2c: ov01a10: Optimize setting h/vflip values
      media: i2c: ov01a10: Add ov01a1b support

 drivers/media/i2c/Kconfig   |   1 +
 drivers/media/i2c/ov01a10.c | 918 ++++++++++++++++++++++++++------------------
 2 files changed, 548 insertions(+), 371 deletions(-)

-- 
Kind regards,

Sakari Ailus

