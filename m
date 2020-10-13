Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D736B28D389
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 20:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgJMSVM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 14:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728188AbgJMSVM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 14:21:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B106FC0613D0;
        Tue, 13 Oct 2020 11:21:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EF43B87;
        Tue, 13 Oct 2020 20:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602613267;
        bh=uNdQgYBn6J6CRCexb0fARlaAUo2p5ArcS4xeWUhOs6s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=io1UsLL9//j2D/vqza6k35qzJzan6exhFZexus9mEjA8Unk7vMMjVG0gcle/gSGeX
         KhjbKHCK2dY9UvFy4Gvtf/CnIuQC90glnVynYEQkJyXhM6KgXbo3zaqVUCtOJXQxqc
         hyLuJVfPzQA1b5n3K2+2TzhqS3NTmSQqjoiTInn8=
Date:   Tue, 13 Oct 2020 21:20:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-usb@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [patch 2/4] media: omap3isp: Remove misleading comment
Message-ID: <20201013182021.GE11939@pendragon.ideasonboard.com>
References: <20201013142616.118697527@linutronix.de>
 <20201013143731.704783731@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201013143731.704783731@linutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thomas,

Thank you for the patch.

On Tue, Oct 13, 2020 at 04:26:18PM +0200, Thomas Gleixner wrote:
> in_interrupt() covers hard and soft interrupt servicing and bottom half
> disabled contexts, which is semantically ill defined.
> 
> The comment for __ccdc_lsc_configure() "Context: in_interrupt()" is
> therefore as useful as "Context: unknown'. Remove it.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-media@vger.kernel.org

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/omap3isp/ispccdc.c |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> --- a/drivers/media/platform/omap3isp/ispccdc.c
> +++ b/drivers/media/platform/omap3isp/ispccdc.c
> @@ -299,11 +299,10 @@ static int ccdc_lsc_busy(struct isp_ccdc
>  			     ISPCCDC_LSC_BUSY;
>  }
>  
> -/* __ccdc_lsc_configure - Apply a new configuration to the LSC engine
> +/*
> + * __ccdc_lsc_configure - Apply a new configuration to the LSC engine
>   * @ccdc: Pointer to ISP CCDC device
>   * @req: New configuration request
> - *
> - * context: in_interrupt()
>   */
>  static int __ccdc_lsc_configure(struct isp_ccdc_device *ccdc,
>  				struct ispccdc_lsc_config_req *req)
> 

-- 
Regards,

Laurent Pinchart
