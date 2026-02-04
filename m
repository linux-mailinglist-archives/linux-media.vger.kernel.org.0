Return-Path: <linux-media+bounces-52186-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGv9N/pLg2kulAMAu9opvQ
	(envelope-from <linux-media+bounces-52186-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 14:39:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BCBE6925
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 14:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC1A0301CC65
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 13:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6743D7D72;
	Wed,  4 Feb 2026 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BADzg8zU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB28B23E32B;
	Wed,  4 Feb 2026 13:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770212174; cv=none; b=EP0IX9gby0YzlzJFG5VZJSDDMercWSZ3b90AzD+jwM3dNjmugu0uPG9qC9WOTVxkx2g4Qs2ZLqOtPnz5ry2AM9LBwXQWt5e5o53SGQg72vLe0zCK7jF9cXJxAcbSG3Acb8HRiarKYXTIXIWR/EaxPec8Ad+npmS4yqCbrhQOzFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770212174; c=relaxed/simple;
	bh=vByC9itxiQ9gShJfLpgICw6sB6P2HQFDf8Ul63fSmmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUG/k2TfK/3Me708i9j39JDljCRZuZ1DwsABZhJHUxYUxBPKhbKaNL5b6ldxtaMYArgrSAnYFcOFvt/8Yb0nAGi3TiVZtCSzY6h1Bq1JH5JQnPiEzJczDrpB518t0y9OEJQjQiVtIpdESSTALRobzPbkLt0h3XRTvKLxzH6jLt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BADzg8zU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA6D9833;
	Wed,  4 Feb 2026 14:35:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770212130;
	bh=vByC9itxiQ9gShJfLpgICw6sB6P2HQFDf8Ul63fSmmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BADzg8zUazGN1CZlxjlY9Kiebki4u+pBqDpj0ocjCRU2QlDtZyOTOKy+GIC3rT3Pd
	 gkORelKtCUNUNAGLDE67Ho+tbBPP9dHOTT9pR2TWgPSmQdP813htmDLyCQD6kNrsKq
	 BLJdGsr4/0k3LMuBPLio+dWAyaLNkXtviFN0YWfs=
Date: Wed, 4 Feb 2026 14:36:08 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com, 
	frank.li@nxp.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v1 07/11] media: Add meta formats supported by NXP neoisp
 driver
Message-ID: <aYNK_fmqsDX_e8cd@zed>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-8-antoine.bouyer@nxp.com>
 <aYIsHfpMc2DZXYBr@zed>
 <b81b6e6a-10b7-43eb-b857-6c0d2636427e@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b81b6e6a-10b7-43eb-b857-6c0d2636427e@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52186-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,nxp.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 58BCBE6925
X-Rspamd-Action: no action

Hi Antoine

On Wed, Feb 04, 2026 at 02:31:47PM +0100, Antoine Bouyer wrote:
> Hi Jacopo
>
> Le 03/02/2026 à 18:11, Jacopo Mondi a écrit :
> >
> > Hi Antoine
> >
> > On Fri, Jan 23, 2026 at 09:09:34AM +0100, Antoine Bouyer wrote:
> > > This patch adds new v4l2 meta formats definitions and descriptions used by
> > > neoisp driver for the parameters and statistics buffers:
> > >   - `V4L2_META_FMT_NEO_ISP_PARAMS` used for the legacy fixed-size
> > > parameters buffer structure.
> > >   - `V4L2_META_FMT_NEO_ISP_EXT_PARAMS` used for the generic v4l2-isp
> > > extensible parameters structure, supporting a non-fixed-size buffer and
> > > changeable ISP configuration blocks.
> > >   - `V4L2_META_FMT_NEO_ISP_STATS` used for the legacy fixed-size statistics
> > > buffer structure.
> > >   - `V4L2_META_FMT_NEO_ISP_EXT_STATS` used for the generic v4l2-isp
> > > extensible statistics structure, supporting a non-fixed-size buffer
> > > and changeable ISP statistics blocks.
> >
> > Uh interesting, you have existing userspace that needs legacy formats ?
>
> Yes we do have some available here (version with extensible formats will be
> the next one):
> https://github.com/nxp-imx/libcamera
>
> Not in mainline, thought.

I see.

However I don't think the mainline driver should support both formats.

And looking at your libcamera branch, it seem it already supports the
extensible version.


>
> BR
> Antoine
>
> >
> > >
> > > Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> > > ---
> > >   drivers/media/v4l2-core/v4l2-ioctl.c | 4 ++++
> > >   include/uapi/linux/videodev2.h       | 6 ++++++
> > >   2 files changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index 37d33d4a363d..c797cf11be38 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1471,6 +1471,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > >        case V4L2_META_FMT_C3ISP_STATS:         descr = "Amlogic C3 ISP Statistics"; break;
> > >        case V4L2_META_FMT_MALI_C55_PARAMS:     descr = "ARM Mali-C55 ISP Parameters"; break;
> > >        case V4L2_META_FMT_MALI_C55_STATS:      descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> > > +     case V4L2_META_FMT_NEO_ISP_PARAMS:      descr = "NXP Neo ISP 3A Parameters"; break;
> > > +     case V4L2_META_FMT_NEO_ISP_EXT_PARAMS:  descr = "NXP Neo ISP ext 3A Parameters"; break;
> > > +     case V4L2_META_FMT_NEO_ISP_STATS:       descr = "NXP Neo ISP 3A Statistics"; break;
> > > +     case V4L2_META_FMT_NEO_ISP_EXT_STATS:   descr = "NXP Neo ISP ext 3A Statistics"; break;
> > >        case V4L2_PIX_FMT_NV12_8L128:   descr = "NV12 (8x128 Linear)"; break;
> > >        case V4L2_PIX_FMT_NV12M_8L128:  descr = "NV12M (8x128 Linear)"; break;
> > >        case V4L2_PIX_FMT_NV12_10BE_8L128:      descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > index 848e86617d5c..5f4992452c66 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -889,6 +889,12 @@ struct v4l2_pix_format {
> > >   #define V4L2_META_FMT_MALI_C55_PARAMS        v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
> > >   #define V4L2_META_FMT_MALI_C55_STATS v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
> > >
> > > +/* Vendor specific - used for NXP NEOISP sub-system */
> > > +#define V4L2_META_FMT_NEO_ISP_PARAMS         v4l2_fourcc('N', 'N', 'I', 'P') /* NXP NEOISP Parameters */
> > > +#define V4L2_META_FMT_NEO_ISP_EXT_PARAMS     v4l2_fourcc('N', 'N', 'E', 'P') /* NXP NEOISP Ext Params */
> > > +#define V4L2_META_FMT_NEO_ISP_STATS          v4l2_fourcc('N', 'N', 'I', 'S') /* NXP NEOISP Statistics */
> > > +#define V4L2_META_FMT_NEO_ISP_EXT_STATS              v4l2_fourcc('N', 'N', 'E', 'S') /* NXP NEOISP Ext Stats */
> > > +
> > >   #ifdef __KERNEL__
> > >   /*
> > >    * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> > > --
> > > 2.52.0
> > >
> > >
>

