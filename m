Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12BBB21BA24
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 18:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgGJQAC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 12:00:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43072 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbgGJQAB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 12:00:01 -0400
Received: from [IPv6:2003:cb:8737:cf00:b1e0:33ea:13e:2fa7] (p200300cb8737cf00b1e033ea013e2fa7.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:b1e0:33ea:13e:2fa7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7A1A82A69E4;
        Fri, 10 Jul 2020 16:59:59 +0100 (BST)
Subject: Re: [PATCH 00/25] media: ov5647: Support RaspberryPi Camera Module v1
To:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     andrew_gabbasov@mentor.com, mrodin@de.adit-jv.com,
        mripard@kernel.org, libcamera-devel@lists.libcamera.org,
        sudipi@jp.adit-jv.com, hugues.fruchet@st.com,
        erosca@de.adit-jv.com, aford173@gmail.com,
        linux-media@vger.kernel.org
References: <20200623100815.10674-1-jacopo@jmondi.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <09d5ae97-3576-0666-20ed-29c00ce28ee2@collabora.com>
Date:   Fri, 10 Jul 2020 17:59:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 23.06.20 12:07, Jacopo Mondi wrote:
> -------------------------------------------------------------------------------
> Second attempt after my ISP blocked the part of the first sending.
> Also removed Luis Oliveira email from the receiver list as it gets
> bounced back.
> 550 5.1.1 <lolivei@synopsys.com>... User unknown
> -------------------------------------------------------------------------------
> 
> Hello,
>    this series improves and expand the existing ov5647 sensor driver to
> the same feature level as found in RaspberryPi BSP.
> 
> It is based on recent media tree master and the sensor bindings conversion
> to dt-schema I sent out a few days ago:
> "[PATCH 0/2] dt-bidings: media: ov5647 bindings + small fix"
> 
> The first patches in the series has been sent by Roman as part of
> "[PATCH v2 0/6] ov5647 driver improvement"
> I took his patches in, addressed review comments and rebased on top
> of the new dt-schema bindings. I kept the extensive receiver list he had
> in his series for this reason.
> 
> The series continues by polishing and cleaning up the driver and expanding
> its functionalities to support multiple modes and image formats.
> 
> The series has been tested with libcamera and the driver functionalities
> compared with the BSP driver ones, and tested stand-alone by capturing
> raw frames with yavta.

Hi,
Tested it on rock-pi 4 board with rkisp1 driver for the isp,
using the command 'cam -c 1 -C --file="/tmp/libcamframe#.data" -s width=800,height=600'
from libcamera.

This the branch: https://gitlab.collabora.com/dafna/linux/-/tree/test-ov5647-10-jul
The top commit is the ov5647 dts node:
https://gitlab.collabora.com/dafna/linux/-/commit/6aa58e6c5378dc20fce9fcc0ef68916ae3fa7b22

Tested-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> 
> Thanks
>     j
> 
> Dave Stevenson (8):
>    media: ov5647: Add support for PWDN GPIO.
>    media: ov5647: Add support for non-continuous clock mode
>    media: ov5647: Add set_fmt and get_fmt calls.
>    media: ov5647: Add support for get_selection()
>    media: ov5647: Set V4L2_SUBDEV_FL_HAS_EVENTS flag
>    media: ov5647: Support V4L2_CID_PIXEL_RATE
>    media: ov5647: Support V4L2_CID_VBLANK control
>    media: ov5647: Advertise the correct exposure range
> 
> David Plowman (1):
>    media: ov5647: Support gain, exposure and AWB controls
> 
> Jacopo Mondi (16):
>    dt-bindings: media: ov5647: Document pwdn-gpios
>    dt-bindings: media: ov5647: Document clock-noncontinuous
>    media: ov5647: Fix format initialization
>    media: ov5647: Fix style issues
>    media: ov5647: Replace license with SPDX identifier
>    media: ov5647: Fix return value from read/write
>    media: ov5647: Program mode at s_stream(1) time
>    media: ov5647: Implement enum_frame_size()
>    media: ov5647: Protect s_stream() with mutex
>    media: ov5647: Rationalize driver structure name
>    media: ov5647: Break out format handling
>    media: ov5647: Rename SBGGR8 VGA mode
>    media: ov5647: Add SGGBR10_1X10 modes
>    media: ov5647: Implement set_fmt pad operation
>    media: ov5647: Program mode only if it has changed
>    media: ov5647: Support V4L2_CID_HBLANK control
> 
>   .../devicetree/bindings/media/i2c/ov5647.yaml |   11 +
>   drivers/media/i2c/ov5647.c                    | 1267 +++++++++++++++--
>   2 files changed, 1126 insertions(+), 152 deletions(-)
> 
> --
> 2.27.0
> 
> _______________________________________________
> libcamera-devel mailing list
> libcamera-devel@lists.libcamera.org
> https://lists.libcamera.org/listinfo/libcamera-devel
> 
