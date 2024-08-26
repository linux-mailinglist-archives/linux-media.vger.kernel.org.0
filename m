Return-Path: <linux-media+bounces-16797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F7395F166
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC4651F227DE
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289F717ADF7;
	Mon, 26 Aug 2024 12:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="am4/BUFh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60D017ADF0;
	Mon, 26 Aug 2024 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724675776; cv=none; b=CluFKULTmPV01s3bB4qTTb5YDOqu3S1ygnOTl5ElGA467/C77ri+MJ+lBjQL5CSdJqW7+QYJxZxwqjzIvSQ9IcN1hGZVCFb+L4dSGlFuY4cw8gbVpJBG6XbF57MmdtycNI4YupmxiHqGQm24tLLe8Gz1Nf0aAdjmWmh+dlNNDpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724675776; c=relaxed/simple;
	bh=vPGZN81hK5OAKrdCJfVnYxzu0eIEohW+niVzaqHRGys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NoTZPjDQinLJ+o2izvLVrUTFDFIZ1Hi7z0cXUCQtcICv5gOaV+C4HB+zMb8NyH/L/42Z4NoacFP5J75JSPG0EkIhtfjAwVGfkDdW2xyMFukxBCBIuPmTpHgFbc3rpxwqf0xNBjbTwymWzKj7JA2nL/ykrGFiAyjOUL6C12WKKx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=am4/BUFh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 857036CA;
	Mon, 26 Aug 2024 14:35:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724675707;
	bh=vPGZN81hK5OAKrdCJfVnYxzu0eIEohW+niVzaqHRGys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=am4/BUFhsfvPbnJKVsm4WVr2/6HquzH6IZvOL/2VqrHIRWYOYoQ7E6RvSBaSnHIHZ
	 tWd0VfHmxBvg5Cb0xh6W53fD9R3tUiYiuYMri4sx+38z9kwvCPVIsRRZqBvEy2eMt1
	 0ifyK8qqjrYf7UlEcTF+2KkifroSzpUZScsSQf0g=
Message-ID: <dcbf1f3a-4322-4581-a0f1-7a7fd1130e90@ideasonboard.com>
Date: Mon, 26 Aug 2024 15:36:10 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] [DNI] media: renesas: vsp1: Validate all links
 through .link_validate()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240822154531.25912-8-laurent.pinchart+renesas@ideasonboard.com>
 <93fd78a6-c8fa-421f-b10c-69a42ac8112d@ideasonboard.com>
 <20240826121835.GE27785@pendragon.ideasonboard.com>
 <ac44fb59-e0bd-4198-b75f-d6e5f5b1a681@ideasonboard.com>
 <20240826122553.GF27785@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240826122553.GF27785@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/08/2024 15:25, Laurent Pinchart wrote:
