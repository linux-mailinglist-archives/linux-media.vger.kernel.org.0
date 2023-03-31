Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623E76D242F
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 17:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbjCaPle convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 31 Mar 2023 11:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjCaPlc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 11:41:32 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22C64C35;
        Fri, 31 Mar 2023 08:41:31 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-54601d90118so266500797b3.12;
        Fri, 31 Mar 2023 08:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680277290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgxC0qijgs744nSQRmKCAm4LhEekXjRl+Ej8SDIB8FI=;
        b=NH0L8ArU8tRtFM+kaiR/xat1SKfbmQt7Lzzyl5mEYLT8pjJrrxu5Og2kMg1We9Vtyo
         oq4DgKc/jawvaCGauBgSJ1fNwqXHx817tpvKHT59epYHxNXdE1l8BN17UsFLxvX9zphf
         MeeOUQp/peeHzcj3KUAm4KQqpTOVf4UOJii3kgIFBIOMAAJHITHUPXSsr+8kSCNzQiMC
         p22P62og6fmH61He7JgJ/AnoviknAOlkKYPB3SWeszgJ1s6lF+Oott/lv/aCqwd4xaCw
         3CGNw3keK0/K64A6IMC4Sv6tda1/Hhwutl8jiOmZ/tdQwcno7Ng25Lb/uvtl/9VdLOE2
         2LeQ==
X-Gm-Message-State: AAQBX9eO97K5tiPoAWpOCcKOeKxP9a4JksgsRunPwhLu3wEaaUbg5VkZ
        ABR4mlo4NcrmM+biMbcgLZ5gVpZCQSp9Bg==
X-Google-Smtp-Source: AKy350ZuvMARbwW4frqW9ccfMEPDz1Su+1tDa9NsuEFcGWzQq1qWXzBLdF56szdXDg1eKSsTLSioig==
X-Received: by 2002:a0d:c241:0:b0:541:676f:b3e with SMTP id e62-20020a0dc241000000b00541676f0b3emr25840903ywd.39.1680277290588;
        Fri, 31 Mar 2023 08:41:30 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id t4-20020a817804000000b00545a0818493sm599112ywc.35.2023.03.31.08.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 08:41:30 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id r187so27877910ybr.6;
        Fri, 31 Mar 2023 08:41:29 -0700 (PDT)
X-Received: by 2002:a25:bb85:0:b0:b7c:1144:a708 with SMTP id
 y5-20020a25bb85000000b00b7c1144a708mr11537151ybg.12.1680277289547; Fri, 31
 Mar 2023 08:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230331141032.3817866-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXANL4RwjqcqGsjJa8_R2ExefnWbsOfayHLegzHsjpP8Q@mail.gmail.com> <ZCb+r/IoEtf6RO5O@oden.dyn.berto.se>
In-Reply-To: <ZCb+r/IoEtf6RO5O@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 31 Mar 2023 17:41:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiUwmc29-K7XOUeUk8WQ-cgJAxJm+dNOOX700uCOM6Cw@mail.gmail.com>
Message-ID: <CAMuHMdWiUwmc29-K7XOUeUk8WQ-cgJAxJm+dNOOX700uCOM6Cw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: maxim,max96712: Require setting
 bus-type property
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Mar 31, 2023 at 5:39 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2023-03-31 17:14:42 +0200, Geert Uytterhoeven wrote:
> > On Fri, Mar 31, 2023 at 4:15 PM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > The MAX96712 can support both CSI-2 C-PHY and D-PHY bus. Document the
> > > supported bus-types and make the property mandatory.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> > > @@ -65,9 +65,14 @@ properties:
> > >
> > >              properties:
> > >                data-lanes: true
> > > +              bus-type:
> > > +                enum:
> > > +                  - 1 # CSI-2 C-PHY
> > > +                  - 4 # CSI-2 D-PHY
> >
> > Perhaps use/refer to the symbolic names, too?
>
> I tired that, but dt_binding_check complained.
>
> $ cat Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> ...
>   bus-type:
>     enum:
>       - MEDIA_BUS_TYPE_CSI2_CPHY
>       - MEDIA_BUS_TYPE_CSI2_DPHY
> ...
>
> $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> ...
> .../obj/Documentation/devicetree/bindings/media/i2c/maxim,max96712.example.dtb:
> gmsl-deserializer@49: ports:port@4:endpoint:bus-type:0: [4] is not one of ['MEDIA_BUS_TYPE_CSI2_CPHY', 'MEDIA_BUS_TYPE_CSI2_DPHY']
>
> Or did I misunderstand you? I checked other bindings and the numerical
> values where used in all media/i2c bindings.

Yeah, I don't think you can do it that way.
But this should work:

     - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
     - 4 # MEDIA_BUS_TYPE_CSI2_DPHY

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
