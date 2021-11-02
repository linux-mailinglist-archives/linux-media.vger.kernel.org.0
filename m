Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46EFF4438B1
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 23:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhKBWqu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 18:46:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:54012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230248AbhKBWqu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 18:46:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85B5161058;
        Tue,  2 Nov 2021 22:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635893054;
        bh=xlJTg+g45NA5Jmaqfo0H1zJ7M0aSNbSpGn8R3qo/alA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J3E8y0mMMimFVMbrPwTI/vuLIbS5uGyGpj0wTtaionlsJrkEZvjuqdEcZYJCbGoqC
         VnR72U8fFhgoSs3c6iwvcNl7Q6Lk24uo1cQLeJHNL2VqBjUlIbUSTuzokk+3KdooQG
         9AdOmz6ri1V1FKeE93/vitgRtGKkBdyI3un1SXq/UYn46bTcCEOg00dUZAkq/6ONZB
         VcgtqN/485DnHb4EfdiB3y4FMFkK1RZ0Z/XMYcffQv/QzhM6Fh67KOU7rgTHpmf4Fc
         y41ieGpHxDUZM2ti0JC3T0sCeTeK6TUdOYr5ZbzOI6vGPnnQYi+jJCaMKEFro/AUI/
         1HVR4qyzYonKg==
Received: by mail-ed1-f44.google.com with SMTP id o8so2701547edc.3;
        Tue, 02 Nov 2021 15:44:14 -0700 (PDT)
X-Gm-Message-State: AOAM530htOJ4PyPsvP7U6nbz9frq7QZ0HDWigrLJ1gq/cwnx4Gn/mBXR
        ukjiSjNI5NGU59EW6V0e1poN3CGnHv1krANOJw==
X-Google-Smtp-Source: ABdhPJwWkcHLupHM+eSOeq+xd9impIHRTT3qkTjxiKN/kL5YOlS59jRuQo/tHhUYUb2vMifYDtwGGYH3OoSmTPh7gC0=
X-Received: by 2002:a17:907:16ac:: with SMTP id hc44mr26056561ejc.363.1635893052996;
 Tue, 02 Nov 2021 15:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <097d8602906e9db279728330c6cf2837be184704.1635338663.git.geert+renesas@glider.be>
 <YYBdzwshhM5fmsEE@robh.at.kernel.org> <CAMuHMdUvy9oVCv+3HJ_dZr6Rm4iP8FPwTETxq+j2ja_BR1=c5A@mail.gmail.com>
In-Reply-To: <CAMuHMdUvy9oVCv+3HJ_dZr6Rm4iP8FPwTETxq+j2ja_BR1=c5A@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 2 Nov 2021 17:44:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJTMORDCAb=9nuSaKiHgVgw6wb4jQw7ppMmuru-MZ1uuQ@mail.gmail.com>
Message-ID: <CAL_JsqJTMORDCAb=9nuSaKiHgVgw6wb4jQw7ppMmuru-MZ1uuQ@mail.gmail.com>
Subject: Re: [PATCH] bindings: media: venus: Drop bogus maxItems for power-domain-names
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 2, 2021 at 3:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Mon, Nov 1, 2021 at 10:36 PM Rob Herring <robh@kernel.org> wrote:
> > On Wed, Oct 27, 2021 at 02:45:30PM +0200, Geert Uytterhoeven wrote:
> > > make dt_binding_check:
> >
> > I'd say it's redundant rather than bogus.
>
> I wrote "bogus", as the "redundant" ones typically give:
>
>                 hint: "maxItems" is not needed with an "items" list
>
> And I didn't get that here?

Any schema file with an error shows up twice. First there's all the
specific errors with details. Then there's what you reference which is
all the schemas that we're skipping. If you set DT_SCHEMA_FILES now,
you should only see the second case for other schema files.

So it's probably better to reference the actual error:

Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml:
properties:power-domain-names: {'minItems': 2, 'maxItems': 3, 'items':
[{'const': 'venus'}, {'const': 'vcodec0'}, {'const': 'cx'}]} should
not be valid under {'required': ['maxItems']}
 hint: "maxItems" is not needed with an "items" list
 from schema $id: http://devicetree.org/meta-schemas/items.yaml#

> > >     Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml: ignoring, error in schema: properties: power-domain-names
> > >     warning: no schema found in file: Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> > >
> > > Fixes: e48b839b6699c226 ("media: dt-bindings: media: venus: Add sc7280 dt schema")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 1 -
> > >  1 file changed, 1 deletion(-)
> >
> > Acked-by: Rob Herring <robh@kernel.org>
>
> Thanks!
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
