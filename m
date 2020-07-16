Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53ADB2220B0
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 12:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgGPKgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 06:36:01 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:48437 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgGPKgA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 06:36:00 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 532C8240007;
        Thu, 16 Jul 2020 10:34:21 +0000 (UTC)
Date:   Thu, 16 Jul 2020 12:37:55 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        sakari.ailus@iki.fi,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] MAINTAINERS: Fix sort order for RDACM20
Message-ID: <20200716103755.7q2z62xuxb4d34vy@uno.localdomain>
References: <20200716102552.1390223-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200716102552.1390223-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Thu, Jul 16, 2020 at 11:25:52AM +0100, Kieran Bingham wrote:
> The files maintained as part of the RDACM20 were incorrectly sorted
> while they were added.
>
> Correct the sort-order.
>
> Fixes: 874a93adf972 ("media: i2c: Add RDACM20 driver")
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

FWIW
Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 373e4198d2b1..8bd8d4ab8b5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14412,9 +14412,9 @@ M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
> -F:	drivers/media/i2c/rdacm20.c
>  F:	drivers/media/i2c/max9271.c
>  F:	drivers/media/i2c/max9271.h
> +F:	drivers/media/i2c/rdacm20.c
>
>  RDC R-321X SoC
>  M:	Florian Fainelli <florian@openwrt.org>
> --
> 2.25.1
>
