Return-Path: <linux-media+bounces-9847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278B68AC8A5
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 11:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 474AA1C20B9B
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 09:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23EC53805;
	Mon, 22 Apr 2024 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="cCA33zsn"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7033F4C66
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 09:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713777298; cv=pass; b=B6MO9FP9lO+XI4DPLw52+d/ChrtQjMxH9+fjMo2+xDbn1DMs+nm+tadAOG3kBuRK4zE6nQzrAgnMEswbFxW+tIvSVBU5xZVsJvJix0snM8gPdMypalWI2jYRaA/mp8tcjbo9D/zVvKRPgIl2c/z9hUSWNjqsh8ZG37COQ0O9NXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713777298; c=relaxed/simple;
	bh=GuSjgS5jtcdtm8w595ZxMelvv6Rskx2fRpghXXo6R9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s136wMQPFGGXOgPyHH1JWJEytfDBL7DDcpl36smBIGj+PX9+HKDD0t6mw9vY5U1Q57HmmCohdAhOht912XAbMP4qgKDPPpMAIZelkH71v8yJ82m22KgGOxWK+uj4AXDPTZ5HSkKsPC26Kh2+tXP7M96RLXaHjkkGUZ9KCFf0SjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=cCA33zsn; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VNKMT6vzHz49Q05;
	Mon, 22 Apr 2024 12:14:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1713777286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=W4OZMhWtw27rRFlRTr7BQxLyvlXJyo7ifuwtfVQn1Bc=;
	b=cCA33zsnJf+Ee8zebaOpEIosh3GSD71BxJQrENVujo3WLR35pKrljVZfDg0s0zFgRy6vua
	kP5fcKiUU1Y9CNBLJyDu/FzR4LIpFDbC5SMBkAPK/2j8Oi9mhbr6xeHWPU2DvV8YTGZ++z
	xA3C1b2pjiz9RCPzPMCkVpprVxMSDRmFFpuR8l1AKaupXL661IR9Ejfpr3QE8aYL/Th3f1
	xIGzYRYwC5WQAmzZb9NpxEhsTCaM2wMRVzP0zhRg6G5zEWkfPR6K/ykdsbSbTDcXHUG6A7
	q3tj4VFxC+Zocy4zTk4Z2H/Fj9uhQ37hjX4YZOX6KXOMfh+ij1YH0K7s+uyzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1713777286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=W4OZMhWtw27rRFlRTr7BQxLyvlXJyo7ifuwtfVQn1Bc=;
	b=gtWiM4BDNvDfnP0v13r0zIHQzRdypSxeh9CF4cDyJEsCnRKQBsjlv6p1NIDJlB1xyKDYjw
	bitnPKp48q5/Sww/ebAsRaHoBnbShp61gPFKpDHljbTNjFPLiZsbq+/BFZa7yM2ca7C3WZ
	A1N8QYPVGRy5ZUrUsOn3ecto7d6kY2LM5jMzHHzZr39bwuoCaxTaqEWDSWuthIUuIWzeAc
	WeFp5QnK89X9JPQMeqAWL6ghhROVxA3FdcEAHuYXwu8LF67OAV28Z3jv5M+OP7ttHsBuls
	XLOmguo9Qp/dOC2pVAgbm3n1sYyfHN/y52Edsw0xI0cerYId140EQgpVJ9j5pg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1713777286; a=rsa-sha256;
	cv=none;
	b=f9s481dcG+ufOL5ykdwJCP1W86U0qZS/vqt5rr2MlalDb0SC50SgDi3YfMMqa9Gx4a0kBw
	dnYsxuUR4XWC8ECYMCA79/uXE8vhf26ncVQQO1TWkk7VeQzc4Eqdj1cpc+/T5suNlPvVoA
	8VT4n09HEhEO/GNkTvg7wgS2WoHBqujhPRyPfacLXJHV8pAW5/nIHNzlpnLZJ1eKON6Pmw
	GhV+whCZ1jfcLoN5rKV8zhP7hTPYx3cjJuBau1QgNGxggnkqJCkG1jcFmXgDCZt/j5K0mo
	mT60MRD+0u4uBMIF+2E70prMlAmhCPvw5WqpdXzvwvXBZDwpJe48MyrRjolc3A==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3A6E3634C94;
	Mon, 22 Apr 2024 12:14:45 +0300 (EEST)
