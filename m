Return-Path: <linux-media+bounces-50889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE9AD31530
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D056304BB63
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43392153D8;
	Fri, 16 Jan 2026 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="SLZPIGIG"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC211F1932
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768567807; cv=pass; b=jFdhJjn0i28MrsmOzgkKkQhzK+wqDnJuktGdhLM+L0fwLPbQbK6V54ARBPU2vvGILq2RRYUMc30ojNQgTkr5gJo1+N/FFcpp8gg4zI5ph7byWiN9cXHF9UkBKjpeDh2eO/mS2h1cfV95EuYQ3FY/GSBHHelUSBfPoJLlATQv/8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768567807; c=relaxed/simple;
	bh=ahc+DDZkxiJuuRf96VB9fh+Caa1rgbRKwXqq5bEbT9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XuAiOCNYS6XwNfvvL7+LBDnHRwX4NuHmC37ieZhhzp3ad//9SIB4aN8ccLuHgGfB1iOo4yo6P2yfRADsbzlPQJuGVMmIyghKWmhnV0eD2YvtZBEkcEP7Bd1h3mKO3i6xRNe4csk5ldv84fIqoSe+F+UQ8Xe8KK0VXGZN6o7/cYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=SLZPIGIG; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4dt073429fz49Q5q;
	Fri, 16 Jan 2026 14:49:51 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1768567791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=mfCXbi2fa6jAUAPnnWKuVER45/+piVAJ4Tp/SkNCA1M=;
	b=SLZPIGIGTYGIp6iUO5v+7kStWquOTelaCd3wxkadhhcmOsfSziUecHfBxr+WfCuOt+9j1n
	SnHy+co/wBJbv4vU9HoNjly/TdLDzwm7mIuVYBIL75ONtuGHgp19Xqqy4FqxZHOA5m0Fzo
	b12TigJBgn93SXBG864q/pu3Wvc3u6iRJDATiGnROdSYradAiCceQUa82Up4IgrtfcO65d
	M9mQF+CPuG6zDIbtpJiG4xiB2Lzvn19KnEeX2FEXc8VFq/JsQP58CIG9HTCL7jVPXa8e3x
	YTpbKxMVwqJ0H0DWHwasrwnSE+RcZXb2Jpxf+/VSd85SZfRyuaNH8LoKQvzFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1768567791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=mfCXbi2fa6jAUAPnnWKuVER45/+piVAJ4Tp/SkNCA1M=;
	b=CcDmYlMh2GpY6j9Y4QcQEiIoEqcznG4vUsP8mLQarT0PMEHec1TAJcI33ivbCN+hI1SZot
	OpvWwSJ06Pcuz7VtysXx24GxxsMLUYRGrEpuO5NzXRCyWPU72QCvXJCu3c3wz1UhG3W4Ab
	IDJVrArYmCFCnnIMSsYEd6u3qqqhI8u4LjSWkKnVK95qw1JLQGtxAkFGVq3qdj2LSjF6mU
	zmx007DNAEIpeOOj+39Cf2N7sEh/Px4kjD7fZesXZuDJnV6dzkbHy9WIEidAnyKQiwW2YB
	VGth2xTA8cB+XeyAkviU+lSF/OACEGTLS4RDvtNeh4vh+4HtqTMIoVJHfZmnew==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1768567791;
	b=BNo3gWfJdnztwmn+PU+A2OynrFzecQi7yDVX6C59SJ4Gn/kFR7CieRL+y0GkmFEs5rtisQ
	xN4pLXXGVN+KQKstiicDGl7UmadDY2hnJYffdlNNYJHRrsI4zdqqj2ZJzRYy1GiDSdsj7Z
	Z7xVXxjTUCJj/y31j6n9r6c+5D0SaRME43WXiyMq2Le/BHzPCk598sdi7cJS07IfesIbXa
	MWqNcqyEJcvsj/UIDdA8N9M+72vaDgKheRBREZA2ZJOZA8evWcJhGeQp0zhUje4pjfaez2
	gDhQI/evvSvKKd+bTu0w61kA18iG0MpSjwmToZ/fCdRCXpgpjFW0tMioC41XgA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CD528634C50;
	Fri, 16 Jan 2026 14:49:50 +0200 (EET)
Date: Fri, 16 Jan 2026 14:49:50 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.20] More V4L2 cleanups and other improvements
Message-ID: <aWoz7g2ZTuy9srQ_@valkosipuli.retiisi.eu>
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


