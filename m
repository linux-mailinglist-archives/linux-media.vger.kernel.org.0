Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9685C20B845
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 20:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbgFZSba (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 14:31:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53242 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgFZSba (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 14:31:30 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 93A7D2A5E82
Message-ID: <74bf00b2df05d9ee373a41a8328f8ee43816a0b9.camel@collabora.com>
Subject: Re: [PATCH 3/6] hantro: Rework how encoder and decoder are
 identified
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>
Date:   Fri, 26 Jun 2020 15:30:48 -0300
In-Reply-To: <5d18057b7bc686eeb470810acd3ab63f9b4bf224.camel@pengutronix.de>
References: <20200625163525.5119-1-ezequiel@collabora.com>
         <20200625163525.5119-4-ezequiel@collabora.com>
         <5d18057b7bc686eeb470810acd3ab63f9b4bf224.camel@pengutronix.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-06-26 at 09:58 +0200, Philipp Zabel wrote:
> Hi Ezequiel,
> 
> On Thu, 2020-06-25 at 13:35 -0300, Ezequiel Garcia wrote:
> > So far we've been using the .buf_finish hook to distinguish
> > decoder from encoder. This is unnecessarily obfuscated.
> > 
> > Moreover, we want to move the buf_finish, so use a cleaner
> > scheme to distinguish the driver decoder/encoder type.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/staging/media/hantro/hantro.h     | 2 ++
> >  drivers/staging/media/hantro/hantro_drv.c | 4 +++-
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> > index 3005207fc6fb..028b788ad50f 100644
> > --- a/drivers/staging/media/hantro/hantro.h
> > +++ b/drivers/staging/media/hantro/hantro.h
> > @@ -199,6 +199,7 @@ struct hantro_dev {
> >   *
> >   * @dev:		VPU driver data to which the context belongs.
> >   * @fh:			V4L2 file handler.
> > + * @is_encoder:		Decoder or encoder context?
> >   *
> >   * @sequence_cap:       Sequence counter for capture queue
> >   * @sequence_out:       Sequence counter for output queue
> > @@ -223,6 +224,7 @@ struct hantro_dev {
> >  struct hantro_ctx {
> >  	struct hantro_dev *dev;
> >  	struct v4l2_fh fh;
> > +	bool is_encoder;
> >  
> >  	u32 sequence_cap;
> >  	u32 sequence_out;
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > index 0db8ad455160..112ed556eb90 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -197,7 +197,7 @@ static void device_run(void *priv)
> >  
> >  bool hantro_is_encoder_ctx(const struct hantro_ctx *ctx)
> >  {
> > -	return ctx->buf_finish == hantro_enc_buf_finish;
> > +	return ctx->is_encoder;
> >  }
> 
> Now this function feels a little superfluous. Why not replace
>   hantro_is_encoder_ctx(ctx)
> with
>   ctx->is_encoder
> everywhere?
> 

Absolutely.

Thanks for reviewing,
Ezequiel

