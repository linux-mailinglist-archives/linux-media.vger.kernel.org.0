Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F1A436D04
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbhJUVst (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbhJUVst (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:48:49 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABEFC061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:46:32 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id i189so2881432ioa.1
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kc0Q2AXLDg2T+KOyPSEX1P92qPWBea6g7TaV2FGp2GI=;
        b=SsNjDis5wUwZ6QhhhLYhdu0/kwdIW7pFJGy7OLv5pLm5uznWYkRBhuywzTYlUyEftM
         yVAB1P9NROI7YyixBTuOA5Fiuv4WpTyx5BvBfXY3MTjypcRRaI4dU0RSPu5ZT+aldqJt
         wAnNkuPKwBgHcGLTkZu4nuP1YiXYsehAFs6ZTnwU1ng3hw5gRTQpf+v/BAwmd3Y9YnFy
         K3oU/43aGGgLjScpz3wnmbY/Bwgcx3u78mH9YP6rcTapc8rdqODomAw0PfAXK8Q1dR7R
         MZ0RM94tclUV9CrvcOCWrZITVznoCSpzWDVcvWYesyEdjQGKVuwmfmlz0hKULw7LsdBt
         OMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kc0Q2AXLDg2T+KOyPSEX1P92qPWBea6g7TaV2FGp2GI=;
        b=VIdjHFYbd5cn0XM9Xn7bWR7tPurkeH6X4wJnI8EU672C1nv+qkilDYJuY55WtiZNZb
         Yi3plXflRdOiiYa8QOMGKuaGpVS0OqfgOuNAUrLlm5fRycWE5OFnK+D1Waln7sWAPfgm
         B1CPwWFyXNB7sxq1TprlQz8zfHfJz/oRcFuLNJ84OlGv+1bWO0AEbyUnjlvPxPHwqa4Z
         tYsxYddTXFQJNtiZ2gYjazKneeQEQJfP5IK+eyVO0Dd1yTU2SOJsWTNQ1Jlyjqvq8xnN
         MLQSm2uLli/MeRsgD6gwYvtKPgmue3Fb8tbEjsVobKafHQX4s688VWcrj8Vur8VYovjh
         FbYw==
X-Gm-Message-State: AOAM532NSsz/OBvuDiIDF43bJ5mz6BJazlsHmXkuYQlgGdQxpE5abLCD
        ZzGRXaiofcHOS56wtJ3gK8BGNpx1q9cTc2t6W2Q=
X-Google-Smtp-Source: ABdhPJwXFtMZt/HqK+AubxgVkucfsZF9rCibOMnQ0A8TPWHrhs3Tjo9xlgpsJN810CTJYGZ9lFxNp4oxerdLfTFfaj4=
X-Received: by 2002:a5e:dd46:: with SMTP id u6mr5855183iop.217.1634852791690;
 Thu, 21 Oct 2021 14:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <126f13fc-1d37-8bef-3411-4553864fe5be@xs4all.nl> <dd8d7e0c-3f56-433d-a075-8e290ca2520a@xs4all.nl>
In-Reply-To: <dd8d7e0c-3f56-433d-a075-8e290ca2520a@xs4all.nl>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Fri, 22 Oct 2021 05:45:55 +0800
Message-ID: <CAL9mu0Lkm9KiX0rPFmbP9R8fHtcT8z8u+wr721vrGvCXEEvTHw@mail.gmail.com>
Subject: Re: [GIT PULL FOR v5.16] Add support for DMA2D of STMicroelectronics
 STM32 Soc series
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Thu, 21 Oct 2021 at 22:57, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> I'll make a new PR for this without the clk patch.

Sure.

>
> Sorry Dillon, after digging a bit more into the clk series I think that this
> should go to the CLK subsystem. I do not feel comfortable merging that patch
> via the media subsystem because: 1) from what I can see it is part of a larger
> unmerged patch series, and 2) I do not have the expertise to tell if this is
> correct or not to just merge this patch.

That's fine thanks, there is no reason for clk patch not to be merged
via clk subsystem.
I can follow up on clk and dts patches, thanks for quick response on
my media driver review.

Best Regards
Dillon

>
> Regards,
>
>         Hans
>
> On 21/10/2021 16:45, Hans Verkuil wrote:
> > The following changes since commit 57c3b9f55ba875a6f6295fa59f0bdc0a01c544f8:
> >
> >   media: venus: core: Add sdm660 DT compatible and resource struct (2021-10-21 14:26:19 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16k
> >
> > for you to fetch changes up to b019395c863f436adb30237b50f22b027bec7351:
> >
> >   media: stm32-dma2d: STM32 DMA2D driver (2021-10-21 16:14:57 +0200)
> >
> > ----------------------------------------------------------------
> > Tag branch
> >
> > ----------------------------------------------------------------
> > Dillon Min (8):
> >       media: admin-guide: add stm32-dma2d description
> >       media: dt-bindings: media: add document for STM32 DMA2d bindings
> >       media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu platform
> >       media: videobuf2: Fix the size printk format
> >       media: v4l2-ctrls: Add V4L2_CID_COLORFX_CBCR max setting
> >       media: v4l2-ctrls: Add RGB color effects control
> >       clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after system enter shell
> >       media: stm32-dma2d: STM32 DMA2D driver
> >
> >  Documentation/admin-guide/media/platform-cardlist.rst       |   1 +
> >  Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml |  71 +++++
> >  Documentation/userspace-api/media/v4l/control.rst           |   9 +
> >  drivers/clk/clk-stm32f4.c                                   |   4 -
> >  drivers/media/common/videobuf2/videobuf2-dma-contig.c       |   8 +-
> >  drivers/media/platform/Kconfig                              |  11 +
> >  drivers/media/platform/Makefile                             |   1 +
> >  drivers/media/platform/stm32/Makefile                       |   2 +
> >  drivers/media/platform/stm32/dma2d/dma2d-hw.c               | 143 ++++++++++
> >  drivers/media/platform/stm32/dma2d/dma2d-regs.h             | 113 ++++++++
> >  drivers/media/platform/stm32/dma2d/dma2d.c                  | 739 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  drivers/media/platform/stm32/dma2d/dma2d.h                  | 135 ++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c                   |  12 +-
> >  drivers/media/v4l2-core/v4l2-mem2mem.c                      |  21 ++
> >  include/media/v4l2-mem2mem.h                                |   5 +
> >  include/uapi/linux/v4l2-controls.h                          |   4 +-
> >  16 files changed, 1268 insertions(+), 11 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
> >  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-hw.c
> >  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-regs.h
> >  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.c
> >  create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.h
> >
>
