Return-Path: <linux-media+bounces-3681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB082D673
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 10:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D03D41C215F8
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 09:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5210E575;
	Mon, 15 Jan 2024 09:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="QqaJlVMU"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7720AF51B
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TD6tC5YMxz49PyV
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 11:54:11 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1705312451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=pRRJPq3mABlp55Urh5sb7N3rmnA2nNS1aBA6m/qlzYY=;
	b=QqaJlVMUjHA+eVkUzDZsMxiGB1pZFxqpUzMdCvMDf2DWQ4j+3Gqw4NPAiISqj0RMKR4WmM
	/02AYWAZVeuheACyomBRMIbrBC+osk+i2dyhf7I4lbjCT4HS1SuPrJ5ofComwzMy95dEvF
	RoGUmrqGZlZwcmKujrh2ZJSGmXOE5BLG9jXYgpBtom/gr4Cob110djamVdVIfwvmjV4FrG
	2iLLM9cO5V9M2aBxt7mauGBs2q3EvQFFrkb24NHApWJlpnD2RjjmNU5z8HdoKf8JF9sKNn
	kGYsoBtfQ7euAUfG/UhhF/IMpmk9fGPi+6VKFG/31Y1xYQkUrlEOtqNtMpCOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1705312451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=pRRJPq3mABlp55Urh5sb7N3rmnA2nNS1aBA6m/qlzYY=;
	b=ikeARcpHC8fe3kSZIa/eZg1fEv/uIt/ss3A0PsXIaLdydgW6Qy/dwffp6Rn7z7ovFXtyzy
	f/X8m9fNentdSWsVo8PqwgWA5CgMu1+NFU1PnS32XwWdELNl/JU/Xvr1bsJXXP8FGYOQ9t
	ETHJ+nCB3r34DTvxCKKv4jwoR61CVjk6Zg4/h1ApB9gqR+mKjV13IOwMbhLuK1U2DnhgHW
	7atMxXp0PF+XCf2KaO0H6/z62WZe9iszurMtLuQY0nAmOLsztQOzSBgambCHYM9eTjgqnD
	iLEKU3mIC7JAXHCOSKLgCOiSQGtUGcJlfyAvoH1xf24ur4dYxHura42HLQGR/Q==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1705312451; a=rsa-sha256;
	cv=none;
	b=c9jiI+UxiWEI6pEGACzGf8CQgpoJkIW3JkPwfZpyErHwIESszRlITD3hjTz+hRtGuUzTn0
	bACn32nl8JK2niKv5kWMpcHcP7XknfYKf1fmIqR7HBj51vIzUTMGJHllN8n0xpdliGVH1k
	dBg7+HrrLFem5T/D/wrIG/ej7uqy60I3Cva+LrYlXqJ8EttKBtXtmyC3sRPhHn7SQpdlxY
	v9ifFCupjm7FtnR8xOLMEUTjFT2Cbr/Nxi63ns3NIzbEcWQZFvj22UYleBy+YGTECgKdI3
	8YvCjKazOT+bbIWcb/Fw11+Yvn+ec8qsCqotNGbVvg0S8No9gtXjFBc98+QDmw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1932F634C93
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 11:54:11 +0200 (EET)
Date: Mon, 15 Jan 2024 09:54:10 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.9] V4L2 patches
Message-ID: <ZaUAwu0j22NDkWZ7@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro, Hans,

Here are a few patches, mostly cleanups and fixes. Debug messages are also
added to v4l2_fwnode_create_links_for_pad() and the Cadence csi2rx gets
support for additional formats. Also a fix for the IPU3 ImgU driver is
included, cc'd to stable, too.

Please pull.


The following changes since commit 02d4e62ae2452c83e4a3e279b8e4cb4dcbad4b31:

  media: i2c: mt9m114: use fsleep() in place of udelay() (2023-12-14 12:40:13 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.9-1-signed

for you to fetch changes up to 718594b35b7cead6cb022899cd2b8746d74ef12d:

  media: i2c: ar0521: fix spellos (2024-01-11 12:27:13 +0200)

----------------------------------------------------------------
V4L2 patches for 6.9

----------------------------------------------------------------
Changhuang Liang (1):
      media: cadence: csi2rx: Add enum_mbus_code pad ops

Colin Ian King (1):
      media: v4l2-subdev: Fix spelling mistake "heigth" -> "height"

Hidenori Kobayashi (1):
      media: staging: ipu3-imgu: Set fields before media_entity_pads_init()

Jai Luthra (2):
      media: cadence: csi2rx: add support for RGB formats
      media: ti: j721e-csi2rx: add support for RGB formats

Jonathan Corbet (1):
      staging: media: ipu3: Remove some excess struct member documentation

Julien Massot (3):
      media: cadence: csi2rx: use match fwnode for media link
      media: cadence: csi2rx: add Y8_1X8 format
      media: ti: j721e-csi2rx: add GREY format

Michal Simek (1):
      media: platform: xilinx: Fix Kconfig indentation

Randy Dunlap (2):
      media: media-entity.h: fix Excess kernel-doc description warnings
      media: i2c: ar0521: fix spellos

Sakari Ailus (3):
      media: ipu3-cio2: Further clean up async subdev link creation
      media: v4l2-mc: Add debug prints for v4l2_fwnode_create_links_for_pad()
      media: mc: Drop useless debug print on file handle release

 drivers/media/i2c/alvium-csi2.c                    |  2 +-
 drivers/media/i2c/ar0521.c                         |  6 +++---
 drivers/media/mc/mc-devnode.c                      |  1 -
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           | 22 +++++---------------
 drivers/media/platform/cadence/cdns-csi2rx.c       | 19 ++++++++++++++++-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 24 ++++++++++++++++++++++
 drivers/media/platform/xilinx/Kconfig              |  4 ++--
 drivers/media/v4l2-core/v4l2-mc.c                  | 23 +++++++++++++++++----
 .../staging/media/ipu3/include/uapi/intel-ipu3.h   |  3 ---
 drivers/staging/media/ipu3/ipu3-v4l2.c             | 16 +++++++--------
 include/media/media-entity.h                       |  4 ----
 11 files changed, 80 insertions(+), 44 deletions(-)

-- 
Sakari Ailus