Date: Mon, 22 Apr 2024 09:14:45 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES v2 FOR 6.10] Mainly camera sensor patches, but V4L2 and
 MC too
Message-ID: <ZiYqhcm_iFVRc5dS@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here's a set of mainly camera sensor related patches for 6.10. In
particular, there are ov2680 and hi556 fixes form Hans and Fabio, your own
MC patch, fixes for imx335 from Kieran and Umang, DT fixes from Alexander
Stein and one Cadence csi2rx fix from Pratyush and finally my random series
of framework and ipu3-imgu driver fixes.

since v1:

- Squash Umang's fixes for imx335 kerneldoc

Please pull.


The following changes since commit 836e2548524d2dfcb5acaf3be78f203b6b4bde6f:

  media: usb: siano: Fix allocation of urbs (2024-04-16 00:02:53 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.10-2.1-signed

for you to fetch changes up to af24845bf3881bb471580558ca811e0f6a44ecda:

  media: hi556: Add support for avdd regulator (2024-04-22 12:11:04 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.10

----------------------------------------------------------------
Alexander Stein (2):
      media: dt-bindings: sony,imx290: Allow props from video-interface-devices
      media: dt-bindings: i2c: use absolute path to other schema

Fabio Estevam (1):
      media: ov2680: Do not fail if data-lanes property is absent

Hans Verkuil (1):
      media: mc: mark the media devnode as registered from the, start

Hans de Goede (9):
      media: ov2680: Stop sending more data then requested
      media: ov2680: Drop hts, vts ov2680_mode struct members
      media: ov2680: Add vblank control
      media: ov2680: Add hblank control
      media: ov2680: Add camera orientation and sensor rotation controls
      media: hi556: Return -EPROBE_DEFER if no endpoint is found
      media: hi556: Add support for reset GPIO
      media: hi556: Add support for external clock
      media: hi556: Add support for avdd regulator

Jai Luthra (1):
      media: ti: j721e-csi2rx: Fix races while restarting DMA

Kieran Bingham (2):
      media: imx335: Support 2 or 4 lane operation modes
      media: imx335: Parse fwnode properties

Pratyush Yadav (1):
      media: cadence: csi2rx: configure DPHY before starting source stream

Sakari Ailus (4):
      media: v4l: Don't turn on privacy LED if streamon fails
      media: staging: ipu3-imgu: Update firmware path
      media: v4l2-ctrls: Return handler error in creating new fwnode properties
      media: v4l: Guarantee non-NULL return from v4l2_find_nearest_size()

Umang Jain (4):
      media: imx335: Use V4L2 CCI for accessing sensor registers
      media: imx335: Use integer values for size registers
      media: imx335: Fix active area height discrepency
      media: imx335: Limit analogue gain value

 .../bindings/media/i2c/galaxycore,gc0308.yaml      |   2 +-
 .../bindings/media/i2c/galaxycore,gc2145.yaml      |   2 +-
 .../devicetree/bindings/media/i2c/sony,imx214.yaml |   2 +-
 .../devicetree/bindings/media/i2c/sony,imx290.yaml |   5 +-
 .../devicetree/bindings/media/i2c/sony,imx415.yaml |   2 +-
 drivers/media/i2c/Kconfig                          |   1 +
 drivers/media/i2c/hi556.c                          | 105 +++-
 drivers/media/i2c/imx335.c                         | 637 ++++++++++-----------
 drivers/media/i2c/ov2680.c                         |  97 +++-
 drivers/media/mc/mc-devnode.c                      |   5 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |  26 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |   5 +-
 drivers/media/v4l2-core/v4l2-common.c              |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |   3 +
 drivers/media/v4l2-core/v4l2-subdev.c              |  22 +-
 drivers/staging/media/ipu3/ipu3-css-fw.c           |   4 +-
 drivers/staging/media/ipu3/ipu3-css-fw.h           |   2 +
 17 files changed, 516 insertions(+), 406 deletions(-)

-- 
Kind regards,

Sakari Ailus

