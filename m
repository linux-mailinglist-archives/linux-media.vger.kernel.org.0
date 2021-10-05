Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591E84220B2
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbhJEIbs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 04:31:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59868 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbhJEIbq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 04:31:46 -0400
Received: from tatooine.ideasonboard.com (unknown [IPv6:2a01:e0a:169:7140:87c1:5a4a:3543:636a])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AC6A25B;
        Tue,  5 Oct 2021 10:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633422591;
        bh=29A9PMsxQy1KVaHO5HYLfazQe8Z7R8OK8KapdUZS+R4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=joifYqVn+NM8A4p/7Yu+tLTJqMhBzXQFamx2HX4WVb2n0tNxuA9lnB2BkREQMDRDN
         xiDzG/B4SRx4txhXZU1LC3VO3n2f6FHyWjA7Aw2XgMeMF0o2cOivZPuql4N8n8Vjxr
         YTcNckFarfHJ7gCW4cutS0f0v1RAjCI/FKw65smI=
Subject: Re: [PATCH] media: staging: ipu3-imgu: add the AWB memory layout
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tfiga@google.com, tian.shu.qiu@intel.com
References: <20210930092021.65741-1-jeanmichel.hautbois@ideasonboard.com>
 <YVt5HhjiP9i85ZMZ@pendragon.ideasonboard.com>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Message-ID: <66ec9379-ec86-24aa-ec20-96ecc3a155ca@ideasonboard.com>
Date:   Tue, 5 Oct 2021 10:29:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVt5HhjiP9i85ZMZ@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 04/10/2021 23:58, Laurent Pinchart wrote:
> Hi Jean-Michel,
> 
> Thank you for the patch.
> 
> On Thu, Sep 30, 2021 at 11:20:21AM +0200, Jean-Michel Hautbois wrote:
>> While parsing the RAW AWB metadata, the AWB layout was missing to fully
>> understand which byte corresponds to which feature. Make the field names
>> and usage explicit, as it is used by the userspace applications.
> 
> I would have mentioned how the hardware (or maybe firmware) generates
> the statistics instead of how applications consume them, as it's the
> IPU3 dictating the format, but it doesn't matter too much.
> 
>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
>> ---
>>  .../media/ipu3/include/uapi/intel-ipu3.h      | 30 +++++++++++++++++--
>>  1 file changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
>> index 585f55981c86..fdda9d0a30af 100644
>> --- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
>> +++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
>> @@ -61,6 +61,29 @@ struct ipu3_uapi_grid_config {
>>  	__u16 y_end;
>>  } __packed;
>>  
>> +/**
>> + * struct ipu3_uapi_awb_set_item - Memory layout for each cell in AWB
>> + *
>> + * @Gr_avg:	Green average for red lines in the cell.
>> + * @R_avg:	Red average in the cell.
>> + * @B_avg:	Blue average in the cell.
>> + * @Gb_avg:	Green average for blue lines in the cell.
>> + * @sat_ratio:  Saturation ratio in the cell.
> 
> Do we have more information about this field ? We can add it later if we
> don't.

Indeed, I have made tests on my side, and I am now even able to make
this field "visible" :-).
The sat_ratio is a 0-100% ratio coded as 0-255 values. It is controlled
by the rgbs_thr_* fields in the ipu3_uapi_awb_config_s structure.

> 
>> + * @padding0:   Unused byte for padding.
>> + * @padding1:   Unused byte for padding.
>> + * @padding2:   Unused byte for padding.
>> + */
>> +struct ipu3_uapi_awb_set_item {
>> +	__u8 Gr_avg;
>> +	__u8 R_avg;
>> +	__u8 B_avg;
>> +	__u8 Gb_avg;
>> +	__u8 sat_ratio;
>> +	__u8 padding0;
>> +	__u8 padding1;
>> +	__u8 padding2;
>> +} __attribute__((packed));
>> +
>>  /*
>>   * The grid based data is divided into "slices" called set, each slice of setX
>>   * refers to ipu3_uapi_grid_config width * height_per_slice.
>> @@ -73,8 +96,9 @@ struct ipu3_uapi_grid_config {
>>  	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES * \
>>  	 IPU3_UAPI_AWB_MD_ITEM_SIZE)
>>  #define IPU3_UAPI_AWB_MAX_BUFFER_SIZE \
>> -	(IPU3_UAPI_AWB_MAX_SETS * \
>> -	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))
>> +	((IPU3_UAPI_AWB_MAX_SETS * \
>> +	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES)) / \
>> +	 sizeof(struct ipu3_uapi_awb_set_item))
> 
> We'll really have to figure out what the bubbles are... Not in this
> patch though.
> 
> Given that IPU3_UAPI_AWB_MD_ITEM_SIZE is equal to the size of one item,
> how about this ?
> 
> diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> index ee0e6d0e4b2c..a18e9228ed07 100644
> --- a/include/linux/intel-ipu3.h
> +++ b/include/linux/intel-ipu3.h
> @@ -65,11 +65,9 @@ struct ipu3_uapi_grid_config {
>   */
>  #define IPU3_UAPI_AWB_MAX_SETS				60
>  /* Based on grid size 80 * 60 and cell size 16 x 16 */
> -#define IPU3_UAPI_AWB_SET_SIZE				1280
> -#define IPU3_UAPI_AWB_MD_ITEM_SIZE			8
> +#define IPU3_UAPI_AWB_SET_SIZE				160
>  #define IPU3_UAPI_AWB_SPARE_FOR_BUBBLES \
> -	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES * \
> -	 IPU3_UAPI_AWB_MD_ITEM_SIZE)
> +	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES)
>  #define IPU3_UAPI_AWB_MAX_BUFFER_SIZE \
>  	(IPU3_UAPI_AWB_MAX_SETS * \
>  	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))
> 

Yes, it is better :-), thanks :-).

>>  
>>  /**
>>   * struct ipu3_uapi_awb_raw_buffer - AWB raw buffer
>> @@ -83,7 +107,7 @@ struct ipu3_uapi_grid_config {
>>   *		the average values for each color channel.
>>   */
>>  struct ipu3_uapi_awb_raw_buffer {
>> -	__u8 meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
>> +	struct ipu3_uapi_awb_set_item meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
>>  		__attribute__((aligned(32)));
>>  } __packed;
>>  
> 
