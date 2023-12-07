Return-Path: <linux-media+bounces-1841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B8E8088F1
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 14:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA39F282931
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C9D3FB04;
	Thu,  7 Dec 2023 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="hwuG8Qfa"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53AC510CC
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 05:16:03 -0800 (PST)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4SmFC530j8z49Q2v
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 15:16:01 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1701954961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=q64QuK/yJjk+V9o8L/91PT5HlmtRV/WuGbohXKa1WvU=;
	b=hwuG8QfafBp8wKotJj7fGUA5D2TrU/ZFyAwScWlp0Fuo1e1dI7HkfPg7LbefSH+KQOOwFJ
	Cn67OrgGUKRunt1CJqbdImDnpjZE67YjT/RxFc/eNhowIQcuGLqUd07hPOeIMARbyJA2oo
	/qH0FBaT86QgFQkXPkt0itkK/n1agJIfxsRGdxI8VVop8vzJP+TyBcghCEcRNYbdrO5vNz
	cAcGHcRCHqkVvo0rNSpopFS/PaJ+tmr/9ZlnzKH4SiXtgg+MrDJhsLo8V5SGuPSlmINgkk
	93OgQsOcxezfchYoE2vnQPX30qZyPQAfb393RgEjhU8RoWltREGUEsFH0PQReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1701954961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=q64QuK/yJjk+V9o8L/91PT5HlmtRV/WuGbohXKa1WvU=;
	b=HToHcDTOoVlhmXBiRgD3w0LGFLvyICfAVYCi7mO4xpHLSfj7NJ5T+b8VeexHGWtPHNAStJ
	6m5lsB34hiAdIq0JxvoAMfMouc+pl+jcqJPVWIOzIUlGkyr0Kr9C0W7u78fGWSt3R7aRp1
	ZS6NhSDlYiIMlZoPI193wjGop3ryuE/yjxLhrlbyXAkpJWDFt4rfoXAvWKW7xoxtXbEoSg
	TYFuK3Ld//ahPKj4Q+IMTvNqeDB1uNB3IYIdIBneGxL+woA/B6xjJGNFx1vZEq6KEuLKUH
	7uuzPZklxHQL83N1Sx8ajmsNaq82l2ERGHWYUgsIPFMm6JnMyL+LX4XCt8ftRg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1701954961; a=rsa-sha256;
	cv=none;
	b=D6Zx1QXFPFdoupPyPtu8Qb+gfUKMpad9SU0wVPi8hIdcEHinDo9o7CCuvkzZofr6HUChPh
	LROlwroKqVvHrnKVAjZXwtUyCtUWmzav6NP3T6SkKZz2tanP9RR+iP/d46AMc4UJVclHft
	nuukGzIzAXD2tgt4DXlPhVEHsQoqNC9ydJQVeVvVz8hWLx5HDnSQ3inn6OPd5vf4YFlDqo
	JwN5EFg35NJ3kd4gSq1Cjrr61uCHsRbXsO6XUKQxIp1F3X2yc0UaH0dSyqOipu3EkGktzj
	w9KtCONDviOHDU0waNMro/oNe54g5VL8jHNUF5EQCCs5+JaBaY748gXUtvG24g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 08575634C8F
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 15:16:00 +0200 (EET)
Date: Thu, 7 Dec 2023 13:16:00 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.8] Fixes for recent patches
Message-ID: <ZXHFkMbQ1Kja6kSX@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are a few (compile) fixes to recently merged patches.

Please pull.


The following changes since commit bec3db03911bd85da29c1c8ee556162153002c9a:

  media: v4l: async: Drop useless list move operation (2023-12-04 11:21:47 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.8-6-signed

for you to fetch changes up to 04859a240c56886de9636859e13e8a39122c5f4f:

  media: ov9640: Don't set format in sub-device state (2023-12-07 15:11:53 +0200)

----------------------------------------------------------------
V4L2 patches for 6.8

----------------------------------------------------------------
Sakari Ailus (7):
      media: ccs: Select V4L2_CCI_I2C
      media: saa6752hs: Don't set format in sub-device state
      media: adv7183: Don't set format in sub-device state
      media: mt9t112: Don't set format in sub-device state
      media: rj54n1cb0c: Don't set format in sub-device state
      media: tw9910: Don't set format in sub-device state
      media: ov9640: Don't set format in sub-device state

 drivers/media/i2c/adv7183.c    | 2 --
 drivers/media/i2c/ccs/Kconfig  | 1 +
 drivers/media/i2c/mt9t112.c    | 1 -
 drivers/media/i2c/ov9640.c     | 2 --
 drivers/media/i2c/rj54n1cb0c.c | 4 +---
 drivers/media/i2c/saa6752hs.c  | 4 +---
 drivers/media/i2c/tw9910.c     | 2 --
 7 files changed, 3 insertions(+), 13 deletions(-)

-- 
Sakari Ailus

