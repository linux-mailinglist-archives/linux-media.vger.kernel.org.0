Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931C228B513
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 14:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729903AbgJLMyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 08:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729978AbgJLMyT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 08:54:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2FCC0613D1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 05:54:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6D003B;
        Mon, 12 Oct 2020 14:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602507255;
        bh=2ndA2hJaFWfr7IwkVslBl606WA3JYtoGYu0CYba05Io=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UsPZ+v52S33N8fZGAnD3tzsjHbRUITIteo4TMAihZ9ku6+QYNSRbyMQn9OBC2P1o5
         Ml9vjs5uZC2+zDhtjlPU1n5FJ6iMDGWFPzUlgjxKRaQ4z2y1qZPLLa9f6J3OQUINb3
         PL5ezKA20uXWYKEvypKEkAfHi3dR5G4nOwxoIq3E=
Date:   Mon, 12 Oct 2020 15:53:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nikhil Devshatwar <nikhil.nd@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] media: platform: ti-vpe: Update the path to firmware
Message-ID: <20201012125330.GA19208@pendragon.ideasonboard.com>
References: <20201012125200.11643-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201012125200.11643-1-nikhil.nd@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nikhil,

Thank you for the patch.

On Mon, Oct 12, 2020 at 06:22:00PM +0530, Nikhil Devshatwar wrote:
> vpdma firmware is now available in the linux-firmware repo.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ti-connectivity/vpdma-1b8.bin
> 
> Update the firmware path requested by the VPDMA driver so that
> it gets looked up correctly in the filesystem.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/vpdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
> index 2e5148ae7a0f..5a378449a4ff 100644
> --- a/drivers/media/platform/ti-vpe/vpdma.c
> +++ b/drivers/media/platform/ti-vpe/vpdma.c
> @@ -23,7 +23,7 @@
>  #include "vpdma.h"
>  #include "vpdma_priv.h"
>  
> -#define VPDMA_FIRMWARE	"vpdma-1b8.bin"
> +#define VPDMA_FIRMWARE	"ti-connectivity/vpdma-1b8.bin"
>  
>  const struct vpdma_data_format vpdma_yuv_fmts[] = {
>  	[VPDMA_DATA_FMT_Y444] = {

-- 
Regards,

Laurent Pinchart
