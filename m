Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB033680CA
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 14:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235875AbhDVMrp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 08:47:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47028 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236001AbhDVMrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 08:47:42 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30D333EE;
        Thu, 22 Apr 2021 14:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619095626;
        bh=q5QLNlHI4g65tf+X6x6x9vxv1B8A43HAKwog5h15y+A=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=Z1rU1U7ihCejudRqonXDeQHKqQHnRPDmasGNeh3upeUlGXivrmzsC898sMGXYw2Wt
         0Asl2UnUC5GToHhptQgXRd743g4Gf1aDYk4Vha6fQ+ws3MzmoOUWOKDvQe+fSRRa1z
         HiZvvc+B1cDxFPVMbdYlwMpZ2p7D1xh42ejAaMeE=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-18-tomi.valkeinen@ideasonboard.com>
 <YHyIHyJpxvwMf6rZ@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v5 17/24] v4l: Add stream to frame descriptor
Message-ID: <a259ee1e-10d5-3b5d-0fdc-6fc6a67dcdcd@ideasonboard.com>
Date:   Thu, 22 Apr 2021 15:47:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHyIHyJpxvwMf6rZ@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 22:27, Laurent Pinchart wrote:
> Hi Tomi and Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Apr 15, 2021 at 04:04:43PM +0300, Tomi Valkeinen wrote:
>> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>>
>> The stream field identifies the stream this frame descriptor applies to in
>> routing configuration across a multiplexed link.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> ---
>>   include/media/v4l2-subdev.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 30ec011d31e3..436d0445aafd 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -338,6 +338,7 @@ enum v4l2_mbus_frame_desc_flags {
>>    * struct v4l2_mbus_frame_desc_entry - media bus frame description structure
>>    *
>>    * @flags:	bitmask flags, as defined by &enum v4l2_mbus_frame_desc_flags.
>> + * @stream:	stream in routing configuration
>>    * @pixelcode:	media bus pixel code, valid if @flags
>>    *		%FRAME_DESC_FL_BLOB is not set.
>>    * @length:	number of octets per frame, valid if @flags
>> @@ -347,6 +348,7 @@ enum v4l2_mbus_frame_desc_flags {
>>    */
>>   struct v4l2_mbus_frame_desc_entry {
>>   	enum v4l2_mbus_frame_desc_flags flags;
>> +	u32 stream;
> 
> As this isn't used in this series, I can't really tell how it will be
> used, so it's hard to review the patch. Should we postpone it to the
> next patch series ?

It's not used here, but it is needed allow the drivers use the features 
introduced in this series. It is used to match routes to frame_descs.

Its usage is quite simple: e.g. when a driver has a route 
(v4l2_subdev_route), it can get the frame_descs from the entity behind 
v4l2_subdev_route.source_pad, and then find the matching frame_desc by 
searching for

v4l2_subdev_route.source_stream == v4l2_mbus_frame_desc_entry.stream

  Tomi
