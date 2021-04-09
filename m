Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A244135A43D
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 19:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233577AbhDIRAl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 13:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhDIRAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 13:00:40 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B73FC061760;
        Fri,  9 Apr 2021 10:00:27 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id q26so6496943qkm.6;
        Fri, 09 Apr 2021 10:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EHJ5xH8b3drIKRi0K3TBNoofABYf4wlu7xRfP2aofl0=;
        b=eIbJ3KA+c7F12XU8RjHnMwvpR/Ho4F+KHqyVHHqJzhCGHelcpX4VTPO4skvvC9lkhm
         ndAv+axRJgTFIN857CMdzYCh3Zo86cWEeaAY4YGbvnnxVV4dHasP5Rt6nR/ZytrCfUtf
         IlmS5OsqZVmAQ/nfvvTZPbilJJ2aGltBC6SdCx28T1mGAYhPiKG5yPobw4IrUjCEGFz/
         xuP5Lon1EYJdNtc/ttSUpYqkOlAOsLQFckHsPnxV5tOcIeNaZQ0Iwu3F4LXdyqj6wdqe
         k3JLUSj3yAwv9q0DG6NcsQUTYro28z9S4Mje33DdLwlggYVRB1UZYLNEDh3lnM7ls5kx
         Zq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EHJ5xH8b3drIKRi0K3TBNoofABYf4wlu7xRfP2aofl0=;
        b=O/E0V3CN2qDdliC9nNVBFyVbOmed5HHv9oQtYKS8a6SibdXyoGJGejb3B1moCR4w34
         fjhjf8ep4ya9SMI5Ayw2KQf8yw9cyf3vchLFZCcdibNER5xqT67Ij0H02DbxdTEsf13E
         hu8A5Fc8CaReMPcVReupa8dhVpnpN/edoJxBnd1l44x9zhzkkEQmPfmA/oV2njLnUZOo
         znjvBIEOUYI/gVH0TguRPqscXaIKL8ad21YYHlf6yjuQ6aB0KL8W+3vWMXTkAl4OiGPl
         4+n113mJ8htnEk+9rIDcRn1xU17tVEcMW3gCeEOJMEsT3/UPKY9/liMQ6rpzsSbYL5p9
         EHww==
X-Gm-Message-State: AOAM5307p+3bI/TsoUUFFgiRO3I8V6dZdW1JniUkUrYrD9CU0YqPnQOL
        pcuTcyqemojBgiVZ59xHy28=
X-Google-Smtp-Source: ABdhPJz0QP8syR0XJXwx2xA37Y8uc6ajjbC1Iy2vb3n+qHZwhUf+yRxr/jfG9DtVd7XvoYX2PxIieA==
X-Received: by 2002:a37:e315:: with SMTP id y21mr14808173qki.418.1617987626510;
        Fri, 09 Apr 2021 10:00:26 -0700 (PDT)
Received: from [192.168.100.7] ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id e14sm2076253qka.56.2021.04.09.10.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 10:00:26 -0700 (PDT)
Message-ID: <138794d79c42510d9b6ae744df20216904773032.camel@gmail.com>
Subject: Re: [Outreachy kernel][PATCH] staging: media: hantro: Rewrite macro
 function in lower case
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Fri, 09 Apr 2021 14:00:22 -0300
In-Reply-To: <9c09806cce4c7e5c5f0dc03e8c502cf29716f00f.camel@collabora.com>
References: <20210409135404.GA26172@focaruja>
         <9c09806cce4c7e5c5f0dc03e8c502cf29716f00f.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em sex, 2021-04-09 às 13:44 -0300, Ezequiel Garcia escreveu:
> Hi Aline,

Hi Ezequiel,
> 
> On Fri, 2021-04-09 at 10:54 -0300, Aline Santana Cordeiro wrote:
> > Rewrite macros resembling functions #define HANTRO_PP_REG_WRITE
> > and #define HANTRO_PP_RED_WRITE_S in lower case, according with
> > code style.
> > 
> 
> Where is this written in the Coding Style?

I found this in section 12, about Macros, Enums and RTL in both
references:
https://www.kernel.org/doc/html/latest/process/coding-style.html
https://elixir.bootlin.com/linux/latest/source/Documentation/process/coding-style.rst
> 
> Thanks!
> Ezequiel

