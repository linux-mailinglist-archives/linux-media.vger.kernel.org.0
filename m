Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B278939CDEB
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 09:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhFFHwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Jun 2021 03:52:36 -0400
Received: from mail-ej1-f44.google.com ([209.85.218.44]:42563 "EHLO
        mail-ej1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhFFHwg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Jun 2021 03:52:36 -0400
Received: by mail-ej1-f44.google.com with SMTP id k25so15843259eja.9;
        Sun, 06 Jun 2021 00:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1L+CugDcu0ySFhbe2SRx9ewcJnc69OcVxM+Qz0KsWKg=;
        b=Z8xTXcjTXNQtrLBJjbQfH1dm3DIceJGvfjGD75iKVuUKNzaCoqwrUBfv6lobrk2cka
         flQoBYh0RxTHEBp6Cj5ZxnrcmOPDhpNdelaV4+Q5Wzi+zIqLyQNOAHpPFcPtwCQbYC+g
         dPMksezdZjkwBSyybA4dFS4bvGPT4b4UC3PL0SV+5eQ9HXjZULncH71epDhbP/DSbCm9
         eRPkBnrNAkowx+8/2MMQqwcMP9TNg52r6026F+NBcTeYL9SLa6wtre5kChVhszLf1FiP
         5fwMN1JO4bHdP1SF1X9cUo6sWjZN+UD6uET/I2O73j1hRjDOJBfN/ULOaBw9nORKmwoS
         DOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1L+CugDcu0ySFhbe2SRx9ewcJnc69OcVxM+Qz0KsWKg=;
        b=PnSa/rEKqA9v+Qm0uAjMqCJS8bBwGIQZVSpNCRNTiatY4VK1VXkCqRwBykq/Y1UnyJ
         IjI40w0lzCUsu2bNopxQD9a+7W1uSg3gd9KtqQgw1vj+6zgWRkWCkx/Vchnemdke7XDg
         bpveUhQPimxKniWCeDZRMylxl+KbW4yaJcBlhDfqtMqNl9o7/ND/lxEJccix4TGIm3kF
         aqTnkXtWRmK6LIWy769BzBhTYJ9Mq3KPMXy6kLvyLrnYpk9OuOLHY8qgTkZmX/8BSPez
         gYSahy/ASKz8EJUxYs5oeSMVlp93PtITxwho4ZJOk85ZiLL4QqGV4MvAll4rRhktbSh9
         Rniw==
X-Gm-Message-State: AOAM532dIMypsHbcLm0RtYuGs29SLFembmfEZhk9a6lPYa8lLFKiylzN
        FFl1PTEmNPar6eef4zVOb6g=
X-Google-Smtp-Source: ABdhPJyHJED78NmxWqy+3UB12hj3JL5WXMqpSyt2T4SSzymkviDsOiWzsALrKob1WbjW4tw4sU8YHg==
X-Received: by 2002:a17:906:6849:: with SMTP id a9mr12712425ejs.415.1622965773781;
        Sun, 06 Jun 2021 00:49:33 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id qh23sm5070097ejb.77.2021.06.06.00.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 00:49:33 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH 7/8] media: hevc: Add scaling matrix control
Date:   Sun, 06 Jun 2021 09:49:31 +0200
Message-ID: <2618802.xq3rs0cueg@kista>
In-Reply-To: <20210604130619.491200-8-benjamin.gaignard@collabora.com>
References: <20210604130619.491200-1-benjamin.gaignard@collabora.com> <20210604130619.491200-8-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne petek, 04. junij 2021 ob 15:06:18 CEST je Benjamin Gaignard napisal(a):
> HEVC scaling lists are used for the scaling process for transform
> coefficients.
> V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED has to set when they are
> encoded in the bitstream.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 45 +++++++++++++++++++
>  .../media/v4l/vidioc-queryctrl.rst            |  6 +++
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  6 +++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 ++
>  include/media/hevc-ctrls.h                    | 11 +++++
>  5 files changed, 72 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 9120c5bcaf90..a4512b7cb520 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3065,6 +3065,51 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>  
>      \normalsize
>  
> +``V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX (struct)``
> +    Specifies the HEVC scaling matrix parameters used for the scaling 
process
> +    for transform coefficients.
> +    These matrix and parameters are defined according to :ref:`hevc`.
> +    They are described in section 7.4.5 "Scaling list data semantics" of
> +    the specification.
> +
> +.. c:type:: v4l2_ctrl_hevc_scaling_matrix
> +
> +.. raw:: latex
> +
> +    \scriptsize
> +
> +.. tabularcolumns:: |p{5.4cm}|p{6.8cm}|p{5.1cm}|
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_hevc_slice_params

