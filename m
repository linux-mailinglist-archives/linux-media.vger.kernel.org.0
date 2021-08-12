Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023103EA1B2
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 11:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235728AbhHLJPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 05:15:46 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:35123 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235770AbhHLJPp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 05:15:45 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1DE18FF80C;
        Thu, 12 Aug 2021 09:15:15 +0000 (UTC)
Date:   Thu, 12 Aug 2021 11:16:03 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Nadezda Lutovinova <lutovinova@ispras.ru>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH v2] media: rcar-csi2: Add checking to
 rcsi2_start_receiver()
Message-ID: <20210812091603.ahguetst2v354nla@uno.localdomain>
References: <YRPUhqvcTxCVvnBG@oden.dyn.berto.se>
 <20210811171816.12012-1-lutovinova@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210811171816.12012-1-lutovinova@ispras.ru>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Nadezda,

On Wed, Aug 11, 2021 at 08:18:16PM +0300, Nadezda Lutovinova wrote:
> If rcsi2_code_to_fmt() return NULL, then null pointer dereference occurs
> in the next cycle. That should not be possible now but adding checking
> protects from future bugs.
> The patch adds checking if format is NULL.
>
> Found by Linux Driver Verification project (linuxtesting.org).
>
> Signed-off-by: Nadezda Lutovinova <lutovinova@ispras.ru>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> ---
> v2: fix subject and commit message, remove dev_err()
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index e28eff039688..d28f83f7698b 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -553,6 +553,8 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>
>  	/* Code is validated in set_fmt. */
>  	format = rcsi2_code_to_fmt(priv->mf.code);
> +	if (!format)
> +		return -EINVAL;
>
>  	/*
>  	 * Enable all supported CSI-2 channels with virtual channel and
> --
> 2.17.1
>
