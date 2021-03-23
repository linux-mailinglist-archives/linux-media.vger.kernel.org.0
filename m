Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A6D346B6A
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 22:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbhCWVyB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 17:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233776AbhCWVxe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 17:53:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623BBC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 14:53:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3080B1D;
        Tue, 23 Mar 2021 22:53:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616536411;
        bh=xS8oQUDIkGLj2MuWmdGqKk4qlAutOC6apniayS8tPB4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SzIE5ZYWqdjdIqCOXKurLGf4CN55e/BLial8+Y3Nc5qsfO/hov6db4aaaAifTwCz8
         QyQRkSTJIgNOfewX+NbbwJZziaqPuyy35I2G0HuNjRbbK2dHa0shmqXSQEyIWqCKY3
         QS6T/VTmdulUwfMLrAPZlQarA+YBeiyGThGbX/Is=
Date:   Tue, 23 Mar 2021 23:52:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] omap3isp.h: fix kernel-doc warnings
Message-ID: <YFpjMNlavzYFxHN2@pendragon.ideasonboard.com>
References: <6365fce1-3023-8058-8f7f-abb6426c10ad@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6365fce1-3023-8058-8f7f-abb6426c10ad@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Mar 23, 2021 at 09:12:47AM +0100, Hans Verkuil wrote:
> Add missing documentation for two field. This fixes these kernel-doc
> warnings:
> 
> drivers/media/platform/omap3isp/omap3isp.h:107: warning: Function parameter or member 'vp_clk_pol' not described in 'isp_ccp2_cfg'
> drivers/media/platform/omap3isp/omap3isp.h:107: warning: Function parameter or member 'lanecfg' not described in 'isp_ccp2_cfg'
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> diff --git a/drivers/media/platform/omap3isp/omap3isp.h b/drivers/media/platform/omap3isp/omap3isp.h
> index 214f94c46a9d..4a003c8263ed 100644
> --- a/drivers/media/platform/omap3isp/omap3isp.h
> +++ b/drivers/media/platform/omap3isp/omap3isp.h
> @@ -95,6 +95,8 @@ struct isp_csiphy_lanes_cfg {
>   *		ISP_CCP2_PHY_DATA_CLOCK - Data/clock physical layer
>   *		ISP_CCP2_PHY_DATA_STROBE - Data/strobe physical layer
>   * @vpclk_div: Video port output clock control
> + * @vp_clk_pol: Video port output clock polarity
> + * @lanecfg: CCP2/CSI2 lane configuration
>   */
>  struct isp_ccp2_cfg {
>  	unsigned int strobe_clk_pol:1;

-- 
Regards,

Laurent Pinchart
