Return-Path: <linux-media+bounces-4393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 265DF841E45
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 09:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5951C1C2236F
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 08:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1394659153;
	Tue, 30 Jan 2024 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="FC4VFxuU"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0355858231
	for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 08:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706604428; cv=pass; b=EDD4tpY6CnrIRvp2Z+GNAi8Zh8WmByk5Gm+8ZAKSFxE+KxBab5gYgZi2aAoFFJm+OS/cz2PHF3/pRlK1EStmeUizbkxJVRF3kcZPRKKejXofnZndMJQYgNjWhTpvon6xwplGOA3OiQttl5MgoTUPRHQPVipSXa7rEnB0FUXp7x0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706604428; c=relaxed/simple;
	bh=qYlNC7CaNxc7bAe8ATk36wvCgrPrHnxshXgiMRv59FY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iS/14ukzbeLWcphC/YKa4Jv6SrFvEiGUW3xcWnCLr12Q6fAYWXwGOKtx0t7ozZmUQ9fhss4ojCRAL8MU1ogPathR1xuBzDUyD159TNHJPHMWU36uHnEesL3l0rbJ+oVF7gx7+jkHFyCY26faFdMDEyzgGF9eMHLlPXLmNPda5K8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=FC4VFxuU; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TPJgn6XMQz49Q0h
	for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 10:47:01 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1706604422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=bRwnI3LMSxsGHIPyk9U8acN+9XmexQK8A9wLqtVc+OA=;
	b=FC4VFxuU401nUz41YYxBA/+0PAH4VVNDdbp5NSO5sAKz9AIxkTHipRW2BLul7RHsx67QwO
	vqU9b5VhDSvKD5fDpbOaDjQyeOTLmAwbpV2RaWzladNWAZ8kztjtw5JddcVRpdZs4d/wUx
	JtWgvAfifAEJVrMYTpQ+jwPoo+vRrgYK7nKVHfhBcTV0pNkM935Nzr9YuLpPfEhwY985+5
	cgAJFtCYD0Cq4TnGOASruJDn69hSuju94nsaRxb+CXjhbrQJR3jmRhqWFB8bTHD+if0KVx
	STZIE4JKq3gBR62P5ig5rD9OAwoXaLa5GyLoSY8xQiwrNHMduSP6KZPo0C1VOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1706604422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=bRwnI3LMSxsGHIPyk9U8acN+9XmexQK8A9wLqtVc+OA=;
	b=mzHjHWvDQygCXx0Kd2gmuCwtAr9ELfQWDBzlbPWHwiZ6Fy1+Nnn9WsvEhlYjbmeknTyw/0
	/SUwSLXUlnpCK/vQOPyyDLJ/mFHiUC+BlvhuAJuzORNQ8JlhouSeg2KJoE3ehwWYvegMU7
	5YngSXleBuWAmjWFYSe4dhDCIwmuc2Ca728/tmWVrasU12loF3Y9waX3p6fgfcuwXUBaWm
	k79CR73aYGHE+R+KUbt1RbmlrDoqK6Z05GLRWsW+eq5uOYF7aCWgyhrYGudi7yD7+SN02R
	Qw+VtMrERSGfVXXunbtyEY2487iVsSkaxt29xeNjXXsCasC+mDFkwE1PXYtQXg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1706604422; a=rsa-sha256;
	cv=none;
	b=AYLOkhVVMn/KpM0kp3PxOsoTSnuQDSCkMCdDDv8bDj9CSwFCxO11EMoGTFDlRL+1FncwiQ
	4zyCotVZ0nJ0ah+5RvQ2LDQHmoxYuc11l6FK1rTDEo8K3gMjO4q8jP5uhJSRiwgH2HUN0m
	rR+RcrO1VG4i7cn6dyfSw0SIEWaEqwtDu1oP112wZZa3WR6HQmMt3v+flGLXawd1IusnLN
	cLReuPlCFDeLqk4LukL5I75vanvzwZH4XVumLF65fv++Gt6l7ozu7ddIn9AHZr4zyLugbA
	XuMUGVEv4huXAAyeYZIp1FlOs/7C0hzpSEBdSnXickgn/uDuTyTEXXnn7PBkIg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 99CA8634C94
	for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 10:47:01 +0200 (EET)
