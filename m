Return-Path: <linux-media+bounces-36440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F44AEFAD7
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62197188A387
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945A92750FA;
	Tue,  1 Jul 2025 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jZjqNsPW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F705274B55;
	Tue,  1 Jul 2025 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376798; cv=none; b=nXAvCyFjYsXwmuV8oqfNn09Pm1/mlvWn2wn1PPD2N2Itm+H5PL8GOjG9qdRobsjpDQj4/+oG9j04exE0hx9l+9FnX6ud5WwIIdh5H8QCJ9Ct1SilkwCNuwgxF7SLxv8i01IKSwEYmkz1peVt9oCGRnWM7y7/4oEq/zr1OcxSHVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376798; c=relaxed/simple;
	bh=Bltvy5Pprs+VLq6Qm3YeE7YYefuo5jxIbcHDeXhFs5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kt2bS23YPMpoHfiCbtXSZbqfnm7m54g7pE7gC1UMqz2TBLG4gMojDJZSMdcnLxqi3UFMLrU3QIWXJjWFoJXwe7+191c2oxlNYLHi2fRQ+T0ZcRVwd/jpGLgE3zKxtXzUZlqyAg6k0AK4+XP/GukKtYSEUoM6hF3Z17mufTKlreE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jZjqNsPW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5A9D6F3;
	Tue,  1 Jul 2025 15:32:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751376771;
	bh=Bltvy5Pprs+VLq6Qm3YeE7YYefuo5jxIbcHDeXhFs5M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jZjqNsPWtivIOVRZSwHIrqZJlAFZg82QC2f+OkdMgZhj4oFzaz8s006YPnje9iPiE
	 ybHhF9OAnesBDqtzq1EZ+O9rJK3TxLTqhKvzofXS4ANyj2al3qxx+QYhEr1ZTPMWGh
	 3u/r1LiUkn0uCcl4jB/M66ZGe+gesGjvKDvNFeDE=
Message-ID: <cefac528-9f82-47eb-bb3d-2db1ae5571a8@ideasonboard.com>
Date: Tue, 1 Jul 2025 14:33:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: platform: Add Renesas Input Video Control
 block driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 biju.das.jz@bp.renesas.com
References: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
 <20250624-ivc-v2-2-e4ecdddb0a96@ideasonboard.com>
 <tgjqjwqfmjihux545gnmdvaisdgayxh62lsrrqqv2zy2av5scr@mnkmo3ysacet>
 <d200372a-7edb-4469-8bb4-1080203676bb@ideasonboard.com>
 <mcutfm7pqpgcho4xqsvgous7yfuxfc2haya5asewfa6zyrb2zp@m6rnv6ksd62w>
 <08d03115-e580-43f2-bcca-ca30866e51c3@ideasonboard.com>
 <33mdmcvsxipleukxvqysadnnwjfw3taaiov6welva4kthg5sct@q75e7xvy57n7>
 <22a0e86a-b750-4db7-9263-ea99bf4c7fa1@ideasonboard.com>
 <nn5spkrsp4lppwbg3qha5gtokbr2cq5hg7ussbtgakorvduo6a@nznfu253iffi>
 <3dcd5ce9-2bf4-4e63-a494-e364540b00af@ideasonboard.com>
 <btrgnypglvff3k5lsh6g4ietat55ec5wctap67ylredsgdblrr@e722ix2cy74q>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <btrgnypglvff3k5lsh6g4ietat55ec5wctap67ylredsgdblrr@e722ix2cy74q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 01/07/2025 14:31, Jacopo Mondi wrote:
