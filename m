Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB9E2733A9
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 22:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727245AbgIUUis (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 16:38:48 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:49895 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726451AbgIUUis (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 16:38:48 -0400
Received: from [78.134.51.148] (port=43944 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1kKSIM-0008a9-UV; Mon, 21 Sep 2020 22:20:19 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH 3/3] media: docs: v4l2-subdev: move generic paragraph to
 the introduction
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200904215141.20862-1-luca@lucaceresoli.net>
 <20200904215141.20862-3-luca@lucaceresoli.net>
 <20200915133451.jydprottrtskqe7y@uno.localdomain>
Message-ID: <349eac76-df57-86db-706b-53baccf32e06@lucaceresoli.net>
Date:   Mon, 21 Sep 2020 22:20:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915133451.jydprottrtskqe7y@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

thanks for reviewing.

On 15/09/20 15:34, Jacopo Mondi wrote:
> Hi Luca,
> 
> On Fri, Sep 04, 2020 at 11:51:41PM +0200, Luca Ceresoli wrote:
>> This paragraph provides generic information to explain what v4l2_subdev is
>> useful for. Placing it in the middle of paragraphs describing the details
>> of subdev registration does not make much sense. Move it near the beginning
>> of the section when the v4l2_subdev idea has just been introduced and
>> before going into its details.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> ---
>>  Documentation/driver-api/media/v4l2-subdev.rst | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
>> index fb66163deb38..1c1e3f9da142 100644
>> --- a/Documentation/driver-api/media/v4l2-subdev.rst
>> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
>> @@ -12,6 +12,12 @@ Usually these are I2C devices, but not necessarily. In order to provide the
>>  driver with a consistent interface to these sub-devices the
>>  :c:type:`v4l2_subdev` struct (v4l2-subdev.h) was created.
>>
>> +The advantage of using :c:type:`v4l2_subdev` is that it is a generic struct and
>> +does not contain any knowledge about the underlying hardware. So a driver might
>> +contain several subdevs that use an I2C bus, but also a subdev that is
>> +controlled through GPIO pins. This distinction is only relevant when setting
>> +up the device, but once the subdev is registered it is completely transparent.
>> +
>>  Each sub-device driver must have a :c:type:`v4l2_subdev` struct. This struct
>>  can be stand-alone for simple sub-devices or it might be embedded in a larger
>>  struct if more state information needs to be stored. Usually there is a
>> @@ -235,12 +241,6 @@ it can call ``v4l2_subdev_notify(sd, notification, arg)``. This macro checks
>>  whether there is a ``notify()`` callback defined and returns ``-ENODEV`` if not.
>>  Otherwise the result of the ``notify()`` call is returned.
>>
>> -The advantage of using :c:type:`v4l2_subdev` is that it is a generic struct and
>> -does not contain any knowledge about the underlying hardware. So a driver might
>> -contain several subdevs that use an I2C bus, but also a subdev that is
>> -controlled through GPIO pins. This distinction is only relevant when setting
>> -up the device, but once the subdev is registered it is completely transparent.
>> -
> 
> Have you considered moving the whole part that describes how to call
> operations, which comes after the synchronous registration case to a
> dedicated sub-section ? The above paragraph makes sense in the context
> of describing why v4l2_subdev is advantageous as it abstract the
> underlying details under a unified call interface.
> 
> This could become
> 
> V4L2 sub-devices
> ----------------
> 
> Intro
> ~~~~~
> 
> Registration
> ~~~~~~~~~~~~
> 
> **synchronous**
> **asynchronous**
> 
> Operations call (or a better name :)
> ~~~~~~~~~~~~~~~
> 
> What do you think ?

I think you're right. Incoming v2 with the new layout as you suggested.

-- 
Luca
