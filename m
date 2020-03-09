Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7AC817E246
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 15:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgCIOKn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 10:10:43 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:52129 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726233AbgCIOKn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 10:10:43 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id BJ76jBbBV9Im2BJ79jSJ8W; Mon, 09 Mar 2020 15:10:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583763040; bh=rewipDPWWrsZC7v7PO26PZT9dPwgFlvDCONk9Vqg1Ug=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ongjwKY8OqGI/j0NyYni1p1q4qYk7gmw23Uxi/UF56IjI3d8otslcpxXUwpifu8+n
         KWQOb8Wnj0bQP+v9EsI7z198x7Ukf8nERu4A+41kHFNKrZeodCaoxeafaydytIBeNs
         FCSAlYs8WzfBR+QnDzwl04kq+5m51tSFJt6v/aRsdfHVMd0caYFJq0ElZbv5nK5YzM
         MutfmAUjQr8CtELh0LI+o4tz0LBdzFSZs6vVv4xsQH+wEHIaChMogRzTpVsctAPxSu
         cpq68mv8uKPTf3/8vMeqgHqzJcSa7UcL9vBur9G+4W3Z5wmRLyeqYw4MrGFM38MYpq
         HxG3rJ97gZduA==
Subject: Re: [PATCH v4 1/3] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
References: <20200306163935.805333-1-niklas.soderlund@ragnatech.se>
 <20200306163935.805333-2-niklas.soderlund@ragnatech.se>
 <20200309134747.GT5379@paasikivi.fi.intel.com>
 <b4ef9916-1e66-23ba-8b95-95e22a6be964@xs4all.nl>
 <20200309135649.GW5379@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c53eda98-662a-1a81-4440-2d1b91e37569@xs4all.nl>
Date:   Mon, 9 Mar 2020 15:10:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309135649.GW5379@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHDI1RUeFfYyMi+nmdQRTfUDvMTvpj4MGprtmmZrN6yE0c0RXVm3KSArlMMTBVHPDPfro1OV1KoY4YFRlSJgDdLqEYHjOqgOPR1FKUE7njjIYbRW3ddP
 hwFJJ4Hri2bknng+3O6ZmwsXR2CCwx+nVimV0SI9JuAsufm1eiPnjw79mQbiBjAmFStqbGwXuCYYBjC+MVjT2V47ZWULm29k7qZMwV1a6Zqh0QdunixXl4WP
 HpEmlJnS7zwJRZWP7HWtb7riXxTGxCHukOYv2sWiYzT95oOUnuFZ5enSirXQD6117OuKXMa0Cq2qAL1YCO/ma3nILTaTWHTlOgo4j8zDq/UTG3E0mVkgGlHH
 uxY+rnoVy13OvE5DeJeDijqOCDgxyWCjdgihaRDyLfYwWcNL5fGoAuiGUYI+ZAA3EHub5b65I+Kv4iKXGAC1reaAjXS1gmY2yj1IH6F33Je/f/1UkPk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/9/20 2:56 PM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Mar 09, 2020 at 02:53:15PM +0100, Hans Verkuil wrote:
