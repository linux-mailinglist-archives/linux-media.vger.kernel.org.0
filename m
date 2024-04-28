Return-Path: <linux-media+bounces-10284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D46C68B4DDC
	for <lists+linux-media@lfdr.de>; Sun, 28 Apr 2024 23:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B9E41F20DD9
	for <lists+linux-media@lfdr.de>; Sun, 28 Apr 2024 21:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A023AD5E;
	Sun, 28 Apr 2024 21:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E85xYXr5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCABA8F54
	for <linux-media@vger.kernel.org>; Sun, 28 Apr 2024 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714338558; cv=none; b=RQuDsjU4wP1vtZlCEh3GAY9eIm3J+lT9LVD+8V+wpvFxQ9G6Kz2uBaFBZ6tJSq3Y+ezw2pEHPT8c92HHSCV8eLUB8eXe9JyPfNFtaHG6j9UZmBgeYiXsSXG6hOrs81n5uEHFk3NWnRaqZ8MJAyAs4z7A/6yaDe7Ebq7WmFkFn0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714338558; c=relaxed/simple;
	bh=4XWFJT5lobegwBqlsLB+8Y0+QisJuzVsC85crOf+iwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRjXLTDddKxt26irSiJYx0Ew8oHaj0bK5ReT33u41D6BzM1+FZCxvxHwft47qRKbDzanszJEIu1ZIikbnMnEznL9Bqwo84GcmREx6xBsQgLgMW5mt2KGpzaR77lEaa4xN7lWDpFRZkNmaWoxqsZX1RUd/2qdv+qW/J5gwMgMN7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E85xYXr5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714338556; x=1745874556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4XWFJT5lobegwBqlsLB+8Y0+QisJuzVsC85crOf+iwQ=;
  b=E85xYXr5jrpz0CXiRccYhGphaIUsStamLMDIYSek+NcQYi3j3V8NbmgN
   1JxZKODjZ9bQ7nsrH8PIWaRninVCtQW5rZ7WQ9rZyV1zbS1JxQ2RexqKd
   yu0IZBRaDs+No8zSMzBiwdvYOpFkOymZWYEPh6Q1HngU7J5dPMUMZoQRQ
   EfirVKMLk3+IEya1lS0CYtq/VJWLpcP/TRPbcqyP3mXgBD4S7wAb3FWvB
   TOJfqoeYOqvwPH2xv7CAOl5Gm7u9MVqAns3aCWjGC8iOSyxw5pNiLtunD
   kB2i+o8YJsPRHx3IIQAL11eTURCn1IbRaw1ZT3hjXT7jfezuRcNIAoZ8G
   Q==;
X-CSE-ConnectionGUID: 5IndlrRGSeqSe9YQpJw95Q==
X-CSE-MsgGUID: ysqyM4ynQ6us6OxN4IPzvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10155812"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="10155812"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 14:09:16 -0700
X-CSE-ConnectionGUID: G+GuzE4zSmOk+8JKR0drHQ==
X-CSE-MsgGUID: RLWCk1gEShe5a1qyhZUh4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="49148134"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 14:09:13 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 49D6811F832;
	Mon, 29 Apr 2024 00:09:10 +0300 (EEST)
Date: Sun, 28 Apr 2024 21:09:10 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
	senozhatsky@chromium.org, andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: Re: [PATCH v6 12/18] media: intel/ipu6: input system video nodes and
 buffer queues
Message-ID: <Zi669vttDTj1bSKw@kekkonen.localdomain>
References: <20240426095822.946453-1-sakari.ailus@linux.intel.com>
 <20240426095822.946453-13-sakari.ailus@linux.intel.com>
 <3d8a4af4-4a5f-49fd-8933-dad4f2066876@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d8a4af4-4a5f-49fd-8933-dad4f2066876@xs4all.nl>

Hi Hans,

Thank you for the review.

