Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD5D4888B2
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 11:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbiAIKZy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jan 2022 05:25:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiAIKZw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jan 2022 05:25:52 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DECC06173F;
        Sun,  9 Jan 2022 02:25:51 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4C82CFF802;
        Sun,  9 Jan 2022 10:25:49 +0000 (UTC)
Date:   Sun, 9 Jan 2022 11:26:49 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: Re: [PATCH v2 06/11] media: i2c: max9286: Rename
 MAX9286_DATATYPE_RAW11 to RAW12
Message-ID: <20220109102649.kigmpfs62tx5q7fr@uno.localdomain>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-7-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220101182806.19311-7-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Jan 01, 2022 at 08:28:01PM +0200, Laurent Pinchart wrote:
> The MAX9286_DATATYPE_RAW11 value is used to configure the MAX9286 for
> 11-bit or 12-bit input data. While 11-bit data is supported on the GMSL
> side, CSI-2 doesn't have a RAW11 format. 11-bit data is transferred over
> CSI-2 as RAW12. Rename the macro accordingly to avoid confusion.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Makes sense
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/media/i2c/max9286.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 75374034724f..576d9c6fac14 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -71,7 +71,7 @@
>  #define MAX9286_DATATYPE_USER_YUV_12BIT	(10 << 0)
>  #define MAX9286_DATATYPE_USER_24BIT	(9 << 0)
>  #define MAX9286_DATATYPE_RAW14		(8 << 0)
> -#define MAX9286_DATATYPE_RAW11		(7 << 0)
> +#define MAX9286_DATATYPE_RAW12		(7 << 0)
>  #define MAX9286_DATATYPE_RAW10		(6 << 0)
>  #define MAX9286_DATATYPE_RAW8		(5 << 0)
>  #define MAX9286_DATATYPE_YUV422_10BIT	(4 << 0)
> --
> Regards,
>
> Laurent Pinchart
>
