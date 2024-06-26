Return-Path: <linux-media+bounces-14165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEF8917C57
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 11:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46788B23EE3
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 09:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134451662E3;
	Wed, 26 Jun 2024 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mGmrSW3W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D2F33DD
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719393684; cv=none; b=l3KWKDlpnL5MKxW4bj7z8qGzY5KKzkf0JBAWFuyU690FYj8jJzZhfA9AHUN25IZacPyAlPWB8esOOQtCZm1I7Vhu2KiIjDIbJn95nKDFgwZ2kTyj/QEy5DvL1mAaZ1hmOn+M7KfHSlRLKY77GDkTVaQsH3KOobtsdNoUsbInlSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719393684; c=relaxed/simple;
	bh=4F9OYablBOy5IZGvyz539yYbffK4XmrSg3++cPRfzlI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s73DS+af6rNJxqgAgiK4OSQnabPhuJ0fsGjwRZEVeBRIqVl2IFSAtlHOiRO+z8I24NKp35eLD/49mcmlF/Bga2psL1rESHhk7MLEpaMpGv4qHr08viLm984/1Z1f42lR9DVMLFb1+0yOuz3OCoSt3hzbcle8YqjikCXs3ToKy2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mGmrSW3W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF1E273E
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 11:20:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719393657;
	bh=4F9OYablBOy5IZGvyz539yYbffK4XmrSg3++cPRfzlI=;
	h=Date:From:To:Subject:From;
	b=mGmrSW3WaKCd3/S/t+ZR+adLo6CgWiigFrF3/Jbgsn6FZOQQ+e3YNJaCWtoEVT7Dt
	 ovQWfV7vZbuF81BYjjvnlWTDpVbwVobA/YQfDD+DP4WP9kybvJEnSsifYqkPYcjrd5
	 Uity3rhuQ4sd718JvGPaQT+ufO6+gMgWqfofA2DA=
Date: Wed, 26 Jun 2024 12:20:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Subject: [GIT PULL FOR v6.11] Miscellaneous fixes
Message-ID: <20240626092059.GB8704@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit bf9817d2ed3a499d4ec1a5125fb700185b2f2499:

  MAINTAINERS: delete email for Anton Sviridenko (2024-06-24 16:47:34 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/next-media-20240626

for you to fetch changes up to a047b66c0f05c668b4a6d41a3cacfe707efc9ecb:

  media: v4l: subdev: Fix typo in documentation (2024-06-26 09:14:03 +0300)

----------------------------------------------------------------
Miscellaneous fixes for V4L2 core and drivers

----------------------------------------------------------------
Harshit Mogalapalli (1):
      media: imx-pxp: Fix ERR_PTR dereference in pxp_probe()

Kory Maincent (1):
      media: i2c: Kconfig: Fix missing firmware upload config select

Laurent Pinchart (1):
      media: v4l: subdev: Fix typo in documentation

 drivers/media/i2c/Kconfig            | 1 +
 drivers/media/platform/nxp/imx-pxp.c | 3 +++
 include/media/v4l2-subdev.h          | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

