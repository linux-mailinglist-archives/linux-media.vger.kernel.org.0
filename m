Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110A933DC75
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 19:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239946AbhCPSUj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 14:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239933AbhCPSUQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 14:20:16 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED9DC06174A;
        Tue, 16 Mar 2021 11:20:16 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id r20so21761927ljk.4;
        Tue, 16 Mar 2021 11:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/EY3L/mBI9A92qs+kcJfia7iM4nIgXa7Eq9egkGrSYQ=;
        b=ShxQSv1YnF0cA0m72VVBXuOJkv4rMoe/cZcEB2scB3iPD98yKUVaIFHsUQHsvMb+9F
         Ulv48BWA6vPHbW9Gy3pbWeEv/BRfws287bbrFenYgrmBnhJ0IkXxBBUDQmm44yeNF2fG
         XFk3UqwpJ2JQbH8wL/kiWkqOPddwzcDUhFPc5v9TpIuseArS9Uz3MSKY6vTsajrWy2V3
         QqYUB6LvpyCN2+RIrKOhikeIs3dJYUYxqiQgo+o+IPXvMhCgCbOZQDLu/f+RS2pcocdI
         mQLAzxCO2uhxuFKSaBUpxzWFAdlDp/BRIZb7cUfzpl1HrrxTOITSs09rJEjTUZQz30om
         h7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/EY3L/mBI9A92qs+kcJfia7iM4nIgXa7Eq9egkGrSYQ=;
        b=UdTvLa6eHFBFIYEy9mUkXL4hCFkAgLEa3gRBY1Dk1TFoo6f2ngEpqRA+tLh3MOovZ5
         yBD1Fufcif3TVWdBzzc/JKfbA3IgShGddmHnZO8dfemGYwKM81/mv5oPAKxk1XF0iSL8
         zvbT6Z0EQcZfASXN5jzXw9LmEO3w4j0UTPVsuGFFE4H2JetIIz4McbTWLjCPgFaGgAdi
         y8DIp1+NFLDTY96z+emw5clAmG0eV7eZycQJAH1+Dw944FtgxhqPf7G6iFhQS1384IIm
         9JCabJ9ahYkZvaBajt7zTluf/2r17BU9krHufVFtNe3DqyRVkFTQ76XJ2NTWAY0TTJMk
         AxOA==
X-Gm-Message-State: AOAM531HJK5MTWYPb1SBw6bkL1A5XAQPh9FUdQqAx8vu5IblZBlVyHGw
        pzfJmmoXzwFh6N93F/GLhmvgUsc6F0fkyqFO0Lg=
X-Google-Smtp-Source: ABdhPJzS1GwTMKy9q7+dcAKRjRYTkm3ot0+9gSzRXYXGbbM6cKzdnXnGRTNBCsOwG3SQX7GqDjUfMOgI5CLoDMhnrNQ=
X-Received: by 2002:a2e:7409:: with SMTP id p9mr3392483ljc.165.1615918814407;
 Tue, 16 Mar 2021 11:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com> <20210208051749.1785246-2-sergey.senozhatsky@gmail.com>
In-Reply-To: <20210208051749.1785246-2-sergey.senozhatsky@gmail.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Tue, 16 Mar 2021 19:19:57 +0100
Message-ID: <CAPybu_19hztQQEi0H40sWZQMb-X7g7dDuW4Mz8_gRv-nG2tghw@mail.gmail.com>
Subject: Re: [PATCHv2 1/3] media: v4l UAPI docs: document ROI selection targets
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey

Thanks for the patch!

