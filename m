Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 705FE6D2423
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 17:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232852AbjCaPjd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 11:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbjCaPjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 11:39:32 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E571DFA6
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 08:39:30 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c29so29473408lfv.3
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 08:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1680277169;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N+as+NayVksRu6SDWg6aXR/sKU+BcGjHDT4W4PKmc8s=;
        b=GO3ibCXGaCQSV4fx7fCxdObCCXVAX9pEETTq39QCNWBveM8SAJi3UbzHWECIv5MoaO
         ++X6X44GVwoEFoLv0nX5oCN20JJjy5EekaLxOHitjSoYl9I1XM4tKxEeyGo5T76sRT1Z
         CwuOZtiDMv8WjbbQoKOBT6TobPil9+7bisgAC+TFyrxo2EaAg2QJD0H6QOd/U27SDAqg
         vD2/4nlVhb+zZBhTZOFXa91zKk4RNoKGcLjeuotxPFgY//e5heRC6AgQIhwO7ctymeRZ
         8+eGW36C8VwNhXI8ErfINEVyP5wNAvYD8g0DkLGUbftl5yUjtnbwY65hA2TPajSHgGFs
         W2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680277169;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+as+NayVksRu6SDWg6aXR/sKU+BcGjHDT4W4PKmc8s=;
        b=X03fheXuY/e1cLxtkYD8g2rXzEczP++SCNw4eZ8qHXByUHzJ1zVxHhU13V6n/W913l
         +K26B5Nd5MNMn0wPb1hs+8WcxS0T8e4PV+6c5zhKCCEFRKBHQzL09/2DJHAfLyeZZwsO
         RouP45OwNszAbkHxKpjBCrWNYZzbl2JGQ+xJlZdfYRUGcOSWQ5nEd5JiEaquijWK1f65
         yupdW0Db2awBSvDyu5Ca+flp2NoEVGJnyNK8/26l3bNM2e68HgdN4OrjjWPQpRpcN6pX
         XH/8T0Pzt8reEF+kuL4Msg2FD8FEKCcibQDtqZ1j2k7vtN7xvmbl4NxtceZnH99VyKZg
         grQA==
X-Gm-Message-State: AAQBX9flFDnRoK7YjcwqZ1/fdoEI25r1Xcqo50qDypjk0H8O324r2JVj
        Q8qvKaZsxoDGywjh+Ej9llC37kBQe0BIqfAbWKvjdg==
X-Google-Smtp-Source: AKy350Y5TIECnO9hqjIWB11Jhi5O0RsRMMvnaWdJIBUVBZfdlBnzQF9wxjQDP6Gr3BDvlKKt6CY9Fg==
X-Received: by 2002:ac2:44b4:0:b0:4eb:c85:bdc2 with SMTP id c20-20020ac244b4000000b004eb0c85bdc2mr7269144lfm.2.1680277168831;
        Fri, 31 Mar 2023 08:39:28 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id q27-20020ac25a1b000000b004ea887347c2sm420733lfn.211.2023.03.31.08.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 08:39:28 -0700 (PDT)
Date:   Fri, 31 Mar 2023 17:39:27 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: maxim,max96712: Require setting
 bus-type property
Message-ID: <ZCb+r/IoEtf6RO5O@oden.dyn.berto.se>
References: <20230331141032.3817866-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXANL4RwjqcqGsjJa8_R2ExefnWbsOfayHLegzHsjpP8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXANL4RwjqcqGsjJa8_R2ExefnWbsOfayHLegzHsjpP8Q@mail.gmail.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On 2023-03-31 17:14:42 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Fri, Mar 31, 2023 at 4:15 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The MAX96712 can support both CSI-2 C-PHY and D-PHY bus. Document the
> > supported bus-types and make the property mandatory.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> > @@ -65,9 +65,14 @@ properties:
> >
> >              properties:
> >                data-lanes: true
> > +              bus-type:
> > +                enum:
> > +                  - 1 # CSI-2 C-PHY
> > +                  - 4 # CSI-2 D-PHY
> 
> Perhaps use/refer to the symbolic names, too?

I tired that, but dt_binding_check complained.

$ cat Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
...
  bus-type:
    enum:
      - MEDIA_BUS_TYPE_CSI2_CPHY
      - MEDIA_BUS_TYPE_CSI2_DPHY
...

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
...
.../obj/Documentation/devicetree/bindings/media/i2c/maxim,max96712.example.dtb: 
gmsl-deserializer@49: ports:port@4:endpoint:bus-type:0: [4] is not one of ['MEDIA_BUS_TYPE_CSI2_CPHY', 'MEDIA_BUS_TYPE_CSI2_DPHY']

Or did I misunderstand you? I checked other bindings and the numerical 
values where used in all media/i2c bindings.

> 
> Sounds like an opportunity for improvement for
> Documentation/devicetree/bindings/media/video-interfaces.yaml, too.
> 
> >
> >              required:
> >                - data-lanes
> > +              - bus-type
> >
> >      required:
> >        - port@4
> > @@ -82,6 +87,7 @@ additionalProperties: false
> >  examples:
> >    - |
> >      #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/media/video-interfaces.h>
> >
> >      i2c@e6508000 {
> >              #address-cells = <1>;
> > @@ -101,6 +107,7 @@ examples:
> >                              port@4 {
> >                                      reg = <4>;
> >                                      max96712_out0: endpoint {
> > +                                            bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> >                                              clock-lanes = <0>;
> >                                              data-lanes = <1 2 3 4>;
> >                                              remote-endpoint = <&csi40_in>;
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund
