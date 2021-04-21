Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242E2366D4F
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 15:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243040AbhDUN5I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 09:57:08 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:35850 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243022AbhDUN4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 09:56:51 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3APaOKvqlP3Pcw0E0YrRiZALaqo8/pDfLN3DAb?=
 =?us-ascii?q?vn1ZSRFFG/GwvcaogfgdyFvImC8cMUtQ/eyoFaGcTRrnnqJdzpIWOd6ZNjXOmG?=
 =?us-ascii?q?ztF4166Jun/juIIUzD38p88YslTKRkEt33CjFB/KPHyS21CcwpztXC0I3Av4fj?=
 =?us-ascii?q?5kxgRw1rdK1shj0RYjqzKUF4SBJLApA0DvOnl6l6jgC9cncaZNnTPBc4dtXEzu?=
 =?us-ascii?q?emqLvbexIcQzYo5A6S5AnYioLSIlyomi0TVD5C2t4ZnFTtmQaR3Mqej80=3D?=
X-IronPort-AV: E=Sophos;i="5.82,240,1613430000"; 
   d="scan'208";a="504336688"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 15:56:08 +0200
Date:   Wed, 21 Apr 2021 15:56:08 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v3] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
In-Reply-To: <7aeac7041a6f6d7b3d8563f0d0bf0a4d31f379b0.camel@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2104211555040.9436@hadrien>
References: <20210421123718.GA4597@focaruja>  <alpine.DEB.2.22.394.2104211507280.9436@hadrien> <7aeac7041a6f6d7b3d8563f0d0bf0a4d31f379b0.camel@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1581330247-1619013368=:9436"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1581330247-1619013368=:9436
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Wed, 21 Apr 2021, Aline Santana Cordeiro wrote:

> Em qua, 2021-04-21 às 15:08 +0200, Julia Lawall escreveu:
> >
> >
> > On Wed, 21 Apr 2021, Aline Santana Cordeiro wrote:
> >
> > > Change line break to avoid an open parenthesis at the end of the
> > > line.
> > > It consequently removed spaces at the start of the subsequent line.
> >
> > The message is hard to understand.  There are a lot of singular
> > nouns, but
> > actually there are two changes.  Which change is being described by
> > the
> > above message?  What does "It" refer to?
> >
> > julia
>
> Checkpatch indicated two problems with this function declaration:
> 1) The line ending with an open parenthesis, and
> 2) The following line - with the function parameters - has spaces in
> its identation.
>
> When I changed the line break to put the function name and its
> parameter in the following line, both checkpath checks were eliminated.
>
> So, the main change was the line break and, also, the line break (it)
> removed the space in the following line.
>
> Is it better to change the message and explain only about the line
> break?

The message should explain about the whole patch.  So if you change two
things, it should be clear that what you are saying covers both of them.

But it seems that Matthew doesn't think that the line break is a good idea
anyway.

julia

>
> Thank you,
> Aline
> >
> >
> > > Both issues detected by checkpatch.pl.
> > >
> > > Signed-off-by: Aline Santana Cordeiro <
> > > alinesantanacordeiro@gmail.com>
> > > ---
> > >
> > > Changes since v2:
> > >  - Insert a space between the function type and pointer
> > >
> > > Changes since v1:
> > >  - Keep the pointer with the function return type
> > >    instead of left it with the function name
> > >
> > >  drivers/staging/media/atomisp/pci/atomisp_cmd.h | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> > > b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> > > index 1c0d464..639eca3 100644
> > > --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> > > +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> > > @@ -75,8 +75,8 @@ void atomisp_wdt(struct timer_list *t);
> > >  void atomisp_setup_flash(struct atomisp_sub_device *asd);
> > >  irqreturn_t atomisp_isr(int irq, void *dev);
> > >  irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
> > > -const struct atomisp_format_bridge
> > > *get_atomisp_format_bridge_from_mbus(
> > > -    u32 mbus_code);
> > > +const struct atomisp_format_bridge *
> > > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> > >  bool atomisp_is_mbuscode_raw(uint32_t code);
> > >  int atomisp_get_frame_pgnr(struct atomisp_device *isp,
> > >                            const struct ia_css_frame *frame, u32
> > > *p_pgnr);
> > > @@ -381,9 +381,9 @@ enum mipi_port_id __get_mipi_port(struct
> > > atomisp_device *isp,
> > >
> > >  bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe);
> > >
> > > -void atomisp_apply_css_parameters(
> > > -    struct atomisp_sub_device *asd,
> > > -    struct atomisp_css_params *css_param);
> > > +void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
> > > +                                 struct atomisp_css_params
> > > *css_param);
> > > +
> > >  void atomisp_free_css_parameters(struct atomisp_css_params
> > > *css_param);
> > >
> > >  void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe
> > > *pipe);
> > > --
> > > 2.7.4
> > >
> > > --
> > > You received this message because you are subscribed to the Google
> > > Groups "outreachy-kernel" group.
> > > To unsubscribe from this group and stop receiving emails from it,
> > > send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > > To view this discussion on the web visit
> > > https://groups.google.com/d/msgid/outreachy-kernel/20210421123718.GA4597%40focaruja
> > > .
> > >
>
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/7aeac7041a6f6d7b3d8563f0d0bf0a4d31f379b0.camel%40gmail.com.
>
--8323329-1581330247-1619013368=:9436--
