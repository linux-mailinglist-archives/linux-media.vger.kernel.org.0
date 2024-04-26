Return-Path: <linux-media+bounces-10160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4088B30B2
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8226C283A40
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 06:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BC913A884;
	Fri, 26 Apr 2024 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Nr2RcEmA"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E957A17721
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 06:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714113944; cv=pass; b=W1t3snIQe1KYYlYXSxsovoT+UMoAIWTM7B3ODv0GLuvzRhD+aaaToFQ9svPpxOVN6HQ+sWAAreUv1jo4zxMHLnXwWvP1wgLfD+Dm45tGGgfWVmue5eW9bFIRDNAYM2J3220UcfCRZsAjYqhJYrzvASKnLqdFUtqjKDupIBx1rJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714113944; c=relaxed/simple;
	bh=np1J7tJZZNb2Lbbd9nPRKYmyvMn6YX2GU2/Sys5BjHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iYiX2hAcwKGBGAq2sYe5PP+yUQP8ET2psyEDkI5tG25Cj5U6A73vHJ4gG3SOScsuCQMd/rkcRpjAsSarTh6z06SdNZDHhT1DkLb7bmTNKLmQ3rqxRLVudkSPN+aHgI4QHM48d68l6GmdLLDaUcXWpC8GOumr94Q3UaNk1STUu4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Nr2RcEmA; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VQjsQ3qHgz49Pyk;
	Fri, 26 Apr 2024 09:45:30 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1714113930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=JAUDijxcqaqUJCcTZtbAuLKU4lG0h6KFgEpbajtqf2Y=;
	b=Nr2RcEmAS/IT3AyoHToyl3HZDr2V4J+mGehA/kEUrEXdAheRS/lJJD6weFXl/MaHe+1PuS
	aRAYjS0/4qD7nfwsdU18dV3YSNLdmZmOWGzIGWI9PyfCP+d71rBcnUPxcqo5titd/vlI1y
	TvCEycC9uhfd5ORo5yjEnwXiheU3hLj2Aat1TVtvFkuuUw26wzcjzPh1KXP8O7bQsy8JbS
	hXELLFtC0gLZwl1sUUp+a9lrN4YS2boND6CNPX7aoOnWVAV1H5fDIdajyKZgvcCBhurFIt
	+fVQf0Z9NKclySrjMoKRwxvQZ4idxwjbGctZJfR4Qr9rh++EAweYH6hOlaC67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1714113930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=JAUDijxcqaqUJCcTZtbAuLKU4lG0h6KFgEpbajtqf2Y=;
	b=DEufAODp55f9qc0SHAGxk53fw3mAMAGCOLsQuRE8TdEiZ2dAyTTHLlkq3Vf2BdzlC2knWs
	CPGDfYjTSrSC9qiuilK2HDooSmn1hLlG7krXMf1Rp0zPucEKPfLdG48eU23qboakeB9IO5
	kBmmAarxkofmyuWZQMzI1KH3H7qHRqrfumLdB6Ba4v1XUGWqRyyLtpLQeQcDF/3thLiBja
	3JZ7mShktrf7op+TGeQTF7Ix3rjrP0R4oDjMIT4qHMWcV3pNFiqqcg9La64J6QyYHcm10+
	zrIvEoCyyJ3c1LoC8wBXgO9G9tVUIsa2MnRedGmuYzjDPjxA1/bY507kOS9D0g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1714113930; a=rsa-sha256;
	cv=none;
	b=AKhRtTtHtDjHi4O9Y38Vahm/N7zllbxhfi0Xh7STZShPBmHEC+C8rZJ6wVU+vwX42qKT0F
	xcJ9KbBrjM9H6nLxizfgMI6cZKxCStPmb/dh6njfxIcjMVhl56HBsY/re4UplhXR+meBsS
	5wME89rhHrF8R6Vnqht92kNqf4KCEjxVYFT9jBTUYhQvTqaJn7FK0duaZZeRsE36vmk2Lt
	rDlivb2vHOTkDWm1/H4mizx2/L2rDOmALYYvUAdZoxcdP1H+aBq6GLBU22XxeKtO8LTRG9
	GaCETaVu3NHTcY8PqTHXbtnFnyrVWOx7Eyjw4fcET6KHebbxYApM+DPQCdytaw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B01FD634C96;
	Fri, 26 Apr 2024 09:45:28 +0300 (EEST)
Date: Fri, 26 Apr 2024 06:45:28 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.10] Ov4689 sensor patches, IVSC fixes and V4L2 async
 improvements
Message-ID: <ZitNiLquDWkye4Qg@valkosipuli.retiisi.eu>
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

Please pull.


The following changes since commit faa4364bef2ec0060de381ff028d1d836600a381:

  media: stk1160: fix bounds checking in stk1160_copy_video() (2024-04-24 13:49:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.10-3-signed

for you to fetch changes up to 17da36cbdb10ee1f66761948314f664ca4aa4201:

  media: v4l: async: Set owner for async sub-devices (2024-04-26 08:43:20 +0300)

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

Sakari Ailus (5):
      media: v4l: Support obtaining link frequency from INTEGER64 controls
      media: Documentation: v4l: LINK_FREQ can be an INTEGER64 control
      media: ivsc: csi: Fix link frequency control behaviour
      media: v4l: Set sub-device's owner field to the caller's module
      media: v4l: async: Set owner for async sub-devices

Umang Jain (1):
      media: i2c: imx219: Use dev_err_probe on probe

 .../media/v4l/ext-ctrls-image-process.rst          |   2 +-
 drivers/media/i2c/Kconfig                          |   1 +
 drivers/media/i2c/imx219.c                         |  77 ++-
 drivers/media/i2c/ov4689.c                         | 671 +++++++++++----------
 drivers/media/pci/intel/ivsc/mei_csi.c             |  30 +-
 drivers/media/v4l2-core/v4l2-async.c               |  10 +-
 drivers/media/v4l2-core/v4l2-common.c              |   3 +
 drivers/media/v4l2-core/v4l2-device.c              |  12 +-
 drivers/media/v4l2-core/v4l2-i2c.c                 |   2 +-
 drivers/media/v4l2-core/v4l2-spi.c                 |   2 +-
 include/media/v4l2-async.h                         |   4 +-
 include/media/v4l2-device.h                        |   7 +-
 12 files changed, 436 insertions(+), 385 deletions(-)

-- 
Sakari Ailus

