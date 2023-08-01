Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D030476B4D0
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 14:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbjHAMdV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 08:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbjHAMdU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 08:33:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34EA21FC6
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 05:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690893152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=okoYgmdKQn74JZXrYBaqgnqoE892hBw9NGFTzkSP/IY=;
        b=dBms0CaItadLZH4ttC1SKZb1+q30pnkHIkC9hN7SfYa1igcn6kEcaE22wyDJF7DSyT4Qbk
        LbWr5rkrhDGxIu2sAfnDiQiazn2XSmE6IEFmBQKuKmO3RkQ+1B1AdIsDgVE+FMvWCxIjvi
        P3rAj0Mz9b4zpnH15FP35yH0WFGzha4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-d3UnoNGGP4ObdgiyBJkwug-1; Tue, 01 Aug 2023 08:32:30 -0400
X-MC-Unique: d3UnoNGGP4ObdgiyBJkwug-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-268441d0e64so5727631a91.1
        for <linux-media@vger.kernel.org>; Tue, 01 Aug 2023 05:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690893150; x=1691497950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okoYgmdKQn74JZXrYBaqgnqoE892hBw9NGFTzkSP/IY=;
        b=EZJXMl11Iuaa++HrCETBVJYDM7rG8lv2y219v+Ngz9232Nsg9wF8bVKk/IvT5xmf8i
         y8PP86heNOEjq09x+WzF9gJaOPumK+qu4fD1mrrfHIFzzUooT9lvvWcNy4G/qARxv/lO
         HAQbH7FOz5Vj/rni3V/hMJsYIMMKveTYD82FtHuUPvZLeDtDGhaaF79pZAmziESpQXj2
         3OdbXgbI4rAfiMPaLB7+2KxX03Lau/mKB1i2re8CquU79oFqr1c6QKTMF28oRPqSV2hL
         hwoX6O6Ve4orfN8ZPb88po33IAbLX4/HUDx2dxwnhu4hnOg6vi2dY1bMWBEtp6GHKSo0
         geAg==
X-Gm-Message-State: ABy/qLZ/OfKhTxgDS5fo6aDEyklBkjS7pdsB2g5xDK1Hk9U780ZneK0Q
        DdC15jbqZRHG2eIl5szi3Cmnwei0RYpvthM264rhIYWlqPsIXrWNsGABk3o+5B8vZySQEC6aLay
        QVJ2HWStPxsCU7X3B8utnXVo3zJttjaG8vbd0JRA=
X-Received: by 2002:a17:90b:897:b0:261:685:95b6 with SMTP id bj23-20020a17090b089700b00261068595b6mr12106649pjb.13.1690893149839;
        Tue, 01 Aug 2023 05:32:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE+s2eFV5EuurTO8k9V6frq5bcS/3gHhEu2C6+5FPjjz18mq0FptnP3pP6BOGHiwlkNzwMwsTYAitHPKWOAHDA=
X-Received: by 2002:a17:90b:897:b0:261:685:95b6 with SMTP id
 bj23-20020a17090b089700b00261068595b6mr12106625pjb.13.1690893149469; Tue, 01
 Aug 2023 05:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230730153343.22033-1-hdegoede@redhat.com>
In-Reply-To: <20230730153343.22033-1-hdegoede@redhat.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Tue, 1 Aug 2023 20:32:18 +0800
Message-ID: <CAEth8oFe1QFfbZ=COzT=BLJtoAXAgqVMZtTM6qe4aNvQ0ZNVPw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: atomisp: Fix smatch warnings caused by
 atomisp custom assert() usage
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Hans Verkuil <hverkuil@xs4all.nl>
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

On Sun, Jul 30, 2023 at 11:33=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> The atomisp code base has a custom assert() macro, a couple of functions
> use this in a construction like the following:
>
>    assert(pipe);
>    assert(pipe->stream);
>    if ((!pipe) || (!pipe->stream)) {
>            ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>                                "allocate_mipi_frames(%p) exit: ...\n",
>                                pipe);
>            return -EINVAL;
>    }
>
> The second assert is seen by smatch as dereferencing "pipe" in the above
> example (and dereferencing "dvs_6axis_config" in the other case).
>
> Following by the dereferenced variable being checked (a second time)
> in the following if () statement.
>
> This triggers the following smatch warnings:
> drivers/staging/media/atomisp/pci/sh_css_mipi.c:356 allocate_mipi_frames(=
) warn: variable dereferenced before check 'pipe' (see line 355)
> drivers/staging/media/atomisp/pci/sh_css_mipi.c:562 send_mipi_frames() wa=
rn: variable dereferenced before check 'pipe' (see line 561)
> drivers/staging/media/atomisp/pci/sh_css_param_dvs.c:208 free_dvs_6axis_t=
able() warn: variable dereferenced before check 'dvs_6axis_config' (see lin=
e 206)
>
> The custom assert() macro actually expands to a BUG() call and BUG()
> calls should not be used in the kernel.
>
> Remove the assert() calls to fix the smatch warnings and in case of
> [allocate|send]_mipi_frames() also remove the if () return -EINVAL
> block since these functions are never called with a NULL pipe.
>
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note:
> 1. No Closes: tag since Hans Verkuil reported this in an offlist email.
> 2. All the other assert() calls really should also be removed.
>    I've put this on my todo list.
> ---
> Changes in v2:
> - Drop the sh_css_sp.c bits, just dropping the assert() calls is
>   not enough there
> ---
>  drivers/staging/media/atomisp/pci/sh_css_mipi.c  | 16 ----------------
>  .../staging/media/atomisp/pci/sh_css_param_dvs.c |  3 ---
>  2 files changed, 19 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/st=
aging/media/atomisp/pci/sh_css_mipi.c
> index b20acaab0595..ced21dedf7ac 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> @@ -351,15 +351,6 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
>         ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>                             "allocate_mipi_frames(%p) enter:\n", pipe);
>
> -       assert(pipe);
> -       assert(pipe->stream);
> -       if ((!pipe) || (!pipe->stream)) {
> -               ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> -                                   "allocate_mipi_frames(%p) exit: pipe =
or stream is null.\n",
> -                                   pipe);
> -               return -EINVAL;
> -       }

Thank you for working on this.

The NULL test for pipe could be kept here since the caller only tests
"stream" but not test "main_pipe" is NULL. (sh_css.c line: 1799)

The rest of the part is ok for me.

> -
>         if (IS_ISP2401 && pipe->stream->config.online) {
>                 ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>                                     "allocate_mipi_frames(%p) exit: no bu=
ffers needed for 2401 pipe mode.\n",
> @@ -557,13 +548,6 @@ send_mipi_frames(struct ia_css_pipe *pipe)
>
>         IA_CSS_ENTER_PRIVATE("pipe=3D%p", pipe);
>
> -       assert(pipe);
> -       assert(pipe->stream);
> -       if (!pipe || !pipe->stream) {
> -               IA_CSS_ERROR("pipe or stream is null");
> -               return -EINVAL;
> -       }
> -
>         /* multi stream video needs mipi buffers */
>         /* nothing to be done in other cases. */
>         if (pipe->stream->config.mode !=3D IA_CSS_INPUT_MODE_BUFFERED_SEN=
SOR) {
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drive=
rs/staging/media/atomisp/pci/sh_css_param_dvs.c
> index ff0082d02af3..5174bc210ae1 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
> @@ -202,9 +202,6 @@ generate_dvs_6axis_table_from_config(struct ia_css_dv=
s_6axis_config
>  void
>  free_dvs_6axis_table(struct ia_css_dvs_6axis_config  **dvs_6axis_config)
>  {
> -       assert(dvs_6axis_config);
> -       assert(*dvs_6axis_config);
> -
>         if ((dvs_6axis_config) && (*dvs_6axis_config)) {
>                 IA_CSS_ENTER_PRIVATE("dvs_6axis_config %p", (*dvs_6axis_c=
onfig));
>                 if ((*dvs_6axis_config)->xcoords_y) {
> --
> 2.41.0
>


--=20
BR,
Kate

