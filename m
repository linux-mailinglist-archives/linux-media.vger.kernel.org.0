Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E538C50F29C
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 09:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244157AbiDZHhW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 03:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344069AbiDZHhS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 03:37:18 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E49C133E70
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 00:34:06 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id m22-20020a056820051600b0033a41079257so3239124ooj.4
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 00:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ehkV6mnvrvV8SRKl9qJVoHX/FUhbl1B+R3BHH6VqTQ=;
        b=IFg5A0uJyXIlurj2BEpddgPQTCt+WAocY1pf0uopzmWUPh8MCSQAMMoWPJs/2IBMAV
         LbFa3qSXaY2O16ruF4Y4Pj+aVn9OFWLJypF6Skhbp+GmjZfQA4ZOC/532b9gfVO17bCG
         dxTdApJv9xHfEig22JVVq57zkc9d+KIn875Zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ehkV6mnvrvV8SRKl9qJVoHX/FUhbl1B+R3BHH6VqTQ=;
        b=zfbY53l/xeCHaMWO9wPt92IPOzcevR4INylFnRZJjFlXTAWZZFQEsjOvW2xINb+VaU
         hGApayqMK0qaO+vvIZWVeOjaZox5RsrPskn1MsTyK2mIXqhzLIZ/BSicTQUc6akBjsiK
         Mt4oTWZutpZL7kCYpvX4ABdKDxYVcLe4VlOYDM69VDXy+a3buaKOl9O30csKvNUjSLIx
         gU8kAWAtC3ACuK8PD5U+d4AKvDTqhrN+PnEfY5a1glmARzQQtmSsZynfK6911Q5jHh3G
         TPjTrsksz0kQVsdtBteq+/43C2+YGeg1UMSvIljT/D9IKCH5OYzkTYtviSdDQHZjU6zC
         2r5Q==
X-Gm-Message-State: AOAM532LWNUKCcu/XhzkKhGake7TmwNSDTuw5zC5I3HkIDWNHdEhZhJo
        rPf2XkvCj6PVie3V8Dp/Q4EpG9tBrUtvjYGi
X-Google-Smtp-Source: ABdhPJy5w1tjninYHuNUDA78AjjKqVlTOlQm0easb2g1z5CTPW2kS0f4GJepzStEOn+nBKTMxpQRnw==
X-Received: by 2002:a4a:aac2:0:b0:33a:4167:bc70 with SMTP id e2-20020a4aaac2000000b0033a4167bc70mr7695063oon.2.1650958445193;
        Tue, 26 Apr 2022 00:34:05 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id y22-20020a056870429600b000e686d13897sm542249oah.49.2022.04.26.00.34.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 00:34:03 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id r85so19774184oie.7
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 00:34:03 -0700 (PDT)
X-Received: by 2002:a05:6808:e88:b0:2fa:72da:55d4 with SMTP id
 k8-20020a0568080e8800b002fa72da55d4mr14275514oil.66.1650958442683; Tue, 26
 Apr 2022 00:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-14-laurent.pinchart@ideasonboard.com>
 <YmZ+89lToRXl4vFB@gmail.com> <Ymbxs2p9Tuf331qM@pendragon.ideasonboard.com>
In-Reply-To: <Ymbxs2p9Tuf331qM@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 26 Apr 2022 09:33:52 +0200
X-Gmail-Original-Message-ID: <CANiDSCvuWRfRDc7DhwESN_Z9+CCrQ_ofS=DZjMyV-=sojb=-Vw@mail.gmail.com>
Message-ID: <CANiDSCvuWRfRDc7DhwESN_Z9+CCrQ_ofS=DZjMyV-=sojb=-Vw@mail.gmail.com>
Subject: Re: [PATCH v4 13/21] media: rkisp1: Compile debugfs support conditionally
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 25 Apr 2022 at 21:08, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Mon, Apr 25, 2022 at 12:58:59PM +0200, Ricardo Ribalda wrote:
> > Laurent Pinchart wrote:
> >
> > > When CONFIG_DEBUGFS is disabled, there's no need to compile the debugfs
> > > support in. Make it conditional.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
> > > ---
> > > Changes since v3:
> > >
> > > - Fix double mention of rkisp1-debug.o in Makefile
> > > ---
> > >  .../media/platform/rockchip/rkisp1/Makefile    | 18 ++++++++++--------
> > >  .../platform/rockchip/rkisp1/rkisp1-common.h   |  9 +++++++++
> > >  2 files changed, 19 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/Makefile b/drivers/media/platform/rockchip/rkisp1/Makefile
> > > index 1a39bdcc608e..f7543a82aa10 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/Makefile
> > > +++ b/drivers/media/platform/rockchip/rkisp1/Makefile
> > > @@ -1,11 +1,13 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> >
> > Are you sure that this work when rockchip is built as module?
>
> I'm fairly confident it does, as I build the driver as a module :-)

I am not qualified to review Kconfig :)

Thanks :)

>
> > > +rockchip-isp1-y := rkisp1-capture.o \
> > > +              rkisp1-common.o \
> > > +              rkisp1-dev.o \
> > > +              rkisp1-isp.o \
> > > +              rkisp1-resizer.o \
> > > +              rkisp1-stats.o \
> > > +              rkisp1-params.o
> > > +
> > > +rockchip-isp1-$(CONFIG_DEBUG_FS) += rkisp1-debug.o
> > > +
> > >  obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1) += rockchip-isp1.o
> > > -rockchip-isp1-objs +=      rkisp1-capture.o \
> > > -                   rkisp1-common.o \
> > > -                   rkisp1-debug.o \
> > > -                   rkisp1-dev.o \
> > > -                   rkisp1-isp.o \
> > > -                   rkisp1-resizer.o \
> > > -                   rkisp1-stats.o \
> > > -                   rkisp1-params.o
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > index 07a92ed8bdc8..a7ffe2830fa8 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > @@ -518,7 +518,16 @@ void rkisp1_stats_unregister(struct rkisp1_device *rkisp1);
> > >  int rkisp1_params_register(struct rkisp1_device *rkisp1);
> > >  void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
> > >
> > > +#if IS_ENABLED(CONFIG_DEBUG_FS)
> > >  void rkisp1_debug_init(struct rkisp1_device *rkisp1);
> > >  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1);
> > > +#else
> > > +static inline void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> > > +{
> > > +}
> > > +static inline void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
> > > +{
> > > +}
> > > +#endif
> > >
> > >  #endif /* _RKISP1_COMMON_H */
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
