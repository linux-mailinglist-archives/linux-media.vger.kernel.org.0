Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6A4280338
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 17:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732734AbgJAPuc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 11:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732361AbgJAPub (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 11:50:31 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3829AC0613D0;
        Thu,  1 Oct 2020 08:50:31 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id h23so2084329pjv.5;
        Thu, 01 Oct 2020 08:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zW6MWyzUUn9v50tgBMkokxQ6HCYRd4j3AET8fbnVFGQ=;
        b=sFQH6PoDSExgmvW4YvMi67GxJNWIl7LX5tWGYahGkpCBd/2MiqSpwTNwN1dywDJN4w
         8xWWgUutoHyVe/DvE9AuTBtRpU/2KHHfUIgvxcMl3muvpnCAGZU40DEdXec8hi7HjNr5
         dbXvNkq+9PzxC+0uDrrH1rP2chYegT2611n4AgQ1m+yp4ZEc+F6yd5yF4UjCbR8PVeUn
         T3Yzt4sE1TQ50Z0WhtVGaNe+Hp4YdjO5PfFh9pC92WpQ03BH6q0F7KvAIcAbm7unROLv
         HZAfOZv6qCtXqrVjGjrZH78mkoj9uSNk/diZKGa/kKmJ1u5F50haUvhTc6IOqbQmutA7
         hEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zW6MWyzUUn9v50tgBMkokxQ6HCYRd4j3AET8fbnVFGQ=;
        b=fFjnJKtw3CVtOBKjew4Hp6kXzebMvIVeZN5AgTwvmu6wGFVxVBy3OwFmIz7tTnl5/r
         uYxrsgmITAP6E4UhgFxFgDI+iPf08kvTjPkWJkYLHOGujM5XzZ1FdRnfpjbZKQyVkjl4
         toxG3HoASckdk6wv91x7nVxg1C9+buJVJ6RqELumhwfGTp26Seu8lNK8PGV+T2XdOUOD
         QXids0r0w2913nQlOKdmgSUvwxOQcu32lpmBddZ0DsYMULVV2Pmq5IGJRfM0ccz0cxA7
         NKCTlFV3K1MR75/mOxRlnEspO6QS/3i34/5PxmFrNZyKOe2ErodhD8lYrTgmJR+D7Wae
         PKTA==
X-Gm-Message-State: AOAM530DGdljvpIXMViSfc0xawzkr2O9MQ0njW/l0BqcS+DPQRzYdMza
        HvWuu1rR9Jt+xv2rcKH70OLNuspVSb/WAy/Y+V8=
X-Google-Smtp-Source: ABdhPJxXDVgMtObNqA6AtgN+lLgmhryChf5KWYzlmENLVsBETeuJv5yARzq1Nqr0CJpC5A71MmqeuAXRhFtfSwTYgOg=
X-Received: by 2002:a17:90a:be11:: with SMTP id a17mr532278pjs.181.1601567430625;
 Thu, 01 Oct 2020 08:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <490e5002c3fea266524c31e1a94853dca9c3286c.1601551027.git.mchehab+huawei@kernel.org>
In-Reply-To: <490e5002c3fea266524c31e1a94853dca9c3286c.1601551027.git.mchehab+huawei@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 1 Oct 2020 18:50:12 +0300
Message-ID: <CAHp75Ve3B_YzC3JpswDv_8sYoMmvh58q4iWxfx2090Nfk3+_Fw@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: fixes build breakage for ISP2400 due
 to a cleanup
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 1, 2020 at 2:17 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> A temporary var needed for building with ISP2400 was removed
> by accident on a cleanup patch.
>
> Fix the breakage.

Is this in any of your branches?

>
> Fixes: 852a53a02cf0 ("media: atomisp: get rid of unused vars")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index e8c5caf3dfe6..ddee04c8248d 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -1365,7 +1365,6 @@ start_binary(struct ia_css_pipe *pipe,
>  {
>         assert(pipe);
>         /* Acceleration uses firmware, the binary thus can be NULL */
> -       /* assert(binary != NULL); */
>
>         if (binary)
>                 sh_css_metrics_start_binary(&binary->metrics);
> @@ -1381,10 +1380,10 @@ start_binary(struct ia_css_pipe *pipe,
>  #endif
>
>  #if !defined(ISP2401)
> -       if (stream->reconfigure_css_rx) {
> +       if (pipe->stream->reconfigure_css_rx) {
>                 ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
>                                          pipe->stream->config.mode);
> -               stream->reconfigure_css_rx = false;
> +               pipe->stream->reconfigure_css_rx = false;
>         }
>  #endif
>  }
> @@ -2820,6 +2819,8 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
>         bool need_isp_copy_binary = false;
>  #ifdef ISP2401
>         bool sensor = false;
> +#else
> +       bool continuous;
>  #endif
>         /* preview only have 1 output pin now */
>         struct ia_css_frame_info *pipe_out_info = &pipe->output_info[0];
> @@ -2833,6 +2834,8 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
>         online = pipe->stream->config.online;
>  #ifdef ISP2401
>         sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
> +#else
> +       continuous = pipe->stream->config.continuous;
>  #endif
>
>         if (mycs->preview_binary.info)
> @@ -5987,6 +5990,8 @@ static int load_primary_binaries(
>         bool need_ldc = false;
>  #ifdef ISP2401
>         bool sensor = false;
> +#else
> +       bool memory, continuous;
>  #endif
>         struct ia_css_frame_info prim_in_info,
>                        prim_out_info,
> @@ -6009,6 +6014,9 @@ static int load_primary_binaries(
>         online = pipe->stream->config.online;
>  #ifdef ISP2401
>         sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
> +#else
> +       memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
> +       continuous = pipe->stream->config.continuous;
>  #endif
>
>         mycs = &pipe->pipe_settings.capture;
> --
> 2.26.2
>


-- 
With Best Regards,
Andy Shevchenko
