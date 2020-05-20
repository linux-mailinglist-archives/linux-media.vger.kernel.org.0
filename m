Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0BB1DB4EC
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 15:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgETN0i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 09:26:38 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:33781 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726452AbgETN0h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 09:26:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id bOjujbxAAdPgTbOjxjMhAf; Wed, 20 May 2020 15:26:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589981194; bh=4/ctTwsXiPSb4NvmDrcyK5FdCsKojjn+cNP9JMI3QBg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=D2qZ2l/Z28Uf7C5bqYrMpTwYRRn7vMimvP7piDPZS1zpq3KJb5DjRJWMrl5qyO6pw
         vtfBQRZX5sFQwr21G9xgwl1kQzIJX0lCVf9sGxGrOwrqK04XZGfbbmZwHOAvAiMFHA
         34CyqsALCVF4trphNCZ2K8OcJfHlzJqUIxaQeNPvWRP8/8eBCVAWdRw1dgqoG1KFzU
         Zlf87K3Jln8jbJwQhzG/WbuNptt03ItLiM3OGLNhVakXLB2uWN+PrKlmeuKrPu91A/
         ZGBCyXV/nKCZDcm2ZSi8yWdW0zmzY8xG8zaOcUwcpxpaXikA2C11a9McHSVxR1EI4f
         UuMOnbAtNsc+w==
Subject: Re: [PATCH v4 2/3] media: uapi: Add VP9 stateless decoder controls
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        gustavo.padovan@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
References: <20200518174011.15543-1-ezequiel@collabora.com>
 <20200518174011.15543-3-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c9e71d67-746c-b71e-c8df-d41d7074c20a@xs4all.nl>
Date:   Wed, 20 May 2020 15:26:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200518174011.15543-3-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIJN1LDVCGpOOo4VPXXfFlMHaUJJAd/AzWJlRmvlAOexvk5d2LNhMkOV/xVHo+mBUAFmxCzGZBHvRsKcHAtPEfivxyjvjA2CpNqAtWQ8eppn2Djj/WnU
 A7AVgS2PvvB4++xi6hR9XDeFHoImYe5u5JTZc9qpGjamLxsJYEDdhpGjH7XLpJRs5tIMrC4+hU5nap6FIA/gX20Svb82dcmMpAYm1BGsA6AsRY19C66K+2WW
 3K6DWb0HnHDuguuGcji+dv7PJcqB1mO5bXjCGPnszee7y/f1dGBN14lNaMgWk63GF5NAO3cSisZ0Z7Uil/5xaIXGWIBJZY4M8ZyAkDTo+LhFy4DO3lDBADYb
 Ua9FtQPKCcU9RPyFiQ+uex0LD99XbJuSLlQZuAwdI74szKk2d/wvCXymBr4gqBQ7zS3oXfl5C6g/4cnlx3JR9BsxlHNNGDLj8S04DdPHpBRYI3WI9+oTgxjU
 hUGlAZFlgkUAPKSEhalLm9bojCEbuPUEIaMVoqf3EZaxo6/oLlv7h4m++7qE7AwV7ywCElLoE1GBc4LN5/UeLjw2mvNA0r//RVyFJH9rhntz0UXXEGR2CjLJ
 aM2ws8yzc6n2+6nWA5RhcNbx
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/05/2020 19:40, Ezequiel Garcia wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Add the VP9 stateless decoder controls plus the documentation that goes
> with it.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../userspace-api/media/v4l/biblio.rst        |  10 +
>  .../media/v4l/ext-ctrls-codec.rst             | 550 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 239 ++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/media/v4l2-ctrls.h                    |   1 +
>  include/media/vp9-ctrls.h                     | 485 +++++++++++++++
>  6 files changed, 1286 insertions(+)
>  create mode 100644 include/media/vp9-ctrls.h
> 

<snip>

> +/**
> + * struct v4l2_vp9_quantization - VP9 quantization parameters
> + *
> + * @base_q_idx: indicates the base frame qindex
> + * @delta_q_y_dc: indicates the Y DC quantizer relative to base_q_idx
> + * @delta_q_uv_dc: indicates the UV DC quantizer relative to base_q_idx
> + * @delta_q_uv_ac indicates the UV AC quantizer relative to base_q_idx
> + * @padding: padding bytes to align things on 64 bits. Must be set to 0
> + *
> + * Encodes the quantization parameters. See section '7.2.9 Quantization params
> + * syntax' of the VP9 specification for more details.
> + */
> +struct v4l2_vp9_quantization {
> +	__u8 base_q_idx;
> +	__s8 delta_q_y_dc;
> +	__s8 delta_q_uv_dc;
> +	__s8 delta_q_uv_ac;
> +	__u8 padding[4];

Are you sure this padding field is needed? What goes wrong if this is dropped?

> +};

<snip>

> +struct v4l2_ctrl_vp9_frame_decode_params {
> +	__u32 flags;
> +	__u16 compressed_header_size;
> +	__u16 uncompressed_header_size;
> +	__u8 profile;
> +	__u8 reset_frame_context;
> +	__u8 frame_context_idx;
> +	__u8 bit_depth;
> +	__u8 interpolation_filter;
> +	__u8 tile_cols_log2;
> +	__u8 tile_rows_log2;
> +	__u8 tx_mode;
> +	__u8 reference_mode;
> +	__u8 padding[6];

This doesn't look right: this should be 7 if you want to align at 64 bits. Don't
forget to update the documentation when you change this. In fact, the documentation
doesn't mention the size of the array, it just says 'u8 padding'.

I thought pahole flags something like this?

> +	__u16 frame_width_minus_1;
> +	__u16 frame_height_minus_1;
> +	__u16 render_width_minus_1;
> +	__u16 render_height_minus_1;
> +	__u64 refs[V4L2_REF_ID_CNT];
> +	struct v4l2_vp9_loop_filter lf;

sizeof(lf) is an odd-number of bytes, so...

> +	struct v4l2_vp9_quantization quant;

... even though sizeof(quant) == 8 with the padding bytes, that would still not
align at 64 bits.

> +	struct v4l2_vp9_segmentation seg;
> +	struct v4l2_vp9_probabilities probs;
> +};
> +
> +#define V4L2_VP9_NUM_FRAME_CTX	4
> +
> +/**
> + * struct v4l2_ctrl_vp9_frame_ctx - VP9 frame context control
> + *
> + * @probs: VP9 probabilities
> + *
> + * This control is accessed in both direction. The user should initialize the
> + * 4 contexts with default values just after starting the stream. Then before
> + * decoding a frame it should query the current frame context (the one passed
> + * through &v4l2_ctrl_vp9_frame_decode_params.frame_context_idx) to initialize
> + * &v4l2_ctrl_vp9_frame_decode_params.probs. The probs are then adjusted based
> + * on the bitstream info and passed to the kernel. The codec should update
> + * the frame context after the frame has been decoded, so that next time
> + * userspace query this context it contains the updated probabilities.
> + */
> +struct v4l2_ctrl_vp9_frame_ctx {
> +	struct v4l2_vp9_probabilities probs;
> +};
> +
> +#endif /* _VP9_CTRLS_H_ */
> 

Regards,

	Hans