On Mon, Feb 8, 2021 at 6:21 AM Sergey Senozhatsky
<sergey.senozhatsky@gmail.com> wrote:
>
> From: Sergey Senozhatsky <senozhatsky@chromium.org>
>
> Document new v4l2-selection target which will be used for the
> Region of Interest v4l2 control.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/v4l/selection-api-configuration.rst | 23 +++++++++++++++++++
>  .../media/v4l/v4l2-selection-targets.rst      | 21 +++++++++++++++++
>  include/uapi/linux/v4l2-common.h              |  8 +++++++
>  3 files changed, 52 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/selection-api-configuration.rst b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
> index fee49bf1a1c0..9f69d71803f6 100644
> --- a/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
> +++ b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
> @@ -135,3 +135,26 @@ and the height of rectangles obtained using ``V4L2_SEL_TGT_CROP`` and
>  ``V4L2_SEL_TGT_COMPOSE`` targets. If these are not equal then the
>  scaling is applied. The application can compute the scaling ratios using
>  these values.
> +
> +Configuration of Region of Interest (ROI)
> +=========================================
> +
> +The range of coordinates of the top left corner, width and height of
> +areas that can be ROI is given by the ``V4L2_SEL_TGT_ROI_BOUNDS`` target.
> +It is recommended for the driver developers to put the top/left corner
> +at position ``(0,0)``. The rectangle's coordinates are in global sensor
> +coordinates. The units are in pixels and independent of the field of view.
> +They are not impacted by any cropping or scaling that is currently being
> +used.

Can we also mention binning here?

> +
> +The top left corner, width and height of the Region of Interest area
> +currently being employed by the device is given by the
> +``V4L2_SEL_TGT_ROI_CURRENT`` target. It uses the same coordinate system
> +as ``V4L2_SEL_TGT_ROI_BOUNDS``.

Why do we need current? Cant we just read back V4L2_SEL_TGT_ROI ?

> +
> +In order to change active ROI top left, width and height coordinates
> +use ``V4L2_SEL_TGT_ROI`` target.
> +
> +Each capture device has a default ROI rectangle, given by the
> +``V4L2_SEL_TGT_ROI_DEFAULT`` target. Drivers shall set the ROI rectangle
> +to the default when the driver is first loaded, but not later.
> diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> index e877ebbdb32e..cb3809418fa6 100644
> --- a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> +++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> @@ -69,3 +69,24 @@ of the two interfaces they are used.
>         modified by hardware.
>        - Yes
>        - No
> +    * - ``V4L2_SEL_TGT_ROI_CURRENT``
> +      - 0x0200
> +      - Current Region of Interest rectangle.
> +      - Yes
> +      - No
> +    * - ``V4L2_SEL_TGT_ROI_DEFAULT``
> +      - 0x0201
> +      - Suggested Region of Interest rectangle.
> +      - Yes
> +      - No
> +    * - ``V4L2_SEL_TGT_ROI_BOUNDS``
> +      - 0x0202
> +      - Bounds of the Region of Interest rectangle. All valid ROI rectangles fit
> +       inside the ROI bounds rectangle.
> +      - Yes
> +      - No
> +    * - ``V4L2_SEL_TGT_ROI``
> +      - 0x0203
> +      - Sets the new Region of Interest rectangle.
> +      - Yes
> +      - No
As mentioned before I think we should not have TGT_ROI_CURRENT and TGT_ROI


> diff --git a/include/uapi/linux/v4l2-common.h b/include/uapi/linux/v4l2-common.h
> index 7d21c1634b4d..d0c108fba638 100644
> --- a/include/uapi/linux/v4l2-common.h
> +++ b/include/uapi/linux/v4l2-common.h
> @@ -78,6 +78,14 @@
>  #define V4L2_SEL_TGT_COMPOSE_BOUNDS    0x0102
>  /* Current composing area plus all padding pixels */
>  #define V4L2_SEL_TGT_COMPOSE_PADDED    0x0103
> +/* Current Region of Interest area */
> +#define V4L2_SEL_TGT_ROI_CURRENT       0x0200
> +/* Default Region of Interest area */
> +#define V4L2_SEL_TGT_ROI_DEFAULT       0x0201
> +/* Region of Interest bounds */
> +#define V4L2_SEL_TGT_ROI_BOUNDS        0x0202
> +/* Set Region of Interest area */
> +#define V4L2_SEL_TGT_ROI               0x0203

Nit: Maybe it could be a good idea to split doc and code. This way the
backports/fixes are easier.

>
>  /* Selection flags */
>  #define V4L2_SEL_FLAG_GE               (1 << 0)
> --
> 2.30.0
>


-- 
Ricardo Ribalda
