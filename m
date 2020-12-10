Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B202D5B66
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 14:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389103AbgLJNNc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 08:13:32 -0500
Received: from comms.puri.sm ([159.203.221.185]:49000 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388611AbgLJNNW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:13:22 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id DA0ABE0E50;
        Thu, 10 Dec 2020 05:12:38 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8LlYA2yhJuS9; Thu, 10 Dec 2020 05:12:36 -0800 (PST)
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "rogerio.silva@nxp.com" <rogerio.silva@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        "kernel@puri.sm" <kernel@puri.sm>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
References: <9e09ca8b-d1bc-eaa9-d296-c4ee98882c06@puri.sm>
 <X9HpL/qlFxmZi9Vt@pendragon.ideasonboard.com>
 <X9IR7dXOkX2XBCtx@pendragon.ideasonboard.com>
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: question: CSI on imx8mq with (any) CSI2 camera / experience with
 mx6s_capture?
Message-ID: <195b62c5-5238-a75e-3206-c54efc309e94@puri.sm>
Date:   Thu, 10 Dec 2020 14:12:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <X9IR7dXOkX2XBCtx@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10.12.20 13:17, Laurent Pinchart wrote:
> Hi Martin,
> 
> On Thu, Dec 10, 2020 at 11:24:00AM +0200, Laurent Pinchart wrote:
>> On Thu, Dec 10, 2020 at 09:17:48AM +0100, Martin Kepplinger wrote:
>>> hi,
>>>
>>> TL;DR: did you use the NXP "mx6s_capture" csi bridge driver with other
>>> cameras?
>>
>> I've recently worked on camera support for i.MX8MM (whose camera IP
>> cores are, if not identical, very similar to the i.MX8MQ's). The least I
>> can say is that it was painful :-(
>>
>> I'm using an MT9M114 sensor, which can produce RAW8, RAW10 and YUV and
>> has a CSI-2 interface. My first use case is to capture RAW10, which
>> isn't supported by the mx6s_capture driver.

so did you successfully use the NXP mx6s_capture driver with that sensor 
too?

>>
>>> I try to use a CSI2 camera (hi846 I'm writing a driver for) on imx8mq:
>>> Using NXP's CSI bridge driver
>>> https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/mxc/capture/mx6s_capture.c?h=imx_5.4.0_8dxlphantom_er
>>> as well as the CSI driver itself:
>>> https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/imx8/mxc-mipi-csi2_yav.c?h=imx_5.4.0_8dxlphantom_er
>>> works fine when using the ov5640 camera with this driver:
>>> https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/mxc/capture/ov5640_mipi_v2.c?h=imx_5.4.0_8dxlphantom_er
>>>
>>> (I realize there is a CSI bridge driver in staging, but that need more
>>> work to be actually used. Of course after this the goal is to fix and
>>> use it; and mainline a CSI phy driver too.)
>>
>> I have lots of patches for this driver, which I've developed on i.MX7D
>> for a separate project. I'd like to mainline them, but this is blocked
>> by one last issue that I haven't been able to solve yet. In a nutshell,
>> the CSI writes two consecutive frames in each buffer, overflowing the
>> allocated memory. The registers that control the buffer size seem to be
>> programmed correctly as far as I can tell. I've reported this issue to
>> NXP but haven't received any feedback yet.

that's different from where I am. So you don't get any interrupt (EOF or 
other) when only *one* frame is written into one buffer?

>>
>> I've also added support for i.MX8MM to this driver, but haven't been
>> able to capture RAW8, RAW10 or YUV successfully. YUV produces the "best
>> images", but seems to drop 3 out of 4 consecutive pixels. The sensor
>> driver has been tested successfully on i.MX6 so I don't think it's the
>> most likely cause of issues, but I can't rule out bugs on that side
>> either. The i.MX8 reference manuals describe the MIPI_CSI and CSI IP
>> cores but doesn't tell much about how the two are connected, so I have
>> lots of unanswered questions about the register fields that control the
>> interface between those IP cores. I'm pretty sure there are issues in
>> that area of the drivers, but I've tested all combinations I could think
>> of, without luck.
>>
>>> Now I use said NXP's CSI drivers on mainline without problems with the
>>> ov5640. For the hi846 (as an example), I want to use a different
>>> pixelformat and CSI media bus format. Describing, say,
>>> MEDIA_BUS_FMT_SBGGR10_1X10 in the driver lets mx6s_capture find it; but
>>> as soon as I try to add a different pixelformat than V4L2_PIX_FMT_UYVY in:
>>> https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/mxc/capture/mx6s_capture.c?h=imx_5.4.0_8dxlphantom_er#n244
>>> streaming won't start anymore: "not negotiated, -4" and the
>>> "mx6s_vidioc_enum_framesizes" ioctl is not called anymore. Why so?
>>
>> That will likely be the easy part of the problem. The NXP driver doesn't
>> support RAW10 at all, so you will have to add that, and I don't think it
>> will be easy.

the staging driver (imx7-media-csi) sets PIXEL_BIT (cr1) and 
BIT_MIPI_DATA_FORMAT_RAW10 (cr18) which I hoped to be enough for 
supporting RAW10. What else do you think is missing?

>>
>> I'll push my development branch shortly if you're interested in trying
>> the mainline driver.
> 
> 	git://linuxtv.org/pinchartl/media.git imx/csi/imx8
> 
> The topmost patches are random debugging tests.

Thanks a lot. I'll definitely have a look and try running imx7-media-csi 
once more.

> 
>>> I didn't find much when comparing strace from "gst-launch-1.0 v4l2src !
>>> video/x-raw,width=1280,height=720 ! videoconvert ! xvimagesink" (which
>>> is how I test).
>>>
>>> When I simply use V4L2_PIX_FMT_UYVY I *do* get interrupts (in mx6s) but
>>> only "FIELD0_INT" (and drawing at this point suggests that buffer 1 is
>>> not yet full and "distorted" in a wrong format, which could explain why
>>> DMA is never completed in order to create a full frame).
>>>
>>> Now this is details, but the hi846 camera uses a 10bit CSI format and
>>> therefore I need to set PIXEL_BIT in cr1 too, but when I do that for
>>> example, I don't get "FIELD0_INT" anymore (only SFF_OR_INT and of course
>>> the "base address switching Change Err").
>>>
>>> Do you have experience with using this driver with other cameras and can
>>> point me in a direction that might help me?
>>>
>>> If you want to look at the work-in-progress driver:
>>> https://source.puri.sm/martin.kepplinger/linux-next/-/blob/hi846/drivers/media/i2c/hi846.c
> 
