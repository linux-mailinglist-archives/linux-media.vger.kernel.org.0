Return-Path: <linux-media+bounces-35864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE57AE818B
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 13:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BCB3169906
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 11:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F6025C6EF;
	Wed, 25 Jun 2025 11:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="RHQnem+a"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B4E25C83D
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851411; cv=pass; b=fefvJVbpHy9YJaHFeIvGEjCXz9UMwNcrSfAtRMiEUAeNKKmoe9R7d4j97BX/FFPYsSor8VpurQniIf1LADXm+NoOiqRITFBQhAPHr8KZEC4tjEXUmi7zRB3BOjWdaP2RNa7ZhXsKI0tLwwaHTeq8MCvHo0jSn8t8yI25Eousqtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851411; c=relaxed/simple;
	bh=2/y1jbGFXyl59BxbxjXLNglssuFu85oP++5qFhDZpP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tpqeEWyl1E2WTerriGChn/k8NfWl3RzeagjUtUlvtsLsHa0sOqU515B4O3eUfKxBEWVJahmOGX9um5Pj6m2eSoRQPqujWTSqi+MA4E5wh+H1yQ5HA3q0VbrLeH0igF+wIigVLUoggKKvGVOsIJtRLoI6BcMSzaFsspGGEniwvHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=RHQnem+a; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4bS0C85nShz49Psw;
	Wed, 25 Jun 2025 14:36:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1750851397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=/+hSUmX6FXXU2P8e01Q1FE/6vkXr1lffer8n1TRJX0o=;
	b=RHQnem+aYzYBc5CIO/nHygGn9hd5lqEFVJs2cDrnIFbntO+DGZrJ97C/EZG4ZxKuBiLis7
	qqY/j268Gob6iCJepbm6DwxwTpeIIvR0P6nPl1xMiT/gYoNiHPCDJISo48MzCWUugpHOLO
	IGgAbPV+vY5Fxa6LReiKlakEVlfW0p3Z2LGU9ePBr3U82HocP5OWQsAIRPqprgVU6ZkvAy
	DZIQ3G/FAG4kmMt0zlszWlDct2hHc4N9RySQOJOSxoln+ukULn6Adt44rfCeRmx9Uve4Il
	Oq7BqHy1U+BCsBnIm1OE24/Hxf/YQqBmEH0DHs8rTfvuwNk3siVdlM1BX5ZdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1750851397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=/+hSUmX6FXXU2P8e01Q1FE/6vkXr1lffer8n1TRJX0o=;
	b=I3HM0II3J9WyCJHHggnXGFASXYawXCldb3oz/yRhIbYD5G+ZabBXcjc55vsCHPzGUzrnNC
	BIsfZAZ5pnKRbG5zxJgOzD0oL3BzoLn8LFSExC2x3LBd9opW50DafiFDMZ0XBoCl3tnsqU
	1HdUgzaedy/CFqoe1bvCUaOxEnTaMUrepDAnlvQsQ/WMXY+giA0XiR8iZ6T0iFxKGhfgNe
	CkReSxnzYZOQftrtfH2F+LpZ8lGSfpmoCpDlwaIweD0FkVJhaDycD6N+02uJsgwVfrreOq
	97mb+kJNJR/C6L7JG8fQqD7XQMERUumkBlIrf92kcFVSb9WV/FTBhtm9ZvysTg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1750851397; a=rsa-sha256;
	cv=none;
	b=DvXQA4mUnlaBUNQ0l10Rm7hIgY5ptJvvUq3ccUoC27Dt94ybfEEQTpLsrgLXdR9qP3IalH
	/oat8b8PvT+v4BJqNLkM6RrFPA3VnnD2ZQcAazN5pa27QuxZqBicNjcb9xDkczBSjvb++7
	yacXh/n4DJQDZ+eWMg0Szcai80EcdF59ETzIkeJFf1vW08N7izyrKFJx/1Hk6vUWYa8IZ0
	4LAVzHOefJAz5+cmNdtVGqs5480jFnARahhd65r07o8bLtWIPKx860IZe7ySM47VPnNBIq
	uo6p8W6AteQKdv3+ANmwDSZ3icvOTf9reX+UN5t9OSKAxZEQKZ1eBf9/XOyDuw==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 613B4634C93;
	Wed, 25 Jun 2025 14:36:36 +0300 (EEST)
Date: Wed, 25 Jun 2025 11:36:36 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, bingbu.cao@intel.com
Subject: [GIT PULL FOR 6.17] IPU7 staging driver
Message-ID: <aFvfRHRxXNQOe7-z@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

This PR includes the IPU7 staging driver. The purpose of merging this now
is to make it easier to access it for users while refactoring is done on
the IPU6 driver codebase to make its hardware-independent portions usable
in the IPU7 driver, which is expected to take a couple of more kernel
releases.

Please pull.


