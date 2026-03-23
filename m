Return-Path: <linux-media+bounces-56697-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EDwFmMgwWmTQwQAu9opvQ
	(envelope-from <linux-media+bounces-56697-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:13:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8C42F0FA5
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4247A3019FF9
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A73F370D62;
	Mon, 23 Mar 2026 11:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mt+0PV4W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2822935F169
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263975; cv=none; b=r/tKIFAM4ghxUeg6NmC0ZIJoo1Noeg5c71Ui+9/3Nvej6hjngEJmW8NBpPlrmLoY4tqzA0uB82f7L047BfYrLsYGncW80EXXPE6Po+ZijGuEopTTYMH7/JSD5c3vp8QZDlFiYeILeC5fLcym0Iyq5ZTk2Snf90sbdJ9C5eyhXv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263975; c=relaxed/simple;
	bh=IqqGdYt8q45+veHzHvHoMQXSKAG0fmpJDQr8axr0HR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ow1tsXzL0vMzJNgAVEkp8erlfkJZeZWzXAvSCbHfmZ5WI9thjeBED0SVx8Evs+7mu39tH3AuzxJ3TMgHN5j36/3TVl1HZFwPYTZb60vuWGorhC934nroWY/WpOKQCf9+NaNGTdR/mnSTWISqsjSwbYKB7l41O88lQW+aqtAKhhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mt+0PV4W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EA06F591;
	Mon, 23 Mar 2026 12:04:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774263896;
	bh=IqqGdYt8q45+veHzHvHoMQXSKAG0fmpJDQr8axr0HR8=;
	h=Date:From:To:Cc:Subject:From;
	b=Mt+0PV4W0m3y7pH9pSxuCoM/IIdIyPtVO6qkpBhcrtW96DOOXP85gRW1G3L/u0Mms
	 VDU6TRoNk15U17ZDISBJtWn0XSjxaDapM43yxCGPnR2SfYTJmIJXaPo4Vmz+PQiUtB
	 5945RQqJQyb9Zrx2ugfEqSYbJUigl4z97rCjq5sg=
Date: Mon, 23 Mar 2026 13:06:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	linux-media@vger.kernel.org
Subject: [GIT PULL FOR v7.1] media: NXP drivers changes
Message-ID: <20260323110610.GA2191129@killaraus.ideasonboard.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sin.lore.kernel.org:server fail,killaraus.ideasonboard.com:server fail,ideasonboard.com:server fail,gitlab.freedesktop.org:server fail];
	TAGGED_FROM(0.00)[bounces-56697-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 4E8C42F0FA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

The following changes since commit 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67:

  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30 (2026-03-19 08:18:36 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/media-net-nxp-20260323

for you to fetch changes up to d304e9dd3f90a3a2e30dfc3c6e54a1566375e3ee:

  media: imx8mq-mipi-csi2: Add support for i.MX8ULP (2026-03-23 12:44:01 +0200)

----------------------------------------------------------------
- dw100: Requests support, PREEMPT_RT fix
- imx8-isi: Reduce minimum number of buffers, i.MX95 support
- imx8mq-mipi-csi2: i.MX8ULP support
- rkisp1: V4L2 compliance fix

----------------------------------------------------------------
Frank Li (1):
      media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers

Guoniu Zhou (8):
      media: nxp: imx8-isi: Reduce minimum queued buffers from 2 to 0
      media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI compatible string
      media: nxp: imx8-isi: Keep the default value for BLANK_PXL field
      media: nxp: imx8-isi: Add ISI support for i.MX95
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8ULP compatible string
      media: imx8mq-mipi-csi2: Use devm_clk_bulk_get_all() to fetch clocks
      media: imx8mq-mipi-csi2: Explicitly release reset
      media: imx8mq-mipi-csi2: Add support for i.MX8ULP

Stefan Klug (4):
      media: dw100: Implement V4L2 requests support
      media: dw100: Implement dynamic vertex map update
      media: dw100: Fix kernel oops with PREEMPT_RT enabled
      media: dw100: Merge dw100_device_run and dw100_start

Tarang Raval (1):
      media: rkisp1: Fix enum_framesizes accepting invalid pixel formats

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  27 ++++-
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  49 +++++++-
 drivers/media/platform/nxp/dw100/dw100.c           | 134 ++++++++++++++-------
 drivers/media/platform/nxp/imx-mipi-csis.c         |  31 +++--
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  12 ++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |   6 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |   2 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |  92 +++++++-------
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |   3 +
 10 files changed, 236 insertions(+), 121 deletions(-)

-- 
Regards,

Laurent Pinchart

