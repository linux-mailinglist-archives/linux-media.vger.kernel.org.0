Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A965A44628B
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 12:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbhKELQQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 07:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbhKELQQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 07:16:16 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0879C061714;
        Fri,  5 Nov 2021 04:13:36 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id e2so16357856uax.7;
        Fri, 05 Nov 2021 04:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=12mEO0A1yX4YO0aWrAlKQ0oriRzb3rtWJiL1gUaAlOA=;
        b=aA4o7St44Lci26wMleyUlqgl5aYdmfY5x/LnQtxQ13XFz8sIwHp8ToXCVFvAzKf3v9
         qqh9KwimkjqqHBMYDg2OvDHu9cR17gxjuuZ8oNmmskMono2it4Kaqjo1TnikfTuX0Wq1
         +ujl5OZjJlhTFxuvOT/dxrOtPDe28kAWDCzfQjEnmX1zmYZOahrAG+Ooax7/PlGzVGuE
         SfSkqbpWaFeJ3GfXnioiciHAyJQjzFDTnyLZ0NgboHn6Qq8Z8Rid2FWbd4P129Apiguu
         0uD4WY3xayW7NE7w+GW3tXKw8UFRakiEjh0yf/r6rxdpnusJYG8CU5Sx0yX6A92Vw85T
         JTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=12mEO0A1yX4YO0aWrAlKQ0oriRzb3rtWJiL1gUaAlOA=;
        b=zqLvG9yv1fE9gkHbilj0qRefXIzz4DMiZweeJg7JLxTYPXLq6jI0BoblHyqSqSqeiq
         PEevNcA7dFCeU6n5uL3Mlrm2kLC/d5RMMN9gK32o9vA1J+mcatrV4DoFdk2EA8ETgeyC
         7qjhjKT7r3Oy0bBEbT2W1KRU6hs91/75HCcJisRPbclb4os0vfN7e1RJhZl/+tBTvvRy
         2mYoWxbGX7KlrFYbwZl0sqwuQm0ehFGFQ1Hud2hCQ6Hp41m4FCOGRJTxkQZgOs8bePgS
         AtCYAOmazzri9SIM7tIqFppeQpg0W5CPk6sWXyUJ/aJRrfny1WpLE6kZKJaYkH0cN7NP
         +xzA==
X-Gm-Message-State: AOAM5331nt1UEcQD2gDVvI5TyCWeY0S/BPCHgcT+JEou2788cpEiLCug
        VA0w9eJsFE3fc0dqoBv2T5pq2J1ePt2Oc2dDQGc=
X-Google-Smtp-Source: ABdhPJxqRQs0MOCVpo6Nqgh+JFNzht90hIXRwtk6KZFCKqsGTOoFTiLiUJRi08CjAsfcpuKc1UlBsAbFm3wdNnSG320=
X-Received: by 2002:a05:6102:3e84:: with SMTP id m4mr70542087vsv.51.1636110815434;
 Fri, 05 Nov 2021 04:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211023203457.1217821-1-aford173@gmail.com> <CAOMZO5BwPTWBhqzHgbzbC_UyzOX7LMGxX83H0FaJ-05ddOpqYQ@mail.gmail.com>
 <CAHCN7x+Bj==zd8_VRquv51RYiG9t_CRrB6=3fugaHvQS8PVS+g@mail.gmail.com>
 <b63738b2-9e3a-0d21-a845-ca3be8b00892@kontron.de> <CAJ+vNU0pt73obejn-wnC7QEExRWUAOCfcKRv__4x8+WWdPJsag@mail.gmail.com>
 <CAHCN7xKVS=MK91BENA53p1041WReptiQ3ccLSzCcFWQ5P6TN6A@mail.gmail.com>
 <CAJ+vNU3s9sCMCmaPM+qqE3F9ZuOvCpoNngC4qnk7++SCAhuMtQ@mail.gmail.com>
 <CAHCN7xJb7e2d0X3ZOnLDFRECcTyWVdmVHk5a=N10ipOSjcQE5Q@mail.gmail.com>
 <CAHCN7x+PTcJyrOm_9y5BKY79dEL9mdc4fimyBCzVzeO=qtDWcA@mail.gmail.com> <CAHCN7xKmr_dryBttt6fL7Yd6kKbpudbenpPCVsB2nooseEtz_w@mail.gmail.com>
In-Reply-To: <CAHCN7xKmr_dryBttt6fL7Yd6kKbpudbenpPCVsB2nooseEtz_w@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 5 Nov 2021 08:13:24 -0300
Message-ID: <CAOMZO5BMn33TtYYyeaAtz99KYZR57TY1R7go2g6eCByW4W3Riw@mail.gmail.com>
Subject: Re: [RFC V2 0/5] arm64: dts: imx8mm: Enable CSI and OV5640 Camera
To:     Adam Ford <aford173@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        cstevens@beaconembedded.com,
        Adam Ford-BE <aford@beaconembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Fri, Nov 5, 2021 at 1:14 AM Adam Ford <aford173@gmail.com> wrote:

> +Lucas Stach
> I think I found the issue of the camera hanging. It appears to be
> related to the disp-blk-ctrl virtual power domains.
>
> In the NXP kernel, the dispmix power domain in ATF sets bits 16 and 17
> of 32e2_8008 (GPR_MIPI_RESET_DIV), but the disp-blk-ctl driver only
> configures 32e2_8000 (SFT_RSTN_CSR) and 32e2_8004 (CLK_EN_CSR).  As
> soon as I set those extra bits, the hanging went away, and I got an
> image and the image looked good.  I'll try to work on this tomorrow or
> the weekend to submit a patch with a fixes tag to make sure the
> IMX8MM_DISPBLK_PD_MIPI_CSI power domain properly configures the extra
> register.
>
> With this change, I didn't need to modify either the CSI-bridge driver
> nor the mipi_csi driver, so when I get the blk-ctrl fix, I'll resubmit
> this series on top of that with the corrections suggested as a proper
> patch without the RFC.

That's great news! Thanks a lot for your good work.

Cheers
