Return-Path: <linux-media+bounces-41978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C116DB48A00
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 12:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D81D3C39A9
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 10:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7D7224B06;
	Mon,  8 Sep 2025 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="IDBR1M2l"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24E92F3639
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 10:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757326888; cv=pass; b=QDFSb0lHWysrND2wYD6feDtfUtMYNaKZdGZe0v96hVnYZtdlXaMJLGmm3B+Mg6SpOpgEFLS/Bjwrr3+BG5cDD9VNBRtlsqvW8ykiSo3f9ztObSIOsLGQjYo+7f+Z5oeTCv2zYtJbSOGWPcdN6o68vcvR8BZtOy7sjg44pkfctVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757326888; c=relaxed/simple;
	bh=NaNXop+4TaUMye0JiuV2XVWqTaLlryjzs/2zpPU2Yy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kx57R6YEJDQL71a0WPjuqfGeG+btfj6hpBSuzB0Za1HmxXWvL1LNjXQoAJIMNgDIAcd1iDwx80R8k2C+RlcXSgUV7qFaBaloFeW90+gPi0MEp7Hz7WuOzCRg76418degY/bzXl3x5Vx8ThuevZb6KyRha/z8COPeWYV22sEDf5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=IDBR1M2l; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4cL2zf43Z8z49Pv9;
	Mon,  8 Sep 2025 13:21:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1757326878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BRGQJDHdsA4twVmO5eLCaqnTZhBCZnFqhG0ypxjP3ZI=;
	b=IDBR1M2liNxS/GTkXyfX3Dz3jzEy09rWWY6YdI88Jlor6WlUv2UQ4Eq4LlC4sIvBhQNtCY
	OnhRr7wNmjofWz+sO/gDj1IZIjUpEn4XGSYJBbaRivWOBZBHua9xWD8BVSOMjt7XXuZe4O
	CVHrDe7txRkgFgKW7feOEO6D8JXCVh6UlWVxRDMFtTzTyY4Bbqny+TN0EXTTtli2DZCbeC
	t7+GwK2n3DV/bsM5E97rPyOS0MAMhBxVAM1RwmHBGQNtdH2nD5sSarIhXTP4er9yRWlmsc
	TMkvTzli0lsujth8l0AROslK2KcROKHTZvIBqH0qlJvfM0+axZ8yN0+yC50J9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1757326878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BRGQJDHdsA4twVmO5eLCaqnTZhBCZnFqhG0ypxjP3ZI=;
	b=UzaplWeIvPXN1g8bYuedkvQO9s8xVy8VgZx1glgVpxaq6u4IqQTd9NiJamXAcAt3ky4hKQ
	E9evJmAY9fuCmENyV0gfRJkss0C/B2b9l3+NHyrSdEyfmz7i9Xj4o+p0mWcYBAJOO7uMPX
	/TqA4CTjGl+kyc7px2ibnAcZuDUysvDMKQgXQO5bzHiwg2F8I19+8R696n4looJZxuRp2r
	SeMAlo34SQpPVzRjVwuXDsX8uEJZ6Q8pfExUA517wng9z9FdK3ZKoAmRtpRwV3LrrR0kHK
	tny4t2lFoTJSKloz624nkr/lTqXmAcL0aFGj4oeigULVZFoTYFcU1iRSPeurXA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1757326878; a=rsa-sha256;
	cv=none;
	b=v0TFMm3PlGNSqAgVnhsoNx7D7Ohy5KmZ3fJCu316kqur0+R0JgXkyszw8+vGuz+OWzXsQE
	xV3gW+WkLmeuuS3VG8Ooq9wD10lkXcIlWKVLLkgw2Og6BtPj8dsi5uovcO3nRAFvZb6EZe
	wDglM7ualnEt0D8kAFqDWUoZPpBjW1FRdzqkPEW6/+fX/4YlCa3kgf95EC9SAxGx0ewV3y
	hiy0fL7Y3YG7N6LkcOrYvJ5u2RZ2zMh4XAuBAQ/sgqhjxey4Ps6yJhDxPYxtJC7wTh+28C
	PH1gTw/ycJqz185zjwRvm9d5GVPfPAAvhF0SklS9qqQactBkn6CUGRwOQSq77w==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 21DF8634C93;
	Mon,  8 Sep 2025 13:21:18 +0300 (EEST)
Date: Mon, 8 Sep 2025 13:21:17 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.18] Use V4L2 clock helper, other cleanups
Message-ID: <aL6uHdv9ne9JzFrq@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro,

