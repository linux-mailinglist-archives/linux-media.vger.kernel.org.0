Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8BD1E887C
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 22:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgE2UE0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 16:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728314AbgE2UES (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 16:04:18 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6C9C08C5C9
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 13:04:18 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id a13so1676772pls.8
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 13:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4+g7Oezu2RunpZeGCvY0b0s77w8UFoTcEBsYnh2aCmE=;
        b=oIkV2IwxnKvjZgJ+qdLb8Jx8V/wvhITFMVzbJY5nzmFPezh71a7tDAioCbghNilrqs
         yf84zuHV81ZntwYnrKWyOTM34RfkWDtvc91CAwfcOb5HwHt6B4JGIuGTCe/wMOHB291r
         CTJHTLRbWq9I5PCPnqdJ53R1Y2qNC0FTlRUaecb83hWz+ZlkIRBlsB3o7WcIpN7t0ZN6
         VFJHEH0lA2f4glK3hI6hWda5gKLsfuVoRvyNDt5Qf5nuhAhRM4Pyl8lucO5iZ2oOMKmZ
         OpsQLoTKWgx/PG4/O3BnWMpiV0OLPhRPx3kbaB4J9OwG6eMdDqLVuPffUlG4qP0nvm++
         bcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4+g7Oezu2RunpZeGCvY0b0s77w8UFoTcEBsYnh2aCmE=;
        b=CunTEYVfhXY9WGqQYJv+It+phLfYWkAYgFrHnfPywP5cFyCjSYIFzbjEZ5LJoAs4Z4
         3/eannr6nDTuDhHmqk4no1Qu2c2xM17KaWKUYve161+6g8YzlW19+tkRgl33nDR0FdYn
         kU2xldv/wNtNcdkmytHsrnne3iHOcBZ+MzVLGgw6wNV5wOMEarhqXBnNI/Ot8pJpd0mW
         7bbB3fpDopkTPZ7rhpL1Ldh9cuRvFlvFYostyU5r1FH5OTe3IEwa/KJ1R6hg1+fZ+Yat
         vcW3J23qZPvJKYoqvvC9Tnx5ryTAPpCPE3egXmHPHBKyHX9u0cN7vfMAk2DZDy3bieK3
         NSjQ==
X-Gm-Message-State: AOAM531z0LSBmIhXd7GaQxoFZWMz7fRXxoOWJWZoatnuJfCrWZEfzhS5
        MdwA35kY2XsqG0DIGG65ZZqW8ifbojEBQ9ubZveuzg==
X-Google-Smtp-Source: ABdhPJzajSAOEPn628sZLoiLTrRZedjCZBAQvwF+keg7C4ztulX0K1oUk7mF8ipVkXUUgKnRHQMl+6ln2r4LRdFYT5Q=
X-Received: by 2002:a17:902:724a:: with SMTP id c10mr10068319pll.223.1590782657556;
 Fri, 29 May 2020 13:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200529200031.4117841-1-arnd@arndb.de>
In-Reply-To: <20200529200031.4117841-1-arnd@arndb.de>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 29 May 2020 13:04:05 -0700
Message-ID: <CAKwvOdnND7XFgr7W9PvZAikJB1nKxB4K5N-oP0YrBT74oX_C9g@mail.gmail.com>
Subject: Re: [PATCH 1/9] staging: media: atomisp: fix incorrect NULL pointer check
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See also Nathan's 7 patch series.
https://lore.kernel.org/lkml/20200527071150.3381228-1-natechancellor@gmail.com/

Might be some overlap between series?

On Fri, May 29, 2020 at 1:00 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Checking the pointer to a member of a struct against NULL
> is pointless as clang points out:
>
> drivers/staging/media/atomisp/pci/atomisp_cmd.c:4278:17: error: address of 'config->info' will always evaluate to 'true'
>
> Check the original pointer instead, which may also be
> unnecessary here, but makes a little more sense.
>
> Fixes: 9d4fa1a16b28 ("media: atomisp: cleanup directory hierarchy")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 2 +-
>  drivers/staging/media/atomisp/pci/sh_css.c      | 4 ++--
>  drivers/staging/media/atomisp/pci/sh_css_sp.c   | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 5be690f876c1..342fc3b34fe0 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -4275,7 +4275,7 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
>                     atomisp_css_get_dvs_grid_info(
>                         &asd->params.curr_grid_info);
>
> -               if (!&config->info) {
> +               if (!config) {
>                         dev_err(isp->dev, "ERROR: NULL pointer in grid_info\n");
>                         return -EINVAL;
>                 }
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index d77432254a2c..e91c6029c651 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -8534,7 +8534,7 @@ ia_css_pipe_load_extension(struct ia_css_pipe *pipe,
>
>         if (firmware->info.isp.type == IA_CSS_ACC_OUTPUT)
>         {
> -               if (&pipe->output_stage)
> +               if (pipe)
>                         append_firmware(&pipe->output_stage, firmware);
>                 else {
>                         IA_CSS_LEAVE_ERR_PRIVATE(IA_CSS_ERR_INTERNAL_ERROR);
> @@ -8542,7 +8542,7 @@ ia_css_pipe_load_extension(struct ia_css_pipe *pipe,
>                 }
>         } else if (firmware->info.isp.type == IA_CSS_ACC_VIEWFINDER)
>         {
> -               if (&pipe->vf_stage)
> +               if (pipe)
>                         append_firmware(&pipe->vf_stage, firmware);
>                 else {
>                         IA_CSS_LEAVE_ERR_PRIVATE(IA_CSS_ERR_INTERNAL_ERROR);
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> index e574396ad0f4..c0e579c1705f 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> @@ -1022,7 +1022,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
>                 if (!pipe)
>                         return IA_CSS_ERR_INTERNAL_ERROR;
>                 ia_css_get_crop_offsets(pipe, &args->in_frame->info);
> -       } else if (&binary->in_frame_info)
> +       } else if (binary)
>         {
>                 pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
>                 if (!pipe)
> @@ -1036,7 +1036,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
>                         if (!pipe)
>                                 return IA_CSS_ERR_INTERNAL_ERROR;
>                         ia_css_get_crop_offsets(pipe, &args->in_frame->info);
> -               } else if (&binary->in_frame_info) {
> +               } else if (binary) {
>                         pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
>                         if (!pipe)
>                                 return IA_CSS_ERR_INTERNAL_ERROR;
> --
> 2.26.2
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200529200031.4117841-1-arnd%40arndb.de.



-- 
Thanks,
~Nick Desaulniers
