Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09A2644A84
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 18:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234637AbiLFRlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 12:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234260AbiLFRkn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 12:40:43 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280672AC51
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 09:40:42 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id l15so14290913qtv.4
        for <linux-media@vger.kernel.org>; Tue, 06 Dec 2022 09:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOkTYmnhiazLEuS2jorfY79zc25fQq5hfIh6dVD9kVI=;
        b=uv3CBgWIqChXvjmuNm20KjYb1uCyxwzVoz2EFD7Myt4nTY64wwm3LB1RoS2DwYsoZe
         e33HHZCax6mqBKjAFBeM1ZL6n6RdJWCW2MntKDUnqm8S1iJRy5qc1NCsOY82CWdzHX4/
         L8hPvsoyu5rKc6kWE4FSUL3SYlilBeIp8MkRz2IcmFSfWs4EKNBjNhF+v3OzRnUlWzcd
         Osf+QBZlpQVP/8uc2xv1PQUnVlk4wtvngvK4eXTxkbNHws+K5+sEX7x0xlVaYwDm6SzW
         rD7FYqiC2tiqarekYvpmW5OCHSExpg+Bbv8jhHwDQXrEe+cPj2z4W/MXQ+WOGcMR2nxa
         gtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oOkTYmnhiazLEuS2jorfY79zc25fQq5hfIh6dVD9kVI=;
        b=VqMUKzaF/M1DYgWebNsBIFvi4M7UHkXsAJ9wNvu6GdCKbrNXcxKJpZiNicm/6mWxHQ
         aHH7YlCHnH+IHmk5Ln8demKfqxCdHTybzKiX+NwrCkmSmyTAMIW2JyOE/iD9x/hOPnbh
         tJw0DLX3pUcbrappmS3Rryueb9xTFi9a1XoJCI0irJTbUNfHeiwQJ/eRlLM0bY+XgidB
         y2j22vP2+vAkV1x9ixDyLgjDMN0L0wQBud62ZThJbQhXxSrbzMR1XEMWX13rr03ozNIu
         avmynnB8GqFi1cdc8vxjpWeeF/CowBXOt6yK8KMsVCu8R07uqgYwcX8ef7xPcRj8B6Qi
         wK+Q==
X-Gm-Message-State: ANoB5pk2pSVD2q8EUi1eGqkSGpO9HUv0wnQDfC+32fQQZ4MgJi1tfBAb
        LDeppoqM0rGQgd7tu5Il/7FUh52OUHsS3ADJ
X-Google-Smtp-Source: AA0mqf5M3Zjz1sCMVEfBbrR9e9NX8ylgiun/fzx+qW+W3siusIuNIpQ+5aaMgmPsPU0D7UqUEycUSA==
X-Received: by 2002:a05:622a:294:b0:3a7:e4d1:c76e with SMTP id z20-20020a05622a029400b003a7e4d1c76emr8031013qtw.505.1670348441326;
        Tue, 06 Dec 2022 09:40:41 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id m10-20020ac8444a000000b0039cc944ebdasm11986491qtn.54.2022.12.06.09.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 09:40:40 -0800 (PST)
Message-ID: <c1727c05f5f19b749cb5d0e441e363f4bed9d044.camel@ndufresne.ca>
Subject: Re: [PATCH 2/7] media: Add Y210, Y212 and Y216 formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Date:   Tue, 06 Dec 2022 12:40:38 -0500
In-Reply-To: <20221206133954.397098-3-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
         <20221206133954.397098-3-tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le mardi 06 d=C3=A9cembre 2022 =C3=A0 15:39 +0200, Tomi Valkeinen a =C3=A9c=
rit=C2=A0:
> Add Y210, Y212 and Y216 formats.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

This patch is simply missing an update to:

Documentation/userspace-api/media/v4l/yuv-formats.rst

regards,
Nicolas

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
>  include/uapi/linux/videodev2.h       | 8 ++++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 964300deaf62..ba95389a59b5 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1449,6 +1449,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr =3D "Rockchip ISP1 3A Statist=
ics"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr =3D "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_10BE_8L128:	descr =3D "10-bit NV12M (8x128 Line=
ar, BE)"; break;
> +	case V4L2_PIX_FMT_Y210:		descr =3D "10-bit YUYV Packed"; break;
> +	case V4L2_PIX_FMT_Y212:		descr =3D "12-bit YUYV Packed"; break;
> +	case V4L2_PIX_FMT_Y216:		descr =3D "16-bit YUYV Packed"; break;
> =20
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 877fd61693b8..15b640d2da8a 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -621,6 +621,14 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX=
-8-8-8-8  */
>  #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV =
4:2:0 2 lines y, 1 line uv interleaved */
> =20
> +/*
> + * YCbCr packed format. For each Y2xx format, xx bits of valid data occu=
py the MSBs
> + * of the 16 bit components, and 16-xx bits of zero padding occupy the L=
SBs.
> + */
> +#define V4L2_PIX_FMT_Y210    v4l2_fourcc('Y', '2', '1', '0') /* 32  YUYV=
 4:2:2 */
> +#define V4L2_PIX_FMT_Y212    v4l2_fourcc('Y', '2', '1', '2') /* 32  YUYV=
 4:2:2 */
> +#define V4L2_PIX_FMT_Y216    v4l2_fourcc('Y', '2', '1', '6') /* 32  YUYV=
 4:2:2 */
> +
>  /* two planes -- one Y, one Cr + Cb interleaved  */
>  #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/Cb=
Cr 4:2:0  */
>  #define V4L2_PIX_FMT_NV21    v4l2_fourcc('N', 'V', '2', '1') /* 12  Y/Cr=
Cb 4:2:0  */

