Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27AE15A6183
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 13:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbiH3LUa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 07:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiH3LU2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 07:20:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60EEA26AC3
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 04:20:26 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F0C3481;
        Tue, 30 Aug 2022 13:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661858424;
        bh=Ak19hrgT92o/kZ9dMTGyyrCEGAa/+gxPLEbsijDaky4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fUzIozCfPQkZ43fDANhaZZsJIAavwnVT/dXXinRHBTEYn17QtbxTCUG1xekdGVTiX
         CbOStZw/LxErj+zwc8IREG8n8Td/95c/nkx7T9P1UmHMq01vl2bO3MQHYJdi9CLX5v
         neIe4jwBZUmKLrapjbjnHwmAz2UfZliustJXMyuc=
Message-ID: <e3035208-f26c-3c78-7c78-12c9aa76ff97@ideasonboard.com>
Date:   Tue, 30 Aug 2022 14:20:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v13 13/34] media: drivers: use
 video_device_pipeline_alloc_start()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
 <20220810121122.3149086-14-tomi.valkeinen@ideasonboard.com>
 <YwzwpQXgDb0ulwbE@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YwzwpQXgDb0ulwbE@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/08/2022 20:00, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Wed, Aug 10, 2022 at 03:11:01PM +0300, Tomi Valkeinen wrote:
>> Use video_device_pipeline_alloc_start() instead of manually
>> allocating/managing the media pipeline storage.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 14 +-------------
>>   drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c |  2 +-
>>   .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |  2 +-
>>   drivers/media/platform/ti/cal/cal-video.c          |  2 +-
>>   drivers/media/platform/ti/cal/cal.h                |  1 -
>>   5 files changed, 4 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
>> index 548067f19576..884875600231 100644
>> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
>> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
>> @@ -1244,8 +1244,6 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>>   
>>   static int rvin_set_stream(struct rvin_dev *vin, int on)
>>   {
>> -	struct media_pipeline *pipe;
>> -	struct media_device *mdev;
>>   	struct v4l2_subdev *sd;
>>   	struct media_pad *pad;
>>   	int ret;
>> @@ -1273,17 +1271,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
>>   	if (ret)
>>   		return ret;
>>   
>> -	/*
>> -	 * The graph lock needs to be taken to protect concurrent
>> -	 * starts of multiple VIN instances as they might share
>> -	 * a common subdevice down the line and then should use
>> -	 * the same pipe.
>> -	 */
>> -	mdev = vin->vdev.entity.graph_obj.mdev;
>> -	mutex_lock(&mdev->graph_mutex);
>> -	pipe = media_entity_pipeline(&sd->entity) ? : &vin->vdev.pipe;
>> -	ret = __video_device_pipeline_start(&vin->vdev, pipe);
>> -	mutex_unlock(&mdev->graph_mutex);
>> +	ret = video_device_pipeline_alloc_start(&vin->vdev);
> 
> This doesn't look right, it will use different pipeline instances for
> difference video devices, that's a change in behaviour.

I hope not, but it's a bit difficult to be sure without having the board 
and testing.

Afaics, the previous code uses the existing pipeline if such exists in 
the first subdev (i.e. if media_pipeline_start has been called earlier 
for another vdev), or if not, uses pipeline specific to the vdev.

This behavior should match the new one, although the operation 
underneath is slightly different.

It's perhaps the name, video_device_pipeline_alloc_start, that confuses. 
It doesn't indicate that it possibly uses an existing pipeline. But I 
don't have any good idea for a better name. 
video_device_pipeline_find_or_alloc_start? =) Well, it's not really 
"finding" anything either...

>>   	if (ret)
>>   		return ret;
>>   
>> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
>> index 17ad9a3caaa5..a3e826a755fc 100644
>> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
>> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
>> @@ -266,7 +266,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   		goto err_clear_dma_queue;
>>   	}
>>   
>> -	ret = video_device_pipeline_start(&csi->vdev, &csi->vdev.pipe);
> 
> What ? There is a pipe embedded in video_device ? Oh my, I didn't
> realize how messed up the V4L2 core had become :-(

That's what the current Renesas driver earlier in this patch also uses. 
Didn't you write that code? =)

  Tomi
