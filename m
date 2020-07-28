Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 666CC230B54
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 15:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729950AbgG1NVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 09:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729433AbgG1NVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 09:21:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B985DC061794
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 06:21:32 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FE96563;
        Tue, 28 Jul 2020 15:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595942489;
        bh=KcMsPVw2RyGL/IkYPIkQzVswAy5F/wrRoZYxwp0/L/w=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=L1ik6eWkjkpTD76aJfw7OKrBb4A53CR2aQ6dL4eMqJeoCMUsamxldIZ6cPjL3ollQ
         tS+hHduFAobcXgI/4cCEWF50rDZyLJwgNR4AXtc5D9o0EGKMPE7Zd3QkHxEUhfOax2
         tjuzqjNSGadECiyFWY7PYrZAjADM3bnKHw1MwzPI=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] media: uvcvideo: Set media controller entity functions
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
References: <20200607022047.29111-1-laurent.pinchart@ideasonboard.com>
 <20200728001326.GA30712@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <3e45f126-8ffb-de2b-7957-452f0a3765b5@ideasonboard.com>
Date:   Tue, 28 Jul 2020 14:21:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728001326.GA30712@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 28/07/2020 01:13, Laurent Pinchart wrote:
> Kieran, would you have time to give this a review ?
> 
> On Sun, Jun 07, 2020 at 05:20:47AM +0300, Laurent Pinchart wrote:
>> The media controller core prints a warning when an entity is registered
>> without a function being set. This affect the uvcvideo driver, as the

s/affect/affects/

>> warning was added without first addressing the issue in existing
>> drivers. The problem is harmless, but unnecessarily worries users. Fix
>> it by mapping UVC entity types to MC entity functions as accurately as
>> possible using the existing functions.
>>
>> Fixes: b50bde4e476d ("[media] v4l2-subdev: use MEDIA_ENT_T_UNKNOWN for new subdevs")
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Looks fine to me.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>> ---
>>  drivers/media/usb/uvc/uvc_entity.c | 35 ++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
>> index b4499cddeffe..ca3a9c2eec27 100644
>> --- a/drivers/media/usb/uvc/uvc_entity.c
>> +++ b/drivers/media/usb/uvc/uvc_entity.c
>> @@ -73,10 +73,45 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
>>  	int ret;
>>  
>>  	if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
>> +		u32 function;
>> +
>>  		v4l2_subdev_init(&entity->subdev, &uvc_subdev_ops);
>>  		strscpy(entity->subdev.name, entity->name,
>>  			sizeof(entity->subdev.name));
>>  
>> +		switch (UVC_ENTITY_TYPE(entity)) {
>> +		case UVC_VC_SELECTOR_UNIT:
>> +			function = MEDIA_ENT_F_VID_MUX;
>> +			break;
>> +		case UVC_VC_PROCESSING_UNIT:
>> +		case UVC_VC_EXTENSION_UNIT:
>> +			/* For lack of a better option. */
>> +			function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>> +			break;
>> +		case UVC_COMPOSITE_CONNECTOR:
>> +		case UVC_COMPONENT_CONNECTOR:
>> +			function = MEDIA_ENT_F_CONN_COMPOSITE;
>> +			break;
>> +		case UVC_SVIDEO_CONNECTOR:
>> +			function = MEDIA_ENT_F_CONN_SVIDEO;
>> +			break;
>> +		case UVC_ITT_CAMERA:
>> +			function = MEDIA_ENT_F_CAM_SENSOR;
>> +			break;
>> +		case UVC_TT_VENDOR_SPECIFIC:
>> +		case UVC_ITT_VENDOR_SPECIFIC:
>> +		case UVC_ITT_MEDIA_TRANSPORT_INPUT:
>> +		case UVC_OTT_VENDOR_SPECIFIC:
>> +		case UVC_OTT_DISPLAY:
>> +		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
>> +		case UVC_EXTERNAL_VENDOR_SPECIFIC:
>> +		default:
>> +			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
>> +			break;
>> +		}
>> +
>> +		entity->subdev.entity.function = function;
>> +
>>  		ret = media_entity_pads_init(&entity->subdev.entity,
>>  					entity->num_pads, entity->pads);
>>  
> 

-- 
Regards
--
Kieran
