Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 027C2161D8
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2019 12:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbfEGKWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 May 2019 06:22:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36342 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfEGKWN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 May 2019 06:22:13 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8C4F2B6;
        Tue,  7 May 2019 12:22:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557224531;
        bh=gD7OL0kADykIoOW50NqUdtgBs5hVaB543mz796XGRGs=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LZRhXxT+JS0gTVs67oafGRM8fZLAttuxqudF9lWh7EQeHvYP10yOLzW0GjXBNNcx5
         HAaGpTdf1VMt0FHVNBS72uFUCbCYOLXv6WPrQwio32cNzHuYfsUfspFTmrPsM9vqxe
         UTiVNRuijhUTesizYlRfKJKfMI0psc61iwV8hPFo=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v3 3/5] media: vsp1: Document partition algorithm in code
 header
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20190411161256.19607-1-kieran.bingham+renesas@ideasonboard.com>
 <20190411161256.19607-4-kieran.bingham+renesas@ideasonboard.com>
 <20190418063341.GG4806@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <6acc6c87-01c8-c917-1b7f-895b8795a2bf@ideasonboard.com>
Date:   Tue, 7 May 2019 11:22:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418063341.GG4806@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 18/04/2019 07:33, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Thu, Apr 11, 2019 at 05:12:54PM +0100, Kieran Bingham wrote:
>> The image partition algorithm operates on the image dimensions as input
>> into the WPF entity. Document this in the code block header.
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  drivers/media/platform/vsp1/vsp1_video.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
>> index 563f9a02c373..d1ecc3d91290 100644
>> --- a/drivers/media/platform/vsp1/vsp1_video.c
>> +++ b/drivers/media/platform/vsp1/vsp1_video.c
>> @@ -173,6 +173,14 @@ static int __vsp1_video_try_format(struct vsp1_video *video,
>>  
>>  /* -----------------------------------------------------------------------------
>>   * VSP1 Partition Algorithm support
>> + *
>> + * VSP hardware can have restrictions on image width dependent on the hardware
> 
> Did you mean s/dependent/depending/ ?

Yes, it looks like I did.

Or otherwise, it could be 'dependant upon the hardware' ... but I'll go
with depending.

Updated.

> 
>> + * configuration of the pipeline. Adapting for these restrictions is implemented
>> + * via the partition algorithm.
>> + *
>> + * The partition windows and sizes are based on the output size of the WPF
>> + * before rotation, which is represented by the input parameters to the WPF
>> + * entity in our pipeline.
>>   */
>>  
>>  /**
>> -- 
>> 2.19.1
>>
> 

