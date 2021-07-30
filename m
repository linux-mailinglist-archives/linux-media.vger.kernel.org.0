Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C70D3DBCB1
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 17:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhG3P4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 11:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhG3P4j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 11:56:39 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09209C06175F
        for <linux-media@vger.kernel.org>; Fri, 30 Jul 2021 08:56:34 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id x3so9851559qkl.6
        for <linux-media@vger.kernel.org>; Fri, 30 Jul 2021 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lJyqybyykZ9+8P9xpv1Ln9U9yvdCp0w+3oToStgL17c=;
        b=lAkuOCN53GNn/pv8m1vXQ9cfhqKtLsq8C1nRqhX1DwrL6ISx1XNWesoHVy9x97bTvV
         PtILti3hwWJh8jT02Mqah8HBBd+ycValurg9NGd4JMVZN5aHa3Ucyhbw0x/cAKwEtwox
         ZmGbyAwp8AJK1hVQdGTzNxBIA/0dsyxisgr3k8GyvPKeNGYBcq5kJJ7E1MuIBhvvphoe
         0Ha0KyHzdd3PUe3lIUTcz2dz0NldN8eJ3tYyyxsgZgxUiGkakEwmQCkRkbtL+jDoJA7U
         CibmtWIyniDrwsIjIMu/R1m3tSk4KgVGOPFDQCB3GWRpwIKB0AwByXMBe9lmvudCXD6a
         flmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lJyqybyykZ9+8P9xpv1Ln9U9yvdCp0w+3oToStgL17c=;
        b=EV0YZDFTMY4aBkK1KMiUlpCB1NNnYLXGnfoWtb9lT78FBLF6YNysEIl7GdQPbKYxcn
         sslsk1sCUxsa7o+rB1Acdr92dV1wqu+IyprZhdjPCLfkbS3f11Zr1/BGXiIGHtMe/twE
         t/8AQy+lfHtzHqsr8UCAjuxdO0ZNoNmYezfBR8AOoN/Luba0uU0W/X5wc0ybUDSHbeMh
         4wzmtAUZ4RiS1/bhfq+R3Vn3QgfrXCRwQ6EWXDFs+5e4bVk2BofqxKKKvCqZa5ktIj0n
         ZeR7w2BUu+swE0vdRjS5dVqw0p6NjHFFUx28dn5tKtOFun+r3/fZFsdPYsV0Jo11Da4T
         4UZg==
X-Gm-Message-State: AOAM533m+7LKKigeqMwqyEanpTaDpHWX3/7Uxwx7jJZxK5r6U2ENfKg8
        XxmMS1ygbi8n71qivcEsaB/wpA==
X-Google-Smtp-Source: ABdhPJyW4sp87JHptomucR3dGUjz2MmwhbfiEZ6B0BG2+0FYgzi5tMbIWve1Zj8N7zIqwGFfHRGvSA==
X-Received: by 2002:a05:620a:911:: with SMTP id v17mr2950146qkv.458.1627660593235;
        Fri, 30 Jul 2021 08:56:33 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id v4sm1071359qkf.52.2021.07.30.08.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 08:56:32 -0700 (PDT)
Message-ID: <936864e265155faa3e79780301d276b5f3be699a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: vimc: Add support for contiguous DMA buffers
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Date:   Fri, 30 Jul 2021 11:56:31 -0400
In-Reply-To: <YQP6aILfBDLhSFUt@pendragon.ideasonboard.com>
References: <20210730001939.30769-1-laurent.pinchart+renesas@ideasonboard.com>
         <40a1fed8-456e-97c5-9aa7-715a4a4c816b@collabora.com>
         <YQP6aILfBDLhSFUt@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 30 juillet 2021 à 16:11 +0300, Laurent Pinchart a écrit :
