Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71E5189B44
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 12:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbfHLKUm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 06:20:42 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:50317 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727409AbfHLKUl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 06:20:41 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x7RMhPsWJur8Tx7RPhhsWh; Mon, 12 Aug 2019 12:20:39 +0200
Subject: Re: [PATCH v4 05/11] media: uapi: h264: Get rid of the p0/b0/b1
 ref-lists
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
References: <20190808103432.12062-1-ezequiel@collabora.com>
 <20190808103432.12062-6-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <62750a74-f856-c927-72a3-17d1a2624550@xs4all.nl>
Date:   Mon, 12 Aug 2019 12:20:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190808103432.12062-6-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJY4BazdN7WJ3DSblSp0zDmu9k6KFGREpid5O1fJ8eM+zm2zyzj3Zy64A2UAvGmlEvRnLQl931G3sXe9J+/CPHfnVdAG6SK1ywrFNhilrRbAsN/0bD0C
 XeMR0xn+zcMtvyYsKkKI3vhVjDZaSgv0D288ArlXpGIsCZj8kx0MgRwkk/nBDQnFIvmSfFvzU117I3dGNkASYypZFzSTKIlPBXb5VxushrXUHIwZ72LBg917
 DhlQ9JwGPXLR8vtCP4ef8+Lpz+AIvyZg/4hzuWxEQTRTJRiOi+hivwhp5QqIra0+rfmiLVu3i2t6q8/AYmDT0jt/GxDGs09v+XmtZZOud1V2SN2qM6t9jUle
 qCBKZ7kNsqla98Q/jiIDchdoHdi8jJVkEVhPb0C1IQ6nsVbk9fUIgjhuzp80YRZ9Sb/lz6t5mLIxT2mvbxX3CPk3va5sxWVKtM0IYEDyCdXsq+34hLuX0S8G
 WA6IJyU0TapZiKdDSSuxsLWnkb0tfjk58p+aa4eOkbE4s0o6IW9gMX5/QhdNVtXzou0oLMjsn+3Km+BS97pQ9l72NEwoQruB8epg46aVJF7aE/CeuD/ULbm/
 lKKxDusTaVFUm/aI2oDlg6PdslCywPIC/36R19GscM9qcH7isXYSzUzXjFDu4Ir7XJI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/8/19 12:34 PM, Ezequiel Garcia wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Those lists can be extracted from the dpb, let's simplify userspace
> life and build that list kernel-side (generic helpers will be provided
> for drivers that need this list).
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
> Changes in v4:
> * Add R-b

???

Nothing was added, left-over from some old version?

Regards,

	Hans

> * Remove the reflist from the struct
> 
> Changes in v3:
> * None
> 
> Changes in v2:
> * None
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 9 ---------
>  include/media/h264-ctrls.h                       | 3 ---
>  2 files changed, 12 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> index 94fd3a9b8b9e..d60909b2d1ca 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1942,15 +1942,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - __u16
>        - ``nal_ref_idc``
>        - NAL reference ID value coming from the NAL Unit header
> -    * - __u8
> -      - ``ref_pic_list_p0[32]``
> -      - Backward reference list used by P-frames in the original bitstream order
> -    * - __u8
> -      - ``ref_pic_list_b0[32]``
> -      - Backward reference list used by B-frames in the original bitstream order
> -    * - __u8
> -      - ``ref_pic_list_b1[32]``
> -      - Forward reference list used by B-frames in the original bitstream order
>      * - __s32
>        - ``top_field_order_cnt``
>        - Picture Order Count for the coded top field
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index 31555c99f64a..2de438393025 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -203,9 +203,6 @@ struct v4l2_ctrl_h264_decode_params {
>  	struct v4l2_h264_dpb_entry dpb[16];
>  	__u16 num_slices;
>  	__u16 nal_ref_idc;
> -	__u8 ref_pic_list_p0[32];
> -	__u8 ref_pic_list_b0[32];
> -	__u8 ref_pic_list_b1[32];
>  	__s32 top_field_order_cnt;
>  	__s32 bottom_field_order_cnt;
>  	__u32 flags; /* V4L2_H264_DECODE_PARAM_FLAG_* */
> 

