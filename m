Return-Path: <linux-media+bounces-17250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C176966CAC
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 00:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50EAB1C21F49
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 22:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7EA46B91;
	Fri, 30 Aug 2024 22:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="Wflb+c+p"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9E4165F0B
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 22:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725058109; cv=pass; b=ApEU/eHsxa68mXO9r7LYklbV81j+TMT4JVW5yCttsYFZzzOHmN5Lavp/2l3Bbrg0GNrgXB+zBAm16tPvmYVWVyEBhaMKjlWA/0VsMCenu8Py+B0MsGW1RZd0y1oSHrjt2Lh71294pwuKuDJvBXND8xWX+xQ5xzqS3cKXyISmIrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725058109; c=relaxed/simple;
	bh=Yrv6T/8qPTCoEAYvgrAQCQHdEZhd7McYZbOCklmOh40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7ujLOVVaAQsDQdgj/rtn0O37Y9M35YxtToX1S8JkBtBRHYbTp2KIAVsDmDmuLrDW5t0ehTfvUmqmvUo51JOsA35SdhfgECVmZQusOhYbSSkx6dZPz8i5cZo9pREbbBLOfm5boQQWVDaMsxw5N+jw+tjy3b5h3mPjtuMXA3TEFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=Wflb+c+p; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4WwYG91LhBzyTV;
	Sat, 31 Aug 2024 01:48:16 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1725058097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=EJwVHNZujQ+2dmo9Sylo51UVrAZqso+d1kGNoIEsRg8=;
	b=Wflb+c+pCHdYN/qi1N6vt0wWanSl+78UHMCG7Aj5J2esCXsjVI+3yAJaHlOUjtc199xpwx
	mF2BGiYPK8wwgDqMtY3/t9Y5tDwYV+gDQkKitmLGM2+jY2IKhW+zM0B/+plVT0xHzbKEBq
	dj/mRldbJPZ93bU1r+HCF1YN6rlg1H4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1725058097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=EJwVHNZujQ+2dmo9Sylo51UVrAZqso+d1kGNoIEsRg8=;
	b=BMKryRdfsTs/oEThNa24vTEbfJtXf1dDqzM69CuLHxC3Gvxz/ucUje7lAmR95QBiZ+MuHu
	Yp5MBrlbdHv+GWJTKYgjCg2xL5m8PakilWS1hgHBO8/p4MBLbahZtJa3CEWINTcYPzth8K
	gy5VvqVefGxIWiBavIXvzZ20edZnajE=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1725058097; a=rsa-sha256; cv=none;
	b=ZSZ8m7AogNIoY6QlxnstwewFh94XuGb80B89G50yA6IrmwTJfa73l7oHUxqNMAyOUD0jgJ
	qKvW0fVOHX1ybLg414O++9U9Aw8gTPA9K/2LZtPHh6066G53grCPfPUGjpBk39XqgN42yS
	kt3KNihUiWDRvhU45Eq1OFlr0Z9Qqmw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7A333634C93;
	Sat, 31 Aug 2024 01:48:14 +0300 (EEST)
Date: Fri, 30 Aug 2024 22:48:14 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.12] Mostly camera sensor patches
Message-ID: <ZtJMLpbKeNI8B_Z5@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

There are a lot of patches in this PR, result of me being quite busy
elsewhere lately. Included are:

- Miscellaneous cleanups here and there, including sparse false positive
  fixes from Ricardo
- Fixes to ov5675, ar0521, mt9v111 and ipu3-imgu drivers
- Improvements to imx283, imx355, og01a1b and max96717 drivers

Please pull.


