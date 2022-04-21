Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82EAE509E57
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 13:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388745AbiDULQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 07:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388755AbiDULQR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 07:16:17 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B5B2E9E6
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 04:13:24 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id g18so9260280ejc.10
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SUZ3fmbbA3bW+6zlBXPCxl05NBgb1lVxlBnVpWEBW8Y=;
        b=165sJL8oUoSSjr0w3OKtQLsIzRyJtxgQO7Ej8MD0RONhhe+wZvJoWARDnarA4pE5mW
         dxDv0NfSmc6XUShEeeSHLi/lcyDpEbgzRQp3UJESdvpkp+HXkemP7mJMWFAADnC6BmiH
         1yMwmIVTl6zGW5nXLjhvh2ESkuxc6FbbP/+VFTb+EBxfBtso8BTnBMTq4m1nXMvn1/EB
         o35K8aowKfLNe5bAqe7tJ/jO8DpoApgR5pkX/lTugxb46tgc9moGS69SYERptJgDTRbV
         Rsi+E8ivE2xlMFgN4vAUEenD8Gp+Kur8tqosOY3liV1O4YkrTvO2+fb8i5qB8uvNFYqO
         0tZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SUZ3fmbbA3bW+6zlBXPCxl05NBgb1lVxlBnVpWEBW8Y=;
        b=Si6W0qiB1pYDtl6x9qzZQxMbFx0I3qA+2SXUArT8QncwTeDtUyXqcHyEM3ZUU0UR5k
         sNvug7umMCc1IwekCwy25B/T0ZW6qeYWEDkw/G3vt12Mz4mWySeZs24wNI477139XGQw
         K90c2yl5MnQbd63KhG41n/QQZZdCTOdbU6OPc1nuEEwc/BbhJCNLK4zfhferGL5DmU9q
         /zY+KuEB1LrtoLjHZzGG05hBAEWqEqM8bG2Xx+huQYdhOu58sqJOwxkilLlYMthsaB4y
         3V2RnjyKq+KAr9w7z6S0rjy1BYy0O6b07Uyi6PdZMo7sVzsBq8WCmEdCbI3aAGvrfoKT
         n+9w==
X-Gm-Message-State: AOAM5311deznbMYSHS/pt0YRifJEHVRASiinkd0MV7wE1wACl8glFlfo
        oOP1DNl/I9RK0OlPKXrt07khBDA69ohGoA0SQA8sSA==
X-Google-Smtp-Source: ABdhPJwYj4HYIF7yTu7IcNHJEvCknc1WCtKnvOQbaKxO1PFNL7fkQ1E6VSwYW8S5yMxMaQ5lM86zEwR0ovbipUvw0xo=
X-Received: by 2002:a17:907:2a53:b0:6ce:e4fe:3f92 with SMTP id
 fe19-20020a1709072a5300b006cee4fe3f92mr22534469ejc.389.1650539603270; Thu, 21
 Apr 2022 04:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220214212955.1178947-1-piotr.oniszczuk@gmail.com>
 <20220214212955.1178947-3-piotr.oniszczuk@gmail.com> <YjcgflUuQlFbVM/1@eze-laptop>
In-Reply-To: <YjcgflUuQlFbVM/1@eze-laptop>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 21 Apr 2022 08:13:11 -0300
Message-ID: <CAAEAJfAh60QB4JvtR8WfsykRit7RqE=XZ290u8jBOQ-7y7+P7g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: media: rockchip-vpu: Add RK3568 compatible
To:     Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <Linux-rockchip@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sun, Mar 20, 2022 at 9:39 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi Piotr,
>
> On Mon, Feb 14, 2022 at 10:29:55PM +0100, Piotr Oniszczuk wrote:
> > From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
> >
> > RK356x has Hantro G1 video decoder capable to decode MPEG2/H.264/VP8
> > video formats.
> >
> > This patch adds RK3568 compatible in rockchip-vpu dt-bindings.
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
> This dt-binding change looks trivial, so I guess it's fine
> taking it directly via the media tree?
>

I believe this series is ready for you to review.

Thanks!
Ezequiel

> Thanks,
> Ezequiel
>
> > ---
> >  Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> > index bacb60a34989..6cc4d3e5a61d 100644
> > --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> > +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> > @@ -23,6 +23,7 @@ properties:
> >            - rockchip,rk3328-vpu
> >            - rockchip,rk3399-vpu
> >            - rockchip,px30-vpu
> > +          - rockchip,rk3568-vpu
> >        - items:
> >            - const: rockchip,rk3188-vpu
> >            - const: rockchip,rk3066-vpu
> > --
> > 2.29.2
> >
