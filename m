Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C293D7D0D
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 20:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbhG0SEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 14:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbhG0SEE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 14:04:04 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947C0C061760
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 11:04:02 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y12so8447582edo.6
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 11:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GafHAUNL+sjy6ExfCuaS6GjWzGJjdmYtQPnrrCad7po=;
        b=zacsEf/gWmzsXeehztjZnAoEle5BSIO0okfN91EJ/wjaatGdrk6jZ5Ec6LYkCaZhGZ
         1BVrfglwyuL/oIdTpFkYASBgm8YmEdy6hrkV9JDCpOXvcLKEnR3lVkMNrdL8QomzGWOT
         Bqbkx1dphhm+Unpsk6ymc3zBH0DPN4n3jb7UpHrCuFTSUQXuyHsRho/6bKxOHANT+ugZ
         F+WwVEf+Xq8iUSOIV3CgUcow9G5smWAlZS3ziJ9nuXSxNlIQU6/dw3kJKSADATTl7JOE
         aq6ZsQBDVb/+wx4eHmMCN61j/MPiwzzPSjSpkp8Teu1vTcPtfVNCkwwUw+MIhhzPP6uO
         yGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GafHAUNL+sjy6ExfCuaS6GjWzGJjdmYtQPnrrCad7po=;
        b=Ue96swxiolhP8gjXm2ow5+a6WC+4a6VOYi0eIZw42klvrLtOD/8h8f+EOHVcHZc5ep
         bBt+JJdLOrm/OkE1Mte3R8V38P0lOG9q9Ugk+e0VJTsAF0tsjrKUWhO9LjUqR7iUm4gf
         wCT5fMczNc5MUaktWtD3rzoUgMldHptDe4NkIzlfp+4SVMH5Gq5jSFjfoo7XBxpOlgjc
         aC/dIerFQd+NAOl6QLXCcwdDUx4lReAwPxNY8JxX04018MDr1QcE6x/xoLrNgf0WlOO0
         BknSysKxAg9LD6PWSs09rfIXE3F2YNTIbRHPNcYVju+RI9K8D31H5nXedaMzPY8OUfRo
         SjyQ==
X-Gm-Message-State: AOAM532TX5rRVdyUiwWXHp+D5VPvkjcy0CUdhuMRIuxxXVO3ZbX1AndV
        qKyXWdRY8chyoYiJt9tCBJ9bk8VUH4gA20U5zb5ZBA==
X-Google-Smtp-Source: ABdhPJxlsaf+LhkKyXiphpI8rxtv9bJzrwO4Djg7iTwhTv3ZHLpWpdIv0Ni5sdiOjfj6Rs/g2y1b5OeTIUl85bmETMw=
X-Received: by 2002:a05:6402:17d3:: with SMTP id s19mr29021761edy.49.1627409041203;
 Tue, 27 Jul 2021 11:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627353315.git.ming.qian@nxp.com> <ee482c18fdaae121e3c9495d07b0f3eb1661e36e.1627353315.git.ming.qian@nxp.com>
 <e88f70b1438d4e5b5313aacccb1f369cabe513bc.camel@ndufresne.ca>
In-Reply-To: <e88f70b1438d4e5b5313aacccb1f369cabe513bc.camel@ndufresne.ca>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 27 Jul 2021 15:03:49 -0300
Message-ID: <CAAEAJfBTPFp4YX-yy6==w15OdKEj=Qy-epUEsdqqWsQ1DWJNrA@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] media:Add nt8 and nt10 video format.
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Ming Qian <ming.qian@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, aisheng.dong@nxp.com,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 27 Jul 2021 at 14:58, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
>
> Le mardi 27 juillet 2021 =C3=A0 11:20 +0800, Ming Qian a =C3=A9crit :
> > NT8 is 8-bit tiled nv12 format used by amphion decoder.
> > NT10 is 10-bit tiled format used by amphion decoder.
> > The tile size is 8x128
> >
> > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> > Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> > ---
> >  .../userspace-api/media/v4l/pixfmt-reserved.rst   | 15 +++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c              |  2 ++
> >  include/uapi/linux/videodev2.h                    |  2 ++
> >  3 files changed, 19 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> > index c9231e18859b..2deae49210a7 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> > @@ -256,3 +256,18 @@ please make a proposal on the linux-media mailing =
list.
> >       of tiles, resulting in 32-aligned resolutions for the luminance p=
lane
> >       and 16-aligned resolutions for the chrominance plane (with 2x2
> >       subsampling).
> > +    * .. _V4L2-PIX-FMT-NT8:
> > +
> > +      - ``V4L2_PIX_FMT_NT8``
> > +      - 'NA12'
> > +      - Two-planar NV12-based format used by the video engine found on=
 Amphion decoder,
> > +    with 8x128 tiles for the luminance plane and chrominance plane.
> > +    The number of bytes in one luminance or chrominance row must be di=
visible by 256.
> > +    * .. _V4L2-PIX-FMT-NT10:
>
> There is a large spread of "vendor specific" format that aren't really sp=
ecific,
> or complex enough to be worth being marked as vendor format. As per my re=
ading
> of this description, this is linearly layout 8x128 tiled format, with no
> compression or anything (well unless you forgot to mention). As a side ef=
fect,
> we should give that format an explicit name (NT8 is cryptic). What about
> V4L2_PIX_FMT_NV12_8L128, my colleague is about to send a proposal in that
> direction. That would be NV12 with plane tiled 8x128 bytes and layout lin=
early,
> row by row, left to right. We already have cryptic formats like SUNXI, HM=
12 that
> are literally just that, simple tiling, and we endup having to use obscur=
e
> vendor name whenever other HW uses the same.
>
> (this comment extends to the other formats here)
>

Here's the proposal Nicolas is talking about:

https://lore.kernel.org/linux-media/20210727145745.25203-1-ezequiel@collabo=
ra.com/T/#t

V4L2_PIX_FMT_NV12_8L128 makes sense, please also add support for this
format in GStreamer. I think that makes it easier to confirm the
layout of the format.

Thanks!
Ezequiel
