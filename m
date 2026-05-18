Return-Path: <linux-media+bounces-61951-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIBEDN7sCmo89gQAu9opvQ
	(envelope-from <linux-media+bounces-61951-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:41:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C73FE56ADA6
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D589C300B1D2
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19DC3321AA;
	Mon, 18 May 2026 10:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y34g9TUu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713523E8C4C
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 10:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100782; cv=none; b=uVPY4Vr/0lMnR0/AVCw1rwxEMF99zKt4SmA6VHb56t/HU+Du1NVJxZFWCjPt57S47L2zuhdcyNS3ibI62Z0q3hFiD+v22Yw3xEXv/Ov52IOu70B1/QOtxDrG0zp3pMSCzgLRxM8kODTXYpormggyaLKd/tVxQaxtcyFzUIPZv3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100782; c=relaxed/simple;
	bh=kZFp0cK8NW8hOi+WLJq8KzHg/eYq12UfAEKfNMhi9Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnWp/ktdOV7ZzbOOrMbKoB3umGlap4PhGbHT10F74qSD+KY2oQhvC/sixfyYccvykdCdRVgMA6ik5wTCqcXDVHMytGvEI766aQy2LkpBWn4XQlst2ZtYx4jAqPO5uA63PHgeruqBzxPZWDLnPf5lYxNDTFnIj64CTOeD+AxwN4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y34g9TUu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779100771; x=1810636771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kZFp0cK8NW8hOi+WLJq8KzHg/eYq12UfAEKfNMhi9Ak=;
  b=Y34g9TUuR1Ze0iQkKdvb7PLbkQ/0WaWjZiRTe/EKmCGA8perk9EZU2jr
   SiRtHS4dcEjah9bhMrYkyxnpkO4vnjxwO9dFhuyQNB1XY1P9rAczy2T72
   IFkQJXuMfT9T+LqR2l/7/Z9LWNXaYIQiNjgvZNbrMGKCPvp71aFNfLcxP
   /0GkX2xbRi/wlPSGND6sd3ukN7KJ2byOCT7oDyvprJWE1oCXwJ6zrMNom
   J7FHKLTJ+lXEXmMacAYAzMGIxr6t6b6GVaunDIw7xWJdZiYa5EiaAZRpm
   FbF539E3fyDUtquKR6XcF5fadUljvq9sAHVqZ6aJ/1QsnvpnqMrIj1vLC
   w==;
X-CSE-ConnectionGUID: QZwJnBCLR+21Mi9yj1J8fQ==
X-CSE-MsgGUID: ZDZJoEc2QUGidhzZcUQJfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79088485"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79088485"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 03:39:27 -0700
X-CSE-ConnectionGUID: b+nj5lDkRMadtUIeMxUbVg==
X-CSE-MsgGUID: OW0bzJrgSjKyxhCG7OzVtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="269731506"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 03:39:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E0AA711F70F;
	Mon, 18 May 2026 13:39:26 +0300 (EEST)
Date: Mon, 18 May 2026 13:39:26 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 04/17] media: v4l2-subdev: Allocate frame descriptors
 based on the need
Message-ID: <agrsXksuU47xXV20@kekkonen.localdomain>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
 <20260513104358.2252605-5-sakari.ailus@linux.intel.com>
 <agWmERwjH1fm15T-@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agWmERwjH1fm15T-@zed>
X-Rspamd-Queue-Id: C73FE56ADA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61951-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kekkonen.localdomain:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

Hi Jacopo,

