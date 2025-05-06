Return-Path: <linux-media+bounces-31815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA53AABBF9
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 09:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AE851BC51BF
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 07:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7FE230269;
	Tue,  6 May 2025 07:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="rc76xrSf"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94E422F75E
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516645; cv=pass; b=Z9SLyk+2vjJpGtZJM0KR+F/LIFK5V4Ur0bMPR0I3FHY0TRWZjuSjAWGCrv9JSuFILrjV8MnhWvkDPkH6f3Y7DhFW3LOIu8oh3xzWaJIVZLhaEKM52zVCUggA2ssuddI2EwsAFZOFNgHdLTRRuonboMm3nvcrlXvdUeVIDtBUdz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516645; c=relaxed/simple;
	bh=KvHPKprYwxieq37eD17TITUr9t5z4KQB1kLbOOomnLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EaG9Y3Pl3dk/CIE8T/6OVP+MRX0NcapCppBp6wNVWLzyqvMrKFjUyxsOnlcleaYNpVz58CSAflUDpa9Fo52gYhDEK9NJRfcaDyOXh6bEN+i0fTvbDnxWlXsHEvoriB9/WOgZsg306PUmm6wLVwTOwDYnxNg27IE64ltGRHWAbVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=rc76xrSf; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Zs96D0wpMz49Q4h;
	Tue,  6 May 2025 10:30:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1746516628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3ULxbZuT8QPPxv9mRK/n6BT3aBufD6nO1aJ5n2ojaJo=;
	b=rc76xrSfjIr8Qcf7t450XspQv9Ycge6sglheA5rOCyrs2FBPWO6vWADjz+yvbpSJ/4p54v
	kSjzCcXrnn0oJt3pvKocqTvuM8hi0c1Dz9ZBtV08RW6I2juuxbK1+ryCJ7tGqvwOIv4AJG
	F4/0NEV8FcVeNfznKOBzqDIprlAvzv2U3MQoEprGU9iVvy0VUdkSf0EvgrP+CU02/6uJ36
	HZsc1yaO3t9DKCiOZK2XW0Wf8mDWk29KCGHRDAQnwsrhooHLRB7Twt+nThP7QzHee5fv4y
	Vyck9cETe60zh/tXeFM5kydfnrTgwHPT/4cr4mLWuRKehFgEx5Dr7ddPMdolxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1746516628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3ULxbZuT8QPPxv9mRK/n6BT3aBufD6nO1aJ5n2ojaJo=;
	b=EpZ6jy/Eo+URE9c/knh0X83Y5Ge2wdq3mxUId22NFkaoh4Q55WA+tR/ppbslS+V5yNhf6O
	dOTR2gldrAnw9OUV/zmRpe6OFYLeE51kHjb+KW+jzzwCEn5mLk0oDg34bAkwyIt0+0lFN5
	6OV0rUBLHFte1iJFJ7JhjABKWwcr3TlHHYIJ1gtQzWd/Sti9Ax7qgEBxwtvCDAueJpYUnr
	I1/G+xrI19V9F3bqj5u5DQ+iGpK5hXJQbkpYoxuSj/Kt3XTWfw9Fwgk188EDIqaWAujqW+
	YyiZnXcKUxzXHXzxHAUm5tTM1sQmBqm8XKQDMY6H/EfkpKEH9Ei/iM6utr17iw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1746516628; a=rsa-sha256;
	cv=none;
	b=vJJFr4SfedGGJH4seMTLuI5hmEkZCNOtgDdo+LnHshBh+aC22l4OkjNUBsTB09wrB45u9R
	AygkTOXOo2ckGIAayNXQkjQrIA9yF+R+Qgmfv4n9zzyvJoYyCiaW2ODUgb8HUIPIG0qMcv
	Qht+lr51YTy5HvmEG1PAwgxbU6Ey8PCVG3I7q47wL2tEKwaPcS0pPOrC+IL2dY4Gq8JApl
	kG1bzAHo67rZNK5AWDxHYfuT/QvStle/k4B+aJ73cp1CdK50wb8FryqUOImr853Iw8RYxr
	wbvy9nRcmSZwtJgkD6aKJRY4JMpbrAmswV7rfrk3F9ExK/FenTKILD2DruIa+w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 96B25634C93;
	Tue,  6 May 2025 10:30:27 +0300 (EEST)
Date: Tue, 6 May 2025 07:30:27 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL v2 FOR 6.16] Camera cleanups and fixes
Message-ID: <aBm6k_Gac-4jcnw0@valkosipuli.retiisi.eu>
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

Here's a number of cleanups and fixes for mostly camera sensor drivers.
Also worth noting is addition of v4l2_find_nearest_size_conditional()
helper and IPU6 cleanup patches.

since v1:

- Dropped lt6911uxe fixes already in linux-next.

Please pull.


