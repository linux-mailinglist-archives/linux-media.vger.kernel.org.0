Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD7785802AE
	for <lists+linux-media@lfdr.de>; Mon, 25 Jul 2022 18:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236086AbiGYQ3b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jul 2022 12:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbiGYQ3a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jul 2022 12:29:30 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A251C93D
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 09:29:27 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id f15so6208522edc.4
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C7F63YfqSElTKH6vhYb8WCgwhCzeeugfwAKRk2UaFis=;
        b=ZNjqPIarAp4UgnVWPjpK4U0VWutd5PZe++WcmJ4sPcpfw1lln2kn3iNO0oaEjD+iMS
         3AZZC/eV3ukNtMAVPr3F9bCoJI4x6o9uWjJlpuLJ8djT2NzCUiqjBz8ACJqJ9CKu3Kb3
         B8mBNRCwLO67+jEj3aF8INRpux6UxauSA0zYbZYMF6R17qWuk9CThgnHPrdEHHAjsBJ7
         0gCrcX5rr4JYgb/iSLOKHtV399uUDle4AS9rHLBdPHC/jjdEFZbNE5U7CZBiCQleNsjb
         oxoSH4wjh6txrNmEdLRpDeaitDKAkBF7j5RrbPpbccJR0IrIyMyVwWKrJvXJkMB6kPX/
         q3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C7F63YfqSElTKH6vhYb8WCgwhCzeeugfwAKRk2UaFis=;
        b=D6aB7D9azWJEs28MU+2lA0obzRjGek0lHcZhDyqMfWDzcei6fhMqesD6S/Evi6+mhP
         ydeGSAmZHbFaFouIVL1WgPUQKjmjr4TdhpWz+dADs/tNfR0qoAXkOxrh23wBeZ+b+mNM
         YNwjebZcHUbd3Q2HgU1jwY1VGp5w4ndk8D3jCTsueaffhbLJ/HLSC1VfZKZ2p/g9ywRB
         wiocsiu/R/Q8B34tnKz4a/3nG77SfMB5w/nwKcPXnghWzG420ll16sXARW90OJdodNh5
         BN5Et6c3k9m8zLb8CqD1GITR3TuD0ikuD7xRnTAVU+NS8x+XkasDVhE0iKEh+4476i9a
         MUjw==
X-Gm-Message-State: AJIora9NX7W/pLG9fUQWIxxxQLYTbb1UOdO25jKg5YwGxVEM8jwnYyFz
        LeMeTIg9Coch49REs/2+0OcZJW1fake5+zdXHwSx3w==
X-Google-Smtp-Source: AGRyM1sfFHfiyXyI1PRrm0pqMoNzo1OT79L5DayUQB4W3Z03Vhq3fvixU/ny5bzLWyonj33wuRZwdjFiF4POWuFcxOY=
X-Received: by 2002:a05:6402:3492:b0:43a:d1f0:978e with SMTP id
 v18-20020a056402349200b0043ad1f0978emr14456065edc.306.1658766566375; Mon, 25
 Jul 2022 09:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220214212955.1178947-1-piotr.oniszczuk@gmail.com>
 <20220214212955.1178947-2-piotr.oniszczuk@gmail.com> <YjcgC9HZeDQX1sNJ@eze-laptop>
In-Reply-To: <YjcgC9HZeDQX1sNJ@eze-laptop>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Mon, 25 Jul 2022 13:29:15 -0300
Message-ID: <CAAEAJfAo9Onyxesxm37V=YWp6YNm+QWDeF-evfg9sFzm7uRrzg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add VPU support for RK3568/RK3566
To:     Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc:     linux-media@vger.kernel.org, Linux-rockchip@lists.infradead.org,
        heiko@sntech.de, hverkuil@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

On Sun, Mar 20, 2022 at 9:37 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> On Mon, Feb 14, 2022 at 10:29:54PM +0100, Piotr Oniszczuk wrote:
> > From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
> >
> > RK356x has Hantro G1 video decoder capable to decode MPEG2/H.264/VP8
> > video formats.
> >
> > This patch enables RK356x video decoder in RK356x device-tree
> > include.
> >
> > Tested on [1] with FFmpeg v4l2_request code taken from [2]
> > with MPEG2, H.642 and VP8 samples with results [3].
> >
> > [1] https://github.com/warpme/minimyth2
> > [2] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch
> > [3] https://github.com/warpme/minimyth2/blob/master/video-test-summary.txt
> >
> > Signed-off-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>

Looks like this slipped thru the cracks.

Any chance it gets queued?

Thanks,
Ezequiel

> Thanks,
> Ezequiel
>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > index a68033a23975..33ecaafa8cb7 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > @@ -390,6 +390,26 @@ power-domain@RK3568_PD_RKVENC {
> >               };
> >       };
> >
> > +     vpu: video-codec@fdea0400 {
> > +             compatible = "rockchip,rk3568-vpu";
> > +             reg = <0x0 0xfdea0000 0x0 0x800>;
> > +             interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> > +             clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
> > +             clock-names = "aclk", "hclk";
> > +             iommus = <&vdpu_mmu>;
> > +             power-domains = <&power RK3568_PD_VPU>;
> > +     };
> > +
> > +     vdpu_mmu: iommu@fdea0800 {
> > +             compatible = "rockchip,rk3568-iommu";
> > +             reg = <0x0 0xfdea0800 0x0 0x40>;
> > +             interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> > +             clock-names = "aclk", "iface";
> > +             clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
> > +             power-domains = <&power RK3568_PD_VPU>;
> > +             #iommu-cells = <0>;
> > +     };
> > +
> >       sdmmc2: mmc@fe000000 {
> >               compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
> >               reg = <0x0 0xfe000000 0x0 0x4000>;
> > --
> > 2.29.2
> >
