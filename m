Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA7F293F5E
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 17:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408610AbgJTPOu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 11:14:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:41644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408605AbgJTPOt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 11:14:49 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A85B2224B;
        Tue, 20 Oct 2020 15:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603206888;
        bh=0u4Fv1fqrTFQ3Wp/EIuAvFVLUv/j7BCakcnneOAU5xs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NZMb+McCVdq/q6SuDog4g30r0l0prtO/gCN9O6gVcsaPkBYbZzxJe6dZwLnFZWph2
         M0351LwXFAFPqpU9MMwcNqhFS0QuVRVoKOoQZN62uuHbU7C0DFfQ43/cynxfCiq2I3
         SzdZPNgixrYnmyKSYQ7VBaaXvm9F8NGbIFGYgg7c=
Received: by mail-ot1-f49.google.com with SMTP id m22so2042483ots.4;
        Tue, 20 Oct 2020 08:14:48 -0700 (PDT)
X-Gm-Message-State: AOAM532//9BZEJr4+zFqCCVAm+Ii88FFsGHQwWtDP75Zy7s/kr4ci+D8
        DJkVS8eVu4tdKEH8MADrCevdB56VwCmI3PDT8g==
X-Google-Smtp-Source: ABdhPJz41UgbNkwtnCErGlmIpBGGzSTn7CHQ0TMdTIes7cHjDhnkd7e5tesUj1dAccQoyfMFCtdYvIGbHA+Y3i2/bE0=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr1941932oti.107.1603206887469;
 Tue, 20 Oct 2020 08:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200722155533.252844-1-helen.koike@collabora.com>
 <20200722155533.252844-6-helen.koike@collabora.com> <CAL_Jsq+qB=yUtHKKujiUWrsq+W-3ggM3B_SuuDzfYEheczn=8g@mail.gmail.com>
 <2dcdda41-bdb4-55a8-557f-8175983effb5@collabora.com>
In-Reply-To: <2dcdda41-bdb4-55a8-557f-8175983effb5@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 20 Oct 2020 10:14:35 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+-8Jyms3LJBjTxABcuTa5GduXtJ1jdOgp7xcPoQzdtGQ@mail.gmail.com>
Message-ID: <CAL_Jsq+-8Jyms3LJBjTxABcuTa5GduXtJ1jdOgp7xcPoQzdtGQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] media: staging: rkisp1: remove unecessary clocks
To:     Helen Koike <helen.koike@collabora.com>
Cc:     devicetree@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "heiko@sntech.de" <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Collabora Kernel ML <kernel@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mark Rutland <mark.rutland@arm.com>, karthik.poduval@gmail.com,
        Johan Jonker <jbx6244@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Eddie Cai <eddie.cai.linux@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 14, 2020 at 11:46 AM Helen Koike <helen.koike@collabora.com> wrote:
