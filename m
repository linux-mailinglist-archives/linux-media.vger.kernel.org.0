Return-Path: <linux-media+bounces-51180-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMG9AWc3cGmWXAAAu9opvQ
	(envelope-from <linux-media+bounces-51180-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 03:18:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A9D4FA49
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 03:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A997BB805CF
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 02:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06622326D65;
	Wed, 21 Jan 2026 02:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YHBT0vTR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D3F25B663;
	Wed, 21 Jan 2026 02:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768961852; cv=none; b=pM/gfoUwYttfqrCst1RvF/ye2PXJSUdoFGUAco3ur7B19LC2PundsFt9fq4tYbUaeACht7gmF4Qc8JcNksgpoBVb1kgirpu1nzqj9HXcgCmziqEraejFg2qfHE4nFHfVOvj9wGMAhF6B5HkIDaoIX00+AWywDuUQzcB/eMKrKW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768961852; c=relaxed/simple;
	bh=l0aUY0/1BbKSc3HEsxELZqYEPEPlOw016Ycg7UMubsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c26I/V2qzAru0k4uoS/LJe7Fnz6gUUj/Oe4hGAixOdlvzBmIxQ4V1/6zpV285Pq5VHdN0uLDLyqtNLRQ8T+heKfHqMJXb3icUCurJ1SkWqxWi+LlbGUbwETYnlI0TqiLEzEDSoZ5153lasYFFvOKPCvFSOjESSIP4th9dA8biU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YHBT0vTR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D5BA32D7;
	Wed, 21 Jan 2026 03:16:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768961818;
	bh=l0aUY0/1BbKSc3HEsxELZqYEPEPlOw016Ycg7UMubsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YHBT0vTRvJYrmzDfPlUwurx9+clUr8Ml34BMXzZHPheQ3SkaxoQAh6F8xX8DE1dK4
	 cCwAbUc6T04GdS6+f5z+PpKv3NtEvq8gfyhcvKGpCcNApP3zuajOAqLfv9pFp8JAMJ
	 Kc1aptHZSLk774A3byJ5qKmMCR2pE8gvNm6eEL/E=
Date: Wed, 21 Jan 2026 04:17:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 0/5] media: staging: media: imx6-mipi-csi2:
 trivial cleanup to prepare convert to common dw mipi csi2
Message-ID: <20260121021728.GI403250@killaraus>
References: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51180-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,pengutronix.de,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,nxp.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 65A9D4FA49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Jan 16, 2026 at 11:17:55AM -0500, Frank Li wrote:
> Previous https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/
> There are too much patches (32) in above thread.
> 
> Just extract first 6 cleanup patches to review easily. The overall road
> map see above 32 patch serise.

I've applied 1/5, 2/5 and 5/5 to my tree.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - collect review by tags
> - drop media: staging: media: imx6-mipi-csi2: use devm_add_action_or_reset() to simplify code
>   need more time to understand nf_unregister() and subdev_unregister()'s relationship.
> - detail change see each patch's change log
> - move devm_mutex_init() patch to second one
> - Link to v1: https://lore.kernel.org/r/20251107-stage-csi2-cleanup-v1-0-5d42535243ac@nxp.com
> 
> ---
> Frank Li (5):
>       media: staging: media: imx6-mipi-csi2: replace spaces with tabs for alignment
>       media: staging: media: imx6-mipi-csi2: use devm_mutex_init() to simplify code
>       media: staging: media: imx6-mipi-csi2: use devm_clk_bulk_get_all() to fetch clocks
>       media: staging: media: imx6-mipi-csi2: use guard() to simplify code
>       media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_resource() simplify code
> 
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 209 +++++++++++------------------
>  1 file changed, 80 insertions(+), 129 deletions(-)
> ---
> base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
> change-id: 20251106-stage-csi2-cleanup-6db1715fd187

-- 
Regards,

Laurent Pinchart

