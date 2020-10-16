Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755002906AD
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 15:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408157AbgJPN52 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 09:57:28 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:55125 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395556AbgJPN52 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 09:57:28 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5AECF200007;
        Fri, 16 Oct 2020 13:57:24 +0000 (UTC)
Date:   Fri, 16 Oct 2020 17:57:10 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] rcar-vin: Cache the CSI-2 channel selection value
Message-ID: <20201016155710.mmmrbdb4ws7sb253@uno.localdomain>
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
 <20201015231408.2399933-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201015231408.2399933-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Oct 16, 2020 at 01:14:06AM +0200, Niklas Söderlund wrote:
> In preparation of suspend/resume support cache the chsel value when
> written to the register so it can be restored on resume if needed.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 2 ++
>  drivers/media/platform/rcar-vin/rcar-vin.h | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 680160f9f851d8a3..f65deac4c2dbed54 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1456,6 +1456,8 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
>
>  	vin_dbg(vin, "Set IFMD 0x%x\n", ifmd);
>
> +	vin->chsel = chsel;
> +
>  	/* Restore VNMC. */
>  	rvin_write(vin, vnmc, VNMC_REG);
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index 8396e0e45478fe4f..2fef23470e3ddfe3 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -189,6 +189,7 @@ struct rvin_info {
>   * @state:		keeps track of operation state
>   *
>   * @is_csi:		flag to mark the VIN as using a CSI-2 subdevice
> + * @chsel		Cached value of the current CSI-2 channel selection
>   *
>   * @mbus_code:		media bus format code
>   * @format:		active V4L2 pixel format
> @@ -232,6 +233,7 @@ struct rvin_dev {
>  	enum rvin_dma_state state;
>
>  	bool is_csi;
> +	unsigned int chsel;

Could be a u8, I'm not sure we gain anything though

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j
>
>  	u32 mbus_code;
>  	struct v4l2_pix_format format;
> --
> 2.28.0
>
