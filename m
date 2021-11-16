Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAEA0452C72
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 09:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbhKPIMr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 03:12:47 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33664 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbhKPIMq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 03:12:46 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 044A11F4542E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637050188; bh=LEicCsC4sTpMlpJrwfp3CWJxvgPG6cotp+f0OL83y1E=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GwRnZNUOMzcJSRXXNSjo60/T640lFlxBBs7PkBjfVlRZV/u6nt4eN+pc3aKHNz/+U
         20yGoMztPRoQ4xE4NZ+3Sekml4fPzW+Zgmn9q83h/n63BUBIoBDQ4WFBRd5WWeSrS8
         zXSSKn2Ly6MLVr0w+7WE9oGviquR5rm4GaquEXQDnOd0cwmkyjZV/rKgUJrQ6h3HSb
         Hil5n1u3NDkIn420abUz/YUEnfhPho0qIAx+kvkRpic1tHIdKuuEyjikGoGqMu1KyI
         fgVPTSl8EFbQ7kkvhwR7iOzA70KC0lVJakfpLQ0tYTLr+LT3aqbgjU79NNiGlDB5Tc
         pnVEhb5TK3hDA==
Subject: Re: [PATCH v7 00/11] VP9 codec V4L2 control interface
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com
References: <20210929160439.6601-1-andrzej.p@collabora.com>
 <9db47ebc-cb95-872d-feb4-d6432a74f2cb@xs4all.nl>
 <29f27bad-28ae-12ff-eed6-79902bd5b722@collabora.com>
 <b8f8ee2e-ea98-4700-f4ca-f0af68c9de5c@xs4all.nl>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <cdbbe5e6-0811-1276-1f62-fc7ad2628a30@collabora.com>
Date:   Tue, 16 Nov 2021 09:09:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b8f8ee2e-ea98-4700-f4ca-f0af68c9de5c@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

W dniu 15.11.2021 o 22:16, Hans Verkuil pisze:
> On 15/11/2021 18:14, Andrzej Pietrasiewicz wrote:
>> Hi Hans,
>>
>> W dniu 15.11.2021 o 16:07, Hans Verkuil pisze:
>>> Andrzej,
>>>
>>> Can you rebase this series on top of the master branch of
>>> https://git.linuxtv.org/media_stage.git/ ? Unfortunately this v7 no longer
>>> applies. Specifically "rkvdec: Add the VP9 backend" failed in a non-trivial
>>> manner.
>>
>> This is a branch for you:
>>
>> https://gitlab.collabora.com/linux/for-upstream/-/tree/vp9-uapi
> 
> I'm getting a bunch of sparse/smatch warnings:
> 

Thanks for finding this, I will re-create the branch and let you know on irc.
Some of the below are "false positives, namely:

drivers/media/platform/omap3isp/omap3isp.h
drivers/media/platform/qcom/venus/core.h

which are not touched by the series.

Regards,

Andrzej

