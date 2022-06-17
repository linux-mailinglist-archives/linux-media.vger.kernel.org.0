Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9B454F60D
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 12:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236254AbiFQK7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 06:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236167AbiFQK7E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 06:59:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C826066FBC;
        Fri, 17 Jun 2022 03:59:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 87DAEB828D2;
        Fri, 17 Jun 2022 10:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDED4C3411B;
        Fri, 17 Jun 2022 10:58:55 +0000 (UTC)
Message-ID: <ae3a7a1b-23bf-ecc8-5afe-2c3ce4ecec05@xs4all.nl>
Date:   Fri, 17 Jun 2022 12:58:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v9 00/17] Move HEVC stateless controls out of staging
Content-Language: en-US
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        nicolas.dufresne@collabora.com, andrzej.p@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com
References: <20220617083545.133920-1-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220617083545.133920-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On 6/17/22 10:35, Benjamin Gaignard wrote:
> This series aims to make HEVC uapi stable and usable for hardware
> decoder. HEVC uapi is used by 2 mainlined drivers (Cedrus and Hantro)
> and 2 out of the tree drivers (rkvdec and RPI).
> 
> version 9:
> - Reword some commit message
> - Use fls()
> - Remove useless padding at the end of hevc structures
> - Reword all _minus* field description
> - change CVS to codec video sequence
> - Fix various typo
> - Fix undefined label: v4l2-ctrl-flag-dynamic-array warning
> - fix the waring reported by 'scripts/kernel-doc -none
>   include/uapi/linux/v4l2-controls.h'

This looks great, all my tests (sparse, smatch, etc) pass and all my issues are now
addressed.

So all I need is some more Acked-by/Reviewed-by tags for this series, esp. from Nicolas.

Once I have that I'll make a PR for this.

Regards,

	Hans

> 
> This version has been tested with these branches:
> - GStreamer: https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/tree/HEVC_aligned_with_kernel_5.15
> - Linux: https://gitlab.collabora.com/benjamin.gaignard/for-upstream/-/tree/HEVC_UAPI_V9
> 
> With patches to decode 10-bits bitstream and produce P010 frames the Fluster score 
> which was 77/147 before, is now 141/147.
> The 10-bits series will comes after this because of it dependency to
> uAPI change. If you are curious you can find the WIP branch here:
> https://gitlab.collabora.com/benjamin.gaignard/for-upstream/-/commits/WIP_HEVC_UAPI_V9
> 
> The 6 failing tests are:
> - PICSIZE_{A,B,C,D}_Bossen_1 where resolutions are to big for Hantro hardware.
> - WPP_D_ericsson_MAIN_2 and WPP_D_ericsson_MAIN10_2 are visually ok but some 
>   difference exist on 5 decoded frames. Some pixels values are no the same 
>   the very end of few lines.
> 
> version 8:
> - Same than v7 but rebased on media_stage/master
> 
> version 7:
> - Apply Jernej patches for Cedrus about bit offset definition and
>   V4L2_CID_STATELESS_HEVC_SLICE_PARAMS being a dynamic array control.
> - Based on media_tree/master
> 
> version 6:
> - Add short_term_ref_pic_set_size and long_term_ref_pic_set_size
>   in v4l2_ctrl_hevc_decode_params structure.
> - Change slice_pic_order_cnt type to s32 to match with PoC type.
> - Set V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag automatically when using
>   V4L2_CID_STATELESS_HEVC_SLICE_PARAMS control.
> - Add a define for max slices count
> - Stop using Hantro dedicated control.
> 
> version 5:
> - Change __u16 pic_order_cnt[2] into __s32 pic_order_cnt_val in
>   hevc_dpb_entry structure
> - Add defines for SEI pic_struct values (patch 4)
> - Fix numbers of bits computation in cedrus_h265_skip_bits() parameters
> - Fix num_short_term_ref_pic_sets and num_long_term_ref_pics_sps
>   documentation (patch 8)
> - Rebased on v5-18-rc1
> 
> Version 4:
> - Add num_entry_point_offsets field in  struct v4l2_ctrl_hevc_slice_params
> - Fix V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS name
> - Initialize control V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS
> - Fix space/tab issue in kernel-doc
> - Add patch to change data_bit_offset definition
> - Fix hantro-media SPDX license
> - put controls under stateless section in v4l2-ctrls-defs.c
> 
> Benjamin Gaignard (14):
>   media: uapi: HEVC: Add missing fields in HEVC controls
>   media: uapi: HEVC: Rename HEVC stateless controls with STATELESS
>     prefix
>   media: uapi: HEVC: Change pic_order_cnt definition in
>     v4l2_hevc_dpb_entry
>   media: uapi: HEVC: Add SEI pic struct flags
>   media: uapi: HEVC: Add documentation to uAPI structure
>   media: uapi: HEVC: Define V4L2_CID_STATELESS_HEVC_SLICE_PARAMS as a
>     dynamic array
>   media: uapi: Move parsed HEVC pixel format out of staging
>   media: uapi: Add V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS control
>   media: uapi: Move the HEVC stateless control type out of staging
>   media: controls: Log HEVC stateless control in .std_log
>   media: hantro: Stop using Hantro dedicated control
>   media: uapi: HEVC: fix padding in v4l2 control structures
>   media: uapi: Change data_bit_offset definition
>   media: uapi: move HEVC stateless controls out of staging
> 
> Hans Verkuil (3):
>   videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
>   v4l2-ctrls: add support for dynamically allocated arrays.
>   vivid: add dynamic array test control
> 
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 897 ++++++++++++++++++
>  .../media/v4l/ext-ctrls-codec.rst             | 780 ---------------
>  .../media/v4l/pixfmt-compressed.rst           |   7 +-
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  20 +
>  .../media/v4l/vidioc-queryctrl.rst            |   8 +
>  .../media/videodev2.h.rst.exceptions          |   6 +
>  .../media/test-drivers/vivid/vivid-ctrls.c    |  15 +
>  drivers/media/v4l2-core/v4l2-ctrls-api.c      | 103 +-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 212 ++++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  38 +-
>  drivers/media/v4l2-core/v4l2-ctrls-priv.h     |   3 +-
>  drivers/media/v4l2-core/v4l2-ctrls-request.c  |  13 +-
>  drivers/staging/media/hantro/hantro_drv.c     |  62 +-
>  .../staging/media/hantro/hantro_g2_hevc_dec.c |  44 +-
>  drivers/staging/media/hantro/hantro_hevc.c    |  10 +-
>  drivers/staging/media/hantro/hantro_hw.h      |   4 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  26 +-
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  10 +-
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  |  23 +-
>  .../staging/media/sunxi/cedrus/cedrus_video.c |   1 -
>  include/media/hevc-ctrls.h                    | 250 -----
>  include/media/v4l2-ctrls.h                    |  48 +-
>  include/uapi/linux/v4l2-controls.h            | 459 +++++++++
>  include/uapi/linux/videodev2.h                |  13 +
>  24 files changed, 1826 insertions(+), 1226 deletions(-)
>  delete mode 100644 include/media/hevc-ctrls.h
> 
