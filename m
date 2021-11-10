Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E26744C8F6
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 20:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbhKJT25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 14:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbhKJT2z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 14:28:55 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32FEC061764;
        Wed, 10 Nov 2021 11:26:07 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id s13so5862519wrb.3;
        Wed, 10 Nov 2021 11:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=stxfGq5TzEk/m+h1V0oWIaH2yEXT1vhy8334vKhpSbk=;
        b=HSbkCB5tuRc+2W2n8fgn9E3Tq0iwlPq1i+mBl1CVpMIVh0k5ZYJaWbZ5Hb146uIwb7
         1m/7OWgXQ6CvJCRl1QHVqTV1f5a/bHcJhkEHoxF8CDvtwhBBc+rOYnUfwkIbMRF8oGxa
         /0cUt5yNj3ON6xQ+cqwzUZw59rA2Cs0kG8GZBrBdIOI9Cj0nN5iJWMz9e+hD4yGqOImh
         +g+ElXEzWESJZTGgaRBPCmMiKqGCvjhKUCrDGfCd2WLzYaa10S8wsSJ1USQulhDKhXQW
         KRHmCIQwul/QBl2TzNKh8MakjGfZZyMLMqvVeZ2FvQn+EhVbW9RKQdgpwWFOCoVbwHGN
         O8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=stxfGq5TzEk/m+h1V0oWIaH2yEXT1vhy8334vKhpSbk=;
        b=JFxB37yl65P/zpwLoZ3HO8hJSJpDDNZ3B2svg2E6tOagP0RZYoV1ZL09pV9rvgL8MH
         GCvcRJcy6DIpsaD2Uj3MQjCsQDDmbCC+oaVpmKfZS6Tq7u1+Nf4Xs0UA0jFVNHfyDd4B
         Xi9qN/5U0/SFX7jf3KvzpCz4BOxXujvhY0GFsvOc09YF4k1KoFRaw4V7c3hLLGXzPBth
         dP8UlP2tMX3UH1C+H5lzyfHUD3IYIKGZGATAGvB2wnLah2Xc+RAFymk2PHyGpEsipqr2
         +bj/1g2g1cJcr5rQoo+eO6YTFOTMKSEJCfm3W+2tfAt0VrW+DCvVNvgFVyVuSvPjvDA5
         vVgw==
X-Gm-Message-State: AOAM5309q0A3m5B/09MkMLz2/YcXpKDepL+O1KaOnqpx2yxJbCAYEZHF
        lZJYwRH35u2GAGOANGporc0=
X-Google-Smtp-Source: ABdhPJxTG94yTUSY/Xh7rvmJIuspjf0raoj13K6wYdvH8/nsbTpXXHcT2atafOeteM53GX0FbKj6Ow==
X-Received: by 2002:a05:6000:1688:: with SMTP id y8mr1773432wrd.420.1636572366357;
        Wed, 10 Nov 2021 11:26:06 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id b197sm610739wmb.24.2021.11.10.11.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:26:05 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     mchehab@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        hverkuil-cisco@xs4all.nl, jc@kynesim.co.uk,
        ezequiel@vanguardiasur.com.ar,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v2 1/4] media: hevc: Remove RPS named flags
Date:   Wed, 10 Nov 2021 20:26:04 +0100
Message-ID: <2215692.ElGaqSPkdT@kista>
In-Reply-To: <20211012143552.661751-2-benjamin.gaignard@collabora.com>
References: <20211012143552.661751-1-benjamin.gaignard@collabora.com> <20211012143552.661751-2-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

Dne torek, 12. oktober 2021 ob 16:35:49 CET je Benjamin Gaignard napisal(a):
> Marking a picture as long-term reference is valid for DPB but not for RPS.
> Change flag name to match with it description in HEVC spec chapiter

chapiter -> chapter

> "8.3.2 Decoding process for reference picture set".
> Remove the other unused RPS flags.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 2:
> - change DPB field name from rps to flags
> 
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 8 +++-----
>  drivers/staging/media/hantro/hantro_g2_hevc_dec.c         | 2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c          | 2 +-
>  include/media/hevc-ctrls.h                                | 6 ++----
>  4 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index e141f0e4eec9..38da33e61c3d 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3166,11 +3166,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>  	:c:func:`v4l2_timeval_to_ns()` function to convert the struct
>  	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
>      * - __u8
> -      - ``rps``
> -      - The reference set for the reference frame
> -        (V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE,
> -        V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER or
> -        V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
> +      - ``flags``
> +      - Long term flag for the reference frame
> +        (V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
>      * - __u8
>        - ``field_pic``
>        - Whether the reference is a field picture or a frame.
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/
staging/media/hantro/hantro_g2_hevc_dec.c
> index 76a921163b9a..bbf71dcea099 100644
> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> @@ -445,7 +445,7 @@ static int set_ref(struct hantro_ctx *ctx)
>  		chroma_addr = luma_addr + cr_offset;
>  		mv_addr = luma_addr + mv_offset;
>  
> -		if (dpb[i].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
> +		if (dpb[i].flags == 
V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
>  			dpb_longterm_e |= 
BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
>  
>  		hantro_write_addr(vpu, G2_REG_ADDR_REF(i), luma_addr);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/
staging/media/sunxi/cedrus/cedrus_h265.c
> index 3d9561d4aadb..1edfc3823a57 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -169,7 +169,7 @@ static void cedrus_h265_ref_pic_list_write(struct 
cedrus_dev *dev,
>  		unsigned int index = list[i];
>  		u8 value = list[i];
>  
> -		if (dpb[index].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
> +		if (dpb[index].flags == 
V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)

Flags are usually checked with "&", same goes in Hantro case.

Once all fixed, this patch is:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  			value |= 
VE_DEC_H265_SRAM_REF_PIC_LIST_LT_REF;
>  
>  		/* Each SRAM word gathers up to 4 references. */
> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> index ef63bc205756..01ccda48d8c5 100644
> --- a/include/media/hevc-ctrls.h
> +++ b/include/media/hevc-ctrls.h
> @@ -127,15 +127,13 @@ struct v4l2_ctrl_hevc_pps {
>  	__u64	flags;
>  };
>  
> -#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE	0x01
> -#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER	0x02
> -#define V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR		0x03
> +#define V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE	0x01
>  
>  #define V4L2_HEVC_DPB_ENTRIES_NUM_MAX		16
>  
>  struct v4l2_hevc_dpb_entry {
>  	__u64	timestamp;
> -	__u8	rps;
> +	__u8	flags;
>  	__u8	field_pic;
>  	__u16	pic_order_cnt[2];
>  	__u8	padding[2];
> -- 
> 2.30.2
> 
> 


