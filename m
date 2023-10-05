Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 165FB7BA524
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 18:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240233AbjJEQOA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 12:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240474AbjJEQND (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 12:13:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDAEB25723
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 04:53:34 -0700 (PDT)
Received: from [192.168.88.20] (91-157-153-81.elisa-laajakaista.fi [91.157.153.81])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E20C8C;
        Thu,  5 Oct 2023 13:51:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696506703;
        bh=H4mleBDR2YF5YQx0PCdRcOA+abUkRYvG3FHU3l8qN1A=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pVrqbX/SA8Jq06pKDzsHBLGay/p8kjFc0QuR6eJLbLW26UFEGTSaSnuJ31XqNqePb
         WgMpRUVkv4QVI7fRDL9c8AaO3F46hx0M58no3Pviev2YfWquGiD+fofFTuBybUEyyl
         1qQBwD6EW/WhjsQoWl/WdI6l8WHBrHv5GNwA+ARI=
Message-ID: <6c0ba156-535d-b618-0b02-685423cd3589@ideasonboard.com>
Date:   Thu, 5 Oct 2023 14:53:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 09/28] media: Documentation: Document embedded data
 guidelines for camera sensors
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-10-sakari.ailus@linux.intel.com>
 <9e73537d-b32d-4abe-8dc2-390dbd9e566a@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <9e73537d-b32d-4abe-8dc2-390dbd9e566a@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2023 13:10, Hans Verkuil wrote:
> On 03/10/2023 13:52, Sakari Ailus wrote:
>> Document how embedded data support should be implemented for camera
>> sensors, and when and how CCS embedded data format should be referenced.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> ---
>>   .../media/drivers/camera-sensor.rst           | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
>> index 919a50e8b9d9..308f391c5ca1 100644
>> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
>> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
>> @@ -102,3 +102,31 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
>>   values programmed by the register sequences. The default values of these
>>   controls shall be 0 (disabled). Especially these controls shall not be inverted,
>>   independently of the sensor's mounting rotation.
>> +
>> +Embedded data
>> +-------------
>> +
>> +Many sensors, mostly raw sensors, support embedded data which is used to convey
>> +the sensor configuration for the captured frame back to the host. While CSI-2 is
>> +the most common bus used by such sensors, embedded data is not entirely limited
>> +to CSI-2 bus due to e.g. bridge devices.
> 
> I'm not quite sure what you mean with "embedded data is not entirely limited
> to CSI-2 bus due to e.g. bridge devices": do you just want to say: "embedded data
> can be available on other bus types as well."?

Right, nothing CSI-2 specific here. I have a parallel sensor that sends 
embedded data as the last (or was it first?) few lines of the frame.

Also, is this about sensors only, and more specifically, about 
generating the embedded data? If yes, why mention bridge devices (and 
should the title be "Embedded data generation" or such)? If not, is it 
about metadata in general, in which case bridges come into play?

>> +
>> +Embedded data support should use an internal source pad and route to the
> 
> should or shall/must?

Is the above necessary? I don't see anything wrong with, say, having a 
sensor represented with multiple subdevs, and one subdev is used for the 
embedded data generation.

Basically, anything that can be represented with internal pads can also 
be done with multiple subdevs, although I think you don't want to go the 
multiple subdev route unless absolutely necessary.

> Regards,
> 
> 	Hans
> 
>> +external pad. If embedded data output can be disabled in hardware, it should be
>> +possible to disable the embedded data route via ``VIDIOC_SUBDEV_S_ROUTING``
>> +IOCTL.
>> +
>> +In general, changing the embedded data format from the driver-configured values
>> +is not supported. The height of the metadata is hardware specific and the width
>> +is that (or less of that) of the image width, as configured on the pixel data
>> +stream.
>> +
>> +CCS and non-CCS embedded data
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +Embedded data which is compliant with CCS definitions shall use ``CCS embedded
>> +data format <MEDIA-BUS-FMT-CCS-EMBEDDED>``. Device specific embedded data which
>> +is compliant up to MIPI CCS embedded data levels 1 or 2 only shall refer to CCS
>> +embedded data formats and document the level of conformance. The rest of the
>> +device specific embedded data format shall be documented in the context of the
>> +data format itself.
> 

