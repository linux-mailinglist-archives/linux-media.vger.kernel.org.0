Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F0935A499
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 19:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233896AbhDIR0K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 13:26:10 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:32642
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232855AbhDIR0G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 13:26:06 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AO+INOKBl1Ckl5/jlHelN55DYdL4zR+YMi2QD?=
 =?us-ascii?q?/UZ3VBBTb4ikh9mj9c5rsSPcpT4NVBgb8uyoF7KHRRrnn6JdwY5UBru6WRmjhW?=
 =?us-ascii?q?3AFuBfxK/D5xGlJCHk7O5a0s5bAs1DIfn9F0Jzg8q/wCTQKbYd6eKK+qypmuvS?=
 =?us-ascii?q?pk0FJT1CUK1u4xx0DQyWCCRNNWp7LKAkH5mR7NcvnVSdUEkQB/7WOlA4ReTZ4/?=
 =?us-ascii?q?XEmJX6CCR2ZSIP2U2+yQml77P3CHGjsys2WTkn+9gfzVQ=3D?=
X-IronPort-AV: E=Sophos;i="5.82,210,1613430000"; 
   d="scan'208";a="378242820"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 19:25:52 +0200
Date:   Fri, 9 Apr 2021 19:25:51 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     ascordeiro <alinesantanacordeiro@gmail.com>
cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel][PATCH] staging: media: hantro: Rewrite macro
 function in lower case
In-Reply-To: <138794d79c42510d9b6ae744df20216904773032.camel@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2104091924510.17316@hadrien>
References: <20210409135404.GA26172@focaruja>  <9c09806cce4c7e5c5f0dc03e8c502cf29716f00f.camel@collabora.com> <138794d79c42510d9b6ae744df20216904773032.camel@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1805071512-1617989152=:17316"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1805071512-1617989152=:17316
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 9 Apr 2021, ascordeiro wrote:

> Em sex, 2021-04-09 às 13:44 -0300, Ezequiel Garcia escreveu:
> > Hi Aline,
>
> Hi Ezequiel,
> >
> > On Fri, 2021-04-09 at 10:54 -0300, Aline Santana Cordeiro wrote:
> > > Rewrite macros resembling functions #define HANTRO_PP_REG_WRITE
> > > and #define HANTRO_PP_RED_WRITE_S in lower case, according with
> > > code style.

Maybe you can see if these macros can be converted to static inline
functions.  Macros don't provide any type checking.

julia

