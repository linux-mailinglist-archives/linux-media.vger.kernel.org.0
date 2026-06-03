Return-Path: <linux-media+bounces-63619-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vkEkF508IGorzAAAu9opvQ
	(envelope-from <linux-media+bounces-63619-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:39:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 577C3638AFD
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:39:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=cSDYL0bx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63619-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63619-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E89903383662
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA1A3AEB2B;
	Wed,  3 Jun 2026 14:26:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52F043D508;
	Wed,  3 Jun 2026 14:26:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496817; cv=none; b=MpuAl63OV8rk2GiBLwEO1dKBcsjgDpTO2j1ERtYodWTgjVd2OT0ZmRALikzbb3Pl3oo7eWxIpr2o+4POFmWK7e6+YGW6D/AGABaR0aeR2i/3bXVj2ZpS7KGdZh7IIdwD60OIs8xxtvtcZ9cFVbh05l+JTr1wNa22X7c+386K30Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496817; c=relaxed/simple;
	bh=edfoAHUm7fBfZ9YlfPyA130+YmJVoOL+2U41A6aTk1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahsAWvvkNLsDX4aQX8kcuVwOAYH3oKl+dblBUKpE7lMRfW11w70DTqa7i5DIrY0poOYQdQcG4et2118QkVhbvLimDT2xnNPN9kM+l7fVQuOve+EOAqT1XbcIDsu2Qppf+rOGKoEHd535SkTdwMGqa6oFAAR7OJLhLBwOPlPML00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cSDYL0bx; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2A39929;
	Wed,  3 Jun 2026 16:26:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780496785;
	bh=edfoAHUm7fBfZ9YlfPyA130+YmJVoOL+2U41A6aTk1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSDYL0bxz/tNJC/q0O+OLqtIfTPPBewpQUuiy7EQmA+JH/yF41AhFfFkgFw1w6c9p
	 bM9YQkHWg0t3FVAx7I4pdmHx7s0eBcH8QErcIA8WRyThnC1z4Bhp+FkHRrUMMvdykB
	 fvYtuxYSYgl1lsuH9X1l1uzGU/8FAS27kjGBCo/0=
Date: Wed, 3 Jun 2026 16:26:45 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v9 03/13] media: rppx1: Add framework to support
 Dreamchip RPPX1 ISP
Message-ID: <aiA2oG8MoXld5aEw@zed>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-4-niklas.soderlund+renesas@ragnatech.se>
 <aiAb60X2HP-yra25@zed>
 <20260603134748.GE91369@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603134748.GE91369@ragnatech.se>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63619-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,vger.kernel.org:from_smtp,ragnatech.se:email,zed:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.freedesktop.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 577C3638AFD

Hi Niklas

