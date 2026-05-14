Return-Path: <linux-media+bounces-61598-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MtFMh+jBWroZAIAu9opvQ
	(envelope-from <linux-media+bounces-61598-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:25:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1B25405BA
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 532C23016CB3
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5C639891C;
	Thu, 14 May 2026 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n6mvggKj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF3A3655D3
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754329; cv=none; b=ITjgxfevuIGxD9eWYApgib64GZeqyn/OIklyAIXOfL0Q090I4RUb4jTkf8pquuUPhka2RD3Szb9mgWQU43XTHOJqD+xiwmUj4CPWUts1iLggfmmnm1DSck5ZTK/gtLywUPDRkyUbM+Q5niZvf0qSlaH/TQnRXtRnjWOH30ALN2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754329; c=relaxed/simple;
	bh=fBPJqgxn6qmcXfZ3/nFWnwRzI4JPXRjmxSY+QTygWtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIxWso2vDdTXO+MOVTpTXtzFHnzacUkN50SXcOjDmcnjVLJBJziWTkACpLcMkDA/zZzOrRcLqiH05Ese7pahstNB3U+YtFK5H7b7xHmKz0DLI/hb0DFV+z9M+1EXzasQD4gWiyVSfPrq5IreL/qnbaFWB+i3xtqEYuB9WSaT09M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n6mvggKj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACA2856D;
	Thu, 14 May 2026 12:25:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778754316;
	bh=fBPJqgxn6qmcXfZ3/nFWnwRzI4JPXRjmxSY+QTygWtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n6mvggKjCsu4q8pZ6572CsDTdrDHe1GttVmXfnI2xYYQeBLTHImFouqNLy6Zv0bhz
	 SGy69DDKaqIF7OTvY90A7C+PUAyvMAWCzjCVZxANlCWoMO3ao+rsL7qqy+WJ3gKHo4
	 /FJUxbDJOPdYJwq1LkGZ8PgTfSojYs62NWUfTf30=
Date: Thu, 14 May 2026 12:25:22 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 04/17] media: v4l2-subdev: Allocate frame descriptors
 based on the need
Message-ID: <agWi0wgNkfeZCV0t@zed>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
 <20260513104358.2252605-5-sakari.ailus@linux.intel.com>
 <agWfFzXX9a5tcd1i@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <agWfFzXX9a5tcd1i@zed>
X-Rspamd-Queue-Id: 2F1B25405BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61598-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Sakari

On Thu, May 14, 2026 at 12:16:51PM +0200, Jacopo Mondi wrote:
> Hi Sakari
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
>
> nit: you can invert the condition and save one indentation level
>
>                 if (fd->num_entries <= V4L2_FRAME_DESC_ENTRY_PREALLOC ||
>                     fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX)
>                     return -E2BIG;
>
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
>
> If we end up calling d->ops->pad->get_frame_desc() don't we overwrite
> the returned type ?
>
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
>
> As this might be used as a __cleanup() should we check if desc is
> valid ?
>
> > +	if (desc->entry != desc->entry_mem)
> > +		kfree(desc->entry);

Sorry, in my below comment  ....


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
>
> Is it unconditionally true ? If fd->entry is not initialized aren't we
> deflecting to the pre-allocated entries in call_get_frame_desc() ?
>
> 	if (!fd->entry) {
> 		fd->entry = fd->entry_mem;
> 		fd->len_entries = ARRAY_SIZE(fd->entry_mem);
> 	}
>
> v4l2_subdev_free_frame_desc() shouldn't be called in this case, right ?

... here I missed this, so it's safe to call
v4l2_subdev_free_frame_desc() unconditionally

>
>
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
> > --
> > 2.47.3
> >
> >

