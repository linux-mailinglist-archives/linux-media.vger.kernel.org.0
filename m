Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EECD3A8334
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 14:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730065AbfIDMu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 08:50:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49600 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727675AbfIDMu1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 08:50:27 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 89EB928B992
Message-ID: <5e4b569ff2e8a36a828f3623e71943bd23e795b5.camel@collabora.com>
Subject: Re: [PATCH 3/4] media: hantro: Add helper for the H264 motion
 vectors allocation
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>
Date:   Wed, 04 Sep 2019 09:50:16 -0300
In-Reply-To: <1567592270.3041.4.camel@pengutronix.de>
References: <20190903181711.7559-1-ezequiel@collabora.com>
         <20190903181711.7559-4-ezequiel@collabora.com>
         <1567592270.3041.4.camel@pengutronix.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-09-04 at 12:17 +0200, Philipp Zabel wrote:
> On Tue, 2019-09-03 at 15:17 -0300, Ezequiel Garcia wrote:
> > Introduce a helper to allow easier enablement of the post-processing
> > feature. No functional changes intended.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/staging/media/hantro/hantro.h      | 6 ++++++
> >  drivers/staging/media/hantro/hantro_v4l2.c | 4 ++--
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> > index deb90ae37859..e8872f24e351 100644
> > --- a/drivers/staging/media/hantro/hantro.h
> > +++ b/drivers/staging/media/hantro/hantro.h
> > @@ -381,4 +381,10 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
> >  	return v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> >  }
> >  
> > +static inline unsigned int
> > +hantro_h264_buffer_extra_size(unsigned int width, unsigned int height)
> > +
> > +	return 128 * MB_WIDTH(width) * MB_HEIGHT(height);
> > +}
> 
> This doesn't seem to be used or modified by patch 4 at all?
> 

Oh, thanks for spotting this. Indeed, this patch is superflous.
The helper was used, but then after cleaning-up hantro_postproc.c
I realized it wasn't needed.

We can drop this one, but OTOH hiding the H264 extra size seems
a nice cleanup. Perhaps Jonas can grab this patch as part
of his improvements series.

Thanks,
Ezequiel

