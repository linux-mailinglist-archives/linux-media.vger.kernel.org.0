Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C2856F20
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 18:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfFZQuP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 12:50:15 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:34321 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726042AbfFZQuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 12:50:15 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id gB7ZhYvW2SfvXgB7dhLgwU; Wed, 26 Jun 2019 18:50:13 +0200
Subject: Re: [PATCH 1/5] v4l2-ioctl: add missing pixelformats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
References: <20190626112748.31730-1-hverkuil-cisco@xs4all.nl>
 <20190626112748.31730-2-hverkuil-cisco@xs4all.nl>
 <20190626163105.GE5015@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9ae82286-1529-0f03-03c8-60a9a65c03be@xs4all.nl>
Date:   Wed, 26 Jun 2019 18:50:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190626163105.GE5015@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO3n7dCo3c/7X6NlFSAgLZHhM7dSL8zo9GE6NaSBXhqMRNBQ+sp81J1NDnNkSR7qkmi7l8Eu+Kjr4IQ4gK0rnQ43Gw4NDyo64jBMcsX/JYfcDUB9leR/
 VYjkrw2hq0f69lFSfBVOc76fUfsY3HUChA6ADwlELzL3pRqa2YmcLE0xR2VnXBAzpxIS3S3j7YsL92ymEUUJJbDwqwXBt+kRbAx0wDrffSG1tZff6Wk4EuMd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/26/19 6:31 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Wed, Jun 26, 2019 at 01:27:44PM +0200, Hans Verkuil wrote:
