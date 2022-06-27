Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0845F55E28F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239129AbiF0QNl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 12:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239141AbiF0QNj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 12:13:39 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4AF186FC
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 09:13:37 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id mf9so20332512ejb.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 09:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YSimcfIaUu8P8Zd0kHKcHjUirkPTuMp+KjnpxJVA5io=;
        b=NOr80kINOxbn9hWrJtWZUy0A7Z5bnVxhfzNk7yGXC9cX2y5Is9kq5gu7JXvFN2fKFO
         Wkyx/XoC6NxV63yEjFUm+CKEDH8bzoDu0gT9Dha0paYgM87Rncz+9YnPlG/fcD+ak9Db
         R7vWps1VSNAgUGBxVJVHDYadM4SEd0ThYN40Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YSimcfIaUu8P8Zd0kHKcHjUirkPTuMp+KjnpxJVA5io=;
        b=NqBPZpsfTMfW3KY0jIdjFYUVQktxZnUGBgC3eGYPlxXtFPG1qHN/y7HPD9CKkf8Agd
         II6lqRtLSNPwAyPYKYsup+wk3xvT1eKdBhww/JW/nomRWPhVOvUABR7pcBSzenOhKmTo
         1yokF+KPAh0AHxlnbyM24i0rNC3ckGLpSxhNIrZc6/ibarlSoIh58GgQsXRd/nh2cG3i
         xP7pu17FMknGVY2J11yv9r8fcePBMysnzHQWhyV8X4OBoJlYHEuycvi+CPoF4uDm25Bb
         FlNkkDa66q1jyy+x355chNnMNf23gtLSxxYG1w/AFP6lkZtkACVb1clJNsIRrM2tCgeF
         NvZg==
X-Gm-Message-State: AJIora8CZT2pS7S/njg8qhHmcJWDPJ5rMyCiriQQYQ+lp+SGk5aAdHKn
        sSA1bZkB8vL7Hf3PLtVuwhBDOJNi4T07gA+c1UEJiQ==
X-Google-Smtp-Source: AGRyM1t4SKs8xAPTAkOLharE1S0BnU6t82l9azV9EQCQJnwi3GPWnDhaPL0W18baR+3XPfgOOSa38vx0CCtKssnCvvQ=
X-Received: by 2002:a17:906:f84:b0:711:eda5:db31 with SMTP id
 q4-20020a1709060f8400b00711eda5db31mr13441225ejj.397.1656346416538; Mon, 27
 Jun 2022 09:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220627112402.2332046-1-wenst@chromium.org> <20220627112402.2332046-2-wenst@chromium.org>
 <43f393d2dcdd0bfac66bfc420e9261d31b3ceedc.camel@collabora.com>
In-Reply-To: <43f393d2dcdd0bfac66bfc420e9261d31b3ceedc.camel@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 28 Jun 2022 00:13:25 +0800
Message-ID: <CAGXv+5GweDwKPczT3GTYeiRCuaHNzV7+q4xfC_pgvo4GFDPOUg@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: mediatek: vcodec: dec: Fix 4K frame size enumeration
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 27, 2022 at 11:33 PM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le lundi 27 juin 2022 =C3=A0 19:23 +0800, Chen-Yu Tsai a =C3=A9crit :
> > This partially reverts commit b018be06f3c7 ("media: mediatek: vcodec:
> > Read max resolution from dec_capability"). In this commit, the maximum
> > resolution ended up being a function of both the firmware capability an=
d
> > the current set format.
> >
> > However, frame size enumeration for output (coded) formats should not
> > depend on the format set, but should return supported resolutions for
> > the format requested by userspace.
> >
> > Fix this so that the driver returns the supported resolutions correctly=
,
> > even if the instance only has default settings, or if the output format
> > is currently set to VP8F, which does not support 4K.
> >
> > Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from=
 dec_capability")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c    | 2 --
> >  .../platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c    | 7 +++++++
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/=
drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > index 5d6fdf18c3a6..fcb4b8131c49 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > @@ -595,8 +595,6 @@ static int vidioc_enum_framesizes(struct file *file=
, void *priv,
> >               fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> >               fsize->stepwise =3D dec_pdata->vdec_framesizes[i].stepwis=
e;
> >
> > -             fsize->stepwise.max_width =3D ctx->max_width;
> > -             fsize->stepwise.max_height =3D ctx->max_height;
> >               mtk_v4l2_debug(1, "%x, %d %d %d %d %d %d",
> >                               ctx->dev->dec_capability,
> >                               fsize->stepwise.min_width,
> > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stat=
eless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
> > index 16d55785d84b..9a4d3e3658aa 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
> > @@ -360,6 +360,13 @@ static void mtk_vcodec_add_formats(unsigned int fo=
urcc,
> >
> >               mtk_vdec_framesizes[count_framesizes].fourcc =3D fourcc;
> >               mtk_vdec_framesizes[count_framesizes].stepwise =3D stepwi=
se_fhd;
>
> While at it, can you constify stepwise_fhd, it is scary to think that som=
eone
> could modify it and cause big headache.

I noticed that as well, but since a planned refactoring would get rid of it=
,
I didn't fix it in this series.

I can add a patch for that.


ChenYu

> > +             if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DIS=
ABLED) &&
> > +                 fourcc !=3D V4L2_PIX_FMT_VP8_FRAME) {
> > +                     mtk_vdec_framesizes[count_framesizes].stepwise.ma=
x_width =3D
> > +                             VCODEC_DEC_4K_CODED_WIDTH;
> > +                     mtk_vdec_framesizes[count_framesizes].stepwise.ma=
x_height =3D
> > +                             VCODEC_DEC_4K_CODED_HEIGHT;
> > +             }
> >               num_framesizes++;
> >               break;
> >       case V4L2_PIX_FMT_MM21:
>
