Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85D2799C54
	for <lists+linux-media@lfdr.de>; Sun, 10 Sep 2023 04:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345429AbjIJCdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Sep 2023 22:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233350AbjIJCdv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Sep 2023 22:33:51 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AAFCCA
        for <linux-media@vger.kernel.org>; Sat,  9 Sep 2023 19:33:46 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so4054136a12.0
        for <linux-media@vger.kernel.org>; Sat, 09 Sep 2023 19:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694313225; x=1694918025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXkXimIrIM00EWep/vgZ8g6wTdastS5aSn14lsv3rjo=;
        b=BGSmhppLgpj+OFm6TKMw5hmAZaaWK5qYvtOg2n7X3eJoDdCnJ0RE8CWecJCPH1hpck
         mfdLR9jQfwbrREy+dTQJbFjv1+sDH3uxHn38FuMlIOmOa6Z+TO9foTlNLum7mExnOmaT
         xW6Q1EJcaYEM7qMMpD8yyugFJQxnsQT2/qpVFFUjhQ6LqLWToGrXVnQ+a9exFcpNSQlE
         9SStnpDLcBsnC3N1Ek7v6P7iuyJydAGrhPwBmdnWbCZrbVDN1D26qrBDxSLPOOCPZD2L
         6q0MQpJ5nXR0sWP+IvTdPbXGvrEwlM4/9oNG37qLdEakE3T3blscG3/NgN2joIeh0Gm6
         iW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694313225; x=1694918025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXkXimIrIM00EWep/vgZ8g6wTdastS5aSn14lsv3rjo=;
        b=hBIPnuDXs86leaf3cwsl7/KaS7wRuEWGt8A/AoTHEgWUcxaWVUjflE1ifeorkiLzk8
         AEK3JbbPjoKApTfxsepEMkfuAkcIcTDaf9NjU3s8F8odcXwOM1uwxzcL85GQYyBIbkUU
         KB7vA4Q9JjEiWgVRU1yoc+/xCstGRQR2qfKWsg5htnAxCmaxg6jVdHNDaqf19h+te74T
         HsWYU7pTs6212J38drT/NjYCN8vBckS0lItQ5UThfpuFEnZDiKes/45utGRGQ2fWWUJN
         CKojyYcZEbT+j+CqNYXZE7HGLrYnTT9YRBgfCJIpT3PmRPBLgvCIu17+/d2sqFjS41Q/
         NVGw==
X-Gm-Message-State: AOJu0YzlloXrcuM2HjXKQpr6PMTeHZtvgi2uv2KEMbgIBYm3I7qnh5JJ
        DykoCnEsZW6pnpq/0lUOOpMMXNfncKipGQgK8pw=
X-Google-Smtp-Source: AGHT+IHkGf124da7w1WV8SZXDvanGehZu35of1N4vLG3o7H6NeLA7J/2qgK1+b+5+UiEf08xNC38CJMxIQf27eIJrOw=
X-Received: by 2002:a17:906:76c9:b0:9a2:23cd:f052 with SMTP id
 q9-20020a17090676c900b009a223cdf052mr5338563ejn.7.1694313224466; Sat, 09 Sep
 2023 19:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <94a617be-00b3-6dc8-eb7d-ae13c6fffae5@xenosoft.de>
 <cb82b6c1-035c-cc6b-2843-6b87ed6315ac@xenosoft.de> <f23204ec-ff42-5907-fa28-c1975a87f4e6@xs4all.nl>
 <79ea7cc5-6981-a791-7fed-7a6e27225000@xenosoft.de> <a02d481b-562c-803a-a71d-b8d95ba7ebb5@xs4all.nl>
 <82799d05-db42-c6a3-51ef-15e262344d4f@xenosoft.de> <f3c18b6e-0a3d-49bd-9553-71bd610588c2@xenosoft.de>
 <0e7d6689-d522-4438-9acb-952995c57f32@xs4all.nl>
In-Reply-To: <0e7d6689-d522-4438-9acb-952995c57f32@xs4all.nl>
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
Date:   Sat, 9 Sep 2023 19:33:08 -0700
Message-ID: <CAONMFfAyBOoPKo+K-qZG_E5d+_F++Nn7q5LK-sONMd2=XWHCzQ@mail.gmail.com>
Subject: Re: [BTTV] [FSL P50x0] [PASEMI] TV Time doesn't work anymore after
 dropping the overlay support
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Darren Stevens <darren@stevens-zone.net>,
        mad skateman <madskateman@gmail.com>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Christian Zigotzky <info@xenosoft.de>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 7, 2023 at 8:23=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all.=
