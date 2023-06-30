Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B986743DA2
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 16:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbjF3OiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 10:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbjF3OiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 10:38:04 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1141A35A6
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:38:03 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-992f15c36fcso64251266b.3
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688135881; x=1690727881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sW+eca0V3mx7tiIBToT6vP5keH4x7usRv62cG2GqeQ=;
        b=nw59yFShzsxKZB6r7BiJAgrSRAGdPdn7TdrvDHTvKcSftjg+qCNGWIXlwNtKitt+XG
         uDRcTI+lM9mSoPxNLyVzDjKxIXeYL+t1dcy7QGeSgEd3elvMpmk9hf/FAkM/G6OkOVxt
         1z+eoAU91T6sRob2cD3ZAhW9vxUlpHwp99BPz9iOwKomWc84VZmXw+keAORMNjRt14Yx
         8KNHnWfi5VZB/JOIhFA2RSYNZZkU9iOskmHy/lHk30z5jsqwNkU353mOw8XUx1R/0my/
         IsqoQ10mzaTnTTh+yec6RyTH0TAYrJEtCZ+wcmyIsx56ZHZuNfEc7LGvSoyESI8aNQ4z
         M1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688135881; x=1690727881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sW+eca0V3mx7tiIBToT6vP5keH4x7usRv62cG2GqeQ=;
        b=FyZO7yBpfwPXrQX+yojJG14GzH98ZGuc/AE4ZQbnFdI+ftwgmA/GPM12MzY7YHrcIF
         gtMFtnj3eiZa/fjBtqng1jf6pIpvjrCSL6qQtIGUtQDhsDvoGVTgSwaUc+eLQcXHM+ND
         EWdApFBA3oC5lodJmLOmCR3US71cpxq0xAUieAeZkQHG75FRGeWUQLOTGBUl2w0mnMYd
         6430lDBhe/Lo4NILm2FBzzszuLeqhDnZ2Quf11VyJZMqF6QKHJd1cXnSCrUAsE3C2C/u
         c9O4/s8aZclAUoygmbNGDCDtMm/LXLAQuY3ttkr8tCT8wjN70+ShAkVmUi+yEacdRdTk
         Xt2A==
X-Gm-Message-State: ABy/qLauqnBPzWubtmXhtkTs9P94MMTW4GHKMPbCHFfF4MnEW+PxvSCS
        7QlB7uK0Y42WleLK4y7TZBOkH4TzFxqKUx31JQreWzva4wsPsg==
X-Google-Smtp-Source: APBJJlEpGO7qY5PQlx2+edAMWeKX0No/VBwutnFe5jdzExcamKgvXTuGNU/CeK/XGwkL1qb/3FWScGvW53SJn4ia3dY=
X-Received: by 2002:a50:ec8c:0:b0:51d:9dd1:29d0 with SMTP id
 e12-20020a50ec8c000000b0051d9dd129d0mr1895388edr.23.1688135881300; Fri, 30
 Jun 2023 07:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230630110643.209761-1-hdegoede@redhat.com> <20230630110643.209761-12-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-12-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Jun 2023 17:37:25 +0300
Message-ID: <CAHp75VfiWQRkN4uxD9YmMC70_N5bvMhAVYd5ATaZ9ae_gwcrrA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] media: ipu-bridge: Move ipu-bridge.h to include/media/
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 30, 2023 at 2:07=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Move ipu-bridge.h to include/media/, so that it can also be used by
> the atomisp code.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c                    | 4 ++--
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c                | 3 ++-
>  {drivers/media/pci/intel =3D> include/media}/ipu-bridge.h | 0
>  3 files changed, 4 insertions(+), 3 deletions(-)
>  rename {drivers/media/pci/intel =3D> include/media}/ipu-bridge.h (100%)
>
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/int=
el/ipu-bridge.c
> index d60992fbdbeb..eb7c56e8ef9f 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -5,9 +5,9 @@
>  #include <linux/device.h>
>  #include <linux/i2c.h>
>  #include <linux/property.h>
> -#include <media/v4l2-fwnode.h>
>
> -#include "ipu-bridge.h"
> +#include <media/ipu-bridge.h>
> +#include <media/v4l2-fwnode.h>
>
>  /*
>   * Extend this array with ACPI Hardware IDs of devices known to be worki=
ng
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci=
/intel/ipu3/ipu3-cio2.c
> index 26c4c1375990..51a6d7cc44d2 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -22,6 +22,8 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
>  #include <linux/vmalloc.h>
> +
> +#include <media/ipu-bridge.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -29,7 +31,6 @@
>  #include <media/v4l2-ioctl.h>
>  #include <media/videobuf2-dma-sg.h>
>
> -#include "../ipu-bridge.h"
>  #include "ipu3-cio2.h"
>
>  struct ipu3_cio2_fmt {
> diff --git a/drivers/media/pci/intel/ipu-bridge.h b/include/media/ipu-bri=
dge.h
> similarity index 100%
> rename from drivers/media/pci/intel/ipu-bridge.h
> rename to include/media/ipu-bridge.h
> --
> 2.41.0
>


--=20
With Best Regards,
Andy Shevchenko
