Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58FF539D63C
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 09:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhFGHpR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 03:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhFGHpQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 03:45:16 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CDB3C061766;
        Mon,  7 Jun 2021 00:43:26 -0700 (PDT)
Received: from [IPv6:2a01:e0a:4cb:a870:6b79:f23c:29c1:895d] (unknown [IPv6:2a01:e0a:4cb:a870:6b79:f23c:29c1:895d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 09C031F42088;
        Mon,  7 Jun 2021 08:43:23 +0100 (BST)
Subject: Re: [PATCH 1/2] media: hevc: Add segment address field
To:     Jernej Skrabec <jernej.skrabec@gmail.com>, mripard@kernel.org,
        paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20210606082314.454193-1-jernej.skrabec@gmail.com>
 <20210606082314.454193-2-jernej.skrabec@gmail.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <82dfa0fa-995a-93af-dce7-79763e762cc3@collabora.com>
Date:   Mon, 7 Jun 2021 09:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210606082314.454193-2-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 06/06/2021 à 10:23, Jernej Skrabec a écrit :
> If HEVC frame consists of multiple slices, segment address has to be
> known in order to properly decode it.
>
> Add segment address field to slice parameters.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 3 +++
>   include/media/hevc-ctrls.h                                | 3 ++-
>   2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 9120c5bcaf90..fac4b477da82 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -2997,6 +2997,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>       * - __u8
>         - ``pic_struct``
>         -
> +    * - __u32
> +      - ``slice_segment_addr``
> +      -
>       * - __u8
>         - ``ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>         - The list of L0 reference elements as indices in the DPB.
> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> index dc964ff7cd29..19f8e2ad3375 100644
> --- a/include/media/hevc-ctrls.h
> +++ b/include/media/hevc-ctrls.h
> @@ -197,10 +197,11 @@ struct v4l2_ctrl_hevc_slice_params {
>   	__u8	pic_struct;
>   
>   	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
> +	__u32	slice_segment_addr;
>   	__u8	ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>   	__u8	ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>   
> -	__u8	padding[5];
> +	__u8	padding;
>   
>   	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Weighted prediction parameter */
>   	struct v4l2_hevc_pred_weight_table pred_weight_table;
