Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C92EE199475
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 12:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730614AbgCaK5F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 06:57:05 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60005 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730560AbgCaK5E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 06:57:04 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id JEZlj7wX5fHuvJEZojAmZA; Tue, 31 Mar 2020 12:57:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585652222; bh=gW0kWytJCFVyt24W1MbP4eqekLHYJlB7+XeNQWNm3wA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YdnvjCNVeftU3fOLL9O0JLLfTkSRgd9F+jnvNWKayzNqe1Q5Zsqqr6V2MrljPaHt+
         7fVXsij5KBL0SWEqnuolAE+boawWLo0CsgQwUiwMIN/AEZhCay9daI4S26Dw7LCXpD
         V+Aunhex5Z8mm80Llib751mz0/yh4hfp5MPw1sY+UjNZAYfU16o0pDYC75PhUiAq6N
         DQacDaraQGylQx6gv9IHSCltkI0+d8ylu/bL6IG9V1O2Rf6+HENvgI+80kwtDPG1NW
         LEVhJiYFsOdHPVrrAvNLa63GIMv95c73jH8mZPzhbC6Eq0oGqs93lIMzmiP/Gd6BXS
         mfREVSYCvmTng==
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <20200325110358.GB853@valkosipuli.retiisi.org.uk>
 <8bc44545-7d1e-0e37-db27-d37784679574@xs4all.nl>
 <20200331103215.GI2394@valkosipuli.retiisi.org.uk>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ba37eb84-392c-3767-57f6-d297b0ab79a3@xs4all.nl>
Date:   Tue, 31 Mar 2020 12:56:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331103215.GI2394@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfC/ZT10JC4UIPK+4vBfWukfI2h7F6ztLWQVAwUsm0nTj6BE6nclxJNZUGfh8KFaFer7kyPqxkhp7eBA/OuOywgO50LMVFvkW8TfZKSsmR+5nkHXCqEuu
 kQkvr42SCCQ89uCC8+CTmAV3gcomjcXZSjXdYyadE0nSqDV4UR6wV+uSV1VQH4LNjWvHR8/Ij+VQvsFvU7+NZTK0Y5HgTSRTZifImKb4xxU1bbz3Pz25m+dx
 CcE7V0HnO3OU9jnBML6zPJd46QYa7wJ1ecxwPiOc/TA0GQhbOM70FwTU8JHYmThaXDPcU/Cu3hDXUh6gnELX+Ev9oTMVXfyvK5z8VbNcxQlUP6smYDdOVk2I
 QLrOzzTZJnXK3z1fnb/AIOWeBdpw4Wxkhyi/BIoku96WSAvTYVWKCMQTMsMA7GDth8FuPSlpu9pl9iWcyWM8Rxuu7p853sWpY64kUyaUFrY6QPf+UZ9SdA7c
 AmuiAHE7XQnEWThj75mdvJEbraK/C8lf5yMtWj4GYk2z6rxRWh3n7PFApjzv6YDODc6Ln3zaxj1ZHnK2JVO910KI7Sjsf0aVOeX4Ka6EBvg5wFRWSqVNC3Ge
 XVA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/31/20 12:32 PM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Mar 30, 2020 at 12:59:15PM +0200, Hans Verkuil wrote:
>> On 3/25/20 12:03 PM, Sakari Ailus wrote:
>>> Hi Sowjanya,
>>>
>>> Thanks for the patchset.
>>>
>>> On Mon, Mar 23, 2020 at 10:52:32AM -0700, Sowjanya Komatineni wrote:
>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>
>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>> capture from an external camera sensor connected to CSI or from
>>>> built-in test pattern generator.
>>>>
>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>
>>>> This patch adds a V4L2 media controller and capture driver support
>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>  drivers/staging/media/Kconfig              |    2 +
>>>>  drivers/staging/media/Makefile             |    1 +
>>>>  drivers/staging/media/tegra/Kconfig        |   10 +
>>>>  drivers/staging/media/tegra/Makefile       |    8 +
>>>>  drivers/staging/media/tegra/TODO           |   10 +
>>>>  drivers/staging/media/tegra/tegra-common.h |  263 +++++++
>>>>  drivers/staging/media/tegra/tegra-csi.c    |  522 ++++++++++++++
>>>>  drivers/staging/media/tegra/tegra-csi.h    |  118 ++++
>>>>  drivers/staging/media/tegra/tegra-vi.c     | 1058 ++++++++++++++++++++++++++++
>>>>  drivers/staging/media/tegra/tegra-vi.h     |   83 +++
>>>>  drivers/staging/media/tegra/tegra-video.c  |  129 ++++
>>>>  drivers/staging/media/tegra/tegra-video.h  |   32 +
>>>>  drivers/staging/media/tegra/tegra210.c     |  754 ++++++++++++++++++++
>>>>  drivers/staging/media/tegra/tegra210.h     |  192 +++++
>>>
>>> Why staging? Are there reasons not to aim this to the kernel proper right
>>> away? If you only support TPG, the driver may not have too many (if any)
>>> real users anyway.
>>>
>>>>  14 files changed, 3182 insertions(+)
>>>>  create mode 100644 drivers/staging/media/tegra/Kconfig
>>>>  create mode 100644 drivers/staging/media/tegra/Makefile
>>>>  create mode 100644 drivers/staging/media/tegra/TODO
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-common.h
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-video.c
>>>>  create mode 100644 drivers/staging/media/tegra/tegra-video.h
>>>>  create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>>  create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>
>>
>> <snip>
>>
>>>> +static int tegra_channel_g_input(struct file *file, void *priv,
>>>> +				 unsigned int *i)
>>>> +{
>>>> +	*i = 0;
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int tegra_channel_s_input(struct file *file, void *priv,
>>>> +				 unsigned int input)
>>>> +{
>>>> +	if (input > 0)
>>>> +		return -EINVAL;
>>>> +
>>>> +	return 0;
>>>> +}
>>>
>>> Please see patchset on topic "v4l2-dev/ioctl: Add V4L2_CAP_IO_MC" on
>>> linux-media; it's relevant here, too.
>>
>> No, it isn't. The pipeline is controlled by the driver, not by userspace.
>> This is a regular video capture driver, not an ISP driver.
> 
> I don't think that really makes a difference, whether a device is an ISP or
> not, but instead what does is whether there is something to control in its
> pipeline that cannot be generally done through the regular V4L2 interface.
> Even plain CSI-2 receiver drivers should be media device centric these days
> as doing otherwise excludes using a range of sensor drivers with them,
> including any possible future support for e.g. sensor embedded data.
> 

We've been back and forth on this before for this driver. I see no reason to make things
complicated, these are simple video pipelines for video capture. Making this media
device centric means that existing software using the BSP version of this driver require
a full rewrite, which is not desirable.

If we are going to require CSI receiver drivers to be media centric, then that's a
major departure of existing practice. And something that needs to be discussed first,
since that will require that support for each csi receiver driver is added to libcamera.
Is libcamera ready for that? Are common applications using libcamera yet?

Obviously, if NVIDIA decides that this is worth the effort, then I have no objection.
But I don't think it is something we should require at this stage.

Regards,

	Hans