Thank you!
Aline
> 
> > Signed-off-by: Aline Santana Cordeiro <  
> > alinesantanacordeiro@gmail.com>
> > ---
> >  drivers/staging/media/hantro/hantro_postproc.c | 34 +++++++++++++-
> > ------------
> >  1 file changed, 17 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro_postproc.c
> > b/drivers/staging/media/hantro/hantro_postproc.c
> > index 6d2a8f2a..06279c0 100644
> > --- a/drivers/staging/media/hantro/hantro_postproc.c
> > +++ b/drivers/staging/media/hantro/hantro_postproc.c
> > @@ -12,14 +12,14 @@
> >  #include "hantro_hw.h"
> >  #include "hantro_g1_regs.h"
> >  
> > -#define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
> > +#define hantro_pp_reg_write(vpu, reg_name, val) \
> >  { \
> >         hantro_reg_write(vpu, \
> >                          &(vpu)->variant->postproc_regs->reg_name,
> > \
> >                          val); \
> >  }
> >  
> > -#define HANTRO_PP_REG_WRITE_S(vpu, reg_name, val) \
> > +#define hantro_pp_reg_write_s(vpu, reg_name, val) \
> >  { \
> >         hantro_reg_write_s(vpu, \
> >                            &(vpu)->variant->postproc_regs-
> > >reg_name, \
> > @@ -61,7 +61,7 @@ void hantro_postproc_enable(struct hantro_ctx
> > *ctx)
> >                 return;
> >  
> >         /* Turn on pipeline mode. Must be done first. */
> > -       HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x1);
> > +       hantro_pp_reg_write_s(vpu, pipeline_en, 0x1);
> >  
> >         src_pp_fmt = VPU_PP_IN_NV12;
> >  
> > @@ -79,19 +79,19 @@ void hantro_postproc_enable(struct hantro_ctx
> > *ctx)
> >         dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> >         dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf,
> > 0);
> >  
> > -       HANTRO_PP_REG_WRITE(vpu, clk_gate, 0x1);
> > -       HANTRO_PP_REG_WRITE(vpu, out_endian, 0x1);
> > -       HANTRO_PP_REG_WRITE(vpu, out_swap32, 0x1);
> > -       HANTRO_PP_REG_WRITE(vpu, max_burst, 16);
> > -       HANTRO_PP_REG_WRITE(vpu, out_luma_base, dst_dma);
> > -       HANTRO_PP_REG_WRITE(vpu, input_width, MB_WIDTH(ctx-
> > >dst_fmt.width));
> > -       HANTRO_PP_REG_WRITE(vpu, input_height, MB_HEIGHT(ctx-
> > >dst_fmt.height));
> > -       HANTRO_PP_REG_WRITE(vpu, input_fmt, src_pp_fmt);
> > -       HANTRO_PP_REG_WRITE(vpu, output_fmt, dst_pp_fmt);
> > -       HANTRO_PP_REG_WRITE(vpu, output_width, ctx->dst_fmt.width);
> > -       HANTRO_PP_REG_WRITE(vpu, output_height, ctx-
> > >dst_fmt.height);
> > -       HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx-
> > >dst_fmt.width));
> > -       HANTRO_PP_REG_WRITE(vpu, display_width, ctx-
> > >dst_fmt.width);
> > +       hantro_pp_reg_write(vpu, clk_gate, 0x1);
> > +       hantro_pp_reg_write(vpu, out_endian, 0x1);
> > +       hantro_pp_reg_write(vpu, out_swap32, 0x1);
> > +       hantro_pp_reg_write(vpu, max_burst, 16);
> > +       hantro_pp_reg_write(vpu, out_luma_base, dst_dma);
> > +       hantro_pp_reg_write(vpu, input_width, MB_WIDTH(ctx-
> > >dst_fmt.width));
> > +       hantro_pp_reg_write(vpu, input_height, MB_HEIGHT(ctx-
> > >dst_fmt.height));
> > +       hantro_pp_reg_write(vpu, input_fmt, src_pp_fmt);
> > +       hantro_pp_reg_write(vpu, output_fmt, dst_pp_fmt);
> > +       hantro_pp_reg_write(vpu, output_width, ctx->dst_fmt.width);
> > +       hantro_pp_reg_write(vpu, output_height, ctx-
> > >dst_fmt.height);
> > +       hantro_pp_reg_write(vpu, orig_width, MB_WIDTH(ctx-
> > >dst_fmt.width));
> > +       hantro_pp_reg_write(vpu, display_width, ctx-
> > >dst_fmt.width);
> >  }
> >  
> >  void hantro_postproc_free(struct hantro_ctx *ctx)
> > @@ -146,5 +146,5 @@ void hantro_postproc_disable(struct hantro_ctx
> > *ctx)
> >         if (!vpu->variant->postproc_regs)
> >                 return;
> >  
> > -       HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x0);
> > +       hantro_pp_reg_write_s(vpu, pipeline_en, 0x0);
> >  }
> 
> 


