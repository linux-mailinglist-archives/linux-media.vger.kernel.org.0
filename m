Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60B47AD887
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 14:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404743AbfIIMJm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 08:09:42 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:43385 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404263AbfIIMJm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 08:09:42 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 7IUCieT6oMK4h7IUFiVUXG; Mon, 09 Sep 2019 14:09:40 +0200
Subject: Re: [PATCH] media: uapi: h264: clarify
 num_ref_idx_l[01]_(default_)active fields
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
References: <20190905114210.9232-1-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4fd58acf-4553-aff2-85ab-3bd2b1851090@xs4all.nl>
Date:   Mon, 9 Sep 2019 14:09:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905114210.9232-1-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA4hJ+msSmImW5cu9L9i/cLC4F1jk+PXlESbuV7FZZdVD/FA7hw6h37jWGe86LdhnmBqVA+cdhlKk5NL9VJTgjEOCM5YY/y3yUS6uqK6hko5Bpcw6uYR
 TiTK5Wa4N9/o0TLVZGV1H8Ko/g/gINcxtXDQNg48UuyV3iw6B98YTAmG6WDTB2FQNMcwHKq5EBe48vLC3hB1IuYN1+EsVQanDpvcynLv+oSmbgEnLtznbbFT
 cKDyXu/PeYjFwz4//bcOlEyZYBjibMFSP/7Q12muNQJDq7FCvlNHrXvVU2IopHoKXVTZMg85WH5enFPvaj4Zdti5gijTKGuykJxt1AHBeeuV9ih1rzj5SdcU
 3bioIfK0ij049gmiKV1ijYBYtsoceUtjQUa7i3W4GiI1v7RYFqI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/5/19 1:42 PM, Philipp Zabel wrote:
> To explain why num_ref_idx_active_override_flag is not part of the API,
> describe how the num_ref_idx_l[01]_active_minus1 fields and the
> num_ref_idx_l[01]_default_active_minus1 fields are used, depending on
> whether the decoder parses slice headers itself or not.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> index bc5dd8e76567..b9834625a939 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1630,10 +1630,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        -
>      * - __u8
>        - ``num_ref_idx_l0_default_active_minus1``
> -      -
> +      - This field is only used by decoders that parse slices themselves.

How do you know that the decoder does this?

>      * - __u8
>        - ``num_ref_idx_l1_default_active_minus1``
> -      -
> +      - This field is only used by decoders that parse slices themselves.
>      * - __u8
>        - ``weighted_bipred_idc``
>        -
> @@ -1820,10 +1820,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        -
>      * - __u8
>        - ``num_ref_idx_l0_active_minus1``
> -      -
> +      - This field is used by decoders that do not parse slices themselves.
> +        If num_ref_idx_active_override_flag is not set, this field must be
> +        set to the value of num_ref_idx_l0_default_active_minus1.

I don't think you can know if the decoder parses the slices.

Wouldn't it be better to just delete the 'This field is only used by decoders
that parse slices themselves.' sentence? Drivers for HW that handle this can
just ignore these fields.

Regards,

	Hans

>      * - __u8
>        - ``num_ref_idx_l1_active_minus1``
> -      -
> +      - This field is used by decoders that do not parse slices themselves.
> +        If num_ref_idx_active_override_flag is not set, this field must be
> +        set to the value of num_ref_idx_l1_default_active_minus1.
>      * - __u32
>        - ``slice_group_change_cycle``
>        -
> 

