Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDFE1F90E4
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 10:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgFOIBt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 04:01:49 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:34419 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgFOIBt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 04:01:49 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 09E2620012;
        Mon, 15 Jun 2020 08:01:45 +0000 (UTC)
Date:   Mon, 15 Jun 2020 10:05:10 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rcar-csi2: Rename confirm_start() to phy_post_init() to
 match its usage
Message-ID: <20200615080510.h35ftz36esrl2cx5@uno.localdomain>
References: <20200611193232.128721-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200611193232.128721-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Thu, Jun 11, 2020 at 09:32:32PM +0200, Niklas Söderlund wrote:
> Since the driver was picked-up the starting of the PHY have changed
> quiet a bit. An artifact of these changes is the now poorly named
> callback confirm_start(). It used to confirm start of the PHY but now
> performs post PHY start initialization, rename it to phy_post_init() to
> reflect this.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Seems reasonable
Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 151e6a90c5fbc70e..6dbfac9dcf775f84 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -344,7 +344,7 @@ enum rcar_csi2_pads {
>
>  struct rcar_csi2_info {
>  	int (*init_phtw)(struct rcar_csi2 *priv, unsigned int mbps);
> -	int (*confirm_start)(struct rcar_csi2 *priv);
> +	int (*phy_post_init)(struct rcar_csi2 *priv);
>  	const struct rcsi2_mbps_reg *hsfreqrange;
>  	unsigned int csi0clkfreqrange;
>  	unsigned int num_channels;
> @@ -575,9 +575,9 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  	if (ret)
>  		return ret;
>
> -	/* Confirm start */
> -	if (priv->info->confirm_start) {
> -		ret = priv->info->confirm_start(priv);
> +	/* Run post PHY start initialization, if needed. */
> +	if (priv->info->phy_post_init) {
> +		ret = priv->info->phy_post_init(priv);
>  		if (ret)
>  			return ret;
>  	}
> @@ -975,7 +975,7 @@ static int rcsi2_init_phtw_v3m_e3(struct rcar_csi2 *priv, unsigned int mbps)
>  	return rcsi2_phtw_write_mbps(priv, mbps, phtw_mbps_v3m_e3, 0x44);
>  }
>
> -static int rcsi2_confirm_start_v3m_e3(struct rcar_csi2 *priv)
> +static int rcsi2_phy_post_init_v3m_e3(struct rcar_csi2 *priv)
>  {
>  	static const struct phtw_value step1[] = {
>  		{ .data = 0xee, .code = 0x34 },
> @@ -1059,7 +1059,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
>
>  static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
>  	.init_phtw = rcsi2_init_phtw_v3m_e3,
> -	.confirm_start = rcsi2_confirm_start_v3m_e3,
> +	.phy_post_init = rcsi2_phy_post_init_v3m_e3,
>  	.num_channels = 4,
>  };
>
> @@ -1072,7 +1072,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
>
>  static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
>  	.init_phtw = rcsi2_init_phtw_v3m_e3,
> -	.confirm_start = rcsi2_confirm_start_v3m_e3,
> +	.phy_post_init = rcsi2_phy_post_init_v3m_e3,
>  	.num_channels = 2,
>  };
>
> --
> 2.27.0
>