nl> wrote:
>
> Hi Deb,
>
> On 04/09/2023 13:51, Christian Zigotzky wrote:
> > On 05 May 2023 at 09:20 am, Christian Zigotzky wrote:
> >> On 05 May 2023 at 08:45 am, Hans Verkuil wrote:
> >>> On 05/05/2023 08:25, Christian Zigotzky wrote:
> >>>> On 02 May 2023 at 08:57 am, Hans Verkuil wrote:
> >>>>> If v4l2-ctl fails, then try again
> >>>>> after applying this series:
> >>>>>
> >>>>> https://patchwork.linuxtv.org/project/linux-media/cover/cover.16829=
95256.git.deborah.brouwer@collabora.com/
> >>>> Your patch series solved the issue. Thanks a lot!
> >>> Nice, but somewhat unexpected :-)
> >>>
> >>> I'm a little bit unsure how to proceed: the 6.4 kernel will remove de=
structive overlay
> >>> support, but it won't have this series yet, that's for 6.5. But that =
would make 6.4
> >>> unusable for you.
> >>>
> >>> I might have to revert the overlay removal, at least for bttv.
> >>>
> >>> Regards,
> >>>
> >>>     Hans
> >> Hans,
> >>
> >> You don't need to revert the overlay removal because your patch series=
 work with the latest git kernel (6.4).
> >>
> >> Thanks for your help,
> >>
> >> Christian
> >
> > Hello Hans,
> >
> > I successfully used your patches for the kernel 6.5. Everything works w=
ithout any problems with your patch series from May.
> >
> > Your patches have been added with the latest Media updates [1] for the =
kernel 6.6.
> >
> > The patches works but I have a green bar in the bottum of the window if=
 I use the composite input. [2]
> >
> > I don't have this green bar with your May patch series.
> >
> > Could you please check your latest patches?
> >
> > Thanks,
> >
> > Christian
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3D307d59039fb26212a84a9aa6a134a7d2bdea34ca
> > [2] https://i.ibb.co/D4K6j2c/Kernel-6-6-alpha2-Power-PC.png
> >
> >
>
> After some testing and debugging I found this change in the bttv vb2 conv=
ersion
> patch:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/d785cd8b0d8c19c05=
fcaa1536622e2fdd9f8ede3.1689379982.git.deborah.brouwer@collabora.com/
>
> > diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt=
8xx/bttv-risc.c
> > index 3e0dac56de54..436baf6c8b08 100644
> > --- a/drivers/media/pci/bt8xx/bttv-risc.c
> > +++ b/drivers/media/pci/bt8xx/bttv-risc.c
> > @@ -67,8 +67,10 @@ bttv_risc_packed(struct bttv *btv, struct btcx_riscm=
em *risc,
> >       /* scan lines */
> >       sg =3D sglist;
> >       for (line =3D 0; line < store_lines; line++) {
> > -             if ((btv->opt_vcr_hack) &&
> > -                 (line >=3D (store_lines - VCR_HACK_LINES)))
> > +             if ((line >=3D (store_lines - VCR_HACK_LINES)) &&
> > +                 (btv->opt_vcr_hack ||
> > +                 (V4L2_FIELD_HAS_BOTH(btv->field) ||
> > +                  btv->field =3D=3D V4L2_FIELD_ALTERNATE)))
> >                       continue;
> >               while (offset && offset >=3D sg_dma_len(sg)) {
> >                       offset -=3D sg_dma_len(sg);
>
> It is this change that causes the issue: basically the condition
> (V4L2_FIELD_HAS_BOTH(btv->field) || btv->field =3D=3D V4L2_FIELD_ALTERNAT=
E)
> is almost always true (it is only false for FIELD_TOP/BOTTOM), so it is
> as if vcr_hack is always turned on.
>
> It looks to me like some debug code accidentally ended up in this patch.
> Reverting this change makes everything look good again (Christian, it wou=
ld
> be great if you can confirm that this also fixes the issue for you!).
>
> Deb, can you remember anything about this change?

This is not debug code.  I made the change to fix the latency and
frame drop issues
that were otherwise occurring with vb2; as I said in the cover letter to v3=
:

"- remove the last four lines in interlaced,
sequential top/bottom, and alternating buffers
to prevent long latency and frame drops
(this is instead of just enabling the existing
VCR hack by default);"
https://lore.kernel.org/linux-media/cover.1689379982.git.deborah.brouwer@co=
llabora.com/

However, if your testing shows that it isn't needed, then it would be
fine to remove this
code and just let the user enable the "vcr hack" as needed.  This was
my original approach
in v2, but I thought you had said at the time that you were seeing
massive framedrops in v2?

I didn't notice this green line before because I was testing in qv4l2
with the default
Pixel Format  : 'BGR3' (24-bit BGR 8-8-8) whereas tvtime is using
YUYV' (YUYV 4:2:2)

One fix that worked for me was to adjust the "OverScan" configuration in tv=
time
so that it is at least 3.5.  The /etc/tvtime/tvtime.xml configuration
file recommends
even higher at 8.0.  Christian, please try adjusting the overscan
value to see if
that is a possible solution as well.

Thanks,
Deb

>
> Regards,
>
>         Hans
>
>
>
