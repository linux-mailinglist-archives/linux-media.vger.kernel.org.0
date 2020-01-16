Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBC413D922
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2020 12:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgAPLgb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jan 2020 06:36:31 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:37285 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726045AbgAPLga (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jan 2020 06:36:30 -0500
Received: from [IPv6:2001:420:44c1:2577:1825:cb8:c622:6168]
 ([IPv6:2001:420:44c1:2577:1825:cb8:c622:6168])
        by smtp-cloud8.xs4all.net with ESMTPA
        id s3RjiVmMbpLtbs3RnipkFi; Thu, 16 Jan 2020 12:36:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579174586; bh=KJTZxvoNtyNAYS48H7dDiS3wOSGu6tHpdKtGolS4OPI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OqmFEjX+SXw4fZdw5rPbu3khV/FJcpL4Bd7+o6GOEnlW/YW07z/lPAq7mPWjyiPtv
         AYUP5MM0OncNrwzMepx5Ugnw5ezFFkMpvepnJcqZbwzVZ1yG+kHAIdVNlcXh4nnBSc
         mYGCCEzrCC5p35eI+aXC9zAZYe0U1kGzAYKil1zhgN5aXajxsSlzyheBrhR6PxkNWc
         rHMCrWvKM0cvlFzuCkE2rPTTYm2cxmKRs4qCjKjl9FD3UelnQrjqLpjCKud2CV9IhC
         wGwo7EKX26CHoyyfN+blfJ2aTI93NgC7Fht41so2zTrP1ZG+bQ7uoIiBljHy7LKPyB
         OfoqCm2I/GZ5w==
Subject: Re: [PATCH v2] media: xilinx: Use dma_request_chan() instead
 dma_request_slave_channel()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     mchehab@kernel.org, hyun.kwon@xilinx.com, vkoul@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
References: <20200110071648.15690-1-peter.ujfalusi@ti.com>
 <20200115172822.GB7139@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fc5e4b9b-824b-67e1-90c3-fddcdb973714@xs4all.nl>
Date:   Thu, 16 Jan 2020 12:36:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200115172822.GB7139@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBoRekIT5H1+bZg7kDzHByl5/pJ+D4JLvao0qsUsmlMb4ajKa+B+yCUFPOxPPnYYySnRKst2gdx52ZwoXEUxy5+AKjcsOXNPdp0hBwajxKX695mXlPl1
 Srrgquwpbli+dHKj02HgFf84PuxP3Phqt3Hmbfw/pyGEJyNEoqTT8mw6jcjlXRy3xFAFlp+xSDjlzlb60OFjX6+ZXfnNFxKg0fme9umt2mGhB3qQMSedq/9S
 JSxo8T0b+YOJ5eA+484hQFgcU7f2TWpQiXPEZjrgreCtBMUAF/ggVPfB2pQw+TVRfyMfHiWwSomc6JHPfmbO8k74seqCwOcoSeVKPaVOnJ0tunwqMa8TV5qZ
 +dGAjm/qTdqFC10jsYBXArs1Cz22maKjJpmLx+DkQMkHgUTHpWueisgq4u9u+2MNIXc3ZMkFt6phihwBx7UL97SiD3IF+JC9j/GRTr9HkBoS4v+tUYMBsU3r
 eiMqsex7gUfFrXqP0xRl7TjZLiVYkvXHlOhf+y9/jl/QMmVZ44gUXN76ibLpVT0SPXNqCrbgYaKe4bzhkPdtcbXz/cWJtG9MC8TS8PEqPf8za1nKk/EXnZOB
 0Jg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/15/20 6:28 PM, Laurent Pinchart wrote:
> Hi Peter,
> 
> (CC'ing Hans)
> 
> Thank you for the patch.
> 
> On Fri, Jan 10, 2020 at 09:16:48AM +0200, Peter Ujfalusi wrote:
>> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
>> eating up the error code.
>>
>> By using dma_request_chan() directly the driver can support deferred
>> probing against DMA.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> and taken in my tree. Hans, you asked me on IRC to review this, did you
> plan to get it merged upstream yourself ? If so I'll drop it.

Yes, I'll take it. I have similar patches as well in my upcoming PR, so
it makes sense to combine them.

Thanks for reviewing this!

	Hans

> 
>> ---
>> Hi,
>>
>> Changes since v1:
>> - Fix cleanup path when DMA request failed as suggested by Laurent
>> - Print error only in case when the error is not EPROBE_DEFER
>>
>>  drivers/media/platform/xilinx/xilinx-dma.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
>> index b211380a11f2..3bb54a4db6a4 100644
>> --- a/drivers/media/platform/xilinx/xilinx-dma.c
>> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
>> @@ -725,10 +725,11 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
>>  
>>  	/* ... and the DMA channel. */
>>  	snprintf(name, sizeof(name), "port%u", port);
>> -	dma->dma = dma_request_slave_channel(dma->xdev->dev, name);
>> -	if (dma->dma == NULL) {
>> -		dev_err(dma->xdev->dev, "no VDMA channel found\n");
>> -		ret = -ENODEV;
>> +	dma->dma = dma_request_chan(dma->xdev->dev, name);
>> +	if (IS_ERR(dma->dma)) {
>> +		ret = PTR_ERR(dma->dma);
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(dma->xdev->dev, "no VDMA channel found\n");
>>  		goto error;
>>  	}
>>  
>> @@ -752,7 +753,7 @@ void xvip_dma_cleanup(struct xvip_dma *dma)
>>  	if (video_is_registered(&dma->video))
>>  		video_unregister_device(&dma->video);
>>  
>> -	if (dma->dma)
>> +	if (!IS_ERR_OR_NULL(dma->dma))
>>  		dma_release_channel(dma->dma);
>>  
>>  	media_entity_cleanup(&dma->video.entity);
> 

