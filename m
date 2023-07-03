Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAEA5745B6F
	for <lists+linux-media@lfdr.de>; Mon,  3 Jul 2023 13:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbjGCLor (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jul 2023 07:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbjGCLop (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jul 2023 07:44:45 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5AA6EC
        for <linux-media@vger.kernel.org>; Mon,  3 Jul 2023 04:44:44 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b69f71a7easo69289061fa.1
        for <linux-media@vger.kernel.org>; Mon, 03 Jul 2023 04:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1688384683; x=1690976683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaNHFGtqidFFoc879AcjoyLmp2ttt/EsaJvpqNaeTBg=;
        b=tG+WDuV6RlFBC96XU0zrBQAAznnNTMP26skrKr0lEq/LIRouxE23HHH8iDMF4HOaXP
         hv3CqtSeblorPsoUJGIMgX7Oir0zrOLXdgvaNSB+w0Wqw3SZxROIFKgYSZHaqRbrVAaQ
         TcSpQp9U0PtgaAXgUwZqPFJsb9TwF4HGqi45jUzgW5lBGeXnMOUQySyltDC9Waalxbcg
         4tMW/i5QTGtZFcFEysu+wWvFktGkmSr8vucZV3vdv2dLXXoA4mqPGcU2vi5vr2wFwaq2
         q6ep/ns6phzhjdHnjjs0PC1VfilxQ3rwxQOgQfzMi2Rt/kkjFMzyN4dBi/Kh6v+SZZsE
         lIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688384683; x=1690976683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaNHFGtqidFFoc879AcjoyLmp2ttt/EsaJvpqNaeTBg=;
        b=aPYOyTjPJo/LwHX8/EGy5mC6XptKlSu+TcJL9JUUDacpILF8glpH/8SB7/1+YzRaMf
         68MYjcOVQaP8FVluH8QlHkM3DTADtD1W3YOSg+fwc1sVj/3VS297aIFkEg+Tq/NSQqU/
         TDOkC3ODDjj6Xyry5gmLTrB4cp1XiihvrRKtgW/4S3zaN1SRlXpm7pQ+MvFkzNn11e3L
         HjQeOfVknCSTZBdpEdEkfQ4qj/3Gfh5j0lsAu6KEJphQqTLDo3IG0fYVS8Lm6v+czFQp
         picCdsRVOUxe9m2qoz5UP1neYsQSuujipDawj3wyasgSTLA4kO7pAe7NP2rhZ0anPcK+
         4AkQ==
X-Gm-Message-State: ABy/qLbLGTVP0bssWmWBRknG0Pjfq4sarKebEOD01qmp3Ono1rXIJxFT
        3Db+N4NxJO5jgZiQK9fQRhCO59NMa1Cm/dwaNj9dfw==
X-Google-Smtp-Source: APBJJlGbheteHmbNZEDEkZHAuIEEMQkHMHMiMY31fEaVpgo1N30lf/fgRzYRxG7UFIccv4g/oQFL+6AtzrHyfgR4dtI=
X-Received: by 2002:a2e:98d6:0:b0:2b6:9930:871 with SMTP id
 s22-20020a2e98d6000000b002b699300871mr6735718ljj.13.1688384682883; Mon, 03
 Jul 2023 04:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230630144006.1513270-1-pan@semihalf.com> <20230630144006.1513270-4-pan@semihalf.com>
 <20230630-scrimmage-antelope-7d1f82d491fc@spud>
In-Reply-To: <20230630-scrimmage-antelope-7d1f82d491fc@spud>
From:   =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date:   Mon, 3 Jul 2023 13:44:31 +0200
Message-ID: <CAF9_jYT1Fz4hBQrNtgkM6mU-JVH=ZxsJnkaLDsa5uoEV_hTLVA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] ARM: dts: Add Chameleon v3 video node
To:     Conor Dooley <conor@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dinguyen@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, mchehab@kernel.org, upstream@semihalf.com,
        amstan@chromium.org, ribalda@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 30, 2023 at 8:26=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Fri, Jun 30, 2023 at 04:40:06PM +0200, Pawe=C5=82 Anikiel wrote:
> > Add node for the video system device.
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
> > ---
> >  .../socfpga/socfpga_arria10_chameleonv3.dts   | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv=
3.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
> > index 422d00cd4c74..5e66363d4ab5 100644
> > --- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
> > +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
> > @@ -10,6 +10,60 @@ / {
> >       compatible =3D "google,chameleon-v3", "enclustra,mercury-aa1",
> >                    "altr,socfpga-arria10", "altr,socfpga";
> >
> > +     soc {
> > +             video@c0060500 {
> > +                     compatible =3D "google,chv3-video";
>
> This compatible does not seem to be documented & I did not see a comment
> about the lack of a binding in the cover letter. What am I missing?

Yes, the compatible is not documented for now (I'll do that in a later
patchset), sorry for not mentioning that in the cover letter.
