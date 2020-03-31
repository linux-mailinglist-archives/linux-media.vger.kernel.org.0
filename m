Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F217A199559
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730533AbgCaL10 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:27:26 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:39935 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730180AbgCaL10 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:27:26 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id JF39j8765fHuvJF3DjAtCW; Tue, 31 Mar 2020 13:27:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585654043; bh=wsDsD2wgn34DL4JV2mO8SWwTxih7XXpbFOGmXpps14Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SzP36+QWa6gK+AsKanufIR5+nStwxxkctaR0AX5AiRSfCb86PkjJZn975cmlJ0g1Y
         n5YerNBPkCWg68zyNeu+bTk4m0e8fwMlHjuqnHP/CB+tJEpriP7h4GZNQW3XRDr4T4
         YpQv5jS4SQu5XUv60k2tD96JBcPvdZGFkV4q5ROAHvpwco89OEWeO0zKvbxLeL1Et4
         0FqYqkKkWr60t8i4iP4Y4/2nXIsft0VR9R0mx/rKH7HsSSbDvwTpRQ5O56ndAp66lB
         8r3j1OdmGSFeoIaL2jyvVLYdhFgmUVyyw2MRWfv0dz4L010/Ji3dBRtX82KM5qNlBB
         wmUD/faqCEQ8w==
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <20200325110358.GB853@valkosipuli.retiisi.org.uk>
 <8bc44545-7d1e-0e37-db27-d37784679574@xs4all.nl>
 <20200331103215.GI2394@valkosipuli.retiisi.org.uk>
 <ba37eb84-392c-3767-57f6-d297b0ab79a3@xs4all.nl>
 <20200331111018.GJ2394@valkosipuli.retiisi.org.uk>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a1145ee4-2991-a958-1225-090c57fec533@xs4all.nl>
Date:   Tue, 31 Mar 2020 13:27:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331111018.GJ2394@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBetCF78CJvsa46Wzl9zhTQodpkaVXIJqutol8gOt5GK9UE4UfT+Kxt0AGSjYM1K1OkyDBNJ/lNQ9gRYG+fgHAfcLuMEuX/dNssbwAD6KOfwuUuALgMB
 XSVj9eF8me4cR60BeW5dzoXj897MOGf/4M4cNsMNVsoUlNCuBrxn/GRBPa3VsuK4tpxVRBqc1cxAV3JHs5W0lUjW+5xUSrmhgj52HZ76fO4bT+EQiVf22gA2
 P4x1JUnAEFLBVxI5zl6d5IzYdqkjKPYaIqxzOpnxnRcs8yEn9lw+OrYt9fKj56HC1GpYK3x3Y8+7ZWJJFlrB9XfOL1PSL9TZ3jEsbKiUIt+fEqfhcvR7uyo6
 NTFlVB88fF74nRqSwaJfSpOOGL/1dYDiM4vYNkD7trtTmQIm164KVf8wpexVNrVKxDFk/dSVI2y2aHku+QmAKLNtqNWE8zWdslbeY5+GmGzpmzpLUMm2hekO
 79F6f8A/NxgB28YZg0Ono70qmBQZ1FP9po5XDf/Row2RNkZoYAUIs4HCQMmq3vmffZbHVLD/IgbFAvES3RmcnG+E7rGut6W8HTY3DLC914cy8z9nPddrxZcL
 10tZ9avMf26g5kHwvPKWwvQkWV8GD4KTsEirZaHJ4qQKBzf98B8pOWy5hnDgCexz4rw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/31/20 1:10 PM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Mar 31, 2020 at 12:56:57PM +0200, Hans Verkuil wrote:
>> On 3/31/20 12:32 PM, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Mon, Mar 30, 2020 at 12:59:15PM +0200, Hans Verkuil wrote:
>>>> On 3/25/20 12:03 PM, Sakari Ailus wrote:
>>>>> Hi Sowjanya,
>>>>>
>>>>> Thanks for the patchset.
>>>>>
>>>>> On Mon, Mar 23, 2020 at 10:52:32AM -0700, Sowjanya Komatineni wrote:
>>>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>>>
>>>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>>>> capture from an external camera sensor connected to CSI or from
>>>>>> built-in test pattern generator.
>>>>>>
>>>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>>>
>>>>>> This patch adds a V4L2 media controller and capture driver support
>>>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>>>
>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>> ---
>>>>>>  drivers/staging/media/Kconfig              |    2 +
>>>>>>  drivers/staging/media/Makefile             |    1 +
>>>>>>  drivers/staging/media/tegra/Kconfig        |   10 +
>>>>>>  drivers/staging/media/tegra/Makefile       |    8 +
>>>>>>  drivers/staging/media/tegra/TODO           |   10 +
>>>>>>  drivers/staging/media/tegra/tegra-common.h |  263 +++++++
>>>>>>  drivers/staging/media/tegra/tegra-csi.c    |  522 ++++++++++++++
>>>>>>  drivers/staging/media/tegra/tegra-csi.h    |  118 ++++
>>>>>>  drivers/staging/media/tegra/tegra-vi.c     | 1058 ++++++++++++++++++++++++++++
>>>>>>  drivers/staging/media/tegra/tegra-vi.h     |   83 +++
>>>>>>  drivers/staging/media/tegra/tegra-video.c  |  129 ++++
>>>>>>  drivers/staging/media/tegra/tegra-video.h  |   32 +
>>>>>>  drivers/staging/media/tegra/tegra210.c     |  754 ++++++++++++++++++++
>>>>>>  drivers/staging/media/tegra/tegra210.h     |  192 +++++
>>>>>
>>>>> Why staging? Are there reasons not to aim this to the kernel proper right
>>>>> away? If you only support TPG, the driver may not have too many (if any)
>>>>> real users anyway.
>>>>>
>>>>>>  14 files changed, 3182 insertions(+)
>>>>>>  create mode 100644 drivers/staging/media/tegra/Kconfig
>>>>>>  create mode 100644 drivers/staging/media/tegra/Makefile
>>>>>>  create mode 100644 drivers/staging/media/tegra/TODO
>>>>>>  create mode 100644 drivers/staging/media/tegra/tegra-common.h
>>>>>>  create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>>>>>  create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>>>>>  create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>>>>>  create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>>>>>  create mode 100644 drivers/staging/media/tegra/tegra-video.c
>>>>>>  create mode 100644 drivers/staging/media/tegra/tegra-video.h
>>>>>>  create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>>>>  create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>>>
>>>>
>>>> <snip>
>>>>
>>>>>> +static int tegra_channel_g_input(struct file *file, void *priv,
>>>>>> +				 unsigned int *i)
>>>>>> +{
>>>>>> +	*i = 0;
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int tegra_channel_s_input(struct file *file, void *priv,
>>>>>> +				 unsigned int input)
>>>>>> +{
>>>>>> +	if (input > 0)
>>>>>> +		return -EINVAL;
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>
>>>>> Please see patchset on topic "v4l2-dev/ioctl: Add V4L2_CAP_IO_MC" on
>>>>> linux-media; it's relevant here, too.
>>>>
>>>> No, it isn't. The pipeline is controlled by the driver, not by userspace.
>>>> This is a regular video capture driver, not an ISP driver.
>>>
>>> I don't think that really makes a difference, whether a device is an ISP or
>>> not, but instead what does is whether there is something to control in its
>>> pipeline that cannot be generally done through the regular V4L2 interface.
>>> Even plain CSI-2 receiver drivers should be media device centric these days
>>> as doing otherwise excludes using a range of sensor drivers with them,
>>> including any possible future support for e.g. sensor embedded data.
>>>
>>
>> We've been back and forth on this before for this driver. I see no reason to make things
>> complicated, these are simple video pipelines for video capture. Making this media
>> device centric means that existing software using the BSP version of this driver require
>> a full rewrite, which is not desirable.
>>
>> If we are going to require CSI receiver drivers to be media centric, then that's a
>> major departure of existing practice. And something that needs to be discussed first,
> 
> I'd be happy to discuss that.
> 
> Either way, the current design is problematic as it excludes a range of
> camera sensors being used with the driver --- addressing of which requires
> converting the driver MC centric. If the driver is merged to mainline, then
> the user might face a Kconfig option or a module parameter to choose
> between the two --- this defines uAPI behaviour after all.
> 
> The only way to avoid that in the future is to make it MC-centric right
> away.
> 
>> since that will require that support for each csi receiver driver is added to libcamera.
>> Is libcamera ready for that? Are common applications using libcamera yet?
>>
>> Obviously, if NVIDIA decides that this is worth the effort, then I have no objection.
>> But I don't think it is something we should require at this stage.
> 
> Works for me. But in that case NVIDIA should also be aware that doing so
> has consequences.
> 
> We also haven't discussed what to do with old V4L2-centric drivers which
> you'd use with sensors that expose their own subdevs. The proportion of all
> sensors might not be large currently but it is almost certainly bound to
> grow in the future.
> 
> FWIW, Intel ipu3-cio2 CSI-2 receiver driver is MC-centric e.g. for the
> above reasons. Libcamera supports it currently. I'll let Laurent (cc'd)
> comment on the details.
> 

I think it would be good to at least describe in some detail what you gain
by taking the media centric route, and what the obstacles are (loss of compatibility
with existing applications, requiring libcamera support).

My personal feeling has always been that for ISP drivers the pros of making
a media-centric driver outweigh the cons, but that for a standard video capture
pipeline without complex processing blocks the cons outweigh the pros.

This might change if libcamera becomes widely used, but we're not there yet.

To be honest, I am not opposed to having a kernel config option for drivers
like this that select the media-centric API vs a regular API, if that can be
done without too much work. If you need full control for your embedded system,
then you enable the option. If you want full compatibility with existing
applications, then disable it.

Regards,

	Hans
