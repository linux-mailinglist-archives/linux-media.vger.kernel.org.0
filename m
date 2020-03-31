Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E160D199BE1
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 18:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731159AbgCaQk6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 12:40:58 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8855 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730543AbgCaQk6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 12:40:58 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8372370000>; Tue, 31 Mar 2020 09:39:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 31 Mar 2020 09:40:56 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 31 Mar 2020 09:40:56 -0700
Received: from [10.2.164.193] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 31 Mar
 2020 16:40:55 +0000
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Sakari Ailus <sakari.ailus@iki.fi>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>,
        <helen.koike@collabora.com>, <digetx@gmail.com>,
        <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <20200325110358.GB853@valkosipuli.retiisi.org.uk>
 <8bc44545-7d1e-0e37-db27-d37784679574@xs4all.nl>
 <20200331103215.GI2394@valkosipuli.retiisi.org.uk>
 <ba37eb84-392c-3767-57f6-d297b0ab79a3@xs4all.nl>
 <20200331111018.GJ2394@valkosipuli.retiisi.org.uk>
 <a1145ee4-2991-a958-1225-090c57fec533@xs4all.nl>
 <20200331115221.GA4767@pendragon.ideasonboard.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <6aa7d86c-3943-d508-ccf6-5ac46546abe9@nvidia.com>
Date:   Tue, 31 Mar 2020 09:40:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200331115221.GA4767@pendragon.ideasonboard.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585672759; bh=n5rCh0ywbFIhHesuUxzU3UQlrboysZ9JKTcQuxA/lrQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=WSwKkEA8W+oKdlxW8t1sWCcXEehJ82dxwkCuiw3e/AdtV9waMw1P1Yn0j/P0MoGkF
         l5kMKqtXgaXX8PCqsSoGss32YjhV8jXk22reBqNLI8NzmTdA3WWaxsAzgeWRRxgWg8
         5YlVkzidylDfUO7oWd0gIx/MnB+AKX5qjMuTcvwBBC4c8ZXWEpWK73yTnlyNg2VM7z
         q8YYSY8Aeit4q/BqOq3zjxtBOBYliTYu2uHN/FtNHCTL/9WL+i1Lo08uJHxeyNjxpn
         ZbEM5UdbEYh86yKAV+07Cu4ftV0u/Qdh1XYeiHYFfCqclbtsOZxG8oSgxLo70jgLuM
         X3YS7O2A9uIEQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/31/20 4:52 AM, Laurent Pinchart wrote:
> External email: Use caution opening links or attachments
>
>
> Hello,
>
> On Tue, Mar 31, 2020 at 01:27:19PM +0200, Hans Verkuil wrote:
>> On 3/31/20 1:10 PM, Sakari Ailus wrote:
>>> On Tue, Mar 31, 2020 at 12:56:57PM +0200, Hans Verkuil wrote:
>>>> On 3/31/20 12:32 PM, Sakari Ailus wrote:
>>>>> On Mon, Mar 30, 2020 at 12:59:15PM +0200, Hans Verkuil wrote:
>>>>>> On 3/25/20 12:03 PM, Sakari Ailus wrote:
>>>>>>> On Mon, Mar 23, 2020 at 10:52:32AM -0700, Sowjanya Komatineni wrote:
>>>>>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>>>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>>>>>
>>>>>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>>>>>> capture from an external camera sensor connected to CSI or from
>>>>>>>> built-in test pattern generator.
>>>>>>>>
>>>>>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>>>>>
>>>>>>>> This patch adds a V4L2 media controller and capture driver support
>>>>>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>>>>>
>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>> ---
>>>>>>>>   drivers/staging/media/Kconfig              |    2 +
>>>>>>>>   drivers/staging/media/Makefile             |    1 +
>>>>>>>>   drivers/staging/media/tegra/Kconfig        |   10 +
>>>>>>>>   drivers/staging/media/tegra/Makefile       |    8 +
>>>>>>>>   drivers/staging/media/tegra/TODO           |   10 +
>>>>>>>>   drivers/staging/media/tegra/tegra-common.h |  263 +++++++
>>>>>>>>   drivers/staging/media/tegra/tegra-csi.c    |  522 ++++++++++++++
>>>>>>>>   drivers/staging/media/tegra/tegra-csi.h    |  118 ++++
>>>>>>>>   drivers/staging/media/tegra/tegra-vi.c     | 1058 ++++++++++++++++++++++++++++
>>>>>>>>   drivers/staging/media/tegra/tegra-vi.h     |   83 +++
>>>>>>>>   drivers/staging/media/tegra/tegra-video.c  |  129 ++++
>>>>>>>>   drivers/staging/media/tegra/tegra-video.h  |   32 +
>>>>>>>>   drivers/staging/media/tegra/tegra210.c     |  754 ++++++++++++++++++++
>>>>>>>>   drivers/staging/media/tegra/tegra210.h     |  192 +++++
>>>>>>> Why staging? Are there reasons not to aim this to the kernel proper right
>>>>>>> away? If you only support TPG, the driver may not have too many (if any)
>>>>>>> real users anyway.
>>>>>>>
>>>>>>>>   14 files changed, 3182 insertions(+)
>>>>>>>>   create mode 100644 drivers/staging/media/tegra/Kconfig
>>>>>>>>   create mode 100644 drivers/staging/media/tegra/Makefile
>>>>>>>>   create mode 100644 drivers/staging/media/tegra/TODO
>>>>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-common.h
>>>>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>>>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>>>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>>>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>>>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-video.c
>>>>>>>>   create mode 100644 drivers/staging/media/tegra/tegra-video.h
>>>>>>>>   create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>>>>>>   create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>>>>>
>>>>>> <snip>
>>>>>>
>>>>>>>> +static int tegra_channel_g_input(struct file *file, void *priv,
>>>>>>>> +                               unsigned int *i)
>>>>>>>> +{
>>>>>>>> +      *i = 0;
>>>>>>>> +      return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int tegra_channel_s_input(struct file *file, void *priv,
>>>>>>>> +                               unsigned int input)
>>>>>>>> +{
>>>>>>>> +      if (input > 0)
>>>>>>>> +              return -EINVAL;
>>>>>>>> +
>>>>>>>> +      return 0;
>>>>>>>> +}
>>>>>>> Please see patchset on topic "v4l2-dev/ioctl: Add V4L2_CAP_IO_MC" on
>>>>>>> linux-media; it's relevant here, too.
>>>>>> No, it isn't. The pipeline is controlled by the driver, not by userspace.
>>>>>> This is a regular video capture driver, not an ISP driver.
>>>>> I don't think that really makes a difference, whether a device is an ISP or
>>>>> not, but instead what does is whether there is something to control in its
>>>>> pipeline that cannot be generally done through the regular V4L2 interface.
>>>>> Even plain CSI-2 receiver drivers should be media device centric these days
>>>>> as doing otherwise excludes using a range of sensor drivers with them,
>>>>> including any possible future support for e.g. sensor embedded data.
>>>>>
>>>> We've been back and forth on this before for this driver. I see no reason to make things
>>>> complicated, these are simple video pipelines for video capture. Making this media
>>>> device centric means that existing software using the BSP version of this driver require
>>>> a full rewrite, which is not desirable.
>>>>
>>>> If we are going to require CSI receiver drivers to be media centric, then that's a
>>>> major departure of existing practice. And something that needs to be discussed first,
>>> I'd be happy to discuss that.
>>>
>>> Either way, the current design is problematic as it excludes a range of
>>> camera sensors being used with the driver --- addressing of which requires
>>> converting the driver MC centric. If the driver is merged to mainline, then
>>> the user might face a Kconfig option or a module parameter to choose
>>> between the two --- this defines uAPI behaviour after all.
>>>
>>> The only way to avoid that in the future is to make it MC-centric right
>>> away.
>>>
>>>> since that will require that support for each csi receiver driver is added to libcamera.
>>>> Is libcamera ready for that? Are common applications using libcamera yet?
>>>>
>>>> Obviously, if NVIDIA decides that this is worth the effort, then I have no objection.
>>>> But I don't think it is something we should require at this stage.
>>> Works for me. But in that case NVIDIA should also be aware that doing so
>>> has consequences.
>>>
>>> We also haven't discussed what to do with old V4L2-centric drivers which
>>> you'd use with sensors that expose their own subdevs. The proportion of all
>>> sensors might not be large currently but it is almost certainly bound to
>>> grow in the future.
>>>
>>> FWIW, Intel ipu3-cio2 CSI-2 receiver driver is MC-centric e.g. for the
>>> above reasons. Libcamera supports it currently. I'll let Laurent (cc'd)
>>> comment on the details.
>> I think it would be good to at least describe in some detail what you gain
>> by taking the media centric route, and what the obstacles are (loss of compatibility
>> with existing applications, requiring libcamera support).
> In this case the main gain is control of the camera sensor. Sensors can
> appear as simple when you don't look too closely at them, but many
> sensors (especially the ones modelled after SMIA++ and the now standard
> - and open! - MIPI CCS specification) have 3 locations to perform
> cropping (analog, digital and output), and 3 locations to perform
> scaling (binning, skipping, and full-featured scaler). All of these need
> to be controlled by userspace one way or another if you want to
> implement proper camera algorithms, which those platforms target.
Thanks Laurent/Sakari/Hans.

Based on discussion, seems like its good to change driver now to 
media-centric rather than later.

As Jetson is devkit and custom camera sensor module meeting spec can be 
used, its good to let sensor control to user space.

Will look into and update to use media-centric APIs.
>
>> My personal feeling has always been that for ISP drivers the pros of making
>> a media-centric driver outweigh the cons, but that for a standard video capture
>> pipeline without complex processing blocks the cons outweigh the pros.
>>
>> This might change if libcamera becomes widely used, but we're not there yet.
>>
>> To be honest, I am not opposed to having a kernel config option for drivers
>> like this that select the media-centric API vs a regular API, if that can be
>> done without too much work. If you need full control for your embedded system,
>> then you enable the option. If you want full compatibility with existing
>> applications, then disable it.
> How would distributions be supposed to handle those ? That could in the
> end need to be a per-driver option, and it would be very messy. Maybe
> it's unavoidable, I'm trying to figure out a way to avoid such an option
> for sensor drivers, to decide to expose them as a single subdev or
> multiple subdevs in order to support multiple streams CSI-2 streams, and
> I'm not sure I'll succeed.
>
> --
> Regards,
>
> Laurent Pinchart
