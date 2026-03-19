Return-Path: <linux-media+bounces-56423-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DObGh6DvGkyzwIAu9opvQ
	(envelope-from <linux-media+bounces-56423-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 00:13:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BA32D3FE7
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 00:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6595C300F1AA
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 23:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049673B27D8;
	Thu, 19 Mar 2026 23:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="YlENVGjr"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B4837997C
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 23:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773962007; cv=pass; b=Nj7C8moFVFD76wesn+OSRrz4r0K7EpUBK+878EZIgObOcBuGq7oDV/gLdYsCDGHd9v2GhmZjf3GDx43jUNia0FEDu36Uz9qvqW7urrYaMF+p/cvXzg0fFX7rgqCVJjgfw+2Zatbsw6ynHqd5hJ3Oc/HKcAfy9J+889bMOGvr+RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773962007; c=relaxed/simple;
	bh=f+wZnflVHlVOqwPTXqrMn3fGA9wC/W5ujUbko7Tn0B0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S6C7asbbc20diMKb8oslUNeaMKknKjzw8yV4uz8wHagtFQWNeJ2FgRTZ8R6NJ0rckli6kiXY/cBsZeBZ/tPWXrZ7t/iy5NgpwrAyvBZMQxoZ6PDHcwnmyFM72SKoGSPSEncZS0AuJYA4NEwjsJA9uN1Q0wikAORMzqHeXnv7m+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=YlENVGjr; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fcM1j64NDz49PtM;
	Fri, 20 Mar 2026 01:13:13 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1773961994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=PghvP2zerZXhvzCjZfpWvWvDmhY9m6eCx8zX9CC/Ixs=;
	b=YlENVGjr8MpKxVN0wRjSp2RIxxG8XW+q3RbqptiTFHE3esUNXjWvydi8rdvHJvx0hEiBrV
	MjJoRtNTfnzjy280gMvMaP/rPziV382o3epi8eZ3Qu5MHGpzjG+QI3m5iUyBv1S/LMSh/z
	+dsCJDo0suLNsURLYLJVo3I6papIbk7lfsbEP8evbDHiPcfrEMCGAlOoNMkylfA/Z7svoZ
	WEs+XY0eXhTtu2bNpGj5lJ4za2uDJZUwAEr4ZNmqtKDGePWjkfJNvsXJi+COcbzCEAi1Tk
	z0lUo0+u06N6IDwwwVazf1ZMjpgyn/e4jYFmuFnlKwA0LdCnmjAQCJOGAUjXpg==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1773961994;
	b=LLtVWeip0sYLmimRf4GHUmJB6AWL8A+jGwRTx8dZvoZVubnN3gjBo3lb46giFmX7uJlYKc
	xMvWvomd5YB6YF6Bv2jWqdyq69jIre1EXvn9Nvl6SmcHsvCOfUtILTCyPePLnmxhva6Pci
	+RYPT2G/WPjLCCpRMfxhNxRCUECIvL81237g23ZYBryuFmXG9jwcYMkorY2ll3kxG2VQ78
	CtBfHHNEvykQCKErS1r8Th26j5aaq/QOfQrvdktmknBAZlZ9EHvB76mmcbKLcZxeA7Gx+X
	EdeIKvYrKIf96v6BOVEKA4HJnfGBRMyDlYuw2K3S3s6bRBmg7bmOVMVzdk9Kcw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1773961994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=PghvP2zerZXhvzCjZfpWvWvDmhY9m6eCx8zX9CC/Ixs=;
	b=nB7G4Ggh8hhgP4O8EOXQyv/L7+8RZ6mtIQCu9ClK5ME3OBNKnX3rM2oJ217tLzcCvLqJFC
	Jcy9tFaOBfataZC0iyo0YfNNj6WKT1M5yK/k3/FSNAIN7Kh8ShQGXFO0Dlu9TYxW6SKEEd
	vf39DAKuO/xVKpiNPPqdaeXZK9B1UmVP4ZxIauHX1+zeo3kV+lzx2JUrFj2/kmo+I28+6R
	RVHVYSYwqcpADmQgW/1Lr1jp1WcQPxlaIxY9yigYUDABm5slwp0UGnhL546slWkRaVsjf+
	+DOU/AFb5wsSH+4Iq/H8Wh4R+75K2uEU7WOShcR7vq/sTm/SXQVOHIxrmPu5WQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 15944634C4E;
	Fri, 20 Mar 2026 01:13:12 +0200 (EET)
Date: Fri, 20 Mar 2026 01:13:11 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR ]
Message-ID: <abyDB4YJniaNVxo4@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-0.54 / 15.00];
	SUBJ_ALL_CAPS(1.13)[15];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	DMARC_NA(0.00)[iki.fi];
	TAGGED_FROM(0.00)[bounces-56423-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,valkosipuli.retiisi.eu:mid]
