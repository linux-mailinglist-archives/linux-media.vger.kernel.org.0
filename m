Return-Path: <linux-media+bounces-5772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D75FC8610E9
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 13:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62A6A1F2598B
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 12:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B8B7CF27;
	Fri, 23 Feb 2024 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="YMi2jd9/"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ABE7C092
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708689606; cv=pass; b=XCzcF0DCmhpw6sbMJswkXaeX5JQcw5Nl9agAYmzc78QNFq9ofwaawiCLQrYwRIZt8aGc8KQldiXnHaHR2IHAf0Fge5UjwrSVDGEg6hI2ldVhajmqjh479AVyBBSKBTGFqZV1D000hZYPkZ3QcCxF6IOAG8fIdfZozRwyroxg6RE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708689606; c=relaxed/simple;
	bh=pdYIOeLSzcI70UCa6ldWMWxs8N9adbcvJ/l9pVw8Iq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Of/PYvC4A5QsW7scRaWx1vnSA8BiLLziUCx0wfwiXaBQ6szh3I9IeylSG39fBJyhfCRDfYfm9FciDsDXcXLw/OP2XixCq8MlUcyftTTsAXIDVsw/C7Fla1/hHjXXg3cHRuXse8YU6SkkaZ2zEkayBMVPaldVSgNqVZcuftEpXHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=YMi2jd9/; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Th7q322ZQz49Psw;
	Fri, 23 Feb 2024 13:59:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1708689583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=y/jy6qdqLkb9HP+1jHo9w815BgtLDuhKrAVZSH6wMVY=;
	b=YMi2jd9/hCMMwlscQE1YxaZvt50ii/aKBevgaYXOsdVcFEdK+X1vCT3+sgKYDxs2BU9zPu
	cFjgOOX+GWzN2iFTitFhhgKJpwRxQbkN+7R3COUkMzJXh+hMDIZ998zlAfJ/jvIn2SjgPP
	luz1Kzlh3jSjNxypXQ3hc1cY0QqoSCt4YTQIuzaSlXnP/+A0Y0+diCO2MXyp8Vr/WMwrie
	31ulqI24aRhLcQae35lP+JAVVWaTFeWFZsEBddbLJm/FcYF816KtEnPzQsERelCCJXJdev
	u+DB4X+o+l7bL7TAP4/c3b3ZuM5ekL5mVpk65pmsSpgRTjz92NobpjxM4EM5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1708689583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=y/jy6qdqLkb9HP+1jHo9w815BgtLDuhKrAVZSH6wMVY=;
	b=aBgacI8KuVYkentU3ih4b8pJL4fz8TpiSmpkm6OGNGevFt7ZYQJ5jFiXmbQg7HF3cSM0Qu
	M73FJW5NEWoXURpaFqDODoReEUf+hR7ISjf8Bc/L/V4ZoiRT+pZZauTVSP4sFJCPpSao4e
	vsBMpKS3DEH8klcZmVJIMJtavz3lrC/856wWhKsCL1JWwuDCD5tbx4R7EElRUYL+GEmTXS
	ACSIv/2VU0R4rXE/POWCaqcIfLneBQK3hCoo9RqcAhKpexhaQplkMkefiLdU/58iY/i197
	lQHeTldo6TSVZj2Q3S66KFa0cuFmOVoJ7P34YhabBVzfYmJOWoQD6mwF6Nm7Tg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1708689583; a=rsa-sha256;
	cv=none;
	b=Xevyo3n/GRWA2G/LMk4x3BllogDjEwttX0D8DPAiPr5xob4hPNz+PCKPYVxhcr/9yl/Hpo
	bGHAM71Iq89WUr8L6XMe1ugMYxms1DOyu8KdFbqvOEuoNGFLJ/FRf2yqb+Y7rnZdjno2Rp
	mf9g2iqy3yfe/e0q/MgNUTGHOtX9l2vboCN7P0IHz+xFfur23EklMuIBgOgB5uteJxCtK+
	POaTq1aKP8A5bN2yLKB/251UKRFYy7mGMk7V/YLsLQx6UeGe9yJHfA3nK5ClPs96lkxRHA
	WcQnLW+9XSInGhZCJo4fgpASOSdlYPWvkOEE4RBJT00xX7CxVv/UXuv5qyJTvQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id F374E634C93;
	Fri, 23 Feb 2024 13:59:42 +0200 (EET)
