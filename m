Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8745764397
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 03:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjG0B6B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 21:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbjG0B6A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 21:58:00 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAA91710
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 18:57:58 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-63d03d3cac6so2838106d6.2
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 18:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690423077; x=1691027877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl6PigYMVh9s2oP7S4CJnyurGxqCI1k7lEZU6lICmsE=;
        b=aOxJydwM7qarFE1aSYtvrlq/ALrNN3AChwDvKukN93oOy57SYxC1aY9DDG+ue0IF7O
         As1VmTB/9bJf+gJOqiFArKRmWTLY8d8Xmkk74bIk0VN5PUk30wdbU4PqlbG1hW1GCNMr
         ddrGC7+fewHyM3uzjDZuvUIymxlTsGLsURxFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690423077; x=1691027877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rl6PigYMVh9s2oP7S4CJnyurGxqCI1k7lEZU6lICmsE=;
        b=ab8AnCNRplptwu3gAVOUcOXiHeK8HGRevlYOtZ3le2oPvirmdEZuJcRPqcV4JvFU4h
         avLUXQwr9LB+H3LtHtjdGJG0OwDlm9I5dQCek7VvY+0ukmXOo+G5COxAPWOyFuuC/1DM
         wnTOCohcNNK3Jc6Ek/SD0IaCNxYz1A2QfhKy1zKNbFs70AxvSFiKTW7NzOldh2NXBHsc
         z34HQlWRDOeOEc1Gel+kJNXy+W7WRM+6SryiVx69nKapfv2DTEg5NASTD1Bvad6E/mNa
         vs5PXLIXcVzBjXjfEOES9/AQWF8Q6/6qkvu7G9XkGpeiw7WLGruURsAVvNEJuGONLFyp
         bq1w==
X-Gm-Message-State: ABy/qLYiFioJAJVteYtUW7yc8wW0l/olBWmPRzyuoU50MEe6iOBvhFW7
        E26wb74Qd7jrNscKxNn4W8QPrGjlTIQHvcyJ26BPhA==
X-Google-Smtp-Source: APBJJlGSi4ybUH8D1YVkz9v/uIYJMWzV99cwmveoKdH3Lwd0V68V58J2KpA/yTTx6vQ4NY81AvwcXA==
X-Received: by 2002:a0c:dc0b:0:b0:63c:cbff:b490 with SMTP id s11-20020a0cdc0b000000b0063ccbffb490mr3316105qvk.45.1690423077384;
        Wed, 26 Jul 2023 18:57:57 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id v2-20020a0ce1c2000000b0063d128e4439sm77474qvl.75.2023.07.26.18.57.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 18:57:56 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-63d1238c300so2941026d6.0
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 18:57:56 -0700 (PDT)
X-Received: by 2002:a0c:dc0b:0:b0:63c:cbff:b490 with SMTP id
 s11-20020a0cdc0b000000b0063ccbffb490mr3316082qvk.45.1690423076287; Wed, 26
 Jul 2023 18:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230328092608.523933-1-harperchen1110@gmail.com> <CAAFQd5CqhZgtCJ_-6M0=dYAfVs0TFeBjPURvosS_24qgour=Ow@mail.gmail.com>
In-Reply-To: <CAAFQd5CqhZgtCJ_-6M0=dYAfVs0TFeBjPURvosS_24qgour=Ow@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 27 Jul 2023 10:57:44 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BnfStWf-S2TSR3w-6vbsCc7DU_JirwDVOixTj_6+TENQ@mail.gmail.com>
Message-ID: <CAAFQd5BnfStWf-S2TSR3w-6vbsCc7DU_JirwDVOixTj_6+TENQ@mail.gmail.com>
Subject: Re: [PATCH] media: vcodec: Fix potential array out-of-bounds in vb2ops_venc_queue_setup
To:     mchehab@kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Wei Chen <harperchen1110@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Hans,

On Thu, Jun 15, 2023 at 1:23=E2=80=AFAM Tomasz Figa <tfiga@chromium.org> wr=
ote:
>
> On Tue, Mar 28, 2023 at 6:26=E2=80=AFPM Wei Chen <harperchen1110@gmail.co=
m> wrote:
> >
> > variable *nplanes is provided by user via system call argument. The
> > possible value of q_data->fmt->num_planes is 1-3, while the value
> > of *nplanes can be 1-8. The array access by index i can cause array
> > out-of-bounds.
> >
> > Fix this bug by checking *nplanes against the array size.
> >
> > Signed-off-by: Wei Chen <harperchen1110@gmail.com>
> > ---
> >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/=
drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> > index d65800a3b89d..1ea02f9136f6 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> > @@ -821,6 +821,8 @@ static int vb2ops_venc_queue_setup(struct vb2_queue=
 *vq,
> >                 return -EINVAL;
> >
> >         if (*nplanes) {
> > +               if (*nplanes !=3D q_data->fmt->num_planes)
> > +                       return -EINVAL;
> >                 for (i =3D 0; i < *nplanes; i++)
> >                         if (sizes[i] < q_data->sizeimage[i])
> >                                 return -EINVAL;
> > --
> > 2.25.1
> >
>
> Thanks for the patch, it makes sense indeed.
>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Do you plan to pick this patch? Thanks.

Best regards,
Tomasz
