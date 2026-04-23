Return-Path: <linux-media+bounces-59356-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBBpGiDE6WkAjwIAu9opvQ
	(envelope-from <linux-media+bounces-59356-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:02:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D75B44DCE2
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BE04300ACAA
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 07:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1093DC4AA;
	Thu, 23 Apr 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EPVCBJcC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC19B3D813F
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 07:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776927763; cv=none; b=c4KHDKfDjvehJCmlBPU/f6ZxPWM/2VG32v+EDWvRY4dbOfqjjm6EOi7RNxWbaG7Vd66gzk8hqw2MEm71aA047qacXUH5l7l/Gm9ZrK1I7syXzbaB9TNj2dBH7tN/6lD+0Bg1+1TuI5CE8nubir5ErQXTXVcvKsG7pK9eVfSFEHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776927763; c=relaxed/simple;
	bh=8nZMWVD325u/wEN4S9AyrVXKnqsgGe7oqIKCbX2yxMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZ9v55rxWTrCkzBDmGZ1NYbZe8yD8FWiFkF3j3Wp5sRGoy8+Yh22C99KDJ+VCxUIxDNYbbolNZfRJuPLfr/hU+HEHzh5lsGZvLBN5JDtMrS8x/aBc1IHvhKB82CVtMki3ywyHXXyZE3fI9FOphMXepEP0gkgnyL8z3acQAjDu2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EPVCBJcC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:153:f9b8:5024:faa2])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EE399A4;
	Thu, 23 Apr 2026 09:00:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776927650;
	bh=8nZMWVD325u/wEN4S9AyrVXKnqsgGe7oqIKCbX2yxMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPVCBJcC7mGr4W1KxLTG4X9cDhjttsvJbaFRe82C5SOHZq+RyLBvxXTLzzimO+Z1p
	 aVBywlStRpJ4XvZyHKhUNlakxwOcQT78arQhvKGk/sOKcF3E71vGoa2MnlEdytv7QH
	 xwTvyBcbZ50avnpRncTIfZbvppZU7FRIjj51e3Ac=
Date: Thu, 23 Apr 2026 09:02:24 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, hans@jjverkuil.nl, 
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
Message-ID: <aenBi86NWAFj3N9V@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-26-sakari.ailus@linux.intel.com>
 <adj0ToEep5Ny_NX7@zed>
 <adylNdps7TZ6G3t-@kekkonen.localdomain>
 <adzhW4uUYdGNJ9d8@zed>
 <20260416173015.GQ1775831@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260416173015.GQ1775831@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59356-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,kernel.org,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Rspamd-Queue-Id: 0D75B44DCE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent

