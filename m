Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8DC19BA48
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 04:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733224AbgDBC2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 22:28:04 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:37351 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732435AbgDBC2E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Apr 2020 22:28:04 -0400
Received: by mail-vs1-f65.google.com with SMTP id o3so1343633vsd.4
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2020 19:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zt0D1WWYon7rnb1mP0UjGmav2M6rhhlx3Y7lg8pS9f8=;
        b=HnZ0Gsu9eKqnGW3EDAZfElhAU+jLHvjkgzkBoZMoyREC3aQkVau2qNbheTShrot+iG
         jYkmou7JKDg1SpZwibCrT07O+3Fo2q2eAmI9sagajyoz5HbnVVsBtXRf8XQ+q0qIIckl
         78YEGDsZC0HMmSz+GicVv7HiNYOWhr/2Nvrll5F/hvJkfKTRSI5KWbGY3NvAS2XwrvPW
         LFYUwQGmf/tvo9VB/YIhHmAE4gzNMpRvUH4OCHNe6y7pzmcbgsAjFn9oIY//ZasZoQUv
         7z+yYThLtP6sJBfrEr9O2fQQsz0JjlsGbBIoGkEMO7f47zuHd5S02IiYu8oNVp4lZ/Ds
         QRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zt0D1WWYon7rnb1mP0UjGmav2M6rhhlx3Y7lg8pS9f8=;
        b=nZwo3in1TWpOkBFje7WHlmVqnsssqCkLdnrrK0cOUZH1t6Gwq8ju0tsAqlPeYuk+EU
         YwnOV5c4VVuZAitbme7+h3MZowvCQThS3OK2eH0vsVjU1fmlXZfVraJ1xtQ8mSiHsifR
         MZowJdG45WJ6uJ5Cy+z9fMfuSV+8IKT1Qrju+mr3rYeOLxpsEjPF37XDLmLySWZpBu8H
         IEX6mV2WL9L5eCHhI5bBgLAqP5XzOf1zaB+DaRmppUyXVQUoA9nRFK6IhhQhXpVKL5lO
         AdECds5YIL+KmVSG08oegC6neW7l3waqhig7hQLDbl4IVX/oienS8EBcVzB14SvRhZRV
         VcQA==
X-Gm-Message-State: AGi0PuaMO+SGVgDXKTXf+Jl4rlyOlsGUoDEOzArvQrZs6gYI+6Ak6UVM
        REZLFS3QA9GEUUI2Yj5dyidW/NYiIejMp6NAvWWHfg==
X-Google-Smtp-Source: APiQypJjtRhhhgARdQ2uAEELdEgzzaMbJSOIG5KkxQ5HW6mlhBJGf26Rg0RT5S9k01eMWlTNVXdyrNDMrHPRnZayDOk=
X-Received: by 2002:a05:6102:31b7:: with SMTP id d23mr628810vsh.25.1585794481936;
 Wed, 01 Apr 2020 19:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAFP0Ok-MXSYMe=-SKrgS-ng2f1uKwT0eed4uKc0rSOXzEoEXig@mail.gmail.com>
 <93d8b917-2fc5-0194-075a-cde510b997fc@collabora.com>
In-Reply-To: <93d8b917-2fc5-0194-075a-cde510b997fc@collabora.com>
From:   karthik poduval <karthik.poduval@gmail.com>
Date:   Wed, 1 Apr 2020 19:27:50 -0700
Message-ID: <CAFP0Ok_Ap-Q4WfKhm_LKqgU2WOsvWkg16aE7pS-r0tc7q9qLZQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: rockchip: add rk3288 ISP and DPHY
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sure thanks for the comments, I will work on them and resubmit the patches.

On Wed, Apr 1, 2020 at 4:59 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Hi Karthik,
>
> Thanks for the patchset.
>
> On 3/31/20 4:54 AM, karthik poduval wrote:
> > ISP and DPHY device entries missing so add them.
> > ported over from https://github.com/TinkerBoard/debian_kernel.git
>
> If you've ported the changes from https://github.com/TinkerBoard/debian_kernel.git, I wonder if this should have a different Author and Signed-off-by.
>
> Please check: https://patchwork.kernel.org/bundle/tfiga/rkisp1-v6/
>
> Also, we usually don't add links in the commit message, since this will stay in the history,
> and links can be volatile.
>
> But you can add comments after the 3 dashes below, and they will be ignored when
> the maintainers applies it.
>
> >
> > Reported-by: Karthik Poduval <karthik.poduval@gmail.com>
>
> The Reported-by tag doesn't make much sense to me here, please check
>
>     Documentation/process/submitting-patches.rst
>
>
> > Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
> > ---
>
> Comments can be added here, after these 3 dashes.
>
>
> Please, take into consideration the above comments for the other patches in the series as well.
>
> Regards,
> Helen
>
> >  arch/arm/boot/dts/rk3288.dtsi | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> > index 9beb662166aa..adea8189abd9 100644
> > --- a/arch/arm/boot/dts/rk3288.dtsi
> > +++ b/arch/arm/boot/dts/rk3288.dtsi
> > @@ -247,6 +247,23 @@
> >          ports = <&vopl_out>, <&vopb_out>;
> >      };
> >
> > +    isp: isp@ff910000 {
> > +        compatible = "rockchip,rk3288-rkisp1";
> > +        reg = <0x0 0xff910000 0x0 0x4000>;
> > +        interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&cru SCLK_ISP>, <&cru ACLK_ISP>,
> > +             <&cru HCLK_ISP>, <&cru PCLK_ISP_IN>,
> > +             <&cru SCLK_ISP_JPE>;
> > +        clock-names = "clk_isp", "aclk_isp",
> > +                  "hclk_isp", "pclk_isp_in",
> > +                  "sclk_isp_jpe";
> > +        assigned-clocks = <&cru SCLK_ISP>, <&cru SCLK_ISP_JPE>;
> > +        assigned-clock-rates = <400000000>, <400000000>;
> > +        power-domains = <&power RK3288_PD_VIO>;
> > +        iommus = <&isp_mmu>;
> > +        status = "disabled";
> > +    };
> > +
> >      sdmmc: mmc@ff0c0000 {
> >          compatible = "rockchip,rk3288-dw-mshc";
> >          max-frequency = <150000000>;
> > @@ -891,6 +908,14 @@
> >              status = "disabled";
> >          };
> >
> > +        mipi_phy_rx0: mipi-phy-rx0 {
> > +            compatible = "rockchip,rk3288-mipi-dphy-rx0";
> > +            clocks = <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_MIPI_CSI>;
> > +            clock-names = "dphy-ref", "pclk";
> > +            #phy-cells = <0>;
> > +            status = "disabled";
> > +        };
> > +
> >          io_domains: io-domains {
> >              compatible = "rockchip,rk3288-io-voltage-domain";
> >              status = "disabled";
> >



-- 
Regards,
Karthik Poduval
