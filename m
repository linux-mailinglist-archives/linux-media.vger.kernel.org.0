Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6F652A341
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 15:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242834AbiEQNXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 09:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241475AbiEQNXH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 09:23:07 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED44427E8
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 06:23:06 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id t16so14230111qtr.9
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=ZmgppTDfG8ttiZriTDxz+S/w6wfAS59H2hKHQIjC/es=;
        b=P8qLo10lFw/Pzi8w30SmQeXNXseKOlvr1Kz220DjYTQmm3qAWkCagx921/w82HeKLE
         u3Lmr5u22KLtkCdPi53h+cI9Hjj6tbRksgI1G7yNRRRcSbw+z8g3x2SxQLG2rCEE1Uj7
         S76NWgJ1QzL4d/iQFIq/IJ68x9xQfLD2Ldt46TFkIrmcbO2a69lNTvus6PV++N8731St
         VeO/pes7KXpd3ZRupUn9TC27hCkPw+3Cz0DJfWO56YAuO7/eu7OEyG151NTcnW3tcZky
         n3fwI15+nrET/NsRCZW9SdyuBZc2QwXtwoaoVhXAx9L5B2m/EondWXUMiDiXRVDbjTIC
         iqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=ZmgppTDfG8ttiZriTDxz+S/w6wfAS59H2hKHQIjC/es=;
        b=y+UQuVHoUdHQhuH2QJVNBA1rHIhAXykGl0ssJwvqj0Xw+7PxVzhbgpJTRGfZptfLa4
         y0oqrU9wCEGa4BTvcfxVlu9L6gDmTJ6GDRYFNLKDrrVvachhVPKBFrzM+k/DnIGM/oiG
         VazIi63fYH7OFgBHulJ6E1izT3KXB/wkjf2EDBKI5lHgkkfWZloeuEv3uwXdAMD+HqWi
         N9Lrl48LHio1+VdMuT94JtSII5dmXxMS1Sv4reM/tlMMy+x8qvlz9P2/GQBTOQICrgTe
         30jLNN5xNr24H6mu068LmmB9Ydllml8VoODmUXOILVNN1Ibz4L02lrnWlO2aCjBLLMxe
         IDcQ==
X-Gm-Message-State: AOAM530D+AG8VegKq0PeueOhXNWGxonrnl2CV2CRs2ROBtfG5klwfcZi
        RFMBI4cdIcZnEDn3o/NhMlceMw==
X-Google-Smtp-Source: ABdhPJzy0KnyhsirbXnVuCdRWt1Ez6X2u/or1/czx62OxHTJGzsC9jzDj68l7clgNe2k5s1w8jF3qQ==
X-Received: by 2002:a05:622a:51:b0:2f3:c5f7:66f1 with SMTP id y17-20020a05622a005100b002f3c5f766f1mr19143858qtw.662.1652793785554;
        Tue, 17 May 2022 06:23:05 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id u26-20020ac8751a000000b002f39b99f6absm7203387qtq.69.2022.05.17.06.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 06:23:05 -0700 (PDT)
Message-ID: <e30531ef60ed12f40e1c778d7927214b15b79922.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/6] media: v4l2_ctrl: Add region of interest auto
 control
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Yunke Cao <yunkec@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Date:   Tue, 17 May 2022 09:23:04 -0400
In-Reply-To: <20220516140434.1871022-3-yunkec@google.com>
References: <20220516140434.1871022-1-yunkec@google.com>
         <20220516140434.1871022-3-yunkec@google.com>
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

Le lundi 16 mai 2022 =C3=A0 23:04 +0900, Yunke Cao a =C3=A9crit=C2=A0:
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  .../media/v4l/ext-ctrls-camera.rst            | 25 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
>  include/uapi/linux/v4l2-controls.h            |  9 +++++++
>  3 files changed, 36 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b=
/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index 86a1f09a8a1c..3da66e1e1fc7 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -665,3 +665,28 @@ enum v4l2_scene_mode -
>  ``V4L2_CID_REGION_OF_INTEREST_RECT (struct)``
>      This control determines the region of interest. Region of interest i=
s an
>      rectangular area represented by a struct v4l2_rect.
> +
> +``V4L2_CID_REGION_OF_INTEREST_AUTO (bitmask)``
> +    This determines which, if any, on board features should track to the
> +    Region of Interest.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE``
> +      - Auto Exposure.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS``
> +      - Auto Iris.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
> +      - Auto White Balance.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS``
> +      - Auto Focus.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT``
> +      - Auto Face Detect.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
> +      - Auto Detect and Track.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
> +      - Image Stabilization.
> +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> +      - Higher Quality.

Now I see the usage, the control is missing cross-reference and behaviour.
Consider that someone may have to use or implement your feature on differen=
t HW
and in different context in the future. Right now you aren't writing a
specification, but barely listing things that are already encoded in the it=
em
names. For each of this, add human readable prose that explain what is expe=
cted
behaviour when the bit is set. This way, future implementation can check th=
eir
behaviour and cross-over with the documentation to make sure it is a fit, o=
r if
another bit need to be allocated.

I still believe REGION_OF_INTEREST is too generic of a name for the purpose=
, as
in the context of the V4L2 API, we also support video encoders, and none of=
 this
(perhaps except QUALITY, but with encoder you have to specify a delta for t=
hat).
The name really needs to be specialized to be implemented this way. Otherwi=
se,
it create confusion, and makes the V4L2 uAPI poorer over time. Naming is ha=
rd,
but I need to make a suggestion, perhaps CAMERA_ROI ? We have classes, perh=
aps a
class for the CAMERA controls is needed ?

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index 95f39a2d2ad2..f28763bf95e9 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1043,6 +1043,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>  	case V4L2_CID_REGION_OF_INTEREST_RECT:  return "Region Of Interest Rect=
angle";
> +	case V4L2_CID_REGION_OF_INTEREST_AUTO:  return "Region Of Interest Auto=
 Controls";
> =20
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1415,6 +1416,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum=
 v4l2_ctrl_type *type,
>  	case V4L2_CID_JPEG_ACTIVE_MARKER:
>  	case V4L2_CID_3A_LOCK:
>  	case V4L2_CID_AUTO_FOCUS_STATUS:
> +	case V4L2_CID_REGION_OF_INTEREST_AUTO:
>  	case V4L2_CID_DV_TX_HOTPLUG:
>  	case V4L2_CID_DV_TX_RXSENSE:
>  	case V4L2_CID_DV_TX_EDID_PRESENT:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 499fcddb6254..f6938e4de129 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1009,6 +1009,15 @@ enum v4l2_auto_focus_range {
>  #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
> =20
>  #define V4L2_CID_REGION_OF_INTEREST_RECT	(V4L2_CID_CAMERA_CLASS_BASE+36)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO	(V4L2_CID_CAMERA_CLASS_BASE+37)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE		(1 << 0)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS			(1 << 1)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE		(1 << 2)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS			(1 << 3)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT		(1 << 4)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK	(1 << 5)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION	(1 << 6)
> +#define V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY		(1 << 7)
> =20
>  /* FM Modulator class control IDs */
> =20

