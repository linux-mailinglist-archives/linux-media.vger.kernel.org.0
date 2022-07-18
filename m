Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0182577C87
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 09:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbiGRH00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 03:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233791AbiGRH00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 03:26:26 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27307E0C0
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 00:26:23 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26HKKLqO022411;
        Mon, 18 Jul 2022 09:26:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GL6TKRorNoavtwpxss6e1PU72+YrbmMHwwJcTnQTmd0=;
 b=vH5/Kwaq/NUWaaO/Rpd70KCBazhdxVSOgnlxuGhyUkffsSsrfxWub39VLgGC4l+SwrRx
 uWIcTYkKVaZZl4YNq6EoIh/q9Xsv/GI0UH23Arw0Kc+Ux1vlniOG8mcUOirWNMydHpNu
 jP3+uWCR6e0zSXt0KLkrf+sVpcCg1qQOuJC0ZbkB3eGWac1GgZCTKDmHoD8gfL0dZUkd
 g9oRi/RktCjHNyRcwL1fzzw3lcV1E/WAbp4pKy2jLRz5bLFtxWCNd3LHWLg+FVbE3IS4
 vm8QvG5dUwN7odJK/f85Z+fCqA3BQ7i2yA/Bp+OP95QDz45kln32vfuFrxfvcu3K1da1 Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hbnkfykgp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 09:26:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 80F9410002A;
        Mon, 18 Jul 2022 09:26:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 70DF3211F33;
        Mon, 18 Jul 2022 09:26:06 +0200 (CEST)
Received: from [10.0.2.15] (10.75.127.46) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 18 Jul
 2022 09:26:06 +0200
Subject: Re: [PATCH v3 0/5] media: Add ST VGXY61 camera sensor driver
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>
References: <20220512074037.3829926-1-benjamin.mugnier@foss.st.com>
 <e920c5e2-dba1-bcf7-7d83-ee797ca51b49@foss.st.com>
 <5a4cbabe-c701-6ab3-adec-592289b7b52b@foss.st.com>
Message-ID: <7ae752d9-f7a5-a95a-79b3-437ef9aeeb74@foss.st.com>
Date:   Mon, 18 Jul 2022 09:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5a4cbabe-c701-6ab3-adec-592289b7b52b@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_04,2022-07-15_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Gentle ping :)

On 20/06/2022 09:30, Benjamin Mugnier wrote:
> Hi everyone,
> 
> Can somebody have a look at this series?
> Thank you.
> 
> Benjamin
> 
> On 01/06/2022 09:20, Benjamin Mugnier wrote:
>> Hey,
>>
>> Gentle ping, so that you don't forget about me ;)
>>
>> Benjamin
>>
>> On 12/05/2022 09:40, Benjamin Mugnier wrote:
>>> Hey,
>>>
>>> This series adds a driver for the ST VGXY61 camera sensor. This camera sensor is using the i2c bus
>>> for control and the csi-2 bus for data.
>>> These commits introduce the MEDIA_BUS_FMT_Y16_1X16 as a media bus format (1/5), reserve 16 user
>>> controls for the driver (2/5), add a uapi header file to declare a control for the hdr mode (3/5),
>>> dt bindings (3/5), and finally the driver (5/5).
>>> Tested on DragonBoard 410c and on Raspberry Pi 4.
>>>
>>> Unfortunately, I was not able to do the freely configurable frame size as advised by Laurent, and
>>> I'm stuck. I tried to mimic the ov5693 driver as it seems to work mostly the same but was not
>>> successful.
>>> I managed to implement the get_selection to set the sensor crop, and set the set_format call to the
>>> same frame size. By doing that my captured frame has black lines appearing if I don't use the sensor
>>> native resolution, and seem to have issues with matching the sensor internal frame size and the one
>>> I want to display (as lines appear wider than they should be).
>>> If anyone has an example driver for this please tell me. Any help is appreciated.
>>> I hope this fixed frame sizes will be ok, and I could come back to it later once I figure it out.
>>>
>>> Thanks,
>>>
>>> Benjamin
>>>
>>> v2->v3:
>>> - Fix errors in dt bindings
>>> - Use alphabetical order where applicable
>>> - Remove US_PER_MS macro
>>> - Rename device specific macros
>>> - Fix some control grabs not releasing
>>> - Move user controls to public header and add documentation
>>> - Rename set_framerate to set_framelength
>>> - Rework i2c access
>>> - Remove branchings that should never happen
>>> - Rework pattern generator setting
>>> - Update information on sensor rules of thumb
>>> - Remove temperature control
>>> - Remove suspend and resume
>>> - Move mutex init to probe
>>> - Move detect to probe
>>> - Fix async_subdev_register order
>>> - Support autosuspend
>>> - Add init_cfg
>>> - Fix controls not updating when sensor was off
>>> - Various cleaning
>>> - Rebase on master
>>>
>>> v1->v2:
>>> - Move temperature control to v4l2-controls.h as a standard control
>>> - Reserve controls in v4l2-controls.h for HDR control
>>> - Remove GPIO strobbing controls
>>> - Remove references to unused controls in sensor struct
>>> - Use v4l2_find_nearest_size
>>> - Use V4L2_COLORSPACE_RAW instead of V4L2_COLORSPACE_SRGB
>>> - Fill ycbcr_enc, quantization, and xfer_func in v4l2_mbus_framefmt
>>> - Change gain from formula to a register RAW write
>>> - Change temperature control value directly
>>> - Remove clock-name and clock-lanes from device tree bindings
>>> - Declare crop zones in mode_info structure
>>> - Remove frame_interval functions and add hblank and vblank instead
>>> - Update controls dependencies on change
>>> - Fix first exposure rule of thumb being too restrictive
>>> - Disable hflip and vflip controls while streaming
>>> - Change RGB media bus code to Y as the sensor is monochrome
>>> - Add Y16 format to v4l2 media bus formats
>>> - Add get_selection API
>>> - Fix timeout errors while disabling streaming on high framerates
>>> - Support pm_runtime
>>> - Rebase on master
>>>
>>> Benjamin Mugnier (5):
>>>   media: v4l: Add 1X16 16-bit greyscale media bus code definition
>>>   media: v4l: ctrls: Add user control base for st-vgxy61 controls
>>>   media: uapi: Add ST VGXY61 header file
>>>   media: dt-bindings: media: i2c: Add ST VGXY61 camera sensor binding
>>>   media: i2c: Add driver for ST VGXY61 camera sensor
>>>
>>>  .../bindings/media/i2c/st,st-vgxy61.yaml      |  117 +
>>>  .../userspace-api/media/drivers/st-vgxy61.rst |   23 +
>>>  .../media/v4l/subdev-formats.rst              |   37 +
>>>  MAINTAINERS                                   |    9 +
>>>  drivers/media/i2c/Kconfig                     |   10 +
>>>  drivers/media/i2c/Makefile                    |    1 +
>>>  drivers/media/i2c/st-vgxy61.c                 | 1940 +++++++++++++++++
>>>  include/uapi/linux/media-bus-format.h         |    3 +-
>>>  include/uapi/linux/st-vgxy61.h                |   15 +
>>>  include/uapi/linux/v4l2-controls.h            |    5 +
>>>  10 files changed, 2159 insertions(+), 1 deletion(-)
>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>>  create mode 100644 Documentation/userspace-api/media/drivers/st-vgxy61.rst
>>>  create mode 100644 drivers/media/i2c/st-vgxy61.c
>>>  create mode 100644 include/uapi/linux/st-vgxy61.h
>>>
