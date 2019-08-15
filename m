Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF72B8EDC9
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 16:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732761AbfHOOKr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 10:10:47 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:56863 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729918AbfHOOKq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 10:10:46 -0400
Received: from [IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f] ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yGSehwE19DqPeyGShhYRxZ; Thu, 15 Aug 2019 16:10:43 +0200
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
 <20190814224340.GD5015@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <664fe7b3-9051-30da-736e-710a4e9cecde@xs4all.nl>
Date:   Thu, 15 Aug 2019 16:10:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190814224340.GD5015@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNpjEDNHayoDV3P40HsDxS8NAD4L+NUcTCTsWsE4rG6HlWdsVhfj/KvBgZMxlpUFvYF934r9t6jddaz7xfqNBkNB0vzJgJi3UA5AnvLLtoSNsrNA8MA1
 9qDKDpcN4qeoJ47/pKWVXIMSsIJ02DnYp4/6rAQfeZHaLNWiV11Sjone+wfMCnWBxUdDmbM2i3WqA5AITZw1JMmPQTe9mTfz5f3bz/MyG/FCaLonTtcnb/n6
 Xdl1d8rlyeq+bMO+y/5Vsjlwrxuw8SRjSnT2on/e/p7A/Ga4exfxfKuAGOUBwWLopB2Ip6YMqp3jHx5X9gfVDzAfheiWtcLmlZTnxgG6UZFg8LEANlR/NP9Z
 c4lPlkezArQeBp6WK2+kr36qIySksaoagyYAuOhMspsjQxD144jbRy3gdFPmuSJ8qCTz6K11pq4usp5t2ZFZUuNWjrM/ZPUNOzOy0yzNWJL4pidJh0SQF5CH
 ar8Y7SuFOXuUtNWK
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/15/19 12:43 AM, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Wed, Aug 14, 2019 at 10:28:12PM +0200, Jacopo Mondi wrote:
>> Add documentation for the V4L2_CID_LOCATION camera control. The newly
>> added read-only control reports the camera device mounting position.
>>
>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>> ---
>>  .../media/uapi/v4l/ext-ctrls-camera.rst       | 23 +++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
>> index 51c1d5c9eb00..fc0a02eee6d4 100644
>> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
>> @@ -510,6 +510,29 @@ enum v4l2_scene_mode -
>>      value down. A value of zero stops the motion if one is in progress
>>      and has no effect otherwise.
>>
>> +``V4L2_CID_LOCATION (integer)``
> 
> Maybe V4L2_CID_CAMERA_SENSOR_LOCATION ? Same for the values below.

Probably a better name, if a bit long. But we might need other location
controls in the future (e.g. flash location), so CID_LOCATION is just too
generic.

Regards,

	Hans

> 
>> +    This read-only control describes the camera location by reporting its
> 
> Here too I would mention camera sensor instead of just camera (or
> possibly imaging sensor).
> 
>> +    mounting position on the device where the camera is installed. This
>> +    control is particularly meaningful for devices which have a well defined
>> +    orientation, such as phones, laptops and portable devices as the camera
>> +    location is expressed as a position relative to the device intended
>> +    usage position. In example, a camera installed on the user-facing side
>> +    of a phone device is said to be installed in the ``V4L2_LOCATION_FRONT``
>> +    position.
> 
> The DT bindings could use such an example :-) I would extend this to
> tablets and laptops.
> 
>> +
>> +
>> +
> 
> Do we need three blank lines ?
> 
>> +.. flat-table::
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +
>> +    * - ``V4L2_LOCATION_FRONT``
>> +      - The camera device is located on the front side of the device.
>> +    * - ``V4L2_LOCATION_BACK``
>> +      - The camera device is located on the back side of the device.
>> +
>> +
>> +
>>  .. [#f1]
>>     This control may be changed to a menu control in the future, if more
>>     options are required.
> 

