Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44BBA4786FE
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 10:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234092AbhLQJWy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 04:22:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51228 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234088AbhLQJWy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 04:22:54 -0500
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5275692A;
        Fri, 17 Dec 2021 10:22:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639732972;
        bh=CyesS9PHneRUxLDuJtZxi6ADFy1d9bRBBjlqCuE1K5A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Yk+jDLagzvWP8gCD6Fk3sVQo747tUkID2D/HAILgs865NwhKCvTE3IggYCxM9zO3k
         txUYla5LHIv+zwdItbd8hI4044lfICachkcPvKEhiZxhyUHt38t7Vyti71ozbuLrDr
         aJ1N2a14/ikp+y1MSaBMZsCrqGEz4qR7eVB2obg4=
Subject: Re: [PATCH v10 06/38] media: Documentation: add documentation about
 subdev state
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-7-tomi.valkeinen@ideasonboard.com>
 <20211214083151.ipksg4fwxuu6u2ow@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <c50efce7-ef46-4336-4c18-7e6e9904707f@ideasonboard.com>
Date:   Fri, 17 Dec 2021 11:22:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211214083151.ipksg4fwxuu6u2ow@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/12/2021 10:31, Jacopo Mondi wrote:
> Hi Tomi,
> 
> On Tue, Nov 30, 2021 at 04:15:04PM +0200, Tomi Valkeinen wrote:
>> Add documentation about centrally managed subdev state.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   .../driver-api/media/v4l2-subdev.rst          | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
>> index 7736da077fb8..db012729f8e3 100644
>> --- a/Documentation/driver-api/media/v4l2-subdev.rst
>> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
>> @@ -518,6 +518,34 @@ The :c:func:`v4l2_i2c_new_subdev` function will call
>>   :c:type:`i2c_board_info` structure using the ``client_type`` and the
>>   ``addr`` to fill it.
>>
>> +Centrally managed subdev active state
>> +-------------------------------------
>> +
>> +Traditionally V4L2 subdev drivers maintained internal state for the active
>> +configuration for the subdev. This is often implemented as an array of struct
>> +v4l2_mbus_framefmt, one entry for each pad.
> 
> Not only v4l2_mbus_framefmt, but the 'active' configuration also
> contains cropping rectangles. I would drop the last statement maybe ?
> 
>> +
>> +In addition to the active configuration, each subdev filehandle has an array of
>> +struct v4l2_subdev_pad_config, managed by V4L2 core, which contains the TRY
>> +configuration.
>> +
>> +To simplify the subdev drivers the V4L2 subdev API now optionally supports a
>> +centrally managed active configuration. A subdev driver must use
> 
> I would here explain what active and try states are and where they
> live.
> 
> "a centrally managed active configuration represented by
> :c:type:`v4l2_subdev_state`. One instance of state, which contains
> the active device configuration, is associated with the sub-device itself as
> part of the :c:type:`v4l2_subdev` structure, while the core associates to
> each open file handle a try state, which contains the configuration
> valid in the file-handle context only."
> 
>> +v4l2_subdev_init_finalize() to initialize the active state between calls to
>> +media_entity_pads_init() and v4l2_*_register_subdev(), and must call
>> +v4l2_subdev_cleanup() to free the state.
> 
> "Sub-device drivers can opt-in and use state to manage their active
> configuration by initializing the subdevice state with a call to
> v4l2_subdev_init_finalize() as the last operation before registering
> the sub-device. They must also call v4l2_subdev_cleanup() to release
> all the acquired resources before unregistering the sub-device. The
> core automatically initializes a state for each open file handle where
> to store the try configurations and releases them at file handle
> closing time."
> 
>> +
>> +The active state must be locked before access, and that can be done with
>> +v4l2_subdev_lock_state() or v4l2_subdev_lock_active_state().
> 
> I would also explain which state to use and when.
> 
> "V4L2 sub-device operations that operates on both the :ref:`ACTIVE and
> TRY formats <v4l2-subdev-format-whence>` receive by the core the
> correct state to operate on an operation parameter. The sub-device driver
> can access and modify the configuration stored in the provided state
> after having exclusively acquired it by calling
> :c:func:`v4l2_subdev_lock_state()` and released it with
> :c:func:`v4l2_subdev_unlock_state()` when done.
> 
> Operations that do not receive a state parameter implicitly operates
> on the subdevice active state, which drivers can exclusively access by
> calling :c:func:`v4l2_subdev_lock_active_state()`. The sub-device active
> state should equally be released by calling
> :c:func:`v4l2_subdev_unlock_state()`.
> 
> In no occasions driver should try to manually access the state stored
> in the :c:type`v4l2_subdev` or in the file handle without going
> through the designated helpers".
> 
>> +
>> +The V4L2 core will pass either the TRY or ACTIVE state to various subdev ops.
>> +Unfortunately not all the subdev drivers comply with this yet, and may pass
> 
> If I'm not mistaken it's not the subdev drivers but the top drivers
> which might not comply.

No, it's for any callers of subdev ops (core, top-drivers, subdev 
drivers). I'll change it to "not all callers comply".

Thanks Jacopo and Laurent. I like this method of writing docs!

  Tomi