> Hi Dafna,
> 
> On Fri, Jul 30, 2021 at 02:35:20PM +0200, Dafna Hirschfeld wrote:
> > On 30.07.21 02:19, Laurent Pinchart wrote:
> > > The vimc driver is used for testing purpose, and some test use cases
> > > involve sharing buffers with a consumer device. Consumers often require
> > > DMA contiguous memory, which vimc doesn't currently support. This leads
> > > in the best case to usage of bounce buffers, which is very slow, and in
> > > the worst case in a complete failure.
> > > 
> > > Add support for the dma-contig allocator in vimc to support those use
> > > cases properly. The allocator is selected through a new "allocator"
> > > module parameter, which defaults to vmalloc.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >   drivers/media/test-drivers/vimc/vimc-capture.c |  9 +++++++--
> > >   drivers/media/test-drivers/vimc/vimc-common.h  |  2 ++
> > >   drivers/media/test-drivers/vimc/vimc-core.c    | 10 ++++++++++
> > >   3 files changed, 19 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
> > > index 5e9fd902cd37..92b69a6529fb 100644
> > > --- a/drivers/media/test-drivers/vimc/vimc-capture.c
> > > +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
> > > @@ -7,6 +7,7 @@
> > >   
> > >   #include <media/v4l2-ioctl.h>
> > >   #include <media/videobuf2-core.h>
> > > +#include <media/videobuf2-dma-contig.h>
> > >   #include <media/videobuf2-vmalloc.h>
> > >   
> > >   #include "vimc-common.h"
> > > @@ -423,14 +424,18 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
> > >   	/* Initialize the vb2 queue */
> > >   	q = &vcap->queue;
> > >   	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> > > -	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> > > +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> > 
> > maybe to be on the safe side VB2_DMABUF should be set only if vimc_allocator==1 ?
> 
> Why so ? vb2-vmalloc can import dma-bufs.

Indeed, should be safe with both allocator, the CMA one will validate that the
pages are contiguous and fail synchronously as expected for CMA. The known
issues are mostly for reading importers (consumers), for writing importer
(producers) it is likely still a bit buggy on cache management.

> > >   	if (ret) {
> > > diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
> > > index a289434e75ba..b77939123501 100644
> > > --- a/drivers/media/test-drivers/vimc/vimc-common.h
> > > +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> > > @@ -35,6 +35,8 @@
> > >   
> > >   #define VIMC_PIX_FMT_MAX_CODES 8
> > >   
> > > +extern unsigned int vimc_allocator;
> > > +
> > >   /**
> > >    * vimc_colorimetry_clamp - Adjust colorimetry parameters
> > >    *
> > > diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> > > index 4b0ae6f51d76..7badcecb7aed 100644
> > > --- a/drivers/media/test-drivers/vimc/vimc-core.c
> > > +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> > > @@ -5,6 +5,7 @@
> > >    * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
> > >    */
> > >   
> > > +#include <linux/dma-mapping.h>
> > >   #include <linux/font.h>
> > >   #include <linux/init.h>
> > >   #include <linux/module.h>
> > > @@ -15,6 +16,12 @@
> > >   
> > >   #include "vimc-common.h"
> > >   
> > > +unsigned int vimc_allocator;
> > > +module_param_named(allocator, vimc_allocator, uint, 0444);
> > > +MODULE_PARM_DESC(allocator, " memory allocator selection, default is 0.\n"
> > > +			     "\t\t    0 == vmalloc\n"
> > > +			     "\t\t    1 == dma-contig");
> > > +
> > 
> > There is a section 'Module options' in vimc.rst. So a doc should be added there.
> 
> OK, I'll update that.
> 
> > >   #define VIMC_MDEV_MODEL_NAME "VIMC MDEV"
> > >   
> > >   #define VIMC_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
> > > @@ -278,6 +285,9 @@ static int vimc_probe(struct platform_device *pdev)
> > >   
> > >   	tpg_set_font(font->data);
> > >   
> > > +	if (vimc_allocator == 1)
> > > +		dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> > > +
> > >   	vimc = kzalloc(sizeof(*vimc), GFP_KERNEL);
> > >   	if (!vimc)
> > >   		return -ENOMEM;
> > > 
> 


