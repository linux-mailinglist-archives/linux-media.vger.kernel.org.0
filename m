Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD4E753179
	for <lists+linux-media@lfdr.de>; Fri, 14 Jul 2023 07:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234688AbjGNFrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jul 2023 01:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjGNFr3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jul 2023 01:47:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFD730CA
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 22:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689313598;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g6erNp3UvjEscYrwilfxggNErT6dVXbAHpnhEbMDdnY=;
        b=a5MDBWsC0ykAvrPGwBGE7yBoXGSZ4eTh1z5+cSySNLZ95oUGcFx8xrXSk9Wr1qX2n5XOvu
        85N1bSbE0mMUe67j1///CE0rp5+Kn4D7JPca4fpcFIeUzhSXu2yXio/Hq6zdss2y+yzF0h
        ldUOYx2R594udLVT9izaLioCu8KYAHg=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-E6NVir5mNeOv_QB7Hzk1Fg-1; Fri, 14 Jul 2023 01:46:36 -0400
X-MC-Unique: E6NVir5mNeOv_QB7Hzk1Fg-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2630eecfa6dso701420a91.0
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 22:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689313595; x=1691905595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6erNp3UvjEscYrwilfxggNErT6dVXbAHpnhEbMDdnY=;
        b=fFz0f+fJSIIYfBsocWSpl0gMzjd49aw1CAAFtv36PQSqXEt48Nh7iv7DT86CEpCUHA
         0zUaqdH/HxqAKIPM6t3Oxpc6HJEbI2uTmUN5w7QS0S8NWDAHDFGbUrNXBq8XapUDcdR7
         qu79ooqfqo7qzTDMzyK83iIGqcZ+7xmx90PwdhkB606u0aNo2uhMKprb9hyPMZT+7pKF
         QBWv59Aj4oDxGycLP9tLkHuRpyRS2sDO0UsjCIuhHaQbpnYaXGxX+TqEzbIoR9uZRIuS
         +3tkH7e+iUsdimmTdAUajRsuT3qHnzYNS9ZeBns0zhY3CGlG6D/Giom91kwVTMqOfVKy
         oVLg==
X-Gm-Message-State: ABy/qLYXPmLY4veScJhybuQrFXUguBsI9Wld1mU8hH1kx+wH2Os/rirO
        vhOvJGJCSP7t7nW1fpi3Wze7MRTqdmdVVpZfLpowC1Qvc6ChWgsZVvnH0HiD1zNEKxqdL2KSBB6
        Tbv8S3/rdhgxvOBLrsmgxFTXH4kUDXsiUpiZ8E5KN/T2R5Zw=
X-Received: by 2002:a17:90a:31c2:b0:262:d7db:2520 with SMTP id j2-20020a17090a31c200b00262d7db2520mr2637622pjf.26.1689313595359;
        Thu, 13 Jul 2023 22:46:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE9N3MGFAnn1VkROCXNjwaIsbqBE+EkGN4kUY6RFkFArDczgQqgr19Xwl5dVkXJYlGtplkT4d2zHi2M2lnZTwo=
X-Received: by 2002:a17:90a:31c2:b0:262:d7db:2520 with SMTP id
 j2-20020a17090a31c200b00262d7db2520mr2637616pjf.26.1689313594973; Thu, 13 Jul
 2023 22:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230713100231.308923-1-hpa@redhat.com> <74cfe990-d36f-5372-9dc5-33f141f205be@redhat.com>
In-Reply-To: <74cfe990-d36f-5372-9dc5-33f141f205be@redhat.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Fri, 14 Jul 2023 13:46:24 +0800
Message-ID: <CAEth8oGCbEnP3UwEPqa-BVEeAFX8H=YKM8=5gvvsxsr2GLNbhw@mail.gmail.com>
Subject: Re: [PATCH 00/11] #if defined(ISP2401) removal to make driver generic
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Fri, Jul 14, 2023 at 3:38=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi Kate,
>
> On 7/13/23 12:02, Kate Hsuan wrote:
> > This patch set is to remove #if defined(ISP2401) to make the driver
> > generic. We focused on removing the #if defined(ISP2401) in isys and
> > necessary files related to it.
> >
> > The changes include:
> > 1. Removed #if defined(ISP2401) in isys and related directories.
> > 2. Removed the debug codes for dumping status.
> > 3. Made two individual enum to define the MIPI format for both types of
> >    atomisp.
> > 4. The input system code should include both input system (ISP2400 and
> >    ISP2401) headers since a generic driver should cover all types
> >    of devcices.
> > 5. The initialization codes of the input system was modified to initiat=
e
> >    atomisp input system in a generic manner.
>
> Thank you very much for all your hard work on this.
>
> The entire series looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> for the series. I'll merge this into my media-atomisp branch
> when I can make some time to do so.
>

