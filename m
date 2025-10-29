Return-Path: <linux-media+bounces-45940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A4BC1A2B2
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 13:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3770D4E7079
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 12:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226DE33B971;
	Wed, 29 Oct 2025 12:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="wk29w5gM"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8312E6CDA
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 12:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761740430; cv=pass; b=ZmoMvJ43eGjO69er+/UmB6c/OiSBdYczUUCf4a/3Osb/SqF4/OR6o4epWc+z6fHQTnj8BuvpbHRRTqbnIF9m+y/Tbx8CCrMeaQNKrDyI7hMFl+sLh5g4NKK80YryfSuKBUHfkfVoMsVTZYeACviHm0Dkth2en/9Vygf2N+/oA3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761740430; c=relaxed/simple;
	bh=kZ04/Hq43fSZVVEpXYGSqyOgCz4LNkQfhQ+IPLAjlRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YnEX48rmIgrB8kARGD6VEAfaKYUNSqd78LwrQW7wlXqytE7nF8tqNoh/S2SELqShDN8WMe9ht+eJ82hajzKCwpm937E3/nCl4idN2aQVTNMUSrww2GkF+fUWtpcclTEVXUk6l2xeKl5iRsnTx9g/O5R04LGGLYzOt+cjIDKXw34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=wk29w5gM; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cxRCR6PmKzyS8;
	Wed, 29 Oct 2025 14:20:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1761740420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KMwB+QKFIcwnZktbkrDXv5VAUGBmTnptK12m94MQyt4=;
	b=wk29w5gMPwMtnKHwMWWyBPgDcASeo1bhW6uslWWgW32oMFK93tg8ipFatzcIBAUwB8YxnU
	bZ0n1spFeiiEBuXTMMd57vt06oFduL2iODn0tr39RUyrmqnG07q8Pnvp2XFrHlL2pYRB4t
	lkrkqQmpxP7c6oLmpBT4TQaR4Yk1wc0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1761740420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KMwB+QKFIcwnZktbkrDXv5VAUGBmTnptK12m94MQyt4=;
	b=TMIWAflypj52CCStkJm6m3F6snRac0Hi3B6hb5We1HQo24tu2LYAkr7nmr/2ScyrSWnaFT
	leuKkoQHkRDToY490HXWMZPR9ciUAYytKRCuB/bZ3gXRTcSokQWeJg+eCTF2g0D+1cJ5XS
	fT6oqr8XzwxmS8tAaJnQbuQh+FlcDkY=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1761740420; a=rsa-sha256; cv=none;
	b=EcDC3XvUThV2bFpNFjCbhRBbjfxOe9N3IP2NIR1wm7CSWT/eFfM6fYXenGuWQGArKVWwBK
	zQ6iO2xADSB/SP7zkZgQVOSBnkzkLM7yijXoHPYWZ7LQ5qtt6gEyVpe0r3YKeTGlTBEOD2
	hkKxVSruscFG6NJHNQ4dTjponF0OFU4=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7936D634C50;
	Wed, 29 Oct 2025 14:20:19 +0200 (EET)
Date: Wed, 29 Oct 2025 14:20:19 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR v6.19] V4L2 camera sensor patches mostly
Message-ID: <aQIGgwXnkLhXcqCq@valkosipuli.retiisi.eu>
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

Please pull.


