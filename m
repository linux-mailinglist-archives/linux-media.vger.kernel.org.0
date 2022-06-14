Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF4954AB7A
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 10:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238418AbiFNILn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 04:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355719AbiFNILd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 04:11:33 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D68396B1;
        Tue, 14 Jun 2022 01:11:32 -0700 (PDT)
Received: from [IPV6:2a01:e0a:120:3210:4a7b:8d3a:acaa:ec46] (unknown [IPv6:2a01:e0a:120:3210:4a7b:8d3a:acaa:ec46])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 464A466016A2;
        Tue, 14 Jun 2022 09:11:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1655194290;
        bh=NauSAeX/lhX8ZGjseIOTWvWlEnvXCcyw5OBz9Na36p0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SMP9s+FyodV+0aqVnuQqXJcYKN42PqeKGOIlfM3ConZV2YpCA/6gArST6KalfCIJ7
         nhX4CxlV6aQ2Ts1Nn4T7tpNNF9XSelx8gLLlLC4WbRX/1BzzrWWfaus5lOdiypHM2K
         AdVN/PN6lhF8SfwaDprlseU9kP5eJ0NJI4rnQ5Z7hfZHEhFhUPaqTFw2jHnE5GfXDD
         R2Gm45uNSNDodbDBNhNGQO01ac7irFYGsCJXKLp4dlnFNTKNTmAx1oz5F+Z1KsBNI3
         +8qLyhvOQiuoBUes03kmoKza3I3e41jE7rir0xMehYhW7L3tMGpwvePVuCxTNiYd4c
         g3xji1gljj1WA==
Message-ID: <3194e713-656b-fc78-a62e-a1cd994617d9@collabora.com>
Date:   Tue, 14 Jun 2022 10:11:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v7 00/17] Move HEVC stateless controls out of staging
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        nicolas.dufresne@collabora.com, andrzej.p@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com
References: <20220614074947.160316-1-benjamin.gaignard@collabora.com>
 <434a4936-1374-a1d9-4204-2538f802267f@xs4all.nl>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <434a4936-1374-a1d9-4204-2538f802267f@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 14/06/2022 à 09:57, Hans Verkuil a écrit :
> Hi Benjamin,
>
> I tried to apply this patch series to the latest git://linuxtv.org/media_stage.git
> and it failed to apply. Can you rebase this series?

I have based it on media_tree/master branch.
If you want I will resend it based on media_stage/master branch

Regards,
Benjamin

