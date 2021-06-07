Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043ED39DBE7
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 14:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbhFGMJg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 08:09:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56904 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhFGMJg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 08:09:36 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99CF58DB;
        Mon,  7 Jun 2021 14:07:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623067663;
        bh=84JvLPkqg/s5q/byjhjMetafgcO4m31z5IZfX3Z6nrg=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=VkcqAvDmcXmS7LMg7nn2AgO4pxwSZkcs+RYta1MW2elodfKuhiWNmHSSpYGaLf7Yw
         uv0g6+Wy/RK1Sw0vf689DFPHEsn3tms/vMmHJQVq3/VMmrDKBa9HxHD1twmi/N3FlX
         Oguj2vFEsT/fe2Z8KtgNHOatLUzo2n7eqzZDEz78=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-38-tomi.valkeinen@ideasonboard.com>
 <YLo30o5EJczdH2mq@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 37/38] media: ti-vpe: cal: use frame desc to get vc and
 dt
Message-ID: <cc71b4b5-4ed1-f655-445c-02cb89dc4fa1@ideasonboard.com>
Date:   Mon, 7 Jun 2021 15:07:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLo30o5EJczdH2mq@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/06/2021 17:25, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, May 24, 2021 at 02:09:08PM +0300, Tomi Valkeinen wrote:
>> Use get_frame_desc() to get the frame desc from the connected source,
>> and use the provided virtual channel and datatype instead of hardcoded
>> ones.
>>
>> get_frame_desc() works per stream, but as we don't support multiple
>> streams yet, we will just always use stream 0.
>>
>> If the source doesn't support get_frame_desc(), fall back to the
>> previous method of always capturing virtual channel 0 and any datatype.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal-camerarx.c | 26 +++++++++++
>>   drivers/media/platform/ti-vpe/cal.c          | 49 +++++++++++++++++++-
>>   drivers/media/platform/ti-vpe/cal.h          |  3 ++
>>   3 files changed, 76 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
>> index e3a4c20be1e6..cb6a37f47432 100644
>> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
>> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
>> @@ -583,6 +583,32 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
>>   	return ret;
>>   }
>>   
>> +int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
>> +				       struct v4l2_mbus_frame_desc *fd)
> 
> Maybe s/fd/desc/ to avoid the confusion with file descriptor ?

Good point.

>> +{
>> +	struct media_pad *pad;
>> +	int ret;
>> +
>> +	if (!phy->source)
>> +		return -ENODEV;
> 
> Would EPIPE (here and below) be a better error ? It will be returned to
> userspace from VIDIOC_STREAMON(), which already uses EPIPE to indicate
> that the links are not correctly set up.

Sound fine to me.

>> +
>> +	pad = media_entity_remote_pad(&phy->pads[CAL_CAMERARX_PAD_SINK]);
>> +	if (!pad)
>> +		return -ENODEV;
>> +
>> +	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc, pad->index,
>> +			       fd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (fd->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
>> +		dev_err(phy->cal->dev, "Frame desc do not describe CSI-2 link");
> 
> s/do not/does not/ and maybe s/desc/descriptor/

Yep.

>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /* ------------------------------------------------------------------
>>    *	V4L2 Subdev Operations
>>    * ------------------------------------------------------------------
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index fcc81024ae18..7975bb449acd 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -469,10 +469,56 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
>>   	return stopped;
>>   }
>>   
>> +static int
>> +cal_get_remote_frame_desc_entry(struct cal_camerarx *phy, u32 stream,
>> +				struct v4l2_mbus_frame_desc_entry *entry)
>> +{
>> +	struct v4l2_mbus_frame_desc fd;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	ret = cal_camerarx_get_remote_frame_desc(phy, &fd);
>> +	if (ret) {
>> +		if (ret != -ENOIOCTLCMD)
>> +			dev_err(phy->cal->dev,
>> +				"Failed to get remote frame desc: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	for (i = 0; i < fd.num_entries; i++) {
>> +		if (stream == fd.entry[i].stream) {
>> +			*entry = fd.entry[i];
>> +			return 0;
>> +		}
>> +	}
>> +
> 
> A dev_dbg() would be good here, in which case you could drop the
> ctx_err() in cal_ctx_prepare() as all error paths will print a message.

Hmm, yes, or maybe the other way around: remove the dev_err above, and 
let the cal_ctx_prepare handle the printing (as it already does).

But perhaps it's better to add a dev_err (did you mean dev_err, when you 
said dev_dbg?) above before the return -ENODEV to make it clear if the 
error is coming from get_remote_frame_desc or from trying to find the 
stream.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>> +	return -ENODEV;
>> +}
>> +
>>   int cal_ctx_prepare(struct cal_ctx *ctx)
>>   {
>> +	struct v4l2_mbus_frame_desc_entry entry;
>>   	int ret;
>>   
>> +	ret = cal_get_remote_frame_desc_entry(ctx->phy, ctx->stream, &entry);
>> +
>> +	if (ret == -ENOIOCTLCMD) {
>> +		ctx->vc = 0;
>> +		ctx->datatype = CAL_CSI2_CTX_DT_ANY;
>> +	} else if (!ret) {
>> +		ctx_dbg(2, ctx, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
>> +		       entry.stream,
>> +		       entry.length,
>> +		       entry.bus.csi2.vc,
>> +		       entry.bus.csi2.dt);
> 
> You can group multiple variables on the same line.

Yep.

Thanks!

  Tomi