> sparse:
> rkvdec/rkvdec-vp9.c:190:43: warning: variable 'dec_params' set but not used [-Wunused-but-set-variable]
> rkvdec/rkvdec-vp9.c:245:43: warning: variable 'dec_params' set but not used [-Wunused-but-set-variable]
> SPARSE:hantro/hantro_postproc.c hantro/hantro_postproc.c:37:35: warning: symbol 'hantro_g1_postproc_regs' was not declared. Should it be static?
> 
> smatch:
> rkvdec/rkvdec-vp9.c:190:43: warning: variable 'dec_params' set but not used [-Wunused-but-set-variable]
> rkvdec/rkvdec-vp9.c:245:43: warning: variable 'dec_params' set but not used [-Wunused-but-set-variable]
> rkvdec/rkvdec-vp9.c: rkvdec/rkvdec-vp9.c:236 init_intra_only_probs() error: buffer overflow 'ptr' 90 <= 91
> hantro/hantro_g2_vp9_dec.c: hantro/hantro_g2_vp9_dec.c:670 config_probs() error: memcpy() 'adaptive->inter_mode[i]' too small (4 vs 21)
> hantro/hantro_g2_vp9_dec.c: hantro/hantro_g2_vp9_dec.c:670 config_probs() error: memcpy() 'probs->inter_mode[i]' too small (3 vs 21
> 
> Also a bunch of kerneldoc warnings:
> 
> include/media/v4l2-vp9.h:30: warning: Function parameter or member 'joint' not described in 'v4l2_vp9_frame_mv_context'
> include/media/v4l2-vp9.h:30: warning: Function parameter or member 'sign' not described in 'v4l2_vp9_frame_mv_context'
> include/media/v4l2-vp9.h:30: warning: Function parameter or member 'classes' not described in 'v4l2_vp9_frame_mv_context'
> include/media/v4l2-vp9.h:30: warning: Function parameter or member 'class0_bit' not described in 'v4l2_vp9_frame_mv_context'
> include/media/v4l2-vp9.h:30: warning: Function parameter or member 'bits' not described in 'v4l2_vp9_frame_mv_context'
> include/media/v4l2-vp9.h:30: warning: Function parameter or member 'class0_fr' not described in 'v4l2_vp9_frame_mv_context'
> include/media/v4l2-vp9.h:30: warning: Function parameter or member 'fr' not described in 'v4l2_vp9_frame_mv_context'
> include/media/v4l2-vp9.h:30: warning: Function parameter or member 'class0_hp' not described in 'v4l2_vp9_frame_mv_context'
> include/media/v4l2-vp9.h:30: warning: Function parameter or member 'hp' not described in 'v4l2_vp9_frame_mv_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'tx8' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'tx16' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'tx32' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'coef' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'skip' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'inter_mode' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'interp_filter' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'is_inter' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'comp_mode' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'single_ref' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'comp_ref' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'y_mode' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'uv_mode' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'partition' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:58: warning: Function parameter or member 'mv' not described in 'v4l2_vp9_frame_context'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'partition' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'skip' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'intra_inter' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'tx32p' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'tx16p' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'tx8p' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'y_mode' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'uv_mode' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'comp' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'comp_ref' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'single_ref' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'mv_mode' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'filter' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'mv_joint' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'sign' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'classes' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'class0' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'bits' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'class0_fp' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'fp' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'class0_hp' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'hp' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'coeff' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:93: warning: Function parameter or member 'eob' not described in 'v4l2_vp9_frame_symbol_counts'
> include/media/v4l2-vp9.h:166: warning: expecting prototype for v4l2_vp9_adapt_coef_probs(). Prototype was for v4l2_vp9_adapt_noncoef_probs()
> instead
> drivers/media/platform/omap3isp/omap3isp.h:107: warning: Function parameter or member 'vp_clk_pol' not described in 'isp_ccp2_cfg'
> drivers/media/platform/omap3isp/omap3isp.h:107: warning: Function parameter or member 'lanecfg' not described in 'isp_ccp2_cfg'
> drivers/media/platform/qcom/venus/core.h:202: warning: Function parameter or member 'sys_err_done' not described in 'venus_core'
> drivers/media/platform/qcom/venus/core.h:462: warning: Function parameter or member 'fw_min_cnt' not described in 'venus_inst'
> drivers/media/platform/qcom/venus/core.h:462: warning: Function parameter or member 'flags' not described in 'venus_inst'
> drivers/media/platform/qcom/venus/core.h:462: warning: Function parameter or member 'dpb_ids' not described in 'venus_inst'
> drivers/staging/media/hantro/hantro.h:115: warning: Enum value 'HANTRO_MODE_VP9_DEC' not described in enum 'hantro_codec_mode'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'tile_edge' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'segment_map' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'misc' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'cnts' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'probability_tables' not described in
> 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'frame_context' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'cur' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'last' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'bsd_ctrl_offset' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'segment_map_size' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'ctx_counters_offset' not described in
> 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'tile_info_offset' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'tile_r_info' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'tile_c_info' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'last_tile_r' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'last_tile_c' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'last_sbs_r' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'last_sbs_c' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'active_segment' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'feature_enabled' not described in 'hantro_vp9_dec_hw_ctx'
> drivers/staging/media/hantro/hantro_hw.h:211: warning: Function parameter or member 'feature_data' not described in 'hantro_vp9_dec_hw_ctx'
> 
> You can test kerneldoc yourself with: scripts/kernel-doc -none include/media/v4l2-vp9.h
> 
> Regards,
> 
> 	Hans
> 
>>
>> Regards,
>>
>> Andrzej
>>
>>
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>> On 29/09/2021 18:04, Andrzej Pietrasiewicz wrote:
>>>> Dear all,
>>>>
>>>> This patch series adds VP9 codec V4L2 control interface and two drivers
>>>> using the new controls. It is a follow-up of previous v6 series [1].
>>>>
>>>> In this iteration, we've implemented VP9 hardware decoding on two devices:
>>>> Rockchip VDEC and Hantro G2, and tested on RK3399, i.MX8MQ and i.MX8MP.
>>>> The i.MX8M driver needs proper power domains support, though, which is a
>>>> subject of a different effort, but in all 3 cases we were able to run the
>>>> drivers.
>>>>
>>>> GStreamer support is also available, the needed changes have been submitted
>>>> by Daniel Almeida [2]. This MR is ready to be merged, and just needs the
>>>> VP9 V4L2 controls to be merged and released.
>>>>
>>>> Both rkvdec and hantro drivers are passing a significant number of VP9 tests
>>>> using Fluster[3]. There are still a few tests that are not passing, due to
>>>> dynamic frame resize (not yet supported by V4L2) and small size videos
>>>> (due to IP block limitations).
>>>>
>>>> The series adds the VP9 codec V4L2 control API as uAPI, so it aims at being
>>>> merged without passing through staging, as agreed[4]. The ABI has been checked
>>>> for padding and verified to contain no holes.
>>>>
>>>> [1] https://patchwork.linuxtv.org/project/linux-media/list/?series=6377
>>>> [2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/merge_requests/2144
>>>> [3] https://github.com/fluendo/fluster
>>>> [4] https://lore.kernel.org/linux-media/b8f83c93-67fd-09f5-9314-15746cbfdc61@xs4all.nl/
>>>>
>>>> The series depends on the YUV tiled format support prepared by Ezequiel:
>>>> https://www.spinics.net/lists/linux-media/msg197047.html
>>>>
>>>> Rebased onto latest media_tree.
>>>>
>>>> Changes related to v6:
>>>> - moved setting tile filter and tile bsd auxiliary buffer addresses so
>>>> that they are always set, even if no tiles are used (thanks, Jernej)
>>>> - added a comment near the place where the 32-bit DMA mask is applied
>>>>     (thanks, Nicolas)
>>>> - improved consistency in register names (thanks, Nicolas)
>>>>
>>>> Changes related to v5:
>>>> - improved the doc comments as per Ezequiel's review (thanks, Ezequiel)
>>>> - improved pdf output of documentation
>>>> - added Benjamin's Reviewed-by (thanks, Benjamin)
>>>>
>>>> Changes related to v4:
>>>> - removed unused enum v4l2_vp9_intra_prediction_mode
>>>> - converted remaining enums to defines to follow the convention
>>>> - improved the documentation, in particular better documented how to use segmentation
>>>> features
>>>>
>>>> Changes related to v3:
>>>>
>>>> Apply suggestions from Jernej's review (thanks, Jernej):
>>>> - renamed a control and two structs:
>>>> 	V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR_PROBS =>
>>>> 		V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR
>>>> 	v4l2_ctrl_vp9_compressed_hdr_probs =>
>>>> 		v4l2_ctrl_vp9_compressed_hdr
>>>> 	v4l2_vp9_mv_compressed_hdr_probs => v4l2_vp9_mv_probs
>>>> - moved tx_mode to v4l2_ctrl_vp9_compressed_hdr
>>>> - fixed enum v4l2_vp9_ref_frame_sign_bias values (which are used to test a bitfield)
>>>> - explicitly assigned values to all other vp9 enums
>>>>
>>>> Apply suggestion from Nicolas's review (thanks, Nicolas):
>>>> - explicitly stated that the v4l2_ctrl_vp9_compressed_hdr control is optional
>>>> and implemented only by drivers which need it
>>>>
>>>> Changes related to the RFC v2:
>>>>
>>>> - added another driver including a postprocessor to de-tile
>>>>           codec-specific tiling
>>>> - reworked uAPI structs layout to follow VP8 style
>>>> - changed validation of loop filter params
>>>> - changed validation of segmentation params
>>>> - changed validation of VP9 frame params
>>>> - removed level lookup array from loop filter struct
>>>>           (can be computed by drivers)
>>>> - renamed some enum values to match the spec more closely
>>>> - V4L2 VP9 library changed the 'eob' member of
>>>>           'struct v4l2_vp9_frame_symbol_counts' so that it is an array
>>>>           of pointers instead of an array of pointers to arrays
>>>>           (IPs such as g2 creatively pass parts of the 'eob' counts in
>>>>           the 'coeff' counts)
>>>> - factored out several repeated portions of code
>>>> - minor nitpicks and cleanups
>>>>
>>>> Andrzej Pietrasiewicz (6):
>>>>     media: uapi: Add VP9 stateless decoder controls
>>>>     media: Add VP9 v4l2 library
>>>>     media: hantro: Rename registers
>>>>     media: hantro: Prepare for other G2 codecs
>>>>     media: hantro: Support VP9 on the G2 core
>>>>     media: hantro: Support NV12 on the G2 core
>>>>
>>>> Boris Brezillon (1):
>>>>     media: rkvdec: Add the VP9 backend
>>>>
>>>> Ezequiel Garcia (4):
>>>>     hantro: postproc: Fix motion vector space size
>>>>     hantro: postproc: Introduce struct hantro_postproc_ops
>>>>     hantro: Simplify postprocessor
>>>>     hantro: Add quirk for NV12/NV12_4L4 capture format
>>>>
>>>>    .../userspace-api/media/v4l/biblio.rst        |   10 +
>>>>    .../media/v4l/ext-ctrls-codec-stateless.rst   |  573 +++++
>>>>    .../media/v4l/pixfmt-compressed.rst           |   15 +
>>>>    .../media/v4l/vidioc-g-ext-ctrls.rst          |    8 +
>>>>    .../media/v4l/vidioc-queryctrl.rst            |   12 +
>>>>    .../media/videodev2.h.rst.exceptions          |    2 +
>>>>    drivers/media/v4l2-core/Kconfig               |    4 +
>>>>    drivers/media/v4l2-core/Makefile              |    1 +
>>>>    drivers/media/v4l2-core/v4l2-ctrls-core.c     |  180 ++
>>>>    drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    8 +
>>>>    drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>>>>    drivers/media/v4l2-core/v4l2-vp9.c            | 1850 +++++++++++++++++
>>>>    drivers/staging/media/hantro/Kconfig          |    1 +
>>>>    drivers/staging/media/hantro/Makefile         |    7 +-
>>>>    drivers/staging/media/hantro/hantro.h         |   40 +-
>>>>    drivers/staging/media/hantro/hantro_drv.c     |   23 +-
>>>>    drivers/staging/media/hantro/hantro_g2.c      |   27 +
>>>>    .../staging/media/hantro/hantro_g2_hevc_dec.c |   69 +-
>>>>    drivers/staging/media/hantro/hantro_g2_regs.h |  132 +-
>>>>    .../staging/media/hantro/hantro_g2_vp9_dec.c  |  980 +++++++++
>>>>    drivers/staging/media/hantro/hantro_hw.h      |   83 +-
>>>>    .../staging/media/hantro/hantro_postproc.c    |   79 +-
>>>>    drivers/staging/media/hantro/hantro_v4l2.c    |   20 +
>>>>    drivers/staging/media/hantro/hantro_vp9.c     |  240 +++
>>>>    drivers/staging/media/hantro/hantro_vp9.h     |  103 +
>>>>    drivers/staging/media/hantro/imx8m_vpu_hw.c   |   38 +-
>>>>    .../staging/media/hantro/rockchip_vpu_hw.c    |    7 +-
>>>>    .../staging/media/hantro/sama5d4_vdec_hw.c    |    3 +-
>>>>    drivers/staging/media/rkvdec/Kconfig          |    1 +
>>>>    drivers/staging/media/rkvdec/Makefile         |    2 +-
>>>>    drivers/staging/media/rkvdec/rkvdec-vp9.c     | 1078 ++++++++++
>>>>    drivers/staging/media/rkvdec/rkvdec.c         |   52 +-
>>>>    drivers/staging/media/rkvdec/rkvdec.h         |   12 +-
>>>>    include/media/v4l2-ctrls.h                    |    4 +
>>>>    include/media/v4l2-vp9.h                      |  182 ++
>>>>    include/uapi/linux/v4l2-controls.h            |  284 +++
>>>>    include/uapi/linux/videodev2.h                |    6 +
>>>>    37 files changed, 6033 insertions(+), 104 deletions(-)
>>>>    create mode 100644 drivers/media/v4l2-core/v4l2-vp9.c
>>>>    create mode 100644 drivers/staging/media/hantro/hantro_g2.c
>>>>    create mode 100644 drivers/staging/media/hantro/hantro_g2_vp9_dec.c
>>>>    create mode 100644 drivers/staging/media/hantro/hantro_vp9.c
>>>>    create mode 100644 drivers/staging/media/hantro/hantro_vp9.h
>>>>    create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c
>>>>    create mode 100644 include/media/v4l2-vp9.h
>>>>
>>>>
>>>> base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
>>>>
>>>
>>
> 

