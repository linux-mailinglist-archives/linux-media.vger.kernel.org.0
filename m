Return-Path: <linux-media+bounces-1271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D39BC7FB9BE
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 12:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1105C1C213B2
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C2E4F8A6;
	Tue, 28 Nov 2023 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="DctHNk4k"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5ED894
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 03:56:33 -0800 (PST)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4SfgsX2p0mzyTK
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 13:56:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1701172592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=Wgw7THHPNlfR7vrIV4wFT2jW+w/F1H6ISUXnjHQ56F8=;
	b=DctHNk4k3ziqOdCaT5VnQVAlBl0AOOe/Jzzq6x4JEdSzYWKvGyMFkIXW8SATRlI29NrE85
	028OB1SfL9/ojjOXdbK+NgRsBZ4b4cKNUlWbDuP8HtP6xNPbhRQOeZK8hRMuZ2kl/FxKmK
	9Z1Xr9PmgPUrhv8ar9uuaBPXcV3xNE0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1701172592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=Wgw7THHPNlfR7vrIV4wFT2jW+w/F1H6ISUXnjHQ56F8=;
	b=WIrKI2o6Slz2b+443mwOBWg3UL8rbCCJQjBeJBAtmg4dG4jNsehtFGTKqVtGuuwL9J4/27
	SHP6uKoP+VuGVL0aiQBxU8QL/MiX1WSOifja3OlahiDwci5U5I8CMdhig7bSSxbdKWoSbE
	PS0OAzC6RTxzsDnCKtAOcpr2olmo4x8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1701172592; a=rsa-sha256; cv=none;
	b=x78pODgjS/4f5bFSMU7iP2AZ0kG+crTwVgy3v/94DLTYz2QhhDTjCGSSHf86yoAOuWZb+W
	whSOKKgbZ7X1lXxH1rPO4/OCqvefD04VSKrikvjuQyc5qGd6uGCoMWYs2OXKDB4rp8Q/EX
	bHAd4Sr2nKv+PSO6ydk+nxgTGuhjmcE=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 70957634C93
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 13:56:29 +0200 (EET)
Date: Tue, 28 Nov 2023 11:56:29 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.8] V4L2 cleanups and fixes
Message-ID: <ZWXVbR28L5uY7wOa@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here's a small set of fixes and cleanups for 6.8. In particular, there are
Runtime PM API usage fixes for a couple of drivers from Bingbu and myself,
moving the CCS driver to use V4L2 CCI as well as a few random fixes and
cleanups.

Please pull.


The following changes since commit 3b8551e73271fc375b15c887db54ad31686eb2ea:

  media: wave5: add OF and V4L_MEM2MEM_DRIVERS dependencies (2023-11-24 14:11:22 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.8-5-signed

for you to fetch changes up to d940503dc621ded42c2816d5d693453d90d5cf64:

  media: v4l2-subdev: Fix indentation in v4l2-subdev.h (2023-11-28 12:10:53 +0200)

----------------------------------------------------------------
V4L2 patches for 6.8

----------------------------------------------------------------
Bingbu Cao (4):
      media: imx355: Enable runtime PM before registering async sub-device
      media: ov01a10: Enable runtime PM before registering async sub-device
      media: ov13b10: Enable runtime PM before registering async sub-device
      media: ov9734: Enable runtime PM before registering async sub-device

Laurent Pinchart (2):
      media: microchip-isc: Remove dead code in pipeline validation
      media: v4l2-subdev: Fix indentation in v4l2-subdev.h

Sakari Ailus (9):
      media: ccs: Print ireal and float limits converted to integers
      media: imx319: Enable runtime PM before registering async sub-device
      media: Documentation: Initialisation finishes before subdev registration
      media: v4l: cci: Include linux/bits.h
      media: v4l: cci: Add driver-private bit definitions
      media: v4l: cci: Add macros to obtain register width and address
      media: ccs: Generate V4L2 CCI compliant register definitions
      media: ccs: Better separate CCS static data access
      media: ccs: Use V4L2 CCI for accessing sensor registers

 Documentation/driver-api/media/camera-sensor.rst   |   3 +-
 .../driver-api/media/drivers/ccs/mk-ccs-regs       | 104 ++-
 Documentation/driver-api/media/v4l2-subdev.rst     |   7 +
 drivers/media/i2c/ccs/ccs-core.c                   | 101 ++-
 drivers/media/i2c/ccs/ccs-reg-access.c             | 213 +----
 drivers/media/i2c/ccs/ccs-regs.h                   | 906 ++++++++++----------
 drivers/media/i2c/ccs/ccs.h                        |   2 +
 drivers/media/i2c/ccs/smiapp-reg-defs.h            | 951 +++++++++++----------
 drivers/media/i2c/imx319.c                         |  12 +-
 drivers/media/i2c/imx355.c                         |  12 +-
 drivers/media/i2c/ov01a10.c                        |  18 +-
 drivers/media/i2c/ov13b10.c                        |  14 +-
 drivers/media/i2c/ov9734.c                         |  19 +-
 .../media/platform/microchip/microchip-isc-base.c  |  41 -
 drivers/media/v4l2-core/v4l2-cci.c                 |   8 +-
 include/media/v4l2-cci.h                           |  11 +
 include/uapi/linux/v4l2-subdev.h                   |   2 +-
 17 files changed, 1171 insertions(+), 1253 deletions(-)

-- 
Sakari Ailus

