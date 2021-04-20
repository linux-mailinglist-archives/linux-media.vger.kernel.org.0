Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072D1365B1C
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 16:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhDTO1v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 10:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbhDTO1u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 10:27:50 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9330BC06174A;
        Tue, 20 Apr 2021 07:27:18 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id r128so34787584lff.4;
        Tue, 20 Apr 2021 07:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2OP51eQPmA2v/Axf9XtUd+B6i5qCHxFde65D8J1wyZg=;
        b=Z46uel55L3Pi98OUkDhOokQ4LpvljzcjAA6huSHhwTg9l42PnLzkXLfUURi77NZlKx
         647qV39IcmyIbGXt5yylVavoCXlBggb2FOZf9P9Lzs10FuorQuM5hEx1SHq8MZgu437L
         /9vRSfs/Eg1pW/TqVq1SFQGWDCLqtXf16Uz21FJXpfcg+7LPINNmA9h2QkpuL6/f2Fq+
         8Nxrobaj75iR5oVapq2zzrPxD3PmzWIIhNPm6pgAn5jJpqmxy8QD9OmXPLDH4+8meZQl
         RuxLhp0qCgJ6UgFUG7eNKq2EwJ7dgvoof1TV4R4czSf1Q/id1Pm8EG+T+aazm4anGlEw
         DsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2OP51eQPmA2v/Axf9XtUd+B6i5qCHxFde65D8J1wyZg=;
        b=XtGj4G+Uj4oILMH5LSbekydI3FvIzSIKBVk+qVLCzu07Xzhtc2vHQ23O8RsMMyRChE
         ae24zB3Ny3tjR9/fgK257/mGPSDaAlQ6CcP+cGp+0azMqbt48GmJN9LwXp57ovLhDKGz
         2VwMN7JJuTIofhluP7W9fpygoqTwlTMlSl3SL6z15K/TRD2bXZAIuITX49OfTBsdLb/Q
         7MbreeS2zO8Vvq2W8VqmNQJjc5AaEiWMK25biv8RNTBis2l6IOwhEHlO4sOFzUSAcP5A
         p0F/nHGgY0bKr6t8rpH2X6y40GDRLw5dK6BBaTdUkxlupjss+AeZMDJbMs9Wr+kwo2iS
         QT/A==
X-Gm-Message-State: AOAM530DAYJ23iNER75Km1zGTmozD46Te91ODeV/yKg9EP2VEW7fj5q+
        n4MQlFPoUBX5VNjAirP9vq9niDpHMu5TMO53qB4=
X-Google-Smtp-Source: ABdhPJyDacLoI/mDyJgh1BiFhZW3NCtORmww/paWiBZ3vsgsugc+4BppgoVI02f+QG+gkPk0dh4JjS5HH0leABbKfxs=
X-Received: by 2002:a05:6512:1105:: with SMTP id l5mr15305227lfg.223.1618928837100;
 Tue, 20 Apr 2021 07:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com> <1618459535-8141-4-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1618459535-8141-4-git-send-email-dillon.minfei@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 20 Apr 2021 11:27:05 -0300
Message-ID: <CAOMZO5CcoKDZhj5rQ0_0wkHgk5Mf2RtAHy94EAzjwVgXvvmNeg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm: dts: imx: Add i.mx6q DaSheng COM-9XX SBC
 board support
To:     dillon.minfei@gmail.com
Cc:     krzysztof.kozlowski@canonical.com,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        leoyang.li@nxp.com, arnd@arndb.de, olof@lixom.net,
        s.hauer@pengutronix.de, kernel@pengutronix.de,
        prabhakar.csengg@gmail.com, mchehab@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dillon,

On Thu, Apr 15, 2021 at 1:05 AM <dillon.minfei@gmail.com> wrote:

> +               green {
> +                       gpios = <&gpio4 8 0>;

Please use GPIO_ACTIVE_HIGH label instead:
gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;

> +&clks {
> +       assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
> +                         <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
> +       assigned-clock-parents = <&clks IMX6QDL_CLK_PLL3_USB_OTG>,
> +                                <&clks IMX6QDL_CLK_PLL3_USB_OTG>;
> +};

You are setting the LDB clock parent, but you don't use LDB in this
devicetree. You could simply remove this.

> +&ecspi1 {
> +       cs-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_ecspi1>;
> +       status = "okay";
> +
> +       flash: m25p80@0 {

Node names should be generic:

m25p80: flash@0

> +&iomuxc {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_hog>;
> +
> +       imx6qdl-ds {
> +               pinctrl_hog: hoggrp {
> +                       fsl,pins = <
> +                               MX6QDL_PAD_NANDF_D0__GPIO2_IO00 0x1b0b0
> +                               MX6QDL_PAD_NANDF_D1__GPIO2_IO01 0x1b0b0
> +                               MX6QDL_PAD_GPIO_0__CCM_CLKO1    0x130b0

This could be part of the pinctrl_ov2659 group as it provides the
clock for the camera.

Please try to keep in the hoggrp only the pins that cannot be
controlled by any other node.

> +&wdog1 {
> +       status = "okay";
> +};
> +
> +&wdog2 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_wdog>;
> +       fsl,ext-reset-output;
> +       status = "disabled";

Wouldn't it be better to enable wdog2 and disable wdog1 instead? wdog2
provides a POR, which is preferred.
