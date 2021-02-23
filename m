Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDFA32277C
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 10:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhBWJHb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 04:07:31 -0500
Received: from comms.puri.sm ([159.203.221.185]:60170 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231523AbhBWJFf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 04:05:35 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 541A5E0327;
        Tue, 23 Feb 2021 01:04:53 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SlDxycFObY5p; Tue, 23 Feb 2021 01:04:51 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
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
 <195b62c5-5238-a75e-3206-c54efc309e94@puri.sm>
 <X9JG/d1le9xZlI4i@pendragon.ideasonboard.com>
 <c13b2f47-7e15-97b6-f523-93afc009ebdf@puri.sm>
 <X+ISOvor/SO55dKw@pendragon.ideasonboard.com>
 <1279ef68-cbed-dd60-fc2e-2e1d02319563@puri.sm>
Subject: Re: question: CSI on imx8mq with (any) CSI2 camera / experience with
 mx6s_capture?
Message-ID: <21342432-09ae-a096-1d9f-35e4333e9783@puri.sm>
Date:   Tue, 23 Feb 2021 10:04:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <1279ef68-cbed-dd60-fc2e-2e1d02319563@puri.sm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22.12.20 16:55, Martin Kepplinger wrote:
> On 22.12.20 16:35, Laurent Pinchart wrote:
>> Hi Martin,
>>
>> On Tue, Dec 22, 2020 at 03:06:28PM +0100, Martin Kepplinger wrote:
>>> On 10.12.20 17:04, Laurent Pinchart wrote:
>>>> On Thu, Dec 10, 2020 at 02:12:30PM +0100, Martin Kepplinger wrote:
>>>>> On 10.12.20 13:17, Laurent Pinchart wrote:
>>>>>> On Thu, Dec 10, 2020 at 11:24:00AM +0200, Laurent Pinchart wrote:
>>>>>>> On Thu, Dec 10, 2020 at 09:17:48AM +0100, Martin Kepplinger wrote:
>>>>>>>> hi,
>>>>>>>>
>>>>>>>> TL;DR: did you use the NXP "mx6s_capture" csi bridge driver with 
>>>>>>>> other
>>>>>>>> cameras?
>>>>>>>
>>>>>>> I've recently worked on camera support for i.MX8MM (whose camera IP
>>>>>>> cores are, if not identical, very similar to the i.MX8MQ's). The 
>>>>>>> least I
>>>>>>> can say is that it was painful :-(
>>>>>>>
>>>>>>> I'm using an MT9M114 sensor, which can produce RAW8, RAW10 and 
>>>>>>> YUV and
>>>>>>> has a CSI-2 interface. My first use case is to capture RAW10, which
>>>>>>> isn't supported by the mx6s_capture driver.
>>>>>
>>>>> so did you successfully use the NXP mx6s_capture driver with that 
>>>>> sensor
>>>>> too?
>>>>
>>>> I haven't tried. The mx6s_capture driver and the mainline driver 
>>>> share a
>>>> similar architecture, as they came from the same code base. They have
>>>> diverged, with the  mainline driver receiving bug fixes and new
>>>> features, and my large no-yet-upstreamed patch series adds lots of 
>>>> fixes
>>>> that are required for the mt9m114 driver to work with the driver. For
>>>> that reason, I've considered that porting the mt9m114 driver to the NXP
>>>> mx6s_capture, and fixing the same issues in the mx6s_capture driver 
>>>> than
>>>> were present in the mainline driver, would require lots of time for
>>>> likely very little gain.
>>>>
>>>> That being said, I've compared the two drivers, and I haven't seen
>>>> anything in mx6s_capture that would address the specific issues I'm
>>>> facing. I've ordered yesterday an i.MX8MM EVK with an OV5640 camera
>>>> module, and I will test those with the mainline driver. If they don't
>>>> work, and assuming the NXP kernel driver works on that platform, I'll
>>>> have two code bases to compare.
>>>>
>>>>>>>> I try to use a CSI2 camera (hi846 I'm writing a driver for) on 
>>>>>>>> imx8mq:
>>>>>>>> Using NXP's CSI bridge driver
>>>>>>>> https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/mxc/capture/mx6s_capture.c?h=imx_5.4.0_8dxlphantom_er 
>>>>>>>>
>>>>>>>> as well as the CSI driver itself:
>>>>>>>> https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/imx8/mxc-mipi-csi2_yav.c?h=imx_5.4.0_8dxlphantom_er 
>>>>>>>>
>>>>>>>> works fine when using the ov5640 camera with this driver:
>>>>>>>> https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/mxc/capture/ov5640_mipi_v2.c?h=imx_5.4.0_8dxlphantom_er 
>>>>>>>>
>>>>>>>>
>>>>>>>> (I realize there is a CSI bridge driver in staging, but that 
>>>>>>>> need more
>>>>>>>> work to be actually used. Of course after this the goal is to 
>>>>>>>> fix and
>>>>>>>> use it; and mainline a CSI phy driver too.)
>>>>>>>
>>>>>>> I have lots of patches for this driver, which I've developed on 
>>>>>>> i.MX7D
>>>>>>> for a separate project. I'd like to mainline them, but this is 
>>>>>>> blocked
>>>>>>> by one last issue that I haven't been able to solve yet. In a 
>>>>>>> nutshell,
>>>>>>> the CSI writes two consecutive frames in each buffer, overflowing 
>>>>>>> the
>>>>>>> allocated memory. The registers that control the buffer size seem 
>>>>>>> to be
>>>>>>> programmed correctly as far as I can tell. I've reported this 
>>>>>>> issue to
>>>>>>> NXP but haven't received any feedback yet.
>>>>>
>>>>> that's different from where I am. So you don't get any interrupt 
>>>>> (EOF or
>>>>> other) when only *one* frame is written into one buffer?
>>>>
>>>> I don't get any FB1_DMA_DONE or FB2_DMA_DONE interrupt at least. I
>>>> haven't checked other interrupts. I thus get half of the frame rate. If
>>>> I configure the CSI_CSIIMAG_PARA register with half of the actual image
>>>> height, buffers then contain a single image and the frame rate goes to
>>>> the expected value. That gives me a workaround, but without
>>>> understanding the root cause, I'm worried that just halving the height
>>>> would introduce other breakages.
>>>
>>> Hi Laurent,
>>>
>>> Thanks a lot, exchanging things this way alone is much appreciated. I'll
>>> give you detailed feedback on the staging drivers later - I tried
>>> running them, they probe but still a (gstreamer) stream would not start.
>>> But most all of your addition make a lot of sense.
>>>
>>> Just so you know, to emphasize that once more: I'm still on the nxp
>>> drivers (yes, they are very similar) just because the ov56 cam works
>>> with them over here.
>>
>> I've recently bought an i.MX8MM EVK, with the OV5647 camera module, and
>> when I try to capture images, with the NXP kernel, I just don't get any.
>> *sigh* I'll have to debug that.
> 
> oh you have it already. very good.
> 
> I guess the nxp kernel directly *should* work, but I use a kernel based 
> on v5.9.X and include the drivers like so:
> https://source.puri.sm/Librem5/linux-next/-/commit/ed8f567432d776d21cb7160c03e3272826a5f316 
> 
> https://source.puri.sm/Librem5/linux-next/-/commit/8d93a2cfd485d404741560dcb2f22da548f54ebc 
> 
> 
>>
>>> The main problem I have is that, as soon as I try
>>> to use a different pixelformat than V4L2_PIX_FMT_YUYV that basically
>>> nothing works anymore. userspace stops to "be interested" pretty soon.
>>>
>>> If I do (wrongly) use that pixelformat, I do get (only) one frame (dma)
>>> completed, the usual way.
>>>
>>> And when I break the ov56 by using a wrong pixelformat in mx6s_capture
>>> (nxp bridge driver), I get equally get only one frame (dma) completed 
>>> there.
>>>
>>> How can I make this thing use a different pixelformat (by setting the
>>> media bus format in the sensor driver)?
>>
>> All the components have to support the format you want to capture. This
>> includes the CSI driver, the MIPI_CSI driver, and the OV5647 driver. The
>> pixel format only matters in the CSI driver, for the other two it's the
>> media bus format that matters. To capture raw bayer data, you'll first
>> need to extend the OV5640 driver to support the corresponding media bus
>> format (and of course configure the sensor to output that format), then
>> the MIPI_CSI driver to support that media bus format as well, and
>> finally the CSI driver.
> 
> ok, the sensor I work with outputs raw bayer only, and that sounds like 
> I should pay more attention to the mipi csi driver.
> 
> that links to my experiments I occasionally update:
> https://source.puri.sm/martin.kepplinger/linux-next/-/commits/hi846
> 
>>
>>> thanks again for sharing your code early. have a nice rest of the year,
>>
> 
> thanks,
>                                 martin

hi Laurent, how are you? Am I right in that you tried to run the ov5640 
mainline driver with the CSI bridge staging driver on imx8mq? Which mipi 
driver would you then use? Did you have progress in that area and in 
resolving things in order to push some of your changes out?

I'm still struggling with the different sensor I want to use on imx8mq 
(hi846) and I still use the nxp bsp drivers for mipi and csi bridge:

I was able to add and fix a few things and get some kind of image at 
least, but there's still definitely some sizes or timings wrong (in 
every resolution mode I think). 1280x720 shows it clearly as the image 
looks "almost" normal only when I resize it to 916 pixel width. Also, it 
"shifts" with later frames. For a few images of this, see

https://source.puri.sm/Librem5/linux-next/-/issues/43#note_143875

I just wanted to describe the above just in case you've seen something 
like that during your experiments with sensors and can point me to 
places to look at. I do think that the SoC side should be ok now (but 
still now 100% sure), but many sensors are similar and maybe you have 
ideas there too.

anyways, thanks for looking at this and as soon as I have a satisfying 
image with my current setup, I'll switch to the staging csi driver. But 
there's no driver for the mipi ("phy") in staging for imx8mq, right?

thanks!

                               martin
