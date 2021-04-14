Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE4035ED5A
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 08:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349277AbhDNGl0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 02:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349270AbhDNGlY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 02:41:24 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27669C061574;
        Tue, 13 Apr 2021 23:41:03 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id a9so8766211ioc.8;
        Tue, 13 Apr 2021 23:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N7vftel7/kHFhYOjGzZvWT3xrH6u8lWAjKbx3Xy3YRw=;
        b=RJnHx5ck/RlYgj+beW67tKjeNzRs3D0s3vxKnLWROf/RBn876aPBEnniFLfgr/N+7z
         +sHIhFPzFsX2Ns5UssQiymea0CSTq3VUMaiMfTavqJtvA/Lb366fl20TdGBFYs0kIr77
         ONgNi91EhR5AR1B0ZuubDI4fV2u0kJgaSVeoOucmdTtjL1lbEa1IgCi2kju56PSCfFbt
         BhLHdFCVBkPrpW+NTHcOm7M8OnXNWbwsl89cCjVKJpgiha88GPMhknjTx9+tVRR41Nro
         2qTMbj8/Tfp1Yzh+O6nc8hzyI/u6/1q+mdJm6dMyKP9PRNMRxhyo1eH10H7d4gczgMII
         HWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N7vftel7/kHFhYOjGzZvWT3xrH6u8lWAjKbx3Xy3YRw=;
        b=qQzpsT6JuLVamsENtSOx8rTtI9PzV2s1HxOY4x3ITYUfHth1IBv6UgNGWqsPz9w6Xx
         3rrXTvGx6FelX/npgMM4GBYw+bUmtYKUGCXOmuZkcAeLRe395GuI1wXIAsYkaTN/BdNr
         LHxot5t8GW9SrQsjkkl/6G03He5+XhzrXyKl3yj4zljUuueUgRlm8hMpFENlXc9CNAh3
         GMtZ0kl5n2QgrdU/8Zb44N51gO4DltrAX/Kll/W8lfv1flIfvEhvx5eGOtKCDJDqxGo/
         8ouScKvIrnSNdNJhYA/raSApnw7Pl/c50m+06wTirnPDfdBLn5nroLosaHHAMKMAtSjE
         kAbA==
X-Gm-Message-State: AOAM533ZUmLvnCLhqOMR9VtZ3FKnoBG63kaWYw1GTQVI/Y2EJ80Qqj86
        wnDg8oiMw00fntu4TNnTsKdgUisaCqbaLY8/x+g=
X-Google-Smtp-Source: ABdhPJyWz6hj+7e/6wqtr7meX9crEQ2MiYOSLe47WWoSrrRd6Iblpr3NZT6qpB9Bpaw3r0QYh8vbPSMO8bJuEwj9DQM=
X-Received: by 2002:a05:6638:d47:: with SMTP id d7mr36772176jak.2.1618382462646;
 Tue, 13 Apr 2021 23:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <1618380827-16056-1-git-send-email-dillon.minfei@gmail.com>
 <1618380827-16056-2-git-send-email-dillon.minfei@gmail.com> <2a993aa9-6933-4af8-da26-f53096dc6ab7@canonical.com>
In-Reply-To: <2a993aa9-6933-4af8-da26-f53096dc6ab7@canonical.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Wed, 14 Apr 2021 14:40:26 +0800
Message-ID: <CAL9mu0+U2PN2HsQdw5mYGap+bH_YN55RyT-tw65EfH3zKxwScQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX
 SBC board dts support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        linux@rempel-privat.de, s.riedmueller@phytec.de,
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
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 14, 2021 at 2:22 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 14/04/2021 08:13, dillon.minfei@gmail.com wrote:
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
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > index 297c87f45db8..24bdfbd4853f 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -206,6 +206,7 @@ properties:
> >                - fsl,imx6q-sabreauto
> >                - fsl,imx6q-sabrelite
> >                - fsl,imx6q-sabresd
> > +              - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
> >                - karo,imx6q-tx6q           # Ka-Ro electronics TX6Q Modules
> >                - kiebackpeter,imx6q-tpc    # K+P i.MX6 Quad TPC Board
> >                - kontron,imx6q-samx6i      # Kontron i.MX6 Dual/Quad SMARC Module
> >
>
> You miss change in vendor prefixes. Didn't checkpatch complain about it?
> Did you run checkpatch?

Yes. was checked with checkpatch, since it's a warning, i forget to
fix it.thanks.
Will add vendor prefixes to vendor-prefixes.yaml in v2

Thanks.
Dillon,

> Best regards,
> Best regards,
> Krzysztof
