Return-Path: <linux-media+bounces-64843-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZB8GBgAPL2pv7gQAu9opvQ
	(envelope-from <linux-media+bounces-64843-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:28:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECD468228C
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:28:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FiQCMz4w;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64843-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64843-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B75383008D17
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E898231AAA8;
	Sun, 14 Jun 2026 20:28:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D71B67E
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:28:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468922; cv=none; b=Ch+c0ba70JeoPo2YmE4lyxQmPNy0R4D6WzZkT2Cyvmf8RaF09ynil/GZNwQWWQp7pMt2o6xkFhx8z/hGdkKcCxPdLkfZlI34zM6wgacTWmYPHIl1SMorwbOb2GfuBu9bwh5J2uQyoMUq5b/F74gqADF5FxQQTOIliZQfjzXoWlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468922; c=relaxed/simple;
	bh=OgeijdH6LtezgFTJaBQ7MJe+UQtfEEgxYh3OrOI5xjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ied1NeN4lsT4/2uQupl15DC73lHmd+yw3/jS/KfhSIp92H+rH1dm/0cjtVNIPLNtR2ZIfJxOfqow7bOrJS6Vif2Wm6hOty9/P6D6JdXGtSz/svlzqFrwVGRYaF51admPyMmvVg0mA0CputvU0wGyLAzqLByJ9VKGbCFMS2dtp/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiQCMz4w; arc=none smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36baec934b6so1885177a91.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468921; x=1782073721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RWl7ZlnfGsGh5DzbPUR1+9TD3AUj0wE0oWpwLFL/mmQ=;
        b=FiQCMz4wuBL4QzagdYpuD17lwy+3eXFKv9yqBtAxweR4MEkJMxcD97j6DWquJj/qRu
         Gno6VEhbOqI1ICgCh8Vx4caVMJXSN1BwLQKsP0QcCwNKwNphocb9xVw75vUyzKEkqY1Z
         21Gqg6umwhcpkLzk2X9OI9nH9W33Sxa7codZ6/VtZf85cf0ZEcAgHVWIOdex7yTINZS6
         o0I3R8q3EG+7O4gXIVX5sPBZdQdPpaPMx3f+YhZVZsq6s9hAlakF1Po8QdjLvMVB+rcO
         UYWoYkhWvYhFJLJJjUgYXxtzhpvNUtImVNUvy5h2DrK6FcNpwskQjk5kj3Z6/cua5G2r
         /Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468921; x=1782073721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWl7ZlnfGsGh5DzbPUR1+9TD3AUj0wE0oWpwLFL/mmQ=;
        b=VuVmna8vdYDacU//cX8muLcc8P7YCNJVVMNlVn2rvBMIJ8nn2qQCnRBUP895M/pHBy
         xFfEGIbKInvQDNrlnC/tmndVCsSGiStAUkAl5zJ7indzv1HaFAVoI/bTdXBQBzh3q+Ak
         VYdIyvf1IyIMdu+gwoQkoFkLlw3xiGM8Wz3A8NYyzRqE0pqBD2j8gR8De8mY1TD8eNAL
         z+kXmDXNroF+XCUopydtIvDjj5qFC7ZB/5nUcz5JpS7Vsy4Rcz+r473CD6PKN4boLMIb
         uHpb7AaempqNtlNHdeUC+OkN5hJ7AjjTnD1228uFPprnMngfmupRX8GEZRKH5m6esRc9
         NITQ==
X-Gm-Message-State: AOJu0YxALnzSOgoV0D1g/wvSXCRe6p5XwBJPQLgECNa8HYrim/n4OnZu
	h0i5XiS3qn+QV1JD9WM0Z8KJY/YCibEqxWR6tRKxheUT2xwjeRS7MjeGHgFGZaVz
X-Gm-Gg: Acq92OFfz7i+fII3aeTlXgWwRf4zRXeOKCc1E7jAqkD5dpgsSnsn2lHPWmAR3DitE9t
	2GrMfLIeTyzm+fk49mqvm73h40+JsM1QoHtTftKHGHaQGvR37o4Vnux5KUbnLB5BI2MAxm0xWer
	njG2bvYnXZpxjaaGbh/km2oHb7b2N+zyzzx+0NYtwvkX/SMSeKKh12NLEOsZwR/fx1WlEzWR9XS
	52CJTtrIVJzibBNxGpl8Xo2gETTzOYIPSaEdUMSmQNq57k2ApvJabZ+u0La2XZWsWXaoOdd5Tfv
	EaVkm82LbPfql9gFqMASfPgMrCGPT1PV1q4yaZ/ZiOOTGOrUh2Z3TJeZeRJlKY6XVEYyBEiYdj9
	g6d9vJVb1+S+PfK/S+0ombm5KIcrXBF225LJGCDITlgqDyLs+qgF+FVRHo7FCynVZU3fvxFoiSd
	lxp6MwDrLyy9RksafuDZgw5Q3S3jec+OxxrBbFWPvSCBJhS2MF7E2z
X-Received: by 2002:a17:90b:2249:b0:36d:630a:c4e4 with SMTP id 98e67ed59e1d1-37a1d730d3amr8343428a91.3.1781468920549;
        Sun, 14 Jun 2026 13:28:40 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.28.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:28:40 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3 00/22] media: tree-wide: Add missing media_entity_cleanup() calls