>
> Regards,
>
> 	Hans
>
> On 6/14/22 09:49, Benjamin Gaignard wrote:
>> This series aims to make HEVC uapi stable and usable for hardware
>> decoder. HEVC uapi is used by 2 mainlined drivers (Cedrus and Hantro)
>> and 2 out of the tree drivers (rkvdec and RPI).
>>
>> version 7:
>> - Apply Jernej patches for Cedrus about bit offset definition and
>>    V4L2_CID_STATELESS_HEVC_SLICE_PARAMS being a dynamic array control.
>>
>> version 6:
>> - Add short_term_ref_pic_set_size and long_term_ref_pic_set_size
>>    in v4l2_ctrl_hevc_decode_params structure.
>> - Change slice_pic_order_cnt type to s32 to match with PoC type.
>> - Set V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag automatically when using
>>    V4L2_CID_STATELESS_HEVC_SLICE_PARAMS control.
>> - Add a define for max slices count
>> - Stop using Hantro dedicated control.
>>
>> This version has been tested with these branches:
>> - GStreamer: https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/tree/HEVC_aligned_with_kernel_5.15
>> - Linux: https://gitlab.collabora.com/benjamin.gaignard/for-upstream/-/tree/HEVC_UAPI_V6
>>
>> With patches to decode 10-bits bitstream and produce P010 frames the Fluster score
>> which was 77/147 before, is now 138/147.
>> The 10-bits series will comes after this because of it dependency to
>> uAPI change. If you are curious you can find the WIP branch here:
>> https://gitlab.collabora.com/benjamin.gaignard/for-upstream/-/commits/WIP_HEVC_UAPI_V6
>>
>> The 9 failing tests are:
>> - CONFWIN_A_Sony_1 which contains conformance_window_flag that isn't supported
>>    by the hardware (but visually ok aside a pixel shift).
>> - PICSIZE_{A,B,C,D}_Bossen_1 where resolutions are to big for Hantro hardware.
>> - TSKIP_A_MS_3 is ok when testing alone but fail (corrupted lines on the
>>    first frame) when running it after a couple of other tests.
>> - VPSSPSPPS_A_MainConcept_1 where there is an issue on gst parser side
>>    because of VPS/SPS/PPS ordering
>> - WPP_D_ericsson_MAIN_2 and WPP_D_ericsson_MAIN10_2 are visually ok but some
>>    difference exist on 5 decoded frames. Some pixels values are no the same
>>    the very end of few lines.
>>
>> version 6:
>> - Stop using Hantro dedicated control and compute the number
>>    of bytes to skip inside the driver.
>> - Rebased on media_tree/master
>>
>> version 5:
>> - Change __u16 pic_order_cnt[2] into __s32 pic_order_cnt_val in
>>    hevc_dpb_entry structure
>> - Add defines for SEI pic_struct values (patch 4)
>> - Fix numbers of bits computation in cedrus_h265_skip_bits() parameters
>> - Fix num_short_term_ref_pic_sets and num_long_term_ref_pics_sps
>>    documentation (patch 8)
>> - Rebased on v5-18-rc1
>>
>> GStreamer H265 decoder plugin aligned with HEVC uAPI v5:
>> https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/tree/HEVC_aligned_with_kernel_5.15
>>
>> Version 4:
>> - Add num_entry_point_offsets field in  struct v4l2_ctrl_hevc_slice_params
>> - Fix V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS name
>> - Initialize control V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS
>> - Fix space/tab issue in kernel-doc
>> - Add patch to change data_bit_offset definition
>> - Fix hantro-media SPDX license
>> - put controls under stateless section in v4l2-ctrls-defs.c
>>
>> At the end fluster tests results on IMX8MQ is 77/147 for HEVC codec.
>>
>> Benjamin Gaignard (14):
>>    media: uapi: HEVC: Add missing fields in HEVC controls
>>    media: uapi: HEVC: Rename HEVC stateless controls with STATELESS
>>      prefix
>>    media: uapi: HEVC: Change pic_order_cnt definition in
>>      v4l2_hevc_dpb_entry
>>    media: uapi: HEVC: Add SEI pic struct flags
>>    media: uapi: HEVC: Add documentation to uAPI structure
>>    media: uapi: HEVC: Define V4L2_CID_STATELESS_HEVC_SLICE_PARAMS as a
>>      dynamic array
>>    media: uapi: Move parsed HEVC pixel format out of staging
>>    media: uapi: Add V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS control
>>    media: uapi: Move the HEVC stateless control type out of staging
>>    media: controls: Log HEVC stateless control in .std_log
>>    media: hantro: Stop using Hantro dedicated control
>>    media: uapi: HEVC: fix padding in v4l2 control structures
>>    media: uapi: Change data_bit_offset definition
>>    media: uapi: move HEVC stateless controls out of staging
>>
>> Hans Verkuil (3):
>>    videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
>>    v4l2-ctrls: add support for dynamically allocated arrays.
>>    vivid: add dynamic array test control
>>
>>   .../media/v4l/ext-ctrls-codec-stateless.rst   | 897 ++++++++++++++++++
>>   .../media/v4l/ext-ctrls-codec.rst             | 780 ---------------
>>   .../media/v4l/pixfmt-compressed.rst           |   7 +-
>>   .../media/v4l/vidioc-g-ext-ctrls.rst          |  20 +
>>   .../media/v4l/vidioc-queryctrl.rst            |   8 +
>>   .../media/videodev2.h.rst.exceptions          |   5 +
>>   .../media/test-drivers/vivid/vivid-ctrls.c    |  15 +
>>   drivers/media/v4l2-core/v4l2-ctrls-api.c      | 103 +-
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c     | 206 +++-
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  38 +-
>>   drivers/media/v4l2-core/v4l2-ctrls-priv.h     |   3 +-
>>   drivers/media/v4l2-core/v4l2-ctrls-request.c  |  13 +-
>>   drivers/staging/media/hantro/hantro_drv.c     |  62 +-
>>   .../staging/media/hantro/hantro_g2_hevc_dec.c |  69 +-
>>   drivers/staging/media/hantro/hantro_hevc.c    |  10 +-
>>   drivers/staging/media/hantro/hantro_hw.h      |   4 +-
>>   drivers/staging/media/sunxi/cedrus/cedrus.c   |  25 +-
>>   .../staging/media/sunxi/cedrus/cedrus_dec.c   |  10 +-
>>   .../staging/media/sunxi/cedrus/cedrus_h265.c  |  23 +-
>>   .../staging/media/sunxi/cedrus/cedrus_video.c |   1 -
>>   include/media/hevc-ctrls.h                    | 250 -----
>>   include/media/v4l2-ctrls.h                    |  48 +-
>>   include/uapi/linux/v4l2-controls.h            | 458 +++++++++
>>   include/uapi/linux/videodev2.h                |  13 +
>>   24 files changed, 1848 insertions(+), 1220 deletions(-)
>>   delete mode 100644 include/media/hevc-ctrls.h
>>
