Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44473755A0E
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 05:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjGQDZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jul 2023 23:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbjGQDZq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jul 2023 23:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85CC180
        for <linux-media@vger.kernel.org>; Sun, 16 Jul 2023 20:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689564296;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rVPhlDWWstYuQhE9rPW0moAPj4vPnjdpcShE2QGExrM=;
        b=EUOZ6BvH9liosEXoRcdBff2dFRqOmI/CuPZ7Jjr3zSA8etQVkkFKWxE0FcinftjZKtx7ue
        D3FxghAQ8yjMKerXim1KIwRDQth94MRGCgluuoXtz+PFVnZXg6lITzYZypQiMEAoaBQaqS
        ZTaHVsGbFxc95ptnuVyuDNgxqS4Jzl0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-KNiL6Af9OkCfrwRvaCI6Tw-1; Sun, 16 Jul 2023 23:24:54 -0400
X-MC-Unique: KNiL6Af9OkCfrwRvaCI6Tw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-76752bc38bcso632213985a.2
        for <linux-media@vger.kernel.org>; Sun, 16 Jul 2023 20:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689564294; x=1692156294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVPhlDWWstYuQhE9rPW0moAPj4vPnjdpcShE2QGExrM=;
        b=EQfzxD8tSMNGTSTsHs4euLOmLuOCVKTCq11VQ1yrKTXZfTVgktyae/21eCMQt4+Z63
         P/liGiIpM1WsdQtXG77NZL9iQQqUQfsbg5AURUK4UJJw8DOYqpMOim4C0lxM8JbFZhiH
         7mFhhbM+X/vBmfYOTYWUvUkg6xa0wpMbOaBbNt+2afRaBSRg9FI+hABQ/h7NgL7Y30UM
         SQcNZ0jIPMkW+V5s7xjL7fSmYjgwU6psg2AF5h59zFubc3eJcexbdc323OAzH0Fm87P6
         WQDH5/ilpOAHVqGWIdRS8Q1d97t/k39w+Lx1xd0N5NSCquXcT4lijyad//bHJu1KBDoE
         PqLw==
X-Gm-Message-State: ABy/qLZLN1i765uiMgTlaOFOhY1Qr4SGYoiNsRdbIp3yDR/Al0JAXtMB
        5vfbOWjPdjzx9VN6XZTCx0sC6Sa1ikj70eQ8S265xAactoFMNzAk0Ct0Z8lQbEqlyPjvCT5yAf7
        +alV/booZJcgkDCNadO+dT0h1I8+REF/nV9gKKJY=
X-Received: by 2002:a05:620a:e1b:b0:767:f130:8f8a with SMTP id y27-20020a05620a0e1b00b00767f1308f8amr13099970qkm.49.1689564294191;
        Sun, 16 Jul 2023 20:24:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGohHM0GTkSYl2RPmZokxDtvdLmqusAw0AogptqmV9By9unoIHTsuJDI2cnjr//K3wz9uRRjDfKVX+bVgwzg4I=
X-Received: by 2002:a05:620a:e1b:b0:767:f130:8f8a with SMTP id
 y27-20020a05620a0e1b00b00767f1308f8amr13099958qkm.49.1689564293904; Sun, 16
 Jul 2023 20:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230715170906.3627-1-hdegoede@redhat.com> <20230715170906.3627-2-hdegoede@redhat.com>
In-Reply-To: <20230715170906.3627-2-hdegoede@redhat.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Mon, 17 Jul 2023 11:24:43 +0800
Message-ID: <CAEth8oHkGVRkE09R5VUO3-3wruOQzP_ZRvfZqk5w6tMusUdi5w@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: atomisp: Remove aliases for MIPI_FORMAT_2400_CUSTOM0
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

Hi Hans,

On Sun, Jul 16, 2023 at 1:09=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> isp2400_input_system_local.h defines 2 aliases for MIPI_FORMAT_2400_CUSTO=
M0
> MIPI_FORMAT_JPEG, which is entirely unused and MIPI_FORMAT_BINARY_8 which
> is used once in ia_css_isys_2400_set_fmt_type().
>
> Drop these aliases and directly use MIPI_FORMAT_2400_CUSTOM0 in
> ia_css_isys_2400_set_fmt_type().
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/isp2400_input_system_local.h | 2 --
>  drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c        | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local=
.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
> index e7b84fdbb4e0..6319d6449f20 100644
> --- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
> +++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
> @@ -200,8 +200,6 @@ typedef enum {
>         N_MIPI_FORMAT_2400,
>  } mipi_format_2400_t;
>
> -#define MIPI_FORMAT_JPEG       MIPI_FORMAT_2400_CUSTOM0
> -#define MIPI_FORMAT_BINARY_8   MIPI_FORMAT_2400_CUSTOM0
>  #define N_MIPI_FORMAT_CUSTOM   8
>
>  /* The number of stores for compressed format types */
> diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/dr=
ivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
> index c8316e0965d0..deb4130f710c 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
> @@ -271,7 +271,7 @@ static int ia_css_isys_2400_set_fmt_type(enum atomisp=
_input_format input_format,
>                 *fmt_type =3D MIPI_FORMAT_2400_RAW16;
>                 break;
>         case ATOMISP_INPUT_FORMAT_BINARY_8:
> -               *fmt_type =3D MIPI_FORMAT_BINARY_8;
> +               *fmt_type =3D MIPI_FORMAT_2400_CUSTOM0;
>                 break;
>         case ATOMISP_INPUT_FORMAT_YUV420_16:
>         case ATOMISP_INPUT_FORMAT_YUV422_16:
> --
> 2.41.0
>

Thank you for working on this.

It looks good to me.

Reviewed-by: Kate Hsuan <hpa@redhat.com>


--
BR,
Kate

