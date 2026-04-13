Return-Path: <linux-media+bounces-58643-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEejAiim3GkEUgkAu9opvQ
	(envelope-from <linux-media+bounces-58643-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:15:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4191C3E8F5B
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 177323026CB5
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 08:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E518E1A680E;
	Mon, 13 Apr 2026 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Er4JiWBN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166A6266581
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067884; cv=none; b=NwWPk+pqrvHqkOOowNiYYfwrmt6MQiaekTZG2uq/Mk9Bx5MPhi3WOiXDZVuooBxQNCqnoB0BFzT/1UFocP+klZF6BlWLV0Vii33jeFqwhAZ8Y1Xf22JNWXTQJ1ZZqO2H0PHyXRtf1ZlQTDiJ/B0IvFdXM5KSL6Rjqu1U4aZ+RzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067884; c=relaxed/simple;
	bh=JqKSGicwCuxbH5IqOX5UIBt96R+rn4kOkXU+ii+FX3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TE4YPjYJKbpH/OmC0mG4vEgZ1gqC4ZaYgaPmnRMiJBwCY3MQO/YXZI+T+8291ssHKWnwKKIfaykZ3Oyo5Zv+gglnaMN3fIyQAhlzu525D/INMOkjBfBJk7KBpG1C6EJgf0pz6FX+Hu+Rm7yPkNA5+KrEtZWpGXT8cZJaT1YspZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Er4JiWBN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776067883; x=1807603883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JqKSGicwCuxbH5IqOX5UIBt96R+rn4kOkXU+ii+FX3s=;
  b=Er4JiWBNWfsm1zaXCkziboCFjILZb6BWnlZ3HFLD27kcJsy719Z5sxVk
   XajTLCQr+w7SHiPZemXO7v74TcPmg8fBAj4Tmu8FmrRt/0+PmKQKkl6uZ
   j1XG6G6Be9iND8q4C9LYRzfF+4SxTqk0JjTw4XnhEFg08yfsZchyxJHpd
   dZB0D8u8chbWcz9i43ZrHxbcT6A/gWAk8rFop2M1UPR68os7WCDO0prlG
   W8RIQq894uJzeg3VVA8edJjD6H55FaErzBZzxGctdfEagfjWvB4zGWILr
   iC4klwhL327O5BG/41Cynspwn+biT9W5GV7AyRb+0Y+FaVgRNXi/bmhqR
   Q==;
X-CSE-ConnectionGUID: GkDv5EyaSSSPLGczELW5Mg==
X-CSE-MsgGUID: cmQ3oGCtSWmgUX2278ne6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76873608"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="76873608"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 01:11:22 -0700
X-CSE-ConnectionGUID: JXbIPUjZT5Gz3yJsJsOv1Q==
X-CSE-MsgGUID: tXwqmKy/ThqWr21Pw/tk6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="252905443"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.21])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 01:11:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CAE8012053B;
	Mon, 13 Apr 2026 11:11:33 +0300 (EEST)
Date: Mon, 13 Apr 2026 11:11:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 25/29] media: v4l2-subdev: Move subdev client
 capabilities into a new struct
Message-ID: <adylNdps7TZ6G3t-@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-26-sakari.ailus@linux.intel.com>
 <adj0ToEep5Ny_NX7@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adj0ToEep5Ny_NX7@zed>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58643-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 4191C3E8F5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

On Fri, Apr 10, 2026 at 03:31:32PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, Apr 08, 2026 at 06:39:34PM +0300, Sakari Ailus wrote:
> > Add struct v4l2_subdev_client_info to hold sub-device client capability
> > bits that used to be stored in the client_caps field of struct
> > v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
> > pad operation callbacks for capability information. The main reason why
> > this is a new struct instead of a u64 field is that modifying the callback
> > arguments requires touching almost every sub-device driver and that is
> > desirable to avoid in the future, should more than the client capability bits
> > need to be known to the callbacks.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
> >  include/media/v4l2-subdev.h           | 12 ++++++++++--
> >  2 files changed, 14 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 40b28e070726..eaa408832c6b 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -612,7 +612,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
> >  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
> >  		struct v4l2_subdev_frame_interval *fi = arg;
> >
> > -		if (!(subdev_fh->client_caps &
> > +		if (!(subdev_fh->ci.client_caps &
> >  		      V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
> >  			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
> >
> > @@ -652,7 +652,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
> >  	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
> >  	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
> > -	bool client_supports_streams = subdev_fh->client_caps &
> > +	bool client_supports_streams = subdev_fh->ci.client_caps &
> >  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
> >  	int rval;
> >
> > @@ -1119,7 +1119,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
> >  		struct v4l2_subdev_client_capability *client_cap = arg;
> >
> > -		client_cap->capabilities = subdev_fh->client_caps;
> > +		client_cap->capabilities = subdev_fh->ci.client_caps;
> >
> >  		return 0;
> >  	}
> > @@ -1139,7 +1139,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
> >  					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
> >
> > -		subdev_fh->client_caps = client_cap->capabilities;
> > +		subdev_fh->ci.client_caps = client_cap->capabilities;
> 
> 
> I'm sorry for being annoying, but the discussion on v2 ended with the
> question on why we can't propagate the client caps to the drivers
> using the subdev state.
> 
> I understand we have the active state which is stored in the subdev
> and not per-file handle. But ioctls are called on a file handle and it
> seems trivial to me copy the caps from the subdev_fh to the active
> state.
> 
> It would result in a much smaller set of changes.
> 
> What am I missing ?

I thought the discussion ended with the conclusion that we can't do that as
the sub-device active state isn't bound to a file handle. :-)

-- 
Kind regards,

Sakari Ailus

