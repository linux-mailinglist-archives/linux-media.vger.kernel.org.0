Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 862AA35A4C9
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 19:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234329AbhDIRkT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 13:40:19 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:29050
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232855AbhDIRkS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 13:40:18 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ARdUDBKr7afeAYrB61hz0uckaV5rKeYIsi2QD?=
 =?us-ascii?q?101hICF9WMqeisyogbAnxQb54QxhPE0ItNicNMC7Kk/02oVy5eAqV4uKfA6jg2?=
 =?us-ascii?q?ewKZEn0I2K+VzdMgnf0sIY6qt6aah5D7TLfD1HpOL3+hOxHdpl4PTvysCVrNzT?=
 =?us-ascii?q?xXtsUg1mApsIhztRMQqVHlZ7QwNLH/MCZfmhz/BarDmtc2l/VKqGL0QCNtKum/?=
 =?us-ascii?q?T2jp78JTYJCxk7gTP+7w+A2frKVyKV2RoTSFp0rIsK+2KtqWPE2pk=3D?=
X-IronPort-AV: E=Sophos;i="5.82,210,1613430000"; 
   d="scan'208";a="378243606"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 19:39:33 +0200
Date:   Fri, 9 Apr 2021 19:39:33 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Ezequiel Garcia <ezequiel@collabora.com>
cc:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] Re: [PATCH 1/2 v2] staging: media: hantro:
 Align line break to the open parenthesis in file hantro_hw.h
In-Reply-To: <d4000598fddcf45e578462aa04b556c0ca057091.camel@collabora.com>
Message-ID: <alpine.DEB.2.22.394.2104091939090.17316@hadrien>
References: <cover.1617890467.git.alinesantanacordeiro@gmail.com>  <1e6d73432d60dfb8bb3f7f2bd6bf3084091a2a39.1617890467.git.alinesantanacordeiro@gmail.com> <d4000598fddcf45e578462aa04b556c0ca057091.camel@collabora.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-31552551-1617989973=:17316"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-31552551-1617989973=:17316
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 8 Apr 2021, Ezequiel Garcia wrote:

> Ola Aline,
>
> Welcome to the kernel community. Hope you enjoy some of this
> Outreachy adventures.
>
> Normally, when you submit a v2, we want to know what changed
> between the first submission and v2.
>
> If you are subscribed to linux-media, you can read some
> of the series with a vN+1 and look how it's done. Examples:
>
> https://www.spinics.net/lists/linux-media/msg190043.html
>
> https://www.spinics.net/lists/linux-media/msg189923.html
>
> I'm sure your Outreachy mentors can tell you more.

There is information in the kernelnewbies tutorial about how to resubmit
patches.

julia

>
> On Thu, 2021-04-08 at 11:07 -0300, Aline Santana Cordeiro wrote:
> > Aligns line break with the remaining function arguments
> > to the open parenthesis. Issue found by checkpatch.
> >
> > Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> > ---
> >  drivers/staging/media/hantro/hantro_hw.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> > index 34c9e46..a650b9c 100644
> > --- a/drivers/staging/media/hantro/hantro_hw.h
> > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > @@ -207,7 +207,7 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
> >  void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
> >  void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
> >  void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
> > -       const struct v4l2_ctrl_mpeg2_quantization *ctrl);
> > +                                 const struct v4l2_ctrl_mpeg2_quantization *ctrl);
> >  int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
> >  void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
> >  
>
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/d4000598fddcf45e578462aa04b556c0ca057091.camel%40collabora.com.
>
--8323329-31552551-1617989973=:17316--
