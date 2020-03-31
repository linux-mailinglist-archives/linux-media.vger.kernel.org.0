Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62BEC199E15
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 20:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgCaSdt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 14:33:49 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5958 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgCaSds (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 14:33:48 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e838ca90000>; Tue, 31 Mar 2020 11:32:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 31 Mar 2020 11:33:46 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 31 Mar 2020 11:33:46 -0700
Received: from [10.2.164.193] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 31 Mar
 2020 18:33:41 +0000
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
 <6aa7d86c-3943-d508-ccf6-5ac46546abe9@nvidia.com>
Message-ID: <3b00a559-992a-2da9-92b1-bee44e137ba2@nvidia.com>
Date:   Tue, 31 Mar 2020 11:33:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6aa7d86c-3943-d508-ccf6-5ac46546abe9@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585679529; bh=iqtImQy3Nbi2MbQ7K+pVDgNJq0j3mtfA2TtCkJ9RuG4=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=pBERZ8MD0ol5rkH9OxWSZhoz/7fUu4N0axJ55Y6kS70dgN0vz79jzTS7fEnPMusaF
         m2hZBVBgaulCzdzRRnPEr9s8lRIuVq/9nCH9EOZCccjzwubnCI7Hhjr18fGgmBO2TR
         0+A79EE07tnflJUxprw5eB61PtnuIMvP1FsIFWhEQgzFWqEv5LSCPJh3KdgVPuw3m0
         ZjmhVDjdiBnKDwqojgTbbOKCtsTegJfUcZPCRQAjLL2gwEeHWbv+ksEHuZJiaN1/xb
         OXvQ0haJB6UUrU/xSbF8Lh5TDA82vR8TANzSlsiA7dM+DB73FEiCtCFGKJ/rlmroYV
         WEVlbastrY8kw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/31/20 9:40 AM, Sowjanya Komatineni wrote:
>
> On 3/31/20 4:52 AM, Laurent Pinchart wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Hello,
>>
>> On Tue, Mar 31, 2020 at 01:27:19PM +0200, Hans Verkuil wrote:
>>> On 3/31/20 1:10 PM, Sakari Ailus wrote:
>>>> On Tue, Mar 31, 2020 at 12:56:57PM +0200, Hans Verkuil wrote:
>>>>> On 3/31/20 12:32 PM, Sakari Ailus wrote:
>>>>>> On Mon, Mar 30, 2020 at 12:59:15PM +0200, Hans Verkuil wrote:
>>>>>>> On 3/25/20 12:03 PM, Sakari Ailus wrote:
>>>>>>>> On Mon, Mar 23, 2020 at 10:52:32AM -0700, Sowjanya Komatineni=20
>>>>>>>> wrote:
>>>>>>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>>>>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>>>>>>
>>>>>>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and=20
>>>>>>>>> can
>>>>>>>>> capture from an external camera sensor connected to CSI or from
>>>>>>>>> built-in test pattern generator.
>>>>>>>>>
>>>>>>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>>>>>>
>>>>>>>>> This patch adds a V4L2 media controller and capture driver=20
>>>>>>>>> support
>>>>>>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>>> ---
>>>>>>>>> =C2=A0 drivers/staging/media/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +
>>>>>>>>> =C2=A0 drivers/staging/media/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
>>>>>>>>> =C2=A0 drivers/staging/media/tegra/Kconfig=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 10 +
>>>>>>>>> =C2=A0 drivers/staging/media/tegra/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 8 +
>>>>>>>>> =C2=A0 drivers/staging/media/tegra/TODO=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +
>>>>>>>>> =C2=A0 drivers/staging/media/tegra/tegra-common.h | 263 +++++++
>>>>>>>>> =C2=A0 drivers/staging/media/tegra/tegra-csi.c=C2=A0=C2=A0=C2=A0 =
| 522 ++++++++++++++
>>>>>>>>> =C2=A0 drivers/staging/media/tegra/tegra-csi.h=C2=A0=C2=A0=C2=A0 =
| 118 ++++
>>>>>>>>> =C2=A0 drivers/staging/media/tegra/tegra-vi.c=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1058=20
>>>>>>>>> ++++++++++++++++++++++++++++
>>>>>>>>> =C2=A0 drivers/staging/media/tegra/tegra-vi.h=C2=A0=C2=A0=C2=A0=
=C2=A0 | 83 +++
>>>>>>>>> =C2=A0 drivers/staging/media/tegra/tegra-video.c=C2=A0 | 129 ++++
>>>>>>>>> =C2=A0 drivers/staging/media/tegra/tegra-video.h=C2=A0 | 32 +
>>>>>>>>> =C2=A0 drivers/staging/media/tegra/tegra210.c=C2=A0=C2=A0=C2=A0=
=C2=A0 | 754=20
>>>>>>>>> ++++++++++++++++++++
>>>>>>>>> =C2=A0 drivers/staging/media/tegra/tegra210.h=C2=A0=C2=A0=C2=A0=
=C2=A0 | 192 +++++
>>>>>>>> Why staging? Are there reasons not to aim this to the kernel=20
>>>>>>>> proper right
>>>>>>>> away? If you only support TPG, the driver may not have too many=20
>>>>>>>> (if any)
>>>>>>>> real users anyway.
>>>>>>>>
>>>>>>>>> =C2=A0 14 files changed, 3182 insertions(+)
>>>>>>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/Kconfig
>>>>>>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/Makefile
>>>>>>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/TODO
>>>>>>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-commo=
n.h
>>>>>>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>>>>>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>>>>>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>>>>>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>>>>>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-video=
.c
>>>>>>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-video=
.h
>>>>>>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>>>>>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>>>>>>
>>>>>>> <snip>
>>>>>>>
>>>>>>>>> +static int tegra_channel_g_input(struct file *file, void *priv,
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *i)
>>>>>>>>> +{
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *i =3D 0;
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static int tegra_channel_s_input(struct file *file, void *priv,
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int input)
>>>>>>>>> +{
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (input > 0)
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -EINVAL;
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>> +}
>>>>>>>> Please see patchset on topic "v4l2-dev/ioctl: Add=20
>>>>>>>> V4L2_CAP_IO_MC" on
>>>>>>>> linux-media; it's relevant here, too.
>>>>>>> No, it isn't. The pipeline is controlled by the driver, not by=20
>>>>>>> userspace.
>>>>>>> This is a regular video capture driver, not an ISP driver.
>>>>>> I don't think that really makes a difference, whether a device is=20
>>>>>> an ISP or
>>>>>> not, but instead what does is whether there is something to=20
>>>>>> control in its
>>>>>> pipeline that cannot be generally done through the regular V4L2=20
>>>>>> interface.
>>>>>> Even plain CSI-2 receiver drivers should be media device centric=20
>>>>>> these days
>>>>>> as doing otherwise excludes using a range of sensor drivers with=20
>>>>>> them,
>>>>>> including any possible future support for e.g. sensor embedded data.
>>>>>>
>>>>> We've been back and forth on this before for this driver. I see no=20
>>>>> reason to make things
>>>>> complicated, these are simple video pipelines for video capture.=20
>>>>> Making this media
>>>>> device centric means that existing software using the BSP version=20
>>>>> of this driver require
>>>>> a full rewrite, which is not desirable.
>>>>>
>>>>> If we are going to require CSI receiver drivers to be media=20
>>>>> centric, then that's a
>>>>> major departure of existing practice. And something that needs to=20
>>>>> be discussed first,
>>>> I'd be happy to discuss that.
>>>>
>>>> Either way, the current design is problematic as it excludes a=20
>>>> range of
>>>> camera sensors being used with the driver --- addressing of which=20
>>>> requires
>>>> converting the driver MC centric. If the driver is merged to=20
>>>> mainline, then
>>>> the user might face a Kconfig option or a module parameter to choose
>>>> between the two --- this defines uAPI behaviour after all.
>>>>
>>>> The only way to avoid that in the future is to make it MC-centric=20
>>>> right
>>>> away.
>>>>
>>>>> since that will require that support for each csi receiver driver=20
>>>>> is added to libcamera.
>>>>> Is libcamera ready for that? Are common applications using=20
>>>>> libcamera yet?
>>>>>
>>>>> Obviously, if NVIDIA decides that this is worth the effort, then I=20
>>>>> have no objection.
>>>>> But I don't think it is something we should require at this stage.
>>>> Works for me. But in that case NVIDIA should also be aware that=20
>>>> doing so
>>>> has consequences.
>>>>
>>>> We also haven't discussed what to do with old V4L2-centric drivers=20
>>>> which
>>>> you'd use with sensors that expose their own subdevs. The=20
>>>> proportion of all
>>>> sensors might not be large currently but it is almost certainly=20
>>>> bound to
>>>> grow in the future.
>>>>
>>>> FWIW, Intel ipu3-cio2 CSI-2 receiver driver is MC-centric e.g. for the
>>>> above reasons. Libcamera supports it currently. I'll let Laurent=20
>>>> (cc'd)
>>>> comment on the details.
>>> I think it would be good to at least describe in some detail what=20
>>> you gain
>>> by taking the media centric route, and what the obstacles are (loss=20
>>> of compatibility
>>> with existing applications, requiring libcamera support).
>> In this case the main gain is control of the camera sensor. Sensors can
>> appear as simple when you don't look too closely at them, but many
>> sensors (especially the ones modelled after SMIA++ and the now standard
>> - and open! - MIPI CCS specification) have 3 locations to perform
>> cropping (analog, digital and output), and 3 locations to perform
>> scaling (binning, skipping, and full-featured scaler). All of these need
>> to be controlled by userspace one way or another if you want to
>> implement proper camera algorithms, which those platforms target.
> Thanks Laurent/Sakari/Hans.
>
> Based on discussion, seems like its good to change driver now to=20
> media-centric rather than later.
>
> As Jetson is devkit and custom camera sensor module meeting spec can=20
> be used, its good to let sensor control to user space.
>
> Will look into and update to use media-centric APIs.
Will discuss this internally and will get back on this...
>>
>>> My personal feeling has always been that for ISP drivers the pros of=20
>>> making
>>> a media-centric driver outweigh the cons, but that for a standard=20
>>> video capture
>>> pipeline without complex processing blocks the cons outweigh the pros.
>>>
>>> This might change if libcamera becomes widely used, but we're not=20
>>> there yet.
>>>
>>> To be honest, I am not opposed to having a kernel config option for=20
>>> drivers
>>> like this that select the media-centric API vs a regular API, if=20
>>> that can be
>>> done without too much work. If you need full control for your=20
>>> embedded system,
>>> then you enable the option. If you want full compatibility with=20
>>> existing
>>> applications, then disable it.
>> How would distributions be supposed to handle those ? That could in the
>> end need to be a per-driver option, and it would be very messy. Maybe
>> it's unavoidable, I'm trying to figure out a way to avoid such an option
>> for sensor drivers, to decide to expose them as a single subdev or
>> multiple subdevs in order to support multiple streams CSI-2 streams, and
>> I'm not sure I'll succeed.
>>
>> --=20
>> Regards,
>>
>> Laurent Pinchart