> Hi Dan
>
> On Tue, Jul 01, 2025 at 02:21:09PM +0100, Dan Scally wrote:
>> Hi Jacopo
>>
>> On 01/07/2025 14:17, Jacopo Mondi wrote:
>>> Hi Dan
>>>
>>> On Tue, Jul 01, 2025 at 02:01:25PM +0100, Dan Scally wrote:
>>>> Hi Jacopo
>>>>
>>>> On 01/07/2025 13:58, Jacopo Mondi wrote:
>>>>> Hi Dan
>>>>>
>>>>> On Tue, Jul 01, 2025 at 12:27:41PM +0100, Dan Scally wrote:
>>>>>> Hi Jacopo
>>>>>>
>>>>> [snip]
>>>>>
>>>>>>>>>> +static bool rzv2h_ivc_pipeline_ready(struct media_pipeline *pipe)
>>>>>>>>>> +{
>>>>>>>>>> +	struct media_pipeline_entity_iter iter;
>>>>>>>>>> +	unsigned int n_video_devices = 0;
>>>>>>>>>> +	struct media_entity *entity;
>>>>>>>>>> +	int ret;
>>>>>>>>>> +
>>>>>>>>>> +	ret = media_pipeline_entity_iter_init(pipe, &iter);
>>>>>>>>>> +	if (ret)
>>>>>>>>>> +		return ret;
>>>>>>>>>> +
>>>>>>>>>> +	media_pipeline_for_each_entity(pipe, &iter, entity) {
>>>>>>>>>> +		if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
>>>>>>>>>> +			n_video_devices++;
>>>>>>>>>> +	}
>>>>>>>>> This counts the ISP video devices as well, right ?
>>>>>>>> That's right
>>>>>>>>
>>>>>>>>>> +
>>>>>>>>>> +	media_pipeline_entity_iter_cleanup(&iter);
>>>>>>>>>> +
>>>>>>>>>> +	return n_video_devices == pipe->start_count;
>>>>>>>>> So this checks that all other video devices have started when this one
>>>>>>>>> is started as well. What if we start the IVC first and the ISP later?
>>>>>>>> Doesn't matter which order; nothing happens until they're all started and
>>>>>>>> then the .pipeline_started() callbacks for the entities run.
>>>>>>> Ah sure, thanks, I got it wrong.
>>>>>>>
>>>>>>> I see that all drivers in the series (IVC and mali) that use the
>>>>>>> media_pipeline_started() helper have to implement a function similar
>>>>>>> in spirit to rzv2h_ivc_pipeline_ready(). Can't the framework do that ?
>>>>>>> So that drivers can call media_pipeline_started() [*] unconditionally
>>>>>>> and use its return value to find out if the pipeline has actually
>>>>>>> started or not ?
>>>>>> The steer I got from Laurent and Sakari was that code from mc shouldn't be
>>>>>> checking for MEDIA_ENTITY_TYPE_VIDEO_DEVICE, but perhaps we could have a
>>>>>> V4L2 helper that does that instead?
>>>>> Do you mean this check ?
>>>>>
>>>>> 	media_pipeline_for_each_entity(pipe, &iter, entity) {
>>>>> 		if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
>>>>> 			n_video_devices++;
>>>>> 	}
>>>> Yes
>>>>
>>>>> We have wrappers like
>>>>>
>>>>> __must_check int video_device_pipeline_start(struct video_device *vdev,
>>>>> 					     struct media_pipeline *pipe)
>>>>>
>>>>> already, so this might become something like
>>>>>
>>>>> int video_device_try_run_pipeline(vdev)
>>>>> {
>>>>>            pipe = video_device_pipeline(&ivc->vdev.dev);
>>>>>
>>>>>          	ret = media_pipeline_entity_iter_init(pipe, &iter);
>>>>> 	if (ret)
>>>>> 		return ret;
>>>>>
>>>>> 	media_pipeline_for_each_entity(pipe, &iter, entity) {
>>>>> 		if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
>>>>> 			n_video_devices++;
>>>>> 	}
>>>>>
>>>>> 	media_pipeline_entity_iter_cleanup(&iter);
>>>>>
>>>>> 	return (n_video_devices == pipe->start_count) ?
>>>>> 		media_pipeline_started(pipe) : -ENODEV;
>>>>> }
>>>>>
>>>>> The drivers then should become something like:
>>>>>
>>>>> static int rzv2h_ivc_start_streaming(struct vb2_queue *q, unsigned int count)
>>>>> {
>>>>> 	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
>>>>> 	struct media_pipeline *pipe;
>>>>> 	int ret;
>>>>>
>>>>> 	ret = pm_runtime_resume_and_get(ivc->dev);
>>>>> 	if (ret)
>>>>> 		goto err_return_buffers;
>>>>>
>>>>> 	ret = video_device_pipeline_alloc_start(&ivc->vdev.dev);
>>>>> 	if (ret) {
>>>>> 		dev_err(ivc->dev, "failed to start media pipeline\n");
>>>>> 		goto err_pm_runtime_put;
>>>>> 	}
>>>>>
>>>>> 	rzv2h_ivc_format_configure(ivc);
>>>>>
>>>>> 	ivc->buffers.sequence = 0;
>>>>> 	ivc->vvalid_ifp = 0;
>>>>>
>>>>>            if (!video_device_try_run_pipeline(ivc->dev))
>>>>> 		media_jobs_run_jobs(ivc->sched);
>>>>>
>>>>> 	return 0;
>>>>>
>>>>> err_pm_runtime_put:
>>>>> 	pm_runtime_put(ivc->dev);
>>>>> err_return_buffers:
>>>>> 	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_QUEUED);
>>>>>
>>>>> 	return ret;
>>>>> }
>>>>>
>>>>> Removing a bit of boilerplate in all drivers using
>>>>> media_pipeline_started()/stopped() ?
>>>> Yes something like video_device_pipeline_start() is what I was thinking,
>>>> what you've done there looks spot on to me!
>>> You know, looking at what [video|media]_pipeline_[alloc]_start() does,
>>> it could even be renamed to pipeline_validate() and your new functions
>>> named 'start' :)
>>>
>>> Anyway, just for the sake of discussion, one could even create a
>>>
>>> [video|media]_pipeline_[alloc]_run() function that bundles together
>>> the existing _start() functions and the newly proposed _try_run().
>>>
>>> The driver would be an even more compact
>>>
>>>    static int rzv2h_ivc_start_streaming(struct vb2_queue *q, unsigned int count)
>>>    {
>>>    	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
>>>    	struct media_pipeline *pipe;
>>>    	int ret;
>>>
>>>    	ret = pm_runtime_resume_and_get(ivc->dev);
>>>    	if (ret)
>>>    		goto err_return_buffers;
>>>
>>>    	rzv2h_ivc_format_configure(ivc);
>>>
>>>    	ivc->buffers.sequence = 0;
>>>    	ivc->vvalid_ifp = 0;
>>>
>>>    	ret = video_device_pipeline_alloc_run(&ivc->vdev.dev);
>>>    	if (ret) {
>>>    		dev_err(ivc->dev, "failed to start media pipeline\n");
>>>    		goto err_pm_runtime_put;
>>>    	}
>>>
>>> 	media_jobs_run_jobs(ivc->sched);
>> Wouldn't this still need to be conditional? We'd need
> Yeah my thinking was that if (ret) we don't get here
>
>> video_device_pipeline_alloc_run() to be able to return something that
>> indicated:
>>
>>
>> 1. Failure
>>
>> 2. Success, but the pipeline isn't ready to start
>>
>> 3. Success and the pipeline is ready to start
>>
>>
>> right?
> But yes, you have 3 possible return states, something that might make
> the API cumbersome to design
>
>>> 	return 0;
>>> }
>>>
>>> Do you see a use case for first starting the pipeline then trying to
>>> run it in a separate step ?
>>
>> Not off the top of my head...they're both operations that ought to happen in
>> .start_streaming()...but do you propose replacing the existing
>> video_device_pipeline_start() with a bundled function, or just adding a new
>> function and retaining the old one?
>>
> Not replacing them no, otherwise all drivers should be ported to use
> pipeline_started(), right ?
Yes
> However given the "three return values" problem, we might want to keep
> _try_run() separate ?


