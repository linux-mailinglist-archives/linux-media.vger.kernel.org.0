Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D50034192FC
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 13:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234040AbhI0LVw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 07:21:52 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51904 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234033AbhI0LVv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 07:21:51 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id C678E1F42393
Subject: Re: [PATCH v5 05/10] media: uapi: Add VP9 stateless decoder controls
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Daniel Almeida <daniel.almeida@collabora.com>
References: <20210922101146.13762-1-andrzej.p@collabora.com>
 <20210922101146.13762-6-andrzej.p@collabora.com> <YU37e90gldL7zHke@fedora>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <e7f228bc-d8d5-5857-a892-df1deee4be3e@collabora.com>
Date:   Mon, 27 Sep 2021 13:20:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YU37e90gldL7zHke@fedora>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Thank you for looking into the patch.

W dniu 24.09.2021 o 18:23, Ezequiel Garcia pisze:
> Hi Andrzej,
> 
> On Wed, Sep 22, 2021 at 12:11:41PM +0200, Andrzej Pietrasiewicz wrote:
>> Add the VP9 stateless decoder controls plus the documentation that goes
>> with it.
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>> ---
> [snip]
>> +
>> +#define V4L2_VP9_FRAME_FLAG_KEY_FRAME			0x001
>> +#define V4L2_VP9_FRAME_FLAG_SHOW_FRAME			0x002
>> +#define V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT		0x004
>> +#define V4L2_VP9_FRAME_FLAG_INTRA_ONLY			0x008
>> +#define V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV		0x010
>> +#define V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX		0x020
>> +#define V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE		0x040
>> +#define V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING		0x080
>> +#define V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING		0x100
>> +#define V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING	0x200
>> +
>> +#define V4L2_VP9_SIGN_BIAS_LAST				0x1
>> +#define V4L2_VP9_SIGN_BIAS_GOLDEN			0x2
>> +#define V4L2_VP9_SIGN_BIAS_ALT				0x4
>> +
>> +#define V4L2_VP9_RESET_FRAME_CTX_NONE			0
>> +#define V4L2_VP9_RESET_FRAME_CTX_SPEC			1
>> +#define V4L2_VP9_RESET_FRAME_CTX_ALL			2
>> +
>> +#define V4L2_VP9_INTERP_FILTER_EIGHTTAP			0
>> +#define V4L2_VP9_INTERP_FILTER_EIGHTTAP_SMOOTH		1
>> +#define V4L2_VP9_INTERP_FILTER_EIGHTTAP_SHARP		2
>> +#define V4L2_VP9_INTERP_FILTER_BILINEAR			3
>> +#define V4L2_VP9_INTERP_FILTER_SWITCHABLE		4
>> +
>> +#define V4L2_VP9_REFERENCE_MODE_SINGLE_REFERENCE	0
>> +#define V4L2_VP9_REFERENCE_MODE_COMPOUND_REFERENCE	1
>> +#define V4L2_VP9_REFERENCE_MODE_SELECT			2
>> +
>> +#define V4L2_VP9_PROFILE_MAX				3
>> +
>> +#define V4L2_CID_STATELESS_VP9_FRAME	(V4L2_CID_CODEC_STATELESS_BASE + 300)
>> +/**
>> + * struct v4l2_ctrl_vp9_frame - VP9 frame decoding control
>> + *
>> + * @lf: loop filter parameters. See &v4l2_vp9_loop_filter for more details
> 
> Seems these documentation is missing an ending period for many fields.

Thanks for catching punctuation mistakes :)

> 
>> + * @quant: quantization parameters. See &v4l2_vp9_quantization for more details
>> + * @seg: segmentation parameters. See &v4l2_vp9_segmentation for more details
>> + * @flags: combination of V4L2_VP9_FRAME_FLAG_* flags
>> + * @compressed_header_size: compressed header size in bytes
>> + * @uncompressed_header_size: uncompressed header size in bytes
>> + * @frame_width_minus_1: add 1 to it and you'll get the frame width expressed in pixels
>> + * @frame_height_minus_1: add 1 to it and you'll get the frame height expressed in pixels
>> + * @render_width_minus_1: add 1 to it and you'll get the expected render width expressed in
>> + *	pixels. This is not used during the decoding process but might be used by HW scalers
>> + *	to prepare a frame that's ready for scanout
>> + * @render_height_minus_1: add 1 to it and you'll get the expected render height expressed in
>> + *	pixels. This is not used during the decoding process but might be used by HW scalers
>> + *	to prepare a frame that's ready for scanout
>> + * @last_frame_ts: "last" reference buffer timestamp.
>> + * The timestamp refers to the timestamp field in struct v4l2_buffer.
>> + * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
>> + * @golden_frame_ts: "golden" reference buffer timestamp.
>> + * The timestamp refers to the timestamp field in struct v4l2_buffer.
>> + * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
>> + * @alt_frame_ts: "alt" reference buffer timestamp.
>> + * The timestamp refers to the timestamp field in struct v4l2_buffer.
>> + * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
>> + * @ref_frame_sign_bias: a bitfield specifying whether the sign bias is set for a given
>> + *	reference frame. Either of V4L2_VP9_SIGN_BIAS_*.
>> + * @reset_frame_context: specifies whether the frame context should be reset to default values.
>> + *	Either of V4L2_VP9_RESET_FRAME_CTX_*.
>> + * @frame_context_idx: frame context that should be used/updated
>> + * @profile: VP9 profile. Can be 0, 1, 2 or 3
>> + * @bit_depth: bits per components. Can be 8, 10 or 12. Note that not all profiles support
>> + *	10 and/or 12 bits depths
>> + * @interpolation_filter: specifies the filter selection used for performing inter prediction.
>> + *	Either of V4L2_VP9_INTERP_FILTER_*
>> + * @tile_cols_log2: specifies the base 2 logarithm of the width of each tile (where the width
>> + *	is measured in units of 8x8 blocks). Shall be less than or equal to 6
>> + * @tile_rows_log2: specifies the base 2 logarithm of the height of each tile (where the height
>> + *	is measured in units of 8x8 blocks)
>> + * @reference_mode: specifies the type of inter prediction to be used. See
> 
> See what? :-)
> 
>> + *	Either of V4L2_VP9_REFERENCE_MODE_*
> 
> Other controls use V4L2_VP9_REFERENCE_MODE_{}, {} instead of *.
> The same applies to all the documentation.

Will update in v6.

> 
>> + * @reserved: padding field. Should be zeroed by applications.
>> + */
>> +struct v4l2_ctrl_vp9_frame {
>> +	struct v4l2_vp9_loop_filter lf;
>> +	struct v4l2_vp9_quantization quant;
>> +	struct v4l2_vp9_segmentation seg;
>> +	__u32 flags;
>> +	__u16 compressed_header_size;
>> +	__u16 uncompressed_header_size;
>> +	__u16 frame_width_minus_1;
>> +	__u16 frame_height_minus_1;
>> +	__u16 render_width_minus_1;
>> +	__u16 render_height_minus_1;
>> +	__u64 last_frame_ts;
>> +	__u64 golden_frame_ts;
>> +	__u64 alt_frame_ts;
>> +	__u8 ref_frame_sign_bias;
>> +	__u8 reset_frame_context;
>> +	__u8 frame_context_idx;
>> +	__u8 profile;
>> +	__u8 bit_depth;
>> +	__u8 interpolation_filter;
>> +	__u8 tile_cols_log2;
>> +	__u8 tile_rows_log2;
>> +	__u8 reference_mode;
>> +	__u8 reserved[7];
>> +};
>> +
> 
> Also, have you checked html and pdf docs and make sure
> it looks as you expect?
> 

Yes I did and it looks as I expected.

> Thanks,
> Ezequiel
> 

