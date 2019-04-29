Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 358D6DD22
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 09:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbfD2Hvx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 03:51:53 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33807 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfD2Hvx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 03:51:53 -0400
Received: by mail-qt1-f193.google.com with SMTP id j6so10931275qtq.1;
        Mon, 29 Apr 2019 00:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o/wmIhe4nVJv0ub+Zm2BlY4rD9+LMhSkxOTZOnjTqAA=;
        b=JnaDK3rLVxBeSbdPaTiJhcsOtXtzO9cNySiXWlsE5w+lj0KZKm15wU8vDzTYOSAlqm
         EmCQCqUSFilei1MO3YR+pHoWcrnhKrUboEs/6zvzj4Dk2ldjLjZkdVoANx/RMKz4s4yG
         0rDmq3sz8SfxAO26FjsKRA2fQXqJPtIfwGKHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o/wmIhe4nVJv0ub+Zm2BlY4rD9+LMhSkxOTZOnjTqAA=;
        b=DemrPqufS89gNM/Zk4ph2BdlCEYMe7DthQ5Eqv3CFb/rIOwvBYbXmXDbpLhOrpFWr2
         W9WLjCQH71tJUZY7gbxR2NK0SQIh330FmEYMCRb9xR24lN4TtNGABjJriUXK3sNqfnAL
         yPkAU3bTPGkuOp9+5Q2LXsi5Y8v72ijdBI1JCo7LgHcPP4mD/lv1k+U/S2bfcyljQDDX
         9zXrhgcEZkq313U4/jfSaBFzdbT7FkIZXHC9UEDMBMFqqGvtUliPcxCu3c58vdDPYRVF
         VcYmbHjD2Lpsz/ghn9+PiUTiu8f3aP9raMUXEep2CTchAFXhUe8YXtk6UGkZcXIH/xQf
         cCPg==
X-Gm-Message-State: APjAAAUKmIERkNR4g8Mgo3sslnaTDwan8tqYS+ODrkUmNCWw2w5RShhk
        MIuMHjwmmlWS3sqYzR4houk2unTDHJiwg9kdiRQ=
X-Google-Smtp-Source: APXvYqyMZFsWN6kgsok8mRvbEOnKo2YP2o/YvFTM5PkjD6J+ugLl8ckNCMjgT7cwvnyaUovJ0SCbOKC95qDEoQeNkhs=
X-Received: by 2002:a0c:986d:: with SMTP id e42mr47259276qvd.51.1556524312305;
 Mon, 29 Apr 2019 00:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <1556119194-10917-1-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1556119194-10917-1-git-send-email-eajames@linux.ibm.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 29 Apr 2019 07:51:40 +0000
Message-ID: <CACPK8XcncJuMMK-MQuu29dbeZbU57+a84RL+kuN9LkctZpFZfA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: aspeed-g5: Add video engine
To:     Eddie James <eajames@linux.ibm.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-aspeed@lists.ozlabs.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-media@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, mchehab@kernel.org,
        hverkuil@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 24 Apr 2019 at 15:20, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add a node to describe the video engine on the AST2500.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Applied to the aspeed SoC tree.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 85ed9db..c6d5edc 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -243,6 +243,16 @@
>                                 status = "disabled";
>                         };
>
> +                       video: video@1e700000 {
> +                               compatible = "aspeed,ast2500-video-engine";
> +                               reg = <0x1e700000 0x1000>;
> +                               clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
> +                                        <&syscon ASPEED_CLK_GATE_ECLK>;
> +                               clock-names = "vclk", "eclk";
> +                               interrupts = <7>;
> +                               status = "disabled";
> +                       };
> +
>                         sram: sram@1e720000 {
>                                 compatible = "mmio-sram";
>                                 reg = <0x1e720000 0x9000>;      // 36K
> --
> 1.8.3.1
>