> On Mon, Aug 26, 2024 at 03:22:02PM +0300, Tomi Valkeinen wrote:
>> On 26/08/2024 15:18, Laurent Pinchart wrote:
>>> Hi Tomi,
>>>
>>> On Mon, Aug 26, 2024 at 02:43:47PM +0300, Tomi Valkeinen wrote:
>>>> On 22/08/2024 18:45, Laurent Pinchart wrote:
>>>>> Move validation of the links between video devices and subdevs,
>>>>> performed manually in vsp1_video_streamon(), to the video device
>>>>> .link_validate() handler.
>>>>>
>>>>> This is how drivers should be implemented, but sadly, doing so for the
>>>>> vsp1 driver could break userspace, introducing a regression. This patch
>>>>> serves as an example to showcase usage of the .link_validate()
>>>>> operation, but should not be merged.
>>>>>
>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>>> ---
>>>>>     .../media/platform/renesas/vsp1/vsp1_video.c  | 98 +++++++------------
>>>>>     1 file changed, 37 insertions(+), 61 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
>>>>> index e728f9f5160e..14575698bbe7 100644
>>>>> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
>>>>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
>>>>> @@ -45,51 +45,6 @@
>>>>>      * Helper functions
>>>>>      */
>>>>>     
>>>>> -static struct v4l2_subdev *
>>>>> -vsp1_video_remote_subdev(struct media_pad *local, u32 *pad)
>>>>> -{
>>>>> -	struct media_pad *remote;
>>>>> -
>>>>> -	remote = media_pad_remote_pad_first(local);
>>>>> -	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
>>>>> -		return NULL;
>>>>> -
>>>>> -	if (pad)
>>>>> -		*pad = remote->index;
>>>>> -
>>>>> -	return media_entity_to_v4l2_subdev(remote->entity);
>>>>> -}
>>>>> -
>>>>> -static int vsp1_video_verify_format(struct vsp1_video *video)
>>>>> -{
>>>>> -	struct v4l2_subdev_format fmt = {
>>>>> -		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>>>>> -	};
>>>>> -	struct v4l2_subdev *subdev;
>>>>> -	int ret;
>>>>> -
>>>>> -	subdev = vsp1_video_remote_subdev(&video->pad, &fmt.pad);
>>>>> -	if (subdev == NULL)
>>>>> -		return -EINVAL;
>>>>> -
>>>>> -	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
>>>>> -	if (ret < 0)
>>>>> -		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
>>>>> -
>>>>> -	if (video->rwpf->fmtinfo->mbus != fmt.format.code ||
>>>>> -	    video->rwpf->format.height != fmt.format.height ||
>>>>> -	    video->rwpf->format.width != fmt.format.width) {
>>>>> -		dev_dbg(video->vsp1->dev,
>>>>> -			"Format mismatch: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
>>>>> -			video->rwpf->fmtinfo->mbus, video->rwpf->format.width,
>>>>> -			video->rwpf->format.height, fmt.format.code,
>>>>> -			fmt.format.width, fmt.format.height);
>>>>> -		return -EPIPE;
>>>>> -	}
>>>>> -
>>>>> -	return 0;
>>>>> -}
>>>>> -
>>>>>     static int __vsp1_video_try_format(struct vsp1_video *video,
>>>>>     				   struct v4l2_pix_format_mplane *pix,
>>>>>     				   const struct vsp1_format_info **fmtinfo)
>>>>> @@ -991,14 +946,6 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
>>>>>     
>>>>>     	mutex_unlock(&mdev->graph_mutex);
>>>>>     
>>>>> -	/*
>>>>> -	 * Verify that the configured format matches the output of the connected
>>>>> -	 * subdev.
>>>>> -	 */
>>>>> -	ret = vsp1_video_verify_format(video);
>>>>> -	if (ret < 0)
>>>>> -		goto err_stop;
>>>>> -
>>>>>     	/* Start the queue. */
>>>>>     	ret = vb2_streamon(&video->queue, type);
>>>>>     	if (ret < 0)
>>>>> @@ -1087,14 +1034,43 @@ static const struct v4l2_file_operations vsp1_video_fops = {
>>>>>     
>>>>>     static int vsp1_video_link_validate(struct media_link *link)
>>>>>     {
>>>>> -	/*
>>>>> -	 * Ideally, link validation should be implemented here instead of
>>>>> -	 * calling vsp1_video_verify_format() in vsp1_video_streamon()
>>>>> -	 * manually. That would however break userspace that start one video
>>>>> -	 * device before configures formats on other video devices in the
>>>>> -	 * pipeline. This operation is just a no-op to silence the warnings
>>>>> -	 * from v4l2_subdev_link_validate().
>>>>> -	 */
>>>>> +	struct v4l2_subdev_format fmt = {
>>>>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>>>>> +	};
>>>>> +	struct v4l2_subdev *subdev;
>>>>> +	struct media_entity *entity;
>>>>> +	struct media_pad *remote;
>>>>> +	struct vsp1_video *video;
>>>>> +	int ret;
>>>>> +
>>>>> +	if (is_media_entity_v4l2_video_device(link->source->entity)) {
>>>>> +		entity = link->source->entity;
>>>>> +		remote = link->sink;
>>>>> +	} else {
>>>>> +		entity = link->sink->entity;
>>>>> +		remote = link->source;
>>>>> +	}
>>>>
>>>> This looks a bit odd. So this device can be either a source and a sink?
>>>
>>> Correct. The VSP has both capture and output video devices, and this
>>> helper function is used for both.
>>>
>>>> This made me also wonder about the .link_validate(). It's the only
>>>> media_entity_operations op that does not get the media_entity as a
>>>> parameter. Which here means the driver has to go and "guess" whether it
>>>> is the source or the sink of the given link.
>>>>
>>>> I wonder if there's a reason why .link_validate() doesn't have the
>>>> media_entity parameter?
>>>
>>> Because it validates a link. Which of the sink or source entity would
>>> you pass to the function ?
>>
>> The one where the op is defined.
> 
> With the exception of links from video output devices to subdevs, it's
> always the sink. I don't expect most drivers to use a single validation
> function for the capture and output video devices, so I don't think
> passing the entity pointer is that crucial. We could however improve
> this on top in case it ends up being a common use case.

It's an issue even if the driver only acts as a sink or source, but I 
agree, not crucial at all.

Looking at the patch 1 of this series:

+static int isc_link_validate(struct media_link *link)
  {
+	struct video_device *vdev =
+		media_entity_to_video_device(link->sink->entity);

that should be:

static int isc_link_validate(struct media_entity *ent, struct media_link 
*link)
{
	struct video_device *vdev = media_entity_to_video_device(ent);

In any case, that's a topic for another series =).

  Tomi