>> On 3/9/20 2:47 PM, Sakari Ailus wrote:
>>> Hi Niklas,
>>>
>>> Thanks for the update!
>>>
>>> On Fri, Mar 06, 2020 at 05:39:33PM +0100, Niklas Söderlund wrote:
>>>> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>>>
>>>> Add a video device capability flag to indicate that its inputs and/or
>>>> outputs are controlled by the Media Controller instead of the V4L2 API.
>>>> When this flag is set, ioctl for enum inputs and outputs are
>>>> automatically enabled and programmed to call a helper function.
>>>>
>>>> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
>>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>>> ---
>>>> * Changes since v3
>>>> - Update documentation for V4L2_CAP_IO_MC
>>>> - Only enable VIDIOC_{G,S}_{INPUT,OUTPUT} if V4L2_CAP_IO_MC is set
>>>>   (instead of unconditionally)
>>>> - Merge v4l2_ioctl_enum_input_mc() into v4l_enuminput()
>>>> - Merge v4l2_ioctl_enum_output_mc() into v4l_enumoutput()
>>>>
>>>> * Changes since v2
>>>> - Merged the two patches touching V4L2 core stuff to a single patch.
>>>> - Updated documentation for V4L2_CAP_IO_MC
>>>> - Added is_io_mc bool in determine_valid_ioctls()
>>>> - Folded or moved code closer to where it's used
>>>> - Remove unneeded memset()
>>>> - Use strscpy() instead of strlcpy()
>>>> ---
>>>>  .../media/uapi/v4l/vidioc-querycap.rst        |  6 ++
>>>>  .../media/videodev2.h.rst.exceptions          |  1 +
>>>>  drivers/media/v4l2-core/v4l2-dev.c            | 25 ++++++--
>>>>  drivers/media/v4l2-core/v4l2-ioctl.c          | 57 +++++++++++++++++--
>>>>  include/uapi/linux/videodev2.h                |  2 +
>>>>  5 files changed, 81 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/Documentation/media/uapi/v4l/vidioc-querycap.rst b/Documentation/media/uapi/v4l/vidioc-querycap.rst
>>>> index 5f9930195d624c73..497a6aa2cbebad71 100644
>>>> --- a/Documentation/media/uapi/v4l/vidioc-querycap.rst
>>>> +++ b/Documentation/media/uapi/v4l/vidioc-querycap.rst
>>>> @@ -264,6 +264,12 @@ specification the ioctl returns an ``EINVAL`` error code.
>>>>      * - ``V4L2_CAP_TOUCH``
>>>>        - 0x10000000
>>>>        - This is a touch device.
>>>> +    * - ``V4L2_CAP_IO_MC``
>>>> +      - 0x20000000
>>>> +      - There is only one input and/or output seen from userspace. The whole
>>>> +        video topology configuration, including which I/O entity is routed to
>>>> +        the input/output, is configured by userspace via the Media Controller.
>>>> +        See :ref:`media_controller`.
>>>>      * - ``V4L2_CAP_DEVICE_CAPS``
>>>>        - 0x80000000
>>>>        - The driver fills the ``device_caps`` field. This capability can
>>>> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
>>>> index cb6ccf91776e6b56..a625fb90e3a989a7 100644
>>>> --- a/Documentation/media/videodev2.h.rst.exceptions
>>>> +++ b/Documentation/media/videodev2.h.rst.exceptions
>>>> @@ -176,6 +176,7 @@ replace define V4L2_CAP_STREAMING device-capabilities
>>>>  replace define V4L2_CAP_META_OUTPUT device-capabilities
>>>>  replace define V4L2_CAP_DEVICE_CAPS device-capabilities
>>>>  replace define V4L2_CAP_TOUCH device-capabilities
>>>> +replace define V4L2_CAP_IO_MC device-capabilities
>>>>  
>>>>  # V4L2 pix flags
>>>>  replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
>>>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>>>> index 97b6a3af13614639..a593ea0598b551b4 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>>>> @@ -552,6 +552,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>>>  		       (vdev->device_caps & meta_caps);
>>>>  	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
>>>>  	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
>>>> +	bool is_io_mc = vdev->device_caps & V4L2_CAP_IO_MC;
>>>>  
>>>>  	bitmap_zero(valid_ioctls, BASE_VIDIOC_PRIVATE);
>>>>  
>>>> @@ -725,9 +726,15 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>>>  		SET_VALID_IOCTL(ops, VIDIOC_G_STD, vidioc_g_std);
>>>>  		if (is_rx) {
>>>>  			SET_VALID_IOCTL(ops, VIDIOC_QUERYSTD, vidioc_querystd);
>>>> -			SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
>>>> -			SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
>>>> -			SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
>>>> +			if (is_io_mc) {
>>>> +				set_bit(_IOC_NR(VIDIOC_ENUMINPUT), valid_ioctls);
>>>> +				set_bit(_IOC_NR(VIDIOC_G_INPUT), valid_ioctls);
>>>> +				set_bit(_IOC_NR(VIDIOC_S_INPUT), valid_ioctls);
>>>> +			} else {
>>>> +				SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
>>>> +				SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
>>>> +				SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
>>>> +			}
>>>>  			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDIO, vidioc_enumaudio);
>>>>  			SET_VALID_IOCTL(ops, VIDIOC_G_AUDIO, vidioc_g_audio);
>>>>  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDIO, vidioc_s_audio);
>>>> @@ -735,9 +742,15 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>>>  			SET_VALID_IOCTL(ops, VIDIOC_S_EDID, vidioc_s_edid);
>>>>  		}
>>>>  		if (is_tx) {
>>>> -			SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
>>>> -			SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
>>>> -			SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
>>>> +			if (is_io_mc) {
>>>> +				set_bit(_IOC_NR(VIDIOC_ENUMOUTPUT), valid_ioctls);
>>>> +				set_bit(_IOC_NR(VIDIOC_G_OUTPUT), valid_ioctls);
>>>> +				set_bit(_IOC_NR(VIDIOC_S_OUTPUT), valid_ioctls);
>>>> +			} else {
>>>> +				SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
>>>> +				SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
>>>> +				SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
>>>> +			}
>>>>  			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDOUT, vidioc_enumaudout);
>>>>  			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
>>>>  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> index fbcc7a20eedf553a..58e9e728f0a7aa4b 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> @@ -1085,6 +1085,32 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
>>>>  	return ret;
>>>>  }
>>>>  
>>>> +static int v4l_g_input(const struct v4l2_ioctl_ops *ops,
>>>> +		       struct file *file, void *fh, void *arg)
>>>> +{
>>>> +	struct video_device *vfd = video_devdata(file);
>>>> +
>>>> +	if (vfd->device_caps & V4L2_CAP_IO_MC) {
>>>> +		*(unsigned int *)arg = 0;
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	return ops->vidioc_g_input(file, fh, arg);
>>>> +}
>>>> +
>>>> +static int v4l_g_output(const struct v4l2_ioctl_ops *ops,
>>>> +		       struct file *file, void *fh, void *arg)
>>>> +{
>>>> +	struct video_device *vfd = video_devdata(file);
>>>> +
>>>> +	if (vfd->device_caps & V4L2_CAP_IO_MC) {
>>>> +		*(unsigned int *)arg = 0;
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	return ops->vidioc_g_output(file, fh, arg);
>>>> +}
>>>> +
>>>>  static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
>>>>  				struct file *file, void *fh, void *arg)
>>>>  {
>>>> @@ -1094,12 +1120,21 @@ static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
>>>>  	ret = v4l_enable_media_source(vfd);
>>>>  	if (ret)
>>>>  		return ret;
>>>> +
>>>> +	if (vfd->device_caps & V4L2_CAP_IO_MC)
>>>> +		return  *(unsigned int *)arg ? -EINVAL : 0;
>>>> +
>>>>  	return ops->vidioc_s_input(file, fh, *(unsigned int *)arg);
>>>>  }
>>>>  
>>>>  static int v4l_s_output(const struct v4l2_ioctl_ops *ops,
>>>>  				struct file *file, void *fh, void *arg)
>>>>  {
>>>> +	struct video_device *vfd = video_devdata(file);
>>>> +
>>>> +	if (vfd->device_caps & V4L2_CAP_IO_MC)
>>>> +		return  *(unsigned int *)arg ? -EINVAL : 0;
>>>
>>> The type is int, not unsigned int. The same on the rest above.
>>>
>>>> +
>>>>  	return ops->vidioc_s_output(file, fh, *(unsigned int *)arg);
>>>>  }
>>>>  
>>>> @@ -1143,6 +1178,14 @@ static int v4l_enuminput(const struct v4l2_ioctl_ops *ops,
>>>>  	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
>>>>  		p->capabilities |= V4L2_IN_CAP_STD;
>>>>  
>>>> +	if (vfd->device_caps & V4L2_CAP_IO_MC) {
>>>> +		if (p->index)
>>>> +			return -EINVAL;
>>>> +		strscpy(p->name, vfd->name, sizeof(p->name));
>>>> +		p->type = V4L2_INPUT_TYPE_CAMERA;
>>>> +		return 0;
>>>> +	}
>>>> +
>>>>  	return ops->vidioc_enum_input(file, fh, p);
>>>>  }
>>>>  
>>>> @@ -1161,6 +1204,14 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
>>>>  	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
>>>>  		p->capabilities |= V4L2_OUT_CAP_STD;
>>>>  
>>>> +	if (vfd->device_caps & V4L2_CAP_IO_MC) {
>>>> +		if (p->index)
>>>> +			return -EINVAL;
>>>> +		strscpy(p->name, vfd->name, sizeof(p->name));
>>>> +		p->type = V4L2_OUTPUT_TYPE_ANALOG;
>>>
>>> How about adding a new INPUT and OUTPUT types just for IO_MC device cap?
>>
>> V4L2_OUTPUT_TYPE_ANALOG is an old term that is in practice used for anything video,
>> except for TV modulators. I'm all in favor of changing this to:
>>
>> #define V4L2_OUTPUT_TYPE_VIDEO 2
>> #ifndef __KERNEL__
>> #define V4L2_OUTPUT_TYPE_ANALOG V4L2_OUTPUT_TYPE_VIDEO
>> #endif
>>
>> in videodev2.h, if others agree with that. But that can be done in a separate
>> follow-up patch since this needs to be adapted throughout the kernel & documentation.
>>
>> The same is true for V4L2_INPUT_TYPE_CAMERA: in practice it's used for any video,
>> except TV tuners.
> 
> My point was rather that here, we don't know what kind of device really is
> the source (or the sink) of the data path. Having a designated input and
> output type for that would be entirely appropriate.

But that's exactly what V4L2_OUTPUT_TYPE_ANALOG/V4L2_INPUT_TYPE_CAMERA means:
it's some kind of video, but we don't know what.

That's why these names are so misleading: they suggest a particular type,
but in reality they don't.

So V4L2_IN/OUTPUT_TYPE_VIDEO is what you want for MC inputs/outputs, but that's
just an alias for V4L2_INPUT_TYPE_CAMERA/V4L2_OUTPUT_TYPE_ANALOG.

Regards,

	Hans

> 
> Although if the user gets a misleading value using an interface that
> (s)he's not supposed to use to begin with, I guess I'd fine with that as
> well.
> 

