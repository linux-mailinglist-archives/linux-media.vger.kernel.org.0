Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15DC8120059
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 09:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfLPIyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 03:54:24 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55904 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfLPIyY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 03:54:24 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 08BAE28A017;
        Mon, 16 Dec 2019 08:54:22 +0000 (GMT)
Date:   Mon, 16 Dec 2019 09:54:19 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Hugh Cole-Baker <sigmaris@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-rockchip@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v3 4/7] media: hantro: h264: Use the generic H264
 reflist builder
Message-ID: <20191216095419.4dfb8501@collabora.com>
In-Reply-To: <24EFC68C-CF34-4D6E-8927-1CFA0CE81F45@gmail.com>
References: <20191213125414.90725-1-boris.brezillon@collabora.com>
        <20191213125414.90725-5-boris.brezillon@collabora.com>
        <24EFC68C-CF34-4D6E-8927-1CFA0CE81F45@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 14 Dec 2019 15:46:35 +0000
Hugh Cole-Baker <sigmaris@gmail.com> wrote:

> Hi Boris,
> 
> > On 13 Dec 2019, at 12:54, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > 
> > Now that the core provides generic reflist builders, we can use them
> > instead of implementing our own.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Changes in v3:
> > * New patch
> > ---
> > drivers/staging/media/hantro/hantro_h264.c | 237 +--------------------
> > 1 file changed, 8 insertions(+), 229 deletions(-)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
> > index 568640eab3a6..d998272d20e6 100644
> > --- a/drivers/staging/media/hantro/hantro_h264.c
> > +++ b/drivers/staging/media/hantro/hantro_h264.c
> > @@ -11,7 +11,7 @@
> >  */
> > 
> > #include <linux/types.h>
> > -#include <linux/sort.h>
> > +#include <media/v4l2-h264.h>  
> 
> With this patch, CONFIG_VIDEO_HANTRO needs to depend on CONFIG_V4L2_H264,
> without that it can encounter linking errors due to missing symbols for
> v4l2_h264_init_reflist_builder, etc.

Oops, you're right (I didn't notice it since I had it selected by
CONFIG_VIDEO_ROCKCHIP_VDEC). I'll fix that in v4.

Thanks,

Boris
