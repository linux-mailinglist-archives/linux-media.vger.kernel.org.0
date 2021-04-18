Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFAB93632E1
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 02:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235958AbhDRAoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Apr 2021 20:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbhDRAoS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 20:44:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8329FC06174A
        for <linux-media@vger.kernel.org>; Sat, 17 Apr 2021 17:43:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B18DC51E;
        Sun, 18 Apr 2021 02:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618706628;
        bh=+FlfzMu1nJj9vx9p5lcVVhOrkyfkAxg1COXX/i36/7k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KZBHxQihE6pg1SNBCRI1WyrFPF0kjAb0m86LQ1B8noYA59HVnc7Xqk8WhLjJ+XHcc
         klllV942o2Q/qujh1JKpBcl2yml2N6q3frTGVk1Ltr5y1tulrkk6/yt+UDN+KTU9bC
         e7L/hpLhNu3PrVEG8VZnmLXkkXR2jFw0muH+vBgk=
Date:   Sun, 18 Apr 2021 03:43:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 03/28] media: ti-vpe: cal: remove unused
 cal_camerarx->dev field
Message-ID: <YHuAwmD9Y2X+udeK@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-4-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:32PM +0300, Tomi Valkeinen wrote:
> cal_camerarx->dev field is not used, remove it.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index db0e408eaa94..e079c6a9f93f 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -149,7 +149,6 @@ struct cal_data {
>  struct cal_camerarx {
>  	void __iomem		*base;
>  	struct resource		*res;
> -	struct device		*dev;
>  	struct regmap_field	*fields[F_MAX_FIELDS];
>  
>  	struct cal_dev		*cal;

-- 
Regards,

Laurent Pinchart
