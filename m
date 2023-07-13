Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 170C2752B14
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 21:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbjGMTjQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 15:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbjGMTjP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 15:39:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D663A272B
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 12:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689277108;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7kGfgvA2AS5FjJRUHn56CMK8f89f2iP8kbTsZQXbun8=;
        b=aMTXafC8dY5NiaxsRVvMb0DvR4WUaAnG9sjkNQl6vfoeMgp6+HMt5+sOZcmvhL7J4FAMbF
        62LWeUbu9jXNjZ/eCwYbwxRA3SPHBq+kAXlg3yIOzksbWMXpDUXiRBvm6zcfxpJcm3hxow
        XUjV1nLdCcJ1rw07TYw6ZcZEjPyJl+c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-XSORcvEJOnyeNwQyQdJlJw-1; Thu, 13 Jul 2023 15:38:26 -0400
X-MC-Unique: XSORcvEJOnyeNwQyQdJlJw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-993f7b196a5so75243766b.0
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 12:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689277105; x=1691869105;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kGfgvA2AS5FjJRUHn56CMK8f89f2iP8kbTsZQXbun8=;
        b=K3dfvtm6wPjjPVpDTQngQPgO7GH2vKJaH0GJxz6QznwxzA9bitWcO4HkYCBtC+HbjD
         Udt4HcpU2wIp7+Bfkh3OMocingsODlaCUFYXFiVzY8TEUYPkycAZYOg3aaAjzSJ3cURe
         tuk6XDD0F7O52za94iqHiCfNw6DAnfxZ1mpUawudtnJT5NVmivpoGqvpMjH2AumTv/6E
         d3gkNBtx+cV8D2N4ZRYtQK3Ju4fVNzVI5l+vv2/fRN1x1PCTfpkiCTSvdN4LiYprkYhU
         p2w1ikeaK5PVmPvZT7Kv3B80961s0v9mwwjmemj9cfFII23dq2vQcZpUINX15BKNrDzf
         rxvw==
X-Gm-Message-State: ABy/qLaepUWaQmi6kPyEKMNq4cfY+ko9nPw+Zr+LLtt7mYeLvWdQQ0X/
        C09dxvWVIy70ua5ZENqSqrSk2IhBU9meyyoO0XPZbnL3Uzd0dq6hQJXi3wmdkp6h2Bge/lz3djt
        9JAsXYtFBzycoS5cIOIXDQI4=
X-Received: by 2002:a17:906:d5:b0:993:d5bd:a757 with SMTP id 21-20020a17090600d500b00993d5bda757mr2592626eji.19.1689277105613;
        Thu, 13 Jul 2023 12:38:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEIe1VO0PXnwtKsNw2RNboRlrYVlwXGvQbTQvYjKpfglFDFv0ByflJe3JDy4FdPXrbx/t8kWg==
X-Received: by 2002:a17:906:d5:b0:993:d5bd:a757 with SMTP id 21-20020a17090600d500b00993d5bda757mr2592611eji.19.1689277105332;
        Thu, 13 Jul 2023 12:38:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dk7-20020a170906f0c700b009931a3adf64sm4439485ejb.17.2023.07.13.12.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 12:38:24 -0700 (PDT)
Message-ID: <74cfe990-d36f-5372-9dc5-33f141f205be@redhat.com>
Date:   Thu, 13 Jul 2023 21:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 00/11] #if defined(ISP2401) removal to make driver generic
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230713100231.308923-1-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230713100231.308923-1-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kate,

On 7/13/23 12:02, Kate Hsuan wrote:
> This patch set is to remove #if defined(ISP2401) to make the driver
> generic. We focused on removing the #if defined(ISP2401) in isys and
> necessary files related to it.
> 
> The changes include:
> 1. Removed #if defined(ISP2401) in isys and related directories.
> 2. Removed the debug codes for dumping status.
> 3. Made two individual enum to define the MIPI format for both types of
>    atomisp.
> 4. The input system code should include both input system (ISP2400 and
>    ISP2401) headers since a generic driver should cover all types
>    of devcices.
> 5. The initialization codes of the input system was modified to initiate
>    atomisp input system in a generic manner.

