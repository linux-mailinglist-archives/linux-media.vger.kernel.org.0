Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D25BC161D4
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2019 12:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfEGKUO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 May 2019 06:20:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36320 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfEGKUO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 May 2019 06:20:14 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53497D5;
        Tue,  7 May 2019 12:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557224411;
        bh=QVvyXq09RbodnEjARRwdwnj2LyMSiMMAg/Z2UEnU8aI=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TYbrMh/rzX94RhUlpbURU2mr3X+SGZdmh+zmLFcmikSSLvX1flVyK7k3oE0BP8T9v
         l5bS6o76ZhN7kPPmX/V0xkAVxzEkjnJrJRbWs14fVT51+DXhp6J8mW2mRrtMDdug/S
         crE8HC+K/PU71ZNK3sQ0DI/9mnMmshPo09tDZYTU=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v3 2/5] media: vsp1: Initialise partition windows
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20190411161256.19607-1-kieran.bingham+renesas@ideasonboard.com>
 <20190411161256.19607-3-kieran.bingham+renesas@ideasonboard.com>
 <20190418063236.GF4806@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <3535f115-9699-3dec-d617-2b15c12a88fe@ideasonboard.com>
Date:   Tue, 7 May 2019 11:20:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418063236.GF4806@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 18/04/2019 07:32, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Thu, Apr 11, 2019 at 05:12:53PM +0100, Kieran Bingham wrote:
>> Ensure that the partition window is correctly initialised before being
>> utilised.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  drivers/media/platform/vsp1/vsp1_video.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
>> index ee2fb8261a6a..563f9a02c373 100644
>> --- a/drivers/media/platform/vsp1/vsp1_video.c
>> +++ b/drivers/media/platform/vsp1/vsp1_video.c
>> @@ -189,7 +189,7 @@ static void vsp1_video_calculate_partition(struct vsp1_pipeline *pipe,
>>  					   unsigned int index)
>>  {
>>  	const struct v4l2_mbus_framefmt *format;
>> -	struct vsp1_partition_window window;
>> +	struct vsp1_partition_window window = { 0, };
> 
> This isn't needed as-is. If this change is required by a patch further
> in this series, you can squash it there.

Ok, I think this might have got put in because of my debug patch which
prints the tables and was showing uninitialised data in unused fields.

I guess they can stay uninitiailised if/when they are unused :D.


> 
>>  	unsigned int modulus;
>>  
>>  	/*
> 

