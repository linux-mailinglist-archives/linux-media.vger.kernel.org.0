Return-Path: <linux-media+bounces-62389-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB3xBuZFDmoM9gUAu9opvQ
	(envelope-from <linux-media+bounces-62389-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:38:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8500D59CD39
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51E9B302DF47
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 23:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B0D3CA4A0;
	Wed, 20 May 2026 23:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P9FQuAHo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B71E3C2777
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 23:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320289; cv=none; b=LmyZeD488SEeMTc45g0rt5KCWSKeOWGn4YFqEdnFCcrq8VwvZhrfu1PHQHAAAZ1uyzH4RUAV243E6xrMqG/CRV/L64QrzpH42I2+289i2jnsNq6rEjl9+YmofBm2dg1XCHnWKv4G5NfCb5VyIbVJAfh3OtneAwociJCrVJDpWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320289; c=relaxed/simple;
	bh=PlVMTkUsNXhoH2qVoaC/wv924wmYLIbgDkafgfk3MTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ktKagJHLdt6u3T8h5OV3y0cYcW8HgRuiuUVkPxVo9zkLGaYFuGXN7NeDueRoTtIOAHB8vB2GhMqrOrx/jDSjCQYoVPZGF3Tpy2uig+44QB+vUALC5mBe/fvq11y3ljWFcoy2TSiHBKd/eR3jCnqgX10oV4srgAcbb/nDPYhMFAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P9FQuAHo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EF65268;
	Thu, 21 May 2026 01:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779320272;
	bh=PlVMTkUsNXhoH2qVoaC/wv924wmYLIbgDkafgfk3MTU=;
	h=Date:From:To:Cc:Subject:From;
	b=P9FQuAHosr+34TqBwc4Yu0ZgaQMf+swPwlQcAshnv/PpvbCwmmJmdMpywMsfOPsn/
	 Oin6m1iDVBVVkBO2vddlEopNpI1QhpnhaEhRrwv24n0YEpNnZk45rqtF/xpRF5EzeA
	 bQ3wXajse140I9BcdeDCwNpWWAlpmf27Z02DjDhc=
Date: Thu, 21 May 2026 01:38:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Xiaolei Wang <xiaolei.wang@windriver.com>
Subject: [GIT PULL FOR v7.2] Changes to NXP camera drivers
Message-ID: <20260520233805.GA105569@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62389-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 8500D59CD39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

The following changes since commit c2d1a2130c93f6d758af58590b86b2254c7a1dec:

  media: vivid: check for vb2_is_busy() when toggling caps (2026-05-20 16:00:40 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20260521

for you to fetch changes up to 527e608bfb51a8c574fd8807501b29f8e2ff1af7:

  media: nxp: imx8-isi: Fix scale factor calculation for hardware rounding (2026-05-21 00:50:10 +0200)

CI pipeline: https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/pipelines/1671358

----------------------------------------------------------------
Changes to NXP camera drivers

- imx8-isi: Resource management fixes in error paths
- imx8-isi: Lower latency at stream start
- imx8-isi: Fix downscaling configuration
- rkisp1: Support chromatic aberration correction
- Various minor improvements and fixes

----------------------------------------------------------------
Barnabás Pőcze (1):
      media: rkisp1: Add support for CAC

Guoniu Zhou (3):
      media: nxp: imx8-isi: Prioritize pending buffers over discard buffers
      media: nxp: imx8-isi: Fix potential out-of-bounds issues
      media: nxp: imx8-isi: Fix scale factor calculation for hardware rounding

Laurent Pinchart (2):
      media: mc-entity: Fix documentation typo in function name
      media: mc-entity: Drop ifdef for media_entity_cleanup definition

Niklas Söderlund (1):
      media: uapi: rkisp: Correct name version enum

Xiaolei Wang (4):
      media: nxp: imx8-isi: Fix use-after-free on remove
      media: nxp: imx8-isi: Add missing v4l2_subdev_cleanup() in crossbar and pipe
      media: nxp: imx8-isi: Fix missing v4l2_subdev_cleanup() in pipe init error path
      media: nxp: imx8-isi: Clean up already-initialized pipes on probe failure

 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |   4 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  16 +++
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |   9 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  11 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  20 ++--
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |   6 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |  68 +++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  15 ++-
 include/media/media-entity.h                       |  10 +-
 include/uapi/linux/rkisp1-config.h                 | 113 ++++++++++++++++++++-
 11 files changed, 248 insertions(+), 25 deletions(-)

-- 
Regards,

Laurent Pinchart

