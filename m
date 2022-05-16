Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5E0B528D9C
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 21:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345195AbiEPTCP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 15:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237877AbiEPTCN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 15:02:13 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A461BE8D
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 12:02:11 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id jt15so12822140qvb.8
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 12:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=8ys/qk3ZaKomchykNXKoZFTVMFXpQVCNr/tlh3AtCfU=;
        b=jbFBcnuvC3rZ2XPCZhw1uJw9pYA0PjCiTlvlBaSQxe5MbF91TfC+ThWzawQBExJsAB
         KHVuDO/59CSFoMZhO6EbXXbXDXML5fG9ZwDqrT6YUisj/9hUioW/2jnucHt0LiMIVL8u
         l0gxJnvcsR7O77qLdoBgcIr5NYYTeb2LJVJeXbVUN3I5jjG/EUw7Mp7UP+VVttwjXthd
         Sg+QqUlvkPaKfIVC8TjHSsXAq7mRL20okKYQCVOe+PB6sfco3t0t4sDaR0+qgbo96Hqg
         C+/z0GFynlCiGJcLdOoKl52XBNq7mFD2N4m1pKgzxbX+ptDxuGLSyPBmKLwibPBGLKJ0
         4Ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=8ys/qk3ZaKomchykNXKoZFTVMFXpQVCNr/tlh3AtCfU=;
        b=dNfHwVmv311C8B6dBBBN939sq+FiB42u+Ch8mk2FJJHQWMWDTXmMmRKJD3/AI7ZROp
         FvVSsGpAfUem7juOJprxT1qZrcRW68JH7q2s2E6S71aqIYqFp+v+vnOVdG2mRuI/w6M7
         N6C3OxgXcTQkw+0t8ZxtPFfWTEPKUocfoVXPtCyF9yNv4B0llmlXGIsF+kOZWgvD1hgZ
         2QFGRazYRXJTU7D3zFE/gr8pJcC92HXEmxvqCTH5N1kN1Cc7p3a49bZi1ex5slA76VSK
         xPRDOkSuQy0mHE7Z9HCcGbOvzgrkE3Ag0AoNOIM6tc6DgQ7VhDEzno9Gcp92ldjdJr3q
         jrQQ==
X-Gm-Message-State: AOAM530T8GZ+Un1/XyBvwcnPtpDuitrGlRLdrMeI1GjrUWpenRqZMfno
        k09Wsz2HJtR96DHVbmfQfLDQDw==
X-Google-Smtp-Source: ABdhPJwvv5JlQrW8Nve3c+j5Haumv/M6fw6fQDUV3YqY5oJe1p0SHKh1IfQTmXPgNNfNJfoxTftASw==
X-Received: by 2002:a05:6214:c2e:b0:461:cdee:cd75 with SMTP id a14-20020a0562140c2e00b00461cdeecd75mr5579041qvd.121.1652727729995;
        Mon, 16 May 2022 12:02:09 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id x2-20020a05620a14a200b0069fc13ce20fsm6305956qkj.64.2022.05.16.12.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 12:02:09 -0700 (PDT)
Message-ID: <50d89e76f3c5f99363aa4062b40b579d94855136.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/6] media: v4l2_ctrl: Add region of interest
 rectangle control
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Yunke Cao <yunkec@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Date:   Mon, 16 May 2022 15:02:08 -0400
In-Reply-To: <20220516140434.1871022-2-yunkec@google.com>
References: <20220516140434.1871022-1-yunkec@google.com>
         <20220516140434.1871022-2-yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

thanks for working on this, see my comments below ...

Le lundi 16 mai 2022 =C3=A0 23:04 +0900, Yunke Cao a =C3=A9crit=C2=A0:
> Including:
> 1. Add a control ID.
> 2. Add p_rect to struct v4l2_ext_control with basic support in
>    v4l2-ctrls.
>=20
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  .../media/v4l/ext-ctrls-camera.rst            |  4 ++++
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
>  .../media/videodev2.h.rst.exceptions          |  1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 ++++
>  include/media/v4l2-ctrls.h                    |  2 ++
>  include/uapi/linux/v4l2-controls.h            |  2 ++
>  include/uapi/linux/videodev2.h                |  2 ++
>  8 files changed, 39 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b=
/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index 4c5061aa9cd4..86a1f09a8a1c 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -661,3 +661,7 @@ enum v4l2_scene_mode -
>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
>     options are required.
> +
> +``V4L2_CID_REGION_OF_INTEREST_RECT (struct)``
> +    This control determines the region of interest. Region of interest i=
s an
> +    rectangular area represented by a struct v4l2_rect.

This control documentation is missing some important information. Notably, =
what
will happen if this rectangle is set ? Is there a value to unset it ?

The name is very generic and I would expect that to be usable in general. B=
ut it
won't work for encoders, as you only allow 1 rectangle and it would be miss=
ing
some QP delta parameter. I think I would prefer if we specialize this type =
of
control a bit more. In your case, I'm guessing you only care about 1 ROI wh=
en
taking a picture, and this ROI will be used for automatic focus. If my gues=
s is
right, perhaps a FOCUS_AERA could be a better name ?

regards,
Nicolas

> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst=
 b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index 29971a45a2d4..f4e205ead0a2 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -189,6 +189,10 @@ still cause this situation.
>        - ``p_area``
>        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control=
 is
>          of type ``V4L2_CTRL_TYPE_AREA``.
> +    * - struct :c:type:`v4l2_rect` *
> +      - ``p_area``
> +      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control=
 is
