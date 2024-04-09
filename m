Return-Path: <linux-media+bounces-8874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DDB89D394
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 09:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E238B2844AA
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 07:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C279C7CF17;
	Tue,  9 Apr 2024 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="hTKWcnO4"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016397D3EC
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712649166; cv=pass; b=kiI+aBOwizMfI9ZLYraUfPiQANZcGr54aGNWQd6TsLqxfhrKKmJsIVH+p8VBpPrONrJtAhhmJ0D2LEI1v31cB1zHgthS/6VEA1HjhvQaRoPbeG+ce2bR4nsxqGdRj9RX8JX/oFd/rxmKd/6+RHAAb7Y2hO7hrObqJe9feubuy8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712649166; c=relaxed/simple;
	bh=ASyb0yp058X5KP8FlMaj0y+a2ZG3KH606C20d7M+K6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iQN4MTxjubVMe3tkn4CkgZ3ItI86Hx+RKXoVBPDcGyGzM3qTFaQr8BUntV1VPTuCz8IDKU4zW55P9I2BfseIzlsOd2I79M2WNW6tMatSeqIEK5a9fbsVx6UYHLsHwf4ENOSympO36oYdCor9cybhYUc2XNEuMlBu6BVNIzmMo7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=hTKWcnO4; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VDJ8h1D1kz49Pyv;
	Tue,  9 Apr 2024 10:52:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1712649156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+tzqvZTgdEhSXTfEBGtXIh5dovqbo/maknSFzQR8ax8=;
	b=hTKWcnO4iq/n/9z1OlLdVNEaUZxPBKldtbbLFEFiMa4gxDzhEViSvaNrTcE80dyM2hcDVA
	oEXzcK6/HxRQBsHrJ1M+O+VF3jkclMDBIGCyuFIse5V7WweCgh7f/QumxlBJQyBOLVCuCP
	nOUixcKXJcoxTmYs1qeO/zpPivtG/+dAzSNvDe+neKb0qHNtV5LJ3Kulfotf1bYaqsJ/HB
	KpUTWYml65bw8i0qVIVEjzK8fIzihFvjq+mVC8FnydYALgYTNd2lENn7HLDFjvRYp8o+QM
	ejnFhZivYvYznaStEQX5DM3yexMdRm4oiWNcXa+5BUk37z0vaW+00sRy8FfQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1712649156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+tzqvZTgdEhSXTfEBGtXIh5dovqbo/maknSFzQR8ax8=;
	b=pncSu90+djpB1iApV6WhzHOGj2AN3ogTED/fwcgQgkOOye06I5m6YHPgUrBSLGNEuuR8Hj
	Pe4/InR1EwjB0LHYhIwRRRLPUanMH7UwUOosbKHKHbHTvzOUIRt4HX3+PHgAG7XPVUi4EO
	NfI3l+/rTm2riVktYG7dgYkazKDOE7gp9jvQVuygW1axuLgIsAS24cImuRI7/12+/YdTCB
	7cUkvi+zhrL8b1WdaV7woZQhN+Wgvbjj3+foeVsN0m7if9rTWJhnrllK18wLrD2VHVmgUy
	xnbylPBCJCBVF6R9783OCaTainGLymSGkYr1UV6WG40Dc6xbZ8Mh3E8aqmE5EQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1712649156; a=rsa-sha256;
	cv=none;
	b=LFWNt5toID6J87gemlpVbsrL1B99oWxZ73QQu+Cna5wUVR+GAZ93K7yPYw+upkg4E7ckZH
	3pk3dP3louMGKL/g8Zy1yhe8ZI+1HMhkD9E+4nXWppR/FWw0WvSbnOIHFCL8IbYY0C1LWb
	s4nMIJcA6a71Ap6kmPkybyR8bC3Vp9Qrw2Q3USdvOev1x3p9D5CG0ttZRBhkUjUnr/6qdP
	jqck8ui3ID6UgsSuS6+Lp6KenXSWtmcbjuBSr1c5xWH5on9LMZZbcbhHlq++8oKy10Ltt3
	TlCcmLPKkLRBCX+Vw1BNeT/nQbaTl1uRHy+sU2aq5vKOmiThHJJrtxpRERYI/g==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 91ED3634C96;
	Tue,  9 Apr 2024 10:52:35 +0300 (EEST)
