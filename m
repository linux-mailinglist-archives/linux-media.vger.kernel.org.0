Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C62470E03E
	for <lists+linux-media@lfdr.de>; Tue, 23 May 2023 17:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237305AbjEWPTK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 11:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237344AbjEWPTC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 11:19:02 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF7A188
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 08:18:48 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-77487fc1f16so42783539f.0
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684855127; x=1687447127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjyn+WTl4LbVMkNNCokMveD7xNAakP9qnkKqL3vwETo=;
        b=aQLH2FBIIc9qEFUmH3RpYgh3Ko8alZmRDOmoDkeQfGTI8PmoNywa933yhOnLJoD0Ty
         U6+saWKiPZh3R3ddV6eWGmG4dUUnQZ6h3fN2GcH283zrI8Rf4nmk5NpBOZe2B9V0ZJId
         BTA616J/kvYcRLoUw+s3nA8oVlQ88+pt4Z9H8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684855127; x=1687447127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjyn+WTl4LbVMkNNCokMveD7xNAakP9qnkKqL3vwETo=;
        b=W/y7wmMEbX+iL6Le9/CGY1cF4R2NBYCmQdOV47yVt1S7OplP8XqOJZ0kLtmLaoI3tn
         gADDvFRTl0/GN1wA0zW13YtUKZ7CNgNB/XpLvJcgrViGibVhwYWT3D/aC8+WmPueuJWw
         qDLKeXvTTgzj9+9IGlDi7SA2fcIuGtKnJojNsRycVfUwsZk7iauhXGw9Nfn4qfy44Ghk
         2Yj6eN285/3mV4z55GHruqYORoNruIekoB2GTjkjGyVTn3XawJ8K34nwrrG9aaMOBRdl
         f+0u+iXDpH4Le0NcdgR9uoWB/SciOYZun3fJbrPOy29jgxiE39nF3syemkgaV4qgu+8t
         wktg==
X-Gm-Message-State: AC+VfDzcBqdbpAMrJb9Eg/aCqOn/SZwzNbJgUD7w4IaUet16/g8ma4d9
        zFGMR8RH3U4F2OYj9v0Z+uDDFDj/UojukAAmZT4=
X-Google-Smtp-Source: ACHHUZ646O8+Eimv3v21HCzURcibAEpnpEMoTJdesf7d0zqLgAMxkjWmmFUy+yBQwuTLnn4feUo6hw==
X-Received: by 2002:a5d:83d8:0:b0:76f:1664:672 with SMTP id u24-20020a5d83d8000000b0076f16640672mr8703478ior.13.1684855127277;
        Tue, 23 May 2023 08:18:47 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id eq9-20020a0566384e2900b0041669a9fb62sm2361620jab.131.2023.05.23.08.18.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 08:18:46 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-772ac011955so344023739f.2
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 08:18:46 -0700 (PDT)
X-Received: by 2002:a5d:9942:0:b0:76c:62ab:5d96 with SMTP id
 v2-20020a5d9942000000b0076c62ab5d96mr11928374ios.19.1684855126148; Tue, 23
 May 2023 08:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230515141610.v2.1.I0d1657be3fea5870f797e975a7aa490291e17993@changeid>
 <b5799dfe-f17b-a838-0916-645ba83307d2@xs4all.nl> <2f1bf798-49c3-13d7-96e5-b29e7df73bd1@xs4all.nl>
In-Reply-To: <2f1bf798-49c3-13d7-96e5-b29e7df73bd1@xs4all.nl>
From:   Fei Shao <fshao@chromium.org>
Date:   Tue, 23 May 2023 23:18:10 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngKqJfTh8Dnjv2yYLG0r44Yx6pw5DsRnArsJu2okoKJUA@mail.gmail.com>
Message-ID: <CAC=S1ngKqJfTh8Dnjv2yYLG0r44Yx6pw5DsRnArsJu2okoKJUA@mail.gmail.com>
Subject: Re: [PATCH v2] media: mediatek: vcodec: mtk_vcodec_dec_hw: Use devm_pm_runtime_enable()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, fshao@chromium.org
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 23, 2023 at 8:28=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 23/05/2023 13:42, Hans Verkuil wrote:
> > On 15/05/2023 08:16, Fei Shao wrote:
> >> Convert pm_runtime_enable() to the managed version, and clean up error
> >> handling and unnecessary .remove() callback accordingly.
> >
> > This patch no longer applies. Can you make a v3?
>
> Sorry, you can ignore this. I now realize that this was a v2 of
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20230510233117.1.=
I7047714f92ef7569bd21f118ae6aee20b3175a92@changeid/
>
> I had that v1 applied, so obviously this v2 would fail to apply. After dr=
opping
> that v1 patch it now applies cleanly.