The following changes since commit c0b1da281d84d33281fc49289f0c7f8aada450ff:

  media: rc: ir-spi: avoid overflow in multiplication (2025-06-23 12:11:04 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/ipu7-6.17-1-signed

for you to fetch changes up to e303c42c15089b286bc31c219794e76f3b4c374f:

  media: staging/ipu7: add Makefile, Kconfig and to-do file for IPU7 (2025-06-25 13:18:22 +0300)

----------------------------------------------------------------
IPU7 staging driver merge for 6.17

----------------------------------------------------------------
Bingbu Cao (7):
      media: staging/ipu7: add Intel IPU7 PCI device driver
      media: staging/ipu7: add IPU7 DMA APIs and MMU mapping
      media: staging/ipu7: add firmware parse, syscom interface and boot
      media: staging/ipu7: add IPU7 firmware ABI headers
      media: staging/ipu7: add IPU7 input system device driver
      MAINTAINERS: add maintainers for Intel IPU7 input system driver
      media: staging/ipu7: add Makefile, Kconfig and to-do file for IPU7

 MAINTAINERS                                        |    9 +
 drivers/staging/media/Kconfig                      |    2 +
 drivers/staging/media/Makefile                     |    1 +
 drivers/staging/media/ipu7/Kconfig                 |   18 +
 drivers/staging/media/ipu7/Makefile                |   23 +
 drivers/staging/media/ipu7/TODO                    |   28 +
 drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h  |  163 ++
 .../staging/media/ipu7/abi/ipu7_fw_common_abi.h    |  175 ++
 .../staging/media/ipu7/abi/ipu7_fw_config_abi.h    |   19 +
 .../media/ipu7/abi/ipu7_fw_insys_config_abi.h      |   19 +
 drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h  |  412 +++
 drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h   |  465 ++++
 .../media/ipu7/abi/ipu7_fw_psys_config_abi.h       |   24 +
 .../staging/media/ipu7/abi/ipu7_fw_syscom_abi.h    |   49 +
 drivers/staging/media/ipu7/ipu7-boot.c             |  430 +++
 drivers/staging/media/ipu7/ipu7-boot.h             |   25 +
 drivers/staging/media/ipu7/ipu7-bus.c              |  158 ++
 drivers/staging/media/ipu7/ipu7-bus.h              |   69 +
 drivers/staging/media/ipu7/ipu7-buttress-regs.h    |  461 ++++
 drivers/staging/media/ipu7/ipu7-buttress.c         | 1192 +++++++++
 drivers/staging/media/ipu7/ipu7-buttress.h         |   77 +
 drivers/staging/media/ipu7/ipu7-cpd.c              |  276 ++
 drivers/staging/media/ipu7/ipu7-cpd.h              |   16 +
 drivers/staging/media/ipu7/ipu7-dma.c              |  477 ++++
 drivers/staging/media/ipu7/ipu7-dma.h              |   46 +
 drivers/staging/media/ipu7/ipu7-fw-isys.c          |  301 +++
 drivers/staging/media/ipu7/ipu7-fw-isys.h          |   39 +
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c     | 1034 ++++++++
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.h     |   16 +
 drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h   | 1197 +++++++++
 drivers/staging/media/ipu7/ipu7-isys-csi2.c        |  543 ++++
 drivers/staging/media/ipu7/ipu7-isys-csi2.h        |   64 +
 drivers/staging/media/ipu7/ipu7-isys-queue.c       |  829 ++++++
 drivers/staging/media/ipu7/ipu7-isys-queue.h       |   72 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.c      |  348 +++
 drivers/staging/media/ipu7/ipu7-isys-subdev.h      |   53 +
 drivers/staging/media/ipu7/ipu7-isys-video.c       | 1112 ++++++++
 drivers/staging/media/ipu7/ipu7-isys-video.h       |  117 +
 drivers/staging/media/ipu7/ipu7-isys.c             | 1166 ++++++++
 drivers/staging/media/ipu7/ipu7-isys.h             |  140 +
 drivers/staging/media/ipu7/ipu7-mmu.c              |  853 ++++++
 drivers/staging/media/ipu7/ipu7-mmu.h              |  414 +++
 drivers/staging/media/ipu7/ipu7-platform-regs.h    |   82 +
 drivers/staging/media/ipu7/ipu7-syscom.c           |   78 +
 drivers/staging/media/ipu7/ipu7-syscom.h           |   35 +
 drivers/staging/media/ipu7/ipu7.c                  | 2784 ++++++++++++++++++++
 drivers/staging/media/ipu7/ipu7.h                  |  242 ++
 47 files changed, 16153 insertions(+)
 create mode 100644 drivers/staging/media/ipu7/Kconfig
 create mode 100644 drivers/staging/media/ipu7/Makefile
 create mode 100644 drivers/staging/media/ipu7/TODO
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_insys_config_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_psys_config_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-boot.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-boot.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-bus.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-bus.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-buttress-regs.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-buttress.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-buttress.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-cpd.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-cpd.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-dma.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-dma.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-fw-isys.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-fw-isys.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi2.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi2.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-queue.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-queue.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-subdev.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-subdev.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-video.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-video.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-mmu.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-mmu.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-platform-regs.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-syscom.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-syscom.h
 create mode 100644 drivers/staging/media/ipu7/ipu7.c
 create mode 100644 drivers/staging/media/ipu7/ipu7.h

-- 
Kind regards,

Sakari Ailus