I'll have a think and post something...I'll probably bundle this and the pipeline_started() / 
pipeline_stopped() entity ops patch

>> Dan
>>
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static int rzv2h_ivc_start_streaming(struct vb2_queue *q, unsigned int count)
>>>>>>>>>> +{
>>>>>>>>>> +	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
>>>>>>>>>> +	struct media_pipeline *pipe;
>>>>>>>>>> +	int ret;
>>>>>>>>>> +
>>>>>>>>>> +	ret = pm_runtime_resume_and_get(ivc->dev);
>>>>>>>>>> +	if (ret)
>>>>>>>>>> +		goto err_return_buffers;
>>>>>>>>>> +
>>>>>>>>>> +	ret = video_device_pipeline_alloc_start(&ivc->vdev.dev);
>>>>>>>>>> +	if (ret) {
>>>>>>>>>> +		dev_err(ivc->dev, "failed to start media pipeline\n");
>>>>>>>>>> +		goto err_pm_runtime_put;
>>>>>>>>>> +	}
>>>>>>>>>> +
>>>>>>>>>> +	rzv2h_ivc_format_configure(ivc);
>>>>>>>>>> +
>>>>>>>>>> +	ivc->buffers.sequence = 0;
>>>>>>>>>> +
>>>>>>>>>> +	spin_lock(&ivc->spinlock);
>>>>>>>>>> +	ivc->vvalid_ifp = 0;
>>>>>>>>>> +	spin_unlock(&ivc->spinlock);
>>>>>>>>> scoped_guard() maybe, and I wonder if you need this if you initialize
>>>>>>>>> the variable before resume_and_get
>>>>>>>> It was just to guarantee that it's in a known state, but I can probably drop it
>>>>>>> I don't contest resetting it to 0, I'm just pointing out you can do
>>>>>>> that earlier and avoid locking ?
>>>>>> Ah! Yes certainly true.
>>>>>>>>>> +
>>>>>>>>>> +	pipe = video_device_pipeline(&ivc->vdev.dev);
>>>>>>>>>> +	if (rzv2h_ivc_pipeline_ready(pipe)) {
>>>>>>>>>> +		ret = media_pipeline_started(pipe);
>>>>>>>>>> +		if (ret)
>>>>>>>>>> +			goto err_stop_pipeline;
>>>>>>>>>> +
>>>>>>>>>> +		media_jobs_run_jobs(ivc->sched);
>>>>>>>>>> +	}
>>>>>>>>>> +
>>>>>>>>>> +	return 0;
>>>>>>>>>> +
>>>>>>>>>> +err_stop_pipeline:
>>>>>>>>>> +	video_device_pipeline_stop(&ivc->vdev.dev);
>>>>>>>>>> +err_pm_runtime_put:
>>>>>>>>>> +	pm_runtime_put(ivc->dev);
>>>>>>>>>> +err_return_buffers:
>>>>>>>>>> +	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_QUEUED);
>>>>>>>>>> +
>>>>>>>>>> +	return ret;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static void rzv2h_ivc_stop_streaming(struct vb2_queue *q)
>>>>>>>>>> +{
>>>>>>>>>> +	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
>>>>>>>>>> +	struct media_pipeline *pipe;
>>>>>>>>>> +
>>>>>>>>>> +	pipe = video_device_pipeline(&ivc->vdev.dev);
>>>>>>>>>> +	if (rzv2h_ivc_pipeline_ready(pipe)) {
>>>>>>>>>> +		media_pipeline_stopped(pipe);
>>>>>>>>>> +		media_jobs_cancel_jobs(ivc->sched);
>>>>>>>>>> +	}
>>>>>>>>> I suspect I already asked about this, but this returns true only if
>>>>>>>>> all video devices have started right ?
>>>>>>>> Right
>>>>>>>>>       So what if ISP is stopped first
>>>>>>>>> then IVC ?
>>>>>>>> It doesn't matter which gets stopped first, it's just to make sure we run
>>>>>>>> media_pipeline_stopped() and media_jobs_cancel_jobs() whenever the _first_
>>>>>>>> video device is stopped
>>>>>>>>>> +
>>>>>>>>>> +	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_ERROR);
>>>>>>>>>> +	video_device_pipeline_stop(&ivc->vdev.dev);
>>>>>>>>>> +	pm_runtime_mark_last_busy(ivc->dev);
>>>>>>>>>> +	pm_runtime_put_autosuspend(ivc->dev);
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static const struct vb2_ops rzv2h_ivc_vb2_ops = {
>>>>>>>>>> +	.queue_setup		= &rzv2h_ivc_queue_setup,
>>>>>>>>>> +	.buf_queue		= &rzv2h_ivc_buf_queue,
>>>>>>>>>> +	.wait_prepare		= vb2_ops_wait_prepare,
>>>>>>>>>> +	.wait_finish		= vb2_ops_wait_finish,
>>>>>>>>>> +	.start_streaming	= &rzv2h_ivc_start_streaming,
>>>>>>>>>> +	.stop_streaming		= &rzv2h_ivc_stop_streaming,
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +static const struct rzv2h_ivc_format *
>>>>>>>>>> +rzv2h_ivc_format_from_pixelformat(u32 fourcc)
>>>>>>>>>> +{
>>>>>>>>>> +	unsigned int i;
>>>>>>>>> nit: Could live inside the for loop
>>>>>>>> Ack
>>>>>>>>>> +
>>>>>>>>>> +	for (i = 0; i < ARRAY_SIZE(rzv2h_ivc_formats); i++)
>>>>>>>>>> +		if (fourcc == rzv2h_ivc_formats[i].fourcc)
>>>>>>>>>> +			return &rzv2h_ivc_formats[i];
>>>>>>>>>> +
>>>>>>>>>> +	return &rzv2h_ivc_formats[0];
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static int rzv2h_ivc_enum_fmt_vid_out(struct file *file, void *fh,
>>>>>>>>>> +				      struct v4l2_fmtdesc *f)
>>>>>>>>>> +{
>>>>>>>>>> +	if (f->index >= ARRAY_SIZE(rzv2h_ivc_formats))
>>>>>>>>>> +		return -EINVAL;
>>>>>>>>>> +
>>>>>>>>>> +	f->pixelformat = rzv2h_ivc_formats[f->index].fourcc;
>>>>>>>>>> +	return 0;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static int rzv2h_ivc_g_fmt_vid_out(struct file *file, void *fh,
>>>>>>>>>> +				   struct v4l2_format *f)
>>>>>>>>>> +{
>>>>>>>>>> +	struct rzv2h_ivc *ivc = video_drvdata(file);
>>>>>>>>>> +
>>>>>>>>>> +	f->fmt.pix = ivc->format.pix;
>>>>>>>>>> +
>>>>>>>>>> +	return 0;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static void rzv2h_ivc_try_fmt(struct v4l2_pix_format *pix,
>>>>>>>>>> +			      const struct rzv2h_ivc_format *fmt)
>>>>>>>>>> +{
>>>>>>>>>> +	pix->pixelformat = fmt->fourcc;
>>>>>>>>>> +
>>>>>>>>>> +	pix->width = clamp(pix->width, RZV2H_IVC_MIN_WIDTH,
>>>>>>>>>> +			   RZV2H_IVC_MAX_WIDTH);
>>>>>>>>>> +	pix->height = clamp(pix->height, RZV2H_IVC_MIN_HEIGHT,
>>>>>>>>>> +			    RZV2H_IVC_MAX_HEIGHT);
>>>>>>>>>> +
>>>>>>>>>> +	pix->field = V4L2_FIELD_NONE;
>>>>>>>>>> +	pix->colorspace = V4L2_COLORSPACE_RAW;
>>>>>>>>>> +	pix->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>>>>>>>>>> +	pix->quantization = V4L2_QUANTIZATION_DEFAULT;
>>>>>>>>> Same as per the subdevice use explicit values, or at least the
>>>>>>>>> DEFAULT() macros
>>>>>>>>>
>>>>>>>>>> +
>>>>>>>>>> +	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static void rzv2h_ivc_set_format(struct rzv2h_ivc *ivc,
>>>>>>>>>> +				 struct v4l2_pix_format *pix)
>>>>>>>>>> +{
>>>>>>>>>> +	const struct rzv2h_ivc_format *fmt;
>>>>>>>>>> +
>>>>>>>>>> +	fmt = rzv2h_ivc_format_from_pixelformat(pix->pixelformat);
>>>>>>>>>> +
>>>>>>>>>> +	rzv2h_ivc_try_fmt(pix, fmt);
>>>>>>>>>> +	ivc->format.pix = *pix;
>>>>>>>>>> +	ivc->format.fmt = fmt;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static int rzv2h_ivc_s_fmt_vid_out(struct file *file, void *fh,
>>>>>>>>>> +				   struct v4l2_format *f)
>>>>>>>>>> +{
>>>>>>>>>> +	struct rzv2h_ivc *ivc = video_drvdata(file);
>>>>>>>>>> +	struct v4l2_pix_format *pix = &f->fmt.pix;
>>>>>>>>>> +
>>>>>>>>>> +	if (vb2_is_busy(&ivc->vdev.vb2q))
>>>>>>>>>> +		return -EBUSY;
>>>>>>>>>> +
>>>>>>>>>> +	rzv2h_ivc_set_format(ivc, pix);
>>>>>>>>>> +
>>>>>>>>>> +	return 0;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static int rzv2h_ivc_try_fmt_vid_out(struct file *file, void *fh,
>>>>>>>>>> +				     struct v4l2_format *f)
>>>>>>>>>> +{
>>>>>>>>>> +	const struct rzv2h_ivc_format *fmt;
>>>>>>>>>> +
>>>>>>>>>> +	fmt = rzv2h_ivc_format_from_pixelformat(f->fmt.pix.pixelformat);
>>>>>>>>>> +
>>>>>>>>>> +	rzv2h_ivc_try_fmt(&f->fmt.pix, fmt);
>>>>>>>>> nit: maybe remove the previous empty line and add one before return ?
>>>>>>>>>
>>>>>>>>>> +	return 0;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static int rzv2h_ivc_querycap(struct file *file, void *fh,
>>>>>>>>>> +			      struct v4l2_capability *cap)
>>>>>>>>>> +{
>>>>>>>>>> +	strscpy(cap->driver, "rzv2h-ivc", sizeof(cap->driver));
>>>>>>>>>> +	strscpy(cap->card, "Renesas Input Video Control", sizeof(cap->card));
>>>>>>>>>> +
>>>>>>>>>> +	return 0;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static const struct v4l2_ioctl_ops rzv2h_ivc_v4l2_ioctl_ops = {
>>>>>>>>>> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
>>>>>>>>>> +	.vidioc_querybuf = vb2_ioctl_querybuf,
>>>>>>>>>> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
>>>>>>>>>> +	.vidioc_qbuf = vb2_ioctl_qbuf,
>>>>>>>>>> +	.vidioc_expbuf = vb2_ioctl_expbuf,
>>>>>>>>>> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
>>>>>>>>>> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
>>>>>>>>>> +	.vidioc_streamon = vb2_ioctl_streamon,
>>>>>>>>>> +	.vidioc_streamoff = vb2_ioctl_streamoff,
>>>>>>>>>> +	.vidioc_enum_fmt_vid_out = rzv2h_ivc_enum_fmt_vid_out,
>>>>>>>>>> +	.vidioc_g_fmt_vid_out = rzv2h_ivc_g_fmt_vid_out,
>>>>>>>>>> +	.vidioc_s_fmt_vid_out = rzv2h_ivc_s_fmt_vid_out,
>>>>>>>>>> +	.vidioc_try_fmt_vid_out = rzv2h_ivc_try_fmt_vid_out,
>>>>>>>>>> +	.vidioc_querycap = rzv2h_ivc_querycap,
>>>>>>>>>> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>>>>>>>>>> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +static const struct v4l2_file_operations rzv2h_ivc_v4l2_fops = {
>>>>>>>>>> +	.owner = THIS_MODULE,
>>>>>>>>>> +	.unlocked_ioctl = video_ioctl2,
>>>>>>>>>> +	.open = v4l2_fh_open,
>>>>>>>>>> +	.release = vb2_fop_release,
>>>>>>>>>> +	.poll = vb2_fop_poll,
>>>>>>>>>> +	.mmap = vb2_fop_mmap,
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +static bool rzv2h_ivc_job_ready(void *data)
>>>>>>>>>> +{
>>>>>>>>>> +	struct rzv2h_ivc *ivc = data;
>>>>>>>>>> +
>>>>>>>>>> +	guard(spinlock)(&ivc->buffers.lock);
>>>>>>>>>> +
>>>>>>>>>> +	if (list_empty(&ivc->buffers.pending))
>>>>>>>>>> +		return false;
>>>>>>>>>> +
>>>>>>>>>> +	return true;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static void rzv2h_ivc_job_queue(void *data)
>>>>>>>>>> +{
>>>>>>>>>> +	struct rzv2h_ivc *ivc = data;
>>>>>>>>>> +	struct rzv2h_ivc_buf *buf;
>>>>>>>>>> +
>>>>>>>>>> +	/*
>>>>>>>>>> +	 * We need to move an entry from the pending queue to the input queue
>>>>>>>>>> +	 * here. We know that there is one, or .check_dep() would not have
>>>>>>>>>> +	 * allowed us to get this far. The entry needs to be removed or the same
>>>>>>>>>> +	 * check would allow a new job to be queued for the exact same buffer.
>>>>>>>>>> +	 */
>>>>>>>>>> +	guard(spinlock)(&ivc->buffers.lock);
>>>>>>>>>> +	buf = list_first_entry(&ivc->buffers.pending,
>>>>>>>>>> +			       struct rzv2h_ivc_buf, queue);
>>>>>>>>>> +	list_move_tail(&buf->queue, &ivc->buffers.queue);
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static void rzv2h_ivc_job_abort(void *data)
>>>>>>>>>> +{
>>>>>>>>>> +	struct rzv2h_ivc *ivc = data;
>>>>>>>>>> +	struct rzv2h_ivc_buf *buf;
>>>>>>>>>> +
>>>>>>>>>> +	guard(spinlock)(&ivc->buffers.lock);
>>>>>>>>>> +	buf = list_first_entry(&ivc->buffers.queue,
>>>>>>>>>> +			       struct rzv2h_ivc_buf, queue);
>>>>>>>>>> +
>>>>>>>>>> +	if (buf)
>>>>>>>>>> +		list_move(&buf->queue, &ivc->buffers.pending);
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static int rzv2h_ivc_job_add_steps(struct media_job *job, void *data)
>>>>>>>>>> +{
>>>>>>>>>> +	struct rzv2h_ivc *ivc = data;
>>>>>>>>>> +	int ret;
>>>>>>>>>> +
>>>>>>>>>> +	ret = media_jobs_add_job_step(job, rzv2h_ivc_set_next_buffer, ivc,
>>>>>>>>>> +				      MEDIA_JOBS_FL_STEP_ANYWHERE, 0);
>>>>>>>>>> +	if (ret)
>>>>>>>>>> +		return ret;
>>>>>>>>>> +
>>>>>>>>>> +	/*
>>>>>>>>>> +	 * This stage will be the second to last one to run - the ISP driver may
>>>>>>>>>> +	 * have some post-frame processing to do.
>>>>>>>>>> +	 */
>>>>>>>>>> +	return media_jobs_add_job_step(job, rzv2h_ivc_transfer_buffer, ivc,
>>>>>>>>>> +				       MEDIA_JOBS_FL_STEP_FROM_BACK, 1);
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static struct media_job_contributor_ops rzv2h_ivc_media_job_ops = {
>>>>>>>>>> +	.add_steps	= rzv2h_ivc_job_add_steps,
>>>>>>>>>> +	.ready		= rzv2h_ivc_job_ready,
>>>>>>>>>> +	.queue		= rzv2h_ivc_job_queue,
>>>>>>>>>> +	.abort		= rzv2h_ivc_job_abort
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +int rzv2h_initialise_video_dev_and_queue(struct rzv2h_ivc *ivc,
>>>>>>>>>> +					 struct v4l2_device *v4l2_dev)
>>>>>>>>>> +{
>>>>>>>>>> +	struct v4l2_pix_format pix = { };
>>>>>>>>>> +	struct video_device *vdev;
>>>>>>>>>> +	struct vb2_queue *vb2q;
>>>>>>>>>> +	int ret;
>>>>>>>>>> +
>>>>>>>>>> +	spin_lock_init(&ivc->buffers.lock);
>>>>>>>>>> +	INIT_LIST_HEAD(&ivc->buffers.queue);
>>>>>>>>>> +	INIT_LIST_HEAD(&ivc->buffers.pending);
>>>>>>>>>> +	init_waitqueue_head(&ivc->buffers.wq);
>>>>>>>>>> +
>>>>>>>>>> +	/* Initialise vb2 queue */
>>>>>>>>>> +	vb2q = &ivc->vdev.vb2q;
>>>>>>>>>> +	vb2q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>>>>>>>>> it's my understandin that MPLANE API is usually preferred also for devices
>>>>>>>>> that only support single planar formats
>>>>>>>> Oh ok - thanks, I'll make the switch
>>>>>>>>>> +	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
>>>>>>>>>> +	vb2q->drv_priv = ivc;
>>>>>>>>>> +	vb2q->mem_ops = &vb2_dma_contig_memops;
>>>>>>>>>> +	vb2q->ops = &rzv2h_ivc_vb2_ops;
>>>>>>>>>> +	vb2q->buf_struct_size = sizeof(struct rzv2h_ivc_buf);
>>>>>>>>>> +	vb2q->min_queued_buffers = 0;
>>>>>>>>> You can spare this, or keep it if you want it explicit
>>>>>>>> I'll probably keep it
>>>>>>>>>> +	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>>>>>>>>> +	vb2q->lock = &ivc->lock;
>>>>>>>>>> +	vb2q->dev = ivc->dev;
>>>>>>>>>> +
>>>>>>>>>> +	ret = vb2_queue_init(vb2q);
>>>>>>>>>> +	if (ret)
>>>>>>>>>> +		return dev_err_probe(ivc->dev, ret, "vb2 queue init failed\n");
>>>>>>>>>> +
>>>>>>>>>> +	/* Initialise Video Device */
>>>>>>>>>> +	vdev = &ivc->vdev.dev;
>>>>>>>>>> +	strscpy(vdev->name, "rzv2h-ivc", sizeof(vdev->name));
>>>>>>>>>> +	vdev->release = video_device_release_empty;
>>>>>>>>>> +	vdev->fops = &rzv2h_ivc_v4l2_fops;
>>>>>>>>>> +	vdev->ioctl_ops = &rzv2h_ivc_v4l2_ioctl_ops;
>>>>>>>>>> +	vdev->lock = &ivc->lock;
>>>>>>>>>> +	vdev->v4l2_dev = v4l2_dev;
>>>>>>>>>> +	vdev->queue = vb2q;
>>>>>>>>>> +	vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
>>>>>>>>>> +	vdev->vfl_dir = VFL_DIR_TX;
>>>>>>>>>> +	video_set_drvdata(vdev, ivc);
>>>>>>>>>> +
>>>>>>>>>> +	pix.pixelformat = V4L2_PIX_FMT_SRGGB16;
>>>>>>>>>> +	pix.width = RZV2H_IVC_DEFAULT_WIDTH;
>>>>>>>>>> +	pix.height = RZV2H_IVC_DEFAULT_HEIGHT;
>>>>>>>>>> +	rzv2h_ivc_set_format(ivc, &pix);
>>>>>>>>>> +
>>>>>>>>>> +	ivc->vdev.pad.flags = MEDIA_PAD_FL_SOURCE;
>>>>>>>>>> +	ivc->vdev.dev.entity.ops = &rzv2h_ivc_media_ops;
>>>>>>>>>> +	ret = media_entity_pads_init(&ivc->vdev.dev.entity, 1, &ivc->vdev.pad);
>>>>>>>>>> +	if (ret)
>>>>>>>>>> +		goto err_release_vb2q;
>>>>>>>>>> +
>>>>>>>>>> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>>>>>>>>>> +	if (ret) {
>>>>>>>>>> +		dev_err(ivc->dev, "failed to register IVC video device\n");
>>>>>>>>>> +		goto err_cleanup_vdev_entity;
>>>>>>>>>> +	}
>>>>>>>>> What is the path that registers the subdevice devnode to userspace ?
>>>>>>>>> IOW I was expecting to see v4l2_device_register_subdev_nodes()
>>>>>>>>> somewhere
>>>>>>>> That's in the ISP driver - the IVC's subdevice connects through the V4L2
>>>>>>>> asynchronous API to the ISP's notifier, and the notifier's .complete()
>>>>>>>> callback runs v4l2_device_register_subdev_nodes()
>>>>>>>>
>>>>>>> Ack, sure, thanks for clarifying it!
>>>>>>>
>>>>>>>>>> +
>>>>>>>>>> +	ret = media_create_pad_link(&vdev->entity, 0, &ivc->subdev.sd.entity,
>>>>>>>>>> +				    RZV2H_IVC_SUBDEV_SINK_PAD,
>>>>>>>>>> +				    MEDIA_LNK_FL_ENABLED |
>>>>>>>>>> +				    MEDIA_LNK_FL_IMMUTABLE);
>>>>>>>>>> +	if (ret) {
>>>>>>>>>> +		dev_err(ivc->dev, "failed to create media link\n");
>>>>>>>>>> +		goto err_unregister_vdev;
>>>>>>>>>> +	}
>>>>>>>>>> +
>>>>>>>>>> +	ivc->sched = media_jobs_get_scheduler(vdev->entity.graph_obj.mdev);
>>>>>>>>>> +	if (IS_ERR(ivc->sched)) {
>>>>>>>>>> +		ret = PTR_ERR(ivc->sched);
>>>>>>>>>> +		goto err_remove_link;
>>>>>>>>>> +	}
>>>>>>>>>> +
>>>>>>>>>> +	ret = media_jobs_register_job_contributor(ivc->sched,
>>>>>>>>>> +						  &rzv2h_ivc_media_job_ops, ivc,
>>>>>>>>>> +						  MEDIA_JOB_TYPE_PIPELINE_PULSE);
>>>>>>>>>> +	if (ret)
>>>>>>>>>> +		goto err_put_media_job_scheduler;
>>>>>>>>>> +
>>>>>>>>>> +	return 0;
>>>>>>>>>> +
>>>>>>>>>> +err_put_media_job_scheduler:
>>>>>>>>>> +	media_jobs_put_scheduler(ivc->sched);
>>>>>>>>>> +err_remove_link:
>>>>>>>>>> +	media_entity_remove_links(&vdev->entity);
>>>>>>>>>> +err_unregister_vdev:
>>>>>>>>>> +	video_unregister_device(vdev);
>>>>>>>>>> +err_cleanup_vdev_entity:
>>>>>>>>>> +	media_entity_cleanup(&vdev->entity);
>>>>>>>>>> +err_release_vb2q:
>>>>>>>>>> +	vb2_queue_release(vb2q);
>>>>>>>>>> +
>>>>>>>>>> +	return ret;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +void rzv2h_deinit_video_dev_and_queue(struct rzv2h_ivc *ivc)
>>>>>>>>>> +{
>>>>>>>>>> +	struct video_device *vdev = &ivc->vdev.dev;
>>>>>>>>>> +	struct vb2_queue *vb2q = &ivc->vdev.vb2q;
>>>>>>>>>> +
>>>>>>>>>> +	if (!ivc->sched)
>>>>>>>>>> +		return;
>>>>>>>>>> +
>>>>>>>>>> +	media_jobs_put_scheduler(ivc->sched);
>>>>>>>>>> +	vb2_video_unregister_device(vdev);
>>>>>>>>>> +	media_entity_cleanup(&vdev->entity);
>>>>>>>>>> +	vb2_queue_release(vb2q);
>>>>>>>>> Shouldn't you get here also in case of !ivc->sched ?
>>>>>>>> This driver (at least in this version) should always have a sched pointer,
>>>>>>>> so this was just a convenient way to check if initialisation finished before
>>>>>>>> trying to deinit anything...it'll probably change though.
>>>>>>> I see, a comment to explain that might be enough!
>>>>>> Sure - I'll add one.
>>>>>>
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>>> Dan
>>>>>>
>>>>>>> Thanks
>>>>>>>       j
>>>>>>>
>>>>>>>
>>>>>>>>>> +}
>>>>>>>>>> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
>>>>>>>>>> new file mode 100644
>>>>>>>>>> index 0000000000000000000000000000000000000000..d2e310ce868125772d97259619b9369ccbcefe3d
>>>>>>>>>> --- /dev/null
>>>>>>>>>> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
>>>>>>>>>> @@ -0,0 +1,133 @@
>>>>>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>>>>>> +/*
>>>>>>>>>> + * Renesas RZ/V2H Input Video Control Block driver
>>>>>>>>>> + *
>>>>>>>>>> + * Copyright (C) 2025 Ideas on Board Oy
>>>>>>>>>> + */
>>>>>>>>>> +
>>>>>>>>>> +#include <linux/clk.h>
>>>>>>>>>> +#include <linux/list.h>
>>>>>>>>>> +#include <linux/mutex.h>
>>>>>>>>>> +#include <linux/reset.h>
>>>>>>>>>> +#include <linux/spinlock.h>
>>>>>>>>>> +#include <linux/types.h>
>>>>>>>>>> +#include <linux/videodev2.h>
>>>>>>>>>> +#include <linux/wait.h>
>>>>>>>>>> +
>>>>>>>>>> +#include <media/media-entity.h>
>>>>>>>>>> +#include <media/v4l2-device.h>
>>>>>>>>>> +#include <media/v4l2-subdev.h>
>>>>>>>>>> +#include <media/videobuf2-core.h>
>>>>>>>>>> +#include <media/videobuf2-v4l2.h>
>>>>>>>>>> +
>>>>>>>>>> +#define RZV2H_IVC_REG_AXIRX_PLNUM			0x0000
>>>>>>>>>> +#define RZV2H_IVC_ONE_EXPOSURE				0x00
>>>>>>>>>> +#define RZV2H_IVC_TWO_EXPOSURE				0x01
>>>>>>>>>> +#define RZV2H_IVC_REG_AXIRX_PXFMT			0x0004
>>>>>>>>>> +#define RZV2H_IVC_INPUT_FMT_MIPI			(0 << 16)
>>>>>>>>>> +#define RZV2H_IVC_INPUT_FMT_CRU_PACKED			(1 << 16)
>>>>>>>>>> +#define RZV2H_IVC_PXFMT_DTYPE				GENMASK(7, 0)
>>>>>>>>>> +#define RZV2H_IVC_REG_AXIRX_SADDL_P0			0x0010
>>>>>>>>>> +#define RZV2H_IVC_REG_AXIRX_SADDH_P0			0x0014
>>>>>>>>>> +#define RZV2H_IVC_REG_AXIRX_SADDL_P1			0x0018
>>>>>>>>>> +#define RZV2H_IVC_REG_AXIRX_SADDH_P1			0x001c
>>>>>>>>>> +#define RZV2H_IVC_REG_AXIRX_HSIZE			0x0020
>>>>>>>>>> +#define RZV2H_IVC_REG_AXIRX_VSIZE			0x0024
>>>>>>>>>> +#define RZV2H_IVC_REG_AXIRX_BLANK			0x0028
>>>>>>>>>> +#define RZV2H_IVC_VBLANK(x)				((x) << 16)
>>>>>>>>>> +#define RZV2H_IVC_REG_AXIRX_STRD			0x0030
>>>>>>>>>> +#define RZV2H_IVC_REG_AXIRX_ISSU			0x0040
>>>>>>>>>> +#define RZV2H_IVC_REG_AXIRX_ERACT			0x0048
>>>>>>>>>> +#define RZV2H_IVC_REG_FM_CONTEXT			0x0100
>>>>>>>>>> +#define RZV2H_IVC_SOFTWARE_CFG				0x00
>>>>>>>>>> +#define RZV2H_IVC_SINGLE_CONTEXT_SW_HW_CFG		BIT(0)
>>>>>>>>>> +#define RZV2H_IVC_MULTI_CONTEXT_SW_HW_CFG		BIT(1)
>>>>>>>>>> +#define RZV2H_IVC_REG_FM_MCON				0x0104
>>>>>>>>>> +#define RZV2H_IVC_REG_FM_FRCON				0x0108
>>>>>>>>>> +#define RZV2H_IVC_REG_FM_STOP				0x010c
>>>>>>>>>> +#define RZV2H_IVC_REG_FM_INT_EN				0x0120
>>>>>>>>>> +#define RZV2H_IVC_VVAL_IFPE				BIT(0)
>>>>>>>>>> +#define RZV2H_IVC_REG_FM_INT_STA			0x0124
>>>>>>>>>> +#define RZV2H_IVC_REG_AXIRX_FIFOCAP0			0x0208
>>>>>>>>>> +#define RZV2H_IVC_REG_CORE_CAPCON			0x020c
>>>>>>>>>> +#define RZV2H_IVC_REG_CORE_FIFOCAP0			0x0228
>>>>>>>>>> +#define RZV2H_IVC_REG_CORE_FIFOCAP1			0x022c
>>>>>>>>>> +
>>>>>>>>>> +#define RZV2H_IVC_MIN_WIDTH				640
>>>>>>>>>> +#define RZV2H_IVC_MAX_WIDTH				4096
>>>>>>>>>> +#define RZV2H_IVC_MIN_HEIGHT				480
>>>>>>>>>> +#define RZV2H_IVC_MAX_HEIGHT				4096
>>>>>>>>>> +#define RZV2H_IVC_DEFAULT_WIDTH				1920
>>>>>>>>>> +#define RZV2H_IVC_DEFAULT_HEIGHT			1080
>>>>>>>>>> +
>>>>>>>>>> +#define RZV2H_IVC_NUM_CLOCKS				3
>>>>>>>>>> +#define RZV2H_IVC_NUM_RESETS				3
>>>>>>>>>> +
>>>>>>>>>> +struct device;
>>>>>>>>>> +
>>>>>>>>>> +enum rzv2h_ivc_subdev_pads {
>>>>>>>>>> +	RZV2H_IVC_SUBDEV_SINK_PAD,
>>>>>>>>>> +	RZV2H_IVC_SUBDEV_SOURCE_PAD,
>>>>>>>>>> +	RZV2H_IVC_NUM_SUBDEV_PADS
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct rzv2h_ivc_format {
>>>>>>>>>> +	u32 fourcc;
>>>>>>>>>> +	/*
>>>>>>>>>> +	 * The CRU packed pixel formats are bayer-order agnostic, so each could
>>>>>>>>>> +	 * support any one of the 4 possible media bus formats.
>>>>>>>>>> +	 */
>>>>>>>>>> +	u32 mbus_codes[4];
>>>>>>>>>> +	u8 dtype;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +struct rzv2h_ivc {
>>>>>>>>>> +	struct device *dev;
>>>>>>>>>> +	void __iomem *base;
>>>>>>>>>> +	struct clk_bulk_data clks[RZV2H_IVC_NUM_CLOCKS];
>>>>>>>>>> +	struct reset_control_bulk_data resets[RZV2H_IVC_NUM_RESETS];
>>>>>>>>>> +	int irqnum;
>>>>>>>>>> +	u8 vvalid_ifp;
>>>>>>>>>> +
>>>>>>>>>> +	struct {
>>>>>>>>>> +		struct video_device dev;
>>>>>>>>>> +		struct vb2_queue vb2q;
>>>>>>>>>> +		struct media_pad pad;
>>>>>>>>>> +	} vdev;
>>>>>>>>>> +
>>>>>>>>>> +	struct {
>>>>>>>>>> +		struct v4l2_subdev sd;
>>>>>>>>>> +		struct media_pad pads[RZV2H_IVC_NUM_SUBDEV_PADS];
>>>>>>>>>> +	} subdev;
>>>>>>>>>> +
>>>>>>>>>> +	struct {
>>>>>>>>>> +		/* Spinlock to guard buffer queue */
>>>>>>>>>> +		spinlock_t lock;
>>>>>>>>>> +		wait_queue_head_t wq;
>>>>>>>>>> +		struct list_head queue;
>>>>>>>>>> +		struct list_head pending;
>>>>>>>>>> +		struct rzv2h_ivc_buf *curr;
>>>>>>>>>> +		unsigned int sequence;
>>>>>>>>>> +	} buffers;
>>>>>>>>>> +
>>>>>>>>>> +	struct media_job_scheduler *sched;
>>>>>>>>>> +
>>>>>>>>>> +	struct {
>>>>>>>>>> +		struct v4l2_pix_format pix;
>>>>>>>>>> +		const struct rzv2h_ivc_format *fmt;
>>>>>>>>>> +	} format;
>>>>>>>>>> +
>>>>>>>>>> +	/* Mutex to provide to vb2 */
>>>>>>>>>> +	struct mutex lock;
>>>>>>>>>> +	/* Lock to protect the interrupt counter */
>>>>>>>>>> +	spinlock_t spinlock;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +int rzv2h_initialise_video_dev_and_queue(struct rzv2h_ivc *ivc,
>>>>>>>>>> +					 struct v4l2_device *v4l2_dev);
>>>>>>>>>> +void rzv2h_deinit_video_dev_and_queue(struct rzv2h_ivc *ivc);
>>>>>>>>>> +int rzv2h_ivc_initialise_subdevice(struct rzv2h_ivc *ivc);
>>>>>>>>>> +void rzv2h_ivc_deinit_subdevice(struct rzv2h_ivc *ivc);
>>>>>>>>>> +void rzv2h_ivc_write(struct rzv2h_ivc *ivc, u32 addr, u32 val);
>>>>>>>>>> +void rzv2h_ivc_update_bits(struct rzv2h_ivc *ivc, unsigned int addr,
>>>>>>>>>> +			   u32 mask, u32 val);
>>>>>>>>>>
>>>>>>>>> As agreed, I didn't review the job scheduler part but only the IVC
>>>>>>>>> specific bits. A few nits here and there and next version should be
>>>>>>>>> good to go!
>>>>>>>>>
>>>>>>>>> Thanks
>>>>>>>>>        j
>>>>>>>>>
>>>>>>>>>> --
>>>>>>>>>> 2.34.1
>>>>>>>>>>
>>>>>>>>>>

