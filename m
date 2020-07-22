Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612B5229CD1
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 18:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgGVQJ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 12:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgGVQJ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 12:09:28 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1C2C0619DC;
        Wed, 22 Jul 2020 09:09:28 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id bm28so2081330edb.2;
        Wed, 22 Jul 2020 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zoyELi16cUvbyGY2mXBhWNaZ9/6nrareVV6zGnAvnSQ=;
        b=joY9I2ATz7qOoQQFlBV2rHB+EyovZlWNSrccYvhpPZQGZ5fmCzWYsVmD9ca6PW0pYJ
         K8XTRuBqOExV2/gArGOzo9r488TYLIQNIutunj27QGIDrJhu0ymaaIzJtthRVG/d5iVb
         9HhkOlRZpwyw/QJWjp3xpywQAsUEZi4UTPFmh3nXFxf/I61OPFY+a7oStJIQ0CZ7RBVg
         fCZroDYaA/MELHSxJwsu1KayCo3pYl5guBs9mTcDgg3UJFf7DGT9NPkXjHed/ep+HBAn
         +RzJGYaBuC4FrQSf1DSuNtxDrbhcpT3JohF286WydWNk2ZkaB807K6aS/ObbGOl6t+S3
         ++og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zoyELi16cUvbyGY2mXBhWNaZ9/6nrareVV6zGnAvnSQ=;
        b=fwXkL7XXss6EbTO70Hlo7+QO9Auucn5vtLVKMM0UsGgQDc6NuU3t7ZgssPx/l4mvZ+
         0vRjNPFkONQKnXNbXzmm6ji4b6J/IivjsKWf9UjAlYESajtn3rw3y3QYpgIAv8KhywA3
         tKUJG288fmqJ4616QuDE86fQv3Zg5IY1ondauTvLeSMeys22RJRoX/Cix/O9rij7AoKm
         Lu0tzC/KzODqwEu8gEg2BMXrwv4XPSCSD3U5jFgvTjKhGiamf1txRI9aCBpAysiynViP
         tadsBUpLMzei5eYXTcVKrP/p+39Blt11Orjxm2iYCQyIZvGi3zbtm4s7KHIGYzslnMty
         If/A==
X-Gm-Message-State: AOAM533SBWN/dlT/Nz04Mt9pSvtgr/BxdfoGqEDrdrtXf5RCSPBnpByk
        q/ENssxyq1n+k8yyrr+1Zbt7t1uqcWU=
X-Google-Smtp-Source: ABdhPJzPO/V2uw0v1Lu2o6aHQ8SfqBtMjCtG5dE9CLpZNRR5JBJZ5jRRPA4lwRa3985cDvOmZ5h2Pw==
X-Received: by 2002:a50:cd1e:: with SMTP id z30mr183189edi.364.1595434166675;
        Wed, 22 Jul 2020 09:09:26 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net. [194.152.20.232])
        by smtp.gmail.com with ESMTPSA id lv17sm70523ejb.56.2020.07.22.09.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 09:09:25 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 06/10] media: uapi: h264: Cleanup DPB entry interface