Thank you very much for all your hard work on this.

The entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series. I'll merge this into my media-atomisp branch
when I can make some time to do so.

Regards,

Hans



> 
> 
> Kate Hsuan (11):
>   media: atomisp: ia_css_debug: Removed debug codes for dumping status
>   media: atomisp: Make two individual enum to define the MIPI format
>   media: atomisp: Included both input system headers
>   media: atomisp: css_2401_system: Remove #ifdef ISP2401 to make the
>     driver generic
>   media: atomisp: isys: Removed #if defined(ISP2401) to make driver
>     generic
>   media: atomisp: hive_isp_css_common: Removed #if defined(ISP2401) to
>     make driver generic
>   media: atomisp: pipeline: Removed #if defined(ISP2401) to make driver
>     generic
>   media: atomisp: ifmtr: Removed #if defined(ISP2401) to make driver
>     generic
>   media: atomisp: Compile the object codes for a generic driver
>   media: atomisp: rx: Removed #if defined(ISP2401) to make driver
>     generic
>   media: atomisp: isys_init: Initiate atomisp in a generic manner
> 
>  drivers/staging/media/atomisp/Makefile        |  12 +-
>  .../pci/css_2401_system/host/isys_irq_local.h |   3 -
>  .../css_2401_system/host/isys_irq_private.h   |   2 -
>  .../pci/css_2401_system/isys_irq_global.h     |   2 -
>  .../host/input_formatter.c                    |   2 -
>  .../hive_isp_css_common/host/input_system.c   |  75 -----
>  .../host/isys_dma_public.h                    |   2 -
>  .../host/isys_irq_public.h                    |   2 -
>  .../hive_isp_css_include/host/isys_public.h   |  19 --
>  .../pci/hive_isp_css_include/isys_irq.h       |   2 -
>  .../media/atomisp/pci/input_system_local.h    |   7 +-
>  .../media/atomisp/pci/input_system_private.h  |   7 +-
>  .../media/atomisp/pci/input_system_public.h   |   4 +-
>  .../atomisp/pci/isp2400_input_system_local.h  |  89 +++---
>  .../pci/isp2400_input_system_private.h        |   4 +-
>  .../atomisp/pci/isp2400_input_system_public.h |  13 +-
>  .../atomisp/pci/isp2401_input_system_local.h  |  88 +++---
>  .../pci/isp2401_input_system_private.h        | 112 +-------
>  .../runtime/debug/interface/ia_css_debug.h    |   6 -
>  .../pci/runtime/debug/src/ia_css_debug.c      | 256 ------------------
>  .../atomisp/pci/runtime/ifmtr/src/ifmtr.c     |   2 -
>  .../pci/runtime/isys/interface/ia_css_isys.h  |   9 +-
>  .../runtime/isys/interface/ia_css_isys_comm.h |   2 -
>  .../pci/runtime/isys/src/csi_rx_rmgr.c        |   2 -
>  .../pci/runtime/isys/src/isys_dma_rmgr.c      |   2 -
>  .../atomisp/pci/runtime/isys/src/isys_init.c  |  31 +--
>  .../runtime/isys/src/isys_stream2mmio_rmgr.c  |   2 -
>  .../media/atomisp/pci/runtime/isys/src/rx.c   | 227 ++++++++++------
>  .../pci/runtime/isys/src/virtual_isys.c       |   8 +-
>  .../pipeline/interface/ia_css_pipeline.h      |   2 -
>  .../pci/runtime/pipeline/src/pipeline.c       |   2 -
>  drivers/staging/media/atomisp/pci/sh_css.c    |   2 -
>  drivers/staging/media/atomisp/pci/sh_css_sp.c |   2 -
>  drivers/staging/media/atomisp/pci/sh_css_sp.h |   2 -
>  34 files changed, 253 insertions(+), 749 deletions(-)
> 

