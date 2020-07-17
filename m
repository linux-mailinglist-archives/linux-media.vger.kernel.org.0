Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E75622434C
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 20:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgGQSpI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 14:45:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:55774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726322AbgGQSpI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 14:45:08 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9644E208C7;
        Fri, 17 Jul 2020 18:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595011507;
        bh=aQXux31L0fVJHV4y9kdNGhhZTnpp/2Df3qree3CTJyY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TTVwmoGLYREFkLJUML0EPVfT4+mQ4tnEEUQwUtlL1R/MoiBcMlrdczMvuFK0qHX9J
         IkzsNpZsONttrmB7pJxC8IxhESUapmP6QrKH4Pu17h09Hq1CbLoNhRDcFImD05h3rf
         3dLJbmPAP3mfhuYC9hWPSwcigdOjgHPbSfpKMCr0=
Received: by mail-ot1-f46.google.com with SMTP id g37so7564228otb.9;
        Fri, 17 Jul 2020 11:45:07 -0700 (PDT)
X-Gm-Message-State: AOAM531TwzcD7wW+8uS8C4/6FK8Qs1GdqdcJz2nKYiX4NoYsPxa5ueK0
        jp6FN2v67F9nMd/gJw6KQAsymH61zXE9vGlb9w==
X-Google-Smtp-Source: ABdhPJzjAX9VPCvhBaymbD8U6pueMna6x31wFEWxJwYV+L9W8q5c90gNWa24y9cUV9fKEYpCpbjo4E4/s6jNnBO1h5w=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr10192904ots.192.1595011506868;
 Fri, 17 Jul 2020 11:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200702191322.2639681-1-helen.koike@collabora.com>
 <20200702191322.2639681-6-helen.koike@collabora.com> <CAL_JsqKHG4HgcpWvh_qnHPAkaGCd7Q8APk2ai_QxjUQhvd5APg@mail.gmail.com>
 <822de449-8c01-d790-a9f9-e8b513bd7f87@collabora.com>
In-Reply-To: <822de449-8c01-d790-a9f9-e8b513bd7f87@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 17 Jul 2020 12:44:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLEXvub_E_nVWtQ1H4Ru=jLuRgr+Aiyu6Hmqb7fObG4Dg@mail.gmail.com>
Message-ID: <CAL_JsqLEXvub_E_nVWtQ1H4Ru=jLuRgr+Aiyu6Hmqb7fObG4Dg@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] media: staging: rkisp1: remove unecessary clocks
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
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 17, 2020 at 12:14 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Hi Rob,
>
> Thanks for your review.
>
> On 7/17/20 2:49 PM, Rob Herring wrote:
> > On Thu, Jul 2, 2020 at 1:13 PM Helen Koike <helen.koike@collabora.com> wrote:
> >>
> >> aclk_isp_wrap is a child of aclk_isp, and hclk_isp_wrap is a child of
> >> hclk_isp, thus we can remove parents from the list.
> >
> > But it looks like it is the wrap clocks you are removing.
>
> From this binding yes, but the idea is to add in the dt wherever clock
> responsible for the full ACLK path for instance.
> In the example below, clock aclk_isp is ACLK_ISP0_WRAPPER.
> Does this make sense?

Just perhaps clarify the renaming.

>
> >
> >>
> >> Also, for the isp0, we only need the ISP clock, ACLK and HCLK.
> >> In the future we'll need a pixel clock for RK3288 and RK3399, and a JPEG
> >> clock for RK3288.
> >>
> >> So with the goal to cleanup the dt-bindings and remove it from staging,
> >> simplify clock names to isp, aclk and hclk.
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
> >>
> >> Changes in V4:
> >> - update binding according to suggestion by Robin Murphy
> >> on https://patchwork.kernel.org/patch/11475007/
> >>
> >> Changes in V3:
> >> - this is a new patch in the series
> >> ---
> >>  .../bindings/media/rockchip-isp1.yaml         | 30 +++++++++----------
> >>  drivers/staging/media/rkisp1/rkisp1-dev.c     |  8 ++---
> >>  2 files changed, 17 insertions(+), 21 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> >> index 4d111ef2e89c7..f10c53d008748 100644
> >> --- a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> >> +++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> >> @@ -24,20 +24,20 @@ properties:
> >>      maxItems: 1
> >>
> >>    clocks:
> >> -    items:
> >> -      - description: ISP clock
> >> -      - description: ISP AXI clock clock
> >> -      - description: ISP AXI clock  wrapper clock
> >> -      - description: ISP AHB clock clock
> >> -      - description: ISP AHB wrapper clock
> >
> > This is the correct way to describe multiple clocks.
>
> The idea was to prepare for rk3288 and rk3399 isp1, as suggested here https://patchwork.kernel.org/patch/11475007/#23462085
>
> Or should we do:
>
> clocks:
>   oneOf:
>     # rk3288 clocks
>     - items:
>       - description: ISP clock
>       - description: ISP AXI clock
>       - description: ISP AHB clock
>       - description: ISP Pixel clock
>       - description: ISP JPEG source clock

The main section should have this and 'minItems: 3'. IOW, it's a
superset of what's valid. Then you can restrict specific compatibles
further with an if/then schema. For rk3288, you need one with
'minItems: 5'.

>     # rk3399 isp0 clocks
>     - items:
>       - description: ISP clock
>       - description: ISP AXI clock
>       - description: ISP AHB clock

And this would be an if/then schema based on the compatible string and
defining 'maxItems: 3'.

>     # rk3399 isp1 clocks
>     - items:
>       - description: ISP clock
>       - description: ISP AXI clock
>       - description: ISP AHB clock
>       - description: ISP Pixel clock

And an if/then with { minItems: 4, maxItems: 4 }. Or really since
these are just different instances, just combine them into 1
conditional allowing 3 or 4 clocks.

There are lots of examples to follow in the tree.

Rob
