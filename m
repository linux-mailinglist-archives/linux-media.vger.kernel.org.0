Return-Path: <linux-media+bounces-58665-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8J7jKF3l3GkZYAkAu9opvQ
	(envelope-from <linux-media+bounces-58665-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 14:45:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 162B43EC29A
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 14:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1622B300915F
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 12:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BF73BBA17;
	Mon, 13 Apr 2026 12:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FpAtJdpV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B3E3A9D9E
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 12:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776084133; cv=none; b=dIXsIUSgWDYi0BMl5XtbKQHMiNoIyZL8ZeUsgPjAvakyWGPb3yUf84Yy8rxHkbuXtyh1nMP/iWx5M0H9vwBm3+8ENs1+SpxT+3e066KicU89+zE/4Hl3/hBFrl2xS05Hi05Jh34964d4kX0Y18LPidqG3llJ+kIP3eNmSp7xMTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776084133; c=relaxed/simple;
	bh=hwg0EDRv3yHjzQFTe/pH0P6RzegOXDD35zLsu+q/GW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMlO3b1W0x7hB5HEUtO6xbkmbnywuVNFQByNcksOsfOK1rMueCk8cnTLY+gfl+6OrVhr1BU1fdlewKPdf0PzzYFxjm9O9uiws6GWDpVjuFj1YHd3f0rmOuZpwGiT0wV0dMBQ+FIWmND4l6E2lGHT5+xhBaSt084JSKx4w15VANI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FpAtJdpV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0E8663D;
	Mon, 13 Apr 2026 14:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776084035;
	bh=hwg0EDRv3yHjzQFTe/pH0P6RzegOXDD35zLsu+q/GW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FpAtJdpVmUo58tjbgXKA5uGAvH6NkBQ4aHzYkbIvDhDCPSez6pnm7GEsoyAJogKq7
	 hAaF1xPRVn+r/9j8VavE74eJsYaeZdEtGYag/vPsJzDoKPz0v/2nzzpuvEx+DgR8Ql
	 hgBWnatk23wJEWfcRT5BT7U7l+ypDirCUb3nZkkQ=
Date: Mon, 13 Apr 2026 14:42:03 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 25/29] media: v4l2-subdev: Move subdev client
 capabilities into a new struct
Message-ID: <adzhW4uUYdGNJ9d8@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-26-sakari.ailus@linux.intel.com>
 <adj0ToEep5Ny_NX7@zed>
 <adylNdps7TZ6G3t-@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adylNdps7TZ6G3t-@kekkonen.localdomain>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58665-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,nxp.com:email]
X-Rspamd-Queue-Id: 162B43EC29A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Mon, Apr 13, 2026 at 11:11:33AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Fri, Apr 10, 2026 at 03:31:32PM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Wed, Apr 08, 2026 at 06:39:34PM +0300, Sakari Ailus wrote:
> > > Add struct v4l2_subdev_client_info to hold sub-device client capability
> > > bits that used to be stored in the client_caps field of struct
> > > v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
> > > pad operation callbacks for capability information. The main reason why
> > > this is a new struct instead of a u64 field is that modifying the callback
> > > arguments requires touching almost every sub-device driver and that is
> > > desirable to avoid in the future, should more than the client capability bits
> > > need to be known to the callbacks.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
> > >  include/media/v4l2-subdev.h           | 12 ++++++++++--
> > >  2 files changed, 14 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 40b28e070726..eaa408832c6b 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -612,7 +612,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
> > >  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
> > >  		struct v4l2_subdev_frame_interval *fi = arg;
> > >
> > > -		if (!(subdev_fh->client_caps &
> > > +		if (!(subdev_fh->ci.client_caps &
> > >  		      V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
> > >  			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
> > >
> > > @@ -652,7 +652,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > >  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
> > >  	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
> > >  	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
> > > -	bool client_supports_streams = subdev_fh->client_caps &
> > > +	bool client_supports_streams = subdev_fh->ci.client_caps &
> > >  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
> > >  	int rval;
> > >
> > > @@ -1119,7 +1119,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > >  	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
> > >  		struct v4l2_subdev_client_capability *client_cap = arg;
> > >
> > > -		client_cap->capabilities = subdev_fh->client_caps;
> > > +		client_cap->capabilities = subdev_fh->ci.client_caps;
> > >
> > >  		return 0;
> > >  	}
> > > @@ -1139,7 +1139,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > >  		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
> > >  					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
> > >
> > > -		subdev_fh->client_caps = client_cap->capabilities;
> > > +		subdev_fh->ci.client_caps = client_cap->capabilities;
> >
> >
> > I'm sorry for being annoying, but the discussion on v2 ended with the
> > question on why we can't propagate the client caps to the drivers
> > using the subdev state.
> >
> > I understand we have the active state which is stored in the subdev
> > and not per-file handle. But ioctls are called on a file handle and it
> > seems trivial to me copy the caps from the subdev_fh to the active
> > state.
> >
> > It would result in a much smaller set of changes.
> >
> > What am I missing ?
>
> I thought the discussion ended with the conclusion that we can't do that as
> the sub-device active state isn't bound to a file handle. :-)
>

Can you clarify why this can't happen in your opinion ?

Yes, the active state is not bound to any fh, but all ioctls
operations are issued on an fh, so it's trivial to copy the caps flags
in the active state before passing it to drivers.

If this is not preferred because it feels like an hack I understand
it, it actually is, but I would like to think in perspective here.

We want contexts, I think that's clear.

In the design I proposed the active state will be moved from the
subdev to the context (when available). A state lives in a context
which is bound to file handle. Getting the caps from a state is then a
matter of providing a helpers in the form of a chain of container_of.

The active_state which lives in the subdev will be used as a "default"
state, to support userspace application which are not context-aware.

Would it be so bad to populate a v4l2_subdev_fh * in the active state
stored in the subdev to indicate on which file handle an ioctl has
been called on and retrieve the caps from there, so that the same
(name tbd) v4l2_subdev_get_state_caps(struct v4l2_subdev_state *state)
could be used ?

Adding the caps argument to driver's ioctl handlers to me pollutes the
interface diminishing the value of the state-centric interface we are
trying to implement.

> --
> Kind regards,
>
> Sakari Ailus

