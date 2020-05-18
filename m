Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF92C1D7A28
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 15:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgERNip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 09:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbgERNio (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 09:38:44 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55AF3C061A0C
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 06:38:44 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id y3so11950702wrt.1
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 06:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+oZdSSiomIyGI+8gZ792sIq+JJaq/oAP0cvheDCubGg=;
        b=D8g8q4/gWvgPNoiKgO9Wt+imzhkwD/a3RNB4EBPE8WYisGI8tx4dtABjoA/aNmtLYD
         xrGE9L/EcOciIVahsGldKA6ONh8dcx0Hi5Qb/tjsNVLry1nSJtwFHcw8aQBfz2a/g1x3
         dXriuW0HenwQBimzTLdK4HkU30dClfd3UoGI/3QIZVQQEMsVg8NcJ2FWZTQE7VINzrGJ
         o6jzAebMM8WO1ZZ1Io0Jbs7bU7vaHaoEh7o3kb/WHuSQ28NeFbU4wjPxqNf9SiVpj1IS
         LjTNPmsw2gmlQrUeQtsLDVDa6k7buEVfaly9Z9R3bDA9rg0y0XNboa94/db8E2v+X88N
         68Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+oZdSSiomIyGI+8gZ792sIq+JJaq/oAP0cvheDCubGg=;
        b=Bw5Jl2v1udkx6PyX3/l0IrBBN7xy6Ak3fovEB99rvDK0qFle4eWBgAjt8/i9fvCWQi
         g6r+7yETS6JFSO/n4JUUy+jBkAKUFhIdcCYCxNTVI1GI54ln9tVlGFW5nMvYPk6241kt
         qD4P8vWnCrgC0TxacwgfrxU6PJnfeK9WE195y2Z4sFAM5WLj5/pSFhKIKt1W4VzTFc4h
         Ws9m+1gNLD7qbPGAh93yWZzvIQf57YCVEeagkeQntBbRrYTBRrewUZIprLPSfg/Wm2Yk
         XRgfFHC05kAfLSVYDf9ifbtngYOF8DTqnV8T+8J5EEHq94Kc5i3PqSiPnx5tMIGgpWjo
         RCOg==
X-Gm-Message-State: AOAM531Gvxf/zrMA540hX1/lLjX+MHX7V+LEBVe1Xe5ZROYNGizIqYi/
        qBJLH+tDSQ7IvpHnTCxAUzL5Ou3xdDlG0216Z7ihNA==
X-Google-Smtp-Source: ABdhPJxag0Hc1I47rIy8yhYnObHwjykx1lAW9uerQk306WXHzh0nFy2CrhSpf2d7BU3KXWjAcJqXs1KfBs+BcPqqN7U=
X-Received: by 2002:a05:6000:1241:: with SMTP id j1mr19992729wrx.42.1589809123050;
 Mon, 18 May 2020 06:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-34-laurent.pinchart@ideasonboard.com> <8e45d7059c0f840e1661547a23103f3351c74622.camel@suse.de>
In-Reply-To: <8e45d7059c0f840e1661547a23103f3351c74622.camel@suse.de>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 18 May 2020 14:38:27 +0100
Message-ID: <CAPY8ntBaE-1n8PzG6hzBdDSBEqO7ZRz8Zj5byU3h=gvDGSfHvw@mail.gmail.com>
Subject: Re: [PATCH v2 33/34] staging: bcm2835-isp: Add support for BC2835 ISP
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicholas

Sorry for the slight delay in replying.

On Mon, 11 May 2020 at 20:19, Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Hi Naushir,
> a small comment.
>
> On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
> > From: Naushir Patuck <naush@raspberrypi.com>
> >
> > Port the V4L2 compatible driver for the ISP unit found on Broadcom BCM2835
> > chips.
> >
> > The driver interfaces though the VideoCore unit using the VCHIQ MMAL
> > interface.
> >
> > ISP driver upported from from RaspberryPi BSP at revision:
> > 6c3505be6c3e ("staging: vc04_services: isp: Make all references to
> > bcm2835_isp_fmt const")
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > [Adapt to staging by moving all modifications that in the BSP are scattered
> > in core components inside this directory]
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
>
> [...]
>
> > +static int bcm2835_isp_mmal_buf_cleanup(struct mmal_buffer *mmal_buf)
> > +{
> > +     mmal_vchi_buffer_cleanup(mmal_buf);
> > +
> > +     if (mmal_buf->dma_buf) {
> > +             dma_buf_put(mmal_buf->dma_buf);
> > +             mmal_buf->dma_buf = NULL;
>
> Why is this needed here, shouldn't this be mmal-vchi's responsibility? IIUC the
> original dma_buf_get() happens there too.

The original dma_buf_get is in bcm2835_isp_buf_prepare as it either
comes from a dma_buf_get(vb->planes[0].m.fd) for VB2_MEMORY_DMABUF
operations, or a vb2_core_expbuf_dmabuf for VB2_MEMORY_MMAP.
Seeing as the original "get" is in this calling code, it seemed
reasonable that the put is as well.

There are no get/put operations on dma-bufs (other than indirectly
through vc_sm_cma) within mmal-vchiq. You have the call
vc_sm_cma_import_dmabuf to take the external dma_buf and pull it into
vc_sm_cma, but that is the limit of it.

  Dave
