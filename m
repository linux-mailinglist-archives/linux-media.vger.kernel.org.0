Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5200F20AD9B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 09:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728880AbgFZH67 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 26 Jun 2020 03:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728866AbgFZH66 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 03:58:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87121C08C5C1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 00:58:58 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jojGD-0004Vx-5t; Fri, 26 Jun 2020 09:58:57 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jojGC-0005Dc-MH; Fri, 26 Jun 2020 09:58:56 +0200
Message-ID: <5d18057b7bc686eeb470810acd3ab63f9b4bf224.camel@pengutronix.de>
Subject: Re: [PATCH 3/6] hantro: Rework how encoder and decoder are
 identified
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>
Date:   Fri, 26 Jun 2020 09:58:56 +0200
In-Reply-To: <20200625163525.5119-4-ezequiel@collabora.com>
References: <20200625163525.5119-1-ezequiel@collabora.com>
         <20200625163525.5119-4-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Thu, 2020-06-25 at 13:35 -0300, Ezequiel Garcia wrote:
> So far we've been using the .buf_finish hook to distinguish
> decoder from encoder. This is unnecessarily obfuscated.
> 
> Moreover, we want to move the buf_finish, so use a cleaner
> scheme to distinguish the driver decoder/encoder type.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro.h     | 2 ++
>  drivers/staging/media/hantro/hantro_drv.c | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 3005207fc6fb..028b788ad50f 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -199,6 +199,7 @@ struct hantro_dev {
>   *
>   * @dev:		VPU driver data to which the context belongs.
>   * @fh:			V4L2 file handler.
> + * @is_encoder:		Decoder or encoder context?
>   *
>   * @sequence_cap:       Sequence counter for capture queue
>   * @sequence_out:       Sequence counter for output queue
> @@ -223,6 +224,7 @@ struct hantro_dev {
>  struct hantro_ctx {
>  	struct hantro_dev *dev;
>  	struct v4l2_fh fh;
> +	bool is_encoder;
>  
>  	u32 sequence_cap;
>  	u32 sequence_out;
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 0db8ad455160..112ed556eb90 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -197,7 +197,7 @@ static void device_run(void *priv)
>  
>  bool hantro_is_encoder_ctx(const struct hantro_ctx *ctx)
>  {
> -	return ctx->buf_finish == hantro_enc_buf_finish;
> +	return ctx->is_encoder;
>  }

Now this function feels a little superfluous. Why not replace
  hantro_is_encoder_ctx(ctx)
with
  ctx->is_encoder
everywhere?

regards
Philipp
