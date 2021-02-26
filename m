Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6354D32623E
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 13:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhBZMAs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 07:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbhBZMAr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 07:00:47 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4DCC06174A
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 04:00:07 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id d2so5956698pjs.4
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 04:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OTt+hzwUzbEnNK6etaUVSe6BNGtkKbiycN/jXlNteq0=;
        b=asNZJiY/ZN5/+Dh0isecfCCWU4RODpQNusNjrlECjqzWIL/uwWIBOBPJCh5a8J+icW
         58k9I4EH5I4J8AuSpTqnnQcatHcS4FICl89ylMgE79cPJMPQlwoD4Z/p7k5XYUTnrJ9i
         DBGfYfLLHS7jSrrdepRYAYw2f2QJMR6adyYDSKAMy3Mx/V2f7O3VJO1n4oyhEBPiNSeX
         L3u7OGk5NKdOPy6L05PUQtw8Fz6ksdNKiN25JGwnR/7D9ujyhoiPYkrB63j8RRydcs/W
         LnXCfsNq7zfQLv/doZ4JHMDtMK2LOK9POnSS9qDubVbq2SgAs0KoG9BWMjrMktcCJ+gf
         PUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OTt+hzwUzbEnNK6etaUVSe6BNGtkKbiycN/jXlNteq0=;
        b=rTcXauR/9Hs/pPPis95+4jlS56IV7s+ITjrKUFbP4oyVgBXgQ6bwUWZJIGhDs+GnIV
         Q3cDqzRxjHayOEitBXqoKRMzZnqCHncwjOHgeRP8+Fz97XqJ7y4e+kZMsVU883aiVAMa
         afISNHNo2rO0X04r9DvKYif0kmfdtHIpObkDmmwYeW1Od7ZwoGqD15b3vkyjYkS/V2wh
         mUMhvhCP2kj+yL28DQH1I/2ELZ+mWEIq3T2ooaljQsLa87ywM0X+bTWGD+wgEdBMKBv4
         SrQZbuKTshJ00dpgos3k/T+r0nfTlvP7ib0TeGCcE5mN2sHZ187QHv1OQJz/pe2iyq00
         ftWg==
X-Gm-Message-State: AOAM533aDRGiONjpk85Q2me66STJEbxHXfYlUni3UHW67iUCWDSuluqA
        l8S5s23YUjEGLD24rFpSa3UoQspyeIVq6viXSqU+JA==
X-Google-Smtp-Source: ABdhPJyfnocGVGubk0og9fBr+6c+QqVcyum8wyer3OWW0BX2xL+xddU+EDj2PYGrP8++GK2VEYgewJ7knmtQVGv/4t0=
X-Received: by 2002:a17:90a:8b83:: with SMTP id z3mr3182942pjn.75.1614340807377;
 Fri, 26 Feb 2021 04:00:07 -0800 (PST)
MIME-Version: 1.0
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com> <1613619715-28785-3-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1613619715-28785-3-git-send-email-victor.liu@nxp.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 26 Feb 2021 12:59:56 +0100
Message-ID: <CAG3jFysoPCDW5RQeDLa3b97UrH0yKi=K=tJLFuXK6YZHZm+T+g@mail.gmail.com>
Subject: Re: [PATCH v4 02/14] media: uapi: Add some RGB bus formats for
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

This patch looks good to me
Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 18 Feb 2021 at 04:56, Liu Ying <victor.liu@nxp.com> wrote:
>
> This patch adds RGB666_1X30_CPADLO, RGB888_1X30_CPADLO, RGB666_1X36_CPADLO
> and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp pixel combiner.
> The RGB pixels with padding low per component are transmitted on a 30-bit
> input bus(10-bit per component) from a display controller or a 36-bit
> output bus(12-bit per component) to a pixel link.
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
>  include/uapi/linux/media-bus-format.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 0dfc11e..ec3323d 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -34,7 +34,7 @@
>
>  #define MEDIA_BUS_FMT_FIXED                    0x0001
>
> -/* RGB - next is       0x101e */
> +/* RGB - next is       0x1022 */
>  #define MEDIA_BUS_FMT_RGB444_1X12              0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE      0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE      0x1002
> @@ -59,9 +59,13 @@
>  #define MEDIA_BUS_FMT_RGB888_3X8_DELTA         0x101d
>  #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG                0x1011
>  #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA       0x1012
> +#define MEDIA_BUS_FMT_RGB666_1X30_CPADLO       0x101e
> +#define MEDIA_BUS_FMT_RGB888_1X30_CPADLO       0x101f
>  #define MEDIA_BUS_FMT_ARGB8888_1X32            0x100d
>  #define MEDIA_BUS_FMT_RGB888_1X32_PADHI                0x100f
>  #define MEDIA_BUS_FMT_RGB101010_1X30           0x1018
> +#define MEDIA_BUS_FMT_RGB666_1X36_CPADLO       0x1020
> +#define MEDIA_BUS_FMT_RGB888_1X36_CPADLO       0x1021
>  #define MEDIA_BUS_FMT_RGB121212_1X36           0x1019
>  #define MEDIA_BUS_FMT_RGB161616_1X48           0x101a
>
> --
> 2.7.4
>