The following changes since commit dc6c52205bdaddf1dc259497a958402b35c01fe2:

  media: ipu6: Always call video_device_pipeline_alloc_start() (2026-01-13 12:47:56 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.20-5.1-signed

for you to fetch changes up to f31283b29e5f1c39e183c6ca694cd9540e1db0dc:

  media: i2c: os05b10: Few minor improvements (2026-01-16 14:25:45 +0200)

----------------------------------------------------------------
More V4L2 patches for 6.20:
- os05b10, imx219, ov01a10, ccs and ov5647 cleanups and improvements
- ccs: C-PHY PLL fix
- New controls for flash duration and support for them in ov9282 driver
- Support for new formats and fixes for dcmipp driver
- Maintainers and e-mail address changes

----------------------------------------------------------------
Alain Volmat (7):
      media: stm32: dcmipp: avoid naming clock if only one is needed
      media: stm32: dcmipp: bytecap: clear all interrupts upon stream stop
      media: stm32: dcmipp: byteproc: disable compose for all bayers
      media: stm32: dcmipp: Add RGB888 format support overall
      media: stm32: dcmipp: add Y10-Y12-Y14 in all subdevs
      media: stm32: dcmipp: byteproc: only allow compose with 8/16bit fmts
      media: stm32: dcmipp: bytecap: remove useless cmier variable

David Heidelberg (1):
      media: ccs: Accommodate C-PHY into the calculation

Frank Li (1):
      MAINTAINERS: Promote Frank Li as i.MX7/8 media maintainer

Himanshu Bhavani (1):
      media: i2c: os05b10: Few minor improvements

Krzysztof Kozlowski (1):
      media: i2c: Add note to prevent buggy code re-use

Laurent Pinchart (1):
      media: i2c: imx219: Inline imx219_update_pad_format() in its caller

Mehdi Djait (1):
      media: i2c: ov01a10: Fix digital gain range

Richard Leitner (8):
      media: v4l: ctrls: add a control for flash/strobe duration
      media: v4l: ctrls: add a control for enabling strobe output
      Documentation: uAPI: media: add V4L2_CID_FLASH_{DURATION,STROBE_OE}
      media: i2c: ov9282: add output enable register definitions
      media: i2c: ov9282: add strobe output enable v4l2 control
      media: i2c: ov9282: add strobe_duration v4l2 control
      media: i2c: ov9282: implement try_ctrl for strobe_duration
      media: i2c: ov9282: dynamic flash_duration maximum

Sakari Ailus (11):
      media: ccs: Clean up ccs_get_hwcfg() a little
      media: ccs: Use devm_v4l2_sensor_clk_get()
      media: ipu6: Update e-mail addresses
      media: ov01a10: Fix indentation
      media: ccs: Remove ccs_get_crop_compose helper
      media: ccs: Rely on sub-device state locking
      media: ccs: Switch to guard and scoped_guard
      media: ccs: Compute binning configuration from sub-device state
      media: ccs: Compute scaling configuration from sub-device state
      media: ccs: Remove which parameter from ccs_propagate
      media: ccs: Make supported mbus code bitmask a u64

Xiaolei Wang (3):
      media: i2c: ov5647: Convert to CCI register access helpers
      media: i2c: ov5647: Switch to using the sub-device state lock
      media: i2c: ov5647: switch to {enable,disable}_streams

 .../userspace-api/media/v4l/ext-ctrls-flash.rst    |  42 ++
 MAINTAINERS                                        |   4 +-
 drivers/media/i2c/Kconfig                          |   1 +
 drivers/media/i2c/adv7604.c                        |   8 +-
 drivers/media/i2c/ccs/ccs-core.c                   | 564 ++++++++++-----------
 drivers/media/i2c/ccs/ccs.h                        |  11 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |   4 +
 drivers/media/i2c/imx219.c                         |  29 +-
 drivers/media/i2c/os05b10.c                        |  19 +-
 drivers/media/i2c/ov01a10.c                        |   4 +-
 drivers/media/i2c/ov5647.c                         | 503 ++++++------------
 drivers/media/i2c/ov9282.c                         | 173 ++++++-
 drivers/media/pci/intel/ipu6/ipu6-isys.c           |   2 +-
 drivers/media/pci/intel/ipu6/ipu6.c                |   2 +-
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |  24 +-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  24 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |   7 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  |  10 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   3 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 20 files changed, 734 insertions(+), 702 deletions(-)

-- 
Sakari Ailus