The following changes since commit c218ce4f98eccf5a40de64c559c52d61e9cc78ee:

  media: v4l2-ctrls: set AV1 sequence flags for testing (2025-10-28 11:06:11 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.19-1-signed

for you to fetch changes up to 7ea6dd9d7f1c00a87d918f48903093e6dbb7ce89:

  MAINTAINERS: Update Daniel Scally's email address (2025-10-29 09:34:34 +0200)

----------------------------------------------------------------
- MAINTAINERS updates in DW9719, OV5693 and ov08x40 drivers
- Support for DW9718S, DW9719, DW9718S, DW9800K and DW9761 VCMs and other
  dw9719 driver and DT binding improvements
- DT binding YAML conversion for nxp,tda1997x and cleanup for fsl,imx6q-vdoa
- Cleanups and fixes for imx219
- Add ACPI ID for ov13b10 in ASUS Z13 Flow laptop
- Add vd65g4, vd65g4 RGB variant support in vd55g1 driver
- Fix default vflip for ov02c10, add flipping controls
- Cleanups for ipu3-imgu and ipu7 staging drivers
- Kconfig cleanup for OV2735 driver

----------------------------------------------------------------
Adam J. Sypniewski (1):
      media: ov13b10: Add ACPI ID for ASUS Z13 Flow laptop

André Apitzsch (3):
      dt-bindings: media: i2c: Add DW9718S, DW9719 and DW9761 VCM
      media: i2c: dw9719: Deprecate dongwoon,vcm-freq
      media: i2c: dw9719: Remove unused i2c device id table

Benjamin Mugnier (2):
      media: dt-bindings: vd55g1: Add vd65g4 compatible
      media: i2c: vd55g1: Add support for vd65g4 RGB variant

Daniel Scally (1):
      MAINTAINERS: Update Daniel Scally's email address

Dave Stevenson (1):
      media: i2c: imx219: Fix 1920x1080 mode to use 1:1 pixel aspect ratio

Elgin Perumbilly (1):
      media: i2c: Fix vendor name typo in OV2735 Kconfig help text

Frank Li (4):
      dt-bindings: media: Convert ti,tvp5150.txt to yaml format.
      dt-bindings: media: convert nxp,tda1997x.txt to yaml format
      dt-bindings: media: fsl,imx6q-vdoa: remove redundant ""
      media: dt-bindings: video-interfaces: add video-interfaces.h information

Griffin Kroah-Hartman (2):
      dt-bindings: media: i2c: dw9719: Document DW9800K
      media: i2c: dw9719: Add DW9800K support

Jai Luthra (1):
      media: i2c: imx219: Simplify imx219_get_binning() function

Laurent Pinchart (2):
      media: ipu3-imgu: Drop struct imgu_device v4l2_file_ops field
      media: staging: ipu7: isys: Drop video_open() function

Ma Ke (1):
      media: ivsc: Release csi_dev reference early in mei_ace_setup_dev_link()

Sakari Ailus (1):
      media: MAINTAINERS: Assign ov08x40 driver to Jimmy

Sebastian Reichel (2):
      media: ov02c10: Fix default vertical flip
      media: ov02c10: Support hflip and vflip

Val Packett (5):
      media: i2c: dw9719: Add an of_match_table
      media: i2c: dw9719: Add driver_data matching
      media: i2c: dw9719: Add DW9718S support
      media: i2c: dw9719: Update PM last busy time upon close
      media: i2c: dw9719: Fix power on/off sequence

 .../devicetree/bindings/media/fsl,imx6q-vdoa.yaml  |   2 +-
 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  89 ++++++++
 .../bindings/media/i2c/nxp,tda19971.yaml           | 162 ++++++++++++++
 .../devicetree/bindings/media/i2c/nxp,tda1997x.txt | 178 ----------------
 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |   6 +-
 .../devicetree/bindings/media/i2c/ti,tvp5150.txt   | 157 --------------
 .../devicetree/bindings/media/i2c/ti,tvp5150.yaml  | 133 ++++++++++++
 .../bindings/media/video-interfaces.yaml           |   4 +-
 MAINTAINERS                                        |   9 +-
 drivers/media/i2c/Kconfig                          |   2 +-
 drivers/media/i2c/dw9719.c                         | 128 +++++++++--
 drivers/media/i2c/imx219.c                         |  25 +--
 drivers/media/i2c/ov02c10.c                        |  27 ++-
 drivers/media/i2c/ov13b10.c                        |   1 +
 drivers/media/i2c/vd55g1.c                         | 234 +++++++++++++++------
 drivers/media/pci/intel/ivsc/mei_ace.c             |   4 +-
 drivers/staging/media/ipu3/ipu3.h                  |   1 -
 drivers/staging/media/ipu7/ipu7-isys-video.c       |   7 +-
 18 files changed, 710 insertions(+), 459 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,tvp5150.yaml

-- 
Kind regards,

Sakari Ailus