Thank you for reviewing

> Regards,
>
> Hans
>
>
>
> >
> >
> > Kate Hsuan (11):
> >   media: atomisp: ia_css_debug: Removed debug codes for dumping status
> >   media: atomisp: Make two individual enum to define the MIPI format
> >   media: atomisp: Included both input system headers
> >   media: atomisp: css_2401_system: Remove #ifdef ISP2401 to make the
> >     driver generic
> >   media: atomisp: isys: Removed #if defined(ISP2401) to make driver
> >     generic
> >   media: atomisp: hive_isp_css_common: Removed #if defined(ISP2401) to
> >     make driver generic
> >   media: atomisp: pipeline: Removed #if defined(ISP2401) to make driver
> >     generic
> >   media: atomisp: ifmtr: Removed #if defined(ISP2401) to make driver
> >     generic
> >   media: atomisp: Compile the object codes for a generic driver
> >   media: atomisp: rx: Removed #if defined(ISP2401) to make driver
> >     generic
> >   media: atomisp: isys_init: Initiate atomisp in a generic manner
> >
> >  drivers/staging/media/atomisp/Makefile        |  12 +-
> >  .../pci/css_2401_system/host/isys_irq_local.h |   3 -
> >  .../css_2401_system/host/isys_irq_private.h   |   2 -
> >  .../pci/css_2401_system/isys_irq_global.h     |   2 -
> >  .../host/input_formatter.c                    |   2 -
> >  .../hive_isp_css_common/host/input_system.c   |  75 -----
> >  .../host/isys_dma_public.h                    |   2 -
> >  .../host/isys_irq_public.h                    |   2 -
> >  .../hive_isp_css_include/host/isys_public.h   |  19 --
> >  .../pci/hive_isp_css_include/isys_irq.h       |   2 -
> >  .../media/atomisp/pci/input_system_local.h    |   7 +-
> >  .../media/atomisp/pci/input_system_private.h  |   7 +-
> >  .../media/atomisp/pci/input_system_public.h   |   4 +-
> >  .../atomisp/pci/isp2400_input_system_local.h  |  89 +++---
> >  .../pci/isp2400_input_system_private.h        |   4 +-
> >  .../atomisp/pci/isp2400_input_system_public.h |  13 +-
> >  .../atomisp/pci/isp2401_input_system_local.h  |  88 +++---
> >  .../pci/isp2401_input_system_private.h        | 112 +-------
> >  .../runtime/debug/interface/ia_css_debug.h    |   6 -
> >  .../pci/runtime/debug/src/ia_css_debug.c      | 256 ------------------
> >  .../atomisp/pci/runtime/ifmtr/src/ifmtr.c     |   2 -
> >  .../pci/runtime/isys/interface/ia_css_isys.h  |   9 +-
> >  .../runtime/isys/interface/ia_css_isys_comm.h |   2 -
> >  .../pci/runtime/isys/src/csi_rx_rmgr.c        |   2 -
> >  .../pci/runtime/isys/src/isys_dma_rmgr.c      |   2 -
> >  .../atomisp/pci/runtime/isys/src/isys_init.c  |  31 +--
> >  .../runtime/isys/src/isys_stream2mmio_rmgr.c  |   2 -
> >  .../media/atomisp/pci/runtime/isys/src/rx.c   | 227 ++++++++++------
> >  .../pci/runtime/isys/src/virtual_isys.c       |   8 +-
> >  .../pipeline/interface/ia_css_pipeline.h      |   2 -
> >  .../pci/runtime/pipeline/src/pipeline.c       |   2 -
> >  drivers/staging/media/atomisp/pci/sh_css.c    |   2 -
> >  drivers/staging/media/atomisp/pci/sh_css_sp.c |   2 -
> >  drivers/staging/media/atomisp/pci/sh_css_sp.h |   2 -
> >  34 files changed, 253 insertions(+), 749 deletions(-)
> >
>


--=20
BR,
Kate