> +        of type ``V4L2_CTRL_TYPE_RECT``.
>      * - struct :c:type:`v4l2_ctrl_h264_sps` *
>        - ``p_h264_sps``
>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if thi=
s control is
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions=
 b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 9cbb7a0c354a..7b423475281d 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -147,6 +147,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_=
ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type=
`
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 8968cec8454e..dcde405c2713 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -84,6 +84,11 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u3=
2 idx,
>  		return ptr1.p_u16[idx] =3D=3D ptr2.p_u16[idx];
>  	case V4L2_CTRL_TYPE_U32:
>  		return ptr1.p_u32[idx] =3D=3D ptr2.p_u32[idx];
> +	case V4L2_CTRL_TYPE_RECT:
> +		return ptr1.p_rect->top =3D=3D ptr2.p_rect->top &&
> +		       ptr1.p_rect->left =3D=3D ptr2.p_rect->left &&
> +		       ptr1.p_rect->height =3D=3D ptr2.p_rect->height &&
> +		       ptr1.p_rect->width =3D=3D ptr2.p_rect->width;
>  	default:
>  		if (ctrl->is_int)
>  			return ptr1.p_s32[idx] =3D=3D ptr2.p_s32[idx];
> @@ -307,6 +312,11 @@ static void std_log(const struct v4l2_ctrl *ctrl)
>  	case V4L2_CTRL_TYPE_VP9_FRAME:
>  		pr_cont("VP9_FRAME");
>  		break;
> +	case V4L2_CTRL_TYPE_RECT:
> +		pr_cont("l: %d, t: %d, w: %u, h: %u",
> +			ptr.p_rect->left, ptr.p_rect->top,
> +			ptr.p_rect->width, ptr.p_rect->height);
> +		break;
>  	default:
>  		pr_cont("unknown type %d", ctrl->type);
>  		break;
> @@ -525,6 +535,7 @@ static int std_validate_compound(const struct v4l2_ct=
rl *ctrl, u32 idx,
>  	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
>  	struct v4l2_area *area;
> +	struct v4l2_rect *rect;
>  	void *p =3D ptr.p + idx * ctrl->elem_size;
>  	unsigned int i;
> =20
> @@ -888,6 +899,12 @@ static int std_validate_compound(const struct v4l2_c=
trl *ctrl, u32 idx,
>  			return -EINVAL;
>  		break;
> =20
> +	case V4L2_CTRL_TYPE_RECT:
> +		rect =3D p;
> +		if (!rect->width || !rect->height)
> +			return -EINVAL;
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1456,6 +1473,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_=
ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_AREA:
>  		elem_size =3D sizeof(struct v4l2_area);
>  		break;
> +	case V4L2_CTRL_TYPE_RECT:
> +		elem_size =3D sizeof(struct v4l2_rect);
> +		break;
>  	default:
>  		if (type < V4L2_CTRL_COMPOUND_TYPES)
>  			elem_size =3D sizeof(s32);
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index 54ca4e6b820b..95f39a2d2ad2 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1042,6 +1042,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
>  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
> +	case V4L2_CID_REGION_OF_INTEREST_RECT:  return "Region Of Interest Rect=
angle";
> =20
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1524,6 +1525,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum=
 v4l2_ctrl_type *type,
>  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>  		*type =3D V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>  		break;
> +	case V4L2_CID_REGION_OF_INTEREST_RECT:
> +		*type =3D V4L2_CTRL_TYPE_RECT;
> +		break;
>  	default:
>  		*type =3D V4L2_CTRL_TYPE_INTEGER;
>  		break;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index b3ce438f1329..919e104de50b 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -58,6 +58,7 @@ struct video_device;
>   * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level structure.
>   * @p_hdr10_mastering:		Pointer to an HDR10 Mastering Display structure.
>   * @p_area:			Pointer to an area.
> + * @p_rect:			Pointer to a rectangle.
>   * @p:				Pointer to a compound value.
>   * @p_const:			Pointer to a constant compound value.
>   */
> @@ -87,6 +88,7 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
>  	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_area *p_area;
> +	struct v4l2_rect *p_rect;
>  	void *p;
>  	const void *p_const;
>  };
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index bb40129446d4..499fcddb6254 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1008,6 +1008,8 @@ enum v4l2_auto_focus_range {
> =20
>  #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
> =20
> +#define V4L2_CID_REGION_OF_INTEREST_RECT	(V4L2_CID_CAMERA_CLASS_BASE+36)
> +
>  /* FM Modulator class control IDs */
> =20
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 3768a0a80830..b712412cf763 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1751,6 +1751,7 @@ struct v4l2_ext_control {
>  		__u16 __user *p_u16;
>  		__u32 __user *p_u32;
>  		struct v4l2_area __user *p_area;
> +		struct v4l2_rect __user *p_rect;
>  		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
>  		struct v4l2_ctrl_h264_pps *p_h264_pps;
>  		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
> @@ -1810,6 +1811,7 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_U16	     =3D 0x0101,
>  	V4L2_CTRL_TYPE_U32	     =3D 0x0102,
>  	V4L2_CTRL_TYPE_AREA          =3D 0x0106,
> +	V4L2_CTRL_TYPE_RECT	     =3D 0x0107,
> =20
>  	V4L2_CTRL_TYPE_HDR10_CLL_INFO		=3D 0x0110,
>  	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	=3D 0x0111,

