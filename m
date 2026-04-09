Return-Path: <linux-media+bounces-58367-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E75FIng12kVUQgAu9opvQ
	(envelope-from <linux-media+bounces-58367-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 19:23:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A65103CE13A
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 19:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CE5B309F3DE
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 17:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF5C3E276A;
	Thu,  9 Apr 2026 17:17:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCF43E1D1B
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 17:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775755075; cv=none; b=G32sggJVqiAqqXIPEkKN9bvoUI5aJVgT7vWd++x2WNvhfbbOaQULmmWfhvwmLFlbENr47vSAKg/k9yjAKJ0w3CNPzIaTxqyjV8HWxtY4RjtuIzEopxVwAGCs5XZPWDHRlZqlP5EM0iu4cmqJeXF7/j7F7qDXg05Q9pUCksXIaQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775755075; c=relaxed/simple;
	bh=j0xqAFcXy+y97lgyV3KGv9q3LpnMFE0VPGGc/x2XZ3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZPMyT/45Z86HGe8eFXE/Az6m82heTyuaEP5iyx1kG4NDCHbUD4R8ZLZ6Pb+mwM8HoeijcdszeUG4VAZ+wZ/akqkc8Wr9ALTXLXs8VhZswkwIPkupP+viIDWvpnuEEifP1OUqpChCEJzEqCeQt0SwIiyYpNKMNBLbMLVntEgtXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wAt0g-0004hp-82; Thu, 09 Apr 2026 19:17:42 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wAt0f-004YXC-2f;
	Thu, 09 Apr 2026 19:17:41 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wAt0f-0000000H9Cg-2yeW;
	Thu, 09 Apr 2026 19:17:41 +0200
Date: Thu, 9 Apr 2026 19:17:41 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/3] media: imx-csi: cleanup media pipeline start
Message-ID: <adffNaI6hQbc1mAO@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-staging@lists.linux.dev
References: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
 <aXOoc0lvAtPt0fAL@pengutronix.de>
 <aco5Ei1B4vJWKMMj@pengutronix.de>
 <acqK9Ms_eRxg59Xa@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <acqK9Ms_eRxg59Xa@lizhi-Precision-Tower-5810>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-58367-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,pengutronix.de:mid,msgid.link:url]
X-Rspamd-Queue-Id: A65103CE13A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

On Mon, 30 Mar 2026 10:38:44 -0400, Frank Li wrote:
> On Mon, Mar 30, 2026 at 10:49:22AM +0200, Michael Tretter wrote:
> > Hi Hans,
> >
> > On Fri, 23 Jan 2026 17:57:23 +0100, Michael Tretter wrote:
> > > On Thu, 18 Dec 2025 10:23:48 +0100, Michael Tretter wrote:
> > > > The imx media device currently assumes that there is only a single media
> > > > pipeline. However, the media graph has multiple imx capture devices.
> > > > These may be started separately on media pipelines if they don't cause
> > > > conflicts in the media graph.
> > > >
> > > > Move the media pipeline from the media device to the capture devices to
> > > > properly track and handle multiple media pipelines for the imx-csi.
> > > > Refactor the code to start the media pipeline from the driver to help
> > > > the reader.
> > >
> >
> > Could you take a look and apply this series for the imx-media driver,
> > too? The patches are already reviewed by Frank Li and Philipp Zabel.
> 
> Michael Tretter:
> 
> Sorry, I will take care imx's stage driver. I already sent pull-request,
> which included your other two patches.

Thanks for taking care! I found the other two patches in the
media-committers repository.

> 
> Do you have others patches, which need me take care. I am not sure if
> there are chance to send 2nd pull request for 7.1.

Currently, I have only the patches in this series.

Michael

> > >
> > > >
> > > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > > ---
> > > > Changes in v2:
> > > > - Improve code readability in Patch 2
> > > > - Update commit message of Patch 3 as suggested by Frank Li
> > > > - Link to v1: https://patch.msgid.link/20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de
> > > >
> > > > ---
> > > > Michael Tretter (3):
> > > >       media: imx-csi: move media_pipeline to video device
> > > >       media: imx-csi: explicitly start media pipeline on pad 0
> > > >       media: imx-csi: use media_pad_is_streaming helper
> > > >
> > > >  drivers/staging/media/imx/imx-media-capture.c |  8 ++++----
> > > >  drivers/staging/media/imx/imx-media-utils.c   | 12 ++++++++----
> > > >  drivers/staging/media/imx/imx-media.h         |  7 ++++---
> > > >  3 files changed, 16 insertions(+), 11 deletions(-)
> > > > ---
> > > > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > > > change-id: 20251107-media-imx-cleanup-9022d941ae44