On Thu, May 14, 2026 at 12:42:34PM +0200, Jacopo Mondi wrote:
> Hi Sakari,
> 
>    one more comment
> 
> On Wed, May 13, 2026 at 01:43:45PM +0300, Sakari Ailus wrote:
> > Frame descriptors entries require a small amount of memory per entry (20
> > bytes), but if the number of entries in a frame descriptor is large, an
> > unreasonably large amount of memory would need to be allocated in the
> > stack. Therefore the number of entries has been limited to 8.
> >
> > Support larger frame descriptors by allocating as much memory as required.
> > The get_frame_desc() op can now set the num_entries to a number larger
> > than V4L2_FRAME_BUS_ENTRY_MAX and return -ENOSPC. The caller,
> > v4l2_subdev_get_frame_desc(), will then allocate memory for that amount of
> > memory and call the get_frame_desc() op again.
> >
> > The caller is also responsible for releasing the allocated memory by
> > calling v4l2_subdev_free_frame_desc().
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 49 +++++++++++++++++++++------
> >  include/media/v4l2-subdev.h           | 44 +++++++++++++++++++-----
> >  2 files changed, 74 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index b8acce8f9c33..012ff6fb2988 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -63,10 +63,6 @@ static bool v4l2_subdev_enable_streams_api;
> >  /*
> >   * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
> >   * of streams.
> > - *
> > - * Note that V4L2_FRAME_DESC_ENTRY_MAX is related: V4L2_FRAME_DESC_ENTRY_MAX
> > - * restricts the total number of streams in a pad, although the stream ID is
> > - * not restricted.
> >   */
> >  #define V4L2_SUBDEV_MAX_STREAM_ID 63
> >
> > @@ -354,6 +350,7 @@ static int call_set_frame_interval(struct v4l2_subdev *sd,
> >  static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> >  			       struct v4l2_mbus_frame_desc *fd)
> >  {
> > +	unsigned int type;
> >  	unsigned int i;
> >  	int ret;
> >
> > @@ -362,16 +359,38 @@ static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> >  		return -EOPNOTSUPP;
> >  #endif
> >
> > +	type = fd->type;
> >  	memset(fd, 0, sizeof(*fd));
> > +	if (!fd->entry) {
> > +		fd->entry = fd->entry_mem;
> > +		fd->len_entries = ARRAY_SIZE(fd->entry_mem);
> > +	}
> >
> >  	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
> > +	if (ret == -ENOSPC) {
> > +		if (fd->num_entries > V4L2_FRAME_DESC_ENTRY_PREALLOC &&
> > +		    fd->num_entries < V4L2_FRAME_DESC_ENTRY_MAX) {
> > +			fd->entry = kzalloc_objs(*fd->entry, fd->num_entries,
> > +						 GFP_KERNEL);
> > +			if (!fd->entry)
> > +				return -ENOMEM;
> > +
> > +			fd->len_entries = fd->num_entries;
> > +			fd->num_entries = 0;
> > +
> > +			ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
> > +		} else {
> > +			return -E2BIG;
> > +		}
> > +	}
> >  	if (ret)
> >  		return ret;
> >
> >  	dev_dbg(sd->dev, "Frame descriptor on pad %u, type %s\n", pad,
> > -		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
> > -		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
> > -		"unknown");
> > +		type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
> > +		type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" : "unknown");
> > +
> > +	fd->type = type;
> >
> >  	for (i = 0; i < fd->num_entries; i++) {
> >  		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
> > @@ -1086,9 +1105,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		 * descriptor accordingly, with up to one entry per route. Until
> >  		 * the frame descriptors entries get allocated dynamically,
> >  		 * limit the number of active routes to
> > -		 * V4L2_FRAME_DESC_ENTRY_MAX.
> > +		 * V4L2_FRAME_DESC_ENTRY_PREALLOC.
> >  		 */
> > -		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> > +		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_PREALLOC)
> >  			return -E2BIG;
> >
> >  		/*
> > @@ -2638,7 +2657,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> >  				return -EPIPE;
> >  			}
> >
> > -			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
> > +			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_PREALLOC) {
> >  				dev_dbg(dev, "Frame desc entry limit reached\n");
> >  				return -E2BIG;
> >  			}
> > @@ -2730,6 +2749,16 @@ int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
> >
> > +void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc)
> > +{
> > +	if (desc->entry != desc->entry_mem)
> > +		kfree(desc->entry);
> > +
> > +	desc->entry = NULL;
> > +	desc->len_entries = desc->num_entries = 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_subdev_free_frame_desc);
> > +
> >  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
> >
> >  #endif /* CONFIG_MEDIA_CONTROLLER */
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index c9e74566c85a..bd97510c7024 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -365,11 +365,13 @@ struct v4l2_mbus_frame_desc_entry {
> >  	} bus;
> >  };
> >
> > - /*
> > -  * If this number is too small, it should be dropped altogether and the
> > -  * API switched to a dynamic number of frame descriptor entries.
> > -  */
> > -#define V4L2_FRAME_DESC_ENTRY_MAX	8
> > +/* Size of the statically allocated frame descriptor array. */
> > +#define V4L2_FRAME_DESC_ENTRY_PREALLOC	8
> > +/*
> > + * Maximum number of dynamically allocated frame descriptors. Note that
> > + * V4L2_SUBDEV_MAX_STREAM_ID is related to this limit as well.
> > + */
> > +#define V4L2_FRAME_DESC_ENTRY_MAX	64
> >
> >  /**
> >   * enum v4l2_mbus_frame_desc_type - media bus frame description type
> > @@ -392,13 +394,17 @@ enum v4l2_mbus_frame_desc_type {
> >  /**
> >   * struct v4l2_mbus_frame_desc - media bus data frame description
> >   * @type: type of the bus (enum v4l2_mbus_frame_desc_type)
> > - * @entry: frame descriptors array
> > - * @num_entries: number of entries in @entry array
> > + * @entry_mem: memory for the frame descriptors (@entry)
> > + * @entry: pointer to the frame descriptors
> > + * @num_entries: number of entries in @entry
> > + * @len_entries: number of entries allocated for @entry
> >   */
> >  struct v4l2_mbus_frame_desc {
> >  	enum v4l2_mbus_frame_desc_type type;
> > -	struct v4l2_mbus_frame_desc_entry entry[V4L2_FRAME_DESC_ENTRY_MAX];
> > +	struct v4l2_mbus_frame_desc_entry entry_mem[V4L2_FRAME_DESC_ENTRY_PREALLOC];
> > +	struct v4l2_mbus_frame_desc_entry *entry;
> >  	unsigned short num_entries;
> > +	unsigned short len_entries;
> 
> What are the implications of this change on this part of
> v4l2_subdev_get_frame_desc() ?
> 
> 	struct v4l2_subdev_state *state =
> 		v4l2_subdev_lock_and_get_active_state(sd);
> 	ret = v4l2_subdev_call(sd, pad, get_fmt, state, &subdev_fmt);
> 	v4l2_subdev_unlock_state(state);
> 	if (ret)
> 		return ret;
> 
> 	struct v4l2_mbus_frame_desc_entry entry = {
> 		.pixelcode = subdev_fmt.format.code,
> 	};
> 
> 	if (desc->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> 		int dt;
> 
> 		dt = mipi_csi2_dt_for_mbus(subdev_fmt.format.code);
> 		if (dt < 0)
> 			return dt;
> 
> 		entry.bus.csi2.dt = dt;
> 	}
> 
> 	desc->entry[0] = entry;
> 
>         ^
>         |---- here ?
> 
> Is there any risk this now access invalid memory ?
> Should we do the same thing that you're doing call_get_frame_desc() ?
> 
> 	fd->entry = fd->entry_mem;
> 
> before assigning its first member ?

This is in fact done by the caller in the next patch. I think I'll squash
it here.

> 
> >  };
> >
> >  /**
> > @@ -780,7 +786,13 @@ struct v4l2_subdev_state {
> >   * @link_validate: used by the media controller code to check if the links
> >   *		   that belongs to a pipeline can be used for stream.
> >   *
> > - * @get_frame_desc: get the current low level media bus frame parameters.
> > + * @get_frame_desc: get the current low level media bus frame parameters. The
> > + *		    callback is required to update the num_entries field to the
> > + *		    total number of entries in the frame descriptor. The
> > + *		    callback shall fill the first entries array up to
> > + *		    len_entries, which signifies the number of entries
> > + *		    allocated. If num_entries exceeds len_entries, the callback
> > + *		    shall return -ENOSPC.
> >   *
> >   * @set_frame_desc: set the low level media bus frame parameters, @fd array
> >   *                  may be adjusted by the subdev driver to device capabilities.
> > @@ -1793,11 +1805,25 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> >   *
> >   * The caller is required to set @desc->type to the expected bus type.
> >   *
> > + * The entries in the frame descriptor are allocated based on the need. The
> > + * caller is required to release the memory of the frame descriptor entries for
> > + * each frame descriptor obtained by calling this function using
> > + * v4l2_subdev_free_frame_desc().
> > + *
> >   * Return: %0 on success or negative error code on failure.
> >   */
> >  int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> >  			       struct v4l2_mbus_frame_desc *desc);
> >
> > +/**
> > + * v4l2_subdev_free_frame_desc() - Release the memory of a frame descriptor
> > + * @desc: A pointer to a frame descriptor
> > + *
> > + * Release the frame descriptor entries in a frame descriptor. The number of
> > + * entries in the descriptor are set to 0 again.
> > + */
> > +void v4l2_subdev_free_frame_desc(struct v4l2_mbus_frame_desc *desc);
> > +
> >  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
> >
> >  #endif /* CONFIG_MEDIA_CONTROLLER */

-- 
Kind regards,

Sakari Ailus

