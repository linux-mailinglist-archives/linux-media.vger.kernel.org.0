Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2763050B4AA
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 12:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446405AbiDVKJh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Apr 2022 06:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446197AbiDVKJg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Apr 2022 06:09:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F9D532CF
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 03:06:39 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAB552F7;
        Fri, 22 Apr 2022 12:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650621997;
        bh=R6C/WNYZEgqc7nH6hQV24ow3Rfxdqx5bbNoQ/G8VHbk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SE7cr5zN/l5Az6XCIs+s00Q0lUllKvxcB25KApcYqXvn68H63zFcy3GqrCn9ir5ZZ
         6DfGDqLNEHac+xUkH1p99cgQSrkijsKbDoBbsjh4zKZ983qDx1Zzow1yZltNEV3H8B
         TzVuC1UynTgdVpo5n7tijspEBbdlONq0X7mY7FW0=
Message-ID: <41a16dfb-273f-aa45-cc73-901919064277@ideasonboard.com>
Date:   Fri, 22 Apr 2022 13:06:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] media: ti: cal: use frame desc to get vc and dt
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, satish.nagireddy@getcruise.com
References: <20220421142906.527918-1-tomi.valkeinen@ideasonboard.com>
 <20220421142906.527918-4-tomi.valkeinen@ideasonboard.com>
 <20220422095556.eghhcbuhn7gohdsd@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220422095556.eghhcbuhn7gohdsd@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2022 12:55, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Thu, Apr 21, 2022 at 05:29:06PM +0300, Tomi Valkeinen wrote:
>> Use get_frame_desc() to get the frame desc from the connected source,
>> and use the provided virtual channel and datatype instead of hardcoded
>> ones.
>>
>> get_frame_desc() can contain multiple streams, but as we don't support
>> multiple streams yet, we will just always use the first stream.
>>
>> If the source doesn't support get_frame_desc(), fall back to the
>> previous method of always capturing virtual channel 0 and any datatype.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti/cal/cal-camerarx.c | 27 ++++++++++
>>   drivers/media/platform/ti/cal/cal.c          | 52 +++++++++++++++++++-
>>   drivers/media/platform/ti/cal/cal.h          |  2 +
>>   3 files changed, 79 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
>> index 6b43a1525b45..e69fed117fea 100644
>> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
>> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
>> @@ -583,6 +583,33 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
>>   	return ret;
>>   }
>>
>> +int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
>> +				       struct v4l2_mbus_frame_desc *desc)
>> +{
>> +	struct media_pad *pad;
>> +	int ret;
>> +
>> +	if (!phy->source)
>> +		return -EPIPE;
>> +
>> +	pad = media_entity_remote_pad(&phy->pads[CAL_CAMERARX_PAD_SINK]);
>> +	if (!pad)
>> +		return -EPIPE;
>> +
>> +	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc, pad->index,
>> +			       desc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
>> +		dev_err(phy->cal->dev,
>> +			"Frame descriptor does not describe CSI-2 link");
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /* ------------------------------------------------------------------
>>    *	V4L2 Subdev Operations
>>    * ------------------------------------------------------------------
>> diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
>> index 4a4a6c5983f7..a93f98ee76bb 100644
>> --- a/drivers/media/platform/ti/cal/cal.c
>> +++ b/drivers/media/platform/ti/cal/cal.c
>> @@ -469,10 +469,60 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
>>   	return stopped;
>>   }
>>
>> +static int
>> +cal_get_remote_frame_desc_entry(struct cal_camerarx *phy,
>> +				struct v4l2_mbus_frame_desc_entry *entry)
>> +{
>> +	struct v4l2_mbus_frame_desc fd;
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
>> +	if (fd.num_entries == 0) {
>> +		dev_err(phy->cal->dev,
>> +			"No streams found in the remote frame descriptor\n");
>> +
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (fd.num_entries != 1) {
>> +		dev_err(phy->cal->dev,
>> +			"Multiple streams not supported in remote frame descriptor\n");
>> +
>> +		return -ENODEV;
>> +	}
> 
> This seems to contradict the commit message which reports:
> 
>   get_frame_desc() can contain multiple streams, but as we don't support
>   multiple streams yet, we will just always use the first stream.
> 
> Should you demote the message to dev_dbg and continue ?

Ah, thanks. I'll change this.

  Tomi
