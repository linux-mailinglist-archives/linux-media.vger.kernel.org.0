Return-Path: <linux-media+bounces-9663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B36C18A8018
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 11:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1813BB21521
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 09:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84DE13699F;
	Wed, 17 Apr 2024 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="lTBCn3u9"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A0E6A353
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 09:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713347368; cv=pass; b=pu5BKeVUu33KnovOM563lIFsOdU1ufQnPScZfwCK8RsJfyJ5AsxdV39vJPuP7RqEauuGrhqZ7dquimGfdC/JOZvibMCd/8XLuypehW9WGCgsD9a7DSeCNI/wuTjusuIietPM8jqafWvjvWb5wA/AL+Km/cJNxxSBIdkfzacgcCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713347368; c=relaxed/simple;
	bh=hdh6AKRqq87nIj9TMxPjLEahSQr2/yW3FqFURwDN8uU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tf8K5thtRou8SRd5tYGE6GbsLA5sB98bLzo4awydZL6T6VE4UYZnAf1jR9gaFz/uyvkCxnqBfWXXZT0TiBJu0Q6H11/ompKUvOxAzjNE/LQ+yhYmTDCRHXxIz+e+IGgzk0hfDZM4qT22DYxorUPuAgUMbkkP1ZLUH4CIsLKerTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=lTBCn3u9; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VKGMk2v2wz49Q10;
	Wed, 17 Apr 2024 12:49:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1713347362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=CQFMETK4Q5Ez5nXlvuhv42UctbMKSfSZd4ue76Z/JXY=;
	b=lTBCn3u9lQ3koyjoRgwp0Jfx5KzT49nvFdVYCp5YKXu8mHG7yyhHY7VP7WAfzYiGt/4pQ8
	uz+sEiFt0rIGCrvVWQWxsTL3ThCQsh4xaXUlZi976aLUq2hEHY3lFXNOd235wha7EHwyWL
	1gkuBoEgAgGTbveH8KEgu1UK2EkA2f37LYP6aN5i/pw3+H+gtviFe1MAN7hbWV4jQhdq1P
	nrjJt0ng1sdUqXK7It8jHDXDUCZ5z4Hj3P3yQBonA5KBrUvk2CObRaypzV4ZAytvqCYue9
	p6/G5C7+qNqsSX+R2V4cZrR3fiwlDAOTSMHYMx7g/yE22J3C5qqlbaUGaA4FYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1713347362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=CQFMETK4Q5Ez5nXlvuhv42UctbMKSfSZd4ue76Z/JXY=;
	b=vFzxi1UhYNCjtTtYi+uYZanCyBOOpxy3U9ZEFngAlkpbK+rkwhl6BsRiwzpsf+pW6CIw49
	4kks4OWHucDGC9aiD/dhERhjYPFrgsNE00bl5RcCFhtxoHHVQSgpUVJPgDUzJTKwaNBVMq
	UtogHls04zndbMUB7Amvf8YC+EVxvmydfQvz1RQkSMf2DW2JlbgcBHvdyUficmKyve7cfC
	aLZmM9UzBBqYhVi2hgEqCszckyP4hMSkpa/t7SM/XBoOQu/PwJ9NScksmnyG1uvjUbwHoT
	+ozFz9Z4Qz9EUzq6RPJHyt29biTO0OaFhuW2DocM0wjBlKU68xAbbBjLYq88rw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1713347362; a=rsa-sha256;
	cv=none;
	b=CNr3r4eIHF5ZthVUwHzA35f5p2kB//uLCfAFZZV2kYBLs5RB3cXP3vPzEJQL5/I+j9vuz2
	IdOOszFUyhhnC2aD637NOd+CbAEvF9GWMPsdDsw2lSGEzoAbFnGCSXU0N3RcKVCNYZ13Av
	hxe0tnGfFP3TXEOcGRyNirjF58s/yOnWoqfzzNxFm3cy8NzCtLkVmkreOHz7RRT2BfNdZH
	SxcaM1TkeMvwgX+jcgMQyz81OKuPvL/14ssYtpD7N9D1Lu2krAXatmkggDZjo+tW8oXnu8
	CopIPtffFZ9KuCCwO5h2sJFxup2oAh4l8Sba2yRkr2PHyr8K5TG58bRfM7chng==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A08E2634C96;
	Wed, 17 Apr 2024 12:49:21 +0300 (EEST)
