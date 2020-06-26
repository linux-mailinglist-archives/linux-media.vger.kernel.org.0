Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF62920B84A
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 20:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgFZScT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 14:32:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53248 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgFZScT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 14:32:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 7D5122A5E82
Message-ID: <7c9c5240c00764bf55f3ab51602e91ad8cf539ec.camel@collabora.com>
Subject: Re: [PATCH 3/6] hantro: Rework how encoder and decoder are
 identified
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Robin Murphy <robin.murphy@arm.com>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Philipp Zabel <p.zabel@pengutronix.de>
Date:   Fri, 26 Jun 2020 15:31:36 -0300
In-Reply-To: <119b9832-c1bc-9010-cca6-ea82d61c8e9b@arm.com>
References: <20200625163525.5119-1-ezequiel@collabora.com>
         <20200625163525.5119-4-ezequiel@collabora.com>
         <119b9832-c1bc-9010-cca6-ea82d61c8e9b@arm.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-06-26 at 10:52 +0100, Robin Murphy wrote:
> Hi Ezequiel,
> 
> On 2020-06-25 17:35, Ezequiel Garcia wrote:
> > So far we've been using the .buf_finish hook to distinguish
> > decoder from encoder. This is unnecessarily obfuscated.
> > 
> > Moreover, we want to move the buf_finish, so use a cleaner
> > scheme to distinguish the driver decoder/encoder type.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >   drivers/staging/media/hantro/hantro.h     | 2 ++
> >   drivers/staging/media/hantro/hantro_drv.c | 4 +++-
> >   2 files changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> > index 3005207fc6fb..028b788ad50f 100644
> > --- a/drivers/staging/media/hantro/hantro.h
> > +++ b/drivers/staging/media/hantro/hantro.h
> > @@ -199,6 +199,7 @@ struct hantro_dev {
> >    *
> >    * @dev:		VPU driver data to which the context belongs.
> >    * @fh:			V4L2 file handler.
> > + * @is_encoder:		Decoder or encoder context?
> >    *
> >    * @sequence_cap:       Sequence counter for capture queue
> >    * @sequence_out:       Sequence counter for output queue
> > @@ -223,6 +224,7 @@ struct hantro_dev {
> >   struct hantro_ctx {
> >   	struct hantro_dev *dev;
> >   	struct v4l2_fh fh;
> > +	bool is_encoder;
> >   
> >   	u32 sequence_cap;
> >   	u32 sequence_out;
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > index 0db8ad455160..112ed556eb90 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -197,7 +197,7 @@ static void device_run(void *priv)
> >   
> >   bool hantro_is_encoder_ctx(const struct hantro_ctx *ctx)
> >   {
> > -	return ctx->buf_finish == hantro_enc_buf_finish;
> > +	return ctx->is_encoder;
> 
> FWIW I'd suggest removing the wrapper function entirely now - it makes 
> sense when the check itself is implemented in a weird and non-obvious 
> way, but a simple boolean flag named exactly what it means is already 
> about as clear as it can get.
> 

Indeed, Philipp pointed out the same thing.

Makes perfect sense, and thanks a lot for reviewing.

Ezequiel

