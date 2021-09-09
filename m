Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDF3404536
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 07:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350945AbhIIFx7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 01:53:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53200 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348026AbhIIFx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 01:53:58 -0400
Received: from tatooine.ideasonboard.com (unknown [IPv6:2a01:e0a:169:7140:ab35:be36:579e:39cf])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C69B466;
        Thu,  9 Sep 2021 07:52:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631166768;
        bh=QzXae5NArAz5+aiODbc5BuMYtzknPfnxqgkyK5V4Bns=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MbwCjAnORCayQRhYxQ9gGAsGwDOwLz3QlMWKGyc8Je7zs0zUxLIoRtSr4tmghhnlx
         uE3A2Ix/Ky57iu6TQUkx6sgwYtMCE+/GGklq23wHGurIf819eeT9eTWSMoLFiXOxVm
         lHhwF290rgnAEUT3cMedpJXOiH7vu6fRicWcjQHs=
Subject: Re: [RFC PATCH] media: staging: ipu3-imgu: add the AWB memory layout
To:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, Tian Shu Qiu <tian.shu.qiu@intel.com>,
        sakari.ailus@linux.intel.com
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@google.com>
References: <20210831185140.77400-1-jeanmichel.hautbois@ideasonboard.com>
 <YS6gR2YSWPSftCO0@pendragon.ideasonboard.com>
 <YThxnoukNwJjSUOr@pendragon.ideasonboard.com>
 <bf225374-13bf-e531-f794-d0a22a382cfa@linux.intel.com>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Message-ID: <491ab306-2b40-3b3e-fc46-d7af2de3db26@ideasonboard.com>
Date:   Thu, 9 Sep 2021 07:52:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bf225374-13bf-e531-f794-d0a22a382cfa@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu, thanks for your answer !

On 09/09/2021 04:19, Bingbu Cao wrote:
> Jean-Michel,
> 
> Thanks for your patch.
> 
> On 9/8/21 4:17 PM, Laurent Pinchart wrote:
>> Hello,
>>
>> (CC'ing Tomasz)
>>
>> Gentle ping.
>>
>> On Wed, Sep 01, 2021 at 12:34:00AM +0300, Laurent Pinchart wrote:
>>> On Tue, Aug 31, 2021 at 08:51:40PM +0200, Jean-Michel Hautbois wrote:
>>>> While parsing the RAW AWB metadata, the AWB layout was missing to fully
>>>> understand which byte corresponds to which feature. Make the field names
>>>> and usage explicit, as it is used by the userspace applications.
>>>>
>>>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
>>>> ---
>>>> This structure layout is defined in CrOs:
>>>> https://chromium.googlesource.com/chromiumos/platform/arc-camera/+/refs/heads/master/hal/intel/include/ia_imaging/awb_public.h
>>>>
>>>> There are a few things not really understood right now:
>>>> - Is sat_ratio a full scale ratio (I can't get more than some values out
>>>>   of it, is it a ratio of 25%, 50%, 75%, 100% ?)
>>>> - What are the real minimum and maximum values for the grid size ? From
>>>>   CrOs it appears to be [16, 80] for width and [16, 60] for height while
>>>>   in this file it seems to be [16, 160] for width and not really defined
>>>>   for height AFAICT ?
>>>> - Same for the block_width_log2 and block_height_log2 which are [3, 7]
>>>>   in this file and [3, 6] in the awb_public.h header ?

Do you have any clue for those questions please :-) ?

>>>>
>>>>  .../media/ipu3/include/uapi/intel-ipu3.h      | 38 ++++++++++++++-----
>>>>  1 file changed, 29 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
>>>> index fa3d6ee5adf2..83191aff2ddd 100644
>>>> --- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
>>>> +++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
>>>> @@ -61,20 +61,40 @@ struct ipu3_uapi_grid_config {
>>>>  	__u16 y_end;
>>>>  } __packed;
>>>>  
>>>> +/**
>>>> + * struct ipu3_uapi_awb_raw_buffer - Memory layout for each cell in AWB
>>>> + *
>>>> + * @Gr_avg:	Green average for red lines in the cell.
>>>> + * @R_avg:	Red average in the cell.
>>>> + * @B_avg:	Blue average in the cell.
>>>> + * @Gb_avg:	Green average for blue lines in the cell.
>>>> + * @sat_ratio:  Saturation ratio in the cell.
>>>> + * @padding0:   Unused byte for padding.
>>>> + * @padding1:   Unused byte for padding.
>>>> + * @padding2:   Unused byte for padding.
>>>> + */
>>>> +struct ipu3_uapi_awb_raw_buffer {
>>>> +    unsigned char Gr_avg;
>>>> +    unsigned char R_avg;
>>>> +    unsigned char B_avg;
>>>> +    unsigned char Gb_avg;
>>>> +    unsigned char sat_ratio;
>>>> +    unsigned char padding0;
>>>> +    unsigned char padding1;
>>>> +    unsigned char padding2;
> 
> It is fine for me to define and exposure the awb memory layout in uAPI.
> 
> nit: use __u8 here?

Sure !

> 
>>>> +} __packed;
>>>> +
>>>>  /*
>>>>   * The grid based data is divided into "slices" called set, each slice of setX
>>>>   * refers to ipu3_uapi_grid_config width * height_per_slice.
>>>>   */
>>>>  #define IPU3_UAPI_AWB_MAX_SETS				60
>>>> -/* Based on grid size 80 * 60 and cell size 16 x 16 */
>>>> -#define IPU3_UAPI_AWB_SET_SIZE				1280
>>>> -#define IPU3_UAPI_AWB_MD_ITEM_SIZE			8
>>>> -#define IPU3_UAPI_AWB_SPARE_FOR_BUBBLES \
>>>> -	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES * \
>>>> -	 IPU3_UAPI_AWB_MD_ITEM_SIZE)
>>>> +#define AWB_PUBLIC_NUM_OF_ITEMS_IN_SET			160
>>>> +/* Based on max grid height + Spare for bubbles */
>>>> +#define AWB_PUBLIC_NUM_OF_SETS_IN_BUFFER IPU3_UAPI_AWB_MAX_SETS + \
>>>> +	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES)
>>>>  #define IPU3_UAPI_AWB_MAX_BUFFER_SIZE \
>>>> -	(IPU3_UAPI_AWB_MAX_SETS * \
>>>> -	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))
>>>> +        AWB_PUBLIC_NUM_OF_SETS_IN_BUFFER * AWB_PUBLIC_NUM_OF_ITEMS_IN_SET
> 
> It's better to update the name of 'IPU3_UAPI_AWB_MAX_BUFFER_SIZE' to align current
> definition.
> 
>>>>  
>>>>  /**
>>>>   * struct ipu3_uapi_awb_raw_buffer - AWB raw buffer
>>>> @@ -83,7 +103,7 @@ struct ipu3_uapi_grid_config {
>>>>   *		the average values for each color channel.
>>>>   */
>>>>  struct ipu3_uapi_awb_raw_buffer {
>>>> -	__u8 meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
>>>> +	struct ipu3_uapi_awb_raw_buffer meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
>>>>  		__attribute__((aligned(32)));
>>>>  } __packed;
>>>>  
>>
> 
