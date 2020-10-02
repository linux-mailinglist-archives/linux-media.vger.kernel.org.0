Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8369D281DB2
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 23:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbgJBVcc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 17:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJBVcc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 17:32:32 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78E0C0613D0;
        Fri,  2 Oct 2020 14:32:31 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id x8so2140921ybe.12;
        Fri, 02 Oct 2020 14:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rkImxgEV4ZxqqECNqgTwDWjz/+rLkxNsLMNkoaMOLs4=;
        b=L07pXv3NP06yPJ4JEuSeKkOAsvlGcvlubatzQ11VFu0xh72mXfp2X/bq1DAoDKglPr
         gwe9uVGV84MucyUdtfDvJXO//O868yX4U8hfukPK36HpDPnH89tWjHXVnsOPIx3PDNem
         X5io2xWxXqtEa9UcCPOfTPMLBb2OrV4jjgxwrX1aYnyQsOxO1/D8VCL+pgdkMSSqfkWh
         6Gt745FiGChEGHix95MVwYogOqGUW85oZyHgy+Ho15vMDCDW6/n/o6KLKjTf3EcFcPR2
         eLaFVmazyYL6EM5NEgNO6+1AjIiyW6Wx0zqiHYBHxPN8aZf0dQEeRxooOj/w66wIO5gp
         +Eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rkImxgEV4ZxqqECNqgTwDWjz/+rLkxNsLMNkoaMOLs4=;
        b=CmQi6KHiCeD3VAH+qRq5eCTDA9mFnPF62POLQUqcPDWo9wVy/bx5Vta6kdrzi9vOrC
         ckeHC4WowCwTEurOlhyH7Bs2m+4FwvT0Ez/E4HZrSIR92YkWkFnTDTmwpk3p1pkZBAcd
         B0jVmocWUJQpXBTW1KwDFkdFwY4lCDN9b0H2X2DOzIpLSPOvcACpZcOzMW3d5F7SrsM3
         TCVRSDduCb9OGfasQTrXRCm2nu3nusVOF8/F+RHfdEZPZV/5ZzPMEhCQZxepJ4NHyUC+
         73Rv5wpFjzq165QjJi54qqA3CRUoD3CnfidUeKQhsG7KJ0R8++rOeODno0fhd855FwOH
         77JA==
X-Gm-Message-State: AOAM532blOC4hkKTt60lhCHNbORqHlFfL+HPIQ1Svb/vEiWDOAh6Ff0s
        EV279Hya2jLf3GDqww2BzLgT8f7smpnyHQeMP1I=
X-Google-Smtp-Source: ABdhPJz6UF2KdRE5KeTgQqFTNG62CMf7iFk7yd/Lr9QXnI1hmndSyworjFOf9cZdaCrwrVtUi2TkXaI5RsEdr3u0bLg=
X-Received: by 2002:a25:344c:: with SMTP id b73mr5204877yba.127.1601674351171;
 Fri, 02 Oct 2020 14:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201002165656.16744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201002165656.16744-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201002211311.GX26842@paasikivi.fi.intel.com>
In-Reply-To: <20201002211311.GX26842@paasikivi.fi.intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 2 Oct 2020 22:32:05 +0100
Message-ID: <CA+V-a8v3cLOe=vRSdPd91VGRxEwbrgmRrvYdfBPRNVPMvsQ0gw@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] media: i2c: ov772x: Add test pattern control
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the review.

On Fri, Oct 2, 2020 at 10:13 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Fri, Oct 02, 2020 at 05:56:56PM +0100, Lad Prabhakar wrote:
> > Add support for test pattern control supported by the sensor.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ov772x.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> > index 6b46ad493bf7..b7e10c34ef59 100644
> > --- a/drivers/media/i2c/ov772x.c
> > +++ b/drivers/media/i2c/ov772x.c
> > @@ -227,7 +227,7 @@
> >
> >  /* COM3 */
> >  #define SWAP_MASK       (SWAP_RGB | SWAP_YUV | SWAP_ML)
> > -#define IMG_MASK        (VFLIP_IMG | HFLIP_IMG)
> > +#define IMG_MASK        (VFLIP_IMG | HFLIP_IMG | SCOLOR_TEST)
> >
> >  #define VFLIP_IMG       0x80 /* Vertical flip image ON/OFF selection */
> >  #define HFLIP_IMG       0x40 /* Horizontal mirror image ON/OFF selection */
> > @@ -425,6 +425,7 @@ struct ov772x_priv {
> >       const struct ov772x_win_size     *win;
> >       struct v4l2_ctrl                 *vflip_ctrl;
> >       struct v4l2_ctrl                 *hflip_ctrl;
> > +     unsigned int                      test_pattern;
>
> Alignment.
>
> You can get away with one or possibly two but three is too many in such a
> small number of lines. :-)
>
It's aligned as per structure members (non pointers)

Cheers
Prabhakar

> >       /* band_filter = COM8[5] ? 256 - BDBASE : 0 */
> >       struct v4l2_ctrl                 *band_filter_ctrl;
> >       unsigned int                      fps;
> > @@ -540,6 +541,11 @@ static const struct ov772x_win_size ov772x_win_sizes[] = {
> >       },
> >  };
> >
> > +static const char * const ov772x_test_pattern_menu[] = {
> > +     "Disabled",
> > +     "Vertical Color Bar Type 1",
> > +};
> > +
> >  /*
> >   * frame rate settings lists
> >   */
> > @@ -809,6 +815,9 @@ static int ov772x_s_ctrl(struct v4l2_ctrl *ctrl)
> >               }
> >
> >               return ret;
> > +     case V4L2_CID_TEST_PATTERN:
> > +             priv->test_pattern = ctrl->val;
> > +             return 0;
> >       }
> >
> >       return -EINVAL;
> > @@ -1107,6 +1116,8 @@ static int ov772x_set_params(struct ov772x_priv *priv,
> >               val ^= VFLIP_IMG;
> >       if (priv->hflip_ctrl->val)
> >               val ^= HFLIP_IMG;
> > +     if (priv->test_pattern)
> > +             val |= SCOLOR_TEST;
> >
> >       ret = regmap_update_bits(priv->regmap, COM3, SWAP_MASK | IMG_MASK, val);
> >       if (ret < 0)
> > @@ -1442,6 +1453,10 @@ static int ov772x_probe(struct i2c_client *client)
> >       priv->band_filter_ctrl = v4l2_ctrl_new_std(&priv->hdl, &ov772x_ctrl_ops,
> >                                                  V4L2_CID_BAND_STOP_FILTER,
> >                                                  0, 256, 1, 0);
> > +     v4l2_ctrl_new_std_menu_items(&priv->hdl, &ov772x_ctrl_ops,
> > +                                  V4L2_CID_TEST_PATTERN,
> > +                                  ARRAY_SIZE(ov772x_test_pattern_menu) - 1,
> > +                                  0, 0, ov772x_test_pattern_menu);
> >       priv->subdev.ctrl_handler = &priv->hdl;
> >       if (priv->hdl.error) {
> >               ret = priv->hdl.error;
>
> --
> Sakari Ailus