X-Rspamd-Queue-Id: C5BA32D3FE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

Please pull.


The following changes since commit 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67:

  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30 (2026-03-19 08:18:36 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-7.1-2-signed

for you to fetch changes up to 7eaa096e1c92b25ae6b41234e6723be710cf08d8:

  media: ov02a10, dw9768: Remove Dongchung's e-mail (2026-03-20 01:07:20 +0200)

----------------------------------------------------------------
V4L2 patches for 7.1:
- Return -EPROBE_DEFER on NULL endpoints in firmware graph endpoint
  parsing,
- Renesas vsp1 and vin fixes,
- Clarify RGB colour component order on serial buses,
- Clean and fix error checking in and improve documentation of
  v4l2_subdev_get_frame_desc_passthrough(),
- Fixes and improvements for imx355, ov8856 drivers,
- Drop Dongchung's stale e-mail addresses.

----------------------------------------------------------------
Alain Volmat (1):
      dt-bindings: media: st,stm32-dcmi: add 'power-domains' property

Alexander Koskovich (3):
      media: i2c: ov8856: free control handler on error in ov8856_init_controls()
      media: dt-bindings: ovti,ov8856: Allow orientation & rotation props
      media: i2c: ov8856: parse and register V4L2 device tree properties

Chen Ni (1):
      media: v4l2-subdev: Fix error check in v4l2_subdev_get_frame_desc_passthrough()

Maxime Ripard (2):
      media: uapi: Clarify MBUS color component order for serial buses
      media: bcm2835-unicam: Fix RGB format / mbus code association

Richard Acayan (1):
      media: i2c: imx355: Restrict data lanes to 4

Sakari Ailus (2):
      media: v4l2-fwnode: Return -EPROBE_DEFER on parsing NULL endpoints
      media: ov02a10, dw9768: Remove Dongchung's e-mail

Tomi Valkeinen (5):
      media: renesas: vsp1: Fix NULL pointer deref on module unload
      media: renesas: vin: Fix RAW8 (again)
      media: subdev: Improve v4l2_subdev_get_frame_desc_passthrough() kdoc
      media: subdev: Minor v4l2_subdev_get_frame_desc_passthrough() cleanups
      media: subdev: Split v4l2_subdev_get_frame_desc_passthrough() into locked and unlocked

 .../devicetree/bindings/media/i2c/ovti,ov8856.yaml |  6 +++
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |  3 ++
 .../userspace-api/media/v4l/subdev-formats.rst     | 20 +++++---
 drivers/media/i2c/dw9768.c                         |  2 +-
 drivers/media/i2c/imx355.c                         |  6 +++
 drivers/media/i2c/ov02a10.c                        |  2 +-
 drivers/media/i2c/ov8856.c                         | 23 +++++++--
 drivers/media/platform/broadcom/bcm2835-unicam.c   | 41 +++++++++++----
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 22 ++++++++
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    | 12 +++++
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     |  8 ++-
 drivers/media/v4l2-core/v4l2-fwnode.c              |  9 +++-
 drivers/media/v4l2-core/v4l2-subdev.c              | 60 ++++++++++++----------
 include/media/v4l2-fwnode.h                        |  6 ++-
 include/media/v4l2-subdev.h                        | 50 +++++++++++++++---
 15 files changed, 208 insertions(+), 62 deletions(-)

-- 
Sakari Ailus

