Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D37595B5DB0
	for <lists+linux-media@lfdr.de>; Mon, 12 Sep 2022 17:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbiILPvt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Sep 2022 11:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiILPvr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Sep 2022 11:51:47 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868523AE48
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 08:51:45 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id d5so7447675wms.5
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=Jjn/1zVd12FVb/LCdNWe0Wf4ruutE5LvweefnNNf7tA=;
        b=FgTvhIkGinjfGqyh9asR8Qfyqp8Kv5+LGHJ/MjaV1DJ1kyJYCjMVQLE4LAQMJVwOdg
         HeHDX6mnSzOe2kLfsUkd1f6JCfsmilLeXRF7Om8FefEoEVsMqmk3HpN2eRSp77AvvrlK
         w6D9fAbcrB1qc8BHpHfbhzvLvlEeapApqF2Oqd475NGXQPnxP/+AXKjnZvv1NZ4jwdX8
         xX7GRDdmyNdmjaPJ5v7wyc46P5TuW5SjXfFhVsGm+br5HjgETmtsOrosrAMswYhN7ZqW
         oayVNXydA06ZGa1zrgGrMQ4mpmjBk9X2jp53t+8axY+Iq/ObDqlCWh64ywasynKYnMbR
         K6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=Jjn/1zVd12FVb/LCdNWe0Wf4ruutE5LvweefnNNf7tA=;
        b=pppcG58Uazwfmw1vxN3NZlMkJ4olZZDxep/z3mybGeHFMYvHR2BSq0TSE3i6JwZaur
         OERq0TPSQCQWTZ9byjoJFSD4xk3PO9KZm1uiHW7nD2Bf3p/1o3e1csL+9hY8xA+asWi4
         nqAyqhTIl+e0JCFMV2JoNiFAI1UvgSv5zIz0olECTbiHcqKyUt1mcx06Pmpd/XzmqtCm
         xx9KbLyGreHnIAfHwVtso2LC/5rBzUeobjlkGX8QWRbPVjLFE34IxapdLfcD1Kbg2FhD
         motf5mCR3bNhld/ypvTboqvOiv0PolCyA/0BehJUusZC2MSznEJZKWCmhV5+ooEGMzu1
         XnXQ==
X-Gm-Message-State: ACgBeo3C/soZZIDFUcPnSHv7waR+m9FL8OuR/IvZgWtBzAG3yBNwgjqy
        /lJy3tFavFoPodnhY8MLED/Tgg==
X-Google-Smtp-Source: AA6agR5eyZ2h7w5RjLLSG7d5FjPPg1lIVlIgHyhE2xP7rmlWEP9A/rNyYsvXeoQ7pSdi0cy0hCLiNw==
X-Received: by 2002:a05:600c:a02:b0:3ad:455c:b710 with SMTP id z2-20020a05600c0a0200b003ad455cb710mr14610241wmp.56.1662997903969;
        Mon, 12 Sep 2022 08:51:43 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([89.101.193.70])
        by smtp.gmail.com with ESMTPSA id n186-20020a1ca4c3000000b003b47b80cec3sm6144829wme.42.2022.09.12.08.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 08:51:43 -0700 (PDT)
Message-ID: <9f7e07991c509b3179ea3c4c8def5e6e19f508e2.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/4] media: v4l: ctrls: Add a control for HDR mode
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        linux-media@vger.kernel.org
Cc:     alain.volmat@foss.st.com, hugues.fruchet@foss.st.com,
        sylvain.petinot@foss.st.com, dave.stevenson@raspberrypi.com,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Date:   Mon, 12 Sep 2022 16:51:42 +0100
In-Reply-To: <20220831090118.104057-3-benjamin.mugnier@foss.st.com>
References: <20220831090118.104057-1-benjamin.mugnier@foss.st.com>
         <20220831090118.104057-3-benjamin.mugnier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

Le mercredi 31 ao=C3=BBt 2022 =C3=A0 11:01 +0200, Benjamin Mugnier a =C3=A9=
crit=C2=A0:
> Add V4L2_CID_HDR_MODE as a menu item control to set the HDR mode of the
> sensor, and its documentation.
> Menu items are not standardized as they differ for each sensors.
>=20
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-camera.rst          | 8 ++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                 | 2 ++
>  include/uapi/linux/v4l2-controls.h                        | 2 ++
>  3 files changed, 12 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b=
/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index 4c5061aa9cd4..0ee09ff250e7 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -661,3 +661,11 @@ enum v4l2_scene_mode -
>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
>     options are required.
> +
> +``V4L2_CID_HDR_MODE (menu)``

Perhaps try to make this more sensor specific in it name ?
V4L2_CID_HDR_SENSOR_MODE ?

> +    Change the sensor HDR mode. A HDR picture is obtained by merging two
> +    captures of the same scene using two different exposure periods. HDR=
 mode
> +    describes the way these two captures are merged in the sensor.
> +
> +    As modes differ for each sensor, menu items are not standardized by =
this
> +    control and are left to the programmer.

I do have concern about this approach. Can you clarify ?

regards,
Nicolas

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index e22921e7ea61..0854de1ef1a5 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1043,6 +1043,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
>  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
> +	case V4L2_CID_HDR_MODE:			return "HDR mode";
> =20
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1370,6 +1371,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum=
 v4l2_ctrl_type *type,
>  	case V4L2_CID_STATELESS_H264_START_CODE:
>  	case V4L2_CID_CAMERA_ORIENTATION:
>  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
> +	case V4L2_CID_HDR_MODE:
>  		*type =3D V4L2_CTRL_TYPE_MENU;
>  		break;
>  	case V4L2_CID_LINK_FREQ:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 5f46bf4a570c..5dfd38b09768 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1013,6 +1013,8 @@ enum v4l2_auto_focus_range {
> =20
>  #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
> =20
> +#define V4L2_CID_HDR_MODE			(V4L2_CID_CAMERA_CLASS_BASE+36)
> +
>  /* FM Modulator class control IDs */
> =20
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)

