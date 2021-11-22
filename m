Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E66458BEC
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 10:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238875AbhKVKCS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 05:02:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbhKVKCR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 05:02:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6013CC061574;
        Mon, 22 Nov 2021 01:59:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9A5C14C3;
        Mon, 22 Nov 2021 10:59:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637575150;
        bh=r0u6Bjxvo89EoNa6PVziXfa0Jlo3FtGps2kkQHqmYeY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sDWPWkahQV3AknrntRKICjXC/JlmpoTBrCVbrL7Xe++NGbm+ziFYOC7dfF57EHqov
         V1O9DxWt9IrN6wTL6sK5SBIh7Kl1Ptg55dqrpl5pJc72AnrocWN321M5qJCO75xDRR
         WzQ3wLXGANTEHtIPwPtHEJ73LWJ72GuCNgZv+7O4=
Date:   Mon, 22 Nov 2021 11:58:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH 09/10] media: omap3isp: mark isp_isr_dbg as __maybe_unused
Message-ID: <YZtp115b6T+ErG+8@pendragon.ideasonboard.com>
References: <cover.1637573097.git.mchehab+huawei@kernel.org>
 <4293d53b747388a65ea06382e2041ae6322ecd89.1637573097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4293d53b747388a65ea06382e2041ae6322ecd89.1637573097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On Mon, Nov 22, 2021 at 09:26:11AM +0000, Mauro Carvalho Chehab wrote:
> This function is only used for debugging purposes. When DEBUG
> is disabled, it becomes unused, causing a clang warning with W=1.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/10] at: https://lore.kernel.org/all/cover.1637573097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/platform/omap3isp/isp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
> index 6de377ce281d..4c937f3f323e 100644
> --- a/drivers/media/platform/omap3isp/isp.c
> +++ b/drivers/media/platform/omap3isp/isp.c
> @@ -476,7 +476,8 @@ void omap3isp_hist_dma_done(struct isp_device *isp)
>  	}
>  }
>  
> -static inline void isp_isr_dbg(struct isp_device *isp, u32 irqstatus)
> +static inline void __maybe_unused isp_isr_dbg(struct isp_device *isp,
> +					      u32 irqstatus)
>  {
>  	static const char *name[] = {
>  		"CSIA_IRQ",

-- 
Regards,

Laurent Pinchart