> > >
> >
> > Where is this written in the Coding Style?
>
> I found this in section 12, about Macros, Enums and RTL in both
> references:
> https://www.kernel.org/doc/html/latest/process/coding-style.html
> https://elixir.bootlin.com/linux/latest/source/Documentation/process/coding-style.rst
> >
> > Thanks!
> > Ezequiel
>
> Thank you!
> Aline
> >
> > > Signed-off-by: Aline Santana Cordeiro <
> > > alinesantanacordeiro@gmail.com>
> > > ---
> > >  drivers/staging/media/hantro/hantro_postproc.c | 34 +++++++++++++-
> > > ------------
> > >  1 file changed, 17 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/hantro/hantro_postproc.c
> > > b/drivers/staging/media/hantro/hantro_postproc.c
> > > index 6d2a8f2a..06279c0 100644
> > > --- a/drivers/staging/media/hantro/hantro_postproc.c
> > > +++ b/drivers/staging/media/hantro/hantro_postproc.c
> > > @@ -12,14 +12,14 @@
> > >  #include "hantro_hw.h"
> > >  #include "hantro_g1_regs.h"
> > >  
> > > -#define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
> > > +#define hantro_pp_reg_write(vpu, reg_name, val) \
> > >  { \
> > >         hantro_reg_write(vpu, \
> > >                          &(vpu)->variant->postproc_regs->reg_name,
> > > \
> > >                          val); \
> > >  }
> > >  
> > > -#define HANTRO_PP_REG_WRITE_S(vpu, reg_name, val) \
> > > +#define hantro_pp_reg_write_s(vpu, reg_name, val) \
> > >  { \
> > >         hantro_reg_write_s(vpu, \
> > >                            &(vpu)->variant->postproc_regs-
> > > >reg_name, \
> > > @@ -61,7 +61,7 @@ void hantro_postproc_enable(struct hantro_ctx
> > > *ctx)
> > >                 return;
> > >  
> > >         /* Turn on pipeline mode. Must be done first. */
> > > -       HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x1);
> > > +       hantro_pp_reg_write_s(vpu, pipeline_en, 0x1);
> > >  
> > >         src_pp_fmt = VPU_PP_IN_NV12;
> > >  
> > > @@ -79,19 +79,19 @@ void hantro_postproc_enable(struct hantro_ctx
> > > *ctx)
> > >         dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > >         dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf,
> > > 0);
> > >  
> > > -       HANTRO_PP_REG_WRITE(vpu, clk_gate, 0x1);
> > > -       HANTRO_PP_REG_WRITE(vpu, out_endian, 0x1);
> > > -       HANTRO_PP_REG_WRITE(vpu, out_swap32, 0x1);
> > > -       HANTRO_PP_REG_WRITE(vpu, max_burst, 16);
> > > -       HANTRO_PP_REG_WRITE(vpu, out_luma_base, dst_dma);
> > > -       HANTRO_PP_REG_WRITE(vpu, input_width, MB_WIDTH(ctx-
> > > >dst_fmt.width));
> > > -       HANTRO_PP_REG_WRITE(vpu, input_height, MB_HEIGHT(ctx-
> > > >dst_fmt.height));
> > > -       HANTRO_PP_REG_WRITE(vpu, input_fmt, src_pp_fmt);
> > > -       HANTRO_PP_REG_WRITE(vpu, output_fmt, dst_pp_fmt);
> > > -       HANTRO_PP_REG_WRITE(vpu, output_width, ctx->dst_fmt.width);
> > > -       HANTRO_PP_REG_WRITE(vpu, output_height, ctx-
> > > >dst_fmt.height);
> > > -       HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx-
> > > >dst_fmt.width));
> > > -       HANTRO_PP_REG_WRITE(vpu, display_width, ctx-
> > > >dst_fmt.width);
> > > +       hantro_pp_reg_write(vpu, clk_gate, 0x1);
> > > +       hantro_pp_reg_write(vpu, out_endian, 0x1);
> > > +       hantro_pp_reg_write(vpu, out_swap32, 0x1);
> > > +       hantro_pp_reg_write(vpu, max_burst, 16);
> > > +       hantro_pp_reg_write(vpu, out_luma_base, dst_dma);
> > > +       hantro_pp_reg_write(vpu, input_width, MB_WIDTH(ctx-
> > > >dst_fmt.width));
> > > +       hantro_pp_reg_write(vpu, input_height, MB_HEIGHT(ctx-
> > > >dst_fmt.height));
> > > +       hantro_pp_reg_write(vpu, input_fmt, src_pp_fmt);
> > > +       hantro_pp_reg_write(vpu, output_fmt, dst_pp_fmt);
> > > +       hantro_pp_reg_write(vpu, output_width, ctx->dst_fmt.width);
> > > +       hantro_pp_reg_write(vpu, output_height, ctx-
> > > >dst_fmt.height);
> > > +       hantro_pp_reg_write(vpu, orig_width, MB_WIDTH(ctx-
> > > >dst_fmt.width));
> > > +       hantro_pp_reg_write(vpu, display_width, ctx-
> > > >dst_fmt.width);
> > >  }
> > >  
> > >  void hantro_postproc_free(struct hantro_ctx *ctx)
> > > @@ -146,5 +146,5 @@ void hantro_postproc_disable(struct hantro_ctx
> > > *ctx)
> > >         if (!vpu->variant->postproc_regs)
> > >                 return;
> > >  
> > > -       HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x0);
> > > +       hantro_pp_reg_write_s(vpu, pipeline_en, 0x0);
> > >  }
> >
> >
>
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/138794d79c42510d9b6ae744df20216904773032.camel%40gmail.com.
>
--8323329-1805071512-1617989152=:17316--
