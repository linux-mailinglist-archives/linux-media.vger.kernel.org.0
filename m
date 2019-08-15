Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 174468ED23
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732328AbfHONl7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:41:59 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:52025 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729918AbfHONl7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:41:59 -0400
Received: from [IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f] ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yG0nhw2wxDqPeyG0rhYLfe; Thu, 15 Aug 2019 15:41:57 +0200
Subject: Re: [RFC 3/5] media: v4l2-ctrls: Add support for V4L2_CID_LOCATION
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-4-jacopo@jmondi.org>
 <20190814225353.GE5015@pendragon.ideasonboard.com>
 <20190815130245.usat55oqffe4abvi@uno.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f16bc961-1410-a38b-9973-eddb7293b4b2@xs4all.nl>
Date:   Thu, 15 Aug 2019 15:41:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190815130245.usat55oqffe4abvi@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIvVw+YP1TjkGK30wylgD6dnQvfhOlyHaEe0FibFsnIf1SzNCUBu4Lg1dARQ5/qQlNOvjTpyAmCPciO0E4SXdUEVoRyN4ZahzeD7vP64wcCZuuhSwSV9
 Ae6m7jUizYjQhmLqQjyMC1CuIg2C6qVe7l3rZ9NP5Fg5tZZRcF2XD3yh2bvA4z0vvN3PE+7KgBStvALUuGBT9LJyTxPVfhB3C6yVlor3zfGxsTuXBaZsmj28
 Qb6PYK94zj6tJZwnVz/tqKMjavS2xTetrpHjDav/sKh9E27l4n1jIo6ibi7FuYW2IbBjFl/YoJRcNs1CoWWeND/lTM5y7L6y53wIK1ag/8/z5qQMU9Bs/hQc
 G5azbalFXNE4PhxNtm7d3PibnyUYuiCf08PCJOeqNDvuJXhSwCcxBo/jTjS3CHjucndFL4B2iNyWZae600eMm523vWoWJSMOlmb+z5KG0sY6OSjWQb0GtdVG
 n8NUdWgNx5ysbfSP
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/15/19 3:02 PM, Jacopo Mondi wrote:
> Hi Laurent,
> 
> On Thu, Aug 15, 2019 at 01:53:53AM +0300, Laurent Pinchart wrote:
>> Hi Jacopo,
>>
>> Thank you for the patch.
>>
>> On Wed, Aug 14, 2019 at 10:28:13PM +0200, Jacopo Mondi wrote:
>>> Add support for the newly defined V4L2_CID_LOCATION read-only control
>>> used to report the camera device mounting position.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> ---
>>>  drivers/media/v4l2-core/v4l2-ctrls.c | 7 +++++++
>>>  include/uapi/linux/v4l2-controls.h   | 4 ++++
>>>  2 files changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> index 7d3a33258748..8ab0857df59a 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> @@ -943,6 +943,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>  	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
>>>  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
>>>  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
>>> +	case V4L2_CID_LOCATION:			return "Location";
>>
>> Depending on what we decide to name the control (see review of 2/5), you
>> should adjust the description accordingly.
>>
>>>
>>>  	/* FM Radio Modulator controls */
>>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>>> @@ -1300,6 +1301,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>  		break;
>>>  	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:
>>>  		*type = V4L2_CTRL_TYPE_FWHT_PARAMS;
>>> +	case V4L2_CID_LOCATION:
>>> +		*type = V4L2_CTRL_TYPE_INTEGER;
>>> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>> +		*min = V4L2_LOCATION_FRONT;
>>> +		*max = V4L2_LOCATION_BACK;
>>
>> I don't think the control should have a min and a max different than the
>> current value, as it's a fully static control. I'd drop those two lines
>> here, and drivers will have to set value = min = max = V4L2_LOCATION_xxx
>> when creating the control. That why you should be able to collapse this
>> with V4L2_CID_MIN_BUFFERS_FOR_OUTPUT.
>>
> 
> Ah, I thought min/max should report the actual control values limits.
> Anyway, if we move this to be an integer menu control with an helper
> to parse the DT property and register the control on behalf of
> drivers, this will change.
> 
>>> +		*step = 1;
>>>  		break;
>>>  	default:
>>>  		*type = V4L2_CTRL_TYPE_INTEGER;
>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>> index 37807f23231e..5c4c7b245921 100644
>>> --- a/include/uapi/linux/v4l2-controls.h
>>> +++ b/include/uapi/linux/v4l2-controls.h
>>> @@ -889,6 +889,10 @@ enum v4l2_auto_focus_range {
>>>  #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
>>>  #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
>>>
>>> +#define V4L2_CID_LOCATION			(V4L2_CID_CAMERA_CLASS_BASE+34)
>>> +#define V4L2_LOCATION_FRONT			(0 << 0)
>>> +#define V4L2_LOCATION_BACK			(1 << 0)
>>
>> Why not just 0 and 1 ?
> 
> Or why not BIT(). I saw that the (1 << x) style is the mostly used one in
> this header file when defining macros like this one so I went for
> consistency with the existing code.

Definitely not right. This is an enumeration, so just number from 0, 1, 2, ...

Nothing to do with bits/bitmasks.

Regards,

	Hans

> 
>>
>>> +
>>>  /* FM Modulator class control IDs */
>>>
>>>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
>>
>> --
>> Regards,
>>
>> Laurent Pinchart

