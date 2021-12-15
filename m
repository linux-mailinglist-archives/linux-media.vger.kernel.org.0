Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC1047541F
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 09:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240731AbhLOINd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 03:13:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235661AbhLOINc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 03:13:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95BCC061574
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 00:13:32 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60704292;
        Wed, 15 Dec 2021 09:13:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639556010;
        bh=W6/z8l5hwgC0nO4sFZ+2y/FDLQ89+LfiVsw0kmIqh7M=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=eivfwnPaImHhAr0Tz/V/uL0yRLRa+qouxooLeyqMbTKzW6oxhex/DqBy0d0LWuXUm
         cgbW0c3BOMcmfmmw7AYj3QG2e2oFxyQqTpPN8ANnZBgK1GgsbpdjTzR2SXm6GxPEwi
         nZrmTB7j81ePFEZPL+i7FsimNXFgLAbS+9EeTFf4=
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-4-tomi.valkeinen@ideasonboard.com>
 <20211214071317.mfgbokmab3uvbfoq@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 03/38] media: subdev: pass also the active state to
 subdevs from ioctls
Message-ID: <7c3964d5-20d6-babb-2460-3674ab9a6a24@ideasonboard.com>
Date:   Wed, 15 Dec 2021 10:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211214071317.mfgbokmab3uvbfoq@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 14/12/2021 09:13, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Tue, Nov 30, 2021 at 04:15:01PM +0200, Tomi Valkeinen wrote:
>> At the moment when a subdev op is called, the TRY subdev state
>> (subdev_fh->state) is passed as a parameter even for the ACTIVE case, or
>> alternatively a NULL can be passed for ACTIVE case. This used to make
>> sense, as the ACTIVE state was handled internally by the subdev drivers.
>>
>> We now have a state for the ACTIVE case in a standard place, and can
>> pass that also to the drivers. This patch changes the subdev ioctls to
>> either pass the TRY or ACTIVE state to the subdev.
>>
>> Unfortunately many drivers call ops from other subdevs, and implicitly
>> pass NULL as the state, so this is just a partial solution. A coccinelle
>> spatch could perhaps be created which fixes the drivers' subdev calls.
>>
>> For all current upstream drivers this doesn't matter, as they do not
>> expect to get a valid state for ACTIVE case. But future drivers which
>> support multiplexed streaming and routing will depend on getting a state
>> for both active and try cases.
>>
>> For new drivers we can mandate that the pipelines where the drivers are
>> used need to pass the state properly, or preferably, not call such
>> subdev ops at all.
>>
>> However, if an existing subdev driver is changed to support multiplexed
>> streams, the driver has to consider cases where its ops will be called
>> with NULL state. The problem can easily be solved by using the
>> v4l2_subdev_validate_and_lock_state() helper, introduced in a follow up
> 
> Now called v4l2_subdev_lock_and_return_state() and introduced in a
> previous patch.

Ah, right.

> I would still push for state-aware subdev drivers to BUG() on !state
> and tell them to fix the caller. Is this too harsh ?

I think so. We can't break currently working drivers.

>> patch.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 73 +++++++++++++++++++++++----
>>   1 file changed, 63 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index de160140d63b..3289875d9ec1 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -353,6 +353,53 @@ const struct v4l2_subdev_ops v4l2_subdev_call_wrappers = {
>>   EXPORT_SYMBOL(v4l2_subdev_call_wrappers);
>>
>>   #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>> +
>> +static struct v4l2_subdev_state *
>> +subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>> +		       unsigned int cmd, void *arg)
>> +{
>> +	u32 which;
>> +
>> +	switch (cmd) {
>> +	default:
>> +		return NULL;
>> +
>> +	case VIDIOC_SUBDEV_G_FMT:
>> +	case VIDIOC_SUBDEV_S_FMT: {
>> +		which = ((struct v4l2_subdev_format *)arg)->which;
>> +		break;
>> +	}
>> +	case VIDIOC_SUBDEV_G_CROP:
>> +	case VIDIOC_SUBDEV_S_CROP: {
>> +		which = ((struct v4l2_subdev_crop *)arg)->which;
>> +		break;
>> +	}
>> +	case VIDIOC_SUBDEV_ENUM_MBUS_CODE: {
>> +		which = ((struct v4l2_subdev_mbus_code_enum *)arg)->which;
>> +		break;
>> +	}
>> +	case VIDIOC_SUBDEV_ENUM_FRAME_SIZE: {
>> +		which = ((struct v4l2_subdev_frame_size_enum *)arg)->which;
>> +		break;
>> +	}
> 
> No need for braces if I'm not mistaken, and also some blocks are
> followed by an empty line some or not.

Ok.

>> +
>> +	case VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: {
>> +		which = ((struct v4l2_subdev_frame_interval_enum *)arg)->which;
>> +		break;
>> +	}
>> +
>> +	case VIDIOC_SUBDEV_G_SELECTION:
>> +	case VIDIOC_SUBDEV_S_SELECTION: {
>> +		which = ((struct v4l2_subdev_selection *)arg)->which;
>> +		break;
>> +	}
>> +	}
>> +
>> +	return which == V4L2_SUBDEV_FORMAT_TRY ?
>> +			     subdev_fh->state :
>> +			     v4l2_subdev_get_active_state(sd);
>> +}
>> +
>>   static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   {
>>   	struct video_device *vdev = video_devdata(file);
>> @@ -360,8 +407,11 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>   	struct v4l2_fh *vfh = file->private_data;
>>   	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
>>   	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
>> +	struct v4l2_subdev_state *state;
>>   	int rval;
>>
>> +	state = subdev_ioctl_get_state(sd, subdev_fh, cmd, arg);
>> +
> 
> There's a possibility NULL is returned if a new subdev_fh is added and
> the above not updated. Should we BUG_ON() ?

NULL is fine, as not all ioctls need a state.

  Tomi
