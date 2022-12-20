Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE3465298B
	for <lists+linux-media@lfdr.de>; Wed, 21 Dec 2022 00:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbiLTXAX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Dec 2022 18:00:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234143AbiLTXAS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Dec 2022 18:00:18 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3374F1FCCC
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 15:00:11 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id fy4so13980186pjb.0
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 15:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SXFko1xtONuCxW9FHl6Ru3DvvHYe7MXMs4fNYOQ+UJA=;
        b=XCCmjxUb0bnB5Op9H7u6DDhnpl2ANmF7V9S6APusb7YSEtzIj//YKuzT5NwmCNjKH8
         BMNE0aPGU2JGfJVnda7CN5Sa5/LXP/8eRpQs+KM3BmvuBceZyesmmZ2lTztVnv+ilKrM
         8e8A9YVmu/+vrcik8UyE96UDDzx2mLGaFTtAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXFko1xtONuCxW9FHl6Ru3DvvHYe7MXMs4fNYOQ+UJA=;
        b=tmSEFPz7ys/sEU5RaO1DRNfk8WcnJseYtZoRRhWl0iHbO3CISK+DwvbnSlu5UvIVAn
         wTWr2N/Yov++p/7oHFjO7RB/TTGkmIXPAQ6bq15JAaTSYmHSRM4OXFk6mSpbF29PAZM3
         Io19EQyWpDcbmYpCkidp8o7CDrv+divCuqYS4SVnmX1WrP+p93qlm+qLClgKQWEZXhid
         kJ/z4wyYPqn8o1SLf/hMzlKymXZ5RpDz/dEbzy6QIIjJu1n1qLtHPRaX93tJ2Rl7CptD
         YydAYU04XrgQR2fB5QT89AGyNi36RSuOsdwnfAgfB8b0im07oFogaDsiCTf6tnT8lyIH
         GxhQ==
X-Gm-Message-State: ANoB5pk9ESu1OWDy4PNN9v6dJir+WbNr1mhLHT3KmM0whAn1VzdTCz8l
        sE/HSoWbReBNhO9ehNlRAYnIW3euDrvqcDrRCvE=
X-Google-Smtp-Source: AA0mqf44QvNjCLdrsA2BbnLL/be+v+Q4/kO1+2sQ0W/cKDm2tCG3A0QoM4h/+INbZNjahcqq9850gA==
X-Received: by 2002:a17:90b:310f:b0:219:d84:4446 with SMTP id gc15-20020a17090b310f00b002190d844446mr49051478pjb.26.1671577210377;
        Tue, 20 Dec 2022 15:00:10 -0800 (PST)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id z10-20020a17090a8b8a00b002132f3e71c6sm40034pjn.52.2022.12.20.15.00.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 15:00:07 -0800 (PST)
Received: by mail-pj1-f48.google.com with SMTP id v23so8693261pju.3
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 15:00:06 -0800 (PST)
X-Received: by 2002:a17:902:8a98:b0:189:d081:1ebb with SMTP id
 p24-20020a1709028a9800b00189d0811ebbmr22206579plo.130.1671577204406; Tue, 20
 Dec 2022 15:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20221214-uvc-status-alloc-v2-0-3f1cba6fc734@chromium.org>
 <Y5p1DVWXuYSzkRO4@google.com> <CANiDSCtQFR-CPNXu-hqM_11DogMTvdhK9xWy7cZyd7vwZAMBSQ@mail.gmail.com>
 <Y5rj9GhQuyNbNnDw@pendragon.ideasonboard.com> <Y5rkzAESkLt/u6kP@pendragon.ideasonboard.com>
 <20221215114540.00001f9f@Huawei.com>
In-Reply-To: <20221215114540.00001f9f@Huawei.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 20 Dec 2022 23:59:53 +0100
X-Gmail-Original-Message-ID: <CANiDSCtkxO_eAcmww31yoft6fSAHYTRyLyb+1d2MHnJJd+3Kbw@mail.gmail.com>
Message-ID: <CANiDSCtkxO_eAcmww31yoft6fSAHYTRyLyb+1d2MHnJJd+3Kbw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Do not alloc dev->status
To:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@chromium.org>,
        Ming Lei <tom.leiming@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Max Staudt <mstaudt@google.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonathan

