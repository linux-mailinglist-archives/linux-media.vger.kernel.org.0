Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9E03718075
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 14:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236059AbjEaMzo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 08:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236058AbjEaMzn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 08:55:43 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88003E57
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 05:55:08 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1q4LLT-0007WS-8M; Wed, 31 May 2023 14:54:31 +0200
Message-ID: <6d3eb0a9-b91e-b3c7-55ca-c0320f88b2b9@leemhuis.info>
Date:   Wed, 31 May 2023 14:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown
 pixelformats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
 <a47b5d61-f512-22ca-ca75-5f7ec40c5af7@leemhuis.info>
 <20230531124401.GG27043@pendragon.ideasonboard.com>
Content-Language: en-US, de-DE
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230531124401.GG27043@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1685537708;fbbd1c38;
X-HE-SMSGID: 1q4LLT-0007WS-8M
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31.05.23 14:44, Laurent Pinchart wrote:
> Hi Thorsten,
> 
> On Wed, May 31, 2023 at 01:48:51PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 29.03.23 14:28, Hans Verkuil wrote:
>>> If the fcc is 0 (indicating an unknown GUID format), then fill in the
>>> description field in ENUM_FMT. Otherwise the V4L2 core will WARN.
>>
>> What happened to this? It seems this fall through the cracks.
> 
> I've posted a better fix,

You mean an even better fix, as this one already was a better fix for a
earlier fix ;)

> see
> https://lore.kernel.org/linux-media/20230506065809.24645-1-laurent.pinchart@ideasonboard.com/.
> Of course, fate had it that it got reviewed exactly on the day when I started by holidays :-S

:-D

> I'm now back, and will send a pull request.

In that case: welcome back.

>> BTW:
>>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>
>> Afaics it might be good to have these in here:
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217252
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2180107
> 
> I'll add those two links.

Great, many thx!

Ciao, Thorsten

>> A comment in the former is what brought me here.
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> If I did something stupid, please tell me, as explained on that page.
>>
>> #regzbot ^backmonitor:
>> https://lore.kernel.org/lkml/dc8e5276-ef88-648f-9f0d-10151ea62c90@leemhuis.info/
>> #regzbot poke
>>
>>> Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
>>> ---
>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>> index 7aefa76a42b3..2f1ced1212cd 100644
>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>> @@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>>>  		} else {
>>>  			dev_info(&streaming->intf->dev,
>>>  				 "Unknown video format %pUl\n", &buffer[5]);
>>> +			snprintf(format->name, sizeof(format->name), "%pUl\n",
>>> +				 &buffer[5]);
>>> +
>>>  			format->fcc = 0;
>>>  		}
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>>> index 35453f81c1d9..fc6f9e7d8506 100644
>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>> @@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>>>  	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
>>>  		fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
>>>  	fmt->pixelformat = format->fcc;
>>> +	if (format->name[0])
>>> +		strscpy(fmt->description, format->name,
>>> +			sizeof(fmt->description));
>>> +
>>>  	return 0;
>>>  }
>>>
>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>> index 9a596c8d894a..22656755a801 100644
>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>> @@ -264,6 +264,8 @@ struct uvc_format {
>>>  	u32 fcc;
>>>  	u32 flags;
>>>
>>> +	char name[32];
>>> +
>>>  	unsigned int nframes;
>>>  	struct uvc_frame *frame;
>>>  };
> 