>
> Hi Rob,
>
> Thnaks for your reply.
>
> On 9/22/20 11:24 AM, Rob Herring wrote:
> > On Wed, Jul 22, 2020 at 9:56 AM Helen Koike <helen.koike@collabora.com> wrote:
> >>
> >> aclk_isp_wrap is a child of aclk_isp, and hclk_isp_wrap is a child of
> >> hclk_isp, thus we can remove parents from the list.
> >>
> >> Also, for the isp0, we only need the ISP clock, ACLK and HCLK.
> >> In the future we'll need a pixel clock for RK3288 and RK3399, and a JPEG
> >> clock for RK3288.
> >>
> >> So with the goal to cleanup the dt-bindings and remove it from staging,
> >> simplify clock names to isp, aclk and hclk.
> >>
> >> Assigned clocks are meant to refer to the full path in the clock tree,
> >> i.e. the leaf in the tree.
> >> For instance, in RK3399, the clock responsible for ACLK (ISP AXI CLOCK)
> >> is aclk_isp0_wrapper.
> >>
> >> For reference, this is the isp clock topology on RK3399:
> >>
> >>  xin24m
> >>     pll_npll
> >>        npll
> >>           clk_isp1
> >>           clk_isp0
> >>     pll_cpll
> >>        cpll
> >>           aclk_isp1
> >>              aclk_isp1_noc
> >>              hclk_isp1
> >>                 aclk_isp1_wrapper
> >>                 hclk_isp1_noc
> >>           aclk_isp0
> >>              hclk_isp1_wrapper
> >>              aclk_isp0_wrapper
> >>              aclk_isp0_noc
> >>              hclk_isp0
> >>                 hclk_isp0_wrapper
> >>                 hclk_isp0_noc
> >>  pclkin_isp1_wrapper
> >>
> >> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> >>
> >> ---
> >> Changes in V5:
> >> - Use if/then schema as suggested by Rob Herring on
> >> https://patchwork.linuxtv.org/project/linux-media/patch/20200702191322.2639681-6-helen.koike@collabora.com/#119729
> >>
> >> Changes in V4:
> >> - update binding according to suggestion by Robin Murphy
> >> on https://patchwork.kernel.org/patch/11475007/
> >>
> >> Changes in V3:
> >> - this is a new patch in the series
> >> ---
> >>  .../bindings/media/rockchip-isp1.yaml         | 50 ++++++++++++-------
> >>  drivers/staging/media/rkisp1/rkisp1-dev.c     |  8 ++-
> >>  2 files changed, 36 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> >> index 62a6b9c959498..23c677d15037a 100644
> >> --- a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> >> +++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> >> @@ -24,20 +24,10 @@ properties:
> >>      maxItems: 1
> >>
> >>    clocks:
> >> -    items:
> >> -      - description: ISP clock
> >> -      - description: ISP AXI clock clock
> >> -      - description: ISP AXI clock  wrapper clock
> >> -      - description: ISP AHB clock clock
> >> -      - description: ISP AHB wrapper clock
> >> +    minItems: 3
> >
> > You need maxItems here too or it will always be 3.
> >
> >>
> >>    clock-names:
> >> -    items:
> >> -      - const: clk_isp
> >> -      - const: aclk_isp
> >> -      - const: aclk_isp_wrap
> >> -      - const: hclk_isp
> >> -      - const: hclk_isp_wrap
> >> +    minItems: 3
> >>
> >>    iommus:
> >>      maxItems: 1
> >> @@ -116,6 +106,34 @@ required:
> >>    - power-domains
> >>    - ports
> >>
> >> +if:
> >> +  properties:
> >> +    compatible:
> >> +      contains:
> >> +        const: rockchip,rk3399-cif-isp
> >> +then:
> >> +  properties:
> >> +    clocks:
> >> +      maxItems: 4
> >> +      minItems: 3
> >
> > For a single compatible you shouldn't really have a variable number of clocks.
>
> I'm not entirely sure how to make this separation, since isp0 and isp1 (not yet supported)
> would use the same compatible.
> Unless if we separate in two compatibles, but maybe this is an overhead just for an extra clock.
> What do you think?

In that case, it's fine.

>
> >
> >> +      items:
> >> +        # isp0 and isp1
> >> +        - description: ISP clock
> >> +        - description: ISP AXI clock
> >> +        - description: ISP AHB clock
> >> +        # only for isp1
> >> +        - description: ISP Pixel clock
> >> +    clock-names:
> >> +      maxItems: 4
> >> +      minItems: 3
> >> +      items:
> >> +        # isp0 and isp1
> >> +        - const: isp
> >> +        - const: aclk
> >> +        - const: hclk
> >> +        # only for isp1
> >> +        - const: pclk_isp
> >
> > Don't you need an 'else' clause. For not rockchip,rk3399-cif-isp,
> > there's no definition of what clocks there are.
>
> There is only one compatible defined for now, rk3288 will be added later.
> The idea to add if/then is to make it easier to add rk3288:
>
> https://patchwork.kernel.org/project/linux-media/patch/20200406073017.19462-4-karthik.poduval@gmail.com/

Hopefully, the clock names will be aligned? Looks like they are the
same with just 1 additional clock. Ideally, you define them all at the
top level and the if/then schema just defines how many clocks for each
compatible.

Rob
