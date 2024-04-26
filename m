Return-Path: <linux-media+bounces-10190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEFE8B3378
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD1B9281F61
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB8B13D265;
	Fri, 26 Apr 2024 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="OjDBZBfE"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1D4D512
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121965; cv=pass; b=FGHc9cnbx8IfD4fnHuXaXQfOXLRy1WwG8PAKknhh+7YB1Cjww1WlYMzrzNZj4YeQVec9dRvwut46UbMf77EjIUBob9t5/rDMInk5tfCnK3Qkn2FPexCsM9Dp3MorYrzsnPmmuWYzux17xj8C0gCIUr3b+R9vEx3sF4wjxPb6vu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121965; c=relaxed/simple;
	bh=xJKBcLSagnVDZrcZptu2neFLOJ/LfJ1VBS5tZQqNVyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ee7DcRNO2rYJ1Y2/Jl5xqu6iEZOF2SvSb/fZjsZfRtyKu1zYzX4wGwNnpNAnd4Ngs9vZ9AASE9KwNp8Jjcl680pIu89m3mPu17fq8tusMT4vBmvl6u22R3zLIPvXhymVqKPqS5WLcyurBZzcxRURsWlcx663/jTEXci+IL0+KU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=OjDBZBfE; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VQmqq2FKkz49Pyk;
	Fri, 26 Apr 2024 11:59:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1714121959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=FAZNEY3uYMLqeIrqKof5WqlpGNGwQyt83GILNJqM4YQ=;
	b=OjDBZBfEkkS50xROAZGFhCodpq6Zv6k21/5Q+AohGuUD6ibsIjXHopizgjKuGHsb1UGGDG
	fEUcfxd1AErMR5yZAchzrvYX4Nnjd8TO+3R48DkYGenHVrVdZxQ6iim+rI9xu4LC9dij08
	bxzo3x4g07f+x1ruyxIsqog+EKoNfuB0IPsJyb5ksa96E1neUPD6lpFaNIPAjSZ+4xtNtF
	Oy64ig3hYtrWpK6dWFwDyPzm70D0l1H9ZK60sPkYUqevj9bvfIsXE6PxjrVCUDxi8I/dFB
	z6t2LaJfkwC3D75yrsKlp3RmJC9jC2oL9Y4UbB7d9NhgGKa+nOl2Y2VbH0L/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1714121959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=FAZNEY3uYMLqeIrqKof5WqlpGNGwQyt83GILNJqM4YQ=;
	b=QDALVX1Aft6tOU0eN9S2C9Cdwinau+l1+I7CyrW6xrGVlojaC+9Zivf0riS3FnVcl2c5+Z
	9dXO/i1r1cHkT9CEol9Lw3c/BCiCIr4Tc4uGKSo91YJwP38ppnSCXkUHQ9Ge2dq1q4QvcI
	DWVIB7NreQXekbAE5rdKRmMp5r39VLo5elYh6LqKTNxW9RtvFVusn3fB0W8D8V6XZ3cNBW
	JV74rYK0QHDD94/zi2ps7hU52hBPSGw2Uctkz0zybKSSALYCoqoDKVgKJvqQGXybF2N5ul
	X4De92PezligaV1DflKWVs1q/NDGR5UULmon+Gk0YKlg8tv82hYm+ANLFwy/3g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1714121959; a=rsa-sha256;
	cv=none;
	b=e4q7ehucXAgRQfkHDzG1/RCbktUmScKE8NyV5FpvG0ky9Mqnwd3fEJkz5WeBhw2JWRtWcN
	MlvzzkhghHWsD2S3sZ/bmqhygrzXVzRYSR7Pf6hguF6y3EimwLMvsFJozvBCeqXOwoaakf
	GcsAXQmsw8PwRgg7u0tDvQYpfezC4tdVEBdKfH/4nzgU+8OQolTuHynDdq0BQq0j4uQHHY
	ZGBVBxWAHGvfWPnBXBv1QnB2ZnHWlW60rKfX0G3ia8pJ+kBGQ3Ds2wefSQe5B5lyI9xYwf
	6+J34X7Gc01S255iAAgJG5KJnbjWzvjtZQTOYEP39MTyrGBChzoQAA0dTMHknw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id DE60F634C97;
	Fri, 26 Apr 2024 11:59:18 +0300 (EEST)
Date: Fri, 26 Apr 2024 08:59:18 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL v2 FOR 6.10] Ov4689 sensor patches, IVSC fixes and V4L2
 async improvements
Message-ID: <Zits5p3ADjyC8g3l@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are a bunch of patches for the ov4689 and imx219 sensor drivers, as
well as link frequency control improvements for the IVSC driver as well as
moving some of the work from drivers to v4l2-async.

since v1:

- Fixed sensor_gain uninitialised value compiler warning.

- Left out IVSC and LINK_FREQ patches for now.

Please pull.


The following changes since commit faa4364bef2ec0060de381ff028d1d836600a381:

  media: stk1160: fix bounds checking in stk1160_copy_video() (2024-04-24 13:49:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.10-3.1-signed

for you to fetch changes up to 6612d1ae37b52d37d1d515d7c5110b9f3afe94d2:

  media: v4l: async: Set owner for async sub-devices (2024-04-26 11:56:26 +0300)

----------------------------------------------------------------
V4L2 patches for 6.10

----------------------------------------------------------------
Mikhail Rudenko (16):
      media: i2c: ov4689: Clean up and annotate the register table
      media: i2c: ov4689: Sort register definitions by address
      media: i2c: ov4689: Fix typo in a comment
      media: i2c: ov4689: CCI conversion
      media: i2c: ov4689: Remove i2c_client from ov4689 struct
      media: i2c: ov4689: Refactor ov4689_set_ctrl
      media: i2c: ov4689: Use sub-device active state
      media: i2c: ov4689: Enable runtime PM before registering sub-device
      media: i2c: ov4689: Use runtime PM autosuspend
      media: i2c: ov4689: Remove max_fps field from struct ov4689_mode
      media: i2c: ov4689: Make horizontal blanking configurable
      media: i2c: ov4689: Implement vflip/hflip controls
      media: i2c: ov4689: Implement digital gain control
      media: i2c: ov4689: Implement manual color balance controls
      media: i2c: ov4689: Move pixel array size out of struct ov4689_mode
      media: i2c: ov4689: Set timing registers programmatically

Sakari Ailus (2):
      media: v4l: Set sub-device's owner field to the caller's module
      media: v4l: async: Set owner for async sub-devices

Umang Jain (1):
      media: i2c: imx219: Use dev_err_probe on probe

 drivers/media/i2c/Kconfig             |   1 +
 drivers/media/i2c/imx219.c            |  77 ++--
 drivers/media/i2c/ov4689.c            | 673 ++++++++++++++++++----------------
 drivers/media/v4l2-core/v4l2-async.c  |  10 +-
 drivers/media/v4l2-core/v4l2-device.c |  12 +-
 drivers/media/v4l2-core/v4l2-i2c.c    |   2 +-
 drivers/media/v4l2-core/v4l2-spi.c    |   2 +-
 include/media/v4l2-async.h            |   4 +-
 include/media/v4l2-device.h           |   7 +-
 9 files changed, 419 insertions(+), 369 deletions(-)

-- 
Sakari Ailus