Ack, many thanks.
BTW, besides the review tags (appreciation to all), would you mind
adding this tag also as I missed it in the beginning?

Suggested-by: Chen-Yu Tsai <wenst@chromium.org>

Regards,
Fei





>
> Regards,
>
>         Hans
>
> >
> > Regards,
> >
> >       Hans
> >
> >>
> >> Signed-off-by: Fei Shao <fshao@chromium.org>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> Use devm_pm_runtime_enable() per suggestion from the previous thread:
> >> https://lore.kernel.org/lkml/20230510164330.z2ygkl7vws6fci75@pengutron=
ix.de/T/#m25be91afe3e9554600e859a8a59128ca234fc63d
> >>
> >>  .../mediatek/vcodec/mtk_vcodec_dec_hw.c       | 26 ++++++------------=
-
> >>  1 file changed, 8 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.=
c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> >> index b753bf54ebd9..e1cb2f8dca33 100644
> >> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> >> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> >> @@ -148,20 +148,21 @@ static int mtk_vdec_hw_probe(struct platform_dev=
ice *pdev)
> >>      ret =3D mtk_vcodec_init_dec_clk(pdev, &subdev_dev->pm);
> >>      if (ret)
> >>              return ret;
> >> -    pm_runtime_enable(&pdev->dev);
> >> +
> >> +    ret =3D devm_pm_runtime_enable(&pdev->dev);
> >> +    if (ret)
> >> +            return ret;
> >>
> >>      of_id =3D of_match_device(mtk_vdec_hw_match, dev);
> >>      if (!of_id) {
> >>              dev_err(dev, "Can't get vdec subdev id.\n");
> >> -            ret =3D -EINVAL;
> >> -            goto err;
> >> +            return -EINVAL;
> >>      }
> >>
> >>      hw_idx =3D (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;
> >>      if (hw_idx >=3D MTK_VDEC_HW_MAX) {
> >>              dev_err(dev, "Hardware index %d not correct.\n", hw_idx);
> >> -            ret =3D -EINVAL;
> >> -            goto err;
> >> +            return -EINVAL;
> >>      }
> >>
> >>      main_dev->subdev_dev[hw_idx] =3D subdev_dev;
> >> @@ -173,36 +174,25 @@ static int mtk_vdec_hw_probe(struct platform_dev=
ice *pdev)
> >>      if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {
> >>              ret =3D mtk_vdec_hw_init_irq(subdev_dev);
> >>              if (ret)
> >> -                    goto err;
> >> +                    return ret;
> >>      }
> >>
> >>      subdev_dev->reg_base[VDEC_HW_MISC] =3D
> >>              devm_platform_ioremap_resource(pdev, 0);
> >>      if (IS_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC])) {
> >>              ret =3D PTR_ERR((__force void *)subdev_dev->reg_base[VDEC=
_HW_MISC]);
> >> -            goto err;
> >> +            return ret;
> >>      }
> >>
> >>      if (!main_dev->subdev_prob_done)
> >>              main_dev->subdev_prob_done =3D mtk_vdec_hw_prob_done;
> >>
> >>      platform_set_drvdata(pdev, subdev_dev);
> >> -    return 0;
> >> -err:
> >> -    pm_runtime_disable(subdev_dev->pm.dev);
> >> -    return ret;
> >> -}
> >> -
> >> -static int mtk_vdec_hw_remove(struct platform_device *pdev)
> >> -{
> >> -    pm_runtime_disable(&pdev->dev);
> >> -
> >>      return 0;
> >>  }
> >>
> >>  static struct platform_driver mtk_vdec_driver =3D {
> >>      .probe  =3D mtk_vdec_hw_probe,
> >> -    .remove =3D mtk_vdec_hw_remove,
> >>      .driver =3D {
> >>              .name   =3D "mtk-vdec-comp",
> >>              .of_match_table =3D mtk_vdec_hw_match,
> >
>