Date: Tue, 30 Jan 2024 08:47:01 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.9] V4L2 patches
Message-ID: <Zbi3hU4FByA4rmhS@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro, Hans,

Here are a bunch of improvements for sensor and other drivers. Most are
cleanups, more clock configurations are added for imx415 and other
improvements are done for ov08x40 and v4l2-cci.

Please pull.


The following changes since commit c8282f7b8523a4d37e5fefa220d93f2be06650e2:

  Merge tag 'v6.8-rc2' (2024-01-29 08:59:23 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.9-2-signed

for you to fetch changes up to d7cb6098f1d4866ae864cccdbb3fdcea1176a7f6:

  media: ov08x40: Reduce start streaming time (2024-01-30 10:09:41 +0200)

----------------------------------------------------------------
V4L2 patches for 6.9

----------------------------------------------------------------
Alexander Stein (3):
      media: tc358743: register v4l2 async device only after successful setup
      media: i2c: imx415: Convert to new CCI register access helpers
      media: i2c: imx415: Add more clock configurations

Bo Liu (6):
      media: i2c: imx214: convert to use maple tree register cache
      media: i2c: imx274: convert to use maple tree register cache
      media: i2c: mt9v032: convert to use maple tree register cache
      media: i2c: tvp5150: convert to use maple tree register cache
      media: i2c: max2175: convert to use maple tree register cache
      media: i2c: isl7998x: convert to use maple tree register cache

Jason Chen (3):
      media: ov08x40: Avoid sensor probing in D0 state
      media: ov08x40: Modify the tline calculation in different modes
      media: ov08x40: Reduce start streaming time

Julien Massot (2):
      media: i2c: st-vgxy61: Convert to CCI register access helpers
      media: v4l2: cci: print leading 0 on error

Sakari Ailus (5):
      media: Documentation: Rework CCS driver documentation
      media: v4l: Add a helper for setting up link-frequencies control
      media: imx334: Use v4l2_link_freq_to_bitmap helper
      media: imx319: Use v4l2_link_freq_to_bitmap helper
      media: imx355: Use v4l2_link_freq_to_bitmap helper

 .../bindings/media/video-interfaces.yaml           |    2 +-
 Documentation/driver-api/media/drivers/ccs/ccs.rst |   53 +-
 Documentation/userspace-api/media/drivers/ccs.rst  |    6 +-
 arch/arm/boot/dts/ti/omap/omap3-n9.dts             |    2 +-
 drivers/media/i2c/Kconfig                          |    2 +
 drivers/media/i2c/imx214.c                         |    2 +-
 drivers/media/i2c/imx274.c                         |    2 +-
 drivers/media/i2c/imx319.c                         |   53 +-
 drivers/media/i2c/imx334.c                         |   41 +-
 drivers/media/i2c/imx355.c                         |   53 +-
 drivers/media/i2c/imx415.c                         |  672 ++++++----
 drivers/media/i2c/isl7998x.c                       |    2 +-
 drivers/media/i2c/max2175.c                        |    2 +-
 drivers/media/i2c/mt9v032.c                        |    2 +-
 drivers/media/i2c/ov08x40.c                        | 1307 ++------------------
 drivers/media/i2c/st-vgxy61.c                      |  390 +++---
 drivers/media/i2c/tc358743.c                       |    7 +-
 drivers/media/i2c/tvp5150.c                        |    2 +-
 drivers/media/v4l2-core/v4l2-cci.c                 |    4 +-
 drivers/media/v4l2-core/v4l2-common.c              |   47 +
 include/media/v4l2-common.h                        |   25 +
 21 files changed, 849 insertions(+), 1827 deletions(-)

-- 
Sakari Ailus

