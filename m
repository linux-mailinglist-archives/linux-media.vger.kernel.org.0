Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088B4409F80
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 00:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243170AbhIMWNi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 18:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240340AbhIMWNi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 18:13:38 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39E7C061574
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 15:12:21 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id d207-20020a1c1dd8000000b00307e2d1ec1aso995832wmd.5
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 15:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=54bZvE586BTQEAG20cFHMNM2d+0BipBY6/pLS3wdI68=;
        b=VlrWQkkFHAIy2st75eyX0Zg4oSqFjix6u/B6zaFTpZrFHhvOZ7suIQAQQtoh5zUKDC
         zEFUY/7r0TGigPlXQP5eJCcp5XTUpK74AiM03tw1PkyEMTpohUV5/+I5SaARlhHHOYQU
         Qa+lupYLiyLReiLUSkiN2rcUDknjMlVuO1lmax3VFovEkIxnssKA4zMbmo5j0LCxul2t
         cANu2zJNPqltA/rM/1YjPRaNpeKQexfTeCGv/VNt/0Q8DOzVsIYiDYju8tXSW1G9SufO
         1kBuJUn7kyJixVsMqzxFtOFKGfIdIoCV/RLNMCP9APKV444JPSgMPqmmLo/lUCqMKSI/
         F8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=54bZvE586BTQEAG20cFHMNM2d+0BipBY6/pLS3wdI68=;
        b=Tswt8KckBqChJ87ij5hYgPWMPKPIe3od/v4gh3nzTrYK2CZtL/HTko9k0M8keaGFoG
         FPoGoQZVBLQol3DvgOCubezZD52Mu5jS11GqlQdE/3r5qbucEDGwaLUlMJDp0B5brd2O
         OVxd+O+6t97ilBeDj2gsgV5h5TlxVDZ6TgmroBtV/stkMmQtLkzcLquWwRtN8EJCoDkB
         i9Hi71orsO+61fGAJAAhYsqJevGhEVlWRtjBAm1jMm6CMj9MPtCWs7yZPiW9+zei+u+Q
         9K+dEQKVmpbFHuA52K0qd+98VPhe8gWSmaKJeHGiICH7a/9g1EhFhKGri+c1xdSNoLEc
         /iPQ==
X-Gm-Message-State: AOAM531dVKv6hgrbvrcmWiScJlnNlTG+Rb2Jb0kztgBy+U+eJiJm1KpB
        jnrjAOCDRamNPTu0QH+46fMLQQ==
X-Google-Smtp-Source: ABdhPJyybYif7zZR25AD1+EMOBUwOW3GhUNYL6OaUcJWQCxzhZKK4AA9CLRQuaJ3qrp0SGV4kBi9Kw==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr13797509wml.55.1631571140398;
        Mon, 13 Sep 2021 15:12:20 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id q10sm7778439wmq.12.2021.09.13.15.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 15:12:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 13 Sep 2021 23:12:19 +0100
Message-Id: <CE93P5UJVABP.3TTVALU1H36DR@arch-thunder>
Cc:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        "linux-media" <linux-media@vger.kernel.org>,
        "Jacopo Mondi" <jacopo+renesas@jmondi.org>
Subject: Re: [RFC 1/3] media: tw9910: Allow to probe from device tree
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "Fabio Estevam" <festevam@gmail.com>,
        "Jacopo Mondi" <jacopo@jmondi.org>
References: <20210827130150.909695-1-festevam@gmail.com>
 <20210913085942.zmhv5pmo5nzqunuj@uno.localdomain>
 <CAOMZO5B-BRfuPoGFyYQk4HdwaX45zxL9=gKTXKDHSxNwBDO-2g@mail.gmail.com>
 <CAOMZO5BzK5VtRUn7rqb+b84HoyiDy34e35aJ196J0TpCvL4vtA@mail.gmail.com>
In-Reply-To: <CAOMZO5BzK5VtRUn7rqb+b84HoyiDy34e35aJ196J0TpCvL4vtA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,
On Mon Sep 13, 2021 at 9:03 PM WEST, Fabio Estevam wrote:

> On Mon, Sep 13, 2021 at 9:53 AM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Jacopo,
> >
> > On Mon, Sep 13, 2021 at 5:58 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > > There's an
> > >
> > >         tw9910_s_power(&priv->subdev, 0);
> > >
> > > at the end of the video_probe() function.
> > >
> > > The driver handles power management with the legacy s_power() call
> > > chain, and the receiver driver needs to v4l2_pipeline_pm_get() which
> > > the imx driver does when the capture node is open.
> > >
> > > Just an hint, you might have noticed already
> >
> > Thanks for your comments and review. Yes, I have fixed the I2C errors.
> >
> > I plan to re-submit the entire series after I get the TW9990 to work
> > on my imx6sx-based board.
> >
> > The capture driver is drivers/staging/media/imx/imx7-media-csi.c.
> >
> > Currently, I am not able to get the stream to start.
> >
> > This is the configuration I am using:
> >
> > media-ctl -l "'tw9910 2-0044':0 -> 'csi':0[1]"
> > media-ctl -l "'csi':1 -> 'csi capture':0[1]"
> > media-ctl -v -V "'tw9910 2-0044':0 [fmt:UYVY8_2X8/720x480 field:any]"
> > Opening media device /dev/media0
> > Enumerating entities
> > Found 3 entities
> > Enumerating pads and links
> > Setting up format UYVY8_2X8 720x480 on pad tw9910 2-0044/0
> > Format set: UYVY8_2X8 720x480
> > Setting up format UYVY8_2X8 720x480 on pad csi/0
> > Format set: UYVY8_2X8 720x480
> >
> > Then I launch the capture stream command:
> >
> > v4l2-ctl --stream-mmap -d /dev/video1
> >
> > but nothing happens here, no >>>>> frame indication progress is shown.
> >
> > If I hit CTRL + C then I get:
> > [  715.467623] csi: wait last EOF timeout
>
> I also need to set the video standard to PAL:
>
> # v4l2-ctl --device /dev/v4l-subdev1 --set-standard PAL
> Standard set to 000000ff
>
> # media-ctl -l "'tw9910 2-0044':0 -> 'csi':0[1]"
> # media-ctl -l "'csi':1 -> 'csi capture':0[1]"
> # media-ctl -v -V "'tw9910 2-0044':0 [fmt:UYVY8_2X8/720x576
> field:interlaced-bt]"
> Opening media device /dev/media0
> Enumerating entities
> Found 3 entities
> Enumerating pads and links
> Setting up format UYVY8_2X8 720x576 on pad tw9910 2-0044/0
> Format set: UYVY8_2X8 720x576
> Setting up format UYVY8_2X8 720x576 on pad csi/0
> Format set: UYVY8_2X8 720x576
>
> # v4l2-ctl --stream-mmap -d /dev/video1
> [   38.554032] priv->vdev.fmt.fmt.pix.width is 800
> [   38.561444] f.fmt.pix.width is 720
> [   38.567607] priv->vdev.fmt.fmt.pix.height is 600
> [   38.574973] f.fmt.pix.height is 576
> [   38.580992] priv->vdev.cc->cs is 1
> [   38.586958] cc->cs is 1
> [   38.591761] priv->vdev.compose.width is 800
> [   38.598420] compose.width is 720
> [   38.604048] priv->vdev.compose.height is 600
> [   38.610681] compose.height is 576
> [   38.616347] csi: capture format not valid
> VIDIOC_STREAMON returned -1 (Broken pipe)
>
> I added some printk debug lines to show the mismatch that prevents
> the pipeline to start in capture_validate_fmt():
>
> diff --git a/drivers/staging/media/imx/imx-media-capture.c
> b/drivers/staging/media/imx/imx-media-capture.c
> index b2f2cb3d6a60..511625981e93 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -552,6 +552,21 @@ static int capture_validate_fmt(struct capture_priv =
*priv)
>         ret =3D __capture_try_fmt_vid_cap(priv, &fmt_src, &f, &cc, &compo=
se);
>         if (ret)
>                 return ret;
> +
> +       pr_err("priv->vdev.fmt.fmt.pix.width is %d\n",
> priv->vdev.fmt.fmt.pix.width);
> +       pr_err("f.fmt.pix.width is %d\n", f.fmt.pix.width);
> +
> +       pr_err("priv->vdev.fmt.fmt.pix.height is %d\n",
> priv->vdev.fmt.fmt.pix.height);
> +       pr_err("f.fmt.pix.height is %d\n", f.fmt.pix.height );
> +
> +       pr_err("priv->vdev.cc->cs is %d\n", priv->vdev.cc->cs);
> +       pr_err("cc->cs is %d\n", cc->cs);
> +
> +       pr_err("priv->vdev.compose.width is %d\n", priv->vdev.compose.wid=
th);
> +       pr_err("compose.width is %d\n", compose.width);
> +
> +       pr_err("priv->vdev.compose.height is %d\n", priv->vdev.compose.he=
ight);
> +       pr_err("compose.height is %d\n", compose.height);
>
>         return (priv->vdev.fmt.fmt.pix.width !=3D f.fmt.pix.width ||
>                 priv->vdev.fmt.fmt.pix.height !=3D f.fmt.pix.height ||
>
> Any ideas as to whu such mismatch happens?

Looking  at this code it looks like you are using an old tree, Laurent
meanwhile have sent a patch that change this function:

a9512b261afd ("media: imx: capture: Simplify capture_validate_fmt() impleme=
ntation")

can you test with the latest code as see if you have the same
problems.

------
Cheers,
     Rui