>> The v4l_fill_fmtdesc() is supposed to be updated whenever a new pixelformat
>> is added, but a bunch of recently added pixelformats were forgotten.
> 
> Sorry about forgetting tp update the code :-(
> 
>> Update the list.
>>
>> Also change a few lower case words to upper case to keep the same style.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-ioctl.c | 29 ++++++++++++++++++++++------
>>  1 file changed, 23 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index b1f4b991dba6..c1faa7ca1925 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1169,9 +1169,21 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>  	case V4L2_PIX_FMT_RGB444:	descr = "16-bit A/XRGB 4-4-4-4"; break;
>>  	case V4L2_PIX_FMT_ARGB444:	descr = "16-bit ARGB 4-4-4-4"; break;
>>  	case V4L2_PIX_FMT_XRGB444:	descr = "16-bit XRGB 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_RGBA444:	descr = "16-bit RGBA 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_RGBX444:	descr = "16-bit RGBX 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_ABGR444:	descr = "16-bit ABGR 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_XBGR444:	descr = "16-bit XBGR 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_BGRA444:	descr = "16-bit BGRA 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_BGRX444:	descr = "16-bit BGRX 4-4-4-4"; break;
>>  	case V4L2_PIX_FMT_RGB555:	descr = "16-bit A/XRGB 1-5-5-5"; break;
>>  	case V4L2_PIX_FMT_ARGB555:	descr = "16-bit ARGB 1-5-5-5"; break;
>>  	case V4L2_PIX_FMT_XRGB555:	descr = "16-bit XRGB 1-5-5-5"; break;
>> +	case V4L2_PIX_FMT_ABGR555:	descr = "16-bit ABGR 1-5-5-5"; break;
>> +	case V4L2_PIX_FMT_XBGR555:	descr = "16-bit XBGR 1-5-5-5"; break;
>> +	case V4L2_PIX_FMT_RGBA555:	descr = "16-bit RGBA 1-5-5-5"; break;
>> +	case V4L2_PIX_FMT_RGBX555:	descr = "16-bit RGBX 1-5-5-5"; break;
>> +	case V4L2_PIX_FMT_BGRA555:	descr = "16-bit BGRA 1-5-5-5"; break;
>> +	case V4L2_PIX_FMT_BGRX555:	descr = "16-bit BGRX 1-5-5-5"; break;
> 
> Should the last four formats be described as 5-5-5-1 to match the order
> of the components ?

Good point. I'll take another look at that.

Regards,

	Hans

> 
> With or without this changed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>>  	case V4L2_PIX_FMT_RGB565:	descr = "16-bit RGB 5-6-5"; break;
>>  	case V4L2_PIX_FMT_RGB555X:	descr = "16-bit A/XRGB 1-5-5-5 BE"; break;
>>  	case V4L2_PIX_FMT_ARGB555X:	descr = "16-bit ARGB 1-5-5-5 BE"; break;
>> @@ -1186,6 +1198,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>  	case V4L2_PIX_FMT_RGB32:	descr = "32-bit A/XRGB 8-8-8-8"; break;
>>  	case V4L2_PIX_FMT_ARGB32:	descr = "32-bit ARGB 8-8-8-8"; break;
>>  	case V4L2_PIX_FMT_XRGB32:	descr = "32-bit XRGB 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_BGRA32:	descr = "32-bit ABGR 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_BGRX32:	descr = "32-bit XBGR 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_RGBA32:	descr = "32-bit RGBA 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_RGBX32:	descr = "32-bit RGBX 8-8-8-8"; break;
>>  	case V4L2_PIX_FMT_GREY:		descr = "8-bit Greyscale"; break;
>>  	case V4L2_PIX_FMT_Y4:		descr = "4-bit Greyscale"; break;
>>  	case V4L2_PIX_FMT_Y6:		descr = "6-bit Greyscale"; break;
>> @@ -1301,13 +1317,14 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>  	case V4L2_SDR_FMT_PCU16BE:	descr = "Planar Complex U16BE"; break;
>>  	case V4L2_SDR_FMT_PCU18BE:	descr = "Planar Complex U18BE"; break;
>>  	case V4L2_SDR_FMT_PCU20BE:	descr = "Planar Complex U20BE"; break;
>> -	case V4L2_TCH_FMT_DELTA_TD16:	descr = "16-bit signed deltas"; break;
>> -	case V4L2_TCH_FMT_DELTA_TD08:	descr = "8-bit signed deltas"; break;
>> -	case V4L2_TCH_FMT_TU16:		descr = "16-bit unsigned touch data"; break;
>> -	case V4L2_TCH_FMT_TU08:		descr = "8-bit unsigned touch data"; break;
>> +	case V4L2_TCH_FMT_DELTA_TD16:	descr = "16-bit Signed Deltas"; break;
>> +	case V4L2_TCH_FMT_DELTA_TD08:	descr = "8-bit Signed Deltas"; break;
>> +	case V4L2_TCH_FMT_TU16:		descr = "16-bit Unsigned Touch Data"; break;
>> +	case V4L2_TCH_FMT_TU08:		descr = "8-bit Unsigned Touch Data"; break;
>>  	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
>>  	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
>> -	case V4L2_META_FMT_UVC:		descr = "UVC payload header metadata"; break;
>> +	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
>> +	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
>>  
>>  	default:
>>  		/* Compressed formats */
>> @@ -1326,7 +1343,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>  		case V4L2_PIX_FMT_MPEG1:	descr = "MPEG-1 ES"; break;
>>  		case V4L2_PIX_FMT_MPEG2:	descr = "MPEG-2 ES"; break;
>>  		case V4L2_PIX_FMT_MPEG2_SLICE:	descr = "MPEG-2 Parsed Slice Data"; break;
>> -		case V4L2_PIX_FMT_MPEG4:	descr = "MPEG-4 part 2 ES"; break;
>> +		case V4L2_PIX_FMT_MPEG4:	descr = "MPEG-4 Part 2 ES"; break;
>>  		case V4L2_PIX_FMT_XVID:		descr = "Xvid"; break;
>>  		case V4L2_PIX_FMT_VC1_ANNEX_G:	descr = "VC-1 (SMPTE 412M Annex G)"; break;
>>  		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
> 