The following changes since commit 04f08db52b3f892c85bd92ebbc3a7ca32e4f60f3:

  media: i2c: tc358743: add support for more infoframe types (2025-09-07 10:29:19 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.18-2.1-signed

for you to fetch changes up to d67c075c05c585e8085f6d7d66b945fec641e990:

  media: i2c: s5k6a3: Use V4L2 legacy sensor clock helper (2025-09-08 12:25:47 +0300)

----------------------------------------------------------------
V4L2 clock helper patches and more

- Use V4L2 clock helpers in sensor drivers
- Avoid using I²C client to obtain struct device pointer in sensor drivers
- Do not set clock rate in mt9v111
- Drop platform data support in mt9v032

----------------------------------------------------------------
Laurent Pinchart (62):
      dt-bindings: media: Deprecate clock-frequency property for camera sensors
      dt-bindings: media: et8ek8: Deprecate clock-frequency property
      dt-bindings: media: imx258: Make clocks property required
      dt-bindings: media: imx274: Make clocks property required
      media: i2c: mt9v022: Drop unused mt9v022.h header
      media: i2c: mt9v032: Replace client->dev usage
      media: i2c: mt9v032: Drop support for platform data
      media: i2c: mt9v111: Do not set clock rate manually
      media: i2c: ov6650: Drop unused driver
      media: i2c: hi556: Replace client->dev usage
      media: i2c: hi556: Use V4L2 sensor clock helper
      media: i2c: hi847: Replace client->dev usage
      media: i2c: hi847: Use V4L2 sensor clock helper
      media: i2c: imx208: Replace client->dev usage
      media: i2c: imx208: Use V4L2 sensor clock helper
      media: i2c: imx319: Replace client->dev usage
      media: i2c: imx319: Use V4L2 sensor clock helper
      media: i2c: imx355: Replace client->dev usage
      media: i2c: imx335: Use V4L2 sensor clock helper
      media: i2c: og01a1b: Replace client->dev usage
      media: i2c: og01a1b: Use V4L2 sensor clock helper
      media: i2c: ov02c10: Replace client->dev usage
      media: i2c: ov02c10: Use V4L2 sensor clock helper
      media: i2c: ov02e10: Replace client->dev usage
      media: i2c: ov02e10: Use V4L2 sensor clock helper
      media: i2c: ov08d10: Replace client->dev usage
      media: i2c: ov08d10: Use V4L2 sensor clock helper
      media: i2c: ov08x40: Replace client->dev usage
      media: i2c: ov08x40: Use V4L2 sensor clock helper
      media: i2c: ov13858: Replace client->dev usage
      media: i2c: ov13858: Use V4L2 sensor clock helper
      media: i2c: ov13b10: Replace client->dev usage
      media: i2c: ov13b10: Use V4L2 sensor clock helper
      media: i2c: ov2740: Replace client->dev usage
      media: i2c: ov2740: Use V4L2 sensor clock helper
      media: i2c: ov4689: Use V4L2 sensor clock helper
      media: i2c: ov5670: Replace client->dev usage
      media: i2c: ov5670: Use V4L2 sensor clock helper
      media: i2c: ov5675: Replace client->dev usage
      media: i2c: ov5675: Use V4L2 sensor clock helper
      media: i2c: ov5693: Use V4L2 sensor clock helper
      media: i2c: ov7251: Use V4L2 sensor clock helper
      media: i2c: ov9734: Replace client->dev usage
      media: i2c: ov9734: Use V4L2 sensor clock helper
      media: v4l2-common: Add legacy camera sensor clock helper
      media: i2c: et8ek8: Drop support for per-mode external clock frequency
      media: i2c: et8ek8: Use V4L2 legacy sensor clock helper
      media: i2c: gc05a2: Use V4L2 legacy sensor clock helper
      media: i2c: gc08a3: Use V4L2 legacy sensor clock helper
      media: i2c: imx258: Replace client->dev usage
      media: i2c: imx258: Use V4L2 legacy sensor clock helper
      media: i2c: imx290: Use V4L2 legacy sensor clock helper
      media: i2c: ov02a10: Replace client->dev usage
      media: i2c: ov02a10: Use V4L2 legacy sensor clock helper
      media: i2c: ov2685: Use V4L2 legacy sensor clock helper
      media: i2c: ov5645: Use V4L2 legacy sensor clock helper
      media: i2c: ov5695: Use V4L2 legacy sensor clock helper
      media: i2c: ov8856: Replace client->dev usage
      media: i2c: ov8856: Use V4L2 legacy sensor clock helper
      media: i2c: s5c73m3: Use V4L2 legacy sensor clock helper
      media: i2c: s5k5baf: Use V4L2 legacy sensor clock helper
      media: i2c: s5k6a3: Use V4L2 legacy sensor clock helper

 Documentation/admin-guide/media/i2c-cardlist.rst   |    1 -
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |    6 +-
 .../devicetree/bindings/media/i2c/mipi-ccs.yaml    |    7 +-
 .../bindings/media/i2c/ovti,ov02a10.yaml           |    3 +-
 .../devicetree/bindings/media/i2c/ovti,ov5645.yaml |    6 +-
 .../devicetree/bindings/media/i2c/ovti,ov7251.yaml |    6 +-
 .../devicetree/bindings/media/i2c/ovti,ov8856.yaml |    3 +-
 .../bindings/media/i2c/samsung,s5k5baf.yaml        |    6 +-
 .../bindings/media/i2c/samsung,s5k6a3.yaml         |    6 +-
 .../devicetree/bindings/media/i2c/sony,imx258.yaml |    1 +
 .../devicetree/bindings/media/i2c/sony,imx274.yaml |    4 +
 .../devicetree/bindings/media/i2c/sony,imx290.yaml |    5 +-
 .../bindings/media/i2c/ti,ds90ub960.yaml           |    3 +
 .../bindings/media/i2c/toshiba,et8ek8.txt          |    8 +-
 .../bindings/media/samsung,exynos4212-fimc-is.yaml |    3 +-
 .../devicetree/bindings/media/samsung,fimc.yaml    |    3 +-
 MAINTAINERS                                        |    1 -
 drivers/media/i2c/Kconfig                          |   10 +-
 drivers/media/i2c/Makefile                         |    1 -
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |   27 +-
 drivers/media/i2c/et8ek8/et8ek8_mode.c             |    9 -
 drivers/media/i2c/et8ek8/et8ek8_reg.h              |    1 -
 drivers/media/i2c/gc05a2.c                         |    8 +-
 drivers/media/i2c/gc08a3.c                         |    8 +-
 drivers/media/i2c/hi556.c                          |   92 +-
 drivers/media/i2c/hi847.c                          |   84 +-
 drivers/media/i2c/imx208.c                         |   91 +-
 drivers/media/i2c/imx258.c                         |  105 +-
 drivers/media/i2c/imx290.c                         |   27 +-
 drivers/media/i2c/imx319.c                         |   92 +-
 drivers/media/i2c/imx355.c                         |   90 +-
 drivers/media/i2c/mt9v032.c                        |  104 +-
 drivers/media/i2c/mt9v111.c                        |    2 -
 drivers/media/i2c/og01a1b.c                        |  109 +-
 drivers/media/i2c/ov02a10.c                        |   45 +-
 drivers/media/i2c/ov02c10.c                        |  107 +-
 drivers/media/i2c/ov02e10.c                        |  105 +-
 drivers/media/i2c/ov08d10.c                        |   82 +-
 drivers/media/i2c/ov08x40.c                        |   93 +-
 drivers/media/i2c/ov13858.c                        |   69 +-
 drivers/media/i2c/ov13b10.c                        |  110 +-
 drivers/media/i2c/ov2685.c                         |    8 +-
 drivers/media/i2c/ov2740.c                         |   91 +-
 drivers/media/i2c/ov4689.c                         |   12 +-
 drivers/media/i2c/ov5645.c                         |   13 +-
 drivers/media/i2c/ov5670.c                         |  105 +-
 drivers/media/i2c/ov5675.c                         |   89 +-
 drivers/media/i2c/ov5693.c                         |   16 +-
 drivers/media/i2c/ov5695.c                         |    8 +-
 drivers/media/i2c/ov6650.c                         | 1147 --------------------
 drivers/media/i2c/ov7251.c                         |   26 +-
 drivers/media/i2c/ov8856.c                         |   93 +-
 drivers/media/i2c/ov9734.c                         |   82 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c           |   15 +-
 drivers/media/i2c/s5c73m3/s5c73m3.h                |    2 -
 drivers/media/i2c/s5k5baf.c                        |   21 +-
 drivers/media/i2c/s5k6a3.c                         |   17 +-
 drivers/media/v4l2-core/v4l2-common.c              |   39 +-
 include/media/i2c/mt9v022.h                        |   13 -
 include/media/i2c/mt9v032.h                        |   12 -
 include/media/v4l2-common.h                        |   41 +-
 61 files changed, 1016 insertions(+), 2377 deletions(-)
 delete mode 100644 drivers/media/i2c/ov6650.c
 delete mode 100644 include/media/i2c/mt9v022.h
 delete mode 100644 include/media/i2c/mt9v032.h

Please pull.

-- 
Kind regards,

Sakari Ailus