The following changes since commit 393556c9f56ced8d9776c32ce99f34913cfd904e:

  Merge tag 'tags/next-media-videobuf-20240827' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git (2024-08-28 13:11:49 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.12-1-signed

for you to fetch changes up to 9a59151d09df8e1c03add9ea5f767b4087512f7c:

  media: MAINTAINERS: Add "qcom," substring for Qualcomm Camera Subsystem (2024-08-30 12:19:08 +0300)

----------------------------------------------------------------
V4L2 patches for 6.12

----------------------------------------------------------------
Alexander Shiyan (1):
      media: i2c: ar0521: Use cansleep version of gpiod_set_value()

Bryan O'Donoghue (1):
      media: ov5675: Fix power on/off delay timings

Changhuang Liang (1):
      media: MAINTAINERS: Add "qcom," substring for Qualcomm Camera Subsystem

Hongbo Li (1):
      media: intel/ipu6: make use of dev_err_cast_probe()

Julien Massot (2):
      media: i2c: max96717: coding style fixes
      media: i2c: max96714: coding style fixes

Liao Chen (2):
      media: i2c: mt9v111: Enable module autoloading
      media: i2c: mt9v111: Drop redundant comma

Max Staudt (3):
      staging: media: ipu3: Drop superfluous check in imgu_vb2_stop_streaming()
      staging: media: ipu3: Return buffers outside of needless locking
      staging: media: ipu3: Stop streaming in inverse order of starting

Ricardo Ribalda (6):
      media: ar0521: Refactor ar0521_power_off()
      media: i2c: ov5645: Refactor ov5645_set_power_off()
      media: i2c: s5c73m3: Move clk_prepare to its own function
      media: tc358746: Move clk_prepare to its own function
      media: meson: vdec_1: Refactor vdec_1_stop()
      media: meson: vdec: hevc: Refactor vdec_hevc_start and vdec_hevc_stop

Robert Mader (1):
      media: i2c: imx355: Parse and register properties

Tommaso Merciai (1):
      media: i2c: max96717: add test pattern ctrl

Umang Jain (3):
      media: imx283: Add 3/3 binning mode
      dt-bindings: media: imx335: Add reset-gpios to the DT example
      media: imx335: Fix reset-gpio handling

Vladimir Zapolskiy (6):
      media: dt-bindings: Add OmniVision OG01A1B image sensor
      media: i2c: og01a1b: Add OF support to the image sensor driver
      media: i2c: og01a1b: Add stubs of runtime power management functions
      media: i2c: og01a1b: Add support of xvclk supply clock in power management
      media: i2c: og01a1b: Add management of optional reset GPIO
      media: i2c: og01a1b: Add management of optional sensor supply lines

Yue Haibing (2):
      media: ccs: Remove unused declarations
      media: siano: Remove unused declarations

 .../bindings/media/i2c/ovti,og01a1b.yaml           | 107 ++++++++++
 .../devicetree/bindings/media/i2c/sony,imx335.yaml |   4 +
 MAINTAINERS                                        |   3 +-
 drivers/media/common/siano/smscoreapi.h            |   6 -
 drivers/media/i2c/ar0521.c                         |  22 +-
 drivers/media/i2c/ccs/ccs-reg-access.h             |   3 -
 drivers/media/i2c/imx283.c                         |  33 +++
 drivers/media/i2c/imx335.c                         |   9 +-
 drivers/media/i2c/imx355.c                         |  12 +-
 drivers/media/i2c/max96714.c                       |  18 +-
 drivers/media/i2c/max96717.c                       | 236 ++++++++++++++++++---
 drivers/media/i2c/mt9v111.c                        |   3 +-
 drivers/media/i2c/og01a1b.c                        | 187 ++++++++++++++--
 drivers/media/i2c/ov5645.c                         |  15 +-
 drivers/media/i2c/ov5675.c                         |  12 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c           |  13 +-
 drivers/media/i2c/tc358746.c                       |  12 +-
 drivers/media/pci/intel/ipu6/ipu6.c                |  20 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |  40 +++-
 drivers/staging/media/meson/vdec/vdec_1.c          |  16 +-
 drivers/staging/media/meson/vdec/vdec_hevc.c       |  43 +++-
 21 files changed, 690 insertions(+), 124 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml

-- 
Kind regards,

Sakari Ailus

