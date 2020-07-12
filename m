Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A3921CC02
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 01:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgGLXOo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jul 2020 19:14:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:41536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727785AbgGLXOo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jul 2020 19:14:44 -0400
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1287D207BB;
        Sun, 12 Jul 2020 23:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594595683;
        bh=JJcu9UGyZSmnY8MG9Tb8lOo8zhSv3HDqhkH2NhNsK9k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nFOpIko9y3x8JaPjoj5+5x2bHF0GjI/PiZtHtJWFV9YMbHsEhhZjIGrO8VJ/o00u5
         ZDL1vzgPDibwrFtdZkOQTxdeDzTYESo772+A/vB2VLhG6sfH6imgPzMi9oOv/Gadsl
         41SEsGk4sQ2hxJ5baQ1oJsZTSX8bxb2Vd0BQkwSg=
Received: by mail-ed1-f50.google.com with SMTP id dg28so10381336edb.3;
        Sun, 12 Jul 2020 16:14:42 -0700 (PDT)
X-Gm-Message-State: AOAM530Lj1YIYh4YbBQDh7AAY20ALP05ufmLWrO+n2xTjNwlEfZ0IsJW
        l8iiCtAANnCXBaz5xbthxnnO71OVt6NH+9cooA==
X-Google-Smtp-Source: ABdhPJwWEw89a3TPBeDtbrMxC83/9R66XtgjlsU1MmE822OJ1v3FtQUjP7YI/JkTftCHfeXxfej+3oDaYrfbYHp9aP8=
X-Received: by 2002:aa7:c3d6:: with SMTP id l22mr87628185edr.148.1594595681551;
 Sun, 12 Jul 2020 16:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200708104023.3225-1-louis.kuo@mediatek.com> <20200708104023.3225-2-louis.kuo@mediatek.com>
In-Reply-To: <20200708104023.3225-2-louis.kuo@mediatek.com>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Mon, 13 Jul 2020 07:14:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY__fRjytz9w4zA6rOoYKzjyRH-j=ASFqNMVNShBYGd6-5Q@mail.gmail.com>
Message-ID: <CAAOTY__fRjytz9w4zA6rOoYKzjyRH-j=ASFqNMVNShBYGd6-5Q@mail.gmail.com>
Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To:     Louis Kuo <louis.kuo@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        Tomasz Figa <tfiga@chromium.org>, keiichiw@chromium.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        =?UTF-8?B?SmVycnktY2ggQ2hlbiAo6Zmz5pWs5oayKQ==?= 
        <Jerry-ch.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        yuzhao@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, zwisler@chromium.org,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Louis:

Louis Kuo <louis.kuo@mediatek.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=888=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:41=E5=AF=AB=E9=81=93=EF=BC=9A
>
> This patch adds Mediatek's sensor interface driver. Sensor interface
> driver is a MIPI-CSI2 host driver, namely, a HW camera interface controll=
er.
> It support a widely adopted, simple, high-speed protocol primarily intend=
ed
> for point-to-point image and video transmission between cameras and host
> devices. The mtk-isp directory will contain drivers for multiple IP block=
s
> found in Mediatek ISP system. It will include ISP Pass 1 driver, sensor
> interface driver, DIP driver and face detection driver.
>
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---

[snip]

> +
> +enum CFG_CSI_PORT {
> +       CFG_CSI_PORT_0 =3D 0x0,   /* 4D1C */
> +       CFG_CSI_PORT_1,         /* 4D1C */
> +       CFG_CSI_PORT_2,         /* 4D1C */
> +       CFG_CSI_PORT_0A,        /* 2D1C */
> +       CFG_CSI_PORT_0B,        /* 2D1C */
> +       CFG_CSI_PORT_MAX_NUM,
> +       CFG_CSI_PORT_NONE       /*for non-MIPI sensor */
> +};
> +
> +enum PIXEL_MODE {
> +       ONE_PIXEL_MODE  =3D 0x0,
> +       TWO_PIXEL_MODE  =3D 0x1,
> +       FOUR_PIXEL_MODE =3D 0x2,
> +};
> +
> +enum SENINF_ID {
> +       SENINF_1 =3D 0x0,
> +       SENINF_2 =3D 0x1,
> +       SENINF_3 =3D 0x2,
> +       SENINF_4 =3D 0x3,
> +       SENINF_5 =3D 0x4,
> +       SENINF_NUM,
> +};
> +

[snip]

> +
> +static int seninf_link_setup(struct media_entity *entity,
> +                            const struct media_pad *local,
> +                            const struct media_pad *remote, u32 flags)
> +{
> +       struct v4l2_subdev *sd;
> +       struct mtk_seninf *priv;
> +       struct device *dev;
> +
> +       sd =3D media_entity_to_v4l2_subdev(entity);
> +       priv =3D v4l2_get_subdevdata(sd);
> +       dev =3D priv->dev;
> +
> +       if (!(flags & MEDIA_LNK_FL_ENABLED))
> +               return 0;
> +
> +       if (local->flags & MEDIA_PAD_FL_SOURCE) {
> +               priv->mux_sel =3D local->index - CAM_MUX_IDX_MIN;
> +       } else {
> +               /* Select port */
> +               priv->port =3D local->index;

I don't understand V4L2 much, but the port definition is inside this
file, how does the caller know what to pass to here? Could you explain
how does it work?

Regards,
Chun-Kuang.

> +               if (priv->port >=3D NUM_SENSORS) {
> +                       dev_err(dev, "port index is over number of ports\=
n");
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
