Return-Path: <linux-media+bounces-65130-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m/zaE03jMmqJ6gUAu9opvQ
	(envelope-from <linux-media+bounces-65130-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 20:11:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4077669BE0D
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 20:11:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=hVi5hsz7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65130-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65130-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3EF863014264
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 18:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE1C377EC6;
	Wed, 17 Jun 2026 18:11:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01629378D64;
	Wed, 17 Jun 2026 18:11:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781719875; cv=none; b=b6qlFsE5em8R7RHdpnWcYq7hjM9uZzucNYgdYcfqRB7XshVmMG5fZQYAVJ2Q/X3lHDVFuIHlQ8DYsefnB9/C8WYx9YYkCpIdAxnRjmr4DunjHtNWtOEHW1iHaetbBmO+p87pHWXgdGwIfXo+pKY0mJxPrUq/XAD/doQPxt5J4Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781719875; c=relaxed/simple;
	bh=Z7z73Vx6mkRGNkH8EeUxS/CCZ1mzZNxlvdn2HLEWTQo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=diWQI8ah10nT4Yez8jrSDiKnx2eE5WizHxpCiKMMe0vY6Qd7sNR2YGaBqbvyrePpLBEH2YMlQgqJjVdPOAgciDRpJkggJWZAMPiSPGEQeBys/Uarb1qpjcwFWAJoaUOaQ3eDbiMxDdoqokVoZ4FJ3cc21eGcJ1jZ3wbIJ+FkGSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hVi5hsz7; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781719870;
	bh=Z7z73Vx6mkRGNkH8EeUxS/CCZ1mzZNxlvdn2HLEWTQo=;
	h=From:Subject:Date:To:Cc:From;
	b=hVi5hsz7e63rB4gVLSCgUy5meFM0i/5ti7SSV7bSlE+dahY0+pYoNGK4I+rS18xMv
	 LVutmxWKrB+LOpM2ntw/bcudTEi0oDfI5D0rm5Hh9BTp+qKkaGH2LedVv7jkRjdKC6
	 0Tqg6kJhurdf/CBxCpQ+8tBvrk2dDHCpRL4e+IHUAHIcXV0+thpMnFeIzUb25U8bmn
	 yg9QVOQR9DB3Wvnsf5mSDCQlMsMqDuJD7DqPzEckDBh6rmrzR5yc+z7b5d5YM/UvHx
	 DaUQW7GWfryu9lH6PvR7yvvAqibBjK8a932FaS8YsiAuXKxy3IDZRywC471a+gFrOD
	 /ENKuZLJiVovg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 716D417E0566;
	Wed, 17 Jun 2026 20:11:08 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 0/5] media: Add fdinfo support for v4l2 drivers
Date: Wed, 17 Jun 2026 14:10:55 -0400
Message-Id: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNyw6CMBBFf4XM2pp2MCCu/A/Doo+pjEFqWmw0h
 H8XMK5cnuTccydIFJkSnIoJImVOHIYFcFeA7fRwJcFuYUCJlayUFPnQo9DOCe948EHoupHekjY
 lNrCsHpE8v7bipf1yepob2XHNrEbHaQzxvV1mtXq/Ov7VsxJS1FiiUtrYY6XONvS9NiHqvQ13a
 Od5/gAQWHarxAAAAA==
X-Change-ID: 20260610-v4l2-add-fdinfo-a790fceab329
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Christopher Healy <healych@amazon.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:ezequiel@vanguardiasur.com.ar,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:detlev.casanova@collabora.com,m:linux-arm-kernel@lists.infradead.org,m:healych@amazon.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-65130-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,infradead.org:email,vger.kernel.org:from_smtp,collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime,msgid.link:url,sntech.de:email,checkpatch.pl:url,vanguardiasur.com.ar:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4077669BE0D

fdinfo is useful to poll information from the driver.
Unlike the ftrace interface, it lets userspace tools get a snapshot of
the state of the driver at their own pace, instead of getting events for
each driver status change.

This works better to get information like HW usage time or clock
frequencies, as well as memory usage.
This patch set focuses on mem2mem drivers that are per-frame based and
an implementation is proposed for the Verisilicon Hantro and Rockchip
rkvdec drivers, limited to main clock frequency and HW usage time.

To ease support in drivers, a v4l2_stats struct is added.
It stores statistics information and provides helper functions to write
the fdinfo file in a standard way.

An example of usage of this from userspace is implemented in v4l2top:

https://github.com/cazou/v4l2top (Check the upstream branch)

checkpatch.pl warning: The 2 arguments in the show_fdinfo callback
definition are kept unnamed to match with the rest of the struct
definition.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Changes in v2:
- Simplify key/value pairs by removing repeated <eng> suffix
- Add media type support
- Add v4l2_stats helpers
- Add support in rkvdec too
- Link to v1: https://patch.msgid.link/20260612-v4l2-add-fdinfo-v1-0-723211abc861@collabora.com

To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Detlev Casanova <detlev.casanova@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Christopher Healy (2):
      docs: media: add documentation for media client usage stats
      media: hantro: add per-context fdinfo usage stats

Detlev Casanova (3):
      media: v4l2: Add callback for show_fdinfo
      media: v4l2-core: Add v4l2-stats interface
      media: rkvdec: Add per-context fdinfo usage stats

 .../userspace-api/media/drivers/index.rst          |  1 +
 .../media/drivers/media-usage-stats.rst            | 85 ++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 19 +++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  1 +
 drivers/media/platform/verisilicon/hantro.h        |  3 +
 drivers/media/platform/verisilicon/hantro_drv.c    | 19 +++++
 drivers/media/v4l2-core/Makefile                   |  2 +-
 drivers/media/v4l2-core/v4l2-dev.c                 | 12 +++
 drivers/media/v4l2-core/v4l2-fh.c                  |  3 +
 drivers/media/v4l2-core/v4l2-stats.c               | 65 +++++++++++++++++
 include/media/v4l2-dev.h                           |  1 +
 include/media/v4l2-fh.h                            |  2 +
 include/media/v4l2-stats.h                         | 44 +++++++++++
 13 files changed, 256 insertions(+), 1 deletion(-)
---
base-commit: 66affa37cfac0aec061cc4bcf4a065b0c52f7e19
change-id: 20260610-v4l2-add-fdinfo-a790fceab329

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