Date: Mon, 15 Jun 2026 01:58:00 +0530
Message-ID: <20260614202835.11977-1-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64843-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5ECD468228C

This series fixes a widespread API violation across the media subsystem.

The `media_entity_pads_init()` function initializes the media entity,
but many drivers forget to call `media_entity_cleanup()` in their error
paths and remove functions. 

This series adds the missing cleanup calls to prevent potential memory leaks 
and ensure proper resource management.

Fixes tags have been carefully audited. Tags older than 2017 or pointing
to directory rename commits have been intentionally omitted to avoid 
spamming the stable trees for ancient/moved drivers where the bug predates
the EOL LTS kernels.

Generated and validated automatically.

Biren Pandya (23):
  media: i2c: cx25840-core: Add missing media_entity_cleanup()
  media: i2c: max9286: Add missing media_entity_cleanup()
  media: i2c: msp3400-driver: Add missing media_entity_cleanup()
  media: i2c: mt9v011: Add missing media_entity_cleanup()
  media: i2c: saa7115: Add missing media_entity_cleanup()
  media: platform: stm32-csi: Add missing media_entity_cleanup()
  media: platform: sun4i_csi: Add missing media_entity_cleanup()
  media: platform: microchip-isc-scaler: Add missing
    media_entity_cleanup()
  media: platform: cdns-csi2tx: Add missing media_entity_cleanup()
  media: platform: rcar-csi2: Add missing media_entity_cleanup()
  media: platform: csisp: Add missing media_entity_cleanup()
  media: platform: rcar-core: Add missing media_entity_cleanup()
  media: platform: rzg2l-core: Add missing media_entity_cleanup()
  media: platform: cfe: Add missing media_entity_cleanup()
  media: platform: j721e-csi2rx: Add missing media_entity_cleanup()
  media: platform: hantro_drv: Add missing media_entity_cleanup()
  media: pci: saa7134: Add missing media_entity_cleanup()
  media: usb: cx231xx: Add missing media_entity_cleanup()
  media: usb: em28xx: Add missing media_entity_cleanup()
  media: usb: au0828: Add missing media_entity_cleanup()
  media: usb: dvb-usb-v2: Add missing media_entity_cleanup()
  media: dvb-frontends: au8522_decoder: Add missing
    media_entity_cleanup()

 drivers/media/dvb-frontends/au8522_decoder.c  |  2 ++
 drivers/media/i2c/cx25840/cx25840-core.c      |  2 ++
 drivers/media/i2c/max9286.c                   |  5 ++++-
 drivers/media/i2c/msp3400-driver.c            |  2 ++
 drivers/media/i2c/mt9v011.c                   |  3 +++
 drivers/media/i2c/saa7115.c                   |  2 ++
 drivers/media/pci/saa7134/saa7134-core.c      | 18 ++++++++++++----
 drivers/media/platform/cadence/cdns-csi2tx.c  |  5 ++++-
 .../platform/microchip/microchip-isc-base.c   |  1 +
 .../platform/microchip/microchip-isc-scaler.c |  7 +++++++
 .../media/platform/microchip/microchip-isc.h  |  1 +
 .../media/platform/raspberrypi/rp1-cfe/cfe.c  |  2 ++
 drivers/media/platform/renesas/rcar-csi2.c    |  2 ++
 .../media/platform/renesas/rcar-isp/csisp.c   |  2 ++
 .../platform/renesas/rcar-vin/rcar-core.c     |  2 ++
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 ++
 drivers/media/platform/st/stm32/stm32-csi.c   |  2 ++
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 10 +++++++--
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   |  6 +++++-
 .../media/platform/verisilicon/hantro_drv.c   | 12 ++++++++---
 drivers/media/usb/au0828/au0828-video.c       | 10 ++++++++-
 drivers/media/usb/cx231xx/cx231xx-video.c     |  8 ++++++-
 drivers/media/usb/dvb-usb-v2/mxl111sf.c       | 21 ++++++++++++++++++-
 drivers/media/usb/em28xx/em28xx-video.c       | 13 ++++++++++--
 24 files changed, 123 insertions(+), 17 deletions(-)

-- 
2.50.1 (Apple Git-155)


