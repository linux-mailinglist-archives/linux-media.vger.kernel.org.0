Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D715522D058
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 23:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgGXVL7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 17:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgGXVL6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 17:11:58 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D10C0619D3;
        Fri, 24 Jul 2020 14:11:58 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id a9so2066876oof.12;
        Fri, 24 Jul 2020 14:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=32A/vrWodJ+BXQ39fKXWfYJgwA/ZpA42pEyTyFICNY4=;
        b=OSkUTzRFFG6RCEG7jFwkBHEBckqfzjEE9h1/uxk+PoDk+pQ5GVA0N00BcljH0cCsor
         NVsdjYZQ55bSAZoH+pMzq7otfrlv+N6ahNwUbZDoEwIovrLJrbHlJn7SG5FTPUH8W8rN
         sEVtfwYrR2em11V37/00XfWF6ckiAmUdTzUO45ppdMMfcDNmm9M48e1molbrJ3d89rgh
         U6Uhk34FGaWbE/IUy47lWobysaBxKVR7xJkkFGkMGM5+5SaZsCvFeKMWfzHxr+64P3HP
         SJMJiO7vEQ/hJkFWkOu3L1e1KTDpxA07ul5qqjYF51UvdhDoch7uZw5OpGn+F3MqGvFh
         JWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=32A/vrWodJ+BXQ39fKXWfYJgwA/ZpA42pEyTyFICNY4=;
        b=cJFPLY9e2SSjx8m42kbcUHgjEicGvS7re+ENl6VIRx6SPxZdf/0oGZQ7MNmvfjTBhk
         Olu2IrOQiDUGgx6I/bODtjLlQ+/X+wwyVQMdcKwPKb6AgHe9pjI1C9jR8kiy/EXesY0d
         0vSrcOaKeL+MurxUAnizerDXzXy6eTEQUyM75WVU7bEV8TIOptPdIYP7hOXtDcuk9V/i
         nMsUiVkvIgn4SmMwV32nWo6D0aib5BbTTZrX3Rt/wwqYwJdeuA7iZqY6Cdc+WcPw4qYq
         2MdBOEYCAEsskjmBGUlhBT1Mq8NgHQMXlIDlsLpAiclYLnwbycyNEG1Wh678xVfcm4KT
         g2ww==
X-Gm-Message-State: AOAM530DagotO3/l7+dxJ2sY0OI9kcstA3NVp5Wn8EcmbTjf5f5E7g7A
        gBzp3ZdTMnk6iU8IQLYer05w8FihSlWlJfwvxUoBKpT1
X-Google-Smtp-Source: ABdhPJxSEMhig/5INwzyVFWMGkySOfLKrkW2RDf7R+3+uH6ipq7O9w4cfjL01QlFjgiZmOkFqqaLKEyX+6LwPAI5QWg=
X-Received: by 2002:a4a:1d83:: with SMTP id 125mr11360872oog.18.1595625117897;
 Fri, 24 Jul 2020 14:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <1595602732-25582-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1595602732-25582-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200724193752.GE2729799@oden.dyn.berto.se>
In-Reply-To: <20200724193752.GE2729799@oden.dyn.berto.se>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 24 Jul 2020 22:11:31 +0100
Message-ID: <CA+V-a8s7UkhCGcP8eiiH_jd8hhnpLJA6QqfL7jXo_sAgRMfy8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: renesas,vin: Document
 renesas-vin-ycbcr-8b-g property
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the review.

On Fri, Jul 24, 2020 at 8:37 PM Niklas <niklas.soderlund@ragnatech.se> wrot=
e:
>
> Hi Lad,
>
> Thanks for your patch.
>
> On 2020-07-24 15:58:51 +0100, Lad Prabhakar wrote:
> > Add a DT property "renesas-vin-ycbcr-8b-g" to select YCbCr422 8-bit dat=
a
> > input pins.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 13 ++++++++=
+++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b=
/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > index 53c0a72..7dfb781 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > @@ -106,6 +106,12 @@ properties:
> >
> >            remote-endpoint: true
> >
> > +          renesas-vin-ycbcr-8b-g:
>
> I think the preferred format for vendor specific properties are
> "<vendor>,<property>".
>
Indeed and I had it as renesas,vin-ycbcr-8b-g but dt_bindings_check
complained about it.

> This nit apart I'm not sure a property is the right way here. Could it
> not be possible on some designs to have two different sensors one wired
> to DATA[7:0] and the other to DATA[15:8] and by controlling the
> VNDRM2_YDS register at runtime switch between the two? If so adding a DT
> property to hard-code one of the two options would prevent this. I fear
> we need to think of a runtime way to deal with this.
>
Aha Gen2 and Gen3 hardware manuals have a bit different description
about the YDS field. (I was working R8a7742 SoC so I referred Gen2
manual)

> The best way to do that I think is to extend the port@0 node to allow
> for two endpoints, one for each of the two possible parallel sensors.
> This would then have to be expressed in the media graph and selection if
> YDS should be set or not depend on which media links are enabled.
>
In that case how do we handle endpoint matching each would have two
subdevs to be matched. And in case non media-ctl cases we cannot
switch between subdevs.

Cheers,
--Prabhakar

> > +            type: boolean
> > +            description:
> > +              If present this property specifies to selects VIN_G[7:0]=
 as data pins for YCbCr422 8-bit data.
> > +            default: false
> > +
> >          required:
> >            - remote-endpoint
> >
> > @@ -168,6 +174,13 @@ properties:
> >
> >                remote-endpoint: true
> >
> > +              renesas-vin-ycbcr-8b-g:
> > +                type: boolean
> > +                description:
> > +                  If present this property specifies to selects VIN_G[=
7:0] as data pins for
> > +                  YCbCr422 8-bit data.
> > +                default: false
> > +
> >              required:
> >                - remote-endpoint
> >
> > --
> > 2.7.4
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund
