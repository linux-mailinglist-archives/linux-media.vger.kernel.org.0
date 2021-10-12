Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6AE6429EB1
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 09:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbhJLHgF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 03:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbhJLHgE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 03:36:04 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF6BC061570;
        Tue, 12 Oct 2021 00:34:02 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id aCIOm68q3k3b0aCIRmPMmY; Tue, 12 Oct 2021 09:34:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634024040; bh=K9friEJkZ5Q7D+co6uEjCR7+fPf9hr4m70FOs99cVU0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Hqda4GXFn6MjbMOOzxblg64uGR4rJCdzfdWtRCVokNxrkQXrIdOL8x/dT46tM+0ZM
         z3c//dnRlxs5vY72wIVME3ypNeA66PKUmsNIu97+EBo64BHIcxycunTsEL530L4ocl
         OK1SG0+AvgBAHqDOGPeAuvu7q4tj6CbCH2nR+UKCAN6tZPYSxCndgCXlVJ+HTONEee
         B3f63XiaJmC0rNZ4YVwIJkDrxoKSjx7D9eDWFMUXxg/JElVRkWk9YEv36i5z9sYIOS
         Q3FOJfBaxj645kJInYwwzP075th8CJY5cfWyneoJfFMdxEqY1r4ijKYe6JBnM8deIy
         EUxdLfqyQOpsw==
Subject: Re: [PATCH v2] media: rcar-vin: add G/S_PARM ioctls
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
References: <YU2gSJKfsqP+gUci@oden.dyn.berto.se>
 <20210924135138.29950-1-nikita.yoush@cogentembedded.com>
 <20210928084323.5vuhvkp6ev2emv2z@uno.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <46a129ad-c57e-3230-3a8c-5724be34479b@xs4all.nl>
Date:   Tue, 12 Oct 2021 09:33:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210928084323.5vuhvkp6ev2emv2z@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIXZ77Buivuccp/MoYzJt9vqCVjSij+tqIIReMqGXF5ihHswaVjy3vmEdCkEr5gYUYlvu+rAuUWxUpRyKKyWHJSEgT6PfNbHhxItY5+OV59QEC7YKKBw
 W+bZB3Wg3VdyklZ+iZOHIN6kSwegMowyKPOYmFIiR8f4HP2JiTE2eU602fziBqHaHnuKB1dFR8ZanIRtZrm8w4xNQ1B0hj9t1gPZwiI/ktOnC1HRcrP3zikj
 14R+7Q7EdxC5kJajgsNhRP8QnR+BibI4gZscp12J2o5aCKehsJ43jNyWLwm+V5MM4CNMTHj4mmymCSMmoxihjm6Z9YhNCErX0S7Y4JMnJLm85ZBChoMe8/JY
 BPan99Ga5vWapHKGDnHTWBJJhFB+yNS4JnEhrSIRIefiAlh5b8ix3EvP77MOewgO46KfLVVKdEvMzoLX/7vW3WAkiPxfK1mSm1LARet3rnBdt4JfTAKLKWYq
 Ht9MOH9DXRENOD3P
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 28/09/2021 10:43, Jacopo Mondi wrote:
> Hello
>   explicit Cc Hans, as I recall the usage of s/g_parm was deprecated
> and discouraged in mainline.

It's perfectly fine to use it, but for the non-MC case only. Which is what
this patch does, so I'm accepting it.

s/g_parm isn't deprecated for non-MC drivers, it's ugly but it's the only
way to set or report the framerate for such drivers.

Regards,

	Hans

> 
> Hans: Support for g/s_param is required by Nikita to maintain
> compatibility with (out of tree?) subdevice drivers. Should we add it
> to the mainline receiver driver ?
> 
> What other API should be used to control the subdevice framerate ?
> Should it go through VIDIOC_SUBDEV_S_FRAME_INTERVAL instead ?
> 
> Thanks
>    j
> 
> On Fri, Sep 24, 2021 at 04:51:38PM +0300, Nikita Yushchenko wrote:
>> From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>
>> This adds g/s_parm ioctls for parallel interface.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
>> ---
>> Changes from v1:
>> - use &vin->vdev to access vin's struct video_device
>>
>>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> index bdeff51bf768..a5bfa76fdac6 100644
>> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> @@ -527,6 +527,24 @@ static int rvin_s_selection(struct file *file, void *fh,
>>  	return 0;
>>  }
>>
>> +static int rvin_g_parm(struct file *file, void *priv,
>> +		       struct v4l2_streamparm *parm)
>> +{
>> +	struct rvin_dev *vin = video_drvdata(file);
>> +	struct v4l2_subdev *sd = vin_to_source(vin);
>> +
>> +	return v4l2_g_parm_cap(&vin->vdev, sd, parm);
>> +}
>> +
>> +static int rvin_s_parm(struct file *file, void *priv,
>> +		       struct v4l2_streamparm *parm)
>> +{
>> +	struct rvin_dev *vin = video_drvdata(file);
>> +	struct v4l2_subdev *sd = vin_to_source(vin);
>> +
>> +	return v4l2_s_parm_cap(&vin->vdev, sd, parm);
>> +}
>> +
>>  static int rvin_g_pixelaspect(struct file *file, void *priv,
>>  			      int type, struct v4l2_fract *f)
>>  {
>> @@ -743,6 +761,9 @@ static const struct v4l2_ioctl_ops rvin_ioctl_ops = {
>>  	.vidioc_g_selection		= rvin_g_selection,
>>  	.vidioc_s_selection		= rvin_s_selection,
>>
>> +	.vidioc_g_parm			= rvin_g_parm,
>> +	.vidioc_s_parm			= rvin_s_parm,
>> +
>>  	.vidioc_g_pixelaspect		= rvin_g_pixelaspect,
>>
>>  	.vidioc_enum_input		= rvin_enum_input,
>> --
>> 2.30.2
>>

