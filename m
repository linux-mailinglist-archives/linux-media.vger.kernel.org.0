Return-Path: <linux-media+bounces-1493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D5F801271
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 19:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B66AD1C209BD
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 18:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBE74F21E;
	Fri,  1 Dec 2023 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="B8e+7oFg"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 195E9F9
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 10:18:00 -0800 (PST)
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4ShhBF18R5z49Q33
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 20:17:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1701454678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=ygZj9mTLM8KyZe137fcpvxZ0hmQXIg2DGFyHmdSR9YQ=;
	b=B8e+7oFg1hNTX1c3Vg53SyfxcHIpsPcB5OBlFO51gBnFJHvTrST/jhLb2WO0RT3cyUDSBz
	N6b5ANXeyB1uyCnGyAwCO4HJhxlB0UamGtZ/3LzzRwfWVCEVV0y1KBYadM+koyxGDH2SyY
	nPMXhlFNz1CqToR2BdrkRooT94lMKj+bsAVQuJO3yqe/fL7QhPEIpdwLR5LxRERJ6djLs8
	UF47FSoKIAqdg3x77QjBJOn5sHck0e/tMSNOMcvRq1TTehUoAGiriEhJAMMDXICvBoyUz8
	qGoj65BoDA3rpxhrjF24K8S16VU5PUjnEphC4v+FU0eaAfTCyrcgTgFr6vPDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1701454678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=ygZj9mTLM8KyZe137fcpvxZ0hmQXIg2DGFyHmdSR9YQ=;
	b=lYqNUdD00R58F8FO6xlaqmWxfo9cES71gRZXASwXlTAT+lKABrGZjNhLvdkUGLilaAGZlY
	RANYv2hfEXIzeVkbNRNbwmaO1yO27+MHp+3qcnNTT7C8UpWMU/pLAWhjbMTUQ6EqtMfqni
	vmJ42rs25BWUT1fJRWb27WPWz5nn3NSlIplixh95c7VeVXGlKiZT3T6t3ATanEwWVdsOO+
	7oqiTC9pObCds9dDrcopCNoDzGTEErZrNkd9T3yHXKv57QeJfp56IIRnPmBDlaYVvsgvJe
	cqwpmouniDSAcjdhJSqZv0jweiyW3/9xl8L9FJu7/eVT3dMeCcGiM1SgLsV1cA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1701454678; a=rsa-sha256;
	cv=none;
	b=B7WP0idcb2DLUdxD9ncAScoDrMEUE+dT0B0CHJcWn3YKhBLn/poEoxhyRcFFIlR+3TiNi1
	Y+5cF7yKl9Omt9WbOnCcBocUo8/6ro1drWV5+lN5d88i+Hcuy9Z3K+3V4nYr/ThwlWRd8q
	JG6i7X4gCIQQ3PQGAWjiCubT1VrmYUqGMS/ak6pqtOMZEHlVCUS849NaCOj2SBBQpm9WAW
	XfskXHG9KEsoc8g9oHUI0Va3AgIPsoVg25W1kly1qEL958eik+aY/qBYt47ZnHV4wONpXp
	Z2k388x+mgyyinW5jBbDJcLNfHARybd7vTp4HbuWd4w/FZkXM1ts3pXX82Hu1Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1274C634C8F
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 20:17:54 +0200 (EET)
Date: Fri, 1 Dec 2023 18:17:53 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Subject: [GIT PULL v2 FOR 6.8] V4L2 cleanups and fixes
Message-ID: <ZWojUQS_icPbhNQV@valkosipuli.retiisi.eu>
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

since v1:

- Include Sebastian's v4l2-async fixes. The other one is cc'd to the stable
  tree.

Please pull.


The following changes since commit 3b8551e73271fc375b15c887db54ad31686eb2ea:

  media: wave5: add OF and V4L_MEM2MEM_DRIVERS dependencies (2023-11-24 14:11:22 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.8-5.1-signed

for you to fetch changes up to c44c7f880ba22a99424b556638a05c1c2bf2d3e8:

  media: v4l: async: Drop useless list move operation (2023-12-01 13:06:27 +0200)

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

Sebastian Reichel (2):
      media: v4l: async: Fix duplicated list deletion
      media: v4l: async: Drop useless list move operation

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
 drivers/media/v4l2-core/v4l2-async.c               |   4 -
 drivers/media/v4l2-core/v4l2-cci.c                 |   8 +-
 include/media/v4l2-cci.h                           |  11 +
 include/uapi/linux/v4l2-subdev.h                   |   2 +-
 18 files changed, 1171 insertions(+), 1257 deletions(-)

-- 
Sakari Ailus

