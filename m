Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B09BDD6FAD
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 08:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfJOGpA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 02:45:00 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:37709 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726052AbfJOGpA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 02:45:00 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KGZiiNu7fop0AKGZmiiqdn; Tue, 15 Oct 2019 08:44:58 +0200
Subject: Re: [PATCHv6 3/3] v4l2-dev: fix is_tch checks
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20191014084021.54191-1-hverkuil-cisco@xs4all.nl>
 <20191014084021.54191-4-hverkuil-cisco@xs4all.nl>
 <20191014214221.GG23442@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7e1e1ec2-6521-bbac-9e4c-b338e12ebfa4@xs4all.nl>
Date:   Tue, 15 Oct 2019 08:44:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014214221.GG23442@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBylimrFCGtb5loHEmAQRp20dvzXy6/k0zNQTta1mdlhWlI3ZiZx1j8/YT+Q47qyBeWOkicWCONppeg4BsjYeYnC9gmKZEYeMI2rfD15Qw6/Fp/FNdkN
 W83txwYNUJUbiSdpevU6virpYOTc6hjdWh3+uiZGEz1dgq0F0+9mhghPyidhkDEAZS5aqmpTboOek7H72tOYDh//v4FwS4o5jbax58lsyuzmOzUtizpIvy8k
 Vdw297QF2bqIvbpCQXTqqUjxkwMkyzz26CT8g5aVPHsrP4txM18hTCcgiQdI+AU0xon7FiKCYOxM/R9lFareJA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/14/19 11:42 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Mon, Oct 14, 2019 at 10:40:21AM +0200, Hans Verkuil wrote:
>> Touch devices mark too many ioctls as valid. Restrict the list of
>> valid ioctls for touch devices.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/v4l2-core/v4l2-dev.c | 24 ++++++++++++++++++------
>>  1 file changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index 27fb96a6c2a8..cec588b04711 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -596,8 +596,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>  	if (ops->vidioc_enum_freq_bands || ops->vidioc_g_tuner || ops->vidioc_g_modulator)
>>  		set_bit(_IOC_NR(VIDIOC_ENUM_FREQ_BANDS), valid_ioctls);
>>  
>> -	if (is_vid || is_tch) {
>> -		/* video and touch specific ioctls */
>> +	if (is_vid) {
>> +		/* video specific ioctls */
>>  		if ((is_rx && (ops->vidioc_enum_fmt_vid_cap ||
>>  			       ops->vidioc_enum_fmt_vid_overlay)) ||
>>  		    (is_tx && ops->vidioc_enum_fmt_vid_out))
>> @@ -675,6 +675,19 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>  			       ops->vidioc_try_fmt_sliced_vbi_out)))
>>  			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
>>  		SET_VALID_IOCTL(ops, VIDIOC_G_SLICED_VBI_CAP, vidioc_g_sliced_vbi_cap);
>> +	} else if (is_tch) {
>> +		/* touch specific ioctls */
>> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_vid_cap);
>> +		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_vid_cap);
>> +		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_vid_cap);
>> +		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_vid_cap);
>> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMESIZES, vidioc_enum_framesizes);
>> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMEINTERVALS, vidioc_enum_frameintervals);
>> +		SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
>> +		SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
>> +		SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
>> +		SET_VALID_IOCTL(ops, VIDIOC_G_PARM, vidioc_g_parm);
>> +		SET_VALID_IOCTL(ops, VIDIOC_S_PARM, vidioc_s_parm);
>>  	} else if (is_sdr && is_rx) {
>>  		/* SDR receiver specific ioctls */
>>  		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_sdr_cap);
>> @@ -702,8 +715,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>  		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
>>  	}
>>  
>> -	if (is_vid || is_vbi || is_tch || is_meta) {
>> -		/* ioctls valid for video, vbi, touch and metadata */
>> +	if (is_vid || is_vbi || is_meta) {
>> +		/* ioctls valid for video, vbi and metadata */
>>  		if (ops->vidioc_s_std)
>>  			set_bit(_IOC_NR(VIDIOC_ENUMSTD), valid_ioctls);
>>  		SET_VALID_IOCTL(ops, VIDIOC_S_STD, vidioc_s_std);
>> @@ -727,8 +740,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>  			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
>>  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
>>  		}
>> -		if (ops->vidioc_g_parm || (vdev->vfl_type == VFL_TYPE_GRABBER &&
>> -					ops->vidioc_g_std))
>> +		if (ops->vidioc_g_parm || ops->vidioc_g_std)
>>  			set_bit(_IOC_NR(VIDIOC_G_PARM), valid_ioctls);
> 
> This will become potentially valid for VBI devices, is it intended ?

Actually, it wasn't intended, but it is correct :-)

VBI devices can have G_STD, and therefor G_PARM.

> 
>>  		SET_VALID_IOCTL(ops, VIDIOC_S_PARM, vidioc_s_parm);
>>  		SET_VALID_IOCTL(ops, VIDIOC_S_DV_TIMINGS, vidioc_s_dv_timings);
> 

Regards,

	Hans
