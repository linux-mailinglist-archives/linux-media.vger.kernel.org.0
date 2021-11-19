Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5124A456BC3
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 09:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232265AbhKSImW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 03:42:22 -0500
Received: from mx3.molgen.mpg.de ([141.14.17.11]:52771 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229830AbhKSImW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 03:42:22 -0500
Received: from [192.168.0.2] (ip5f5aeced.dynamic.kabel-deutschland.de [95.90.236.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 154ED61E5FE02;
        Fri, 19 Nov 2021 09:39:19 +0100 (CET)
Message-ID: <1cc9afa7-397e-64a0-9f1b-b4d3bd85a8f0@molgen.mpg.de>
Date:   Fri, 19 Nov 2021 09:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 05/10] media: v4l: Add definition for the Aspeed JPEG
 format
Content-Language: en-US
To:     Jammy Huang <jammy_huang@aspeedtech.com>
Cc:     "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
 <20211118074030.685-6-jammy_huang@aspeedtech.com>
 <YZZIDNCLJXwrqY4W@paasikivi.fi.intel.com>
 <0bed6093-0af6-4fc4-716f-6cf8b1302320@aspeedtech.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <0bed6093-0af6-4fc4-716f-6cf8b1302320@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Dear Jammy,


Am 19.11.21 um 03:02 schrieb Jammy Huang:

> On 2021/11/18 下午 08:33, Sakari Ailus wrote:

>> On Thu, Nov 18, 2021 at 03:40:26PM +0800, Jammy Huang wrote:
>>> This introduces support for the Aspeed JPEG format, where the new frame
>>> can refer to previous frame to reduce the amount of compressed data. The
>>> concept is similar to I/P frame of video compression. I will compare the
>>> new frame with previous one to decide which macroblock's data is
>>> changed, and only the changed macroblocks will be compressed.
>>>
>>> This Aspeed JPEG format is used by the video engine on Aspeed platforms,
>>> which is generally adapted for remote KVM.
>>>
>>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>>> ---
>>> v5:
>>>    - no update
>>> v4:
>>>    - new
>>> ---
>>>   Documentation/media/uapi/v4l/pixfmt-reserved.rst | 12 ++++++++++++
>>>   drivers/media/v4l2-core/v4l2-ioctl.c             |  1 +
>>>   include/uapi/linux/videodev2.h                   |  1 +
>>>   3 files changed, 14 insertions(+)
>>>
>>> diff --git a/Documentation/media/uapi/v4l/pixfmt-reserved.rst 
>>> b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>>> index b2cd155e691b..23c05063133d 100644
>>> --- a/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>>> +++ b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>>> @@ -264,6 +264,18 @@ please make a proposal on the linux-media 
>>> mailing list.
>>>       of tiles, resulting in 32-aligned resolutions for the luminance 
>>> plane
>>>       and 16-aligned resolutions for the chrominance plane (with 2x2
>>>       subsampling).
>>> +    * .. _V4L2-PIX-FMT-AJPG:
>>> +
>>> +      - ``V4L2_PIX_FMT_AJPG``
>>> +      - 'AJPG'
>>> +      - ASPEED JPEG format used by the aspeed-video driver on Aspeed platforms,
>>> +        which is generally adapted for remote KVM.
>>> +        On each frame compression, I will compare the new frame with previous
>>> +        one to decide which macroblock's data is changed, and only the changed
>>> +        macroblocks will be compressed.
>>> +
>>> +        You could reference to chapter 36, Video Engine, of AST2600's datasheet
>>> +        for more information.
>> Is this datasheet publicly available? Do you have a URL?
> 
> Sorry, this datasheet is not publicly available.
> Hans mentioned this as well in the discussion below:
> 
> https://lkml.org/lkml/2021/11/10/101

If questions come up during review, please also add the answers to the 
commit message of the next iteration. ;-) Maybe:

> The implementation is based on datasheet *Name goes here*, revision
> X, which is not publicly available.

Kind regards,

Paul
