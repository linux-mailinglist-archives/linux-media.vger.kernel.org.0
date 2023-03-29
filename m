Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E536CD89C
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 13:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjC2LkO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 07:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjC2LkN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 07:40:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E61F9E
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 04:40:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 124E3B822E3
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 11:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01188C4339B;
        Wed, 29 Mar 2023 11:40:07 +0000 (UTC)
Message-ID: <6c6d200b-df15-19cf-6424-7e3dbe56ea44@xs4all.nl>
Date:   Wed, 29 Mar 2023 13:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: v4l2-core: v4l2-ioctl: Printing log with
 dev_warn() when the pixelformat is unknown
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Xiu Jianfeng <xiujianfeng@huawei.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-media@vger.kernel.org
References: <20230327091051.404184-1-hpa@redhat.com>
 <a00be1f0-462f-4004-4250-cdceff0c4e12@redhat.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <a00be1f0-462f-4004-4250-cdceff0c4e12@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/03/2023 13:05, Hans de Goede wrote:
> Hi,
> 
> On 3/27/23 11:10, Kate Hsuan wrote:
>> The original implementation used WARN() to notify the user of the "unknown
>> pixelformat" error. If fmt->description can be found, the function will
>> simply return without warnings. Recently, the description had removed from
>> uvc since v4l_fill_fmtdesc() can provide such kind of information. However,
>> for some of the USB cameras, such as Intel Realsense F200 returns unknown
>> format when probe(). Thus, the WARN() message shows and confuses the user.
>> This work changed WARN() to dev_warn() to reduce the severity of the
>> message.
>>
>> The returned video format of Intel RealSense F200 is shown as follows.
>> kernel: uvcvideo 2-7:1.3: Unknown video format 52564e49-2d90-4a58-920b-773f1f2c556b
>> kernel: uvcvideo 2-7:1.3: Unknown video format 49524e49-2d90-4a58-920b-773f1f2c556b
>> kernel: uvcvideo 2-7:1.3: Unknown video format 494c4552-1314-f943-a75a-ee6bbf012e23
>> kernel: usb 2-7: Found UVC 1.10 device Intel(R) RealSense(TM) 3D Camera (Front F200) (8086:0a66)
>>
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2180107
>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Regards,
> 
> Hans
> 
> 
>> ---
>>  drivers/media/v4l2-core/v4l2-ioctl.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 87f163a89c80..aae987243a5b 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1246,7 +1246,7 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
>>  	return ops->vidioc_enum_output(file, fh, p);
>>  }
>>  
>> -static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>> +static void v4l_fill_fmtdesc(struct video_device *vdev, struct v4l2_fmtdesc *fmt)
>>  {
>>  	const unsigned sz = sizeof(fmt->description);
>>  	const char *descr = NULL;
>> @@ -1504,7 +1504,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>  		default:
>>  			if (fmt->description[0])
>>  				return;
>> -			WARN(1, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);
>> +			dev_warn(&vdev->dev, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);

I don't really like fixing this here. The real cause is in the uvc driver
where it doesn't fill in the description for these non-standard formats.

A typical driver really should WARN here.

>>  			flags = 0;
>>  			snprintf(fmt->description, sz, "%p4cc",
>>  				 &fmt->pixelformat);
>> @@ -1589,7 +1589,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>>  		break;
>>  	}
>>  	if (ret == 0)
>> -		v4l_fill_fmtdesc(p);
>> +		v4l_fill_fmtdesc(vdev, p);
>>  	return ret;
>>  }
>>  
> 

I'll post a new patch fixing this just in uvc.

Regards,

	Hans
