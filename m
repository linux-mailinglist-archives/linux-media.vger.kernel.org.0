Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70537246472
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 12:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbgHQKYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 06:24:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42616 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbgHQKYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 06:24:54 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 1250028A748
Subject: Re: [PATCH v5 4/7] v4l2: extend the CSC API to subdevice.
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
References: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
 <20200703171019.19270-5-dafna.hirschfeld@collabora.com>
 <20200722125328.GA1828171@chromium.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <8cc4f3a2-d116-ec0a-a838-b35859cdc34e@collabora.com>
Date:   Mon, 17 Aug 2020 12:24:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722125328.GA1828171@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 22.07.20 um 14:53 schrieb Tomasz Figa:
> Hi Dafna,
> 
> On Fri, Jul 03, 2020 at 07:10:16PM +0200, Dafna Hirschfeld wrote:
>> This patch extends the CSC API in video devices to be supported
>> also on sub-devices. The flag V4L2_MBUS_FRAMEFMT_SET_CSC set by
>> the application when calling VIDIOC_SUBDEV_S_FMT ioctl.
>> The flags:
>>
>> V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE, V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC,
>> V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC,
>>
>> are set by the driver in the VIDIOC_SUBDEV_ENUM_MBUS_CODE ioctl.
>>
>> New 'flags' fields were added to the structs
>> v4l2_subdev_mbus_code_enum, v4l2_mbus_framefmt which are borrowed
>> from the 'reserved' field
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   .../media/v4l/subdev-formats.rst              | 78 +++++++++++++++++--
>>   .../v4l/vidioc-subdev-enum-mbus-code.rst      | 44 ++++++++++-
>>   include/uapi/linux/v4l2-mediabus.h            |  9 ++-
>>   include/uapi/linux/v4l2-subdev.h              |  8 +-
>>   4 files changed, 129 insertions(+), 10 deletions(-)
>>
> 
> Thank you for the patch. Please see my comments inline.
> 
>> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
>> index 9a4d61b0d76f..7362ee0b1e96 100644
>> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
>> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
>> @@ -41,32 +41,96 @@ Media Bus Formats
>>   	:ref:`field-order` for details.
>>       * - __u32
>>         - ``colorspace``
>> -      - Image colorspace, from enum
>> -	:c:type:`v4l2_colorspace`. See
>> -	:ref:`colorspaces` for details.
>> +      - Image colorspace, from enum :c:type:`v4l2_colorspace`.
>> +        Must be set by the driver for capture streams and by the application
>> +	for output streams, see :ref:`colorspaces`. If the application sets the
>> +	flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
>> +	this field for a capture stream to request a specific colorspace
> 
> What is a "capture stream" in terms of the subdev API? Should this
> perhaps refer to "source pads" instead?

Hi, yes, I should change it to 'source pad'. I see that for the other colorimetry fields,
the docs for v4l2_mbus_framefmt already writes
"This information supplements the colorspace and must be set by the driver for capture streams and by the application for output streams,"
I guess this should also change,

Thanks,
Dafna

> 
> [snip]
>> +.. _v4l2-mbus-framefmt-flags:
>> +
>> +.. flat-table:: v4l2_mbus_framefmt Flags
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +    :widths:       3 1 4
>> +
>> +    * .. _`mbus-framefmt-set-csc`:
>> +
>> +      - ``V4L2_MBUS_FRAMEFMT_SET_CSC``
>> +      - 0x00000001
>> +      - Set by the application. It is only used for capture and is
>> +	ignored for output streams. If set, then request the subdevice to do
> 
> Ditto.
> 
>> +	colorspace conversion from the received colorspace to the requested
>> +	colorspace values. If colorimetry field (``colorspace``, ``ycbcr_enc``,
> 
> nit: a colorimetry field
> 
>> +	``quantization`` or ``xfer_func``) is set to 0, then that colorimetry
> 
> Is it okay to explicitly mention 0 here, rather than the defined
> "_DEFAULT" values?
> 
> Best regards,
> Tomasz
> 
