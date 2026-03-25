Return-Path: <linux-media+bounces-56956-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMxKAO2fw2nGsAQAu9opvQ
	(envelope-from <linux-media+bounces-56956-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:42:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 397A232187A
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E89A3047E5F
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 08:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4AE3370E4;
	Wed, 25 Mar 2026 08:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="J7i3P+QU"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551F93264E6
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 08:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428089; cv=pass; b=XuSFxpPS84fgT77KcdVXMAETbr6clbM6DzsCQVr4nP7DU2SbW04F/LVR56NUPT4mI6bEBQIOqD33mrRhfpME0M74xZtEZdSrdk0TQ7h2/5tRVVTpT7vmPAB1q3eRLzYL1bI/adSttJv/QQcVZOsYSqrSX9sZBrYNGsqyzklfxoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428089; c=relaxed/simple;
	bh=XKAGvAzZ/6GzI3OCE3WXxq5qn4AJARyUdnWRgZJltzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JaHwlhm/22pW/9d3LwbS7XIqzMoa01jiPyqycJCLnDOQk05Vwjx41SFfA0SagctECoCzXdDI9cJvzT6LLsZGXZTfg+OE3obGseZR2K1ltyxhac/e1PvLi6QPXnArVLnlQ6G1hwKMaMKzQYu2DIzLQHaX+VAlFhyzU4izn2q3nn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=J7i3P+QU; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fggNt3bZczyWV;
	Wed, 25 Mar 2026 10:41:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1774428078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ds/Mm3FK16fKVjpqWw6yht6jKaSEBzkVR1v6j/iwf+g=;
	b=J7i3P+QUjaz8o5L2yBfphNPxDc3mIAIwJcN2I1hResXuGrz+Cfe0uVKw4TKVWfNNvBFE9h
	4pkF4gOoNDwyHuyMXhqVOJ6v321lzzRXolqK72ECkN45KBri3zYHUeVKWATRXbIp7TWR+A
	bu8eyGFa8+csIQma8dbUyBpPOFJTZ78=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1774428078;
	b=y5p+1V+Wi1xuGUY5y0aMuAQrHvsOVi3II9T/ppRP1swZ5UJACjOeAXRel+8CZHXxirQSpQ
	61IFfsvZNaNIxd1282us1+E0pSQgoEw6a1pF2rVwpMNIwTjBCi+3pWGrZdO0WprdI5G0SS
	hjyQDwLCcYrcPoY6vbWV0/pJrKYqd88=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1774428078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ds/Mm3FK16fKVjpqWw6yht6jKaSEBzkVR1v6j/iwf+g=;
	b=JB8w/E+ShljSikeb2OojeR429TuTWAWkyGHBnY53fsaEyUcj0mmHENm8DI44RTwFvihuSp
	uOVj76SLaWDLW3DK+kQ/OrBoZQ7di6R7aQ1lqlFYQ+IpvFQiPRZ7TQ51Q6/R6a0egyFQMn
	XvXheAk8+XQ4lfHoRvD08HUfRbZXiY0=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C9094634C51;
	Wed, 25 Mar 2026 10:41:17 +0200 (EET)
Date: Wed, 25 Mar 2026 10:41:17 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL v2 FOR 7.1] T4ka3 and ov2732 camera sensor drivers
Message-ID: <acOfrXYoAtBf23qe@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56956-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: 397A232187A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

since v1:
- Use Kate's v13 t4ka3 patch instead of v12

Please pull.


The following changes since commit 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67:

  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30 (2026-03-19 08:18:36 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-7.1-4.1-signed

for you to fetch changes up to dad9f7f18e5ed2d03d76f69d7d4a31acfdfc957c:

  media: Add t4ka3 camera sensor driver (2026-03-25 10:37:18 +0200)

----------------------------------------------------------------
New camera sensor drivers for 7.1:
- Omnivision ov2732
- Toshiba t4ka3

----------------------------------------------------------------
Kate Hsuan (1):
      media: Add t4ka3 camera sensor driver

Walter Werner Schneider (2):
      dt-bindings: media: i2c: Add ov2732 image sensor
      media: i2c: Add ov2732 image sensor driver

 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml |  103 ++
 MAINTAINERS                                        |   13 +
 drivers/media/i2c/Kconfig                          |   25 +
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/ov2732.c                         |  790 +++++++++++++++
 drivers/media/i2c/t4ka3.c                          | 1064 ++++++++++++++++++++
 6 files changed, 1997 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
 create mode 100644 drivers/media/i2c/ov2732.c
 create mode 100644 drivers/media/i2c/t4ka3.c

-- 
Kind regards,

Sakari Ailus

