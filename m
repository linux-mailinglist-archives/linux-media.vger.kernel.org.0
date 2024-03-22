Return-Path: <linux-media+bounces-7584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE64886861
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 09:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10EE52823EC
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 08:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDF518EB4;
	Fri, 22 Mar 2024 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="NkNf6a+d"
X-Original-To: linux-media@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587C318659;
	Fri, 22 Mar 2024 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711096816; cv=none; b=djGonb9ueOnvp40DzvEygAv+nq5v547oYtCejQyofLDalO4BSzZC4X+Pb5AY/zIyBQUifyuDJT50J338WxAnUnrczMOOYSbphDExt9A4rVrHApP7TX3EvE8ivQemj7Yb8N96RdAF9mXfdsSTrSDiLC1sMMglDAVvaQNZA/8KT+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711096816; c=relaxed/simple;
	bh=t0GLP4gyaj/RnH19VefCc9hBEy21b/UCAISElKGrxPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=plp5VKJtxt8Q8RUVYDXFRaZixkVlvdTC3wVZJmSIF1RUUpBjUB6dDBNVSpgD19Uup3Co2qIVLOvPWDXG/hNivxjEee/32/eDSFDqWOFn7HXuaB6Ak+Eysy7+5RwT0ReWIWML/4nxEeI3rrCBIXR/Ed1Bp01HwKfhMnzkVfxJVek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=NkNf6a+d; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32DFBC000C;
	Fri, 22 Mar 2024 08:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1711096811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZf9sGfjTmcBbqDfAL7l06KBD0MkuDchuqmx9O+k/9A=;
	b=NkNf6a+dThtEi9wJKUeAG1XmxsvQ54Dz9yfef6u1ImwYz67W63gIOO54tGJbeQrYbGscTS
	Mu9kO/i5YoAjT64sCANM9alB4ECorW97vzvssj3zVsjr5Coxy+1oKGyanfGIBYMs0Heffp
	dnAU3pUBV4CbqoLNIE8cG53dNzSo0Bo2XxBPM+qK4b2UdmUbsCrqccih8jDckCXJODN+5A
	s3z9aBiDocesE84xYDFU+FLG1KpcwinkGoCyPT7TX8cSzuT8Q2A4pJWRnNllvOW42++hax
	4wj+Lv5HXjLRhrSLy//zCeYYn8U3HxFUlp/aLXtIL1bzSXI0rcUZ7Ok1EJxv2A==
Message-ID: <27fc0d71-aa66-4b6e-a3c3-76e704784fbc@yoseli.org>
Date: Fri, 22 Mar 2024 09:40:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/15] media: bcm2835-unicam: Add support for CCP2/CSI2
 camera interface
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Naushir Patuck <naush@raspberrypi.com>
Cc: linux-media@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, kernel-list@raspberrypi.com,
 linux-rpi-kernel@lists.infradead.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-10-laurent.pinchart@ideasonboard.com>
 <CAEmqJPqdfaND6vFoZgNALfzPf9-VM1XU0AyLs3V6OJe3WkDEng@mail.gmail.com>
 <20240321195749.GZ9582@pendragon.ideasonboard.com>
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20240321195749.GZ9582@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Laurent, Naush,

