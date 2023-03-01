Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD956A6A68
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 11:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjCAKFz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 05:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbjCAKFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 05:05:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E573D311E5
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 02:05:50 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91ADC890;
        Wed,  1 Mar 2023 11:05:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677665149;
        bh=HaEvVWQ49yoFVZ5+35Iitfv7mcvy98xPS+j42CdNvBc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=iQ24k3bjzBayLQ/rybmwZ8c4go/ogOHIopd71iHop+4S1udRO6arMNsM2WNYtBEkw
         tn9AaKV8EWYnV35MQZ4ZfKZ39o7/UVeowFwaL0F/rkwDtL99cqejuVUp1cbUDW4vpW
         ahdN2Llkf8XL+N3eFPXfGfanZwivaWpCrrwWAqIQ=
Message-ID: <093f89d5-9d72-9650-95cb-ac5cdd4ad211@ideasonboard.com>
Date:   Wed, 1 Mar 2023 12:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/4] media: ti: cal: Implement get_frame_desc for
 camera-rx
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
References: <20230228171620.330978-1-tomi.valkeinen@ideasonboard.com>
 <20230228171620.330978-4-tomi.valkeinen@ideasonboard.com>
 <20230301094020.wgjwdv76v7jctpcc@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230301094020.wgjwdv76v7jctpcc@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/03/2023 11:40, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Tue, Feb 28, 2023 at 07:16:19PM +0200, Tomi Valkeinen wrote:
>> CAL uses get_frame_desc to get the VC and DT for the incoming CSI-2
>> stream, but does it in a bit hacky way. Clean this up by implementing
>> .get_frame_desc to camera-rx, and calling that from cal.c.
>>
>> No functional change intended.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti/cal/cal-camerarx.c | 62 +++++++++++---------
>>   drivers/media/platform/ti/cal/cal.c          | 30 ++++------
>>   drivers/media/platform/ti/cal/cal.h          |  2 -
>>   3 files changed, 47 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
>> index 3dfcb276d367..95e0ad59a39b 100644
>> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
>> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
>> @@ -589,33 +589,6 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
>>   	return ret;
>>   }
>>
>> -int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
>> -				       struct v4l2_mbus_frame_desc *desc)
>> -{
>> -	struct media_pad *pad;
>> -	int ret;
>> -
>> -	if (!phy->source)
>> -		return -EPIPE;
>> -
>> -	pad = media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX_PAD_SINK]);
>> -	if (!pad)
>> -		return -EPIPE;
>> -
>> -	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc, pad->index,
>> -			       desc);
>> -	if (ret)
>> -		return ret;
>> -
>> -	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
>> -		dev_err(phy->cal->dev,
>> -			"Frame descriptor does not describe CSI-2 link");
>> -		return -EINVAL;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>>   /* ------------------------------------------------------------------
>>    *	V4L2 Subdev Operations
>>    * ------------------------------------------------------------------
>> @@ -772,6 +745,40 @@ static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
>>   	return cal_camerarx_sd_set_fmt(sd, state, &format);
>>   }
>>
>> +static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>> +				       struct v4l2_mbus_frame_desc *fd)
>> +{
>> +	struct cal_camerarx *phy = to_cal_camerarx(sd);
>> +	struct v4l2_mbus_frame_desc remote_desc;
>> +	const struct media_pad *remote_pad;
>> +	int ret;
>> +
>> +	remote_pad = media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX_PAD_SINK]);
>> +	if (!remote_pad)
>> +		return -EPIPE;
>> +
>> +	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc,
>> +			       remote_pad->index, &remote_desc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (remote_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
>> +		dev_err(phy->cal->dev,
>> +			"Frame descriptor does not describe CSI-2 link");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (remote_desc.num_entries > 1)
>> +		dev_dbg(phy->cal->dev,
>> +			"Multiple streams not supported in remote frame descriptor, using the first one\n");
> 
> Maybe WARN_ONCE, but doesn't really matter as I presume this will go
> away in next patch
> 
>> +
>> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> 
> Is the bus between CAL and camera-rx a CSI-2 bus ??

No, it's a custom internal bus.

> As this mostly serves to transport to CAL the DT and VC, I guess it's
> fine

Yes, we use it to transport CSI-2 data, and mainly just the DT and VC.

The SW architecture doesn't really match the HW, but I think it works 
quite fine. E.g. there's really just a single output from each of the 
PHYs, which go to the CAL block (so CAL would have two inputs), and CAL 
contains a processing pipeline, and at the end it has the DMAs and 
memory connection.

I don't know if trying to design the SW like that would help any, and 
besides, CAL is an old driver so the legacy drag is there. The current 
design is an extension to the older designs.

Here, we could of course drop the .get_frame_desc from camera-rx, and 
implement (more or less identical) function which the cal.c could call. 
In some ways that would be better, but then again, I think the 
.get_frame_desc works here quite nicely, as cal.c can ask the frame desc 
for a single output pad (i.e. the stream which the context in question 
is interested in).

> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks!

  Tomi

