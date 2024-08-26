Return-Path: <linux-media+bounces-16792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CE495F12B
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 961A2282BEC
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD69D16E886;
	Mon, 26 Aug 2024 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a7aeqkUr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B205C140369;
	Mon, 26 Aug 2024 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724674722; cv=none; b=JO1HHaGrKRHe2kOBpYrQZZAJdiB65cGKkOEZT6V5ZR7fLPzUaoEIFoCX7dUlKurt/hwLOFr0A03AyR8CkgSsGmuVkZ7HsMj84CIm463JGltSWPKCAIuDOAd82qWt76NOLZWMik4p8vk5oI+ljr/KM3T2qXexSCn2/nJXQccE3NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724674722; c=relaxed/simple;
	bh=CxLWIEYecMAkx1/7Kn/DpMHICAmyC7zkBqbzOmdW9s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7K5ePcyr06nqbwwe38cDoSQhnexycn8HxPAPeQMFdIcJJh/+hQ5xf3RH8YDP0z/9RmK/L1xZrP/rJJAerIQzN+MzUCTUOHg7nBeNz+uCglOz2tcqdVpqnglwMloW7OjTdqF2F+BvTXLYpyixGCHQq+nQIU6+ELqhhPIWZIFfZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a7aeqkUr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A2756CA;
	Mon, 26 Aug 2024 14:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724674652;
	bh=CxLWIEYecMAkx1/7Kn/DpMHICAmyC7zkBqbzOmdW9s0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a7aeqkUrMN+MlApYHm93GaeQs09liQQUp8VKZVg0dWCZvBS2nqMMNyQHexEudujeX
	 8qL8pT62d0a8yj5OqVJUNtrVnef+WTRVPvBcaAzuIHvy2N+vlGuPwq4zaqhg1qcarw
	 HJUnJEQImsViajfomB97QpcsPU9a/bUJOAC4TFwI=
Date: Mon, 26 Aug 2024 15:18:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 7/7] [DNI] media: renesas: vsp1: Validate all links
 through .link_validate()
Message-ID: <20240826121835.GE27785@pendragon.ideasonboard.com>
References: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240822154531.25912-8-laurent.pinchart+renesas@ideasonboard.com>
 <93fd78a6-c8fa-421f-b10c-69a42ac8112d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93fd78a6-c8fa-421f-b10c-69a42ac8112d@ideasonboard.com>

Hi Tomi,

