Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D79036005B
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 05:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhDODXZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 23:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbhDODXX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 23:23:23 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C69C061574;
        Wed, 14 Apr 2021 20:23:00 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id i22so14282458ila.11;
        Wed, 14 Apr 2021 20:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lDDSZgQHX/bX7YEofdQRN7IKiM+VScYOJ6hUHVQMjAg=;
        b=NcxdHnLKh2szThM5x+fSSXnthtI8Oc/EER3tMezg94TC904shYA5Xrq9d9xQ5TEWNS
         mRUvOacJ3qU1tLe/KL3DtZoslSwahwUtRrTWe5AS1NpGinJ1HAUyMkoIyJfZl+oDCNwl
         GR8/Eecx3+W30f6IO8yH9QXfVyWqEgKBbxLqqwx3BVQy90IE9IyJKY+NOJe63yWVKQWI
         295cUeVPJp44Q+T3Q4FAhgjigXndbX71Q/Ivhieh2NA2lbufqzHuKKa7ytjMh3POKxyt
         PminF8pLyQuPnW2NdJ6Xk6s4ENYTQgJXV6Dm2U1P000o0HfKybyrnk0xHkkB6WL6EKZV
         5Fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lDDSZgQHX/bX7YEofdQRN7IKiM+VScYOJ6hUHVQMjAg=;
        b=lKq7F55quPO19/Dr+RqJwWi46eA2snjYlotnepgC4027oiXWRm8fZwsA29WBY+fDs7
         4PsA+3kqRg5ni1xZx9shX7VO6n8qN7bD0qncguUCjaXo7YTJWY9k09JhIqurXsYxd2iI
         gZXD3Cy2BHPqStp2GorwEjgmzI4csDHfx2qPfcky865ZAbMAfwYVy/9GgvO6J7V2zh8k
         HrfByyn/H1nBsPOvLAf+VrxAUlAaasgYFdFaaJPHKguoKwTgdiQftxppD3LJFXSdVDB5
         9sSrgFVoV8giK1r8WNCeh2uxYhKgUCt7O6y/7OeRZnvxlBYuwCjIhyFlIo0Cbh6LS3n8
         8aJA==
X-Gm-Message-State: AOAM530RtcTQUqxQ+Bat0bM77e4a4kTPXmtoWIdOQpNCQAKjQZ8QVC9W
        alW4Mb0kClAVTV4r37CH06PeVyF0JDZq+leCRMk=
X-Google-Smtp-Source: ABdhPJwCchTgYR/qRdb2+1liuMuVpCI2vG36iwFXVkgrvc1r7CkoWBQGU6mRuaPA3ZVBVtlqCRxkpUW/QPIh6mDw2HM=
X-Received: by 2002:a05:6e02:1526:: with SMTP id i6mr1153731ilu.270.1618456980117;
 Wed, 14 Apr 2021 20:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <1618383117-17179-1-git-send-email-dillon.minfei@gmail.com>
 <1618383117-17179-2-git-send-email-dillon.minfei@gmail.com> <6d8a5d4c-b741-dc7a-7cfb-eb66a642cb6f@canonical.com>
In-Reply-To: <6d8a5d4c-b741-dc7a-7cfb-eb66a642cb6f@canonical.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Thu, 15 Apr 2021 11:22:24 +0800
Message-ID: <CAL9mu0KqrbxUtKgPkQyTMj1pfqx5Ch+LGuLzzWEAHtSO9z0izA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX
 SBC board dts support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        krzk@kernel.org, linux@rempel-privat.de, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        festevam@gmail.com, prabhakar.csengg@gmail.com, mchehab@kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-imx@nxp.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 14, 2021 at 9:00 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 14/04/2021 08:51, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > The DaSheng Com-9xx is and ARM based signle board computer (SBC)
> > featuring:
> > - i.MX6Q
> > - 2GiB LPDDR3 DRAM
> > - 8GiB eMMC 5.0 FLASH
> > - 4MiB SPI Flash
> > - USB 2.0 Host/Device
> > - Multiple multi-protocol RS232/RS485 Serial ports
> > - microSD socket
> > - 5V DC power input
> > - HDMI1.4a,1080p@60
> > - RGMIIx1 Gigabit Ethernet
> > - CSI0x1, connect with ov2659
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > ---
> > v2: no changes
> >
> >  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documenta=
tion/devicetree/bindings/arm/fsl.yaml
> > index 297c87f45db8..24bdfbd4853f 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -206,6 +206,7 @@ properties:
> >                - fsl,imx6q-sabreauto
> >                - fsl,imx6q-sabrelite
> >                - fsl,imx6q-sabresd
> > +              - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
>
> You break here the alphabetical order. Should be after dmo,imx6q-edmqmx6.
Agree=EF=BC=8C will move to below dmo,imx6q-edmqmx6 in v3, thanks for patie=
nt.

Best regards.
Dillon
>
>
> Best regards,
> Krzysztof
