Return-Path: <linux-media+bounces-13280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD75909122
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 19:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CD44B238F5
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 17:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA58319AD48;
	Fri, 14 Jun 2024 17:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="Vw3+h8yr"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699731974EA
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 17:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718385142; cv=pass; b=K6d+b7AsdB97cvauNOdz7s8PAHe3nsFqIOFL0SDkyrwB2biwNBSTgoMl39vN+XIUJO87c0AbKoy2jbFayozxKfnmWQJUmmUcUBJKLp+hnn+P9peEI0UUkXHderS4IY3q/Lve45eOnjv98C8C9nU4u7xSom5tdF1MQUEktsZrxOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718385142; c=relaxed/simple;
	bh=Jfs467dswzjrwldDXpvq87Zs/77rHqJZVtlFdNOYRh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u2AJFjE7xX+pd9+AkI4U1tTrin7AgeFxtKsZffJ/8qOuX0e7/S7OCPKrixYkCdJz/WboNt3kzsTugabGtjw0mjYPc7pNHHxy4QdmlSwoITSG7Mqi/klaXbUWNOvPp+2/sWhz1PpK5LTwC1t92+qLTbW6ZjdjU7K8Ah3KZvLLKKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=Vw3+h8yr; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4W15Rz08hkzyR2;
	Fri, 14 Jun 2024 20:12:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1718385135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=IzI3uYJ+FhK2PMOJmo4LbP9c8r0NeTEbetquTYGzcII=;
	b=Vw3+h8yrqXSOI+t9+o/kempWODAwNomVTo7cS3IqgSODiXzgcNn2DX+ftMzm+6RjZirdcV
	kAhVpxEQWe5XxP2sJ2arNtH81KTYPCKv/LT2JY3Tb1ApE/Eub69oT1toJIaZQIzBqg+Z9x
	QYrvnVeXATxdqR6VgbYbe6yAsbAZjy4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1718385135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=IzI3uYJ+FhK2PMOJmo4LbP9c8r0NeTEbetquTYGzcII=;
	b=SEqC5XhQ0mBCeDb4kk/GrLOTfZJX0sfyyzrHltswwqJ/FdneLZfh9V6HJcdFNbUDRbPA9D
	LgfQWax2XVXqntNsAu73+EiPRt3gHwIyqEpi0lCSD9Dz6h0f1krXHfjQdcmaTji3RvshNm
	QtxprZPZBFeZkx9WYjH9ve844fZsd0M=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1718385135; a=rsa-sha256; cv=none;
	b=ipTETkAu/XFECoQoE1lK1ojFswpRpysJj3o/KENajZoc34RnbDDm4zQ7585CXQ8lI38+oL
	cQ/iuylrB4kuxHKLiBwGpN8WLtjX1Lo++9z60S8Sw0or0C5GhdA4DHy+VgJHYNdGeM0Kqg
	/0rdduoJ7GbazZJPgRf033NkXxzmJAA=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 370AD634C93;
	Fri, 14 Jun 2024 20:12:14 +0300 (EEST)
Date: Fri, 14 Jun 2024 17:12:14 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.11] V4L2 patches
Message-ID: <Zmx57vVS4lsTXkfs@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are fixes for the IVSC, alvium and imx219 drivers, and cleanups and
improvements for the rest (ov5647, vgxy61, alvium, ov2680 and ipu-bridge).

Also included is the use of MODULE_DESCRIPTION() macro for v4l2-async and
v4l2-fwnode.

Please pull.


The following changes since commit 156922faabcef2979cb2ddc2fbaa659b5ea37f54:

  media: atomisp: Switch to new Intel CPU model defines (2024-06-13 21:43:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.11-2.2-signed

for you to fetch changes up to 76694bf770818c6823f9d2fb07aae6038626a279:

  media: v4l: add missing MODULE_DESCRIPTION() macros (2024-06-14 20:07:40 +0300)

----------------------------------------------------------------
V4L2 patches for 6.11

----------------------------------------------------------------
Abdulrasaq Lawani (1):
      media: i2c: ov5647: replacing of_node_put with __free(device_node)

Benjamin Mugnier (1):
      media: i2c: vgxy61: Fix device name

Conor Dooley (1):
      media: i2c: imx219: fix msr access command sequence

Hans de Goede (3):
      media: ipu-bridge: Sort ipu_supported_sensors[] array by ACPI HID
      media: ipu-bridge: Add HIDs from out of tree IPU6 driver ipu-bridge copy
      media: ov2680: Pass correct number of controls to v4l2_ctrl_handler_init()

Jeff Johnson (1):
      media: v4l: add missing MODULE_DESCRIPTION() macros

Tommaso Merciai (5):
      media: i2c: alvium: fix alvium_get_fw_version()
      media: i2c: alvium: rename acquisition frame rate enable reg
      media: i2c: alvium: enable acquisition frame rate
      media: i2c: alvium: implement enum_frame_size
      media: i2c: alvium: Move V4L2_CID_GAIN to V4L2_CID_ANALOG_GAIN

Wentong Wu (3):
      media: ivsc: csi: add separate lock for v4l2 control handler
      media: ivsc: csi: don't count privacy on as error
      media: ivsc: csi: remove privacy status in struct mei_csi

 .../userspace-api/media/drivers/index.rst          |  2 +-
 .../media/drivers/{st-vgxy61.rst => vgxy61.rst}    |  0
 MAINTAINERS                                        |  6 +-
 drivers/media/i2c/Kconfig                          |  2 +-
 drivers/media/i2c/Makefile                         |  2 +-
 drivers/media/i2c/alvium-csi2.c                    | 65 +++++++++++++++++-----
 drivers/media/i2c/alvium-csi2.h                    | 16 ++++--
 drivers/media/i2c/imx219.c                         |  2 +-
 drivers/media/i2c/ov2680.c                         |  2 +-
 drivers/media/i2c/ov5647.c                         | 11 ++--
 drivers/media/i2c/{st-vgxy61.c => vgxy61.c}        |  2 +-
 drivers/media/pci/intel/ipu-bridge.c               | 40 +++++++++----
 drivers/media/pci/intel/ivsc/mei_csi.c             | 24 +++++---
 drivers/media/v4l2-core/v4l2-async.c               |  1 +
 drivers/media/v4l2-core/v4l2-fwnode.c              |  1 +
 15 files changed, 121 insertions(+), 55 deletions(-)
 rename Documentation/userspace-api/media/drivers/{st-vgxy61.rst => vgxy61.rst} (100%)
 rename drivers/media/i2c/{st-vgxy61.c => vgxy61.c} (99%)

-- 
Kind regards,

Sakari Ailus

