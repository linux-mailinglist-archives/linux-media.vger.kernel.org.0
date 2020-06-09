Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2831F3F06
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 17:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730712AbgFIPQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 11:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730436AbgFIPQx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jun 2020 11:16:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D86C05BD1E;
        Tue,  9 Jun 2020 08:16:53 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E56F3291;
        Tue,  9 Jun 2020 17:16:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591715811;
        bh=IC7Dfd45JXlJHgI52UIb0qH+JnzSyuvSQq4C1KRAEtk=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=sA5Ai0tiRQNWPtHk9QfA2hBdTB8hDuZxi0Hcxnk0k315YHI8YX2pN0Scoq6hM5IV8
         AgJsCFap3VSTVFj7AozsWMSxzbhW10QihLz1h6xHe9pHy3t5/Tfw20jcITJYiSkzVc
         TBsYHZs+EmPavcx9IbDPilqGRWVFc8gehw8xi7Po=
Subject: Re: [RFC 1/5] uapi/linux/media.h: add flag field to struct
 media_device_info
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20200318213051.3200981-1-niklas.soderlund+renesas@ragnatech.se>
 <20200318213051.3200981-2-niklas.soderlund+renesas@ragnatech.se>
 <20200319023744.GC27375@pendragon.ideasonboard.com>
 <20200319023856.GD27375@pendragon.ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <afea3497-3295-03f2-9b41-d5828dedd8ac@ideasonboard.com>
Date:   Tue, 9 Jun 2020 16:16:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200319023856.GD27375@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/03/2020 02:38, Laurent Pinchart wrote:
> On Thu, Mar 19, 2020 at 04:37:44AM +0200, Laurent Pinchart wrote:
>> Hi Niklas,
>>
>> Thank you for the patch.
>>
>> On Wed, Mar 18, 2020 at 10:30:47PM +0100, Niklas Söderlund wrote:
>>> Add a flags field to the media_device_info structure by taking one
>>> of the reserved u32 fields. The use-case is to have a way to
>>> (optionally) report to user-space if the media graph is complete or not.
>>>
>>> Also define two flags to carry information about if the graph is
>>> complete or not. If neither of the two flags are set the
>>> media device does not support reporting its graph status. The other bits
>>> in the flags field are unused for now, but could be claimed to carry
>>> other type of information in the future.
>>>
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> ---
>>>  include/uapi/linux/media.h | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
>>> index 383ac7b7d8f07eca..9b37ed8b41d0d866 100644
>>> --- a/include/uapi/linux/media.h
>>> +++ b/include/uapi/linux/media.h
>>> @@ -34,9 +34,16 @@ struct media_device_info {
>>>  	__u32 media_version;
>>>  	__u32 hw_revision;
>>>  	__u32 driver_version;
>>> -	__u32 reserved[31];
>>> +	__u32 flags;
>>> +	__u32 reserved[30];
>>
>> I think this information should be added to media_v2_topology, not
>> media_device_info, otherwise you'll have a race condition between
>> retrieving the media device information and the topology.
>> media_device_info is really supposed to be static.
> 
> Also, documentation is needed.
> 
>>>  };
>>>  
>>> +/*
>>> + * Graph flags
>>> + */
>>> +#define MEDIA_INFO_FLAG_INCOMPLETE	(1 << 0)
>>> +#define MEDIA_INFO_FLAG_COMPLETE	(1 << 1)

Isn't this boolean, and therefore wouldn't a single flag be sufficient?
or do you expect there to be some in-between state where neither of
these flags would be set.

--
Kieran


>>> +
>>>  /*
>>>   * Base number ranges for entity functions
>>>   *
> 

