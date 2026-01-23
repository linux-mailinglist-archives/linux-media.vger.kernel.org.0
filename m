Return-Path: <linux-media+bounces-51436-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nRxnHOWoc2nOxwAAu9opvQ
	(envelope-from <linux-media+bounces-51436-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 17:59:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5957B78B7C
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 17:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 332783006222
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 16:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D7C311964;
	Fri, 23 Jan 2026 16:59:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD412FF155
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769187551; cv=none; b=PdtyUktQxTrLVzTk02xhx6TvrLxL7+//PzErYt8nAiJqZ3I9rsb3nozPHke2NjNoUgFOfrWe+vbeGQ+zrX3KW0zJEsJvzIwTDKJTJ+YOZ9qd1bJT6DmkULl7HhRLmCAnnTJsMW5xL44FYWFx1Jf2DNU1g0bdMxjy0r8XvLlO+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769187551; c=relaxed/simple;
	bh=tIbHyyCJjgPdT9x/qi7cfGnXl+ngSC4bNv6F8VAXN/0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFPakkUV738vSeTemht7pWpz4RssUGNbWyHgYDUEpVoOmF2d9L5JblwuJme2pPA1fqzU+6iGJ0SOhFE4c6Lcje1hmaHk9Lzs1nAPxzuk4VTadFKFPhhPRsDVSBMpilJbq/M8W38bb2JjKowNUeXJGC+mx5hgGxrsVGRQVeXyc30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vjKUs-0003bz-UX; Fri, 23 Jan 2026 17:58:58 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vjKUs-0027qZ-1F;
	Fri, 23 Jan 2026 17:58:57 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vjKUr-00B4rI-1y;
	Fri, 23 Jan 2026 17:58:57 +0100
Date: Fri, 23 Jan 2026 17:58:57 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 0/2] media: staging: imx: fix multiple video input
Message-ID: <aXOo0cc07cRi7-rF@pengutronix.de>
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
 <aUPEs4wUHgAyMrPX@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aUPEs4wUHgAyMrPX@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51436-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,kernel.org,cisco.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: 5957B78B7C
X-Rspamd-Action: no action

On Thu, 18 Dec 2025 10:09:07 +0100, Michael Tretter wrote:
> On Fri, 07 Nov 2025 11:34:32 +0100, Michael Tretter wrote:
> > If the IMX media pipeline is configured to receive multiple video
> > inputs, the second input stream may be broken on start. This happens if
> > the IMX CSI hardware has to be reconfigured for the second stream, while
> > the first stream is already running.
> > 
> > The IMX CSI driver configures the IMX CSI in the link_validate callback.
> > The media pipeline is only validated on the first start. Thus, any later
> > start of the media pipeline skips the validation and directly starts
> > streaming. This may leave the hardware in an inconsistent state compared
> > to the driver configuration. Moving the hardware configuration to the
> > stream start to make sure that the hardware is configured correctly.
> > 
> > Patch 1 removes the caching of the upstream mbus_config in
> > csi_link_validate and explicitly request the mbus_config in csi_start,
> > to get rid of this implicit dependency.
> > 
> > Patch 2 actually moves the hardware register setting from
> > csi_link_validate to csi_start to fix the skipped hardware
> > reconfiguration.
> 
> Gentle ping.

Is there anything still missing to get these patches applied?

Michael

> > 
> > Signed-off-by: Michael Tretter <michael.tretter@pengutronix.de>
> > ---
> > Changes in v2:
> > - Document changed locking in commit message
> > - Link to v1: https://lore.kernel.org/r/20251105-media-imx-fixes-v1-0-99e48b4f5cbc@pengutronix.de
> > 
> > ---
> > Michael Tretter (2):
> >       media: staging: imx: request mbus_config in csi_start
> >       media: staging: imx: configure src_mux in csi_start
> > 
> >  drivers/staging/media/imx/imx-media-csi.c | 84 ++++++++++++++++++-------------
> >  1 file changed, 48 insertions(+), 36 deletions(-)
> > ---
> > base-commit: 27afd6e066cfd80ddbe22a4a11b99174ac89cced
> > change-id: 20251105-media-imx-fixes-acef77c7ba12

