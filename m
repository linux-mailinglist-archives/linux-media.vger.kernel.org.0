Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC4260ADC
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 19:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbfGERRW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 5 Jul 2019 13:17:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37428 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbfGERRW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 13:17:22 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D0F9928B61B;
        Fri,  5 Jul 2019 18:17:19 +0100 (BST)
Date:   Fri, 5 Jul 2019 19:17:16 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 3/9] media: hantro: Constify the control array
Message-ID: <20190705191716.41ea819e@collabora.com>
In-Reply-To: <1fdb3115e6f5903b55a915c45bbfdec484842e83.camel@collabora.com>
References: <20190619121540.29320-1-boris.brezillon@collabora.com>
        <20190619121540.29320-4-boris.brezillon@collabora.com>
        <1fdb3115e6f5903b55a915c45bbfdec484842e83.camel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 05 Jul 2019 13:05:10 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> On Wed, 2019-06-19 at 14:15 +0200, Boris Brezillon wrote:
> > controls[] is not supposed to be modified at runtime, let's make it
> > explicit by adding a const specifier.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/staging/media/hantro/hantro_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > index 28b0fed89dcb..db49d643ddb7 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -264,7 +264,7 @@ static const struct v4l2_ctrl_ops hantro_ctrl_ops = {
> >  	.s_ctrl = hantro_s_ctrl,
> >  };
> >  
> > -static struct hantro_ctrl controls[] = {
> > +static const struct hantro_ctrl controls[] = {
> >  	{
> >  		.id = V4L2_CID_JPEG_COMPRESSION_QUALITY,
> >  		.codec = HANTRO_JPEG_ENCODER,  
> 
> This patch here breaks the build:
> 
>   CC [M]  drivers/staging/media/hantro/hantro_drv.o
> /home/zeta/repos/linux/media_tree/drivers/staging/media/hantro/hantro_drv.c: In function ‘hantro_ctrls_setup’:
> /home/zeta/repos/linux/media_tree/drivers/staging/media/hantro/hantro_drv.c:319:23: error: assignment of member ‘id’ in read-only object
>     controls[i].cfg.id = controls[i].id;
>                        ^

Oops, didn't check bisectability.

> You can fix it by simply moving it after:
> 
> [PATCH 4/9] media: hantro: Simplify the controls creation logic

Yep, I'll do that.

Thanks,

Boris
