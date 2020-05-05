Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A39C1C53CB
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 12:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgEEK5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 06:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725766AbgEEK5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 06:57:48 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF4DC061A0F
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 03:57:48 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id j26so1280467ots.0
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 03:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rYaXwyEfmPRkFeJ3OORfvTZ/OICVnX3worjoTi0OC0s=;
        b=CWJyC7yNz6EjYpl5/blVNh0bFi+Q0ITE876DuGgsLHT7qkBu4cDnDpOER/Ij+heDeq
         gmd8nzYRwn+BKUIF3XxH7qOUaZ0iGtvCSlkLz+QGduaknAW9Mqqvq4JBx5bOqbaRJiCK
         xWKmi8TqSP5AWZ6YCyqrfHmTwMULvJpuxcQ2NYMOtbGRug+YUmkOZPQ9Th4wY6n/bf9N
         J5E7DADNP0A9q12L40Znael1vnkgFrsQe8gLa9zlDyob65RXqeft59cgXI9fFbrs+vzc
         VyiF5PYCUIwlkiFwEIFJ141zTWU5kdAiNN6451GOS1g/8nFc6nDXujIZSA2ErUOAaQRm
         yPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rYaXwyEfmPRkFeJ3OORfvTZ/OICVnX3worjoTi0OC0s=;
        b=Q5hgt1Jdy7kSGID/IBU7EKhOcP5Ptlpqw0Gndhu30MdY/0aoW+KAqgOpEMdgBsMuWU
         aeV/fjgM9YZGe/CPcjKufPWN7IQ2KW6tYKzkXQyprOY3pW/ZC7N3aUvxMgVcAPmN7cHY
         /6kVa+G9+N3qLvegAH9578oqsrfojHVW82cCi8vofBHQ0CbJYzdBMyaNjnqNFoxUyWwN
         M92Az3sZ3Y/5EWfXLqO9p4vszRiwQyF5znXJ6QgfACAw9zOTvutGivwTbGnYyNsUGo36
         UtNSXVo+Eb1ZLtn8GN5p/3YPWiZ8UaZo29IBQs3Uci/Ip7Q1SBG7ucpz1vHRrD/1FpMk
         F1Wg==
X-Gm-Message-State: AGi0Pubo5E319gutUfeI89WAncq1Mk4t/+EKFV4vBtAzLQV+cIueocfj
        AfsAlU8IVzG2bZMnmTMZheUoYKw98jwxuYdG73dUdg==
X-Google-Smtp-Source: APiQypIuqDC3J1KLtjefUHJij8UHI+SMsp4JWpboHCwPw45f4D+CgBtQ1GdnEaej3GRn9b5PiGg8Qp1XPgAaiTnwMO0=
X-Received: by 2002:a9d:51cc:: with SMTP id d12mr1791267oth.70.1588676267856;
 Tue, 05 May 2020 03:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-30-laurent.pinchart@ideasonboard.com>
 <00cc89e24aa5c3d4286b6f42347aa87e7699c4e5.camel@suse.de> <7cbd4185-0d26-aa26-3f7a-56b5b13e5336@raspberrypi.com>
 <09a896b78b42d2c78ed3ad468de7e90163b9d6c4.camel@suse.de>
In-Reply-To: <09a896b78b42d2c78ed3ad468de7e90163b9d6c4.camel@suse.de>
From:   Phil Elwell <phil@raspberrypi.com>
Date:   Tue, 5 May 2020 11:57:37 +0100
Message-ID: <CAMEGJJ1qT1Kup4BAg_48Pk=zYKQTXV9A-2ZThDd5YJyQvSRzjw@mail.gmail.com>
Subject: Re: [PATCH v2 29/34] staging: vchiq: Add 36-bit address support
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Tue, 5 May 2020 at 11:13, Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> On Mon, 2020-05-04 at 21:46 +0100, Phil Elwell wrote:
> > Hi Nicolas,
> >
> > On 04/05/2020 18:40, Nicolas Saenz Julienne wrote:
> > > Hi Phil, Laurent,
> > >
> > > On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
> > > > From: Phil Elwell <phil@raspberrypi.org>
> > > >
> > > > Conditional on a new compatible string, change the pagelist encoding
> > > > such that the top 24 bits are the pfn, leaving 8 bits for run length
> > > > (-1).
> > > >
> > > > Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > >   .../interface/vchiq_arm/vchiq_2835_arm.c      | 88 ++++++++++++++-----
> > > >   .../interface/vchiq_arm/vchiq_arm.c           |  6 ++
> > > >   .../interface/vchiq_arm/vchiq_arm.h           |  1 +
> > > >   3 files changed, 74 insertions(+), 21 deletions(-)
> > > >
> > > > diff --git
> > > > a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
> > > > b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
> > > > index 3e422a7eb3f1..ecec84ad4345 100644
> > > > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
> > > > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
> > > > @@ -16,6 +16,8 @@
> > > >   #include <soc/bcm2835/raspberrypi-firmware.h>
> > > >     #define TOTAL_SLOTS (VCHIQ_SLOT_ZERO_SLOTS + 2 * 32)
> > > > +#define VC_SAFE(x) (g_use_36bit_addrs ? ((u32)(x) | 0xc0000000) :
> > > > (u32)(x))
> > > > +#define IS_VC_SAFE(x) (g_use_36bit_addrs ? !((x) & ~0x3fffffffull) : 1)
> > >
> > > As I commented earlier, this is a sign your dma-ranges are wrong, most of
> > > the
> > > code below reimplements what is already done by dma-direct (see
> > > kernel/dma/direct.c). Once properly setup, you should be able to use
> > > whatever
> > > phys address dmam_alloc_coherent() provides and drop g_use_36bit_addrs.
> > >
> > > Note that on arm32+LPAE, dma-direct/swiotlb are the default dma_ops, so this
> > > also applies there.
> >
> > As I explained in an offline email, the problem is that VCHIQ needs access to
>
> We discussed this privately, but I wanted to start from scratch, specially as I
> hope I won't be the only one reviewing this :).
>
> > two
> > kinds of "DMA" addresses - those suitable for the 40-bit DMA channel, and the
> > 30-bit addresses that the VPU can use. Since each DT node only has access to a
> > single set of DMA ranges, I can't see how to use dma-direct to calculate
> > addreses
> > for everything, but feel free to submit an alternative implementation showing
> > how
> > it should be done.
>
> How about this):
>  - Move vchiq to /soc
>  - Get a handle to the relevant dma controller device pointer (so 30-bit DMA
>    controller on old RPis, 40-bit on RPi4)
>  - Allocate slotmem/pagelist with dma_alloc_coherent(vpu_dev, ...)
>  - Map pages with dma_map_sg(dma_dev, ...)
>
> I hope I'm not missing anything, but short of implementing it and seeing the
> end result, I think you'd be free of any rpi[1-3]/rpi4 distinction in the code.

Thanks for the suggestion - I hadn't considered using a device pointer
for the controller rather than the current (client) device. If that
works then I propose
to make the 40-bit dma property optional such that dma_dev defaults to
vpu_dev.

Phil