On 21/03/2024 20:57, Laurent Pinchart wrote:
> Hi Naush,
> 
> On Wed, Mar 20, 2024 at 12:30:36PM +0000, Naushir Patuck wrote:
>> On Fri, 1 Mar 2024 at 21:32, Laurent Pinchart wrote:
>>>
>>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>
>>> Add a driver for the Unicam camera receiver block on BCM283x processors.
>>> It is represented as two video device nodes: unicam-image and
>>> unicam-embedded which are connected to an internal subdev (named
>>> unicam-subdev) in order to manage streams routing.
>>>
>>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>> Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
>>> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
>>> Co-developed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
>>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
>>> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
> 
> [snip]
> 
>>> ---
>>>   MAINTAINERS                                   |    1 +
>>>   drivers/media/platform/Kconfig                |    1 +
>>>   drivers/media/platform/Makefile               |    1 +
>>>   drivers/media/platform/broadcom/Kconfig       |   23 +
>>>   drivers/media/platform/broadcom/Makefile      |    3 +
>>>   .../platform/broadcom/bcm2835-unicam-regs.h   |  255 ++
>>>   .../media/platform/broadcom/bcm2835-unicam.c  | 2607 +++++++++++++++++
>>>   7 files changed, 2891 insertions(+)
>>>   create mode 100644 drivers/media/platform/broadcom/Kconfig
>>>   create mode 100644 drivers/media/platform/broadcom/Makefile
>>>   create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
>>>   create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
> 
> [snip]
> 
>>> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
>>> new file mode 100644
>>> index 000000000000..716c89b8a217
>>> --- /dev/null
>>> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
>>> @@ -0,0 +1,2607 @@
> 
> [snip]
> 
>>> +static int unicam_start_streaming(struct vb2_queue *vq, unsigned int count)
>>> +{
>>> +       struct unicam_node *node = vb2_get_drv_priv(vq);
>>> +       struct unicam_device *unicam = node->dev;
>>> +       struct v4l2_subdev_state *state;
>>> +       struct unicam_buffer *buf;
>>> +       unsigned long flags;
>>> +       int ret;
>>> +       u32 pad, stream;
>>> +       u32 remote_pad = is_image_node(node) ? UNICAM_SD_PAD_SOURCE_IMAGE
>>> +                                            : UNICAM_SD_PAD_SOURCE_METADATA;
>>> +
>>> +       /* Look for the route for the given pad and stream. */
>>> +       state = v4l2_subdev_lock_and_get_active_state(&unicam->subdev.sd);
>>> +       ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
>>> +                                                   remote_pad, 0,
>>> +                                                   &pad, &stream);
>>> +       v4l2_subdev_unlock_state(state);
>>> +
>>> +       if (ret)
>>> +               goto err_return_buffers;
>>> +
>>> +       dev_dbg(unicam->dev, "Starting stream on %s: %u/%u -> %u/%u (%s)\n",
>>> +               unicam->subdev.sd.name, pad, stream, remote_pad, 0,
>>> +               is_metadata_node(node) ? "metadata" : "image");
>>> +
>>> +       /* The metadata node can't be started alone. */
>>> +       if (is_metadata_node(node)) {
>>> +               if (!unicam->node[UNICAM_IMAGE_NODE].streaming) {
>>> +                       dev_err(unicam->dev,
>>> +                               "Can't start metadata without image\n");
>>> +                       ret = -EINVAL;
>>> +                       goto err_return_buffers;
>>> +               }
>>
>> There's a slight change of behaviour in this function when compared to
>> the downstream/BSP non-streams enabled driver.
>>
>> In the BSP driver, if the embedded data node has been enabled, we wait
>> for both image and embedded data nodes to have start_streaming()
>> called before starting the sensor (see
>> https://github.com/raspberrypi/linux/blob/c04af98514c26014a4f29ec87b3ece95626059bd/drivers/media/platform/bcm2835/bcm2835-unicam.c#L2559).
>> This is also the same for the Pi 5 CFE driver.
>>
>> With the logic in this function, we only wait for start_streaming() on
>> the image node then start the sensor streaming immediately.  When
>> start_streaming() for the embedded data node is subsequently called,
>> we end up with the first N buffers missing and/or invalid as the HW
>> channel is enabled while the sensor is streaming.  I noticed this when
>> using libcamera where we start image then embedded node.  If I flip
>> things around (start embedded first then image), everything works as
>> expected.
>>
>> Could we add back the test to ensure all nodes are streaming before
>> starting the sensor?
> 
> Yes, I don't think the current implementation is good. I'm not sure why
> the logic got changed, but I'll address it in the next version.
> 

I think I did it in v4. The aim of this change was to be able to start 
streaming on the image node even if the metadata node is not started. 
The opposite was not to be possible, so if the metadata node is started, 
then the image node must be started for streaming to begin. The 
downstream logic is that both nodes must always be started, but at the 
time of v4, not everything was ready for this, if I remember correctly.

JM

>>> +
>>> +               spin_lock_irqsave(&node->dma_queue_lock, flags);
>>> +               buf = list_first_entry(&node->dma_queue,
>>> +                                      struct unicam_buffer, list);
>>> +               dev_dbg(unicam->dev, "buffer %p\n", buf);
>>> +               node->cur_frm = buf;
>>> +               node->next_frm = buf;
>>> +               list_del(&buf->list);
>>> +               spin_unlock_irqrestore(&node->dma_queue_lock, flags);
>>> +
>>> +               unicam_start_metadata(unicam, buf);
>>> +               node->streaming = true;
>>> +               return 0;
>>> +       }
>>> +
>>> +       ret = pm_runtime_resume_and_get(unicam->dev);
>>> +       if (ret < 0) {
>>> +               dev_err(unicam->dev, "PM runtime resume failed: %d\n", ret);
>>> +               goto err_return_buffers;
>>> +       }
>>> +
>>> +       ret = video_device_pipeline_start(&node->video_dev, &unicam->pipe);
>>> +       if (ret < 0) {
>>> +               dev_dbg(unicam->dev, "Failed to start media pipeline: %d\n", ret);
>>> +               goto err_pm_put;
>>> +       }
>>> +
>>> +       spin_lock_irqsave(&node->dma_queue_lock, flags);
>>> +       buf = list_first_entry(&node->dma_queue,
>>> +                              struct unicam_buffer, list);
>>> +       dev_dbg(unicam->dev, "buffer %p\n", buf);
>>> +       node->cur_frm = buf;
>>> +       node->next_frm = buf;
>>> +       list_del(&buf->list);
>>> +       spin_unlock_irqrestore(&node->dma_queue_lock, flags);
>>> +
>>> +       unicam_start_rx(unicam, buf);
>>> +
>>> +       ret = v4l2_subdev_enable_streams(&unicam->subdev.sd, remote_pad, BIT(0));
>>> +       if (ret < 0) {
>>> +               dev_err(unicam->dev, "stream on failed in subdev\n");
>>> +               goto error_pipeline;
>>> +       }
>>> +
>>> +       node->streaming = true;
>>> +
>>> +       return 0;
>>> +
>>> +error_pipeline:
>>> +       video_device_pipeline_stop(&node->video_dev);
>>> +err_pm_put:
>>> +       pm_runtime_put_sync(unicam->dev);
>>> +err_return_buffers:
>>> +       unicam_return_buffers(node, VB2_BUF_STATE_QUEUED);
>>> +       return ret;
>>> +}
> 
> [snip]
> 


