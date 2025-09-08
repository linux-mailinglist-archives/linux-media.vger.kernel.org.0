Return-Path: <linux-media+bounces-41957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB97B484DD
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 09:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A4C8189C3D2
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 07:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E46E291C07;
	Mon,  8 Sep 2025 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="KZ0jciLR"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AD513B2A4
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 07:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757315765; cv=pass; b=r3odxrM1wr5P/wdto3FmH0fhQyiGJu9j9zAWMo8DlyVaKHA/erPUswYUyLLaE/oj0q2SRrXZ9sIx3N5VNbN0CZIav2KmqdmqQh2fz/nD7/XsBvHYJWPnSH2TXAfv8Mw/57K4bguaxl6QtkpHJUfOL0ZNPidkBGU3tH/nSyMA/k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757315765; c=relaxed/simple;
	bh=5JZUBj3q5rBRayK0D8KeUW3at0sgbhUliI3nWdxpIMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y/ElwEKlxZ356MDyhVTbn2w/2tiz2CryUMZxzEGy72q/TgOZQrYDTXdlxohkJcI4ZO9R+1apBweiHojxgwWb0d17ufSgVjEoEPSbWis+mIPQ7gs1VOkPTWMPm0QrpWDVsmOkXktX129c3r8hFZZJkwVvHfOoYbyy4QtktltVRH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=KZ0jciLR; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4cKykj0Snlz49Pv9;
	Mon,  8 Sep 2025 10:09:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1757315389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=iZQyeysbcPD0JVGrRtfINTf2tneN34a4pBnJu+EFNtU=;
	b=KZ0jciLRBi8se7sH/e64XlPHPD6ao0ff9AaUmC4F4EXSFIXdfXbRk4jb7lGnZw3xbLewei
	otFFBDTl7wbIe14Dn5zbRihYivqs2sS4/LlJz8sPKVVNZ0TehhJIMd9QjbQMnmluYaTs/A
	UvMhm0dq8eoElatUZCDvgr82i3Hu6g4TvpGH0fdQq3xVd22tQnMjka81RQkPMbAuhomgun
	5vqxG6mC3q4pbfuziTSBPu02TM4WTU6j1N3o8rh1fo8BdI1qfzAKZf/Brp4bKV0+FpqHAh
	i1WcPIVu4xla9aVFvH6MKr06ZpnnV64kmBT2/tURhi2KFM6tNQ5L96gDJNY1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1757315389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=iZQyeysbcPD0JVGrRtfINTf2tneN34a4pBnJu+EFNtU=;
	b=gCeGrSkOdvrsE0wLE9/mp1U/gb022/6MpbWPXiK2paoa9HWkeEeWXNvy78f/zyJCO0aK/+
	26Wk+1qylykDJrSs5OgbK3DkYyL7jfFZfQnkmUwaD3MM9VJDs2PMsKqsp7lVgyMH0/PQt+
	g4YZxAdpIpEglrpDvLtspujk8S/BWjUsBRyQkHnmMOFsAZKDdBoNqOj2V/k12itOIg0WUh
	1UqD8ocLLi8iQPG+652Nc3zgACbUEgE37YyHWGSdvkRNz9N9BfBb4+9iS8SEwedCshaJmd
	JJMQvHz2c1GQfc03Fbjjq9GH+4MthiPctMONJYxVfYvobxMp6K0MvqqhMS62bw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1757315389; a=rsa-sha256;
	cv=none;
	b=k4rV8zPLJvFFmaTwJWWQWyzGowswBnmTJ0Aeh305Zs7UgITgq/1EC8M2XDbUSbd3Yye4zU
	h0IJ6az0yrhTSmkx/iB07H9MrkDFQ+eAMf5iYyRMrt3ltvBqbKgeXkh0Vl+zojLXCTqSMI
	R9rgiqL/yxyjHlbYrZEdXJ9f9qTyKGkblNmF5cXwYpwiLygXnXaX71J/TdX9Z2Cv1//bPU
	v04/GaiJ1wHbi1Tn72YhNOV6UZ2ywlr3q/DwZnJngDfktqhxp0r3+hL0W1tw7ZzZH0vWBj
	nkm4mtWhShUMT7h1JVWIe2iTxTWFoVlAX27FU/Y2oAQJdePXfWWCwKF0xIHrVg==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9BD65634C93;
	Mon,  8 Sep 2025 10:09:48 +0300 (EEST)
Date: Mon, 8 Sep 2025 10:09:48 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.18] Fixes and cleanups
Message-ID: <aL6BPPCTVIIsAQje@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit 04f08db52b3f892c85bd92ebbc3a7ca32e4f60f3:

  media: i2c: tc358743: add support for more infoframe types (2025-09-07 10:29:19 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.18-3.2-signed

for you to fetch changes up to e9fc898cd700db03138475b0970d51e450b9f927:

  media: ov08x40: Fix the horizontal flip control (2025-09-08 10:00:56 +0300)

----------------------------------------------------------------
V4L2 patches for 6.18

- MC minor number reservation at unregister time
- IPU7 staging driver cleanup
- Mbus code initialisation fix for mt9p031
- Cleanups for ov8865, mt9v111, rpi-cfe, st32-dcmi
- UAPI fixes for ov08x40 and og01a1b drivers
- Error handling fix for j721e-csi2rx driver

----------------------------------------------------------------
Allen Ballway (1):
      media: ov8865: move mode_configure out of state_configure

Dan Carpenter (1):
      media: ti: j721e-csi2rx: Fix NULL vs IS_ERR() bug in ti_csi2rx_request_max_ppc()

Hans Verkuil (1):
      media: i2c: mt9p031: fix mbus code initialization

Hao Yao (1):
      media: ov08x40: Fix the horizontal flip control

Qianfeng Rong (3):
      media: i2c: mt9v111: fix incorrect type for ret
      media: raspberrypi: use int type to store negative error codes
      media: stm32-dcmi: use int type to store negative error codes

Sakari Ailus (3):
      media: mc: Clear minor number reservation at unregistration time
      media: staging: ipu7: Don't include linux/version.h
      media: ov02e10: Remove Jingjing's e-mail address

Vladimir Zapolskiy (1):
      media: i2c: og01a1b: Specify monochrome media bus format instead of Bayer

 drivers/media/i2c/mt9p031.c                           |  4 +++-
 drivers/media/i2c/mt9v111.c                           |  2 +-
 drivers/media/i2c/og01a1b.c                           |  6 +++---
 drivers/media/i2c/ov02e10.c                           |  2 +-
 drivers/media/i2c/ov08x40.c                           |  2 +-
 drivers/media/i2c/ov8865.c                            | 14 +++-----------
 drivers/media/mc/mc-devnode.c                         |  9 ++++-----
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c     |  2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c          |  4 ++--
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c |  2 +-
 drivers/staging/media/ipu7/ipu7.c                     |  1 -
 11 files changed, 20 insertions(+), 28 deletions(-)

Please pull.

-- 
Kind regards,

Sakari Ailus

