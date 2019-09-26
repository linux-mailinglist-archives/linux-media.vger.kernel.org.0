Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1151BBF3FB
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 15:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfIZNXt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 09:23:49 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:51835 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726152AbfIZNXs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 09:23:48 -0400
Received: from [IPv6:2001:420:44c1:2577:ecda:45b4:8d5:2e68] ([IPv6:2001:420:44c1:2577:ecda:45b4:8d5:2e68])
        by smtp-cloud8.xs4all.net with ESMTPA
        id DTkFiOHQ4KKNGDTkIi68P1; Thu, 26 Sep 2019 15:23:47 +0200
Subject: Re: [PATCH 2/2] media: uapi: h264: clarify pic_order_cnt_bit_size
 field
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
References: <20190905131255.10150-1-p.zabel@pengutronix.de>
 <20190905131255.10150-2-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <457642c2-7d77-5eab-4537-01151b474aa9@xs4all.nl>
Date:   Thu, 26 Sep 2019 15:23:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905131255.10150-2-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfL2RNM3i2MLNISkh/fQFJKBB8o8kBu7lpIm2r6h/qDTvkPYmOlHFB9esQXT3x3PzRFGQmEatCkAehaiGSAFbkHRBRcHukVzhzVNjTazpKv8r5GrSdW+Y
 vmylYIoff+8w7m4j5o5O1UECmEZAq0EomkXBEmscoD92h0xnZGB5+mCxRnkAHZLYZlFcrHMI8+KycMtdjQKpinLQLkjd9zc6j4sj30vyWcbK+ZmjgoxXJrtt
 /HdHwcT8rMn2LzyUCtF8H5ftHm2wwnReCbn82tTpzfSa1/aQIhXSg6veHQT/Mch/a2cV3H+WCRf2H1VanJjYQfjigjU58UX7iy+25vLSVQB4T9s/W8cWXPQo
 rXMyBY/agRW6th9W6avfKrCwal/ay5XHK59E7F11P7FpCf6X38n6Z3bQdX67Wjq0ewjFSDhmF4+9IeuX5D7j67G/jv13PjZk6daj3M/XR9uKwXZ0uF27zvWl
 xSync/qu8y5QVK5hOpCtHyvMydljk3gytiPyRg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/5/19 3:12 PM, Philipp Zabel wrote:
> Since pic_order_cnt_bit_size is not a syntax element itself, explicitly
> state that it is the total size in bits of the pic_order_cnt_lsb,
> delta_pic_order_cnt_bottom, delta_pic_order_cnt[0], and
> delta_pic_order_cnt[1] syntax elements contained in the slice.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> index c281bc7ed1b3..08b49b2bbfa8 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1799,7 +1799,8 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - Size in bits of the dec_ref_pic_marking() syntax element.
>      * - __u32
>        - ``pic_order_cnt_bit_size``
> -      -
> +      - Size in bits of the pic_order_cnt_lsb, delta_pic_order_cnt_bottom,
> +        delta_pic_order_cnt[0], and delta_pic_order_cnt[1] syntax elements.

It's a little bit ambiguous: this field contains the size in bits of all these
fields combined, right? Not the size in bits of each field separately.

I.e. if these fields are all 8 bits, then pic_order_cnt_bit_size is 4*8 and
not just 8.

I think this should be rephrased.

Regards,

	Hans

>      * - __u8
>        - ``cabac_init_idc``
>        -
> 

