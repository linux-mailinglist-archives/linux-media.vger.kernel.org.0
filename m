Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61263694228
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 11:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjBMKAX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 05:00:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbjBMKAV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 05:00:21 -0500
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94957BDCF
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 02:00:18 -0800 (PST)
X-KPN-MessageId: 36c40178-ab85-11ed-b20d-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 36c40178-ab85-11ed-b20d-005056abbe64;
        Mon, 13 Feb 2023 11:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=2Y8MQrV0l91GypujjICRCxFZfRj4xDVzOlrqxMSWc84=;
        b=sYOJaUgjr/j4oYfjJEqHU7Xrv9srjQYpsNbaZtlhjNzjef6domDZxaqZGgU3inZ8wdkQpI4QHZO+b
         TeSM1/4v9O28IrzKf2ZkAFoIhrfb5coHUsUo6f0wi6nObxH9kkHorytiEYuefC3WphI9koV2qMF4t3
         vppmXKA2zCVG6bjQvU1xoMaXZqChsP5MP24fpqs9cZDXZzNDDG+RxPbDPyELfnz1ICbp7AnHDl+X4k
         YVksWhETJ76l+t1NN0BPAUBPjg3/DQ9W4FG9f0JpfRyYYxrkK0mWXsiskccGv+dFJlD3YPWKZToX2C
         gYxZ3v6l/uXGMoMzgCzWCKTGJOfW6tQ==
X-KPN-MID: 33|fzvBnGMtaiN+CCDCwD4kKHSZ2Mwvqy1d/vxBIOXIfBFROWTRvFD+AXHS6pyjhEa
 ASTHcX0gk2lrKWqe1Jl73iewf2QHyq6fmfM9X1Ssyznc=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|20ak5aiAIi6o+MUd+23I6G0q55HKKDHVX6wJ2QN1mKezVTEDcuVBwZvwbP6Vyt4
 Cx7obE0od6K0hGXNo9yqT/A==
X-Originating-IP: 173.38.220.58
Received: from [10.47.77.219] (unknown [173.38.220.58])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 36404a4b-ab85-11ed-ab4c-005056ab7447;
        Mon, 13 Feb 2023 11:00:15 +0100 (CET)
Message-ID: <d8716fa3-03fa-32b9-9dea-48c5d45151b0@xs4all.nl>
Date:   Mon, 13 Feb 2023 11:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/3] v4l2-ctl: Add routing and streams support
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        satish.nagireddy@getcruise.com
References: <20230210115546.199809-1-tomi.valkeinen@ideasonboard.com>
 <20230210115546.199809-2-tomi.valkeinen@ideasonboard.com>
 <c5980db0-5ef2-bcd7-79d3-f45746eaf3d0@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <c5980db0-5ef2-bcd7-79d3-f45746eaf3d0@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/13/23 10:49, Tomi Valkeinen wrote:
> Hi,
> 
> On 10/02/2023 13:55, Tomi Valkeinen wrote:
>> Add support to get and set subdev routes and to get and set
>> configurations per stream.
>>
>> Based on work from Jacopo Mondi <jacopo@jmondi.org> and
>> Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 288 +++++++++++++++++++++++++----
>>   utils/v4l2-ctl/v4l2-ctl.cpp        |   2 +
>>   utils/v4l2-ctl/v4l2-ctl.h          |   2 +
>>   3 files changed, 259 insertions(+), 33 deletions(-)
>>
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
>> index 33cc1342..81236451 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
>> @@ -1,5 +1,13 @@
>>   #include "v4l2-ctl.h"
>>   
>> +#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
>> +
>> +/*
>> + * The max value comes from a check in the kernel source code
>> + * drivers/media/v4l2-core/v4l2-ioctl.c check_array_args()
>> + */
>> +#define NUM_ROUTES_MAX 256
>> +
>>   struct mbus_name {
>>   	const char *name;
>>   	__u32 code;
>> @@ -19,45 +27,57 @@ static const struct mbus_name mbus_names[] = {
>>   #define SelectionFlags 		(1L<<4)
>>   
>>   static __u32 list_mbus_codes_pad;
>> +static __u32 list_mbus_codes_stream = 0;
>>   static __u32 get_fmt_pad;
>> +static __u32 get_fmt_stream = 0;
>>   static __u32 get_sel_pad;
>> +static __u32 get_sel_stream = 0;
>>   static __u32 get_fps_pad;
>> +static __u32 get_fps_stream = 0;
>>   static int get_sel_target = -1;
>>   static unsigned int set_selection;
>>   static struct v4l2_subdev_selection vsel;
>>   static unsigned int set_fmt;
>>   static __u32 set_fmt_pad;
>> +static __u32 set_fmt_stream = 0;
>>   static struct v4l2_mbus_framefmt ffmt;
>>   static struct v4l2_subdev_frame_size_enum frmsize;
>>   static struct v4l2_subdev_frame_interval_enum frmival;
>>   static __u32 set_fps_pad;
>> +static __u32 set_fps_stream = 0;
>>   static double set_fps;
>> +static struct v4l2_subdev_routing routing;
>> +static struct v4l2_subdev_route routes[NUM_ROUTES_MAX];
>>   
>>   void subdev_usage()
>>   {
>>   	printf("\nSub-Device options:\n"
>> -	       "  --list-subdev-mbus-codes <pad>\n"
>> +	       "  --list-subdev-mbus-codes pad=<pad>,stream=<stream>\n"
>>   	       "                      display supported mediabus codes for this pad (0 is default)\n"
>>   	       "                      [VIDIOC_SUBDEV_ENUM_MBUS_CODE]\n"
>> -	       "  --list-subdev-framesizes pad=<pad>,code=<code>\n"
>> +	       "  --list-subdev-framesizes pad=<pad>,stream=<stream>,code=<code>\n"
>>   	       "                     list supported framesizes for this pad and code\n"
>>   	       "                     [VIDIOC_SUBDEV_ENUM_FRAME_SIZE]\n"
>>   	       "                     <code> is the value of the mediabus code\n"
>> -	       "  --list-subdev-frameintervals pad=<pad>,width=<w>,height=<h>,code=<code>\n"
>> +	       "  --list-subdev-frameintervals pad=<pad>,stream=<stream>,width=<w>,height=<h>,code=<code>\n"
>>   	       "                     list supported frame intervals for this pad and code and\n"
>>   	       "                     the given width and height [VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL]\n"
>>   	       "                     <code> is the value of the mediabus code\n"
>> -	       "  --get-subdev-fmt [<pad>]\n"
>> -	       "     		     query the frame format for the given pad [VIDIOC_SUBDEV_G_FMT]\n"
>> -	       "  --get-subdev-selection pad=<pad>,target=<target>\n"
>> +	       "  --get-subdev-fmt pad=<pad>,stream=<stream>\n"
>> +	       "     		     query the frame format for the given pad and optional stream [VIDIOC_SUBDEV_G_FMT]\n"
>> +	       "		     <pad> the pad to get the format from\n"
>> +	       "		     <stream> the stream to get the format from (0 if not specified)\n"
>> +	       "  --get-subdev-selection pad=<pad>,stream=<stream>,target=<target>\n"
>>   	       "                     query the frame selection rectangle [VIDIOC_SUBDEV_G_SELECTION]\n"
>>   	       "                     See --set-subdev-selection command for the valid <target> values.\n"
>> -	       "  --get-subdev-fps [<pad>]\n"
>> +	       "  --get-subdev-fps pad=<pad>,stream=<stream>\n"
>>   	       "                     query the frame rate [VIDIOC_SUBDEV_G_FRAME_INTERVAL]\n"
> 
> Laurent noticed that the above option, and a few others, break backward 
> compatibility.
> 
> If no one has other suggestions, I'll additionally add back the old 
> option format. In other words, if the parameter is a number, it's a pad. 
> Otherwise we look for pad=<pad>,stream=<stream> style option.

That will work. Only mention the new arguments in the usage text, though.

And add a comment in the code why you check if the arg is just a number.

> 
> Well, another alternative would be to use an "extended" pad format 
> instead. I.e. for each <pad> in the old style, we'd accept something 
> like <pad[/stream]>. E.g. "--list-subdev-framesizes 
> pad=<pad[/stream]>,code=<code>"

No, that's inconsistent with the argument style of v4l2-ctl.

Note that I am not terribly concerned about backwards compatibility here,
especially w.r.t. the subdev options. So if it turns out to be too much
work to support the old option format, then I'm OK with breaking the
compatibility.

Regards,

	Hans

> 
> Opinions?
> 
>   Tomi
> 

