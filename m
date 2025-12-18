Return-Path: <linux-media+bounces-49058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9397CCB13D
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 10:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E4C43025731
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 09:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FEA2F533E;
	Thu, 18 Dec 2025 09:09:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEE1303A1E
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766048967; cv=none; b=GJaR3OwqrcuaXrH4GYG+xtgns0Kwlvn9IjNNKIS3fyYtMnPjiumLZDaKziBn4yr/zNBkJXLhfbls+LrEQbn8jjGsceQ+8stZ1gT7J1MWQOF7iRy/q7do2FDFrHfgaYG5pJM2oaYBeae6mDWq8XBjtgBtxBWMHE0ZjVunatrmznA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766048967; c=relaxed/simple;
	bh=JLOsRuLJC0lQwq8IdJlieAKJlWnRllG5tdlb00mT5Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I05RRA01M4sen0QJjelvRCFPIbWAJiSVGhB2ZlmrivNcccDvnhVWejlRFq3YtfJYxobfP0yKmq0UXUdsF2ziHI3tAutZLpXyDKaTtNkF32bvPRz0KaLq/9urlTuX9BD7A+PPR1HuFjU/8GKAcFdaDEXh7HQK2BX2RHdAZBY+VeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vWA0S-0000bE-Cz; Thu, 18 Dec 2025 10:09:08 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vWA0R-006FaQ-1N;
	Thu, 18 Dec 2025 10:09:07 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vWA0R-00EXba-0t;
	Thu, 18 Dec 2025 10:09:07 +0100
Date: Thu, 18 Dec 2025 10:09:07 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 0/2] media: staging: imx: fix multiple video input
Message-ID: <aUPEs4wUHgAyMrPX@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
References: <20251107-media-imx-fixes-v2-0-07d949964194@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107-media-imx-fixes-v2-0-07d949964194@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Fri, 07 Nov 2025 11:34:32 +0100, Michael Tretter wrote:
> If the IMX media pipeline is configured to receive multiple video
> inputs, the second input stream may be broken on start. This happens if
> the IMX CSI hardware has to be reconfigured for the second stream, while
> the first stream is already running.
> 
> The IMX CSI driver configures the IMX CSI in the link_validate callback.
> The media pipeline is only validated on the first start. Thus, any later
> start of the media pipeline skips the validation and directly starts
> streaming. This may leave the hardware in an inconsistent state compared
> to the driver configuration. Moving the hardware configuration to the
> stream start to make sure that the hardware is configured correctly.
> 
> Patch 1 removes the caching of the upstream mbus_config in
> csi_link_validate and explicitly request the mbus_config in csi_start,
> to get rid of this implicit dependency.
> 
> Patch 2 actually moves the hardware register setting from
> csi_link_validate to csi_start to fix the skipped hardware
> reconfiguration.

Gentle ping.

Michael

> 
> Signed-off-by: Michael Tretter <michael.tretter@pengutronix.de>
> ---
> Changes in v2:
> - Document changed locking in commit message
> - Link to v1: https://lore.kernel.org/r/20251105-media-imx-fixes-v1-0-99e48b4f5cbc@pengutronix.de
> 
> ---
> Michael Tretter (2):
>       media: staging: imx: request mbus_config in csi_start
>       media: staging: imx: configure src_mux in csi_start
> 
>  drivers/staging/media/imx/imx-media-csi.c | 84 ++++++++++++++++++-------------
>  1 file changed, 48 insertions(+), 36 deletions(-)
> ---
> base-commit: 27afd6e066cfd80ddbe22a4a11b99174ac89cced
> change-id: 20251105-media-imx-fixes-acef77c7ba12