On Thu, 15 Dec 2022 at 12:45, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Thu, 15 Dec 2022 11:11:40 +0200
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>
> > Hi Ricardo,
> >
> > On Thu, Dec 15, 2022 at 11:08:05AM +0200, Laurent Pinchart wrote:
> > > On Thu, Dec 15, 2022 at 08:59:14AM +0100, Ricardo Ribalda wrote:
> > > > On Thu, 15 Dec 2022 at 02:15, Sergey Senozhatsky wrote:
> > > > >
> > > > > On (22/12/14 14:37), Ricardo Ribalda wrote:
> > > > > [..]
> > > > > > +struct uvc_status_streaming {
> > > > > > +     u8      button;
> > > > > > +} __packed;
> > > > > > +
> > > > > > +struct uvc_status_control {
> > > > > > +     u8      bSelector;
> > > > > > +     u8      bAttribute;
> > > > > > +     u8      bValue[11];
> > > > > > +} __packed;
> > > > > > +
> > > > > > +struct uvc_status {
> > > > > > +     u8      bStatusType;
> > > > > > +     u8      bOriginator;
> > > > > > +     u8      bEvent;
> > > > > > +     union {
> > > > > > +             struct uvc_status_control control;
> > > > > > +             struct uvc_status_streaming streaming;
> > > > > > +     };
> > > > > > +} __packed;
> > > > > > +
> > > > > >  struct uvc_device {
> > > > > >       struct usb_device *udev;
> > > > > >       struct usb_interface *intf;
> > > > > > @@ -559,7 +579,7 @@ struct uvc_device {
> > > > > >       /* Status Interrupt Endpoint */
> > > > > >       struct usb_host_endpoint *int_ep;
> > > > > >       struct urb *int_urb;
> > > > > > -     u8 *status;
> > > > > > +
> > > > > >       struct input_dev *input;
> > > > > >       char input_phys[64];
> > > > > >
> > > > > > @@ -572,6 +592,12 @@ struct uvc_device {
> > > > > >       } async_ctrl;
> > > > > >
> > > > > >       struct uvc_entity *gpio_unit;
> > > > > > +
> > > > > > +     /*
> > > > > > +      * Ensure that status is aligned, making it safe to use with
> > > > > > +      * non-coherent DMA.
> > > > > > +      */
> > > > > > +     struct uvc_status status __aligned(ARCH_KMALLOC_MINALIGN);
> > > > >
> > > > >         ____cacheline_aligned ?
> > > > >
> > > > > I don't see anyone using ARCH_KMALLOC_MINALIGN except for slab.h
> > > >
> > > > Seems like cacheline is not good enough:
> > > >
> > > > https://github.com/torvalds/linux/commit/12c4efe3509b8018e76ea3ebda8227cb53bf5887
> > > > https://lore.kernel.org/all/20220405135758.774016-1-catalin.marinas@arm.com/
> > > >
> > > > and ARCH_KMALLOC_MINALIGN is what we have today and is working...
> > > >
> > > > But yeah, the name for that define is not the nicest :)
> > > >
> > > > I added Jonathan Cameron, on cc, as he had to deal with something
> > > > similar for iio in case we are missing something
> > >
> > > I'd like to get feedback on this from DMA and USB experts. Expanding the
> > > CC list of the original patch would help (especially including the
> > > linux-usb mailing list).
> >
> > Also, do we need the allocation change ? It doesn't seem to simplify the
> > code that much, neither in terms of lines of code
> >
> > >  2 files changed, 48 insertions(+), 49 deletions(-)
> >
> > nor in terms of complexity. Maybe we could keep the union and offsetof
> > changes, and drop the allocation change ? In any case, those are two
> > different changes, so I'd split them in two patches at least.
> >
> > > > ps: and I thought this was an easy change :P
> >
> +CC Catalin who is driving effort to change what we should do here to avoid
> wasting space on systems where ARCH_KMALLOC_MINALIGN is currently 128 bytes.
>
> I don't know the precise requirements for this particular allocation, but
> if it's about ensuring the data doesn't share a cacheline with anything else in
> the structure then the problem is that ____cacheline_aligned is the
> size of a line in the L1 cache.  It's not uncommon for microarchitectures to have
> a larger cacheline size for L3 and above.  Most of the time that doesn't
> matter as they maintain correct coherence (all the ARM servers are fine
> I think - ours has 128 byte cachelines in L3, Fujitsu have parts with
> 256 byte cachelines in L3), but guess what, there are Qualcomm(?) parts where the
> L1 cacheline is 64 bytes, but the l3 cacheline is 128 bytes and don't
> deal with the hardware coherence issues. For those we need to ensure that
> a DMA safe buffer is in it's own 128 byte cacheline, but ___cacheline_aligned
> on arm64 only does 64 bytes.  Currently ARCH_KMALLOC_MINALIGN enforces the
> larger guarantee and is available on all architectures unlike
> ARCH_DMA_MINALIGN which is not yet.
>
> Catalin is working to replace this, so the required guarantees may change,
> but we still need something backportable.
>
> When I sent a bunch of fixes for Input Dmitry asked for a general
> ___dma_minalign (naming to be bikeshedded) define.  So far there are a few
> subsystems carrying their own local equivalent (IIO moved to
> IIO_DMA_MINALIGN define) in the interests of reducing the pain of
> changing this in future. A central definition is another option.
>

Thanks a lot for the explanation!

> Jonathan
>
>


-- 
Ricardo Ribalda