On Sat, Apr 27, 2024 at 05:44:48PM +0200, Hans Verkuil wrote:
...
> > +static int queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
> > +		       unsigned int *num_planes, unsigned int sizes[],
> > +		       struct device *alloc_devs[])
> > +{
> > +	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
> > +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> > +	struct device *dev = &av->isys->adev->auxdev.dev;
> > +	u32 size = av->pix_fmt.sizeimage;
> > +
> > +	/* num_planes == 0: we're being called through VIDIOC_REQBUFS */
> > +	if (!*num_planes) {
> > +		sizes[0] = size;
> > +	} else if (sizes[0] < size) {
> > +		dev_err(dev, "%s: queue setup: size %u < %u\n",
> > +			av->vdev.name, sizes[0], size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	*num_planes = 1;
> > +	alloc_devs[0] = aq->dev;
> 
> Don't set this. This is already done by the vb2 core. Setting this is only
> necessary for very weird hardware that uses a different device per plane.

I'll drop this from v7.

> > +static int start_streaming(struct vb2_queue *q, unsigned int count)
> > +{
> > +	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
> > +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> > +	struct device *dev = &av->isys->adev->auxdev.dev;
> > +	struct ipu6_isys_buffer_list __bl, *bl = NULL;
> > +	struct ipu6_isys_stream *stream;
> > +	struct media_entity *source_entity = NULL;
> > +	int nr_queues, ret;
> > +
> > +	dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
> > +		av->vdev.name, av->pix_fmt.width, av->pix_fmt.height,
> > +		av->pfmt->css_pixelformat);
> > +
> > +	ret = ipu6_isys_setup_video(av, &source_entity, &nr_queues);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to setup video\n");
> > +		goto out_return_buffers;
> > +	}
> > +
> > +	ret = ipu6_isys_link_fmt_validate(aq);
> > +	if (ret) {
> > +		dev_err(dev,
> > +			"%s: link format validation failed (%d)\n",
> > +			av->vdev.name, ret);
> > +		goto out_pipeline_stop;
> > +	}
> > +
> > +	ret = ipu6_isys_fw_open(av->isys);
> > +	if (ret)
> > +		goto out_pipeline_stop;
> > +
> > +	stream = av->stream;
> > +	mutex_lock(&stream->mutex);
> > +	if (!stream->nr_streaming) {
> > +		ret = ipu6_isys_video_prepare_stream(av, source_entity,
> > +						     nr_queues);
> > +		if (ret)
> > +			goto out_fw_close;
> > +	}
> > +
> > +	stream->nr_streaming++;
> > +	dev_dbg(dev, "queue %u of %u\n", stream->nr_streaming,
> > +		stream->nr_queues);
> > +
> > +	list_add(&aq->node, &stream->queues);
> > +	ipu6_isys_set_csi2_streams_status(av, true);
> > +	ipu6_isys_configure_stream_watermark(av, true);
> > +	ipu6_isys_update_stream_watermark(av, true);
> > +
> > +	if (stream->nr_streaming != stream->nr_queues)
> > +		goto out;
> > +
> > +	bl = &__bl;
> > +	ret = buffer_list_get(stream, bl);
> > +	if (ret < 0) {
> > +		dev_dbg(dev,
> > +			"no buffer available, postponing streamon\n");
> 
> You can ensure that start_streaming is only called when there is at least
> one buffer queued by setting q->min_queued_buffers to 1 in ipu6_isys_queue_init().
> That is the recommended method for dealing with such requirements.

Ack.

I'll still leave this as a sanity check and turn it into an error.

> 
> > +		goto out;
> > +	}
> > +
> > +	ret = ipu6_isys_stream_start(av, bl, false);
> > +	if (ret)
> > +		goto out_stream_start;
> > +
> > +out:
> > +	mutex_unlock(&stream->mutex);
> > +
> > +	return 0;
> > +
> > +out_stream_start:
> > +	ipu6_isys_update_stream_watermark(av, false);
> > +	list_del(&aq->node);
> > +	stream->nr_streaming--;
> > +
> > +out_fw_close:
> > +	mutex_unlock(&stream->mutex);
> > +	ipu6_isys_fw_close(av->isys);
> > +
> > +out_pipeline_stop:
> > +	ipu6_isys_stream_cleanup(av);
> > +
> > +out_return_buffers:
> > +	return_buffers(aq, VB2_BUF_STATE_QUEUED);
> > +
> > +	return ret;
> > +}

...

> > +static int vidioc_s_fmt_vid_cap(struct file *file, void *fh,
> > +				struct v4l2_format *f)
> > +{
> > +	struct ipu6_isys_video *av = video_drvdata(file);
> > +
> > +	if (av->aq.vbq.streaming)
> 
> This should call vb2_is_busy() instead of checking the streaming flag.
> 
> I'm pretty sure v4l2-compliance checks for that, but perhaps the current
> FAILs prevented it from getting that far.
> 
> According to the cover letter, those FAILs in v4l2-compliance are because
> of a limitation in v4l2-compliance: that should be fixed so that this
> driver can pass the full v4l2-compliance test. I suspect that not doing that
> causes this issue to be missed.

I'll switch to vb2_is_busy() in v7.

-- 
Kind regards,

Sakari Ailus

