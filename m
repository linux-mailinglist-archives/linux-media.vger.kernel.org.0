Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B3720E3C7
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 00:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730137AbgF2VSL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 17:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729794AbgF2Swu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 14:52:50 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4595EC031C4F
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 10:33:54 -0700 (PDT)
Received: from [IPv6:2003:cb:8737:cf00:84c7:ee07:61e9:a21f] (p200300cb8737cf0084c7ee0761e9a21f.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:84c7:ee07:61e9:a21f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3ABD32A0C4E;
        Mon, 29 Jun 2020 18:33:52 +0100 (BST)
Subject: Re: [PATCH 00/25] media: ov5647: Support RaspberryPi Camera Module v1
To:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     mrodin@de.adit-jv.com, hugues.fruchet@st.com, mripard@kernel.org,
        aford173@gmail.com, sudipi@jp.adit-jv.com,
        andrew_gabbasov@mentor.com, erosca@de.adit-jv.com,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        dafna Hirschfeld <dafna3@gmail.com>
References: <20200623100815.10674-1-jacopo@jmondi.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <0cafeeb9-54bd-1a1b-3301-47b5b8542ae8@collabora.com>
Date:   Mon, 29 Jun 2020 19:33:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
Thanks for the series,

I tried to apply it on master and found out that the set
is rebased on top of the patchset
"dt-bidings: media: ov5647 bindings"
so running 'git am' without the other set fails.
Maybe better to merge the two sets or mention it in the cover letter.

Thanks,
Dafna



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
