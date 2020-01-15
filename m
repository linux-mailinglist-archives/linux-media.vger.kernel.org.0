Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E82D013CB66
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 18:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgAORxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 12:53:15 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:48957 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726418AbgAORxP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 12:53:15 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rmqqiQLkqpLtbrmqtin4Fo; Wed, 15 Jan 2020 18:53:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579110792; bh=hNxUaL7qzAbbGfxi4mbhUyWhQYrK8rXKkLCy/OPiN5E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tH0R9p5DUUEsfFuKutnBv54Q41nNzswxDZ0tH6uVL8f1DqR7oE4klvpTjrhkBGgvx
         yAnfaKs4IRsnIbVDrMhZMfQ/X6QyuXY6CjAMoapdm/HhbTPMhLIp/gBHTZ7DwNQ2Qh
         KJ66Hr0RG8SAMK8oZ/SNiqy0sUiFGCHaTwG/z7K6We32TC+C77Lp6Swi9RCvQb3kN7
         QLWE0tZMvUX5guYbWMMYK0fXczQlUaTfTAT3TsO/2gfT/vYp8FCl8/C9eHkHLjFp1b
         oBrk8eqs6LeQ3th52ONZ9qCpWLivfkHg2PH5LBFZdokmkPExPDSNn3jfPxerHUh0Rc
         Hm3wziH4Y1lMg==
Subject: Re: [PATCH v3 RESEND] media: vimc: fla: Add virtual flash subdevice
To:     =?UTF-8?Q?Lucas_A=2e_M=2e_Magalh=c3=a3es?= <lucmaga@gmail.com>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, helen.koike@collabora.com,
        edusbarretto@gmail.com, lkcamp@lists.libreplanetbr.org
References: <20191203230148.2442-1-lucmaga@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <96e82f03-99a0-ad24-4145-242c16eacdc4@xs4all.nl>
Date:   Wed, 15 Jan 2020 18:53:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191203230148.2442-1-lucmaga@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfL3cRDZoxzH9C9M/9R7ddw48BKz64K5U4S34bocYWBdTttlSkFZgyKmLpfw23j7TVs/KPjB4HoQNYvewDaxhoiaXUV/uqPFf+jZM/MdjS3MPy2dzvpFJ
 pK9YdxbegXgWt/mis+LwJSb9MvPeBWAa9nKLXCNQ+8MsBLLucEdsCV3894xU874JPOgJ+4mTefb9/66MvYFvoh4aAmoSewIwqAv5FfTkyHMUkEDxJKuslpm4
 DfP3HuVA6G8xtYpDJLgXiY561A51NUVpqxZf47UzYfqQEfE3Mndcqr2rB7l4HHZdcGK8WxQrvMy+efQPh8JhJqhRgJuxs2JJzUJVj2vkISj/Kl6Bn4+/ZIF5
 7VY2sJWQj5x1HhqcZmljTHkmPmYgfg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lucas,

On 12/4/19 12:01 AM, Lucas A. M. Magalhães wrote:
> From: Lucas A. M. Magalhaes <lucmaga@gmail.com>
> 
> Add a virtual subdevice to simulate the flash control API.
> Those are the supported controls:
> v4l2-ctl -d /dev/v4l-subdev6 -L
> Flash Controls
> 
>                        led_mode 0x009c0901 (menu)   : min=0 max=2 default=1 value=1
>                                 0: Off
>                                 1: Flash
>                                 2: Torch
>                   strobe_source 0x009c0902 (menu)   : min=0 max=1 default=0 value=0
>                                 0: Software
>                                 1: External
>                          strobe 0x009c0903 (button) : flags=write-only, execute-on-write
>                     stop_strobe 0x009c0904 (button) : flags=write-only, execute-on-write
>                   strobe_status 0x009c0905 (bool)   : default=0 value=0 flags=read-only
>                  strobe_timeout 0x009c0906 (int)    : min=50 max=400 step=50 default=50 value=400
>            intensity_flash_mode 0x009c0907 (int)    : min=23040 max=1499600 step=11718 default=23040 value=23040
>            intensity_torch_mode 0x009c0908 (int)    : min=2530 max=187100 step=1460 default=2530 value=2530
>             intensity_indicator 0x009c0909 (int)    : min=0 max=255 step=1 default=0 value=0
>                          faults 0x009c090a (bitmask): max=0x00000002 default=0x00000000 value=0x00000000
> 
> Co-authored-by: Eduardo Barretto <edusbarretto@gmail.com>
> Signed-off-by: Eduardo Barretto <edusbarretto@gmail.com>
> Signed-off-by: Lucas A. M. Magalhães <lucmaga@gmail.com>
> 
> ---
> Hi,
> 
> I've copied some values from another driver (lm3646) to make it more
> realistic, as suggested by Hans. All values except for
> V4L2_CID_FLASH_INDICATOR_INTENSITY, which I couldn't find any
> implementation.
> 
> The v4l-compliance is failing. From the documentation
> V4L2_CID_FLASH_STROBE should just work if the
> V4L2_CID_FLASH_STROBE_SOURCE is "Software" and the
> V4L2_CID_FLASH_LED_MODE is "Flash", otherwise it should fail. With the
> standard values configured for the V4L2_CID_FLASH_STROBE will not fail.
> But during the tests v4l-compliance sets V4L2_CID_FLASH_LED_MODE to
> "Torch" and V4L2_CID_FLASH_STROBE_SOURCE to "External" which makes
> V4L2_CID_FLASH_STROBE to fail. How do I proceed? Should the
> v4l-compliance be changed?

I completely missed this question, my apologies.

The best way is to set the flash_strobe control V4L2_CTRL_FLAG_GRABBED whenever
this control is invalid. I'd also return EBUSY instead of EINVAL in
'case V4L2_CID_FLASH_STROBE:' for consistency with the GRABBED behavior.

v4l2-compliance will probably still fail since it doesn't check this flag
when testing S_CTRL/S_EXT_CTRLS, that should be added: in testSimpleControls()
it should check that the return value of S_CTRL is EBUSY if GRABBED was set.
In testExtendedControls() it should do the same when it tests VIDIOC_S_EXT_CTRLS
for a single control. And in the later test where it sets all controls in a single
VIDIOC_S_EXT_CTRL ioctl it should skip any controls marked GRABBED.

I think that's a reasonable approach.

Regards,

	Hans