Date: Wed, 17 Apr 2024 09:49:21 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR 6.10] Mainly camera sensor patches, but V4L2 and MC
 too
Message-ID: <Zh-bIY-er6cH25tI@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here's a set of mainly camera sensor related patches for 6.10. In
particular, there are ov2680 and hi556 fixes form Hans and Fabio, your own
MC patch, fixes for imx335 from Kieran and Umang, DT fixes from Alexander
Stein and one Cadence csi2rx fix from Pratyush and finally my random series
of framework and ipu3-imgu driver fixes.

Please pull.


The following changes since commit 836e2548524d2dfcb5acaf3be78f203b6b4bde6f:

  media: usb: siano: Fix allocation of urbs (2024-04-16 00:02:53 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.10-2-signed

for you to fetch changes up to eba1e47919b66797eb2479b7a7e39df0473003ce:

  media: hi556: Add support for avdd regulator (2024-04-17 10:58:10 +0300)

----------------------------------------------------------------
V4L2 patches for 6.10

----------------------------------------------------------------
Alexander Stein (2):
      media: dt-bindings: sony,imx290: Allow props from video-interface-devices
      media: dt-bindings: i2c: use absolute path to other schema

Fabio Estevam (1):
      media: ov2680: Do not fail if data-lanes property is absent

Hans Verkuil (1):
      media: mc: mark the media devnode as registered from the, start

Hans de Goede (9):
      media: ov2680: Stop sending more data then requested
      media: ov2680: Drop hts, vts ov2680_mode struct members
      media: ov2680: Add vblank control
      media: ov2680: Add hblank control
      media: ov2680: Add camera orientation and sensor rotation controls
      media: hi556: Return -EPROBE_DEFER if no endpoint is found
      media: hi556: Add support for reset GPIO
      media: hi556: Add support for external clock
      media: hi556: Add support for avdd regulator

Jai Luthra (1):
      media: ti: j721e-csi2rx: Fix races while restarting DMA

Kieran Bingham (2):
      media: imx335: Support 2 or 4 lane operation modes
      media: imx335: Parse fwnode properties

Pratyush Yadav (1):
      media: cadence: csi2rx: configure DPHY before starting source stream

Sakari Ailus (4):
      media: v4l: Don't turn on privacy LED if streamon fails
      media: staging: ipu3-imgu: Update firmware path
      media: v4l2-ctrls: Return handler error in creating new fwnode properties
      media: v4l: Guarantee non-NULL return from v4l2_find_nearest_size()

Umang Jain (4):
      media: imx335: Use V4L2 CCI for accessing sensor registers
      media: imx335: Use integer values for size registers
      media: imx335: Fix active area height discrepency
      media: imx335: Limit analogue gain value

 .../bindings/media/i2c/galaxycore,gc0308.yaml      |   2 +-
 .../bindings/media/i2c/galaxycore,gc2145.yaml      |   2 +-
 .../devicetree/bindings/media/i2c/sony,imx214.yaml |   2 +-
 .../devicetree/bindings/media/i2c/sony,imx290.yaml |   5 +-
 .../devicetree/bindings/media/i2c/sony,imx415.yaml |   2 +-
 drivers/media/i2c/Kconfig                          |   1 +
 drivers/media/i2c/hi556.c                          | 105 +++-
 drivers/media/i2c/imx335.c                         | 636 ++++++++++-----------
 drivers/media/i2c/ov2680.c                         |  97 +++-
 drivers/media/mc/mc-devnode.c                      |   5 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |  26 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |   5 +-
 drivers/media/v4l2-core/v4l2-common.c              |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |   3 +
 drivers/media/v4l2-core/v4l2-subdev.c              |  22 +-
 drivers/staging/media/ipu3/ipu3-css-fw.c           |   4 +-
 drivers/staging/media/ipu3/ipu3-css-fw.h           |   2 +
 17 files changed, 515 insertions(+), 406 deletions(-)

-- 
Kind regards,

Sakari Ailus

