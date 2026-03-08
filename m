Return-Path: <linux-media+bounces-54866-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLLWMVlDrWkM0QEAu9opvQ
	(envelope-from <linux-media+bounces-54866-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 10:37:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C95C22F386
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 10:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 576B93010DB2
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2026 09:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAFF36656A;
	Sun,  8 Mar 2026 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="uR7WcO+J"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64222248B3
	for <linux-media@vger.kernel.org>; Sun,  8 Mar 2026 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772962644; cv=pass; b=MPmI5goeLic1O5xUqFSqxlaDz1jsjMKzr/Iwx5YnmjCnC0CZRpHHRezhbiHYnpHcjlV9GNX9VYNjVPEoPeRgVPBKjku7wwA5T7CS2UmYqWXVn8e1QRajPGKQ8kYaFWt43NfJFBgQjSm52OS/h5JGECjEyszFAB7vGENXLL0ILxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772962644; c=relaxed/simple;
	bh=FCMdXfbcv2d13gezoZzyE5N+blUkGkw8XyEChMUm/40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=orT7tjWFb9095/cRsOegl0gmEa0NK1DI6b8+wtVitut4KI2iHWOILjBP1CCaqhvncUX62HtZDP8vMfxg7cCAQMQ4Pi+aLdzjH91ctI4gUcw5Zzub6+g67KHBDU9ehmQYLoiyV/lhUbMDWggCbjUoXCgOMmFXa7z8kmKRyVC/U6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=uR7WcO+J; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotp5c1dsf-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:1157:8c0f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fTFRF2Yb9z49Q5d;
	Sun, 08 Mar 2026 11:37:13 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1772962633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=S/r9PCn8BYar9PQMJ6kEVFBc4AU+ZARULHnfZ+N64cg=;
	b=uR7WcO+JsCZ1ogK3Gz8yHVdlHdcP0AgK7xGi5cvknQbyTGkWcsKwVoZrSMa5i3TGZQGP+Y
	c9zVfL60gnYhy2Nsofd+Ad90WyDqRtHNVMukRdg99EZcLJ9MjhNotQEYUSlpGfyJeGwfLQ
	P6RCDdcZE9/2K/NBPuisz96chSXQNOXnQ3bK/XyAqYP3E94uAH8ATjhK1g1/1tKjgREM1/
	zUSuUv2z+9Nu8AmT02iWyHxKtSowVhmT8K4X3UxxImG2OJWtjwJrdaYsZMcqtmQoA7c1FD
	gsnCaeIGP8joraqsYdej79PSMUELdlXVGC9GMsHUX8Wa0M2hzudnyW6UOr3Uew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1772962633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=S/r9PCn8BYar9PQMJ6kEVFBc4AU+ZARULHnfZ+N64cg=;
	b=tm/jZ1saPW4+dNni6CNbXnqKUtDlcVyN8TRlEAPvWZM6kdNBBdM+cu0G3X3eAvnC7/tRgW
	l4WAudHcCp1uqdekjH9KwsmYeUzJj5gpKyxlUp+L57pEUv6FFthJM1PmB+osMExjNS3Nfj
	UiyAERRGXg/Y2oEZR6iCEHWfo2Ep7f5PX/IvU19pATD4lSKioceOVuyxeoy3NuQCGThYLb
	/YrqFH0ELSEOLl8eXMdGADePUU3kiLfLi/9r0DTz6kNGeVQwoLtwJOtwnLauwmRbaq2P67
	gpBotUUiK/IhJXFlvNnYfJnVFsvCw479JwxhFA6ezFggMD8d86HeID6hybSVsQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1772962633;
	b=Bn19kE3gY9vBGThhM4g3pv040N0u+5E21tL3ikhVdmzazfzd1g5h1lj/qai9f+ANayQVha
	uP+Ou8FDC3Yg2wE6wTRJCGVHNg/bzNSvhxLDU0i3EgZX94XL1UmV2la7Qij+hgUUsZHrEf
	oSxYklTMc0+h/nMRd4G5xsr9G2D7C8iXRAS5xxw01k91jhNvKsySi0O2a5YqFCtk+jUlxM
	Lzh19a/ZHc2M84jfzDvaZmNBkUWy4oDWaC52oyvFSZl3dh0ao1yT9fitwF6y3+ae4YWsb7
	Ll7R4bf0QovYiN1WWX53kK74QzuiYj//t3UeqHHKHqfxvS1eNHkf6Lh6IhgYFg==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 673E8634C50;
	Sun, 08 Mar 2026 11:37:09 +0200 (EET)
Date: Sun, 8 Mar 2026 11:37:09 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT FIXES FOR 7.0] V4L2 driver and MC fixes
Message-ID: <aa1DRVSSfgofrb3g@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 1C95C22F386
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-54866-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iki.fi];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.960];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,valkosipuli.retiisi.eu:mid]
X-Rspamd-Action: no action

Hi Hans, Mauro,

Please pull.


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-7.0-1-signed

for you to fetch changes up to 7cb1c8ddc02d753782329674f1172cdc53291895:

  media: rockchip: rkcif: Add missing MUST_CONNECT flag to pads (2026-03-06 18:48:57 +0200)

----------------------------------------------------------------
V4L2 fixes for v7.0
- Synopsys csi2rx driver fixes
- MC request API fix
- Rockchip rkcif driver fixes

----------------------------------------------------------------
Dan Carpenter (1):
      media: rockchip: rkcif: fix off by one bugs

Dang Huynh (1):
      media: rockchip: rkcif: Add missing MUST_CONNECT flag to pads

Michael Riesch (3):
      media: rockchip: rkcif: comply with minimum number of buffers requirement
      media: synopsys: csi2rx: fix out-of-bounds check for formats array
      media: synopsys: csi2rx: add missing kconfig dependency

Yuchan Nam (1):
      media: mc, v4l2: serialize REINIT and REQBUFS with req_queue_mutex

 drivers/media/mc/mc-request.c                      |  5 +++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 10 ++---
 .../platform/rockchip/rkcif/rkcif-interface.c      |  3 +-
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 46 +++++++++++-----------
 drivers/media/platform/synopsys/Kconfig            |  1 +
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |  5 ++-
 7 files changed, 40 insertions(+), 32 deletions(-)

-- 
Kind regards,

Sakari Ailus

