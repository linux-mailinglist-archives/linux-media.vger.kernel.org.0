Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDECE45E909
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 09:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359349AbhKZIPS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 03:15:18 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:65350 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243068AbhKZINS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 03:13:18 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1AQ7iYfs032630;
        Fri, 26 Nov 2021 15:44:34 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Nov
 2021 16:08:49 +0800
Message-ID: <b66655ac-eac8-835a-7917-0c1d035d5309@aspeedtech.com>
Date:   Fri, 26 Nov 2021 16:08:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v5 05/10] media: v4l: Add definition for the Aspeed JPEG
 format
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
 <20211118074030.685-6-jammy_huang@aspeedtech.com>
 <YZZIDNCLJXwrqY4W@paasikivi.fi.intel.com>
 <0bed6093-0af6-4fc4-716f-6cf8b1302320@aspeedtech.com>
 <YZzBPFHZ7MPwTWSm@paasikivi.fi.intel.com>
From:   Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <YZzBPFHZ7MPwTWSm@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AQ7iYfs032630
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 2021/11/23 下午 06:23, Sakari Ailus wrote:
> Hi Jammy,
>
> On Fri, Nov 19, 2021 at 10:02:40AM +0800, Jammy Huang wrote:
>> Hi Sakari,
>>
>> On 2021/11/18 下午 08:33, Sakari Ailus wrote:
>>> Hi Jammy,
>>>
>>> On Thu, Nov 18, 2021 at 03:40:26PM +0800, Jammy Huang wrote:
>>>> This introduces support for the Aspeed JPEG format, where the new frame
>>>> can refer to previous frame to reduce the amount of compressed data. The
>>>> concept is similar to I/P frame of video compression. I will compare the
>>>> new frame with previous one to decide which macroblock's data is
>>>> changed, and only the changed macroblocks will be compressed.
>>>>
>>>> This Aspeed JPEG format is used by the video engine on Aspeed platforms,
>>>> which is generally adapted for remote KVM.
>>>>
>>>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>>>> ---
>>>> v5:
>>>>     - no update
>>>> v4:
>>>>     - new
>>>> ---
>>>>    Documentation/media/uapi/v4l/pixfmt-reserved.rst | 12 ++++++++++++
>>>>    drivers/media/v4l2-core/v4l2-ioctl.c             |  1 +
>>>>    include/uapi/linux/videodev2.h                   |  1 +
>>>>    3 files changed, 14 insertions(+)
>>>>
>>>> diff --git a/Documentation/media/uapi/v4l/pixfmt-reserved.rst b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>>>> index b2cd155e691b..23c05063133d 100644
>>>> --- a/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>>>> +++ b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>>>> @@ -264,6 +264,18 @@ please make a proposal on the linux-media mailing list.
>>>>    	of tiles, resulting in 32-aligned resolutions for the luminance plane
>>>>    	and 16-aligned resolutions for the chrominance plane (with 2x2
>>>>    	subsampling).
>>>> +    * .. _V4L2-PIX-FMT-AJPG:
>>>> +
>>>> +      - ``V4L2_PIX_FMT_AJPG``
>>>> +      - 'AJPG'
>>>> +      - ASPEED JPEG format used by the aspeed-video driver on Aspeed platforms,
>>>> +        which is generally adapted for remote KVM.
>>>> +        On each frame compression, I will compare the new frame with previous
>>>> +        one to decide which macroblock's data is changed, and only the changed
>>>> +        macroblocks will be compressed.
>>>> +
>>>> +        You could reference to chapter 36, Video Engine, of AST2600's datasheet
>>>> +        for more information.
>>> Is this datasheet publicly available? Do you have a URL?
>> Sorry, this datasheet is not publicly available.
>> Hans mentioned this as well in the discussion below:
>>
>> https://lkml.org/lkml/2021/11/10/101
> If the vendor documentation is not publicly available, you'll need to have
> the format documented here. Alternatively an open source implementation
> (e.g. LGPL) is presumably fine, too.
Please refer to 
https://github.com/AspeedTech-BMC/openbmc/releases/download/v07.02/SDK_User_Guide_v07.02.pdf.
At Page 132, 'Video stream data format – ASPEED mode compression' 
describes the data format.
Is above information  enough??

Besides, I have already had openbmc's kvm support this aspeed format.
The source code of the implementation will be released after performance 
tuning finished.

-- 
Best Regards
Jammy

