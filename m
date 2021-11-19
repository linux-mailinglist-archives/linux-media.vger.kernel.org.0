Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F4B4567D1
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 03:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbhKSCHo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 21:07:44 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:5651 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233816AbhKSCHo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 21:07:44 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1AJ1cpdO078471;
        Fri, 19 Nov 2021 09:38:51 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 19 Nov
 2021 10:02:38 +0800
Message-ID: <0bed6093-0af6-4fc4-716f-6cf8b1302320@aspeedtech.com>
Date:   Fri, 19 Nov 2021 10:02:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
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
From:   Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <YZZIDNCLJXwrqY4W@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AJ1cpdO078471
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 2021/11/18 下午 08:33, Sakari Ailus wrote:
> Hi Jammy,
>
> On Thu, Nov 18, 2021 at 03:40:26PM +0800, Jammy Huang wrote:
>> This introduces support for the Aspeed JPEG format, where the new frame
>> can refer to previous frame to reduce the amount of compressed data. The
>> concept is similar to I/P frame of video compression. I will compare the
>> new frame with previous one to decide which macroblock's data is
>> changed, and only the changed macroblocks will be compressed.
>>
>> This Aspeed JPEG format is used by the video engine on Aspeed platforms,
>> which is generally adapted for remote KVM.
>>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>> v5:
>>    - no update
>> v4:
>>    - new
>> ---
>>   Documentation/media/uapi/v4l/pixfmt-reserved.rst | 12 ++++++++++++
>>   drivers/media/v4l2-core/v4l2-ioctl.c             |  1 +
>>   include/uapi/linux/videodev2.h                   |  1 +
>>   3 files changed, 14 insertions(+)
>>
>> diff --git a/Documentation/media/uapi/v4l/pixfmt-reserved.rst b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>> index b2cd155e691b..23c05063133d 100644
>> --- a/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>> +++ b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>> @@ -264,6 +264,18 @@ please make a proposal on the linux-media mailing list.
>>   	of tiles, resulting in 32-aligned resolutions for the luminance plane
>>   	and 16-aligned resolutions for the chrominance plane (with 2x2
>>   	subsampling).
>> +    * .. _V4L2-PIX-FMT-AJPG:
>> +
>> +      - ``V4L2_PIX_FMT_AJPG``
>> +      - 'AJPG'
>> +      - ASPEED JPEG format used by the aspeed-video driver on Aspeed platforms,
>> +        which is generally adapted for remote KVM.
>> +        On each frame compression, I will compare the new frame with previous
>> +        one to decide which macroblock's data is changed, and only the changed
>> +        macroblocks will be compressed.
>> +
>> +        You could reference to chapter 36, Video Engine, of AST2600's datasheet
>> +        for more information.
> Is this datasheet publicly available? Do you have a URL?

Sorry, this datasheet is not publicly available.
Hans mentioned this as well in the discussion below:

https://lkml.org/lkml/2021/11/10/101

-- 
Best Regards
Jammy

