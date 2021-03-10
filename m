Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3158334073
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 15:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhCJOjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 09:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbhCJOj2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 09:39:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4305AC061760;
        Wed, 10 Mar 2021 06:39:28 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F32839E7;
        Wed, 10 Mar 2021 15:39:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615387165;
        bh=NxlY/SF5iv00Nj49PeZlzmCBy6QENkhmHimRizcoaEw=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FW2odQYZ92RjTEAPhfQwp74yWZqRugFV3I63OLVfODdPN+aQzfC31/rFKN4qmWSuW
         qGCuQCgbWCborDTN4vxw925OQhBQKGuiz6OSmfMo7mvWXVMwZKQsDNjtTeqllyp0+I
         La2Xq7KDU63Q4BxmAly9StCeh2bWV5P7LRO43xWQ=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
 <20210301120828.6945-3-biju.das.jz@bp.renesas.com>
 <133f8b63-3b84-c60a-725d-30b8d6df35dd@ideasonboard.com>
 <OS0PR01MB5922BE9F9D151623773CF53286919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <56c2d53e-8d1f-5b84-1480-5965ae9cbae2@ideasonboard.com>
Date:   Wed, 10 Mar 2021 14:39:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB5922BE9F9D151623773CF53286919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On 10/03/2021 13:56, Biju Das wrote:
> Hi Kieran,
> 
> Thanks for the feedback.
>> Subject: Re: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
>>
>> Hi Biju,
>>
>> On 01/03/2021 12:08, Biju Das wrote:
>>> RZ/G2L SoC has no UIF. This patch fixes null pointer access, when UIF
>>> module is not used.
>>>
>>> Fixes: 5e824f989e6e8("media: v4l: vsp1: Integrate DISCOM in display
>>> pipeline")
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> ---
>>>  drivers/media/platform/vsp1/vsp1_drm.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c
>>> b/drivers/media/platform/vsp1/vsp1_drm.c
>>> index f6d2f47a4058..06f74d410973 100644
>>> --- a/drivers/media/platform/vsp1/vsp1_drm.c
>>> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
>>> @@ -462,9 +462,9 @@ static int vsp1_du_pipeline_setup_inputs(struct
>>> vsp1_device *vsp1,
>>
>>
>> This looks like it complicates these conditionals more than we perhaps
>> need to.
>>
>> What do you think about adding something above the block comment here?:
> 
> It is much better. 
> 
> This patch is accepted in media tree[1]. So not sure,
> should I send a follow up patch as optimization or drop this patch and send new one.

Oh, I didn't realise these were in already. Sorry, I didn't see any
review on the list, and it was the earliest I had got to them.

> Please suggest.

Up to you, I don't think this would get dropped now it's integrated.
It's in, so if you want to update on top I believe that's fine.

--
Kieran


> [1] https://git.linuxtv.org/media_tree.git/commit/?h=fixes&id=c4f27003ec3d84ef0c333c74ae2aff326537e583
> 
> Cheers,
> Biju
> 
>> 	if (!drm_pipe->uif)
>> 		return 0;
>>
>>
>>>  	 * make sure it is present in the pipeline's list of entities if it
>>>  	 * wasn't already.
>>>  	 */
>>> -	if (!use_uif) {
>>> +	if (drm_pipe->uif && !use_uif) {
>>>  		drm_pipe->uif->pipe = NULL;
>>> -	} else if (!drm_pipe->uif->pipe) {
>>> +	} else if (drm_pipe->uif && !drm_pipe->uif->pipe) {>
>> 	drm_pipe->uif->pipe = pipe;
>>>  		list_add_tail(&drm_pipe->uif->list_pipe, &pipe->entities);
>>>  	}
>>>
> 

