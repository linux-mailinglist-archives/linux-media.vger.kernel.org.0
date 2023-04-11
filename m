Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B76D6DDA09
	for <lists+linux-media@lfdr.de>; Tue, 11 Apr 2023 13:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjDKLt1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Apr 2023 07:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjDKLtM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Apr 2023 07:49:12 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7BB449A
        for <linux-media@vger.kernel.org>; Tue, 11 Apr 2023 04:49:06 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pmCUi-0001CC-Ck; Tue, 11 Apr 2023 13:49:04 +0200
Message-ID: <e66fceb5-6621-54bb-cffb-66889941cf17@leemhuis.info>
Date:   Tue, 11 Apr 2023 13:49:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown
 pixelformats
Content-Language: en-US, de-DE
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     regressions@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1681213746;ebd2192d;
X-HE-SMSGID: 1pmCUi-0001CC-Ck
X-Spam-Status: No, score=-2.2 required=5.0 tests=NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29.03.23 14:28, Hans Verkuil wrote:
> If the fcc is 0 (indicating an unknown GUID format), then fill in the
> description field in ENUM_FMT. Otherwise the V4L2 core will WARN.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")

Thx for working on this.

Would be good to have Reported-by and Link tags for any reports about
the issue; I'm aware of the following two, maybe there were more:

https://bugzilla.kernel.org/show_bug.cgi?id=217252
https://bugzilla.redhat.com/show_bug.cgi?id=2180107

And a Cc: <stable@vger.kernel.org> # 5.15.x would likely be good as
well, as the culprit was backported.

But I write for a different reason: how urgent is this fix? Is this
"just" fixing a kernel warning, or do users notice this as some apps
crash? The bugzilla.redhat.com ticket's subject indicates it's the
latter; and I think I saw someone else mentioning that this leads to
crashes, but maybe I'm mixing things up.

Because if this fixes a crash, it afaics would be good to get this fixed
rather sooner than later in mainline, so that it can be fixed in stable
as well.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.


> ---
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 7aefa76a42b3..2f1ced1212cd 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>  		} else {
>  			dev_info(&streaming->intf->dev,
>  				 "Unknown video format %pUl\n", &buffer[5]);
> +			snprintf(format->name, sizeof(format->name), "%pUl\n",
> +				 &buffer[5]);
> +
>  			format->fcc = 0;
>  		}
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 35453f81c1d9..fc6f9e7d8506 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>  	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
>  		fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
>  	fmt->pixelformat = format->fcc;
> +	if (format->name[0])
> +		strscpy(fmt->description, format->name,
> +			sizeof(fmt->description));
> +
>  	return 0;
>  }
> 
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 9a596c8d894a..22656755a801 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -264,6 +264,8 @@ struct uvc_format {
>  	u32 fcc;
>  	u32 flags;
> 
> +	char name[32];
> +
>  	unsigned int nframes;
>  	struct uvc_frame *frame;
>  };
> 
> 
> 
