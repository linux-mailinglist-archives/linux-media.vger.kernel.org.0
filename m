Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9B4755A0D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 05:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbjGQDYm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jul 2023 23:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbjGQDYj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jul 2023 23:24:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9287E6
        for <linux-media@vger.kernel.org>; Sun, 16 Jul 2023 20:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689564230;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lWrIWrkg/Nt6GMrmG9sycYZY7DWCUhRBTqM65DDpl/E=;
        b=cM+4SY/XQst2B0gsKAzq+6Mxl923Qvcc7hah+eDt6Et0UX+cCBn2C/h74xE1LFO2NZLcPh
        LH5qCuIGc8Buz7FVfA56fEA9nsQzz5MgeV5P60r7v+EaWK2Xk+zA/cQ1Vi94Qh5Vrwj0f7
        EEg/kzRB1Yh70LoHpLc5MeQ1JBxX72U=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-vRXsn3FsP6SyMj1n8ZRxUw-1; Sun, 16 Jul 2023 23:23:49 -0400
X-MC-Unique: vRXsn3FsP6SyMj1n8ZRxUw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7677e58c1bfso540372885a.0
        for <linux-media@vger.kernel.org>; Sun, 16 Jul 2023 20:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689564229; x=1692156229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWrIWrkg/Nt6GMrmG9sycYZY7DWCUhRBTqM65DDpl/E=;
        b=j4G72KzuWNYpbOT69Dw5kXFzLiDqRUMRFeznu4nDtKeLjJYNq8g1yL0qUYwh8wPruS
         mzqEDVieQPijpPV5BDpN6JXXD5ELe/PjHbFfq9otY96KQI3t2aAM6fZu5upsw5aNyJH4
         Dr3Nu7X5vkN/lIkcN2Fh7vHR4g4x/QgBsVWZ9QTn7XzKXcnP5agEMAShTPWBg8R00V9H
         yRAbMo7I8fpU6ADJB4p4HYKaOtukao+j/SApHDScq5ni8biETmIY4fLpxig+NzomG/PK
         cwLEMAzsd2wyZG8MkLiZEsleakAp+5bf7i6Cg6aBS0tbmRIU72hQvK3l1KQW+kp8Ietn
         eLHA==
X-Gm-Message-State: ABy/qLbI8MCnf6B8fsiU0nJ23BuLK5hLwO8z3RzD/20ntDikD/8ftufU
        p5hwLzhQw66FfPlF7twhxwq4FFWnK/xwwcCdOeJw7qdveb5NNzNVYris7GSHWdFX5Arw0Mr26Vp
        Ui80wTVKE1Z2I54uDEqACA2TMMtli2NhjyocqUcE=
X-Received: by 2002:a05:620a:3726:b0:765:36a5:9207 with SMTP id de38-20020a05620a372600b0076536a59207mr13633515qkb.0.1689564229161;
        Sun, 16 Jul 2023 20:23:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHnVQ140xGYT3kE+RxN5Bq+UJ/HInce9Q1DDrbKeIYvSbNy0mHLCOt0sZEi9qQShB0V96RzfMZabdFHm4dexy0=
X-Received: by 2002:a05:620a:3726:b0:765:36a5:9207 with SMTP id
 de38-20020a05620a372600b0076536a59207mr13633498qkb.0.1689564228906; Sun, 16
 Jul 2023 20:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230715170906.3627-1-hdegoede@redhat.com>
In-Reply-To: <20230715170906.3627-1-hdegoede@redhat.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Mon, 17 Jul 2023 11:23:37 +0800
Message-ID: <CAEth8oGmY+GTGw2Xs61GbD1uFycoCSetk1NQecphp4Sw9XbM0g@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: atomisp: Remove empty isys_public.h
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans.

On Sun, Jul 16, 2023 at 1:09=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> isys_public.h is empty, remove it.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../hive_isp_css_include/host/isys_public.h   | 19 -------------------
>  .../atomisp/pci/isp2400_input_system_public.h |  1 -
>  2 files changed, 20 deletions(-)
>  delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_includ=
e/host/isys_public.h
>
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/=
isys_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host=
/isys_public.h
> deleted file mode 100644
> index 9dacef7a5cc1..000000000000
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_pu=
blic.h
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Support for Intel Camera Imaging ISP subsystem.
> - * Copyright (c) 2015, Intel Corporation.
> - *
> - * This program is free software; you can redistribute it and/or modify =
it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope it will be useful, but WITHOU=
T
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> - * more details.
> - */
> -
> -#ifndef __ISYS_PUBLIC_H_INCLUDED__
> -#define __ISYS_PUBLIC_H_INCLUDED__
> -
> -#endif /* __ISYS_PUBLIC_H_INCLUDED__ */
> diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_publi=
c.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
> index 375c0db84b55..b1360eeb58df 100644
> --- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
> +++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
> @@ -17,7 +17,6 @@
>  #define __INPUT_SYSTEM_2400_PUBLIC_H_INCLUDED__
>
>  #include <type_support.h>
> -#include "isys_public.h"
>
>  typedef struct receiver_state_s                        receiver_state_t;
>
> --
> 2.41.0
>

Thank you for working on this.

This file can be removed and it looks for me.

Reviewed-by: Kate Hsuan <hpa@redhat.com>

--=20
BR,
Kate

