Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3231335A4C7
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 19:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234133AbhDIRjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 13:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbhDIRjp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 13:39:45 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5AA0C061761;
        Fri,  9 Apr 2021 10:39:30 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id z10so6592634qkz.13;
        Fri, 09 Apr 2021 10:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OnTY5y3eYrrxwZB5KHZ1/v8b3bP4FnskuWxwou/nbxo=;
        b=U02vN17LFVbz6VVjKj4k5ibo/v6+znUxgRqNthWqDOuDYzXxS95p+//dfeu/U7KsKC
         9IY8rwNe+zcGDRVKBQBeTKViJwoPVOUq1TwLfSNgetjXlDCexI+B/Bu9rnO+z43wPU/s
         pmJPdZqNOzmgjnEa+TbhH6doW0Gts3kj3gDhk4K6B9PserHZzObCWBMVg3KcFaDZh5tn
         cc9fJ4/YE+Xzg819a/Oq9gLuBxvXAK7cyMi0pDlnfUGsloL046s9GZxwtOC8bg+rfoi2
         yuGa2qSbLyV37Q6EgSVeV0TH/3zb6nEejBipCTaYIpL+b+9wT21hGDs1gpU5jkFHi+WZ
         KNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OnTY5y3eYrrxwZB5KHZ1/v8b3bP4FnskuWxwou/nbxo=;
        b=PIMV6BpcZWE0ewEePScwrAi53k9BVvW3mKlpnfUr7k53MO5kpBRRAEoMjZvgdAruxj
         2Kw7Q2IWfdf8pdt0h5MkdZ+5/xBeFKzERyb8m0gA1iC/LFcN7bFTQe+rd/OmzxDTlnwG
         zg9fihaF28TsrHoqrf9l9/IqpByZ8fX/JCYyxOLqnZjV12fM1qf5MKI/Yi+wHarGeCCn
         bHo7gjUIKDhKIA3ZEbtN2uUSa2AvQjT6qqq8E9WETIjpJt+0c+GZnVjvpVOXkOg12Yy1
         jFbBChLvLkudw0lLgwGstOu9QjXEItWmQSjr4FuuygrAl7awlYzLN64wZ7iMj/jHjHsx
         NYSg==
X-Gm-Message-State: AOAM532x9CgRBUmKeQhEj28DKxeLnJIU6tbk08NCyRorXb5B63kz56/M
        RE91nGr/cspUd6iTfDDdB5E=
X-Google-Smtp-Source: ABdhPJzHp/04iiHQ8Rj4I128arYBCkvpCenM43Sv0oanC1BAM6zCtKOWdD++rOrgke6oySyv/y7Rrw==
X-Received: by 2002:a05:620a:144d:: with SMTP id i13mr15368868qkl.263.1617989970116;
        Fri, 09 Apr 2021 10:39:30 -0700 (PDT)
Received: from [192.168.100.7] ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id g17sm2189015qts.93.2021.04.09.10.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 10:39:29 -0700 (PDT)
Message-ID: <380b24cec19eb4fb765b8a136d8525eec030c1ba.camel@gmail.com>
Subject: Re: [Outreachy kernel][PATCH] staging: media: hantro: Rewrite macro
 function in lower case
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Fri, 09 Apr 2021 14:39:26 -0300
In-Reply-To: <alpine.DEB.2.22.394.2104091924510.17316@hadrien>
References: <20210409135404.GA26172@focaruja>
          <9c09806cce4c7e5c5f0dc03e8c502cf29716f00f.camel@collabora.com>
         <138794d79c42510d9b6ae744df20216904773032.camel@gmail.com>
         <alpine.DEB.2.22.394.2104091924510.17316@hadrien>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em sex, 2021-04-09 às 19:25 +0200, Julia Lawall escreveu:
> 
> 
> On Fri, 9 Apr 2021, ascordeiro wrote:
> 
> > Em sex, 2021-04-09 às 13:44 -0300, Ezequiel Garcia escreveu:
> > > Hi Aline,
> > 
> > Hi Ezequiel,
> > > 
> > > On Fri, 2021-04-09 at 10:54 -0300, Aline Santana Cordeiro wrote:
> > > > Rewrite macros resembling functions #define HANTRO_PP_REG_WRITE
> > > > and #define HANTRO_PP_RED_WRITE_S in lower case, according with
> > > > code style.
> 
> Maybe you can see if these macros can be converted to static inline
> functions.  Macros don't provide any type checking.

Okay! I'm going to check this option.

Thank you for the advice!
Aline
> 