Date:   Wed, 22 Jul 2020 18:09:24 +0200
Message-ID: <2192247.mDtJn7f4FH@jernej-laptop>
In-Reply-To: <20200715202233.185680-7-ezequiel@collabora.com>
References: <20200715202233.185680-1-ezequiel@collabora.com> <20200715202233.185680-7-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne sreda, 15. julij 2020 ob 22:22:29 CEST je Ezequiel Garcia napisal(a):
> As discussed recently, the current interface for the
> Decoded Picture Buffer is not enough to properly
> support field coding.
> 
> This commit introduces enough semantics to support
> frame and field coding, and to signal how DPB entries
> are "used for reference".
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 46 ++++++++++++-------
>  drivers/media/v4l2-core/v4l2-h264.c           |  4 +-
>  drivers/staging/media/rkvdec/rkvdec-h264.c    |  8 ++--
>  include/media/h264-ctrls.h                    |  8 +++-
>  4 files changed, 42 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst index
> dd8e5a2e8986..46d4c8c6ad47 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -2058,10 +2058,35 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> * - __s32
>        - ``bottom_field_order_cnt``
>        -
> +    * - enum :c:type:`v4l2_h264_dpb_reference`
> +      - ``reference``
> +      - Specifies how the DPB entry is referenced.
>      * - __u32
>        - ``flags``
>        - See :ref:`DPB Entry Flags <h264_dpb_flags>`
> 
> +.. c:type:: v4l2_h264_dpb_reference
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_H264_DPB_TOP_REF``
> +      - 0x1
> +      - The top field in field pair is used for
> +        short-term reference.
> +    * - ``V4L2_H264_DPB_BOTTOM_REF``
> +      - 0x2
> +      - The bottom field in field pair is used for
> +        short-term reference.
> +    * - ``V4L2_H264_DPB_FRAME_REF``
> +      - 0x3
> +      - The frame (or the top/bottom fields, if it's a field pair)
> +        is used for short-term reference.
> +
>  .. _h264_dpb_flags:
> 
>  ``DPB Entries Flags``
> @@ -2075,29 +2100,16 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> 
>      * - ``V4L2_H264_DPB_ENTRY_FLAG_VALID``
>        - 0x00000001
> -      - The DPB entry is valid and should be considered
> +      - The DPB entry is valid (non-empty) and should be considered.
>      * - ``V4L2_H264_DPB_ENTRY_FLAG_ACTIVE``

I'm still not sure that we actually need both flags. Technically, if entry is 
not used for reference then doesn't need to be present. Am I missing 
something?

Best regards,
Jernej

>        - 0x00000002
> -      - The DPB entry is currently being used as a reference frame
> +      - The DPB entry is used for reference.
>      * - ``V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM``
>        - 0x00000004
> -      - The DPB entry is a long term reference frame
> +      - The DPB entry is used for long-term reference.
>      * - ``V4L2_H264_DPB_ENTRY_FLAG_FIELD``
>        - 0x00000008
> -      - The DPB entry is a field reference, which means only one of the
> field -        will be used when decoding the new frame/field. When not set
> the DPB -        entry is a frame reference (both fields will be used).
> Note that this -        flag does not say anything about the number of
> fields contained in the -        reference frame, it just describes the one
> used to decode the new -        field/frame
> -    * - ``V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD``
> -      - 0x00000010
> -      - The DPB entry is a bottom field reference (only the bottom field of
> the -        reference frame is needed to decode the new frame/field). Only
> valid if -        V4L2_H264_DPB_ENTRY_FLAG_FIELD is set. When
> -        V4L2_H264_DPB_ENTRY_FLAG_FIELD is set but
> -        V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD is not, that means the
> -        DPB entry is a top field reference
> +      - The DPB entry is a single field or a complementary field pair.
> 
>  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
>      Specifies the decoding mode to use. Currently exposes slice-based and
> diff --git a/drivers/media/v4l2-core/v4l2-h264.c
> b/drivers/media/v4l2-core/v4l2-h264.c index edf6225f0522..306a51683606
> 100644
> --- a/drivers/media/v4l2-core/v4l2-h264.c
> +++ b/drivers/media/v4l2-core/v4l2-h264.c
> @@ -66,10 +66,10 @@ v4l2_h264_init_reflist_builder(struct
> v4l2_h264_reflist_builder *b, else
>  			b->refs[i].frame_num = dpb[i].frame_num;
> 
> -		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD))
> +		if (dpb[i].reference & V4L2_H264_DPB_FRAME_REF)
>  			pic_order_count = 
min(dpb[i].top_field_order_cnt,
>  					      
dpb[i].bottom_field_order_cnt);
> -		else if (dpb[i].flags & 
V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD)
> +		else if (dpb[i].reference & V4L2_H264_DPB_BOTTOM_REF)
>  			pic_order_count = 
dpb[i].bottom_field_order_cnt;
>  		else
>  			pic_order_count = dpb[i].top_field_order_cnt;
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c
> b/drivers/staging/media/rkvdec/rkvdec-h264.c index
> 7b66e2743a4f..57539c630422 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -953,11 +953,11 @@ static void config_registers(struct rkvdec_ctx *ctx,
>  			     RKVDEC_COLMV_USED_FLAG_REF;
> 
>  		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD))
> -			refer_addr |= RKVDEC_TOPFIELD_USED_REF |
> -				      RKVDEC_BOTFIELD_USED_REF;
> -		else if (dpb[i].flags & 
V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD)
> +			refer_addr |= RKVDEC_FIELD_REF;
> +
> +		if (dpb[i].reference & V4L2_H264_DPB_TOP_REF)
>  			refer_addr |= RKVDEC_BOTFIELD_USED_REF;
> -		else
> +		else if (dpb[i].reference & V4L2_H264_DPB_BOTTOM_REF)
>  			refer_addr |= RKVDEC_TOPFIELD_USED_REF;
> 
>  		writel_relaxed(dpb[i].top_field_order_cnt,
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index 620ee8863d74..52f3976b986c 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -202,7 +202,12 @@ struct v4l2_ctrl_h264_slice_params {
>  #define V4L2_H264_DPB_ENTRY_FLAG_ACTIVE		0x02
>  #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
>  #define V4L2_H264_DPB_ENTRY_FLAG_FIELD		0x08
> -#define V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD	0x10
> +
> +enum v4l2_h264_dpb_reference {
> +	V4L2_H264_DPB_TOP_REF = 0x1,
> +	V4L2_H264_DPB_BOTTOM_REF = 0x2,
> +	V4L2_H264_DPB_FRAME_REF = 0x3,
> +};
> 
>  struct v4l2_h264_dpb_entry {
>  	__u64 reference_ts;
> @@ -211,6 +216,7 @@ struct v4l2_h264_dpb_entry {
>  	/* Note that field is indicated by v4l2_buffer.field */
>  	__s32 top_field_order_cnt;
>  	__s32 bottom_field_order_cnt;
> +	enum v4l2_h264_dpb_reference reference;
>  	__u32 flags; /* V4L2_H264_DPB_ENTRY_FLAG_* */
>  };




