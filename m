Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C22465BB2
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 02:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236502AbhLBBfn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 20:35:43 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:44016 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240516AbhLBBfK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 20:35:10 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1B214jBZ095855;
        Thu, 2 Dec 2021 09:04:45 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Dec
 2021 09:29:20 +0800
Message-ID: <549aaf9a-cd72-e200-0329-30f6c71b8ed7@aspeedtech.com>
Date:   Thu, 2 Dec 2021 09:29:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v5 00/10] add aspeed-jpeg support for aspeed-video
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
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
 <5ab806d1-e407-1fa4-83ec-93ebe8df7db4@xs4all.nl>
 <b6ba49f3-a9ed-f5e6-959c-309db8cce7f6@aspeedtech.com>
 <6e0da74e-ddce-3c94-42a1-f98833489d60@xs4all.nl>
From:   Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <6e0da74e-ddce-3c94-42a1-f98833489d60@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1B214jBZ095855
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for your review and suggestions.

On 2021/11/26 下午 05:51, Hans Verkuil wrote:
> On 26/11/2021 09:17, Jammy Huang wrote:
>> Hi Hans,
>>
>> Please refer to Page 132, 'Video stream data format – ASPEED mode compression' of
>> https://github.com/AspeedTech-BMC/openbmc/releases/download/v07.02/SDK_User_Guide_v07.02.pdf
>>
>> Is above information enough??
> Hmm, close. It would need some additional information, possibly documented in the source
> code:
>
> - What is the Frame Header? (the doc just says that it is different, but not what it actually is)
> - What is the EOI code? Is it equal to 'FEND'? (not quite clear to me)
>
> I think the documentation looks sufficient once those two items are addressed.
Information you mentioned will be included in next revision, 
"SDK_User_Guide_v07.03.pdf".
The releases will be updated to 
https://github.com/AspeedTech-BMC/openbmc/releases
>> Or maybe we can postpone this series until the source code for this format ready.
>> I think I can accomplish it by the end of this year.
> That's quite soon, so perhaps that would be the best approach. That way you also
> know exactly what information is missing from the SDK User Guide, and if that is
> documented, then this format can be used in the kernel.
>
> But several of the patches in the series are independent of the new jpeg format,
> so it might be useful to get those in first.

Understood. For the patches below, I will resend except for patch 
5/6/8/10 which are closely
relative to aspeed jpeg format.

    1. media: aspeed: move err-handling together to the bottom
    2. media: aspeed: use v4l2_info/v4l2_warn/v4l2_dbg for log
    3. media: aspeed: add more debug log messages
    4. media: aspeed: refactor to gather format/compress settings
    5. media: v4l: Add definition for the Aspeed JPEG format
    6. media: v4l2-ctrls: Reserve controls for ASPEED
    7. media: aspeed: use model-data
    8. media: aspeed: Support aspeed mode to reduce compressed data
    9. media: aspeed: add comments and macro
    10.media: aspeed: Extend debug message



>
> Regards,
>
> 	Hans
>
>> On 2021/11/25 下午 10:31, Hans Verkuil wrote:
>>> Hi Jammy,
>>>
>>> I suggest posting a v3 that moves the patches that deal with the
>>> Aspeed JPEG format to the end of the series. That way I can easily
>>> merge the patches up to that point, and the Aspeed JPEG support can
>>> be handled separately.
>>>
>>> I'm not sure if it can be merged without that format being documented,
>>> either in pixfmt-reserved.rst, by implementing support for it in
>>> libv4lconvert from v4l-utils, or by providing a URL to some other
>>> publicly available source code. We really don't like adding pixel
>>> formats that cannot be interpreted by someone without access to the
>>> datasheets.
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>> On 18/11/2021 08:40, Jammy Huang wrote:
>>>> The aim of this series is to add aspeed-jpeg support for aspeed-video
>>>> driver.
>>>>
>>>> To achieve this major goal some refactors are included.
>>>>
>>>> In the last, debugfs information is also updated per this change.
>>>>
>>>> Changes in v5:
>>>>    - Use model data to tell different soc
>>>>
>>>> Changes in v4:
>>>>    - Add definition for the Aspeed JPEG format
>>>>    - Reserve controls for ASPEED
>>>>    - Use s_fmt to update format rather than new control
>>>>    - Update aspeed hq quality range, 1 ~ 12
>>>>
>>>>
>>>> Jammy Huang (10):
>>>>     media: aspeed: move err-handling together to the bottom
>>>>     media: aspeed: use v4l2_info/v4l2_warn/v4l2_dbg for log
>>>>     media: aspeed: add more debug log messages
>>>>     media: aspeed: refactor to gather format/compress settings
>>>>     media: v4l: Add definition for the Aspeed JPEG format
>>>>     media: v4l2-ctrls: Reserve controls for ASPEED
>>>>     media: aspeed: use model-data
>>>>     media: aspeed: Support aspeed mode to reduce compressed data
>>>>     media: aspeed: add comments and macro
>>>>     media: aspeed: Extend debug message
>>>>
>>>>    .../media/uapi/v4l/pixfmt-reserved.rst        |  12 +
>>>>    drivers/media/platform/aspeed-video.c         | 534 ++++++++++++++----
>>>>    drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>>>>    include/uapi/linux/aspeed-video.h             |  15 +
>>>>    include/uapi/linux/v4l2-controls.h            |   5 +
>>>>    include/uapi/linux/videodev2.h                |   1 +
>>>>    6 files changed, 467 insertions(+), 101 deletions(-)
>>>>    create mode 100644 include/uapi/linux/aspeed-video.h
>>>>
-- 
Best Regards
Jammy

