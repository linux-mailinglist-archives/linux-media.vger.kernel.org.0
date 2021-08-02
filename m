Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2FD3DD33F
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 11:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhHBJsO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 05:48:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58234 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbhHBJsO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Aug 2021 05:48:14 -0400
Received: from [IPv6:2a02:810a:880:f54:ede9:5646:2cc5:9a78] (unknown [IPv6:2a02:810a:880:f54:ede9:5646:2cc5:9a78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CDE561F42778;
        Mon,  2 Aug 2021 10:48:03 +0100 (BST)
Subject: Re: [EXT] Re: media: platform/rockchip/rkisp1 - v4l-compliance
 reports errors
To:     Jens Korinth <jens.korinth@trinamix.de>
References: <AM0PR04MB5825DA3C650C569F69B99EF898EB9@AM0PR04MB5825.eurprd04.prod.outlook.com>
 <CAAEAJfDjGBBO4gL3gnn7qsmMHb+2MT2LNJ_Ctt7EqRoycj934A@mail.gmail.com>
 <3a1c6ef4-603c-5d23-c999-6cdef90ffd62@collabora.com>
 <AM0PR04MB58250C5C17446561D4A18EDA98EC9@AM0PR04MB5825.eurprd04.prod.outlook.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Collabora Kernel ML <kernel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <1e53b06a-bc75-87e3-04b4-b808dc0eb3de@collabora.com>
Date:   Mon, 2 Aug 2021 11:48:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB58250C5C17446561D4A18EDA98EC9@AM0PR04MB5825.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 30.07.21 17:33, Jens Korinth wrote:
> Hi Dafna,
> 
> Thanks for your quick answer!
> 
>> Therefore you should clone the repo and compile those tools in order to use them for the driver:
> 
> Thought I did that, but it turns out I didn't pay attention to the PATH order and the system version was used, thanks!
> 
> The camera I need to support is the OV9282, which is Y10 monochrome sensor. I've had some success passing it through the ISP as SRGGB10_1x10, but it does not feel like the right way(tm). 😊 I need the raw data with as little processing as possible (though 16b extension would be nice) - any advice?

Hi,
Currently the driver does not support Y10 format. But I think that configuring the isp subdevice with SRGGB10_1x10 should work.
I think it is possible to just add Y10 format to the list of supported formats in rkisp1-isp1.c with identical data as SRGGB10_1x10:


diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index d596bc040005..051f8d45e3cc 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -59,6 +59,13 @@ static const struct rkisp1_isp_mbus_info rkisp1_isp_formats[] = {
                 .mbus_code      = MEDIA_BUS_FMT_YUYV8_2X8,
                 .pixel_enc      = V4L2_PIXEL_ENC_YUV,
                 .direction      = RKISP1_ISP_SD_SRC,
+       }, {
+               .mbus_code      = MEDIA_BUS_FMT_Y10_1X10,
+               .pixel_enc      = V4L2_PIXEL_ENC_BAYER,
+               .mipi_dt        = RKISP1_CIF_CSI2_DT_RAW10,
+               .bayer_pat      = RKISP1_RAW_RGGB,
+               .bus_width      = 10,
+               .direction      = RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
         }, {
                 .mbus_code      = MEDIA_BUS_FMT_SRGGB10_1X10,
                 .pixel_enc      = V4L2_PIXEL_ENC_BAYER,


But I don't have a monochrome camera to test it.

Thanks,
Dafna

> 
> Thanks a lot!
> Jens
> 
> -----Original Message-----
> From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Sent: Friday, July 30, 2021 12:21 PM
> To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>; Jens Korinth <jens.korinth@trinamix.de>
> Cc: linux-media@vger.kernel.org; Helen Koike <helen.koike@collabora.com>
> Subject: [EXT] Re: media: platform/rockchip/rkisp1 - v4l-compliance reports errors
> 
> Hi,
> 
> 
> On 30.07.21 00:38, Ezequiel Garcia wrote:
>> (Adding Dafna and Helen)
>>
>> On Thu, 29 Jul 2021 at 09:36, Jens Korinth <jens.korinth@trinamix.de> wrote:
>>>
>>> Hi *,
>>>
>>> I am working on a camera system on Rockchip RK3399 board (Firefly ROC-RK3399-PC-Plus). Tried to use the rkisp1 driver, but was unable to connect to the rkisp1_mainpath output node, because format negotiation failed; so I ran v4l-compliance next and found that it reports several errors (see attached report).
> 
> Hi, thanks for testing and reporting. We added some new features in order to supported the driver that also needed new code in v4l-utils in order to use v4l2-ctl and to pass compliance. Therefore you should clone the repo and compile those tools in order to use them for the driver:
> 
> git://linuxtv.org/v4l-utils.git
> 
> 
>>>
>>> Upon closer inspection I noticed in the VIDIOC_ENUM_FMT handler in
>>> drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c:1169+ that
> 
> The file rkisp1-dev.c does only the probe/remove function. The callbacks are implemented in other files.
> 
>>>
>>> 1) the "reserved" member is not zeroed,
>>> 2) the userspace pointer to the v4l2_fmtdesc f is not checked via
>>> access_ok, and
>>> 3) it isn't copied from/to userspace using copy_from_user/copy_to_user.
> 
> Those things seems to me like something that should be in the v4l2-core.
> 
> Thanks,
> Dafna
> 
>>>
>>> I'm not sure if this is necessary in general, but at least on my platform the zeroing of the reserved member only worked correctly when I added the userspace copies. But even after these fixes, v4l-compliance reports further issues in format enumeration and negotiation. Is this a known issue?
>>>
>>> Thanks!
>>> -Jens