> julia
> 
> > > > 
> > > 
> > > Where is this written in the Coding Style?
> > 
> > I found this in section 12, about Macros, Enums and RTL in both
> > references:
> > https://www.kernel.org/doc/html/latest/process/coding-style.html
> > https://elixir.bootlin.com/linux/latest/source/Documentation/process/coding-style.rst
> > > 
> > > Thanks!
> > > Ezequiel
> > 
> > Thank you!
> > Aline
> > > 
> > > > Signed-off-by: Aline Santana Cordeiro <
> > > > alinesantanacordeiro@gmail.com>
> > > > ---
> > > >  drivers/staging/media/hantro/hantro_postproc.c | 34
> > > > +++++++++++++-
> > > > ------------
> > > >  1 file changed, 17 insertions(+), 17 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/media/hantro/hantro_postproc.c
> > > > b/drivers/staging/media/hantro/hantro_postproc.c
> > > > index 6d2a8f2a..06279c0 100644
> > > > --- a/drivers/staging/media/hantro/hantro_postproc.c
> > > > +++ b/drivers/staging/media/hantro/hantro_postproc.c
> > > > @@ -12,14 +12,14 @@
> > > >  #include "hantro_hw.h"
> > > >  #include "hantro_g1_regs.h"
> > > >  
> > > > -#define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
> > > > +#define hantro_pp_reg_write(vpu, reg_name, val) \
> > > >  { \
> > > >         hantro_reg_write(vpu, \
> > > >                          &(vpu)->variant->postproc_regs-
> > > > >reg_name,
> > > > \
> > > >                          val); \
> > > >  }
> > > >  
> > > > -#define HANTRO_PP_REG_WRITE_S(vpu, reg_name, val) \
> > > > +#define hantro_pp_reg_write_s(vpu, reg_name, val) \
> > > >  { \
> > > >         hantro_reg_write_s(vpu, \
> > > >                            &(vpu)->variant->postproc_regs-
> > > > > reg_name, \
> > > > @@ -61,7 +61,7 @@ void hantro_postproc_enable(struct hantro_ctx
> > > > *ctx)
> > > >                 return;
> > > >  
> > > >         /* Turn on pipeline mode. Must be done first. */
> > > > -       HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x1);
> > > > +       hantro_pp_reg_write_s(vpu, pipeline_en, 0x1);
> > > >  
> > > >         src_pp_fmt = VPU_PP_IN_NV12;
> > > >  
> > > > @@ -79,19 +79,19 @@ void hantro_postproc_enable(struct
> > > > hantro_ctx
> > > > *ctx)
> > > >         dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > > >         dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf-
> > > > >vb2_buf,
> > > > 0);
> > > >  
> > > > -       HANTRO_PP_REG_WRITE(vpu, clk_gate, 0x1);
> > > > -       HANTRO_PP_REG_WRITE(vpu, out_endian, 0x1);
> > > > -       HANTRO_PP_REG_WRITE(vpu, out_swap32, 0x1);
> > > > -       HANTRO_PP_REG_WRITE(vpu, max_burst, 16);
> > > > -       HANTRO_PP_REG_WRITE(vpu, out_luma_base, dst_dma);
> > > > -       HANTRO_PP_REG_WRITE(vpu, input_width, MB_WIDTH(ctx-
> > > > > dst_fmt.width));
> > > > -       HANTRO_PP_REG_WRITE(vpu, input_height, MB_HEIGHT(ctx-
> > > > > dst_fmt.height));
> > > > -       HANTRO_PP_REG_WRITE(vpu, input_fmt, src_pp_fmt);
> > > > -       HANTRO_PP_REG_WRITE(vpu, output_fmt, dst_pp_fmt);
> > > > -       HANTRO_PP_REG_WRITE(vpu, output_width, ctx-
> > > > >dst_fmt.width);
> > > > -       HANTRO_PP_REG_WRITE(vpu, output_height, ctx-
> > > > > dst_fmt.height);
> > > > -       HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx-
> > > > > dst_fmt.width));
> > > > -       HANTRO_PP_REG_WRITE(vpu, display_width, ctx-
> > > > > dst_fmt.width);
> > > > +       hantro_pp_reg_write(vpu, clk_gate, 0x1);
> > > > +       hantro_pp_reg_write(vpu, out_endian, 0x1);
> > > > +       hantro_pp_reg_write(vpu, out_swap32, 0x1);
> > > > +       hantro_pp_reg_write(vpu, max_burst, 16);
> > > > +       hantro_pp_reg_write(vpu, out_luma_base, dst_dma);
> > > > +       hantro_pp_reg_write(vpu, input_width, MB_WIDTH(ctx-
> > > > > dst_fmt.width));
> > > > +       hantro_pp_reg_write(vpu, input_height, MB_HEIGHT(ctx-
> > > > > dst_fmt.height));
> > > > +       hantro_pp_reg_write(vpu, input_fmt, src_pp_fmt);
> > > > +       hantro_pp_reg_write(vpu, output_fmt, dst_pp_fmt);
> > > > +       hantro_pp_reg_write(vpu, output_width, ctx-
> > > > >dst_fmt.width);
> > > > +       hantro_pp_reg_write(vpu, output_height, ctx-
> > > > > dst_fmt.height);
> > > > +       hantro_pp_reg_write(vpu, orig_width, MB_WIDTH(ctx-
> > > > > dst_fmt.width));
> > > > +       hantro_pp_reg_write(vpu, display_width, ctx-
> > > > > dst_fmt.width);
> > > >  }
> > > >  
> > > >  void hantro_postproc_free(struct hantro_ctx *ctx)
> > > > @@ -146,5 +146,5 @@ void hantro_postproc_disable(struct
> > > > hantro_ctx
> > > > *ctx)
> > > >         if (!vpu->variant->postproc_regs)
> > > >                 return;
> > > >  
> > > > -       HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x0);
> > > > +       hantro_pp_reg_write_s(vpu, pipeline_en, 0x0);
> > > >  }
> > > 
> > > 
> > 
> > 
> > --
> > You received this message because you are subscribed to the Google
> > Groups "outreachy-kernel" group.
> > To unsubscribe from this group and stop receiving emails from it,
> > send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit  
> > https://groups.google.com/d/msgid/outreachy-kernel/138794d79c42510d9b6ae744df20216904773032.camel%40gmail.com
> > .


