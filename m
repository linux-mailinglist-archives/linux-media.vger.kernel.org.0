Return-Path: <linux-media+bounces-64806-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mychDU7dLmrX5AQAu9opvQ
	(envelope-from <linux-media+bounces-64806-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:56:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85294681991
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:56:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QF7T91xv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64806-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64806-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE63A3008207
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0A02F7AD2;
	Sun, 14 Jun 2026 16:56:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C782135B8
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:56:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456198; cv=none; b=EMWWM39rqaCY3gAP2rXKuWj0Fs63pe8H3JteTmTjBcJIudrnYjqJUFavXhpW8loGjpAUE0mq+8QpoM8t1RewP/AsJ3jffNHnia8iUZVUnTT5JaZoRbKj3+Sne49xATHwWsA3L9EOe3QqD/eNv3MnFyUd5AQ4cK8ycpLQX3Npn5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456198; c=relaxed/simple;
	bh=OgeijdH6LtezgFTJaBQ7MJe+UQtfEEgxYh3OrOI5xjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YILWIGV6kEOvwwEj9s6jyEA7XRJYP1qtxwXJxbJ/UdXY4Kq32+d1xGrCXRss/oI0Pk9ID18ChhnbJbVn260BvUGuGfFodBpKcpWqk4/lsA1S2S1SZd5k8U9Z0Zuit7lLdzboM4qxqcdbY1CUB207CkXs8t/h2HrXMXL3/dAdxso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QF7T91xv; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf18c30bb2so19049075ad.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456197; x=1782060997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RWl7ZlnfGsGh5DzbPUR1+9TD3AUj0wE0oWpwLFL/mmQ=;
        b=QF7T91xvcV9VtGWmnlPI89rIEu/anPJBSuawS0dKYtRtrI23KQw8RBVKhxToSOmG7P
         xAT9BIZIRkOXv2HxsKr5tn7eRRZk+43fcPgA+ICeLA48onXGkZWMHXw4vRngDzmoFiuP
         Xx4GftXb9rBjX9pg8H7tQ4m7Gcds+g4Z/+6+OLBmcpXlloHSR4i461C3sAIXBHtGCyQI
         DZF1d/A46mCfQOaNLmBr2IK8TQfB27IgIcQapxPKbWTTnMaooiV7qFG187UKIL+3SReS
         OVcHgKnYldoiN5LWWfTa8WlekPLBls/NAf5/rfhVavmQ/XMsg8uNomp6QX7x0x7gBZRa
         Vnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456197; x=1782060997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWl7ZlnfGsGh5DzbPUR1+9TD3AUj0wE0oWpwLFL/mmQ=;
        b=lu28N/dNO1t6FeiLgkWy6ETuoRdbqPHQz7NZ1GCPI9GXK743UArswwpG1MSqumPcQH
         w5DhZNwd92h4jCVTxrZprEEwYvxLur/paFA0UDHSP3j8PPmI8N5TCfLqjOea9eNCCCuO
         qNApo9S8rtYaTAadsy8oUIcm3wVn+j8IJW1rw+Om8qAXZhlHo3JDb6zTtG1AjSlE9/16
         rG11nqUWqVVzk8NAhRVBD2qHCMEXMPyks287PWul7qvCSTks66HUy6Sp+xmT8en4ZD4T
         3xJPp6Tj9YteDQZEs8sZzrXJhp7Apt+nUWFMFVizb6bAEHfyl65Sv4Im4Wn6CX3JoP83
         cLyQ==
X-Gm-Message-State: AOJu0Yxx7x7i+us013aniiAr6SvcCjraav8j/R3FnPezx7XpKe+qGBIm
	BofITSUHLbZRYAErzDYofJkrea+ei6agOdCRmVqk9IaYGYwJBDd2JJ3u9cO57YZN
X-Gm-Gg: Acq92OHwC1Hfony809weOQzIP35bsIb5btQUOAw6sfUJiIriNKrEOnc2VcFOGeitwoc
	F0ojLVu7mY8WJw3IxzwoMZZVXr7PVswOELxm9lSb0lW3X+c6Yq6vPcC4qShF01p4dBsdLlClB3P
	pIEbxTzMAE+GjORyykL0YUhok2ODBBPJumOkg8vnoes1JrYjDFn3S37oqPZdN3lRtV7Wgh2GTwc
	IV7WuWEIBEhMkGuICd0ZDWllNdZ5auP1DxdaYdvkDqkUYqmMocinIxeIvUNU/N3/0UaVwtpDbHA
	Bk4eblJofSTaLYshCwoRs3Gi8gXEfgNlyLooBkRpqEc4/c+dJwiX9wBcpD+c/sa1QDL8Y+wOXvi
	yidFGnO8Ds3GlmHX3SxgD7fSFCG39TpUESKDKv/6gf6EmbAedfap7WxIOMuqSxC/4rI6DyM3ulc
	tyQ+q0ssSZ2p6iM0xlTKh9MDOZseDG/FNaUzq5HF9+zKGEB5I/aldk
X-Received: by 2002:a17:902:f789:b0:2c0:ccdb:e023 with SMTP id d9443c01a7336-2c664272087mr83134335ad.17.1781456196556;
        Sun, 14 Jun 2026 09:56:36 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.56.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:56:35 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH 00/22] media: tree-wide: Add missing media_entity_cleanup() calls
Date: Sun, 14 Jun 2026 22:25:37 +0530
Message-ID: <20260614165630.3896-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64806-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85294681991

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


