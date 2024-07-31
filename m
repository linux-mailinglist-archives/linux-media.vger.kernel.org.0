Return-Path: <linux-media+bounces-15656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C12E94347E
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 18:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA0B11F26A26
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 16:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5188F1BE255;
	Wed, 31 Jul 2024 16:53:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC88D1BD515;
	Wed, 31 Jul 2024 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722444791; cv=none; b=oHoxlnHj1RdRIPyhF4cm8kSMXW9OhLeF8dETNbCQ93JcgZVbV1b2Kuqmqr7V0p1sNwL9IU7JXmkRRx/43gt38rgt7vMX4qRXALZLPGN9Dy58O7WMPuMHs/V4SNTwAM2W59bBbTYROLmrnfDK7cDepC/BsyQOLocztpXu1D/OUSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722444791; c=relaxed/simple;
	bh=c8ptxbLdxQ5/F2reX0rnqqAZCIKgf2WjwASUQ5secZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M1az/60/rXn6u0ZOhNoYyW1QGMv4hIh6GTHO7Nm+WTYmc0mCkRTCC08s5tK4r7l6TFTe8DJneEIvBD6PbdBv8gjFQcbbZhCh9ZowVyt6UQsPqFWy0IKv1JmmYMzEXSYU6s0LS4t6mg2WwfV+pBxR2LcOeglTXwhJhkKXADee8h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id CB91714649D5; Wed, 31 Jul 2024 18:44:26 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: linux-sunxi@lists.linux.dev
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] media: cedrus: Add a JPEG decoder
Date: Wed, 31 Jul 2024 18:44:10 +0200
Message-ID: <20240731164422.206503-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Video Engine present on all (?) AllWinner SoCs includes a JPEG
decoder, which shares the same engine as the MPEG2 decoder.  I mostly
used the linux-sunxi resources on the engine[0], as well as some
reverse-engineered userland using the legacy /dev/cedar_dev API[1].

I wrote the Onix library[2] to exercise this driver.  With it, I have
tested this series on the A10, A20 and A64, as found in Olimex Lime,
Lime 2 and PinePhone respectively, so further testing on other SoCs
would be very welcome.

On the A10 and A20, since only the tiled ST12 format is supported, the
file dump binary is a bit unusable, but I have tested displaying to DRM
and to Wayland just fine on these SoCs.

They also only support downscaling from 4:4:4 to 4:2:2, unlike newer
SoCs which support downscaling from either 4:4:4 or 4:2:2 to 4:2:2 or
4:2:0.  This prompts the issue of which formats to advertise: currently
I chose to only expose NV12, but ideally NV16 would be exposed when the
user tries to decode a 4:2:2 or 4:4:4 image.  By the time the user has
called ENUM_FMTS on the capture queue, the driver doesn’t know the
subsampling in the JPEG file, so it can’t expose only the supported
formats.  A possible solution could be to add a new v4l2_ext_ctrl
describing the JPEG, but this is a new uAPI which should get discussed
outside of this driver.

[0] https://linux-sunxi.org/VE_Register_guide
[1] https://github.com/jemk/cedrus
[2] https://linkmauve.fr/dev/onix/

Emmanuel Gil Peyrot (1):
  media: cedrus: Add JPEG decoder

Jernej Skrabec (3):
  media: cedrus: Setup secondary output formats
  media: cedrus: Enable JPEG decoding in various variants
  media: cedrus: Don't require requests for all codecs

 drivers/staging/media/sunxi/cedrus/Kconfig    |   1 +
 drivers/staging/media/sunxi/cedrus/Makefile   |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  10 +
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   5 +
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  14 +-
 .../staging/media/sunxi/cedrus/cedrus_jpeg.c  | 352 ++++++++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  25 +-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  11 +-
 8 files changed, 413 insertions(+), 7 deletions(-)
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_jpeg.c

-- 
2.45.2