Date: Fri, 23 Feb 2024 11:59:42 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.9] V4L2 patches
Message-ID: <ZdiIrrJ6s2wJc83X@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here's again a bunch of V4L2 patches, mostly camera sensor, for 6.9. Apart
from that, there are IPU bridge improvements and MEI CSI fixes as well as a
dw9714 fix and OF graph API usage improvements my Morimoto-san.

Please pull.


The following changes since commit 8c64f4cdf4e6cc5682c52523713af8c39c94e6d5:

  media: edia: dvbdev: fix a use-after-free (2024-02-07 06:06:03 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.9-4-signed

for you to fetch changes up to eff11b9051f5693e75901fdab59200c476c9b4f9:

  media: i2c: imx290: Fix IMX920 typo (2024-02-21 14:03:32 +0200)

----------------------------------------------------------------
V4L2 patches for 6.9

----------------------------------------------------------------
Alexander Stein (1):
      media: i2c: imx290: Fix IMX920 typo

Biju Das (1):
      media: i2c: ov5645: Remove software reset entry from ov5645_global_init_setting

Kuninori Morimoto (2):
      media: i2c: replace of_graph_get_next_endpoint()
      media: platform: replace of_graph_get_next_endpoint()

Matthias Fend (1):
      media: imx335: Add support for test pattern generator

Ondrej Jirman (1):
      media: i2c: dw9714: Fix occasional probe errors

Sakari Ailus (5):
      media: ipu-bridge: Add ov01a10 in Dell XPS 9315
      media: ipu-bridge: Move graph checking to IPU bridge
      media: ipu-bridge: Serialise calls to IPU bridge init
      media: ivsc: csi: Swap SINK and SOURCE pads
      media: ivsc: csi: Make use of sub-device state

Tommaso Merciai (5):
      media: i2c: alvium: removal of dft_fr, min_fr and max_fr
      media: i2c: alvium: remove the fr field of the alvium_dev structure
      media: i2c: alvium: inline set_frame_interval into s_frame_interval
      media: i2c: alvium: store frame interval in subdev state
      media: i2c: alvium: fix req_fr check in alvium_s_frame_interval()

Umang Jain (4):
      media: imx335: Set reserved register to default value
      media: imx335: Use v4l2_link_freq_to_bitmap helper
      media: imx335: Support multiple link frequency
      media: imx335: Refactor power sequence to set controls

 drivers/media/i2c/adv7343.c                        |   2 +-
 drivers/media/i2c/adv7604.c                        |   4 +-
 drivers/media/i2c/alvium-csi2.c                    |  99 +++-----
 drivers/media/i2c/alvium-csi2.h                    |   5 -
 drivers/media/i2c/dw9714.c                         |   2 +
 drivers/media/i2c/imx290.c                         |  16 +-
 drivers/media/i2c/imx335.c                         | 251 +++++++++++++++++----
 drivers/media/i2c/mt9p031.c                        |   2 +-
 drivers/media/i2c/mt9v032.c                        |   2 +-
 drivers/media/i2c/ov2659.c                         |   2 +-
 drivers/media/i2c/ov5645.c                         |   7 +-
 drivers/media/i2c/ov5647.c                         |   2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c           |   2 +-
 drivers/media/i2c/s5k5baf.c                        |   2 +-
 drivers/media/i2c/tc358743.c                       |   2 +-
 drivers/media/i2c/tda1997x.c                       |   2 +-
 drivers/media/i2c/tvp514x.c                        |   2 +-
 drivers/media/i2c/tvp7002.c                        |   2 +-
 drivers/media/pci/intel/ipu-bridge.c               |  26 +++
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |  31 +--
 drivers/media/pci/intel/ivsc/mei_csi.c             |  87 ++-----
 drivers/media/platform/atmel/atmel-isi.c           |   4 +-
 drivers/media/platform/intel/pxa_camera.c          |   2 +-
 .../media/platform/samsung/exynos4-is/fimc-is.c    |   2 +-
 .../media/platform/samsung/exynos4-is/mipi-csis.c  |   3 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |   4 +-
 drivers/media/platform/ti/davinci/vpif.c           |   3 +-
 27 files changed, 314 insertions(+), 254 deletions(-)

-- 
Sakari Ailus

