Return-Path: <linux-media+bounces-56760-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIawFMyAwWmcTgQAu9opvQ
	(envelope-from <linux-media+bounces-56760-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 19:05:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A78B72FAD89
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 19:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D32A32133EE
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 16:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04CA3C3421;
	Mon, 23 Mar 2026 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fT+X33eZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D773C1960
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284096; cv=none; b=BmZVpfSyT98JlEHG1R4atebUJ8NCq/7fEcoDeNx7ZgtKi2r83telKKTmnY/msNVDb8nS8EWd72cGUXOzTsSo6Z6azSQ1y2kD82jClRTTrAkbppuOw8BaecKVjeUbcxwnCX61kAq5k5tOBnyMpF9Fqv/SqbpOdYhjIFxNMuuRQRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284096; c=relaxed/simple;
	bh=rTPT7wF2/rVw+ApfSpUf6wxGQhfaUC5T3tmuUuBD2IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kWpJn49c/O8GuFu0Iat5YbyYR5RhZL/QIG1IG0Acw4X7AnB3LF7TqG9oHVWMmaWQbPuLngFRD3BacnYxzAtZaTf5iAUM6jNaxncTgMhV7MCnAG6tZbOfbIX6/LFnfSGQnZ0V9dD7JQEfaznORdmARQuocdK/pR2yoRhkR20PlqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fT+X33eZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D1C9F189C;
	Mon, 23 Mar 2026 17:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774284017;
	bh=rTPT7wF2/rVw+ApfSpUf6wxGQhfaUC5T3tmuUuBD2IQ=;
	h=Date:From:To:Cc:Subject:From;
	b=fT+X33eZRbrDWw7/U52kPw+zCuTaIlup5j6IHWE65lO0u9t1Z+x7uJWX1Sal6yxAB
	 t1WyVcaATdRxdi7T3eDzU2DnZNcy0yuEVMfegnKPm26riBlb5btJ0xKLFqnaHbMV+c
	 zs1HiAykxjfOXOOca4tbeHtqoUAX2+qIytpAfHIQ=
Date: Mon, 23 Mar 2026 18:41:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v7.1] media: Renesas drivers enhancements
Message-ID: <20260323164132.GA2282573@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-56760-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: A78B72FAD89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

The following changes since commit 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67:

  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30 (2026-03-19 08:18:36 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-renesas-20260323

for you to fetch changes up to d1a87fcfd364b7f02d8373d3c71e4985be0c3b58:

  media: renesas: vsp1: Fix NULL pointer deref on module unload (2026-03-23 17:48:07 +0200)

----------------------------------------------------------------
- vsp1: V4L2 compliance fixesand NULL pointer dereference fixes

----------------------------------------------------------------
Laurent Pinchart (13):
      media: renesas: vsp1: Store supported media bus codes in vsp1_entity
      media: renesas: vsp1: Store size limits in vsp1_entity
      media: renesas: vsp1: Fix code checks in frame size enumeration
      media: renesas: vsp1: rpf: Fix crop left and top clamping
      media: renesas: vsp1: rpf: Fix crop width and height clamping
      media: renesas: vsp1: rwpf: Fix media bus code and frame size enumeration
      media: renesas: vsp1: brx: Fix format propagation
      media: renesas: vsp1: hsit: Fix size enumeration
      media: renesas: vsp1: histo: Fix code enumeration
      media: renesas: vsp1: histo: Fix size enumeration
      media: renesas: vsp1: histo: Fix format setting
      media: renesas: vsp1: Implement control events
      media: renesas: vsp1: Initialize format on all pads

Tomi Valkeinen (1):
      media: renesas: vsp1: Fix NULL pointer deref on module unload

 drivers/media/platform/renesas/vsp1/vsp1_brx.c    |  37 ++++---
 drivers/media/platform/renesas/vsp1/vsp1_clu.c    |  47 ++------
 drivers/media/platform/renesas/vsp1/vsp1_drv.c    |   8 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.c | 112 +++++++++----------
 drivers/media/platform/renesas/vsp1/vsp1_entity.h |  21 ++--
 drivers/media/platform/renesas/vsp1/vsp1_histo.c  |  97 ++++++++++++-----
 drivers/media/platform/renesas/vsp1/vsp1_histo.h  |   2 -
 drivers/media/platform/renesas/vsp1/vsp1_hsit.c   |  61 ++++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_iif.c    |  39 ++-----
 drivers/media/platform/renesas/vsp1/vsp1_lif.c    |  40 ++-----
 drivers/media/platform/renesas/vsp1/vsp1_lut.c    |  47 ++------
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c    |   7 +-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c   | 127 +++++++++++++++++-----
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h   |   6 +-
 drivers/media/platform/renesas/vsp1/vsp1_sru.c    |  63 +++++------
 drivers/media/platform/renesas/vsp1/vsp1_uds.c    |  62 +++++------
 drivers/media/platform/renesas/vsp1/vsp1_uif.c    |  40 ++-----
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c    |  13 ++-
 18 files changed, 448 insertions(+), 381 deletions(-)

-- 
Regards,

Laurent Pinchart

