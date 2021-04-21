Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D386A36641C
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 05:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234769AbhDUDlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 23:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbhDUDlh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 23:41:37 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82112C06174A;
        Tue, 20 Apr 2021 20:41:03 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id b10so40694246iot.4;
        Tue, 20 Apr 2021 20:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HUL5iOZc28qAX3PsDJ0khNs1c1kb23x81GpeZXPZHr0=;
        b=WQl3BZB24dee0+iczS32i6ta8dIDUsrzhFvhRoKrmzXendrjWQ6+ymVePQXQ8eK+7J
         XuICOmjrS/ieQeiC7EDSYpkXk644BJZ7cWliU1vFMgqgxs5mjb5f/ElzehsFDgC/y4pV
         Qg9q/mFXhRQDOdZaJW+PSsQACanIHQ1OajWj2SP3/Z5Ov8t5F3PHq3rfk0rlBUgk13If
         OIPD96AJuZDFgx/SSYOF+pU09mna2FvEXliI0AosI8ZcRVnQHr8/ce7mxX/WzTJceFeB
         8Vv8oDU2X7YKHI3K5D8PJv1eVloXMJxjzDEbjZyor553CzD9YXs4qsYkF8RJd8bckK+M
         H2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HUL5iOZc28qAX3PsDJ0khNs1c1kb23x81GpeZXPZHr0=;
        b=NwiLjE5gvn0vg1kXxj0lw7+EyIKiq5hYOiXmuN62pVgumf1p+zyClgSrtouJq9/+wO
         zVgQiIu9PLNf7RDrKIywrIOWoVqo/+3/J8y5UEYAAq+LobbhLXLAMT/Gmk2TJCNCUmLS
         S/GCczK/msr4VfV6s+nzez8fJNrBVFHpbrn483wxHbW6aynZjifFZSFaZsbILpwcZ8BS
         XYXDLN7qJNDQw8VEt+SsGxOFWYUIxoISA2Zl4FDvIju53E2Np0W1liYAz67foXT+S4B4
         qE3aQ/+Ns0xwZM889beyuuMcK7TtbZLX1/K2KWJMj1NMOzUFiqStSuHIWjzZIZU5F1eX
         mq9Q==
X-Gm-Message-State: AOAM531Pgh2MjyHt/dcoaT/u2cZHIREYNlnpPEku7YzhHR32B4HfvgZX
        2WdYt7WeEFYlDw5wW338SmbvWwFoXttl3iU2Hi8=
X-Google-Smtp-Source: ABdhPJzNC46+JNBKZghlVn6QayNw6kik/i4m+Dj7Rwp0R3QmmJrMXqgLvPgwT6+epZB2PlQbrhVzal7ScxXq3V5NSNs=
X-Received: by 2002:a05:6638:34a0:: with SMTP id t32mr24067421jal.10.1618976462773;
 Tue, 20 Apr 2021 20:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
 <1618459535-8141-4-git-send-email-dillon.minfei@gmail.com> <CAOMZO5CcoKDZhj5rQ0_0wkHgk5Mf2RtAHy94EAzjwVgXvvmNeg@mail.gmail.com>
In-Reply-To: <CAOMZO5CcoKDZhj5rQ0_0wkHgk5Mf2RtAHy94EAzjwVgXvvmNeg@mail.gmail.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Wed, 21 Apr 2021 11:40:26 +0800
Message-ID: <CAL9mu0+nvkywRffOaXTNJwY7S0wxqNNz2h6pnmV3PhRZG0+_hA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm: dts: imx: Add i.mx6q DaSheng COM-9XX SBC
 board support
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        leoyang.li@nxp.com, arnd@arndb.de, olof@lixom.net,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        prabhakar.csengg@gmail.com, mchehab@kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-imx@nxp.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

Thanks for quick reply.

On Tue, Apr 20, 2021 at 10:27 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Dillon,
>
> On Thu, Apr 15, 2021 at 1:05 AM <dillon.minfei@gmail.com> wrote:
>
> > +               green {
> > +                       gpios = <&gpio4 8 0>;
>
> Please use GPIO_ACTIVE_HIGH label instead:
> gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;
>
> > +&clks {
> > +       assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
> > +                         <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
> > +       assigned-clock-parents = <&clks IMX6QDL_CLK_PLL3_USB_OTG>,
> > +                                <&clks IMX6QDL_CLK_PLL3_USB_OTG>;
> > +};
>
> You are setting the LDB clock parent, but you don't use LDB in this
> devicetree. You could simply remove this.
Agree, thanks.
>
> > +&ecspi1 {
> > +       cs-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_ecspi1>;
> > +       status = "okay";
> > +
> > +       flash: m25p80@0 {
>
> Node names should be generic:
>
> m25p80: flash@0
Agree, thanks.
>
> > +&iomuxc {
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_hog>;
> > +
> > +       imx6qdl-ds {
> > +               pinctrl_hog: hoggrp {
> > +                       fsl,pins = <
> > +                               MX6QDL_PAD_NANDF_D0__GPIO2_IO00 0x1b0b0
> > +                               MX6QDL_PAD_NANDF_D1__GPIO2_IO01 0x1b0b0
> > +                               MX6QDL_PAD_GPIO_0__CCM_CLKO1    0x130b0
>
> This could be part of the pinctrl_ov2659 group as it provides the
> clock for the camera.
>
> Please try to keep in the hoggrp only the pins that cannot be
> controlled by any other node.
Agree, after moving these pinctrl to corresponding component's group,
the hoggrp is useless.
so, I removed it in v4.
>
> > +&wdog1 {
> > +       status = "okay";
> > +};
> > +
> > +&wdog2 {
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_wdog>;
> > +       fsl,ext-reset-output;
> > +       status = "disabled";
>
> Wouldn't it be better to enable wdog2 and disable wdog1 instead? wdog2
> provides a POR, which is preferred.
Agree, thanks.