On Wed, Jun 03, 2026 at 03:47:48PM +0200, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for your comments.
>
> On 2026-06-03 14:24:23 +0200, Jacopo Mondi wrote:
> > Hi Niklas
> >
> > On Sat, May 16, 2026 at 11:13:10PM +0200, Niklas Söderlund wrote:
> > > Add a framework driver for Dreamchip RPPX1 ISP. The driver aims to
> > > provide a framework for other V4L2 based drivers to drive the RPPX1
> > > functionality. The reason for this split is that the RPPX1 IP itself do
> > > not provide any DMA engines to drive data to/from the device, instead it
> > > depends on other IP blocks to implement these features.
> > >
> > > While the peripherals around the RPPX1 ISP used in different designs and
> > > by different vendors are different the RPPX1 core itself is the same.
> > > For this reason the framework solution to be able to split the Dreamchip
> > > RPPX1 driver from vendors usage of it have been picked in hope to reduce
> > > duplication of the common parts.
> > >
> > > The design is to try and keep the surface of this framework as small as
> > > possible. The intention of this change is to be able to fill all needs
> > > of this.
> > >
> > >   * Two functions to create and destroy a RPPX1 instance, rppx1_create()
> > >     and rppx1_destory(). These are intended to be called in the users
> > >     probe and remove code paths.
> > >
> > >   * Two functions to start and stop the RPPX1 processing, rppx1_start()
> > >     and rppx1_stop(). These are intended to be called in the users
> > >     stream on and stream off code paths.
> > >
> > >   * One function to ask the RPPX1 to process parameters buffer prepared
> > >     by user space, rppx1_params(). The intention is to call this
> > >     function when the parameter buffer is queued to the V4L2 driver and
> > >     the result stored by the driver until the time it needs to be
> > >     written to the RPPX1. It's the users responsibility to write it
> > >     either using MMIO or other means.
> > >
> > >   * One function to fill in a statistic buffer based on the current
> > >     status of the RPPX1, rppx1_stats_fill_isr(). The intention is that
> > >     the user call's this in its interrupt handler when it knows the
> > >     RPPX1 is done processing a frame.
> > >
> > >   * One function to ack and retrieve the interrupts generated by the
> > >     RPPX1, rppx1_interrupt(). The intention is to call this function
> > >     when the users interrupt handler detects the RPPX1 have raised and
> > >     interrupt. There is no need for the user to understand, or act, on
> > >     the actual RPPX1 interrupt, but it can if it wants too.
> > >
> > > The initial support in the framework is limited and do not implement any
> > > ISP processing algorithms other then configuring the RPPX1 to process
> > > any Bayer (8-, 10, or 12-bit) image and produce either a RGB or YUYV
> > > output. It do however probe all function blocks of the RPPX1 and provide
> > > an interface to interact with both parameter and statistic bufferers.
> > > The user of the framework will not change as algorithms for the
> > > different function blocks of the ISP are being added.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > > Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > > Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > ---
> > > * Changes since v8
> > > - Broke out header scaffolding to own patch to retain Jai as author.
> > > - Add documentation to MAINTAINERS file.
> > > - Added Jai and Jacopo to MAINTAINERS file.
> > > - Drop slab.h from rpp_module.c
> > > - Avoid cast in call to v4l2_isp_params_validate_buffer()
> > > - Use dev_warn() and dev_err() instead of pr_warn() and pr_err() now
> > >   that we have access to a dev pointer.
> > > - Make parameter type checking switch snugger.
> > > - Return value directly in rppx1_read()
> > > - Replace magic numbers with defines.
> > > - Add linux/device.h include in rppx1.h for struct device.
> > > - Do not store modules bit with as this is now fully exposed to
> > >   user-space.
> > > - Update comments in uapi header now we have a RPPX1 native format.
> > >
> > > * Changes since v7
> > > - Merge with fixups done before the pixel format change.
> > > - Update to use isp helpers, thanks Jai and Jacopo.
> > >
> > > * Changes since v6
> > > - Use kzalloc_obj
> > > - Set device pointer
> > >
> > > * Changes since v5
> > > - Make use of v4l2-isp.
> > > - Make VIDEO_DCT_RPPX1 a non visible symbol. It makes no sens to build
> > >   it without a consumer.
> > >
> > > * Changes since v2
> > > - Add missing include to slab.h
> > >
> > > * Changes since v3
> > > - Fix small build issues found by 0day on non-arm ARCH.
> > > ---
> > >  .../userspace-api/media/v4l/metafmt-rppx1.rst |  99 +++++
> > >  MAINTAINERS                                   |  10 +
> > >  drivers/media/platform/Kconfig                |   1 +
> > >  drivers/media/platform/Makefile               |   1 +
> > >  drivers/media/platform/dreamchip/Kconfig      |   3 +
> > >  drivers/media/platform/dreamchip/Makefile     |   6 +
> > >  .../media/platform/dreamchip/rppx1/Kconfig    |  12 +
> > >  .../media/platform/dreamchip/rppx1/Makefile   |  33 ++
> > >  .../platform/dreamchip/rppx1/rpp_module.c     |  39 ++
> > >  .../platform/dreamchip/rppx1/rpp_module.h     | 107 +++++
> > >  .../platform/dreamchip/rppx1/rpp_params.c     |  71 ++++
> > >  .../platform/dreamchip/rppx1/rpp_stats.c      |  28 ++
> > >  .../media/platform/dreamchip/rppx1/rppx1.c    | 381 ++++++++++++++++++
> > >  .../media/platform/dreamchip/rppx1/rppx1.h    | 105 +++++
> > >  .../platform/dreamchip/rppx1/rppx1_acq.c      | 148 +++++++
> > >  .../platform/dreamchip/rppx1/rppx1_awbg.c     |  31 ++
> > >  .../media/platform/dreamchip/rppx1/rppx1_bd.c |  53 +++
> > >  .../platform/dreamchip/rppx1/rppx1_bdrgb.c    |  81 ++++
> > >  .../platform/dreamchip/rppx1/rppx1_bls.c      |  60 +++
> > >  .../platform/dreamchip/rppx1/rppx1_cac.c      |  30 ++
> > >  .../platform/dreamchip/rppx1/rppx1_ccor.c     | 105 +++++
> > >  .../media/platform/dreamchip/rppx1/rppx1_db.c |  45 +++
> > >  .../platform/dreamchip/rppx1/rppx1_dpcc.c     |  77 ++++
> > >  .../platform/dreamchip/rppx1/rppx1_exm.c      |  52 +++
> > >  .../media/platform/dreamchip/rppx1/rppx1_ga.c |  50 +++
> > >  .../platform/dreamchip/rppx1/rppx1_hist.c     |  77 ++++
> > >  .../platform/dreamchip/rppx1/rppx1_hist256.c  |  47 +++
> > >  .../media/platform/dreamchip/rppx1/rppx1_is.c |  43 ++
> > >  .../platform/dreamchip/rppx1/rppx1_lin.c      |  59 +++
> > >  .../platform/dreamchip/rppx1/rppx1_lsc.c      |  69 ++++
> > >  .../platform/dreamchip/rppx1/rppx1_ltm.c      |  49 +++
> > >  .../platform/dreamchip/rppx1/rppx1_ltmmeas.c  |  42 ++
> > >  .../platform/dreamchip/rppx1/rppx1_outif.c    |  46 +++
> > >  .../platform/dreamchip/rppx1/rppx1_outregs.c  |  76 ++++
> > >  .../platform/dreamchip/rppx1/rppx1_rmap.c     |  63 +++
> > >  .../platform/dreamchip/rppx1/rppx1_rmapmeas.c |  47 +++
> > >  .../platform/dreamchip/rppx1/rppx1_shrp.c     |  65 +++
> > >  .../platform/dreamchip/rppx1/rppx1_wbmeas.c   |  62 +++
> > >  .../platform/dreamchip/rppx1/rppx1_xyz2luv.c  |  27 ++
> > >  include/media/rppx1.h                         |  36 ++
> > >  .../uapi/linux/media/dreamchip/rppx1-config.h |  12 +-
> > >  41 files changed, 2444 insertions(+), 4 deletions(-)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-rppx1.rst
> > >  create mode 100644 drivers/media/platform/dreamchip/Kconfig
> > >  create mode 100644 drivers/media/platform/dreamchip/Makefile
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/Kconfig
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/Makefile
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_module.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1.h
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_acq.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_cac.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_db.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_hist256.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_is.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ltmmeas.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_outif.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_outregs.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_rmap.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_rmapmeas.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
> > >  create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c
> > >  create mode 100644 include/media/rppx1.h
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/metafmt-rppx1.rst b/Documentation/userspace-api/media/v4l/metafmt-rppx1.rst
> > > new file mode 100644
> > > index 000000000000..ad256ae1c1b2
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/metafmt-rppx1.rst
> > > @@ -0,0 +1,99 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +.. _v4l2-meta-fmt-rppx1-params:
> > > +.. _v4l2-meta-fmt-rppx1-stats:
> > > +
> > > +*************************************************************************
> > > +V4L2_META_FMT_RPP_X1_PARAMS ('DR1P'), V4L2_META_FMT_RPP_X1_STATS ('DR1S')
> > > +*************************************************************************
> > > +
> > > +Configuration Parameters
> > > +========================
> > > +
> > > +The configuration parameters are passed to the metadata output video node, using
> > > +the :c:type:`v4l2_meta_format` interface. Rather than a single struct containing
> > > +sub-structs for each configurable area of the ISP, parameters for the Dreamchip
> > > +RPPX1 use the v4l2-isp parameters system, through which groups of parameters are
> > > +defined as distinct structs or "blocks" which may be added to the data member of
> > > +:c:type:`v4l2_isp_buffer`. Userspace is responsible for populating the data
> > > +member with the blocks that need to be configured by the driver.  Each
> > > +block-specific struct embeds :c:type:`v4l2_isp_block_header` as its first member
> > > +and userspace must populate the type member with a value from
> > > +:c:type:`rppx1_params_block_type`.
> > > +
> > > +.. code-block:: c
> > > +
> > > +	struct v4l2_isp_params_buffer *params =
> > > +		(struct v4l2_isp_params_buffer *)buffer;
> > > +
> > > +	params->version = V4L2_ISP_PARAMS_VERSION_V1;
> > > +	params->data_size = 0;
> > > +
> > > +	void *data = (void *)params->data;
> > > +
> > > +	struct rppx1_ccor_params *ccor =
> > > +		(struct rppx1_ccor_params *)data;
> > > +
> > > +	ccor->header.type = RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST;
> > > +	ccor->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> > > +	ccor->header.size = sizeof(struct rppx1_ccor_params);
> > > +
> > > +        ccor->coeff[0][0] = 0x1000;
> > > +        ccor->coeff[0][1] = 0x0000;
> > > +        ccor->coeff[0][2] = 0x0000;
> > > +        ccor->coeff[1][0] = 0x0000;
> > > +        ccor->coeff[1][1] = 0x1000;
> > > +        ccor->coeff[1][2] = 0x0000;
> > > +        ccor->coeff[2][0] = 0x0000;
> > > +        ccor->coeff[2][1] = 0x0000;
> > > +        ccor->coeff[2][2] = 0x1000;
> > > +
> > > +        ccor->offset[0] = 0x200000;
> > > +        ccor->offset[1] = 0x200000;
> > > +        ccor->offset[2] = 0x200000;
> > > +
> > > +	data += sizeof(struct rppx1_ccor_params);
> > > +	params->data_size += sizeof(struct rppx1_ccor_params);
> > > +
> > > +3A Statistics
> > > +=============
> > > +
> > > +The ISP device collects different statistics over an input bayer frame. Those
> > > +statistics can be obtained by userspace from the metadata capture video node,
> > > +using the :c:type:`v4l2_meta_format` interface. Rather than a single struct
> > > +containing sub-structs for each statistics area of the ISP, statistics for the
> > > +Dreamchip RPPX1 use the v4l2-isp statistics system, through which groups of
> > > +statistics are defined as distinct structs or "blocks" which may be added to the
> > > +data member of :c:type:`v4l2_isp_buffer`. Userspace is responsible for parsing
> > > +the buffer and extracting the blocks of statistics. Each block-specific struct
> > > +embeds :c:type:`v4l2_isp_block_header` as its first member and userspace must
> > > +interpret the type member with a value from :c:type:`rppx1_stats_block_type`.
> > > +
> > > +.. code-block:: C
> > > +
> > > +        const struct v4l2_isp_buffer *stats =
> > > +                (struct v4l2_isp_buffer *)buf;
> > > +        size_t block_offset = 0;
> > > +
> > > +        while (block_offset < stats->data_size) {
> > > +                const struct v4l2_isp_stats_block_header *block =
> > > +                        (void*)(stats->data + block_offset);
> > > +
> > > +                block_offset += block->size;
> > > +
> > > +                switch (block->type) {
> > > +                case RPPX1_STATS_BLOCK_TYPE_HIST_POST:
> > > +                        for (unsigned int i = 0; i < RPPX1_HIST_NUM_BINS; i++)
> > > +                                printf("hist.hist_bins[%u] = 0x%08x\n",
> > > +                                        i, hist.hist_bins[%i]);
> > > +                        break;
> > > +                default:
> > > +                        printf("Unknown block type 0x%04x", block->type);
> > > +                        break;
> > > +                }
> > > +        }
> > > +
> > > +Dreamchip RPPX1 uAPI data types
> > > +===============================
> > > +
> > > +.. kernel-doc:: include/uapi/linux/media/dreamchip/rppx1-config.h
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index b592fb09a8dd..96fdfdabb0ab 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -7848,6 +7848,16 @@ F:	drivers/block/drbd/
> > >  F:	include/linux/drbd*
> > >  F:	lib/lru_cache.c
> > >
> > > +DREAMCHIP RPPX1 ISP
> > > +M:	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > +M:	Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > > +M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > > +L:	linux-media@vger.kernel.org
> > > +S:	Maintained
> > > +F:	Documentation/userspace-api/media/v4l/metafmt-rppx1.rst
> > > +F:	drivers/media/platform/dreamchip/rppx1/
> > > +F:	include/uapi/linux/media/dreamchip/rppx1-config.h
> > > +
> > >  DRIVER COMPONENT FRAMEWORK
> > >  L:	dri-devel@lists.freedesktop.org
> > >  F:	drivers/base/component.c
> > > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > > index 0b33e927bd59..2c7699b6610b 100644
> > > --- a/drivers/media/platform/Kconfig
> > > +++ b/drivers/media/platform/Kconfig
> > > @@ -72,6 +72,7 @@ source "drivers/media/platform/atmel/Kconfig"
> > >  source "drivers/media/platform/broadcom/Kconfig"
> > >  source "drivers/media/platform/cadence/Kconfig"
> > >  source "drivers/media/platform/chips-media/Kconfig"
> > > +source "drivers/media/platform/dreamchip/Kconfig"
> > >  source "drivers/media/platform/imagination/Kconfig"
> > >  source "drivers/media/platform/intel/Kconfig"
> > >  source "drivers/media/platform/marvell/Kconfig"
> > > diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> > > index 16c185752474..d47c47d817da 100644
> > > --- a/drivers/media/platform/Makefile
> > > +++ b/drivers/media/platform/Makefile
> > > @@ -15,6 +15,7 @@ obj-y += atmel/
> > >  obj-y += broadcom/
> > >  obj-y += cadence/
> > >  obj-y += chips-media/
> > > +obj-y += dreamchip/
> > >  obj-y += imagination/
> > >  obj-y += intel/
> > >  obj-y += marvell/
> > > diff --git a/drivers/media/platform/dreamchip/Kconfig b/drivers/media/platform/dreamchip/Kconfig
> > > new file mode 100644
> > > index 000000000000..d177d4ee79ae
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/Kconfig
> > > @@ -0,0 +1,3 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +source "drivers/media/platform/dreamchip/rppx1/Kconfig"
> > > diff --git a/drivers/media/platform/dreamchip/Makefile b/drivers/media/platform/dreamchip/Makefile
> > > new file mode 100644
> > > index 000000000000..ba47ba2d136e
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/Makefile
> > > @@ -0,0 +1,6 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +#
> > > +# Makefile for the Dreamchip device drivers.
> > > +#
> > > +
> > > +obj-y += rppx1/
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/Kconfig b/drivers/media/platform/dreamchip/rppx1/Kconfig
> > > new file mode 100644
> > > index 000000000000..0998a7d10bf2
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/Kconfig
> > > @@ -0,0 +1,12 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +config VIDEO_DCT_RPPX1
> > > +	tristate
> > > +	depends on V4L_PLATFORM_DRIVERS
> > > +	select V4L2_ISP
> > > +	help
> > > +	  Support library for Dreamchip HDR RPP X1 High Dynamic Range Real-time
> > > +	  Pixel Processor (RPP). The library can be used by other drivers who
> > > +	  utilises the RPP as part of an ISP implementation.
> > > +
> > > +	  To compile this driver as a module, choose M here: the
> > > +	  module will be called rppx1.
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/Makefile b/drivers/media/platform/dreamchip/rppx1/Makefile
> > > new file mode 100644
> > > index 000000000000..b2bd6b5d68bc
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/Makefile
> > > @@ -0,0 +1,33 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +dct-rpp-x1-objs = \
> > > +	rpp_module.o \
> > > +	rpp_params.o \
> > > +	rpp_stats.o \
> > > +	rppx1.o \
> > > +	rppx1_acq.o \
> > > +	rppx1_awbg.o \
> > > +	rppx1_bd.o \
> > > +	rppx1_bdrgb.o \
> > > +	rppx1_bls.o \
> > > +	rppx1_cac.o \
> > > +	rppx1_ccor.o \
> > > +	rppx1_db.o \
> > > +	rppx1_dpcc.o \
> > > +	rppx1_exm.o \
> > > +	rppx1_ga.o \
> > > +	rppx1_hist.o \
> > > +	rppx1_hist256.o \
> > > +	rppx1_is.o \
> > > +	rppx1_lin.o \
> > > +	rppx1_lsc.o \
> > > +	rppx1_ltm.o \
> > > +	rppx1_ltmmeas.o \
> > > +	rppx1_outif.o \
> > > +	rppx1_outregs.o \
> > > +	rppx1_rmap.o \
> > > +	rppx1_rmapmeas.o \
> > > +	rppx1_shrp.o \
> > > +	rppx1_wbmeas.o \
> > > +	rppx1_xyz2luv.o
> > > +
> > > +obj-$(CONFIG_VIDEO_DCT_RPPX1) += dct-rpp-x1.o
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.c b/drivers/media/platform/dreamchip/rppx1/rpp_module.c
> > > new file mode 100644
> > > index 000000000000..cb3e5a33d68c
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.c
> > > @@ -0,0 +1,39 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rppx1.h"
> > > +#include "rpp_module.h"
> > > +
> > > +int rpp_module_probe(struct rpp_module *mod, struct rppx1 *rpp,
> > > +		     const struct rpp_module_ops *ops, u32 base)
> > > +{
> > > +	mod->rpp = rpp;
> > > +	mod->base = base;
> > > +	mod->ops = ops;
> > > +
> > > +	if (ops->probe)
> > > +		return ops->probe(mod);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +void rpp_module_write(struct rpp_module *mod, u32 offset, u32 value)
> > > +{
> > > +	rppx1_write(mod->rpp, mod->base + offset, value);
> > > +}
> > > +
> > > +u32 rpp_module_read(struct rpp_module *mod, u32 offset)
> > > +{
> > > +	return rppx1_read(mod->rpp, mod->base + offset);
> > > +}
> > > +
> > > +void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value)
> > > +{
> > > +	u32 reg = rpp_module_read(mod, offset) & ~mask;
> > > +
> > > +	rpp_module_write(mod, offset, reg | value);
> > > +}
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > > new file mode 100644
> > > index 000000000000..e92e77542980
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > > @@ -0,0 +1,107 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#ifndef __RPPX1_MODULE_H__
> > > +#define __RPPX1_MODULE_H__
> > > +
> > > +#include <linux/errno.h>
> > > +#include <linux/types.h>
> > > +#include <linux/v4l2-mediabus.h>
> > > +
> > > +#include <linux/media/dreamchip/rppx1-config.h>
> > > +
> > > +#include <media/rppx1.h>
> > > +
> > > +struct rpp_module_ops;
> > > +
> > > +enum rpp_raw_pattern {
> > > +	RPP_RGGB = 0,
> > > +	RPP_GRBG,
> > > +	RPP_GBRG,
> > > +	RPP_BGGR,
> > > +};
> > > +
> > > +struct rpp_module {
> > > +	struct rppx1 *rpp;
> > > +	u32 base;
> > > +
> > > +	const struct rpp_module_ops *ops;
> > > +
> > > +	union {
> > > +		struct {
> > > +			enum rpp_raw_pattern raw_pattern;
> > > +		} acq;
> > > +	} info;
> > > +};
> > > +
> > > +int rpp_module_probe(struct rpp_module *mod, struct rppx1 *rpp,
> > > +		     const struct rpp_module_ops *ops, u32 base);
> > > +
> > > +void rpp_module_write(struct rpp_module *mod, u32 offset, u32 value);
> > > +u32 rpp_module_read(struct rpp_module *mod, u32 offset);
> > > +void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
> > > +
> > > +union rppx1_params_block {
> > > +	struct v4l2_isp_block_header header;
> > > +};
> > > +
> > > +union rppx1_stats_block {
> > > +	struct v4l2_isp_block_header header;
> > > +};
> > > +
> > > +struct rpp_module_ops {
> > > +	int (*probe)(struct rpp_module *mod);
> > > +	int (*start)(struct rpp_module *mod, const struct v4l2_mbus_framefmt *fmt);
> > > +
> > > +	int (*fill_params)(struct rpp_module *mod,
> > > +			   const union rppx1_params_block *block,
> > > +			   rppx1_reg_write write, void *priv);
> > > +	int (*fill_stats)(struct rpp_module *mod,
> > > +			  union rppx1_stats_block *block);
> > > +};
> > > +
> > > +extern const struct rpp_module_ops rppx1_acq_ops;
> > > +extern const struct rpp_module_ops rppx1_awbg_ops;
> > > +extern const struct rpp_module_ops rppx1_bd_ops;
> > > +extern const struct rpp_module_ops rppx1_bdrgb_ops;
> > > +extern const struct rpp_module_ops rppx1_bls_ops;
> > > +extern const struct rpp_module_ops rppx1_cac_ops;
> > > +extern const struct rpp_module_ops rppx1_ccor_ops;
> > > +extern const struct rpp_module_ops rppx1_ccor_csm_ops;
> > > +extern const struct rpp_module_ops rppx1_db_ops;
> > > +extern const struct rpp_module_ops rppx1_dpcc_ops;
> > > +extern const struct rpp_module_ops rppx1_exm_ops;
> > > +extern const struct rpp_module_ops rppx1_ga_ops;
> > > +extern const struct rpp_module_ops rppx1_hist256_ops;
> > > +extern const struct rpp_module_ops rppx1_hist_ops;
> > > +extern const struct rpp_module_ops rppx1_is_ops;
> > > +extern const struct rpp_module_ops rppx1_lin_ops;
> > > +extern const struct rpp_module_ops rppx1_lsc_ops;
> > > +extern const struct rpp_module_ops rppx1_ltm_ops;
> > > +extern const struct rpp_module_ops rppx1_ltmmeas_ops;
> > > +extern const struct rpp_module_ops rppx1_outif_ops;
> > > +extern const struct rpp_module_ops rppx1_outregs_ops;
> > > +extern const struct rpp_module_ops rppx1_rmapmeas_ops;
> > > +extern const struct rpp_module_ops rppx1_rmap_ops;
> > > +extern const struct rpp_module_ops rppx1_shrp_ops;
> > > +extern const struct rpp_module_ops rppx1_wbmeas_ops;
> > > +extern const struct rpp_module_ops rppx1_xyz2luv_ops;
> > > +
> > > +#define rpp_module_call(mod, op, args...)				\
> > > +	({								\
> > > +		struct rpp_module *__mod = (mod);			\
> > > +		int __result;						\
> > > +		if (!__mod)						\
> > > +			__result = -ENODEV;				\
> > > +		else if (!__mod->ops->op)				\
> > > +			__result = 0;					\
> > > +		else							\
> > > +			__result = __mod->ops->op(__mod, ##args);	\
> > > +		__result;						\
> > > +	})
> > > +
> > > +#endif /* __RPPX1_MODULE_H__ */
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > > new file mode 100644
> > > index 000000000000..af45ad5750b3
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > > @@ -0,0 +1,71 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include <media/v4l2-isp.h>
> > > +#include <media/videobuf2-v4l2.h>
> > > +
> > > +#include "rppx1.h"
> > > +
> > > +#define RPPX1_PARAMS_BLOCK_INFO(block, data) \
> > > +	[RPPX1_PARAMS_BLOCK_TYPE_ ## block] = { \
> > > +		.size = sizeof(struct rppx1_ ## data ## _params), \
> > > +	}
> > > +
> > > +static const struct v4l2_isp_params_block_type_info
> > > +rppx1_ext_params_blocks_info[] = {
> > > +};
> > > +
> > > +int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
> > > +		 rppx1_reg_write write, void *priv)
> > > +{
> > > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > > +	struct v4l2_isp_buffer *cfg;
> > > +	size_t block_offset;
> > > +	int ret;
> > > +
> > > +	ret = v4l2_isp_params_validate_buffer_size(rpp->dev, vb, max_size);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	cfg = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
> > > +
> > > +	ret = v4l2_isp_params_validate_buffer(rpp->dev, vb, cfg,
> > > +					      rppx1_ext_params_blocks_info,
> > > +					      ARRAY_SIZE(rppx1_ext_params_blocks_info));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Walk the list of parameter blocks and process them. */
> > > +	block_offset = 0;
> > > +	while (block_offset < cfg->data_size) {
> > > +		const union rppx1_params_block *block =
> > > +			(const union rppx1_params_block *)&cfg->data[block_offset];
> > > +		struct rpp_module *module;
> > > +		int ret;
> > > +
> > > +		block_offset += block->header.size;
> > > +
> > > +		switch (block->header.type) {
> > > +		default:
> > > +			dev_warn(rpp->dev,
> > > +				 "Not handled RPPX1 block type: 0x%04x\n",
> > > +				 block->header.type);
> > > +			continue;
> > > +		}
> > > +
> > > +		ret = rpp_module_call(module, fill_params, block, write, priv);
> > > +		if (ret) {
> > > +			dev_err(rpp->dev,
> > > +				"Error processing RPPX1 block type: 0x%04x\n",
> > > +				block->header.type);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(rppx1_params);
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> > > new file mode 100644
> > > index 000000000000..f7eb60deae10
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> > > @@ -0,0 +1,28 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rppx1.h"
> > > +#include "rpp_module.h"
> > > +
> > > +#include <media/v4l2-isp.h>
> > > +
> > > +#define RPPX1_STATS_BLOCK_INFO(type, block) \
> > > +	[RPPX1_STATS_BLOCK_TYPE_ ## type] = { \
> > > +		.size = sizeof(struct rppx1_ ## block ## _stats), \
> > > +	}
> > > +
> > > +#define rppx1_init_stats_block(rpp, buf, type)				\
> > > +	((union rppx1_stats_block *)					\
> > > +	v4l2_isp_stats_init_block((rpp)->dev, (buf),			\
> > > +				  rppx1_stats_blocks_info,		\
> > > +				  ARRAY_SIZE(rppx1_stats_blocks_info),	\
> > > +				  (type), RPPX1_STATS_MAX_SIZE))	\
> > > +
> > > +void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
> > > +{
> > > +}
> > > +EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.c b/drivers/media/platform/dreamchip/rppx1/rppx1.c
> > > new file mode 100644
> > > index 000000000000..c502be797914
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1.c
> > > @@ -0,0 +1,381 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + *
> > > + * Support library for Dreamchip HDR RPPX1 High Dynamic Range Real-time Pixel
> > > + * Processor.
> > > + */
> > > +
> > > +#include <linux/io.h>
> > > +#include <linux/module.h>
> > > +#include <linux/slab.h>
> > > +
> > > +#include "rppx1.h"
> > > +
> > > +/* RPP_HDR Base Addresses */
> > > +#define RPPX1_HDRREGS_BASE			0x0000
> > > +#define RPPX1_HDR_IRQ_BASE			0x0200
> > > +#define RPPX1_RPP_OUT_BASE			0x0800
> > > +#define RPPX1_RPP_RMAP_BASE			0x0c00
> > > +#define RPPX1_RPP_RMAP_MEAS_BASE		0x1000
> > > +#define RPPX1_RPP_MAIN_PRE1_BASE		0x2000
> > > +#define RPPX1_RPP_MAIN_PRE2_BASE		0x4000
> > > +#define RPPX1_RPP_MAIN_POST_BASE		0xa000
> > > +#define RPPX1_RPP_MVOUT_BASE			0xc000
> > > +#define RPPX1_RPP_FUSA_BASE			0xf000
> > > +
> > > +#define RPPX1_RPP_HDRREGS_VERSION_REG		(RPPX1_HDRREGS_BASE + 0x0000)
> > > +
> > > +#define RPPX1_RPP_HDR_UPD_REG			(RPPX1_HDRREGS_BASE + 0x0004)
> > > +#define RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD	BIT(1)
> > > +#define RPPX1_RPP_HDR_UPD_REGS_CFG_UPD		BIT(0)
> > > +
> > > +#define RPPX1_RESERVED_3_REG			(RPPX1_HDRREGS_BASE + 0x0008)
> > > +
> > > +#define RPPX1_RPP_HDR_INFORM_ENABLE_REG		(RPPX1_HDRREGS_BASE + 0x000c)
> > > +#define RPPX1_RPP_HDR_INFORM_ENABLE_ENABLE	1
> > > +#define RPPX1_RPP_HDR_INFORM_ENABLE_DISABLE	0
> > > +
> > > +#define RPPX1_RPP_HDR_OUT_IF_ON_REG		(RPPX1_HDRREGS_BASE + 0x0010)
> > > +#define RPPX1_RPP_HDR_OUT_IF_OFF_REG		(RPPX1_HDRREGS_BASE + 0x0014)
> > > +
> > > +#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_REG	(RPPX1_HDRREGS_BASE + 0x0018)
> > > +#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_ENABLE	1
> > > +#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_DISABLE	0
> > > +
> > > +#define RPPX1_RPP_ISM				(RPPX1_HDR_IRQ_BASE + 0x00)
> > > +#define RPPX1_RPP_RIS				(RPPX1_HDR_IRQ_BASE + 0x04)
> > > +#define RPPX1_RPP_MIS				(RPPX1_HDR_IRQ_BASE + 0x08)
> > > +#define RPPX1_RPP_ISC				(RPPX1_HDR_IRQ_BASE + 0x0c)
> > > +
> > > +/* RPP_OUT/MV_OUT Pipelines - Base Addresses */
> > > +#define RPPX1_GAMMA_OUT_BASE			0x0000 /* HV, MV */
> > > +#define RPPX1_IS_BASE				0x00c0 /* HV, MV */
> > > +#define RPPX1_CSM_BASE				0x0100 /* HV, MV */
> > > +#define RPPX1_OUT_IF_BASE			0x0200 /* HV, MV */
> > > +#define RPPX1_RPP_OUTREGS_BASE			0x02c0 /* HV, MV */
> > > +#define RPPX1_LUV_BASE				0x0300 /* MV */
> > > +
> > > +/* PRE1/PRE2/POST Pipelines - Base Addresses */
> > > +#define RPPX1_ACQ_BASE				0x0080 /* PRE1, PRE2 */
> > > +#define RPPX1_BLS_BASE				0x0100 /* PRE1, PRE2 */
> > > +#define RPPX1_GAMMA_IN_BASE			0x0200 /* PRE1, PRE2 */
> > > +#define RPPX1_LSC_BASE				0x0400 /* PRE1, PRE2 */
> > > +#define RPPX1_AWB_GAIN_BASE			0x0500 /* PRE1, PRE2, POST */
> > > +#define RPPX1_DPCC_BASE				0x0600 /* PRE1, PRE2 */
> > > +#define RPPX1_DPF_BASE				0x0700 /* PRE1, PRE2 */
> > > +#define RPPX1_FILT_BASE				0x0800 /* POST */
> > > +#define RPPX1_CAC_BASE				0x0880 /* POST */
> > > +#define RPPX1_CCOR_BASE				0x0900 /* POST */
> > > +#define RPPX1_HIST_BASE				0x0a00 /* PRE1, PRE2, POST */
> > > +#define RPPX1_HIST256_BASE			0x0b00 /* PRE1 */
> > > +#define RPPX1_EXM_BASE				0x0c00 /* PRE1, PRE2 */
> > > +#define RPPX1_LTM_BASE				0x1000 /* POST */
> > > +#define RPPX1_LTM_MEAS_BASE			0x1200 /* POST */
> > > +#define RPPX1_WBMEAS_BASE			0x1700 /* POST */
> > > +#define RPPX1_BDRGB_BASE			0x1800 /* POST */
> > > +#define RPPX1_SHRP_BASE				0x1a00 /* POST */
> > > +
> > > +/* Functional Safety Module Base Addresses */
> > > +#define RPPX1_FMU_BASE				0x0100
> > > +
> > > +#define RPPX1_RPP_HDR_FMU_FSM_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x00)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_FSM_IRQM_FAULT	BIT(23)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_PRE2_SIZE_FAULT	BIT(20)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_PRE2_TIME_FAULT	BIT(19)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_PRE1_SIZE_FAULT	BIT(18)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_PRE1_TIME_FAULT	BIT(17)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_SIZE_FAULT	BIT(16)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_TIME_FAULT	BIT(15)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_SIZE_FAULT	BIT(14)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_TIME_FAULT	BIT(13)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_HV_OUT_SIZE_FAULT	BIT(12)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_HV_OUT_TIME_FAULT	BIT(11)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_SIZE_ERR	BIT(10)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_IS_OUT_SIZE_ERR	BIT(9)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_PRE2_FIFO_OVFLW	BIT(7)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_PRE1_FIFO_OVFLW	BIT(6)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_PRE1_INFORM_SIZE	BIT(5)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_PRE1_OUTFORM_SIZE	BIT(4)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_PRE2_INFORM_SIZE	BIT(3)
> > > +#define RPPX1_RPP_HDR_FMU_FSM_PRE2_OUTFORM_SIZE	BIT(2)
> > > +
> > > +#define RPPX1_RPP_HDR_FMU_RFS_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x04)
> > > +#define RPPX1_RPP_HDR_FMU_MFS_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x08)
> > > +#define RPPX1_RPP_HDR_FMU_FSC_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x0c)
> > > +
> > > +void rppx1_write(struct rppx1 *rpp, u32 offset, u32 value)
> > > +{
> > > +	iowrite32(value, rpp->base + offset);
> > > +}
> > > +
> > > +u32 rppx1_read(struct rppx1 *rpp, u32 offset)
> > > +{
> > > +	return ioread32(rpp->base + offset);
> > > +}
> > > +
> > > +bool rppx1_interrupt(struct rppx1 *rpp, u32 *isc)
> > > +{
> > > +	u32 status, raw, fault;
> > > +
> > > +	fault = rppx1_read(rpp, RPPX1_RPP_HDR_FMU_MFS_REG);
> > > +	if (fault) {
> > > +		dev_err(rpp->dev, "%s: fault 0x%08x\n", __func__, fault);
> > > +		rppx1_write(rpp, RPPX1_RPP_HDR_FMU_FSC_REG, fault);
> > > +	}
> > > +
> > > +	/* Read raw interrupt status. */
> > > +	raw = rppx1_read(rpp, RPPX1_RPP_RIS);
> > > +	status = rppx1_read(rpp, RPPX1_RPP_MIS);
> > > +
> > > +	/* Propagate the isc status. */
> > > +	if (isc)
> > > +		*isc = status | raw;
> > > +
> > > +	/* Clear enabled interrupts */
> > > +	rppx1_write(rpp, RPPX1_RPP_ISC, status);
> > > +
> > > +	return !!(status & RPPX1_IRQ_ID_OUT_FRAME);
> > > +}
> > > +EXPORT_SYMBOL_GPL(rppx1_interrupt);
> > > +
> > > +void rppx1_destroy(struct rppx1 *rpp)
> > > +{
> > > +	kfree(rpp);
> > > +}
> > > +EXPORT_SYMBOL_GPL(rppx1_destroy);
> > > +
> > > +/*
> > > + * Allocate the private data structure and verify the hardware is present.
> > > + */
> > > +struct rppx1 *rppx1_create(void __iomem *base, struct device *dev)
> > > +{
> > > +	struct rppx1 *rpp;
> > > +	u32 reg;
> > > +
> > > +	/* Allocate library structure */
> > > +	rpp = kzalloc_obj(*rpp);
> > > +	if (!rpp)
> > > +		return NULL;
> > > +
> > > +	rpp->base = base;
> > > +	rpp->dev = dev;
> > > +
> > > +	/* Check communication with RPP and verify it truly is a X1. */
> > > +	reg = rppx1_read(rpp, RPPX1_RPP_HDRREGS_VERSION_REG);
> > > +	if (reg != 3) {
> > > +		dev_err(rpp->dev, "Unsupported HDR version (%u)\n", reg);
> > > +		rppx1_destroy(rpp);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	/* Probe the PRE1 pipeline. */
> > > +	if (rpp_module_probe(&rpp->pre1.acq, rpp, &rppx1_acq_ops,
> > > +			     RPPX1_RPP_MAIN_PRE1_BASE + RPPX1_ACQ_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre1.bls, rpp, &rppx1_bls_ops,
> > > +			     RPPX1_RPP_MAIN_PRE1_BASE + RPPX1_BLS_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre1.lin, rpp, &rppx1_lin_ops,
> > > +			     RPPX1_RPP_MAIN_PRE1_BASE + RPPX1_GAMMA_IN_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre1.lsc, rpp, &rppx1_lsc_ops,
> > > +			     RPPX1_RPP_MAIN_PRE1_BASE + RPPX1_LSC_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre1.awbg, rpp, &rppx1_awbg_ops,
> > > +			     RPPX1_RPP_MAIN_PRE1_BASE + RPPX1_AWB_GAIN_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre1.dpcc, rpp, &rppx1_dpcc_ops,
> > > +			     RPPX1_RPP_MAIN_PRE1_BASE + RPPX1_DPCC_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre1.bd, rpp, &rppx1_bd_ops,
> > > +			     RPPX1_RPP_MAIN_PRE1_BASE + RPPX1_DPF_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre1.hist, rpp, &rppx1_hist_ops,
> > > +			     RPPX1_RPP_MAIN_PRE1_BASE + RPPX1_HIST_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre1.hist256, rpp, &rppx1_hist256_ops,
> > > +			     RPPX1_RPP_MAIN_PRE1_BASE + RPPX1_HIST256_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre1.exm, rpp, &rppx1_exm_ops,
> > > +			     RPPX1_RPP_MAIN_PRE1_BASE + RPPX1_EXM_BASE))
> > > +		goto err;
> > > +
> > > +	/* Probe the PRE2 pipeline. */
> > > +	if (rpp_module_probe(&rpp->pre2.acq, rpp, &rppx1_acq_ops,
> > > +			     RPPX1_RPP_MAIN_PRE2_BASE + RPPX1_ACQ_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre2.bls, rpp, &rppx1_bls_ops,
> > > +			     RPPX1_RPP_MAIN_PRE2_BASE + RPPX1_BLS_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre2.lin, rpp, &rppx1_lin_ops,
> > > +			     RPPX1_RPP_MAIN_PRE2_BASE + RPPX1_GAMMA_IN_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre2.lsc, rpp, &rppx1_lsc_ops,
> > > +			     RPPX1_RPP_MAIN_PRE2_BASE + RPPX1_LSC_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre2.awbg, rpp, &rppx1_awbg_ops,
> > > +			     RPPX1_RPP_MAIN_PRE2_BASE + RPPX1_AWB_GAIN_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre2.dpcc, rpp, &rppx1_dpcc_ops,
> > > +			     RPPX1_RPP_MAIN_PRE2_BASE + RPPX1_DPCC_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre2.bd, rpp, &rppx1_bd_ops,
> > > +			     RPPX1_RPP_MAIN_PRE2_BASE + RPPX1_DPF_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre2.hist, rpp, &rppx1_hist_ops,
> > > +			     RPPX1_RPP_MAIN_PRE2_BASE + RPPX1_HIST_BASE) ||
> > > +	    rpp_module_probe(&rpp->pre2.exm, rpp, &rppx1_exm_ops,
> > > +			     RPPX1_RPP_MAIN_PRE2_BASE + RPPX1_EXM_BASE))
> > > +		goto err;
> > > +
> > > +	/* Probe the POST pipeline. */
> > > +	if (rpp_module_probe(&rpp->post.awbg, rpp, &rppx1_awbg_ops,
> > > +			     RPPX1_RPP_MAIN_POST_BASE + RPPX1_AWB_GAIN_BASE) ||
> > > +	    rpp_module_probe(&rpp->post.ccor, rpp, &rppx1_ccor_ops,
> > > +			     RPPX1_RPP_MAIN_POST_BASE + RPPX1_CCOR_BASE) ||
> > > +	    rpp_module_probe(&rpp->post.hist, rpp, &rppx1_hist_ops,
> > > +			     RPPX1_RPP_MAIN_POST_BASE + RPPX1_HIST_BASE) ||
> > > +	    rpp_module_probe(&rpp->post.db, rpp, &rppx1_db_ops,
> > > +			     RPPX1_RPP_MAIN_POST_BASE + RPPX1_FILT_BASE) ||
> > > +	    rpp_module_probe(&rpp->post.cac, rpp, &rppx1_cac_ops,
> > > +			     RPPX1_RPP_MAIN_POST_BASE + RPPX1_CAC_BASE) ||
> > > +	    rpp_module_probe(&rpp->post.ltm, rpp, &rppx1_ltm_ops,
> > > +			     RPPX1_RPP_MAIN_POST_BASE + RPPX1_LTM_BASE) ||
> > > +	    rpp_module_probe(&rpp->post.ltmmeas, rpp, &rppx1_ltmmeas_ops,
> > > +			     RPPX1_RPP_MAIN_POST_BASE + RPPX1_LTM_MEAS_BASE) ||
> > > +	    rpp_module_probe(&rpp->post.wbmeas, rpp, &rppx1_wbmeas_ops,
> > > +			     RPPX1_RPP_MAIN_POST_BASE + RPPX1_WBMEAS_BASE) ||
> > > +	    rpp_module_probe(&rpp->post.bdrgb, rpp, &rppx1_bdrgb_ops,
> > > +			     RPPX1_RPP_MAIN_POST_BASE + RPPX1_BDRGB_BASE) ||
> > > +	    rpp_module_probe(&rpp->post.shrp, rpp, &rppx1_shrp_ops,
> > > +			     RPPX1_RPP_MAIN_POST_BASE + RPPX1_SHRP_BASE))
> > > +		goto err;
> > > +
> > > +	/* Probe the Human Vision pipeline. */
> > > +	if (rpp_module_probe(&rpp->hv.ga, rpp, &rppx1_ga_ops,
> > > +			     RPPX1_RPP_OUT_BASE + RPPX1_GAMMA_OUT_BASE) ||
> > > +	    rpp_module_probe(&rpp->hv.is, rpp, &rppx1_is_ops,
> > > +			     RPPX1_RPP_OUT_BASE + RPPX1_IS_BASE) ||
> > > +	    rpp_module_probe(&rpp->hv.ccor, rpp, &rppx1_ccor_csm_ops,
> > > +			     RPPX1_RPP_OUT_BASE + RPPX1_CSM_BASE) ||
> > > +	    rpp_module_probe(&rpp->hv.outif, rpp, &rppx1_outif_ops,
> > > +			     RPPX1_RPP_OUT_BASE + RPPX1_OUT_IF_BASE) ||
> > > +	    rpp_module_probe(&rpp->hv.outregs, rpp, &rppx1_outregs_ops,
> > > +			     RPPX1_RPP_OUT_BASE + RPPX1_RPP_OUTREGS_BASE))
> > > +		goto err;
> > > +
> > > +	/* Probe the Machine Vision pipeline. */
> > > +	if (rpp_module_probe(&rpp->mv.ga, rpp, &rppx1_ga_ops,
> > > +			     RPPX1_RPP_MVOUT_BASE + RPPX1_GAMMA_OUT_BASE) ||
> > > +	    rpp_module_probe(&rpp->mv.is, rpp, &rppx1_is_ops,
> > > +			     RPPX1_RPP_MVOUT_BASE + RPPX1_IS_BASE) ||
> > > +	    rpp_module_probe(&rpp->mv.ccor, rpp, &rppx1_ccor_csm_ops,
> > > +			     RPPX1_RPP_MVOUT_BASE + RPPX1_CSM_BASE) ||
> > > +	    rpp_module_probe(&rpp->mv.outif, rpp, &rppx1_outif_ops,
> > > +			     RPPX1_RPP_MVOUT_BASE + RPPX1_OUT_IF_BASE) ||
> > > +	    rpp_module_probe(&rpp->mv.outregs, rpp, &rppx1_outregs_ops,
> > > +			     RPPX1_RPP_MVOUT_BASE + RPPX1_RPP_OUTREGS_BASE) ||
> > > +	    rpp_module_probe(&rpp->mv.xyz2luv, rpp, &rppx1_xyz2luv_ops,
> > > +			     RPPX1_RPP_MVOUT_BASE + RPPX1_LUV_BASE))
> > > +		goto err;
> > > +
> > > +	/* Probe the standalone Radiance Mapping modules. */
> > > +	if (rpp_module_probe(&rpp->rmap, rpp, &rppx1_rmap_ops,
> > > +			     RPPX1_RPP_RMAP_BASE) ||
> > > +	    rpp_module_probe(&rpp->rmapmeas, rpp, &rppx1_rmapmeas_ops,
> > > +			     RPPX1_RPP_RMAP_MEAS_BASE))
> > > +		goto err;
> > > +
> > > +	return rpp;
> > > +err:
> > > +	rppx1_destroy(rpp);
> > > +
> > > +	return NULL;
> > > +}
> > > +EXPORT_SYMBOL_GPL(rppx1_create);
> > > +
> > > +int rppx1_start(struct rppx1 *rpp,
> > > +		const struct v4l2_mbus_framefmt *input,
> > > +		const struct v4l2_mbus_framefmt *hv,
> > > +		const struct v4l2_mbus_framefmt *mv)
> > > +{
> > > +	if (rpp_module_call(&rpp->pre1.acq, start, input) ||
> > > +	    rpp_module_call(&rpp->pre1.bls, start, input) ||
> > > +	    rpp_module_call(&rpp->pre1.lin, start, input) ||
> > > +	    rpp_module_call(&rpp->pre1.lsc, start, input) ||
> > > +	    rpp_module_call(&rpp->pre1.awbg, start, input) ||
> > > +	    rpp_module_call(&rpp->pre1.dpcc, start, input) ||
> > > +	    rpp_module_call(&rpp->pre1.bd, start, input) ||
> > > +	    rpp_module_call(&rpp->pre1.hist, start, input) ||
> > > +	    rpp_module_call(&rpp->pre1.exm, start, input) ||
> > > +	    rpp_module_call(&rpp->pre1.hist256, start, input))
> > > +		return -EINVAL;
> > > +
> > > +	if (rpp_module_call(&rpp->rmap, start, NULL) ||
> > > +	    rpp_module_call(&rpp->rmapmeas, start, NULL))
> > > +		return -EINVAL;
> > > +
> > > +	if (rpp_module_call(&rpp->post.awbg, start, input) ||
> > > +	    rpp_module_call(&rpp->post.db, start, input) ||
> > > +	    rpp_module_call(&rpp->post.cac, start, input) ||
> > > +	    rpp_module_call(&rpp->post.ccor, start, input) ||
> > > +	    rpp_module_call(&rpp->post.ltm, start, input) ||
> > > +	    rpp_module_call(&rpp->post.bdrgb, start, input) ||
> > > +	    rpp_module_call(&rpp->post.shrp, start, input) ||
> > > +	    rpp_module_call(&rpp->post.ltmmeas, start, input) ||
> > > +	    rpp_module_call(&rpp->post.wbmeas, start, input) ||
> > > +	    rpp_module_call(&rpp->post.hist, start, input))
> > > +		return -EINVAL;
> > > +
> > > +	if (hv && (rpp_module_call(&rpp->hv.ga, start, hv) ||
> > > +		   rpp_module_call(&rpp->hv.ccor, start, hv) ||
> > > +		   rpp_module_call(&rpp->hv.outregs, start, hv) ||
> > > +		   rpp_module_call(&rpp->hv.is, start, hv) ||
> > > +		   rpp_module_call(&rpp->hv.outif, start, hv)))
> > > +		return -EINVAL;
> > > +
> > > +	if (mv && (rpp_module_call(&rpp->mv.ga, start, mv) ||
> > > +		   rpp_module_call(&rpp->mv.ccor, start, mv) ||
> > > +		   rpp_module_call(&rpp->mv.xyz2luv, start, mv) ||
> > > +		   rpp_module_call(&rpp->mv.outregs, start, mv) ||
> > > +		   rpp_module_call(&rpp->mv.is, start, mv) ||
> > > +		   rpp_module_call(&rpp->mv.outif, start, mv)))
> > > +		return -EINVAL;
> > > +
> > > +	/* Immediate update for shadows. */
> > > +	rppx1_write(rpp, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_CFG_UPD);
> > > +
> > > +	/* Clear fault interrupts. */
> > > +	rppx1_write(rpp, RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_REG,
> > > +		    RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_ENABLE);
> > > +	rppx1_write(rpp, RPPX1_RPP_HDR_FMU_FSM_REG,
> > > +		    RPPX1_RPP_HDR_FMU_FSM_PRE2_FIFO_OVFLW |
> > > +		    RPPX1_RPP_HDR_FMU_FSM_PRE1_FIFO_OVFLW);
> > > +	rppx1_write(rpp, RPPX1_RPP_HDR_FMU_FSC_REG,
> > > +		    rppx1_read(rpp, RPPX1_RPP_HDR_FMU_MFS_REG));
> > > +	rppx1_write(rpp, RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_REG,
> > > +		    RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_DISABLE);
> > > +
> > > +	/* Set interrupt mask. */
> > > +	rppx1_write(rpp, RPPX1_RPP_ISM, RPPX1_IRQ_ID_OUT_FRAME);
> > > +
> > > +	/* Immediate commit update for shadows. */
> > > +	rppx1_write(rpp, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_CFG_UPD);
> > > +
> > > +	/* Then for operation update shadows with picture synchronization. */
> > > +	rppx1_write(rpp, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD);
> > > +
> > > +	/* Clear any pending interrupts. */
> > > +	rppx1_interrupt(rpp, NULL);
> > > +
> > > +	/* Enable input formatters. */
> > > +	rppx1_write(rpp, RPPX1_RPP_HDR_INFORM_ENABLE_REG,
> > > +		    RPPX1_RPP_HDR_INFORM_ENABLE_ENABLE);
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(rppx1_start);
> > > +
> > > +int rppx1_stop(struct rppx1 *rpp)
> > > +{
> > > +	/* Disable input formatters. */
> > > +	rppx1_write(rpp, RPPX1_RPP_HDR_INFORM_ENABLE_REG,
> > > +		    RPPX1_RPP_HDR_INFORM_ENABLE_DISABLE);
> > > +
> > > +	/* Clear any pending interrupts. */
> > > +	rppx1_interrupt(rpp, NULL);
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(rppx1_stop);
> > > +
> > > +MODULE_AUTHOR("Niklas Söderlund <niklas.soderlund@ragnatech.se>");
> > > +MODULE_DESCRIPTION("Dreamchip HDR RPPX1 support library");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.h b/drivers/media/platform/dreamchip/rppx1/rppx1.h
> > > new file mode 100644
> > > index 000000000000..3bf3955afbae
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1.h
> > > @@ -0,0 +1,105 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#ifndef __MEDIA_RPPX1_H__
> > > +#define __MEDIA_RPPX1_H__
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/types.h>
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define RPPX1_IRQ_ID_256HIST			BIT(27)
> > > +#define RPPX1_IRQ_ID_PRE2_DPCC			BIT(25)
> > > +#define RPPX1_IRQ_ID_PRE1_DPCC			BIT(24)
> > > +#define RPPX1_IRQ_ID_MV_OUT_FRAME_OUT		BIT(23)
> > > +#define RPPX1_IRQ_ID_MV_OUT_OFF			BIT(22)
> > > +#define RPPX1_IRQ_ID_POST_AWB_MEAS		BIT(21)
> > > +#define RPPX1_IRQ_ID_POST_HIST_MEAS		BIT(20)
> > > +#define RPPX1_IRQ_ID_POST_TM			BIT(19)
> > > +#define RPPX1_IRQ_ID_PRE1_EXM			BIT(18)
> > > +#define RPPX1_IRQ_ID_PRE1_HIST			BIT(17)
> > > +#define RPPX1_IRQ_ID_PRE1_FRAME_IN		BIT(16)
> > > +#define RPPX1_IRQ_ID_PRE1_HSTART		BIT(15)
> > > +#define RPPX1_IRQ_ID_PRE1_VSTART		BIT(14)
> > > +#define RPPX1_IRQ_ID_PRE2_EXM			BIT(13)
> > > +#define RPPX1_IRQ_ID_PRE2_HIST			BIT(12)
> > > +#define RPPX1_IRQ_ID_PRE2_FRAME_IN		BIT(11)
> > > +#define RPPX1_IRQ_ID_PRE2_HSTART		BIT(10)
> > > +#define RPPX1_IRQ_ID_PRE2_VSTART		BIT(9)
> > > +#define RPPX1_IRQ_ID_OUT_FRAME			BIT(3)
> > > +#define RPPX1_IRQ_ID_OUT_OFF			BIT(2)
> > > +#define RPPX1_IRQ_ID_RMAP_MEAS			BIT(1)
> > > +#define RPPX1_IRQ_ID_RMAP_DONE			BIT(0)
> > > +
> > > +struct rppx1 {
> > > +	struct device *dev;
> > > +	void __iomem *base;
> > > +
> > > +	struct {
> > > +		struct rpp_module acq;
> > > +		struct rpp_module bls;
> > > +		struct rpp_module lin;
> > > +		struct rpp_module lsc;
> > > +		struct rpp_module awbg;
> > > +		struct rpp_module dpcc;
> > > +		struct rpp_module bd;
> > > +		struct rpp_module hist;
> > > +		struct rpp_module hist256;
> > > +		struct rpp_module exm;
> > > +	} pre1;
> > > +
> > > +	struct {
> > > +		struct rpp_module acq;
> > > +		struct rpp_module bls;
> > > +		struct rpp_module lin;
> > > +		struct rpp_module lsc;
> > > +		struct rpp_module awbg;
> > > +		struct rpp_module dpcc;
> > > +		struct rpp_module bd;
> > > +		struct rpp_module hist;
> > > +		struct rpp_module exm;
> > > +	} pre2;
> > > +
> > > +	struct {
> > > +		struct rpp_module awbg;
> > > +		struct rpp_module ccor;
> > > +		struct rpp_module hist;
> > > +		struct rpp_module db;
> > > +		struct rpp_module cac;
> > > +		struct rpp_module ltm;
> > > +		struct rpp_module ltmmeas;
> > > +		struct rpp_module wbmeas;
> > > +		struct rpp_module bdrgb;
> > > +		struct rpp_module shrp;
> > > +	} post;
> > > +
> > > +	struct {
> > > +		struct rpp_module ga;
> > > +		struct rpp_module is;
> > > +		struct rpp_module ccor;
> > > +		struct rpp_module outif;
> > > +		struct rpp_module outregs;
> > > +	} hv;
> > > +
> > > +	struct {
> > > +		struct rpp_module ga;
> > > +		struct rpp_module is;
> > > +		struct rpp_module ccor;
> > > +		struct rpp_module outif;
> > > +		struct rpp_module outregs;
> > > +		struct rpp_module xyz2luv;
> > > +	} mv;
> > > +
> > > +	struct rpp_module rmap;
> > > +	struct rpp_module rmapmeas;
> > > +};
> > > +
> > > +void rppx1_write(struct rppx1 *rpp, u32 offset, u32 value);
> > > +u32 rppx1_read(struct rppx1 *rpp, u32 offset);
> > > +
> > > +#endif /* __MEDIA_RPPX1_H__ */
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_acq.c b/drivers/media/platform/dreamchip/rppx1/rppx1_acq.c
> > > new file mode 100644
> > > index 000000000000..d5624e3c76a9
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_acq.c
> > > @@ -0,0 +1,148 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define ACQ_VERSION_REG				0x0000
> > > +
> > > +#define ACQ_CTRL_REG				0x0004
> > > +#define ACQ_CTRL_ALTERNATIVE_CFG_MODE_ENABLE	BIT(8)
> > > +#define ACQ_CTRL_RPP_MODE_MASK			GENMASK(3, 1)
> > > +#define ACQ_CTRL_RPP_MODE_RAWBT601		(0 << 1)
> > > +#define ACQ_CTRL_RPP_MODE_BT656			(1 << 1)
> > > +#define ACQ_CTRL_RPP_MODE_BT601			(2 << 1)
> > > +#define ACQ_CTRL_RPP_MODE_BAYER			(3 << 1)
> > > +#define ACQ_CTRL_RPP_MODE_DATA			(4 << 1)
> > > +#define ACQ_CTRL_RPP_MODE_BAYERRGB		(5 << 1)
> > > +#define ACQ_CTRL_RPP_MODE_RAWBT656		(6 << 1)
> > > +#define ACQ_CTRL_INFORM_EN_ENABLE		BIT(0)
> > > +
> > > +#define ACQ_PROP_REG				0x0008
> > > +
> > > +#define ACQ_PROP_SENSOR_IN_LSB_ALIGNED_IN_LSB	BIT(30)
> > > +#define ACQ_PROP_YUV_OUT_SEL			BIT(25)
> > > +#define ACQ_PROP_MUX_DMA_SEL			BIT(24)
> > > +#define ACQ_PROP_SECOND_INPUT_TYPE		BIT(18)
> > > +#define ACQ_PROP_LATENCY_FIFO_INPUT_SELECTION	BIT(15)
> > > +#define ACQ_PROP_INPUT_SELECTION_MASK		GENMASK(14, 12)
> > > +#define ACQ_PROP_INPUT_SELECTION_8BIT		(0 << 12)
> > > +#define ACQ_PROP_INPUT_SELECTION_10BIT		(1 << 12)
> > > +#define ACQ_PROP_INPUT_SELECTION_12BIT		(2 << 12)
> > > +#define ACQ_PROP_BAYER_PAT_MASK			GENMASK(4, 3)
> > > +#define ACQ_PROP_BAYER_PAT_RGRG			(0 << 3)
> > > +#define ACQ_PROP_BAYER_PAT_GRGR			(1 << 3)
> > > +#define ACQ_PROP_BAYER_PAT_GBGB			(2 << 3)
> > > +#define ACQ_PROP_BAYER_PAT_BGBG			(3 << 3)
> > > +#define ACQ_PROP_VSYNC_POL			BIT(2)
> > > +#define ACQ_PROP_HSYNC_POL			BIT(1)
> > > +#define ACQ_PROP_SAMPLE_EDGE			BIT(0)
> > > +
> > > +#define ACQ_H_OFFS_REG				0x000c
> > > +#define ACQ_V_OFFS_REG				0x0010
> > > +#define ACQ_H_SIZE_REG				0x0014
> > > +#define ACQ_V_SIZE_REG				0x0018
> > > +#define ACQ_OUT_H_OFFS_REG			0x001c
> > > +#define ACQ_OUT_V_OFFS_REG			0x0020
> > > +#define ACQ_OUT_H_SIZE_REG			0x0024
> > > +#define ACQ_OUT_V_SIZE_REG			0x0028
> > > +#define FLAGS_SHD_REG				0x002c
> > > +#define ACQ_OUT_H_OFFS_SHD_REG			0x0030
> > > +#define ACQ_OUT_V_OFFS_SHD_REG			0x0034
> > > +#define ACQ_OUT_H_SIZE_SHD_REG			0x0038
> > > +#define ACQ_OUT_V_SIZE_SHD_REG			0x003c
> > > +
> > > +static int rppx1_acq_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, ACQ_VERSION_REG) != 0x0b)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rppx1_acq_start(struct rpp_module *mod,
> > > +			   const struct v4l2_mbus_framefmt *fmt)
> > > +{
> > > +	u32 bayerpat, selection;
> > > +
> > > +	rpp_module_clrset(mod, ACQ_CTRL_REG, ACQ_CTRL_RPP_MODE_MASK,
> > > +			  ACQ_CTRL_RPP_MODE_BAYER);
> > > +
> > > +	rpp_module_write(mod, ACQ_H_OFFS_REG, 0);
> > > +	rpp_module_write(mod, ACQ_V_OFFS_REG, 0);
> > > +	rpp_module_write(mod, ACQ_H_SIZE_REG, fmt->width);
> > > +	rpp_module_write(mod, ACQ_V_SIZE_REG, fmt->height);
> > > +	rpp_module_write(mod, ACQ_OUT_H_OFFS_REG, 0);
> > > +	rpp_module_write(mod, ACQ_OUT_V_OFFS_REG, 0);
> > > +	rpp_module_write(mod, ACQ_OUT_H_SIZE_REG, fmt->width);
> > > +	rpp_module_write(mod, ACQ_OUT_V_SIZE_REG, fmt->height);
> > > +
> > > +	switch (fmt->code) {
> > > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > > +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> > > +		mod->info.acq.raw_pattern = RPP_BGGR;
> > > +		bayerpat = ACQ_PROP_BAYER_PAT_BGBG;
> > > +		break;
> > > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > > +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> > > +		mod->info.acq.raw_pattern = RPP_GBRG;
> > > +		bayerpat = ACQ_PROP_BAYER_PAT_GBGB;
> > > +		break;
> > > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > > +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> > > +		mod->info.acq.raw_pattern = RPP_GRBG;
> > > +		bayerpat = ACQ_PROP_BAYER_PAT_GRGR;
> > > +		break;
> > > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > > +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > > +		mod->info.acq.raw_pattern = RPP_RGGB;
> > > +		bayerpat = ACQ_PROP_BAYER_PAT_RGRG;
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	switch (fmt->code) {
> > > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > +		selection = ACQ_PROP_INPUT_SELECTION_8BIT;
> > > +		break;
> > > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > > +		selection = ACQ_PROP_INPUT_SELECTION_10BIT;
> > > +		break;
> > > +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> > > +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> > > +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> > > +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > > +		selection = ACQ_PROP_INPUT_SELECTION_12BIT;
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	rpp_module_write(mod, ACQ_PROP_REG, bayerpat | selection |
> > > +			 ACQ_PROP_SENSOR_IN_LSB_ALIGNED_IN_LSB);
> > > +
> > > +	rpp_module_clrset(mod, ACQ_CTRL_REG, ACQ_CTRL_INFORM_EN_ENABLE,
> > > +			  ACQ_CTRL_INFORM_EN_ENABLE);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_acq_ops = {
> > > +	.probe = rppx1_acq_probe,
> > > +	.start = rppx1_acq_start,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
> > > new file mode 100644
> > > index 000000000000..4a242b41142b
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
> > > @@ -0,0 +1,31 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define AWB_GAIN_VERSION_REG		0x0000
> > > +
> > > +#define AWB_ENABLE_REG			0x0004
> > > +#define AWB_ENABLE_AWB_GAIN_EN		BIT(0)
> > > +
> > > +#define AWB_GAIN_GR_REG			0x0008
> > > +#define AWB_GAIN_GB_REG			0x000c
> > > +#define AWB_GAIN_R_REG			0x0010
> > > +#define AWB_GAIN_B_REG			0x0014
> > > +
> > > +static int rppx1_awbg_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, AWB_GAIN_VERSION_REG) != 3)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_awbg_ops = {
> > > +	.probe = rppx1_awbg_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
> > > new file mode 100644
> > > index 000000000000..fcbaa0ee9281
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
> > > @@ -0,0 +1,53 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define DPF_VERSION_REG			0x0000
> > > +
> > > +#define DPF_MODE_REG			0x0004
> > > +#define DPF_MODE_USE_NF_GAIN		BIT(9)
> > > +#define DPF_MODE_LSC_GAIN_COMP		BIT(8)
> > > +#define DPF_MODE_NLL_SEGMENTATION	BIT(6)
> > > +#define DPF_MODE_RB_FILTER_SIZE		BIT(5)
> > > +#define DPF_MODE_R_FILTER_OFF		BIT(4)
> > > +#define DPF_MODE_GR_FILTER_OFF		BIT(3)
> > > +#define DPF_MODE_GB_FILTER_OFF		BIT(2)
> > > +#define DPF_MODE_B_FILTER_OFF		BIT(1)
> > > +#define DPF_MODE_DPF_ENABLE		BIT(0)
> > > +
> > > +#define DPF_STRENGTH_R_REG		0x0008
> > > +#define DPF_STRENGTH_G_REG		0x000c
> > > +#define DPF_STRENGTH_B_REG		0x0010
> > > +#define DPF_S_WEIGHT_G_1_4_REG		0x0014
> > > +#define DPF_S_WEIGHT_G_5_6_REG		0x0018
> > > +#define DPF_S_WEIGHT_RB_1_4_REG		0x001c
> > > +#define DPF_S_WEIGHT_RB_5_6_REG		0x0020
> > > +
> > > +#define DPF_NLL_G_COEFF_REG_NUM		17
> > > +#define DPF_NLL_G_COEFF_REG(n)		(0x0024 + (4 * (n)))
> > > +
> > > +#define DPF_NLL_RB_COEFF_REG_NUM	17
> > > +#define DPF_NLL_RB_COEFF_REG(n)		(0x0068 + (4 * (n)))
> > > +
> > > +#define DPF_NF_GAIN_R_REG		0x00ac
> > > +#define DPF_NF_GAIN_GR_REG		0x00b0
> > > +#define DPF_NF_GAIN_GB_REG		0x00b4
> > > +#define DPF_NF_GAIN_B_REG		0x00b8
> > > +
> > > +static int rppx1_bd_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, DPF_VERSION_REG) != 5)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_bd_ops = {
> > > +	.probe = rppx1_bd_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c
> > > new file mode 100644
> > > index 000000000000..1accc106d65b
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c
> > > @@ -0,0 +1,81 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define RGBDENOISE_VERSION_REG					0x0000
> > > +
> > > +#define RGBDENOISE_HW_BYPASS_REG				0x0004
> > > +#define RGBDENOISE_HW_BYPASS_BYPASS_EN				BIT(0)
> > > +
> > > +#define RGBDENOISE_SPNR_CTRL_REG				0x0008
> > > +#define RGBDENOISE_SPNR_CTRL_C2NR_INTENSITY_SHIFT_C_MASK	GENMASK(11, 8)
> > > +#define RGBDENOISE_SPNR_CTRL_C2NR_INTENSITY_SHIFT_Y_MASK	GENMASK(7, 4)
> > > +#define RGBDENOISE_SPNR_CTRL_C2NR_EN				BIT(0)
> > > +
> > > +#define RGBDENOISE_SPNR_LUMA_IF_COEF_00_07_REG			0x000c
> > > +#define RGBDENOISE_SPNR_LUMA_IF_COEF_08_15_REG			0x0010
> > > +#define RGBDENOISE_SPNR_LUMA_IF_COEF_16_23_REG			0x0014
> > > +#define RGBDENOISE_SPNR_LUMA_IF_COEF_24_31_REG			0x0018
> > > +#define RGBDENOISE_SPNR_CHROMA_IF_COEF_00_07_REG		0x001c
> > > +#define RGBDENOISE_SPNR_CHROMA_IF_COEF_08_15_REG		0x0020
> > > +#define RGBDENOISE_SPNR_CHROMA_IF_COEF_16_23_REG		0x0024
> > > +#define RGBDENOISE_SPNR_CHROMA_IF_COEF_24_31_REG		0x0028
> > > +#define RGBDENOISE_SPNR_SPATIAL_COEF_0_3_REG			0x002c
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_0_REG			0x0030
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_1_REG			0x0034
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_2_REG			0x0038
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_3_REG			0x003c
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_4_REG			0x0040
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_5_REG			0x0044
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_6_REG			0x0048
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_7_REG			0x004c
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_8_REG			0x0050
> > > +#define RGBDENOISE_RGB2YUV_CCOR_OFFSET_R_REG			0x0054
> > > +#define RGBDENOISE_RGB2YUV_CCOR_OFFSET_G_REG			0x0058
> > > +#define RGBDENOISE_RGB2YUV_CCOR_OFFSET_B_REG			0x005c
> > > +#define RGBDENOISE_HW_BYPASS_SDW_REG				0x0060
> > > +#define RGBDENOISE_SPNR_CTRL_SDW_REG				0x0064
> > > +#define RGBDENOISE_SPNR_LUMA_IF_COEF_00_07_SDW_REG		0x0068
> > > +#define RGBDENOISE_SPNR_LUMA_IF_COEF_08_15_SDW_REG		0x006c
> > > +#define RGBDENOISE_SPNR_LUMA_IF_COEF_16_23_SDW_REG		0x0070
> > > +#define RGBDENOISE_SPNR_LUMA_IF_COEF_24_31_SDW_REG		0x0074
> > > +#define RGBDENOISE_SPNR_CHROMA_IF_COEF_00_07_SDW_REG		0x0078
> > > +#define RGBDENOISE_SPNR_CHROMA_IF_COEF_08_15_SDW_REG		0x007c
> > > +#define RGBDENOISE_SPNR_CHROMA_IF_COEF_16_23_SDW_REG		0x0080
> > > +#define RGBDENOISE_SPNR_CHROMA_IF_COEF_24_31_SDW_REG		0x0084
> > > +#define RGBDENOISE_SPNR_SPATIAL_COEFF_0_3_SDW_REG		0x0088
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_0_SDW_REG			0x008c
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_1_SDW_REG			0x0090
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_2_SDW_REG			0x0094
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_3_SDW_REG			0x0098
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_4_SDW_REG			0x009c
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_5_SDW_REG			0x00a0
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_6_SDW_REG			0x00a4
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_7_SDW_REG			0x00a8
> > > +#define RGBDENOISE_RGB2YUV_CCOR_COEFF_8_SDW_REG			0x00ac
> > > +#define RGBDENOISE_RGB2YUV_CCOR_OFFSET_R_SDW_REG		0x00b0
> > > +#define RGBDENOISE_RGB2YUV_CCOR_OFFSET_G_SDW_REG		0x00b4
> > > +#define RGBDENOISE_RGB2YUV_CCOR_OFFSET_B_SDW_REG		0x00b8
> > > +
> > > +static int rppx1_bdrgb_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, RGBDENOISE_VERSION_REG)) {
> > > +	case 6:
> > > +		/* 12-bit. */
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_bdrgb_ops = {
> > > +	.probe = rppx1_bdrgb_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> > > new file mode 100644
> > > index 000000000000..882a9a819229
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> > > @@ -0,0 +1,60 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define BLS_VERSION_REG				0x0000
> > > +
> > > +#define BLS_CTRL_REG				0x0004
> > > +#define BLS_CTRL_BLS_WIN2			BIT(3)
> > > +#define BLS_CTRL_BLS_WIN1			BIT(2)
> > > +#define BLS_CTRL_BLS_MODE_MEASURED		BIT(1)
> > > +#define BLS_CTRL_BLS_EN				BIT(0)
> > > +
> > > +#define BLS_SAMPLES_REG				0x0008
> > > +#define BLS_H1_START_REG			0x000c
> > > +#define BLS_H1_STOP_REG				0x0010
> > > +#define BLS_V1_START_REG			0x0014
> > > +#define BLS_V1_STOP_REG				0x0018
> > > +#define BLS_H2_START_REG			0x001c
> > > +#define BLS_H2_STOP_REG				0x0020
> > > +#define BLS_V2_START_REG			0x0024
> > > +#define BLS_V2_STOP_REG				0x0028
> > > +#define BLS_A_FIXED_REG				0x002c
> > > +#define BLS_B_FIXED_REG				0x0030
> > > +#define BLS_C_FIXED_REG				0x0034
> > > +#define BLS_D_FIXED_REG				0x0038
> > > +#define BLS_A_MEASURED_REG			0x003c
> > > +#define BLS_B_MEASURED_REG			0x0040
> > > +#define BLS_C_MEASURED_REG			0x0044
> > > +#define BLS_D_MEASURED_REG			0x0048
> > > +
> > > +static int rppx1_bls_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, BLS_VERSION_REG)) {
> > > +	case 3:
> > > +	case 5:
> > > +		/* 12-bit. */
> > > +		break;
> > > +	case 2:
> > > +	case 4:
> > > +		/* 20-bit. */
> > > +		break;
> > > +	case 6:
> > > +		/* 24-bit. */
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_bls_ops = {
> > > +	.probe = rppx1_bls_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_cac.c b/drivers/media/platform/dreamchip/rppx1/rppx1_cac.c
> > > new file mode 100644
> > > index 000000000000..fb3bfa668425
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_cac.c
> > > @@ -0,0 +1,30 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define CAC_VERSION_REG			0x0000
> > > +#define CAC_CTRL_REG			0x0004
> > > +#define CAC_COUNT_START_REG		0x0008
> > > +#define CAC_A_REG			0x000c
> > > +#define CAC_B_REG			0x0010
> > > +#define CAC_C_REG			0x0014
> > > +#define CAC_X_NORM_REG			0x0018
> > > +#define CAC_Y_NORM_REG			0x001c
> > > +
> > > +static int rppx1_cac_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, CAC_VERSION_REG) != 3)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_cac_ops = {
> > > +	.probe = rppx1_cac_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
> > > new file mode 100644
> > > index 000000000000..3bfad3ba12e6
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
> > > @@ -0,0 +1,105 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define CCOR_VERSION_REG				0x0000
> > > +
> > > +#define CCOR_COEFF_REG_NUM				9
> > > +#define CCOR_COEFF_REG(n)				(0x0004 + (4 * (n)))
> > > +
> > > +#define CCOR_OFFSET_R_REG				0x0028
> > > +#define CCOR_OFFSET_G_REG				0x002c
> > > +#define CCOR_OFFSET_B_REG				0x0030
> > > +
> > > +#define CCOR_CONFIG_TYPE_REG				0x0034
> > > +#define CCOR_CONFIG_TYPE_USE_OFFSETS_AS_PRE_OFFSETS	BIT(1)
> > > +#define CCOR_CONFIG_TYPE_CCOR_RANGE_AVAILABLE		BIT(0)
> > > +
> > > +#define CCOR_RANGE_REG					0x0038
> > > +#define CCOR_RANGE_CCOR_C_RANGE				BIT(1)
> > > +#define CCOR_RANGE_CCOR_Y_RANGE				BIT(0)
> > > +
> > > +static int rppx1_ccor_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, CCOR_VERSION_REG)) {
> > > +	case 3:
> > > +		/* 12-bit. */
> > > +		break;
> > > +	case 4:
> > > +		/* 20-bit. */
> > > +		break;
> > > +	case 5:
> > > +		/* 24-bit. */
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rppx1_ccor_start(struct rpp_module *mod,
> > > +			    const struct v4l2_mbus_framefmt *fmt)
> > > +{
> > > +	/* Configure matrix in bypass mode. */
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(0), 0x1000);
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(1), 0x0000);
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(2), 0x0000);
> > > +
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(3), 0x0000);
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(4), 0x1000);
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(5), 0x0000);
> > > +
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(6), 0x0000);
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(7), 0x0000);
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(8), 0x1000);
> > > +
> > > +	rpp_module_write(mod, CCOR_OFFSET_R_REG, 0x00000000);
> > > +	rpp_module_write(mod, CCOR_OFFSET_G_REG, 0x00000000);
> > > +	rpp_module_write(mod, CCOR_OFFSET_B_REG, 0x00000000);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_ccor_ops = {
> > > +	.probe = rppx1_ccor_probe,
> > > +	.start = rppx1_ccor_start,
> > > +};
> > > +
> > > +static int rppx1_ccor_csm_start(struct rpp_module *mod,
> > > +				const struct v4l2_mbus_framefmt *fmt)
> > > +{
> > > +	/* Reuse bypass matrix setup. */
> > > +	if (fmt->code == MEDIA_BUS_FMT_RGB888_1X24)
> > > +		return rppx1_ccor_start(mod, fmt);
> > > +
> > > +	/* Color Transformation RGB to YUV according to ITU-R BT.709. */
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(0), 0x0367);
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(1), 0x0b71);
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(2), 0x0128);
> > > +
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(3), 0xfe2b);
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(4), 0xf9d5);
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(5), 0x0800);
> > > +
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(6), 0x0800);
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(7), 0xf8bc);
> > > +	rpp_module_write(mod, CCOR_COEFF_REG(8), 0xff44);
> > > +
> > > +	rpp_module_write(mod, CCOR_OFFSET_R_REG, 0x00000000);
> > > +	rpp_module_write(mod, CCOR_OFFSET_G_REG, 0x00000800);
> > > +	rpp_module_write(mod, CCOR_OFFSET_B_REG, 0x00000800);
> >
> > Is this a leftover or is it intetional ?
>
> Intentional.
>
> Most of the _start callbacks just disables or configure pass-thru mode
> of each modules that are not used (read not yet configured by
> user-space). And this is what is done here, configure the CCOR in
> pass-thru mode.
>
> The RGB case is easiest as it's just configure the identity matrix.
> While for the YUV case we need to pick something as a default and I
> picked ITU-R BT.709 as IIRC this was the default for RkISP1.

Sorry, I don't think I'm following here.

Color correction is applied in RGB space, what's the YUV case and
why should you use the CCM for color-space conversion ?

Are you confusing this block with the colorspace conversion matrix in
the AWB stats engine that is used to return stats in YUV mode ?

>
> >
> > Userspace is expected to fully configure the block, I'm not sure this
> > default initialization is useful.
>
> If this is not configured I have been able to lockup the whole
> processing pipeline during development.
>

Indeed, if there's no disable bit, the ccm shall be programmed with an
identity matrix

 write(priv, mod->base + CCOR_COEFF_REG(0), 0x1000);
 write(priv, mod->base + CCOR_COEFF_REG(1), 0x0000);
 write(priv, mod->base + CCOR_COEFF_REG(2), 0x0000);

 write(priv, mod->base + CCOR_COEFF_REG(3), 0x0000);
 write(priv, mod->base + CCOR_COEFF_REG(4), 0x1000);
 write(priv, mod->base + CCOR_COEFF_REG(5), 0x0000);

 write(priv, mod->base + CCOR_COEFF_REG(6), 0x0000);
 write(priv, mod->base + CCOR_COEFF_REG(7), 0x0000);
 write(priv, mod->base + CCOR_COEFF_REG(8), 0x1000);

 write(priv, mod->base + CCOR_OFFSET_R_REG, 0x00000000);
 write(priv, mod->base + CCOR_OFFSET_G_REG, 0x00000000);
 write(priv, mod->base + CCOR_OFFSET_B_REG, 0x00000000);

