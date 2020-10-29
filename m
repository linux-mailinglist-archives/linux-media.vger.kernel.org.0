Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4134729F5CF
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 21:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgJ2UEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 16:04:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:33896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgJ2UE3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 16:04:29 -0400
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63E1520809;
        Thu, 29 Oct 2020 20:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604001868;
        bh=AOvWudq0ZqsWRnN/qXnDh5LtmEQC83i+z8hhzYFp75c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=E9pSr6O/G6YE5XFNmqJqljbHx3wSzq6bVnhYgluqrf/H7wEGt4aAL9MLa6Ef2g5bE
         4w5Ruk1xZvDR0sd7whf/fLVhUkTVh6Yvbg+wvF3ZK42Y28B6ivLMgvYklEgjEcZcBs
         SnRh+ePJ2S1j6tL012nn1pFY9GPKgLLRWuNt5q28=
Received: by mail-oo1-f52.google.com with SMTP id o129so1018129ooo.11;
        Thu, 29 Oct 2020 13:04:28 -0700 (PDT)
X-Gm-Message-State: AOAM533ddLpQ0DP4oum4dl1uU0tdMPjrBnHgvTBuW+dfRdx3iGpHsSNY
        WfFOajgru19sxhicxDtFJFKG2yxOpL2rK7CgeA==
X-Google-Smtp-Source: ABdhPJzY69332/TXD/GEbGo1Phdkm8uP9368uPwVctCb5SZBvuiMltO4sKY7UEYa7BklecuGbw5fafj/oTXoXLnSFpE=
X-Received: by 2002:a4a:dcc8:: with SMTP id h8mr4529803oou.81.1604001867553;
 Thu, 29 Oct 2020 13:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201020193850.1460644-1-helen.koike@collabora.com> <20201020193850.1460644-6-helen.koike@collabora.com>
In-Reply-To: <20201020193850.1460644-6-helen.koike@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 29 Oct 2020 15:04:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK3xhPHscbB+waDqEjKeRoeZ0MNu88fp70g9CSC02Qopw@mail.gmail.com>
Message-ID: <CAL_JsqK3xhPHscbB+waDqEjKeRoeZ0MNu88fp70g9CSC02Qopw@mail.gmail.com>
Subject: Re: [PATCH v6 5/9] media: staging: rkisp1: remove unecessary clocks
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "heiko@sntech.de" <heiko@sntech.de>,
        Collabora Kernel ML <kernel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mark Rutland <mark.rutland@arm.com>, karthik.poduval@gmail.com,
        Eddie Cai <eddie.cai.linux@gmail.com>,
        Johan Jonker <jbx6244@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 20, 2020 at 2:39 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> aclk_isp_wrap is a child of aclk_isp, and hclk_isp_wrap is a child of
> hclk_isp, thus we can remove parents from the list.
>
> Also, for the isp0, we only need the ISP clock, ACLK and HCLK.
> In the future we'll need a pixel clock for RK3288 and RK3399, and a JPEG
> clock for RK3288.
>
> So with the goal to cleanup the dt-bindings and remove it from staging,
> simplify clock names to isp, aclk and hclk.
>
> Assigned clocks are meant to refer to the full path in the clock tree,
> i.e. the leaf in the tree.
> For instance, in RK3399, the clock responsible for ACLK (ISP AXI CLOCK)
> is aclk_isp0_wrapper.
>
> For reference, this is the isp clock topology on RK3399:
>
>  xin24m
>     pll_npll
>        npll
>           clk_isp1
>           clk_isp0
>     pll_cpll
>        cpll
>           aclk_isp1
>              aclk_isp1_noc
>              hclk_isp1
>                 aclk_isp1_wrapper
>                 hclk_isp1_noc
>           aclk_isp0
>              hclk_isp1_wrapper
>              aclk_isp0_wrapper
>              aclk_isp0_noc
>              hclk_isp0
>                 hclk_isp0_wrapper
>                 hclk_isp0_noc
>  pclkin_isp1_wrapper
>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
>
> ---
>
> Changes in V6:
> - Define clocks in the top level, and use if/else schema to define how
>   many for each compatible as sugested by Rob Herring on
>   https://patchwork.linuxtv.org/project/linux-media/patch/20200722155533.252844-6-helen.koike@collabora.com/#122626
> ---
>  .../bindings/media/rockchip-isp1.yaml         | 44 +++++++++++++------
>  drivers/staging/media/rkisp1/rkisp1-dev.c     |  8 ++--
>  2 files changed, 33 insertions(+), 19 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