On Mon, Aug 26, 2024 at 02:43:47PM +0300, Tomi Valkeinen wrote:
> On 22/08/2024 18:45, Laurent Pinchart wrote:
> > Move validation of the links between video devices and subdevs,
> > performed manually in vsp1_video_streamon(), to the video device
> > .link_validate() handler.
> > 
> > This is how drivers should be implemented, but sadly, doing so for the
> > vsp1 driver could break userspace, introducing a regression. This patch
> > serves as an example to showcase usage of the .link_validate()
> > operation, but should not be merged.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >   .../media/platform/renesas/vsp1/vsp1_video.c  | 98 +++++++------------
> >   1 file changed, 37 insertions(+), 61 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > index e728f9f5160e..14575698bbe7 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > @@ -45,51 +45,6 @@
> >    * Helper functions
> >    */
> >   
> > -static struct v4l2_subdev *
> > -vsp1_video_remote_subdev(struct media_pad *local, u32 *pad)
> > -{
> > -	struct media_pad *remote;
> > -
> > -	remote = media_pad_remote_pad_first(local);
> > -	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
> > -		return NULL;
> > -
> > -	if (pad)
> > -		*pad = remote->index;
> > -
> > -	return media_entity_to_v4l2_subdev(remote->entity);
> > -}
> > -
> > -static int vsp1_video_verify_format(struct vsp1_video *video)
> > -{
> > -	struct v4l2_subdev_format fmt = {
> > -		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > -	};
> > -	struct v4l2_subdev *subdev;
> > -	int ret;
> > -
> > -	subdev = vsp1_video_remote_subdev(&video->pad, &fmt.pad);
> > -	if (subdev == NULL)
> > -		return -EINVAL;
> > -
> > -	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
> > -	if (ret < 0)
> > -		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
> > -
> > -	if (video->rwpf->fmtinfo->mbus != fmt.format.code ||
> > -	    video->rwpf->format.height != fmt.format.height ||
> > -	    video->rwpf->format.width != fmt.format.width) {
> > -		dev_dbg(video->vsp1->dev,
> > -			"Format mismatch: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
> > -			video->rwpf->fmtinfo->mbus, video->rwpf->format.width,
> > -			video->rwpf->format.height, fmt.format.code,
> > -			fmt.format.width, fmt.format.height);
> > -		return -EPIPE;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> >   static int __vsp1_video_try_format(struct vsp1_video *video,
> >   				   struct v4l2_pix_format_mplane *pix,
> >   				   const struct vsp1_format_info **fmtinfo)
> > @@ -991,14 +946,6 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
> >   
> >   	mutex_unlock(&mdev->graph_mutex);
> >   
> > -	/*
> > -	 * Verify that the configured format matches the output of the connected
> > -	 * subdev.
> > -	 */
> > -	ret = vsp1_video_verify_format(video);
> > -	if (ret < 0)
> > -		goto err_stop;
> > -
> >   	/* Start the queue. */
> >   	ret = vb2_streamon(&video->queue, type);
> >   	if (ret < 0)
> > @@ -1087,14 +1034,43 @@ static const struct v4l2_file_operations vsp1_video_fops = {
> >   
> >   static int vsp1_video_link_validate(struct media_link *link)
> >   {
> > -	/*
> > -	 * Ideally, link validation should be implemented here instead of
> > -	 * calling vsp1_video_verify_format() in vsp1_video_streamon()
> > -	 * manually. That would however break userspace that start one video
> > -	 * device before configures formats on other video devices in the
> > -	 * pipeline. This operation is just a no-op to silence the warnings
> > -	 * from v4l2_subdev_link_validate().
> > -	 */
> > +	struct v4l2_subdev_format fmt = {
> > +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > +	};
> > +	struct v4l2_subdev *subdev;
> > +	struct media_entity *entity;
> > +	struct media_pad *remote;
> > +	struct vsp1_video *video;
> > +	int ret;
> > +
> > +	if (is_media_entity_v4l2_video_device(link->source->entity)) {
> > +		entity = link->source->entity;
> > +		remote = link->sink;
> > +	} else {
> > +		entity = link->sink->entity;
> > +		remote = link->source;
> > +	}
> 
> This looks a bit odd. So this device can be either a source and a sink?

Correct. The VSP has both capture and output video devices, and this
helper function is used for both.

> This made me also wonder about the .link_validate(). It's the only 
> media_entity_operations op that does not get the media_entity as a 
> parameter. Which here means the driver has to go and "guess" whether it 
> is the source or the sink of the given link.
> 
> I wonder if there's a reason why .link_validate() doesn't have the 
> media_entity parameter?

Because it validates a link. Which of the sink or source entity would
you pass to the function ?

> > +
> > +	fmt.pad = remote->index;
> > +
> > +	subdev = media_entity_to_v4l2_subdev(remote->entity);
> > +	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
> > +	if (ret < 0)
> > +		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
> > +
> > +	video = to_vsp1_video(media_entity_to_video_device(entity));
> > +
> > +	if (video->rwpf->fmtinfo->mbus != fmt.format.code ||
> > +	    video->rwpf->format.height != fmt.format.height ||
> > +	    video->rwpf->format.width != fmt.format.width) {
> > +		dev_dbg(video->vsp1->dev,
> > +			"Format mismatch: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
> > +			video->rwpf->fmtinfo->mbus, video->rwpf->format.width,
> > +			video->rwpf->format.height, fmt.format.code,
> > +			fmt.format.width, fmt.format.height);
> > +		return -EPIPE;
> > +	}
> 
> Why don't we have a common videodev state which could be used to do 
> these validations in a common function? =)

Because you haven't sent patches yet ;-)

But jokes aside, because there's no 1:1 mapping between media bus codes
and pixel formats, so drivers have to validate at least that part.

> Fwiw:
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

