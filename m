Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A0A3262DD
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 13:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhBZMpM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 07:45:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhBZMpJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 07:45:09 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8727C061756
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 04:44:28 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id j12so6156611pfj.12
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 04:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3RToDDj9t1WukrTixwLWcxGkVwEEocSrMyQzXbk3sVE=;
        b=k0clAFjouDL7G4Qzgcy4jMb5iykmG0xTitLDNh4eq3muVbP87c91yNC8s/uzrm5X45
         Zxc2eP2GueAiL0CawdsSg3BfN2tpFqiHDz+KmFDXwIO+uFI1VRiZRmia+m4V8NvPFdHj
         gRc2j1nXbiJhqCJjAl5r2gFc4lCeDLu7PD4ZISNS1K3xeumxA+ZJ1E/9VLAXeyIZGGIJ
         +p3zRkOJrYpHEfSPjqTnay3X0wo2D2DJ9VCid0lk3hZwqpb+18SCK0UeHvU6NPESNRHl
         XKOLHAgY4+/sECTIg82bmVMgQX6tn+M9zNTpRjdeiQN+T/PzvJaaxNRZ6EM2BT7rHfqa
         IWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3RToDDj9t1WukrTixwLWcxGkVwEEocSrMyQzXbk3sVE=;
        b=YSFFtQhsHbs+8BwzCR4m4+biQTeOoOQe+XcpXgyOd3CnxkZXB6iq3DDrrwAvok//3Z
         +zSIOGbaEvji4m6zRSe/j07O4T7TSgziK2b/ZGiTRJ2iZaWeb+O1zb/nLLfPEY/UvJ49
         6xvBv1h5YH3Uu7a079azvNe2LUaXUGGWqn++28bSIJzuG4U7qgazVQpoyTGpk1neAR+g
         al8djLKWlRoOlnIsp0ARu5dEXCNKJS14BAeKbBAhIvoWz6YYAGsIgIDV5cWrWB3uNBjU
         PB2dhev4fKwNziV1wOpKOGXk3PbeGuTLLGhQC6OKv/iDMVRhWDhrbtX8CBepYDa2gYQB
         0yIQ==
X-Gm-Message-State: AOAM530a5KE6+SvD4DXgDY0if1yQG8Jcl26T5JHevGcy8gNT0a5bH4df
        rqvDbcCAhRnkxQ7QDapEbzVEjTv8cOA1yu85aFRk4g==
X-Google-Smtp-Source: ABdhPJy0t34lL7z1JpPxSn8yDzGP/55kmin97Q6FmWKl22jUKv+hYUQu90YkYuAA1aUsOu9GHrOkX8fU5azwppFjaHk=
X-Received: by 2002:a62:7888:0:b029:1ed:cc30:923e with SMTP id
 t130-20020a6278880000b02901edcc30923emr3251233pfc.12.1614343468239; Fri, 26
 Feb 2021 04:44:28 -0800 (PST)
MIME-Version: 1.0
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com> <1613619715-28785-4-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1613619715-28785-4-git-send-email-victor.liu@nxp.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 26 Feb 2021 13:44:17 +0100
Message-ID: <CAG3jFyvZfUoN7KXoodLrem5OFWERuoc4Avh8No4UdYk3c-GszQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] media: docs: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
To:     Liu Ying <victor.liu@nxp.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>, kishon@ti.com,
        Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Liu,

This patch looks good to me.
Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 18 Feb 2021 at 04:56, Liu Ying <victor.liu@nxp.com> wrote:
>
> This patch adds documentations for RGB666_1X30_CPADLO, RGB888_1X30_CPADLO,
> RGB666_1X36_CPADLO and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp
> pixel combiner.  The RGB pixels with padding low per component are
> transmitted on a 30-bit input bus(10-bit per component) from a display
> controller or a 36-bit output bus(12-bit per component) to a pixel link.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3->v4:
> * No change.
>
> v2->v3:
> * No change.
>
> v1->v2:
> * No change.
>
>  .../userspace-api/media/v4l/subdev-formats.rst     | 156 +++++++++++++++++++++
>  1 file changed, 156 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 7f16cbe..201c16d 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -1488,6 +1488,80 @@ The following tables list existing packed RGB formats.
>        - b\ :sub:`2`
>        - b\ :sub:`1`
>        - b\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-RGB666-1X30-CPADLO:
> +
> +      - MEDIA_BUS_FMT_RGB666_1X30-CPADLO
> +      - 0x101e
> +      -
> +      - 0
> +      - 0
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +    * .. _MEDIA-BUS-FMT-RGB888-1X30-CPADLO:
> +
> +      - MEDIA_BUS_FMT_RGB888_1X30-CPADLO
> +      - 0x101f
> +      -
> +      - 0
> +      - 0
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - 0
> +      - 0
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - 0
> +      - 0
>      * .. _MEDIA-BUS-FMT-ARGB888-1X32:
>
>        - MEDIA_BUS_FMT_ARGB888_1X32
> @@ -1665,6 +1739,88 @@ The following table list existing packed 36bit wide RGB formats.
>        - 2
>        - 1
>        - 0
> +    * .. _MEDIA-BUS-FMT-RGB666-1X36-CPADLO:
> +
> +      - MEDIA_BUS_FMT_RGB666_1X36_CPADLO
> +      - 0x1020
> +      -
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +    * .. _MEDIA-BUS-FMT-RGB888-1X36-CPADLO:
> +
> +      - MEDIA_BUS_FMT_RGB888_1X36_CPADLO
> +      - 0x1021
> +      -
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
>      * .. _MEDIA-BUS-FMT-RGB121212-1X36:
>
>        - MEDIA_BUS_FMT_RGB121212_1X36
> --
> 2.7.4
>
