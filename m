Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32E7F64D775
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 08:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiLOH7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 02:59:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiLOH7b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 02:59:31 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D225639B
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 23:59:28 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso1984750pjt.0
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 23:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lSxO8ou6GO4FT/yd/HICNdU70IeeYH3TIIhe4/LAvlI=;
        b=WJGQp2gBu2jbpNzgrmJE9AMgSNBL6K/YN/0SddV+aWuFEACa+2Gp0CE0lPCyaohdmj
         j0RMujDDDyVQ/OPqTU7k46NnfhqoJBn9MagrRqxHnjMNU4hYQm4TG8yjpDOkpki+FCQf
         UMvZ2nWG6KjHSm9wUqE3I6lSmuY+Xofuua2/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSxO8ou6GO4FT/yd/HICNdU70IeeYH3TIIhe4/LAvlI=;
        b=no6d1990uLUA3Xw3jJMRzuMA/M4PYR4fngm/y868BPu+jDM+B0IYh2y/3WvvYI+ItW
         B4MkodcA2eW0PXs3mBst8c0X+KQkA1IyDHVTHTYT0wSq5bwmF1jaMWXfYvLVZVwsjwj/
         ijhe/8bT3rgmoYNqeIjTp/UYvbiH17WMIIitOCpDcPSANLXWgcoEUtmaw7BpDYgbGW0y
         WpXKsBMFPvo9JTRUp0Jt+YtMOKemzOJ+WMOC5NGhUbxlvxFbFeyLnLqwSir7knPRezdC
         25AOupntlN4cr4eLY8SV/mOHlaXgRvV5Lbrofp/34suGjYajXHvKFWl+wdy8w9wyPDGN
         Ju7g==
X-Gm-Message-State: ANoB5pn43lYoMeymw3V74je0EAmoX2z8z5g6eGLBBQyzV8asdda5l2IY
        Z+9XNkA06lMbXjZyLrcH1xG3pv2M4K6NES5wWVc=
X-Google-Smtp-Source: AA0mqf4eoOdHISoae63kO2sqldzD1I/+hABt0gPnrmNRcskNfxJZ9BD1YLdTqq9iMgXkEym8YTCCMQ==
X-Received: by 2002:a17:90b:3187:b0:219:b936:6bcf with SMTP id hc7-20020a17090b318700b00219b9366bcfmr28092248pjb.48.1671091167563;
        Wed, 14 Dec 2022 23:59:27 -0800 (PST)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090a5d1200b00218f830c63esm2597900pji.1.2022.12.14.23.59.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 23:59:26 -0800 (PST)
Received: by mail-pj1-f43.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so1907464pje.5
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 23:59:26 -0800 (PST)
X-Received: by 2002:a17:902:7d93:b0:186:9cf4:e53b with SMTP id
 a19-20020a1709027d9300b001869cf4e53bmr83379421plm.50.1671091165525; Wed, 14
 Dec 2022 23:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20221214-uvc-status-alloc-v2-0-3f1cba6fc734@chromium.org> <Y5p1DVWXuYSzkRO4@google.com>
In-Reply-To: <Y5p1DVWXuYSzkRO4@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 15 Dec 2022 08:59:14 +0100
X-Gmail-Original-Message-ID: <CANiDSCtQFR-CPNXu-hqM_11DogMTvdhK9xWy7cZyd7vwZAMBSQ@mail.gmail.com>
Message-ID: <CANiDSCtQFR-CPNXu-hqM_11DogMTvdhK9xWy7cZyd7vwZAMBSQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Do not alloc dev->status
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Yunke Cao <yunkec@chromium.org>, Ming Lei <tom.leiming@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Max Staudt <mstaudt@google.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey

Thanks for looking into this

On Thu, 15 Dec 2022 at 02:15, Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (22/12/14 14:37), Ricardo Ribalda wrote:
> [..]
> > +struct uvc_status_streaming {
> > +     u8      button;
> > +} __packed;
> > +
> > +struct uvc_status_control {
> > +     u8      bSelector;
> > +     u8      bAttribute;
> > +     u8      bValue[11];
> > +} __packed;
> > +
> > +struct uvc_status {
> > +     u8      bStatusType;
> > +     u8      bOriginator;
> > +     u8      bEvent;
> > +     union {
> > +             struct uvc_status_control control;
> > +             struct uvc_status_streaming streaming;
> > +     };
> > +} __packed;
> > +
> >  struct uvc_device {
> >       struct usb_device *udev;
> >       struct usb_interface *intf;
> > @@ -559,7 +579,7 @@ struct uvc_device {
> >       /* Status Interrupt Endpoint */
> >       struct usb_host_endpoint *int_ep;
> >       struct urb *int_urb;
> > -     u8 *status;
> > +
> >       struct input_dev *input;
> >       char input_phys[64];
> >
> > @@ -572,6 +592,12 @@ struct uvc_device {
> >       } async_ctrl;
> >
> >       struct uvc_entity *gpio_unit;
> > +
> > +     /*
> > +      * Ensure that status is aligned, making it safe to use with
> > +      * non-coherent DMA.
> > +      */
> > +     struct uvc_status status __aligned(ARCH_KMALLOC_MINALIGN);
>
>         ____cacheline_aligned ?
>
> I don't see anyone using ARCH_KMALLOC_MINALIGN except for slab.h

Seems like cacheline is not good enough:

https://github.com/torvalds/linux/commit/12c4efe3509b8018e76ea3ebda8227cb53bf5887
https://lore.kernel.org/all/20220405135758.774016-1-catalin.marinas@arm.com/

and ARCH_KMALLOC_MINALIGN is what we have today and is working...

But yeah, the name for that define is not the nicest :)

I added Jonathan Cameron, on cc, as he had to deal with something
similar for iio in case we are missing something


ps: and I thought this was an easy change :P

-- 
Ricardo Ribalda