?

> >
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_ccor_csm_ops = {
> > > +	.probe = rppx1_ccor_probe,
> > > +	.start = rppx1_ccor_csm_start,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
> > > new file mode 100644
> > > index 000000000000..78a330066b7e
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
> > > @@ -0,0 +1,45 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define FILT_VERSION_REG		0x0000
> > > +
> > > +#define DEMOSAIC_REG			0x0004
> > > +#define DEMOSAIC_DEMOSAIC_BYPASS	BIT(16)
> > > +#define DEMOSAIC_DEMOSAIC_TH_MASK	GENMASK(15, 0)
> > > +
> > > +#define FILT_MODE_REG			0x0008
> > > +#define FILT_MODE_FILT_LP_SELECT_MASK	GENMASK(11, 8)
> > > +#define FILT_MODE_FILT_CHR_H_MODE_MASK	GENMASK(7, 6)
> > > +#define FILT_MODE_FILT_CHR_V_MODE_MASK	GENMASK(5, 4)
> > > +#define FILT_MODE_FILT_MODE		BIT(1)
> > > +#define FILT_MODE_FILT_ENABLE		BIT(0)
> > > +
> > > +#define FILT_THRESH_BL0_REG		0x000c
> > > +#define FILT_THRESH_BL1_REG		0x0010
> > > +#define FILT_THRESH_SH0_REG		0x0014
> > > +#define FILT_THRESH_SH1_REG		0x0018
> > > +#define FILT_LUM_WEIGHT_REG		0x001c
> > > +#define FILT_FAC_SH1_REG		0x0020
> > > +#define FILT_FAC_SH0_REG		0x0024
> > > +#define FILT_FAC_MID_REG		0x0028
> > > +#define FILT_FAC_BL0_REG		0x002c
> > > +#define FILT_FAC_BL1_REG		0x0030
> > > +
> > > +static int rppx1_db_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, FILT_VERSION_REG) != 5)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_db_ops = {
> > > +	.probe = rppx1_db_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c
> > > new file mode 100644
> > > index 000000000000..3d5d9c0a7e72
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c
> > > @@ -0,0 +1,77 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define DPCC_VERSION_REG			0x0000
> > > +
> > > +#define DPCC_MODE_REG				0x0004
> > > +#define DPCC_MODE_STAGE1_ENABLE			BIT(2)
> > > +#define DPCC_MODE_GRAYSCALE_MODE		BIT(1)
> > > +#define DPCC_MODE_DPCC_ENABLE			BIT(0)
> > > +
> > > +#define DPCC_OUTPUT_MODE_REG			0x0008
> > > +#define DPCC_SET_USE_REG			0x000c
> > > +#define DPCC_METHODS_SET_1_REG			0x0010
> > > +#define DPCC_METHODS_SET_2_REG			0x0014
> > > +#define DPCC_METHODS_SET_3_REG			0x0018
> > > +#define DPCC_LINE_THRESH_1_REG			0x001c
> > > +#define DPCC_LINE_MAD_FAC_1_REG			0x0020
> > > +#define DPCC_PG_FAC_1_REG			0x0024
> > > +#define DPCC_RND_THRESH_1_REG			0x0028
> > > +#define DPCC_RG_FAC_1_REG			0x002c
> > > +#define DPCC_LINE_THRESH_2_REG			0x0030
> > > +#define DPCC_LINE_MAD_FAC_2_REG			0x0034
> > > +#define DPCC_PG_FAC_2_REG			0x0038
> > > +#define DPCC_RND_THRESH_2_REG			0x003c
> > > +#define DPCC_RG_FAC_2_REG			0x0040
> > > +#define DPCC_LINE_THRESH_3_REG			0x0044
> > > +#define DPCC_LINE_MAD_FAC_3_REG			0x0048
> > > +#define DPCC_PG_FAC_3_REG			0x004c
> > > +#define DPCC_RND_THRESH_3_REG			0x0050
> > > +#define DPCC_RG_FAC_3_REG			0x0054
> > > +#define DPCC_RO_LIMITS_REG			0x0058
> > > +#define DPCC_RND_OFFS_REG			0x005c
> > > +#define DPCC_BPT_CTRL_REG			0x0060
> > > +#define DPCC_BP_NUMBER_REG			0x0064
> > > +#define DPCC_BP_TADDR_REG			0x0068
> > > +#define DPCC_BP_POSITION_REG			0x006c
> > > +
> > > +static int rppx1_dpcc_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, DPCC_VERSION_REG)) {
> > > +	case 2:
> > > +	case 4:
> > > +	case 6:
> > > +		/* 12-bit. */
> > > +		break;
> > > +	case 3:
> > > +	case 5:
> > > +	case 7:
> > > +		/* 24-bit. */
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rppx1_dpcc_start(struct rpp_module *mod,
> > > +			    const struct v4l2_mbus_framefmt *fmt)
> > > +{
> > > +	/* Bypass stage1 and DPCC. */
> > > +	rpp_module_write(mod, DPCC_MODE_REG, 0);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_dpcc_ops = {
> > > +	.probe = rppx1_dpcc_probe,
> > > +	.start = rppx1_dpcc_start,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
> > > new file mode 100644
> > > index 000000000000..10b899ba201f
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
> > > @@ -0,0 +1,52 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define EXM_VERSION_REG			0x0000
> > > +#define EXM_START_REG			0x0004
> > > +
> > > +#define EXM_CTRL_REG			0x0008
> > > +#define EXM_CTRL_EXM_UPDATE_ENABLE	BIT(0)
> > > +
> > > +#define EXM_MODE_REG			0x000c
> > > +#define EXM_CHANNEL_SEL_REG		0x0010
> > > +#define EXM_LAST_MEAS_LINE_REG		0x0014
> > > +#define EXM_COEFF_R_REG			0x0018
> > > +#define EXM_COEFF_G_GR_REG		0x001c
> > > +#define EXM_COEFF_B_REG			0x0020
> > > +#define EXM_COEFF_GB_REG		0x0024
> > > +#define EXM_H_OFFS_REG			0x0028
> > > +#define EXM_V_OFFS_REG			0x002c
> > > +#define EXM_H_SIZE_REG			0x0030
> > > +#define EXM_V_SIZE_REG			0x0034
> > > +#define EXM_FORCED_UPD_START_LINE_REG	0x0038
> > > +#define EXM_VSTART_STATUS_REG		0x003c
> > > +
> > > +#define EXM_MEAN_REG_NUM		25
> > > +#define EXM_MEAN_REG(n)			(0x0040 + (4 * (n)))
> > > +
> > > +static int rppx1_exm_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, EXM_VERSION_REG)) {
> > > +	case 1:
> > > +		/* 8-bit. */
> > > +		break;
> > > +	case 3:
> > > +		/* 20-bit. */
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_exm_ops = {
> > > +	.probe = rppx1_exm_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
> > > new file mode 100644
> > > index 000000000000..0667672b2694
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
> > > @@ -0,0 +1,50 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define GAMMA_OUT_VERSION_REG			0x0000
> > > +
> > > +#define GAMMA_OUT_ENABLE_REG			0x0004
> > > +#define GAMMA_OUT_ENABLE_GAMMA_OUT_EN		BIT(0)
> > > +
> > > +#define GAMMA_OUT_MODE_REG			0x0008
> > > +#define GAMMA_OUT_MODE_GAMMA_OUT_EQU_SEGM	BIT(0)
> > > +
> > > +#define GAMMA_OUT_Y_REG_NUM			17
> > > +#define GAMMA_OUT_Y_REG(n)			(0x000c + (4 * (n)))
> > > +
> > > +static int rppx1_ga_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, GAMMA_OUT_VERSION_REG)) {
> > > +	case 1:
> > > +		/* 12-bit. */
> > > +		break;
> > > +	case 2:
> > > +		/* 24-bit. */
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rppx1_ga_start(struct rpp_module *mod,
> > > +			  const struct v4l2_mbus_framefmt *fmt)
> > > +{
> > > +	/* Disable stage. */
> > > +	rpp_module_write(mod, GAMMA_OUT_ENABLE_REG, 0);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_ga_ops = {
> > > +	.probe = rppx1_ga_probe,
> > > +	.start = rppx1_ga_start,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
> > > new file mode 100644
> > > index 000000000000..7c1b42e96b96
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
> > > @@ -0,0 +1,77 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define HIST_VERSION_REG			0x0000
> > > +
> > > +#define HIST_CTRL_REG				0x0004
> > > +#define HIST_CTRL_HIST_UPDATE_ENABLE		BIT(0)
> > > +
> > > +#define HIST_MODE_REG				0x0008
> > > +#define HIST_MODE_HIST_MODE_MASK		GENMASK(2, 0)
> > > +#define HIST_MODE_HIST_MODE_DISABLE		0
> > > +#define HIST_MODE_HIST_MODE_YRGB		1
> > > +#define HIST_MODE_HIST_MODE_R			2
> > > +#define HIST_MODE_HIST_MODE_GR			3
> > > +#define HIST_MODE_HIST_MODE_B			4
> > > +#define HIST_MODE_HIST_MODE_GB			5
> > > +
> > > +#define HIST_CHANNEL_SEL_REG			0x000c
> > > +#define HIST_CHANNEL_SEL_CHANNEL_SELECT_MASK	GENMASK(2, 0)
> > > +
> > > +#define HIST_LAST_MEAS_LINE_REG			0x0010
> > > +#define HIST_SUBSAMPLING_REG			0x0014
> > > +#define HIST_COEFF_R_REG			0x0018
> > > +#define HIST_COEFF_G_REG			0x001c
> > > +#define HIST_COEFF_B_REG			0x0020
> > > +#define HIST_H_OFFS_REG				0x0024
> > > +#define HIST_V_OFFS_REG				0x0028
> > > +#define HIST_H_SIZE_REG				0x002c
> > > +#define HIST_V_SIZE_REG				0x0030
> > > +
> > > +#define HIST_SAMPLE_RANGE_REG			0x0034
> > > +#define HIST_SAMPLE_RANGE_SAMPLE_SHIFT_MASK	GENMASK(28, 24)
> > > +#define HIST_SAMPLE_RANGE_SAMPLE_OFFSET_MASK	GENMASK(23, 0)
> > > +
> > > +#define HIST_WEIGHT_00TO30_REG			0x0038
> > > +#define HIST_WEIGHT_40TO21_REG			0x003c
> > > +#define HIST_WEIGHT_31TO12_REG			0x0040
> > > +#define HIST_WEIGHT_22TO03_REG			0x0044
> > > +#define HIST_WEIGHT_13TO43_REG			0x0048
> > > +#define HIST_WEIGHT_04TO34_REG			0x004c
> > > +#define HIST_WEIGHT_44_REG			0x0050
> > > +#define HIST_FORCED_UPD_START_LINE_REG		0x0054
> > > +#define HIST_FORCED_UPDATE_REG			0x0058
> > > +#define HIST_VSTART_STATUS_REG			0x005c
> > > +
> > > +#define HIST_BIN_REG_NUM			32
> > > +#define HIST_BIN_REG(n)				(0x0060 + (4 * (n)))
> > > +
> > > +static int rppx1_hist_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, HIST_VERSION_REG)) {
> > > +	case 3:
> > > +		/* 12-bit. */
> > > +		break;
> > > +	case 4:
> > > +		/* 20-bit. */
> > > +		break;
> > > +	case 5:
> > > +		/* 24-bit. */
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_hist_ops = {
> > > +	.probe = rppx1_hist_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_hist256.c b/drivers/media/platform/dreamchip/rppx1/rppx1_hist256.c
> > > new file mode 100644
> > > index 000000000000..80b3244c77aa
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_hist256.c
> > > @@ -0,0 +1,47 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define HIST256_VERSION_REG			0x0000
> > > +#define HIST256_MODE_REG			0x0004
> > > +#define HIST256_MODE_HIST256_MODE		BIT(0)
> > > +
> > > +#define HIST256_CHANNEL_SEL_REG			0x0008
> > > +#define HIST256_CHANNEL_SEL_CHANNEL_SELECT	GENMASK(2, 0)
> > > +
> > > +#define HIST256_H_OFFS_REG			0x000c
> > > +#define HIST256_V_OFFS_REG			0x0010
> > > +#define HIST256_H_SIZE_REG			0x0014
> > > +#define HIST256_V_SIZE_REG			0x0018
> > > +#define HIST256_SAMPLE_OFFSET_REG		0x001c
> > > +#define HIST256_SAMPLE_SCALE_REG		0x0020
> > > +#define HIST256_MEAS_RESULT_ADDR_AUTOINCR_REG	0x0024
> > > +#define HIST256_MEAS_RESULT_ADDR_REG		0x0028
> > > +#define HIST256_MEAS_RESULT_DATA_REG		0x002c
> > > +
> > > +#define HIST256_LOG_ENABLE_REG			0x0030
> > > +#define HIST256_LOG_ENABLE_HIST256_LOG_EN	BIT(0)
> > > +
> > > +#define HIST256_LOG_DX_LO_REG			0x0034
> > > +#define HIST256_LOG_DX_HI_REG			0x0038
> > > +
> > > +#define HIST256_Y_REG_NUM			17
> > > +#define HIST256_Y_REG(n)			(0x0040 + (4 * (n)))
> > > +
> > > +static int rppx1_hist256_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, HIST256_VERSION_REG) != 2)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_hist256_ops = {
> > > +	.probe = rppx1_hist256_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_is.c b/drivers/media/platform/dreamchip/rppx1/rppx1_is.c
> > > new file mode 100644
> > > index 000000000000..7b1b6f6538cf
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_is.c
> > > @@ -0,0 +1,43 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define IS_VERSION			0x0000
> > > +#define IS_H_OFFS			0x0008
> > > +#define IS_V_OFFS			0x000c
> > > +#define IS_H_SIZE			0x0010
> > > +#define IS_V_SIZE			0x0014
> > > +#define IS_H_OFFS_SHD			0x0024
> > > +#define IS_V_OFFS_SHD			0x0028
> > > +#define IS_H_SIZE_SHD			0x002c
> > > +#define IS_V_SIZE_SHD			0x0030
> > > +
> > > +static int rppx1_is_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, IS_VERSION) != 1)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rppx1_is_start(struct rpp_module *mod,
> > > +			  const struct v4l2_mbus_framefmt *fmt)
> > > +{
> > > +	rpp_module_write(mod, IS_H_OFFS, 0);
> > > +	rpp_module_write(mod, IS_V_OFFS, 0);
> > > +	rpp_module_write(mod, IS_H_SIZE, fmt->width);
> > > +	rpp_module_write(mod, IS_V_SIZE, fmt->height);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_is_ops = {
> > > +	.probe = rppx1_is_probe,
> > > +	.start = rppx1_is_start,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
> > > new file mode 100644
> > > index 000000000000..0a0e7ab2d1d6
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
> > > @@ -0,0 +1,59 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +/* NOTE: The module is called LIN the registers GAMMA_IN. */
> > > +#define LIN_VERSION_REG				0x0000
> > > +
> > > +#define LIN_ENABLE_REG				0x0004
> > > +#define LIN_ENABLE_GAMMA_IN_EN			BIT(0)
> > > +
> > > +#define LIN_DX_LO_REG				0x0008
> > > +#define LIN_DX_HI_REG				0x000c
> > > +
> > > +#define LIN_R_Y_REG_NUM				17
> > > +#define LIN_R_Y_REG(n)				(0x0010 + (4 * (n)))
> > > +
> > > +#define LIN_G_Y_REG_NUM				17
> > > +#define LIN_G_Y_REG(n)				(0x0054 + (4 * (n)))
> > > +
> > > +#define LIN_B_Y_REG_NUM				17
> > > +#define LIN_B_Y_REG(n)				(0x0098 + (4 * (n)))
> > > +
> > > +static int rppx1_lin_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, LIN_VERSION_REG)) {
> > > +	case 7:
> > > +		/* 12-bit. */
> > > +		break;
> > > +	case 8:
> > > +		/* 20-bit. */
> > > +		break;
> > > +	case 9:
> > > +		/* 24-bit. */
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rppx1_lin_start(struct rpp_module *mod,
> > > +			   const struct v4l2_mbus_framefmt *fmt)
> > > +{
> > > +	rpp_module_clrset(mod, LIN_ENABLE_REG, LIN_ENABLE_GAMMA_IN_EN, 0);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_lin_ops = {
> > > +	.probe = rppx1_lin_probe,
> > > +	.start = rppx1_lin_start,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
> > > new file mode 100644
> > > index 000000000000..be49fc17ea26
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
> > > @@ -0,0 +1,69 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define LSC_VERSION_REG		0x0000
> > > +
> > > +#define LSC_CTRL_REG		0x0004
> > > +#define LSC_CTRL_LSC_EN		BIT(0)
> > > +
> > > +#define LSC_R_TABLE_ADDR_REG	0x0008
> > > +#define LSC_GR_TABLE_ADDR_REG	0x000c
> > > +#define LSC_B_TABLE_ADDR_REG	0x0010
> > > +#define LSC_GB_TABLE_ADDR_REG	0x0014
> > > +#define LSC_R_TABLE_DATA_REG	0x0018
> > > +#define LSC_GR_TABLE_DATA_REG	0x001c
> > > +#define LSC_B_TABLE_DATA_REG	0x0020
> > > +#define LSC_GB_TABLE_DATA_REG	0x0024
> > > +#define LSC_XGRAD_01_REG	0x0028
> > > +#define LSC_XGRAD_23_REG	0x002c
> > > +#define LSC_XGRAD_45_REG	0x0030
> > > +#define LSC_XGRAD_67_REG	0x0034
> > > +#define LSC_XGRAD_89_REG	0x0038
> > > +#define LSC_XGRAD_1011_REG	0x003c
> > > +#define LSC_XGRAD_1213_REG	0x0040
> > > +#define LSC_XGRAD_1415_REG	0x0044
> > > +#define LSC_YGRAD_01_REG	0x0048
> > > +#define LSC_YGRAD_23_REG	0x004c
> > > +#define LSC_YGRAD_45_REG	0x0050
> > > +#define LSC_YGRAD_67_REG	0x0054
> > > +#define LSC_YGRAD_89_REG	0x0058
> > > +#define LSC_YGRAD_1011_REG	0x005c
> > > +#define LSC_YGRAD_1213_REG	0x0060
> > > +#define LSC_YGRAD_1415_REG	0x0064
> > > +#define LSC_XSIZE_01_REG	0x0068
> > > +#define LSC_XSIZE_23_REG	0x006c
> > > +#define LSC_XSIZE_45_REG	0x0070
> > > +#define LSC_XSIZE_67_REG	0x0074
> > > +#define LSC_XSIZE_89_REG	0x0078
> > > +#define LSC_XSIZE_1011_REG	0x007c
> > > +#define LSC_XSIZE_1213_REG	0x0080
> > > +#define LSC_XSIZE_1415_REG	0x0084
> > > +#define LSC_YSIZE_01_REG	0x0088
> > > +#define LSC_YSIZE_23_REG	0x008c
> > > +#define LSC_YSIZE_45_REG	0x0090
> > > +#define LSC_YSIZE_67_REG	0x0094
> > > +#define LSC_YSIZE_89_REG	0x0098
> > > +#define LSC_YSIZE_1011_REG	0x009c
> > > +#define LSC_YSIZE_1213_REG	0x00a0
> > > +#define LSC_YSIZE_1415_REG	0x00a4
> > > +#define LSC_TABLE_SEL_REG	0x00a8
> > > +#define LSC_STATUS_REG		0x00ac
> > > +
> > > +static int rppx1_lsc_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, LSC_VERSION_REG) != 0x04)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_lsc_ops = {
> > > +	.probe = rppx1_lsc_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c
> > > new file mode 100644
> > > index 000000000000..9a71155e7e13
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c
> > > @@ -0,0 +1,49 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define LTM_VERSION_REG				0x0000
> > > +
> > > +#define LTM_CTRL_REG				0x0004
> > > +#define LTM_CTRL_LTM_ENABLE			BIT(0)
> > > +
> > > +#define LTM_RGB_WEIGHTS_REG			0x0008
> > > +#define LTM_CLB_LINESIZE_REG			0x000c
> > > +#define LTM_TONECURVE_1_REG			0x0010
> > > +#define LTM_TONECURVE_2_REG			0x0014
> > > +#define LTM_TONECURVE_3_REG			0x0018
> > > +#define LTM_TONECURVE_4_REG			0x001c
> > > +#define LTM_TONECURVE_5_REG			0x0020
> > > +#define LTM_TONECURVE_6_REG			0x0024
> > > +#define LTM_TONECURVE_YM_REG(n)			(0x0028 + (4 * (n)))
> > > +#define LTM_L0W_REG				0x00ec
> > > +#define LTM_L0W_R_REG				0x00f0
> > > +#define LTM_L0D_REG				0x00f4
> > > +#define LTM_L0D_R_REG				0x00f8
> > > +#define LTM_KMIND_REG				0x00fc
> > > +#define LTM_KMAXD_REG				0x0100
> > > +#define LTM_KDIFFD_REG				0x0104
> > > +#define LTM_KDIFFD_R_REG			0x0108
> > > +#define LTM_KW_REG				0x010c
> > > +#define LTM_KW_R_REG				0x0110
> > > +#define LTM_CGAIN_REG				0x0114
> > > +#define LTM_LPRCH_R_HIGH_REG			0x0118
> > > +#define LTM_LPRCH_R_LOW_REG			0x011c
> > > +
> > > +static int rppx1_ltm_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, LTM_VERSION_REG) != 8)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_ltm_ops = {
> > > +	.probe = rppx1_ltm_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ltmmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ltmmeas.c
> > > new file mode 100644
> > > index 000000000000..c874b8fa8999
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ltmmeas.c
> > > @@ -0,0 +1,42 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define LTM_MEAS_VERSION_REG		0x0000
> > > +
> > > +#define LTM_MEAS_CTRL_REG		0x0004
> > > +#define LTM_MEAS_CTRL_LTM_MEAS_ENABLE	BIT(0)
> > > +
> > > +#define LTM_MEAS_RGB_WEIGHTS_REG	0x0008
> > > +#define LTM_MEAS_H_OFFS_REG		0x000c
> > > +#define LTM_MEAS_V_OFFS_REG		0x0010
> > > +#define LTM_MEAS_H_SIZE_REG		0x0014
> > > +#define LTM_MEAS_V_SIZE_REG		0x0018
> > > +
> > > +#define LTM_MEAS_PRC_THRESH_NUM		8
> > > +#define LTM_MEAS_PRC_THRESH_REG(n)	(0x001c + (4 * (n)))
> > > +
> > > +#define LTM_MEAS_PRC_REG_NUM		8
> > > +#define LTM_MEAS_PRC_REG(n)		(0x003c + (4 * (n)))
> > > +
> > > +#define LTM_MEAS_L_MIN_REG		0x005c
> > > +#define LTM_MEAS_L_MAX_REG		0x0060
> > > +#define LTM_MEAS_L_GMEAN_REG		0x0064
> > > +
> > > +static int rppx1_ltmmeas_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, LTM_MEAS_VERSION_REG) != 1)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_ltmmeas_ops = {
> > > +	.probe = rppx1_ltmmeas_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_outif.c b/drivers/media/platform/dreamchip/rppx1/rppx1_outif.c
> > > new file mode 100644
> > > index 000000000000..973b82a40d7c
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_outif.c
> > > @@ -0,0 +1,46 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define OUT_IF_VERSION_REG			0x0000
> > > +
> > > +#define OUT_IF_ON_REG				0x0004
> > > +#define OUT_IF_ON_RPP_ON			BIT(0)
> > > +
> > > +#define OUT_IF_OFF_REG				0x0008
> > > +
> > > +#define OUT_IF_NR_FRAMES_REG			0x000c
> > > +#define OUT_IF_NR_FRAMES_NR_FRAMES		GENMASK(9, 0)
> > > +
> > > +#define OUT_IF_NR_FRAMES_CNT_REG		0x0010
> > > +#define FLAGS_SHD_REG				0x0018
> > > +
> > > +static int rppx1_outif_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, OUT_IF_VERSION_REG) != 1)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rppx1_outif_start(struct rpp_module *mod,
> > > +			     const struct v4l2_mbus_framefmt *fmt)
> > > +{
> > > +	rpp_module_clrset(mod, OUT_IF_NR_FRAMES_REG,
> > > +			  OUT_IF_NR_FRAMES_NR_FRAMES, 0);
> > > +
> > > +	rpp_module_write(mod, OUT_IF_ON_REG, OUT_IF_ON_RPP_ON);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_outif_ops = {
> > > +	.probe = rppx1_outif_probe,
> > > +	.start = rppx1_outif_start,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_outregs.c b/drivers/media/platform/dreamchip/rppx1/rppx1_outregs.c
> > > new file mode 100644
> > > index 000000000000..ac8b71867137
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_outregs.c
> > > @@ -0,0 +1,76 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define OUTREGS_VERSION_REG					0x0000
> > > +
> > > +#define OUT_MODE_REG						0x0004
> > > +#define OUT_MODE_UNSELECTED_MODE_MASK				GENMASK(11, 8)
> > > +#define OUT_MODE_UNSELECTED_MODE_MAIN				(0x1 << 8)
> > > +#define OUT_MODE_UNSELECTED_MODE_PRE1				(0x2 << 8)
> > > +#define OUT_MODE_UNSELECTED_MODE_PRE2				(0x4 << 8)
> > > +#define OUT_MODE_IN_SEL_MASK					GENMASK(3, 0)
> > > +#define OUT_MODE_IN_SEL_MAIN					1
> > > +#define OUT_MODE_IN_SEL_PRE1					2
> > > +#define OUT_MODE_IN_SEL_PRE2					4
> > > +
> > > +#define OUT_CONV_422_METHOD_REG					0x0008
> > > +#define OUT_CONV_422_METHOD_CONV_422_METHOD_MASK		GENMASK(1, 0)
> > > +#define OUT_CONV_422_METHOD_CONV_422_METHOD_CO_SITED1		0
> > > +#define OUT_CONV_422_METHOD_CONV_422_METHOD_CO_SITED2		1
> > > +#define OUT_CONV_422_METHOD_CONV_422_METHOD_NON_CO_SITED	2
> > > +
> > > +#define OUTREGS_FORMAT_REG					0x000c
> > > +#define OUTREGS_FORMAT_OUTPUT_FORMAT_MASK			GENMASK(1, 0)
> > > +#define OUTREGS_FORMAT_OUTPUT_FORMAT_RGB			0
> > > +#define OUTREGS_FORMAT_OUTPUT_FORMAT_YUV422			1
> > > +#define OUTREGS_FORMAT_OUTPUT_FORMAT_YUV420			2
> > > +
> > > +static int rppx1_outregs_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, OUTREGS_VERSION_REG) != 2)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rppx1_outregs_start(struct rpp_module *mod,
> > > +			       const struct v4l2_mbus_framefmt *fmt)
> > > +{
> > > +	u32 format;
> > > +
> > > +	switch (fmt->code) {
> > > +	case MEDIA_BUS_FMT_YUYV12_1X24:
> > > +		format = OUTREGS_FORMAT_OUTPUT_FORMAT_YUV422;
> > > +		break;
> > > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > > +		format = OUTREGS_FORMAT_OUTPUT_FORMAT_RGB;
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	rpp_module_clrset(mod, OUT_MODE_REG,
> > > +			  OUT_MODE_UNSELECTED_MODE_MASK | OUT_MODE_IN_SEL_MASK,
> > > +			  OUT_MODE_UNSELECTED_MODE_MASK | OUT_MODE_IN_SEL_MAIN);
> > > +
> > > +	rpp_module_clrset(mod, OUT_CONV_422_METHOD_REG,
> > > +			  OUT_CONV_422_METHOD_CONV_422_METHOD_MASK,
> > > +			  OUT_CONV_422_METHOD_CONV_422_METHOD_CO_SITED1);
> > > +
> > > +	rpp_module_clrset(mod, OUTREGS_FORMAT_REG,
> > > +			  OUTREGS_FORMAT_OUTPUT_FORMAT_MASK, format);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_outregs_ops = {
> > > +	.probe = rppx1_outregs_probe,
> > > +	.start = rppx1_outregs_start,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_rmap.c b/drivers/media/platform/dreamchip/rppx1/rppx1_rmap.c
> > > new file mode 100644
> > > index 000000000000..0a891caf3c52
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_rmap.c
> > > @@ -0,0 +1,63 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define RMAP_DATA_VERSION_REG		0x0000
> > > +
> > > +#define RMAP_CTRL_REG			0x0004
> > > +#define RMAP_CTRL_BYPASS_LONG		BIT(2)
> > > +
> > > +#define RMAP_WBTHRESHOLD_LONG_REG	0x0008
> > > +#define RMAP_WBTHRESHOLD_SHORT_REG	0x000c
> > > +#define RMAP_RESERVED_1_REG		0x0010
> > > +#define RMAP_WBGAIN_LONG_RED_REG	0x0014
> > > +#define RMAP_WBGAIN_LONG_BLUE_REG	0x0018
> > > +#define RMAP_WBGAIN_SHORT_RED_REG	0x001c
> > > +#define RMAP_WBGAIN_SHORT_BLUE_REG	0x0020
> > > +#define RMAP_RESERVED_2_REG		0x0024
> > > +#define RMAP_RESERVED_3_REG		0x0028
> > > +#define RMAP_MAP_FAC_SHORT_REG		0x002c
> > > +#define RMAP_RESERVED_4_REG		0x0030
> > > +#define RMAP_MIN_THRES_SHORT_REG	0x0034
> > > +#define RMAP_MAX_THRES_SHORT_REG	0x0038
> > > +#define RMAP_STEPSIZE_SHORT_REG		0x003c
> > > +#define RMAP_MIN_THRES_LONG_REG		0x0040
> > > +#define RMAP_MAX_THRES_LONG_REG		0x0044
> > > +#define RMAP_STEPSIZE_LONG_REG		0x0048
> > > +#define RMAP_CLB_LINESIZE_REG		0x004c
> > > +
> > > +static int rppx1_rmap_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, RMAP_DATA_VERSION_REG)) {
> > > +	case 8:
> > > +		/* low: 12-bit, high: 20-bit. */
> > > +		break;
> > > +	case 9:
> > > +		/* low: 12-bit, high: 24-bit. */
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rppx1_rmap_start(struct rpp_module *mod,
> > > +			    const struct v4l2_mbus_framefmt *fmt)
> > > +{
> > > +	/* Bypass radiance mapping and use the long exposure channel (PRE1). */
> > > +	rpp_module_write(mod, RMAP_CTRL_REG, RMAP_CTRL_BYPASS_LONG);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_rmap_ops = {
> > > +	.probe = rppx1_rmap_probe,
> > > +	.start = rppx1_rmap_start,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_rmapmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_rmapmeas.c
> > > new file mode 100644
> > > index 000000000000..ef709d2a6ee9
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_rmapmeas.c
> > > @@ -0,0 +1,47 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define RMAP_MEAS_VERSION_REG			0x0000
> > > +#define RMAP_MEAS_MODE_REG			0x0004
> > > +#define RMAP_MEAS_SUBSAMPLING_REG		0x0008
> > > +#define RMAP_MEAS_RESERVED_1_REG		0x000c
> > > +#define RMAP_MEAS_MIN_THRES_SHORT_REG		0x0010
> > > +#define RMAP_MEAS_MAX_THRES_SHORT_REG		0x0014
> > > +#define RMAP_MEAS_MAX_THRES_LONG_REG		0x0018
> > > +#define RMAP_MEAS_H_OFFS_REG			0x001c
> > > +#define RMAP_MEAS_V_OFFS_REG			0x0020
> > > +#define RMAP_MEAS_H_SIZE_REG			0x0024
> > > +#define RMAP_MEAS_V_SIZE_REG			0x0028
> > > +#define RMAP_MEAS_LAST_MEAS_LINE_REG		0x002c
> > > +#define RMAP_MEAS_LS_RESULTSHORT0_REG		0x0030
> > > +#define RMAP_MEAS_LS_RESULTLONG0_REG		0x0034
> > > +#define RMAP_MEAS_RESERVED_2_REG		0x0038
> > > +#define RMAP_MEAS_RESERVED_3_REG		0x003c
> > > +#define RMAP_MEAS_LS_RESULTSHORT1_REG		0x0040
> > > +#define RMAP_MEAS_LS_RESULTLONG1_REG		0x0044
> > > +#define RMAP_MEAS_RESERVED_4_REG		0x0048
> > > +#define RMAP_MEAS_RESERVED_5_REG		0x004c
> > > +
> > > +static int rppx1_rmapmeas_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, RMAP_MEAS_VERSION_REG)) {
> > > +	case 3:
> > > +		/* low: 12-bit, high: 24-bit. */
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_rmapmeas_ops = {
> > > +	.probe = rppx1_rmapmeas_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c b/drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c
> > > new file mode 100644
> > > index 000000000000..c155418129e5
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c
> > > @@ -0,0 +1,65 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define SHRPCNR_VERSION_REG				0x0000
> > > +
> > > +#define SHRPCNR_CTRL_REG				0x0004
> > > +#define SHRPCNR_CTRL_CAD_EN				BIT(3)
> > > +#define SHRPCNR_CTRL_DESAT_EN				BIT(2)
> > > +#define SHRPCNR_CTRL_CNR_EN				BIT(1)
> > > +#define SHRPCNR_CTRL_SHARPEN_EN				BIT(0)
> > > +
> > > +#define SHRPCNR_PARAM_REG				0x0008
> > > +#define SHRPCNR_PARAM_SHARP_FACTOR_MASK			GENMASK(19, 12)
> > > +#define SHRPCNR_PARAM_CORING_THR_MASK			GENMASK(11, 0)
> > > +
> > > +#define SHRPCNR_MAT_1_REG				0x000c
> > > +#define SHRPCNR_MAT_2_REG				0x0010
> > > +#define SHRPCNR_CLB_LINESIZE_REG			0x0014
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_0_REG		0x0018
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_1_REG		0x001c
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_2_REG		0x0020
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_3_REG		0x0024
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_4_REG		0x0028
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_5_REG		0x002c
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_6_REG		0x0030
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_7_REG		0x0034
> > > +#define SHRPCNR_YUV2RGB_CCOR_COEFF_8_REG		0x0038
> > > +#define SHRPCNR_YUV2RGB_CCOR_OFFSET_R_REG		0x003c
> > > +#define SHRPCNR_YUV2RGB_CCOR_OFFSET_G_REG		0x0040
> > > +#define SHRPCNR_YUV2RGB_CCOR_OFFSET_B_REG		0x0044
> > > +
> > > +#define SHRPCNR_CNR_THRES_REG				0x0048
> > > +#define SHRPCNR_CNR_THRES_CNR_THRES_CR_MASK		GENMASK(27, 16)
> > > +#define SHRPCNR_CNR_THRES_CNR_THRES_CB_MASK		GENMASK(11, 0)
> > > +
> > > +#define SHRPCNR_CRED_THRES_REG				0x004c
> > > +#define SHRPCNR_CRED_SLOPE_REG				0x0050
> > > +#define SHRPCNR_CAD_RESTORE_LVL_REG			0x0054
> > > +#define SHRPCNR_CAD_THRESH_V_UNEG_REG			0x0058
> > > +#define SHRPCNR_CAD_THRESH_V_UPOS_REG			0x005c
> > > +#define SHRPCNR_CAD_THRESH_U_REG			0x0060
> > > +
> > > +static int rppx1_shrp_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, SHRPCNR_VERSION_REG)) {
> > > +	case 2:
> > > +		/* 12-bit. */
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_shrp_ops = {
> > > +	.probe = rppx1_shrp_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
> > > new file mode 100644
> > > index 000000000000..60b9c076ec42
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
> > > @@ -0,0 +1,62 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define AWB_MEAS_VERSION_REG			0x0000
> > > +
> > > +#define AWB_MEAS_PROP_REG			0x0004
> > > +#define AWB_MEAS_PROP_MEAS_MODE_RGB		BIT(16) /* 0: YCbCr 1: RGB */
> > > +#define AWB_MEAS_PROP_YMAX			BIT(2)
> > > +#define AWB_MEAS_PROP_AWB_MODE_ON		BIT(1)
> > > +
> > > +#define AWB_MEAS_H_OFFS_REG			0x0008
> > > +#define AWB_MEAS_V_OFFS_REG			0x000c
> > > +#define AWB_MEAS_H_SIZE_REG			0x0010
> > > +#define AWB_MEAS_V_SIZE_REG			0x0014
> > > +#define AWB_MEAS_FRAMES_REG			0x0018
> > > +#define AWB_MEAS_REF_CB_MAX_B_REG		0x001c
> > > +#define AWB_MEAS_REF_CR_MAX_R_REG		0x0020
> > > +#define AWB_MEAS_MAX_Y_REG			0x0024
> > > +#define AWB_MEAS_MIN_Y_MAX_G_REG		0x0028
> > > +#define AWB_MEAS_MAX_CSUM_REG			0x002c
> > > +#define AWB_MEAS_MIN_C_REG			0x0030
> > > +#define AWB_MEAS_WHITE_CNT_REG			0x0034
> > > +#define AWB_MEAS_MEAN_Y_G_REG			0x0038
> > > +#define AWB_MEAS_MEAN_CB_B_REG			0x003c
> > > +#define AWB_MEAS_MEAN_CR_R_REG			0x0040
> > > +
> > > +#define AWB_MEAS_CCOR_COEFF_NUM			9
> > > +#define AWB_MEAS_CCOR_COEFF_REG(n)		(0x0044 + (4 * (n)))
> > > +
> > > +#define AWB_MEAS_CCOR_OFFSET_R_REG		0x0068
> > > +#define AWB_MEAS_CCOR_OFFSET_G_REG		0x006c
> > > +#define AWB_MEAS_CCOR_OFFSET_B_REG		0x0070
> > > +
> > > +static int rppx1_wbmeas_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	switch (rpp_module_read(mod, AWB_MEAS_VERSION_REG)) {
> > > +	case 1:
> > > +		/* 8-bit. */
> > > +		break;
> > > +	case 2:
> > > +		/* 20-bit. */
> > > +		break;
> > > +	case 3:
> > > +		/* 24-bit. */
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_wbmeas_ops = {
> > > +	.probe = rppx1_wbmeas_probe,
> > > +};
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c b/drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c
> > > new file mode 100644
> > > index 000000000000..cc6f977c8a03
> > > --- /dev/null
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c
> > > @@ -0,0 +1,27 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#include "rpp_module.h"
> > > +
> > > +#define XYZ2LUV_VERSION_REG			0x0000
> > > +#define XYZ2LUV_U_REF_REG			0x0004
> > > +#define XYZ2LUV_V_REF_REG			0x0008
> > > +#define XYZ2LUV_LUMA_OUT_FAC_REG		0x000c
> > > +#define XYZ2LUV_CHROMA_OUT_FAC_REG		0x0010
> > > +
> > > +static int rppx1_xyz2luv_probe(struct rpp_module *mod)
> > > +{
> > > +	/* Version check. */
> > > +	if (rpp_module_read(mod, XYZ2LUV_VERSION_REG) != 4)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct rpp_module_ops rppx1_xyz2luv_ops = {
> > > +	.probe = rppx1_xyz2luv_probe,
> > > +};
> > > diff --git a/include/media/rppx1.h b/include/media/rppx1.h
> > > new file mode 100644
> > > index 000000000000..2e761046db38
> > > --- /dev/null
> > > +++ b/include/media/rppx1.h
> > > @@ -0,0 +1,36 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#ifndef __MEDIA_DCT_RPPX1_H__
> > > +#define __MEDIA_DCT_RPPX1_H__
> > > +
> > > +#include <linux/v4l2-mediabus.h>
> > > +#include <linux/media/dreamchip/rppx1-config.h>
> > > +
> > > +#include <media/videobuf2-core.h>
> > > +
> > > +struct rppx1;
> > > +
> > > +struct rppx1 *rppx1_create(void __iomem *base, struct device *dev);
> > > +
> > > +void rppx1_destroy(struct rppx1 *rpp);
> > > +
> > > +int rppx1_start(struct rppx1 *rpp, const struct v4l2_mbus_framefmt *input,
> > > +		const struct v4l2_mbus_framefmt *hv,
> > > +		const struct v4l2_mbus_framefmt *mv);
> > > +
> > > +int rppx1_stop(struct rppx1 *rpp);
> > > +
> > > +bool rppx1_interrupt(struct rppx1 *rpp, u32 *isc);
> > > +
> > > +typedef int (*rppx1_reg_write)(void *priv, u32 offset, u32 value);
> > > +int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
> > > +		 rppx1_reg_write write, void *priv);
> > > +
> > > +void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf);
> > > +
> > > +#endif /* __MEDIA_DCT_RPPX1_H__ */
> > > diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > > index 26627be6f483..b4d736d27ebb 100644
> > > --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> > > +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > > @@ -36,8 +36,10 @@ struct rppx1_window {
> > >  /* ---------------------------------------------------------------------------
> > >   * Parameter Structures
> > >   *
> > > - * Native RPP-X1 precision. Fields use __u32 where the hardware provides
> > > - * wider-than-8-bit results.
> > > + * The same ISP block might be instantiated in multiple pipeliness and operate
> > > + * on a different bitdepth/precision. For fields of varying length among
> > > + * different instances of the same block, use a data type that can accommodate
> > > + * the larger bitdepth/precision.
> > >   */
> > >
> > >  /**
> > > @@ -51,8 +53,10 @@ struct rppx1_window {
> > >  /* ---------------------------------------------------------------------------
> > >   * Statistics Structures
> > >   *
> > > - * Native RPP-X1 precision. Fields use __u32 where the hardware provides
> > > - * wider-than-8-bit results.
> > > + * The same ISP block might be instantiated in multiple pipeliness and operate
> > > + * on a different bitdepth/precision. For fields of varying length among
> > > + * different instances of the same block, use a data type that can accommodate
> > > + * the larger bitdepth/precision.
> >
> > I guess this could be squashed in the patch that introduces the uapi
> > file.
>
> Indeed it should, fixed.
>
> >
> > All minors, with ccor configuration clarified
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > Thanks
> >   j
> >
> > >   */
> > >
> > >  /**
> > > --
> > > 2.54.0
> > >
>
> --
> Kind Regards,
> Niklas Söderlund