The following changes since commit 6e769fd53d25df5353150628ac0b149ae65d9cbd:

  media: atomisp: Remove atomisp-mt9m114 driver (2025-05-05 09:47:28 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.16-2.2-signed

for you to fetch changes up to 71442aceb24ef8862b8eb059d599bffc220d2ebb:

  media: dt-bindings: sony,imx290: Update usage example (2025-05-06 09:28:33 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.16

----------------------------------------------------------------
Andy Shevchenko (4):
      media: i2c: max9671x: Remove (explicitly) unused header
      media: i2c: ds90ub9x3: Remove (explicitly) unused header
      media: raspberrypi: rp1-cfe: Remove (explicitly) unused header
      media: i2c: rdacm2x: Make use of device properties

Dan Carpenter (3):
      media: i2c: imx334: uninitialized variable in imx334_update_exp_gain()
      media: i2c: ds90ub960: Fix uninitialized variable in ub960_serializer_temp_ramp()
      media: i2c: ds90ub960: Fix uninitialized variable in ub960_rxport_bc_ser_config()

Dongcheng Yan (1):
      media: i2c: change lt6911uxe irq_gpio name to "hpd"

Frank Li (1):
      dt-bindings: media: convert imx.txt to yaml format

Hao Yao (3):
      media: i2c: ov13b10: Fix h_blank calculation
      media: i2c: ov13b10: Improve code redability
      media: i2c: ov13b10: Support 2 lane mode

Jason Chen (6):
      media: ov08x40: Separate the lane configuration and PLL settings
      media: ov08x40: Add support for 2/4 lanes at 1500 Mbps
      media: ov08x40: Remove common register settings from resolution-specific table
      media: ov08x40: Add shared global register list
      media: ov08x40: Use v4l2_link_freq_to_bitmap helper
      media: ov08x40: Select mode based on mipi lane count

Johan Hovold (2):
      media: ov5675: suppress probe deferral errors
      media: ov8856: suppress probe deferral errors

Kieran Bingham (2):
      media: imx335: Add MAINTAINER entry
      media: i2c: imx335: Fix frame size enumeration

Laurent Pinchart (1):
      media: ccs-pll: Print a debug message when VT tree calculation fails

Lukas Bulwahn (1):
      MAINTAINERS: adjust file entry in OMNIVISION OV7670 SENSOR DRIVER

Michael Riesch (2):
      media: mailmap: add entry for Michael Riesch
      media: dt-bindings: sony,imx415: update maintainer e-mail address

Niklas Söderlund (1):
      media: dt-bindings: sony,imx290: Update usage example

Sakari Ailus (1):
      media: common: Add v4l2_find_nearest_size_conditional()

Stanislaw Gruszka (4):
      media: intel/ipu6: Remove unused ipu6_isys_csi2_pdata
      media: intel/ipu6: Remove pin_ready function pointer
      media: intel/ipu6: Remove line_align
      media: intel/ipu6: Change deprecated lock comment

Umang Jain (1):
      media: imx335: Use correct register width for HNUM

 .mailmap                                           |    1 +
 .../bindings/media/fsl,imx-capture-subsystem.yaml  |   38 +
 .../bindings/media/fsl,imx6-mipi-csi2.yaml         |  144 ++
 .../devicetree/bindings/media/i2c/sony,imx290.yaml |    2 +-
 .../devicetree/bindings/media/i2c/sony,imx415.yaml |    2 +-
 Documentation/devicetree/bindings/media/imx.txt    |   53 -
 MAINTAINERS                                        |    9 +-
 drivers/media/i2c/ccs-pll.c                        |    4 +-
 drivers/media/i2c/ds90ub913.c                      |    1 -
 drivers/media/i2c/ds90ub953.c                      |    1 -
 drivers/media/i2c/ds90ub960.c                      |    4 +-
 drivers/media/i2c/imx334.c                         |    3 +-
 drivers/media/i2c/imx335.c                         |    5 +-
 drivers/media/i2c/lt6911uxe.c                      |    4 +-
 drivers/media/i2c/max96714.c                       |    2 +-
 drivers/media/i2c/max96717.c                       |    2 +-
 drivers/media/i2c/ov08x40.c                        | 1378 ++++++++++----------
 drivers/media/i2c/ov13b10.c                        |  176 ++-
 drivers/media/i2c/ov5675.c                         |    5 +-
 drivers/media/i2c/ov8856.c                         |    9 +-
 drivers/media/i2c/rdacm20.c                        |    7 +-
 drivers/media/i2c/rdacm21.c                        |    7 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |    2 -
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |    2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |    5 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |    5 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |    8 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c           |    8 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h           |    4 -
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   |    1 -
 drivers/media/v4l2-core/v4l2-common.c              |   18 +-
 include/media/v4l2-common.h                        |   58 +-
 32 files changed, 1127 insertions(+), 841 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/imx.txt

Please pull.

-- 
Kind regards,

Sakari Ailus

