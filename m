Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 496D17AAF49
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 12:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjIVKQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 06:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjIVKQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 06:16:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1942694
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 03:16:27 -0700 (PDT)
Received: from [192.168.93.247] (mobile-access-b04863-19.dhcp.inet.fi [176.72.99.19])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACD02BC4;
        Fri, 22 Sep 2023 12:14:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695377687;
        bh=JjnOlUyrVRfI84f1KUdkXa4+3BftRr3MqKiNMoPGYvc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=XfhuPpfrd0bNoO0cmZFuOyhMacJPzMnHuA/jBjMvsBR9U0BP91UJUerxY47JG1zUG
         G0Ix9tUg2HA0Se7tifld7U8QYtooaQPf6u1WtyLmNSCcPP/mLpvmKQU6cfGzPAfJI7
         CutBjGd3aI4jg1I/SnPBbSy5KVUtotVnKVYZSstc=
Message-ID: <09af9c43-f9b8-d426-f7ce-959a6dea87d2@ideasonboard.com>
Date:   Fri, 22 Sep 2023 13:16:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 11/12] media: v4l: subdev: Print debug information on
 frame descriptor
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
References: <20230919121728.126781-1-sakari.ailus@linux.intel.com>
 <20230919121728.126781-12-sakari.ailus@linux.intel.com>
 <20230919133248.GD1505@pendragon.ideasonboard.com>
 <ZQm0+U6n+rE2fjcD@kekkonen.localdomain>
 <20230919152123.GA18426@pendragon.ideasonboard.com>
 <ZQ1hLRtz4ai+miPS@kekkonen.localdomain>
 <20230922095320.GE19112@pendragon.ideasonboard.com>
 <ZQ1n8ZycYUNJnLSc@kekkonen.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZQ1n8ZycYUNJnLSc@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/09/2023 13:09, Sakari Ailus wrote:
> On Fri, Sep 22, 2023 at 12:53:20PM +0300, Laurent Pinchart wrote:
>> On Fri, Sep 22, 2023 at 09:41:01AM +0000, Sakari Ailus wrote:
>>> On Tue, Sep 19, 2023 at 06:21:23PM +0300, Laurent Pinchart wrote:
>>>> On Tue, Sep 19, 2023 at 02:49:29PM +0000, Sakari Ailus wrote:
>>>>> On Tue, Sep 19, 2023 at 04:32:48PM +0300, Laurent Pinchart wrote:
>>>>>> On Tue, Sep 19, 2023 at 03:17:27PM +0300, Sakari Ailus wrote:
>>>>>>> Print debug level information on returned frame descriptors.
>>>>>>>
>>>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>>>> ---
>>>>>>>   drivers/media/v4l2-core/v4l2-subdev.c | 32 ++++++++++++++++++++++++++-
>>>>>>>   1 file changed, 31 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>>>>>> index 7b087be3ff4f..504ca625b2bd 100644
>>>>>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>>>>>> @@ -15,6 +15,7 @@
>>>>>>>   #include <linux/module.h>
>>>>>>>   #include <linux/overflow.h>
>>>>>>>   #include <linux/slab.h>
>>>>>>> +#include <linux/string.h>
>>>>>>>   #include <linux/types.h>
>>>>>>>   #include <linux/version.h>
>>>>>>>   #include <linux/videodev2.h>
>>>>>>> @@ -309,9 +310,38 @@ static int call_set_selection(struct v4l2_subdev *sd,
>>>>>>>   static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>>>>>>>   			       struct v4l2_mbus_frame_desc *fd)
>>>>>>>   {
>>>>>>> +	unsigned int i;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>>   	memset(fd, 0, sizeof(*fd));
>>>>>>>   
>>>>>>> -	return sd->ops->pad->get_frame_desc(sd, pad, fd);
>>>>>>> +	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
>>>>>>> +	if (ret)
>>>>>>> +		return ret;
>>>>>>> +
>>>>>>> +	dev_dbg(sd->dev, "Frame descriptor on pad %u, type %s\n", pad,
>>>>>>> +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
>>>>>>> +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
>>>>>>> +		"unknown");
>>>>>>> +
>>>>>>> +	for (i = 0; i < fd->num_entries; i++) {
>>>>>>> +		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
>>>>>>> +		char buf[20] = "";
>>>>>>
>>>>>> Should this be sized for the worst case ? The vc and dt should not be
>>>>>> large, but a buffer overflow on the stack in debug code if a subdev
>>>>>> returns an incorrect value would be bad.
>>>>>
>>>>> 17 should be enough but it's not useful to use a size not divisible by 4 in
>>>>> practice here.
>>>>
>>>> 18 with the terminating 0. But indeed, it's large enough as vc and dt
>>>
>>> I can count only 17 --- there's no newline.
>>>
>>> I guess it's most probably either of these then. X-)
>>>
>>>> are u8. I'm just a bit worried we're opening the door to hard to debug
>>>> problems if we later change the vc and dt types.
>>>
>>> I can add a WARN_ON() to cover this.
>>>
>>>>>>> +
>>>>>>> +		if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
>>>>>>> +			snprintf(buf, sizeof(buf), ", vc %u, dt 0x%2.2x",
>>>>>>
>>>>>> 0x%02x would be one character shorter ;-) Same below.
>>>>>
>>>>> It would be, but I prefer the above notation as it's more generic.
>>>>
>>>> Out of curiosity, how so ?
>>>
>>> It works with data that would span more than 9 characters when printed.
>>
>> And 0x%02x doesn't ?
> 
> Ah, it should indeed work, 0 is actually a flag here and part of the field
> width or precision. I can use that in v4.

Or %#04x, even shorter!

  Tomi

