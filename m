Return-Path: <linux-media+bounces-31688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE843AA8E7F
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 10:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4572B174D53
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 08:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0066F1F3FEC;
	Mon,  5 May 2025 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="GvNcqwCv"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1581A2393
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 08:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746434758; cv=pass; b=Qragu3hs07u8rBPSsE07hzec5r1dAyfvIDsVgG5vqiEoebDGTuZ5yhkQuFPla8xOoucjefhxwoQJRo9uboumrbBDdTy9rM4Z+GT6H7pwbwgMXca1UYJpoWIQ9taVcVa3oiDgvv/kVOO9tnk3T77dcs26yiLD4ipyjLxF48R3YaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746434758; c=relaxed/simple;
	bh=RQOcfyQGLTGKvzY69d9w1Vc2w875ecQ6ttPgUNJpwg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mxe/6VriU/Kz786ja/2//7hpLTMhr3pNtW0lU0P58BNjLkzEZ9d3JOT2EYWN8GUbS/WAb4djZLBWSa5qC30J3Q4up8/HruH08OHKPkrmGBVVABlFwfv1z0SKivkvz5Pbf2nn5MDLE7Xnv/cn1AOqjn0MQ3GbxfCfa4WkNL05Moc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=GvNcqwCv; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4ZrZqc59Hfz49Q8f;
	Mon,  5 May 2025 11:45:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1746434749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g1XY3xiBToULba/6aaVeCiR09N2BmLG5S47eYRTctV8=;
	b=GvNcqwCvD/qs4Aph0uQK2KTIGTcrErN01f3CQwoVLPWDlhjq5x8I2xXGvuYMpMgP1KSYbV
	FtXDnobGSUH91cTlr46jccTQG9zgysra13Tp69uNaOdHmntmJ1KxYwgjcl2BBz3FsnTunB
	8LBAv7+FfREUs+so+DndqeaYQbifzZkvy+/Pk8fjBgSPlwz08Fmmrfz29iPwrJg7xdDjF0
	Iz5UQELsQ7wVoctLJlQC7RAaO/f3j33WrIat5XrRPNGhWImRD/RJwQ5nMsXP5P4SJVin7G
	G1oXMYFoMaFUeioejEZHTy2Fn6nSIz+Bq/F54feTnpB+YdlWxQcJmm66cMqIbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1746434749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g1XY3xiBToULba/6aaVeCiR09N2BmLG5S47eYRTctV8=;
	b=jlOKF1Rb4ORxuH+QkzEf7ssrUhllQLmlngyqT6/RnjzPOoUizmWNUYLTWSftFmBxPGE5I0
	z9k1oiA2medkm2oOZSyKAITVpBYyuCtvxm/mVhZfC0mZhisLNKHo/AIeNUUS/BjSk0uZyD
	tSEcX1DS3otD8o6wGH4acuMjJD+63BJvvUIV9EB7c+Ea4/tpSvWw86zlvB+yAEWxCFAwD2
	phn1+7q/1GP4R+PTtMYWcImlL11fOdNV/cr0dtazgYTBRp/OkLhQpleCSI/3mba9gRRuCa
	MepNsttdmBExL9zQWXseuqVgMZqGbRgCnw0mCZeVr622Y6f/bKj+QKicYzSHyQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1746434749; a=rsa-sha256;
	cv=none;
	b=u2PpInGA2lDPa1GzBQn/DvHTF/7mVdt9P2bZ1aZ2FUygNsnTH0LURXDmorxhj6k5cnNHZZ
	CdRbBsf4z34fUBCBCINmPyzX+wa2k4cxJJcPbNIP6w3rf83LV6BpjgvlZbI7bTnd7fEbbO
	9arNTlYaprEutePNOz2GLLVvqTwuZCQ2Mfqn9APc1Ax3eCH4NmyHTSVamWHnImMuHlm04q
	WvaV0SeXmfTmFnUHw80lKuqBmxAvRSnVe5k2DFlEFjLNtyKPvrgqtRe42NMJolCBmkapKn
	6OmG8b9SRRgvW/6hE09QHnjax/t0qrGanYmlJEyCt3gKFmJe2S1DKjgaMK75XQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 368E4634C93;
	Mon,  5 May 2025 11:45:48 +0300 (EEST)
Date: Mon, 5 May 2025 08:45:48 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.16] Camera cleanups and fixes
Message-ID: <aBh6vAe3u2yyZBlX@valkosipuli.retiisi.eu>
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


The following changes since commit b64b134942c8cf4801ea288b3fd38b509aedec21:

  media: renesas: vsp1: Expose color space through the DRM API (2025-05-02 10:16:44 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.16-2.1-signed

for you to fetch changes up to 95db5a6c98dea5d03e9f06609bb0a7d1b4d463d3:

  media: dt-bindings: sony,imx290: Update usage example (2025-05-05 11:41:15 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.16

----------------------------------------------------------------
Andy Shevchenko (4):
      media: i2c: max9671x: Remove (explicitly) unused header
      media: i2c: ds90ub9x3: Remove (explicitly) unused header
      media: raspberrypi: rp1-cfe: Remove (explicitly) unused header
      media: i2c: rdacm2x: Make use of device properties

Bingbu Cao (1):
      media: lt6911uxe: select V4L2_CCI_I2C in Kconfig

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
 drivers/media/i2c/Kconfig                          |    1 +
 drivers/media/i2c/ccs-pll.c                        |    4 +-
 drivers/media/i2c/ds90ub913.c                      |    1 -
 drivers/media/i2c/ds90ub953.c                      |    1 -
 drivers/media/i2c/ds90ub960.c                      |    4 +-
 drivers/media/i2c/imx334.c                         |    3 +-
 drivers/media/i2c/imx335.c                         |    5 +-
 drivers/media/i2c/lt6911uxe.c                      |    4 +-
 drivers/media/i2c/max96714.c                       |    2 +-
 drivers/media/i2c/max96717.c                       |    2 +-
 drivers/media/i2c/ov08x40.c                        | 1376 ++++++++++----------
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
 33 files changed, 1128 insertions(+), 839 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/imx.txt

Please pull.

-- 
Kind regards,

Sakari Ailus

