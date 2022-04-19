Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7CF50790D
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 20:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357346AbiDSSe7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 14:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358389AbiDSSeU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 14:34:20 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60EF201A7
        for <linux-media@vger.kernel.org>; Tue, 19 Apr 2022 11:24:57 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id bb21so3994725qtb.3
        for <linux-media@vger.kernel.org>; Tue, 19 Apr 2022 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=jS+kIlXH/70eT1R81qpkqcCD5ZAK5BfPs6hlKfvCYrI=;
        b=WZQOnRaAQa9/0X2gy5EM2fDpixus4lKOUsdvCVafdod2wr5lX7VmE8YfFrNEFvvcHB
         Lm9KWksXZuQ1TCCyWgBnCmJQAp9zkIhumgLuorvsBouh4q8nMic57dNrKFyswQrg02yq
         +gRJ4GY5LkYNH4kzH7dikmLLdDD9NXSFV5+QscmyBRtwQlued/9ThzJaJQGkCGh9JRnH
         MxtnTbKH7XcykzgarYKLP0w5/lQwvARwNtbpv0zuVLdJPmKrTwphHDMdMbltqgEkgZ/j
         ttODKW4f0JViNWeX3tYTKTMh+3+ldSxQWCSbAxWLzp7KEEl26aUD0Vw+OTUfUElzGnCl
         B1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=jS+kIlXH/70eT1R81qpkqcCD5ZAK5BfPs6hlKfvCYrI=;
        b=VfLqRUn0kAxlFdRgVZ9S5D+6tvyAQ6sK/IAfU9oqvZgqs8PuX12mloJH2lv2FY8Jds
         TKRSHCPZMm2tBJ2pLjwrJClirQGfExaSqw5GHL7A0OwsFdz/Uzyzpawc1LuvughtooW5
         ZK6kMSS91RLA2Uaw0m/93UuMLzRBTOkM1o3GiaZwbbgc5P8f9GPVBnQuDZvQdRi5+69J
         c3AyGmlk4iC1Nf/gTIbeJvHypqzPJE/xX1vwXhFRogkXc27huk5kbDuXgRGUIFal3d2W
         wlNJXbJJ3FprI9W1va8xNPaN/ziMwXmemccZlSRrI54Wrgheps6Napzoq6I8yyKicYxL
         knYA==
X-Gm-Message-State: AOAM5317aFsk1pUHSycYocdBeMvTr/TbgWbfFgXkDVdwQrxSlXOH1cEp
        A/NcQm10X26Ps/eCe9QJsdMs+A==
X-Google-Smtp-Source: ABdhPJyxNAznH1CwYsjr41pjF5q5WMOXEv0N8BdD0CfTqH/fJgsPmKtu42tMLik7EOyspm561hV0cw==
X-Received: by 2002:ac8:594f:0:b0:2f2:228:e585 with SMTP id 15-20020ac8594f000000b002f20228e585mr6281548qtz.325.1650392696850;
        Tue, 19 Apr 2022 11:24:56 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id j188-20020a3755c5000000b0067d1c76a09fsm410209qkb.74.2022.04.19.11.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 11:24:56 -0700 (PDT)
Message-ID: <d4c868d5ef05f338bdc2237d9b9304077d268c8b.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/5] media: v4l: ctrls: Add a control for temperature
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        linux-media@vger.kernel.org
Cc:     alain.volmat@foss.st.com, hugues.fruchet@foss.st.com,
        sylvain.petinot@foss.st.com, dave.stevenson@raspberrypi.com,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, linux-hwmon@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 19 Apr 2022 14:24:55 -0400
In-Reply-To: <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
         <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
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

adding linux-hwmon in CC for a wider feedback.

Le vendredi 15 avril 2022 =C3=A0 13:18 +0200, Benjamin Mugnier a =C3=A9crit=
=C2=A0:
> Add V4L2_CID_TEMPERATURE control to get temperature from sensor in
> celsius as a volatile and read-only control, and its documentation.
> Useful to monitor thermals from v4l controls for sensors that support
> this.

Any justification to expose a temperature sensor outside of the dedicated k=
ernel
API hwmon ? I know if may makes it harder to use, as the sensor isn't bound=
 to
the camera driver, and also the sensor may not work if the camera is not
streaming. But in the end, the API in hwmon does not look that complex, and=
 is
perhaps more precise ?

All in all, I think we need a strong justification to implement a custom
thermometer interface, something described here and documented with care to
prevent abuse. I would also see opinion from folks outside of the linux-med=
ia,
hence why I have CCed hwmon mailing list.

regards,
Nicolas

>=20
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst | 3 +++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                  | 4 ++++
>  include/uapi/linux/v4l2-controls.h                         | 2 ++
>  3 files changed, 9 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b=
/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index 4c5061aa9cd4..26fa21f5c45a 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -661,3 +661,6 @@ enum v4l2_scene_mode -
>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
>     options are required.
> +
> +``V4L2_CID_TEMPERATURE (integer)``
> +    The temperature of the sensor in celsius. This is a read-only contro=
l.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index 54ca4e6b820b..45ad3edd59e0 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1042,6 +1042,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
>  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
> +	case V4L2_CID_TEMPERATURE:		return "Temperature in =C2=B0C";
> =20
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1597,6 +1598,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum=
 v4l2_ctrl_type *type,
>  	case V4L2_CID_RF_TUNER_PLL_LOCK:
>  		*flags |=3D V4L2_CTRL_FLAG_VOLATILE;
>  		break;
> +	case V4L2_CID_TEMPERATURE:
> +		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY |
> +			  V4L2_CTRL_FLAG_VOLATILE;
>  	}
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_fill);
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index bb40129446d4..705b4043c2de 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1008,6 +1008,8 @@ enum v4l2_auto_focus_range {
> =20
>  #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
> =20
> +#define V4L2_CID_TEMPERATURE			(V4L2_CID_CAMERA_CLASS_BASE+36)
> +
>  /* FM Modulator class control IDs */
> =20
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)