Date: Tue, 9 Apr 2024 07:52:35 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.10] Mostly camera related patches
Message-ID: <ZhTzw2ZG-7zxdJJB@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro,

Here's a bunch of patches for 6.10.

Quite a few are actually fixes this time, there are a few fixes for the
V4L2 async framework changes that went in for 6.6 already, an MC graph walk
fix from Tomi, also cc'ing stable for 6.1 and later. More fixes for the
ov2680 DT bindings, IPU3-CIO2 and et8ek8 drivers and removal of obsolete
e-mail addresses.

Please pull.


The following changes since commit b82779648dfd3814df4e381f086326ec70fd791f:

  Merge tag 'v6.9-rc2' into media_stage (2024-04-01 10:08:18 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.10-1.1-signed

for you to fetch changes up to 3a375a90df85acbcc18eaed7be259a24ffd8a172:

  media: v4l2-subdev: Fix stream handling for crop API (2024-04-09 09:30:04 +0300)

----------------------------------------------------------------
V4L2 patches for 6.10

----------------------------------------------------------------
Alexander Stein (1):
      media: v4l: async: Fix notifier list entry init

Bjorn Helgaas (1):
      media: ipu-cio2: Remove unnecessary runtime PM power state setting

Colin Ian King (1):
      staging: media: ipu3: remove redundant assignment to pointer css_pipe

Fabio Estevam (4):
      media: ov2680: Clear the 'ret' variable on success
      media: ov2680: Allow probing if link-frequencies is absent
      media: dt-bindings: ovti,ov2680: Fix the power supply names
      media: dt-bindings: ovti,ov2680: Document link-frequencies

Laurent Pinchart (1):
      media: v4l2-subdev: Fix stream handling for crop API

Rajeshwar R Shinde (1):
      staging: media: imx: Remove duplicate Kconfig dependency

Sakari Ailus (8):
      media: ipu3-cio2: Request IRQ earlier
      media: mc: Add nop implementations of media_device_{init,cleanup}
      media: v4l: async: Don't set notifier's V4L2 device if registering fails
      media: v4l: async: Properly re-initialise notifier entry in unregister
      media: ov2740: Fix LINK_FREQ and PIXEL_RATE control value reporting
      media: ipu3-cio2: Update e-mail addresses
      media: dw9714: Update e-mail addresses
      staging: media: ipu3-imgu: Update e-mail addresses

Tomi Valkeinen (1):
      media: mc: Fix graph walk in media_pipeline_start

Uwe Kleine-König (1):
      media: i2c: et8ek8: Don't strip remove function when driver is builtin

 .../devicetree/bindings/media/i2c/ovti,ov2680.yaml | 35 +++++++++++++++-------
 drivers/media/i2c/dw9714.c                         |  6 ++--
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |  4 +--
 drivers/media/i2c/ov2680.c                         | 10 +++++--
 drivers/media/i2c/ov2740.c                         | 11 +++----
 drivers/media/mc/mc-entity.c                       |  6 ++++
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           | 29 ++++++------------
 drivers/media/pci/intel/ipu3/ipu3-cio2.h           |  4 ---
 drivers/media/v4l2-core/v4l2-async.c               | 12 +++-----
 drivers/media/v4l2-core/v4l2-subdev.c              |  2 ++
 drivers/staging/media/imx/Kconfig                  |  1 -
 drivers/staging/media/ipu3/ipu3-css.c              |  1 -
 drivers/staging/media/ipu3/ipu3.c                  |  6 ++--
 include/media/media-device.h                       |  6 ++++
 14 files changed, 74 insertions(+), 59 deletions(-)

-- 
Kind regards,

Sakari Ailus