On Thu, Apr 16, 2026 at 08:30:15PM +0300, Laurent Pinchart wrote:
> On Mon, Apr 13, 2026 at 02:42:03PM +0200, Jacopo Mondi wrote:
> > On Mon, Apr 13, 2026 at 11:11:33AM +0300, Sakari Ailus wrote:
> > > On Fri, Apr 10, 2026 at 03:31:32PM +0200, Jacopo Mondi wrote:
> > > > On Wed, Apr 08, 2026 at 06:39:34PM +0300, Sakari Ailus wrote:
> > > > > Add struct v4l2_subdev_client_info to hold sub-device client capability
> > > > > bits that used to be stored in the client_caps field of struct
> > > > > v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
> > > > > pad operation callbacks for capability information. The main reason why
> > > > > this is a new struct instead of a u64 field is that modifying the callback
> > > > > arguments requires touching almost every sub-device driver and that is
> > > > > desirable to avoid in the future, should more than the client capability bits
> > > > > need to be known to the callbacks.
> > > > >
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > > > > ---
> > > > >  drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
> > > > >  include/media/v4l2-subdev.h           | 12 ++++++++++--
> > > > >  2 files changed, 14 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > index 40b28e070726..eaa408832c6b 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > @@ -612,7 +612,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
> > > > >  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
> > > > >  		struct v4l2_subdev_frame_interval *fi = arg;
> > > > >
> > > > > -		if (!(subdev_fh->client_caps &
> > > > > +		if (!(subdev_fh->ci.client_caps &
> > > > >  		      V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
> > > > >  			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
> > > > >
> > > > > @@ -652,7 +652,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > > > >  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
> > > > >  	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
> > > > >  	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
> > > > > -	bool client_supports_streams = subdev_fh->client_caps &
> > > > > +	bool client_supports_streams = subdev_fh->ci.client_caps &
> > > > >  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
> > > > >  	int rval;
> > > > >
> > > > > @@ -1119,7 +1119,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > > > >  	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
> > > > >  		struct v4l2_subdev_client_capability *client_cap = arg;
> > > > >
> > > > > -		client_cap->capabilities = subdev_fh->client_caps;
> > > > > +		client_cap->capabilities = subdev_fh->ci.client_caps;
> > > > >
> > > > >  		return 0;
> > > > >  	}
> > > > > @@ -1139,7 +1139,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > > > >  		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
> > > > >  					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
> > > > >
> > > > > -		subdev_fh->client_caps = client_cap->capabilities;
> > > > > +		subdev_fh->ci.client_caps = client_cap->capabilities;
> > > >
> > > > I'm sorry for being annoying, but the discussion on v2 ended with the
> > > > question on why we can't propagate the client caps to the drivers
> > > > using the subdev state.
> > > >
> > > > I understand we have the active state which is stored in the subdev
> > > > and not per-file handle. But ioctls are called on a file handle and it
> > > > seems trivial to me copy the caps from the subdev_fh to the active
> > > > state.
> > > >
> > > > It would result in a much smaller set of changes.
> > > >
> > > > What am I missing ?
> > >
> > > I thought the discussion ended with the conclusion that we can't do that as
> > > the sub-device active state isn't bound to a file handle. :-)
> >
> > Can you clarify why this can't happen in your opinion ?
> >
> > Yes, the active state is not bound to any fh, but all ioctls
> > operations are issued on an fh, so it's trivial to copy the caps flags
> > in the active state before passing it to drivers.
> >
> > If this is not preferred because it feels like an hack I understand
> > it, it actually is, but I would like to think in perspective here.
>
> Storing the client caps in the state would be a hack indeed. The state
> is meant to be an object that represents the state of the device.
>
> Using it to store caps of a client means we'll need to ensure at least
> that no two clients will ever use the same state at the same time (which
> only applies to the active state), and that a state will always be
> associated with a client when a subdev operation is called.
>
> To ensure the former, we need to lock the active state before setting
> the caps field in the state, and keep it locked to call the subdev
> operation is called.
>
> The current implementation of the subdev ioctl handling code complies
> with those requirements.
>
> For the latter, it largely depends on which operation we're talking
> about. This series only adds the v4l2_subdev_client_info pointer to four
> operations: .get_fmt(), .set_fmt(), .get_selection() and
> .set_selection(). There are very few state-aware drivers calling the
> format operations manually on a subdev managed by a different driver,
> and even less calling the selection operations, and I don't expect that
> list to grow.
>
> Storing the caps in the state would be doable today, but I'm concerned
> it will cause issues later and restrict us in our ability to use subdev
> states. It could however be argued that introducing the new
> v4l2_subdev_client_info argument could be delayed to that point in time.
>
> All this being said, the only usage of client caps in subdev drivers
> today is conversion of existing sensor drivers to the new raw camera
> sensor model without breaking userspace. We have decided to propagate
> the V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR capability to drivers to
> handle this, because we didn't find a way to handle it in the subdev
> core, but maybe there's a better solution we overlooked ?


>
> By the way, I don't think passing the client info pointer to the
> .get_fmt() operation is needed.
>
> > We want contexts, I think that's clear.
> >
> > In the design I proposed the active state will be moved from the
> > subdev to the context (when available). A state lives in a context
> > which is bound to file handle. Getting the caps from a state is then a
> > matter of providing a helpers in the form of a chain of container_of.
> >
> > The active_state which lives in the subdev will be used as a "default"
> > state, to support userspace application which are not context-aware.
> >
> > Would it be so bad to populate a v4l2_subdev_fh * in the active state
> > stored in the subdev to indicate on which file handle an ioctl has
> > been called on and retrieve the caps from there, so that the same
> > (name tbd) v4l2_subdev_get_state_caps(struct v4l2_subdev_state *state)
> > could be used ?
>
> I think that will cause trouble. States can be accessed directly from a
> client context (e.g. when servicing a subdev ioctl), but also from other
> contexts (e.g. pipeline validation when starting streaming). In the
> latter case no operation requiring client caps should be called. If we
> store client caps in the state, I fear we'll start accessing them from
> places where they shouldn't be accessed, and it would become hard to
> untangle it later.

I think this is the key point: drivers can access the state from
context where we can't guarantee a client is available (if I'm not
mistaken .s_stream() is one of them).

At the moment we don't need client caps in any of those places, but I
wouldn't feel confortable betting on this in the long run.

>
> > Adding the caps argument to driver's ioctl handlers to me pollutes the
> > interface diminishing the value of the state-centric interface we are
> > trying to implement.
>
> It's still state-centric.
>

Fair, it still is, my point was that going through the state would
have given a cleaner interface.

I'm still not in-love with adding caps to the ioctl handlers as it
feels like they will only be used by drivers that will go through
the transition to the RAW camera model, but it will affect all the
other ones as well.

> --
> Regards,
>
> Laurent Pinchart
>

