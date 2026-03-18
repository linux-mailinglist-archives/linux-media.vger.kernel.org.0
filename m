Return-Path: <linux-media+bounces-56205-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIncAIKUumnSXgIAu9opvQ
	(envelope-from <linux-media+bounces-56205-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 13:03:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CF82BB32A
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 13:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 833E930ADD42
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25D6378D65;
	Wed, 18 Mar 2026 12:01:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083E33624CE
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 12:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835278; cv=none; b=dYPKdslgNicxH9xdprIaYxcXED+K5e8yVMdll7X0OLPsmo31wZDGwJysJtZOJjFsVAFuuXXZYiPf3HpTillfBsGUNSyctaOJRIwIr11BdJ1bLlVfeZpB4pkCUHH3U2k/nJTfMiUujUrqf4qf6tSwvXjFcbrRcndxYhl9JqUi9nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835278; c=relaxed/simple;
	bh=UcKPui/fl8U8QNFeN56BYzV8cyKms7/n3Z4Z0a/aVbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXeJoc2UVQcgQBaqZ7w3z2pehrxFflPnCOAtoQus24WDa3LWK6eRwCHsfsOj9dw3JASlLPPf9DoVVUFY4AZHXfIZ4dsIQLqbj/mivxh1ubcuyqL3b46U9QZ1+74Y6L9Gsn3ihqfjb9k3rLBKpuqy06peEc8Ef5iW352v8H12Q1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1w2paC-0004ZJ-N1; Wed, 18 Mar 2026 13:01:04 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1w2paC-000tur-1G;
	Wed, 18 Mar 2026 13:01:04 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1w2paC-000000099ZW-1872;
	Wed, 18 Mar 2026 13:01:04 +0100
Date: Wed, 18 Mar 2026 13:01:04 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v2 0/2] media: staging: imx: fix multiple video input
Message-ID: <abqUAKj83Xaz0RzM@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>
References: <20251107-media-imx-fixes-v2-0-07d949964194@pengutronix.de>
 <aUPEs4wUHgAyMrPX@pengutronix.de>
 <aXOo0cc07cRi7-rF@pengutronix.de>
 <aXPNRbXBt2PRdFe4@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aXPNRbXBt2PRdFe4@lizhi-Precision-Tower-5810>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,pengutronix.de,kernel.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	TAGGED_FROM(0.00)[bounces-56205-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.970];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,pengutronix.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 01CF82BB32A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent, hi Hans,

On Fri, 23 Jan 2026 14:34:29 -0500, Frank Li wrote:
> On Fri, Jan 23, 2026 at 05:58:57PM +0100, Michael Tretter wrote:
> > On Thu, 18 Dec 2025 10:09:07 +0100, Michael Tretter wrote:
> > > On Fri, 07 Nov 2025 11:34:32 +0100, Michael Tretter wrote:
> > > > If the IMX media pipeline is configured to receive multiple video
> > > > inputs, the second input stream may be broken on start. This happens if
> > > > the IMX CSI hardware has to be reconfigured for the second stream, while
> > > > the first stream is already running.
> > > >
> > > > The IMX CSI driver configures the IMX CSI in the link_validate callback.
> > > > The media pipeline is only validated on the first start. Thus, any later
> > > > start of the media pipeline skips the validation and directly starts
> > > > streaming. This may leave the hardware in an inconsistent state compared
> > > > to the driver configuration. Moving the hardware configuration to the
> > > > stream start to make sure that the hardware is configured correctly.
> > > >
> > > > Patch 1 removes the caching of the upstream mbus_config in
> > > > csi_link_validate and explicitly request the mbus_config in csi_start,
> > > > to get rid of this implicit dependency.
> > > >
> > > > Patch 2 actually moves the hardware register setting from
> > > > csi_link_validate to csi_start to fix the skipped hardware
> > > > reconfiguration.
> > >
> > > Gentle ping.
> >
> > Is there anything still missing to get these patches applied?

I'm not entirely sure, who is responsible for applying patches for
media-imx. You handled the last few patches for this driver. Maybe you
could apply these patches, too?

I also sent another series [0] for media-imx. Can you handle this other
series, as well?

Michael

[0] https://lore.kernel.org/linux-media/20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de/

> > > >
> > > > Signed-off-by: Michael Tretter <michael.tretter@pengutronix.de>
> > > > ---
> > > > Changes in v2:
> > > > - Document changed locking in commit message
> > > > - Link to v1: https://lore.kernel.org/r/20251105-media-imx-fixes-v1-0-99e48b4f5cbc@pengutronix.de
> > > >
> > > > ---
> > > > Michael Tretter (2):
> > > >       media: staging: imx: request mbus_config in csi_start
> > > >       media: staging: imx: configure src_mux in csi_start
> > > >
> > > >  drivers/staging/media/imx/imx-media-csi.c | 84 ++++++++++++++++++-------------
> > > >  1 file changed, 48 insertions(+), 36 deletions(-)
> > > > ---
> > > > base-commit: 27afd6e066cfd80ddbe22a4a11b99174ac89cced
> > > > change-id: 20251105-media-imx-fixes-acef77c7ba12
> 