^ copy paste error? It should be v4l2_ctrl_hevc_scaling_matrix.

Best regards,
Jernej

> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``scaling_list_4x4[6][16]``
> +      -
> +    * - __u8
> +      - ``scaling_list_8x8[6][64]``
> +      -
> +    * - __u8
> +      - ``scaling_list_16x16[6][64]``
> +      -
> +    * - __u8
> +      - ``scaling_list_32x32[2][64]``
> +      -
> +    * - __u8
> +      - ``scaling_list_dc_coef_16x16[6]``
> +      -
> +    * - __u8
> +      - ``scaling_list_dc_coef_32x32[2]``
> +      -
> +
> +.. raw:: latex
> +
> +    \normalsize
> +
>  .. c:type:: v4l2_hevc_dpb_entry
>  
>  .. raw:: latex
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/
Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index f9ecf6276129..2f491c17dd5d 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -495,6 +495,12 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_hevc_slice_params`, containing HEVC
>  	slice parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_hevc_scaling_matrix`, containing HEVC
> +	scaling matrix for stateless video decoders.
>      * - ``V4L2_CTRL_TYPE_VP8_FRAME``
>        - n/a
>        - n/a
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-
core/v4l2-ctrls-core.c
> index c4b5082849b6..70adfc1b9c81 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -687,6 +687,9 @@ static int std_validate_compound(const struct v4l2_ctrl 
*ctrl, u32 idx,
>  
>  		break;
>  
> +	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
> +		break;
> +
>  	case V4L2_CTRL_TYPE_AREA:
>  		area = p;
>  		if (!area->width || !area->height)
> @@ -1240,6 +1243,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct 
v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>  		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
>  		break;
> +	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
> +		elem_size = sizeof(struct 
v4l2_ctrl_hevc_scaling_matrix);
> +		break;
>  	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
>  		elem_size = sizeof(struct 
v4l2_ctrl_hevc_decode_params);
>  		break;
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-
core/v4l2-ctrls-defs.c
> index b6344bbf1e00..cb29c2a7fabe 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -996,6 +996,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:			
return "HEVC Sequence Parameter Set";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:			
return "HEVC Picture Parameter Set";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return 
"HEVC Slice Parameters";
> +	case V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX:		
return "HEVC Scaling Matrix";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS:		
return "HEVC Decode Parameters";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC 
Decode Mode";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return 
"HEVC Start Code";
> @@ -1488,6 +1489,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum 
v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
>  		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX:
> +		*type = V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS:
>  		*type = V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS;
>  		break;
> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> index dc964ff7cd29..da6189ef7ab4 100644
> --- a/include/media/hevc-ctrls.h
> +++ b/include/media/hevc-ctrls.h
> @@ -19,6 +19,7 @@
>  #define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_CODEC_BASE + 
1008)
>  #define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_CODEC_BASE + 
1009)
>  #define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_CODEC_BASE + 
1010)
> +#define V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX	(V4L2_CID_CODEC_BASE + 
1011)
>  #define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS	(V4L2_CID_CODEC_BASE + 
1012)
>  #define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE	(V4L2_CID_CODEC_BASE + 
1015)
>  #define V4L2_CID_MPEG_VIDEO_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 
1016)
> @@ -27,6 +28,7 @@
>  #define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
>  #define V4L2_CTRL_TYPE_HEVC_PPS 0x0121
>  #define V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS 0x0122
> +#define V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX 0x0123
>  #define V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS 0x0124
>  
>  enum v4l2_mpeg_video_hevc_decode_mode {
> @@ -225,6 +227,15 @@ struct v4l2_ctrl_hevc_decode_params {
>  	__u64	flags;
>  };
>  
> +struct v4l2_ctrl_hevc_scaling_matrix {
> +	__u8	scaling_list_4x4[6][16];
> +	__u8	scaling_list_8x8[6][64];
> +	__u8	scaling_list_16x16[6][64];
> +	__u8	scaling_list_32x32[2][64];
> +	__u8	scaling_list_dc_coef_16x16[6];
> +	__u8	scaling_list_dc_coef_32x32[2];
> +};
> +
>  /*  MPEG-class control IDs specific to the Hantro driver as defined by V4L2 
*/
>  #define V4L2_CID_CODEC_HANTRO_BASE				
(V4L2_CTRL_CLASS_CODEC | 0x1200)
>  /*
> 


