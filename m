Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F38299891
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 22:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730142AbgJZVJW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 17:09:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53374 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730089AbgJZVJV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 17:09:21 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEB98527;
        Mon, 26 Oct 2020 22:09:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1603746560;
        bh=tpkANSGO61HPqqWtev6ktclnGRhzXUXS4QV3IJAoajw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=We0rPMz3cZV37ctcDRxEKOOdysowThoFDgf3WinT83zv+ADQpHAQs0trsS1FQsfA+
         sWIWNLesjm0fc1dRPkXD31GbSNQVdS1+QukjVJ8gIzfF9845tBm7Jd7WdNJaoaoF8u
         SXR+Haq3b32prBU4+ZwfX1zYwFEIOLZE21vkdw5g=
Date:   Mon, 26 Oct 2020 23:08:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nikhil Devshatwar <nikhil.nd@ti.com>
Cc:     linux-firmware@kernel.org, linux-media@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] vpdma: Move firmware to the toplevel
Message-ID: <20201026210832.GE3756@pendragon.ideasonboard.com>
References: <20201026200922.12719-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201026200922.12719-1-nikhil.nd@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nikhil,

Thank you for the patch.

On Tue, Oct 27, 2020 at 01:39:22AM +0530, Nikhil Devshatwar wrote:
> Move the vpdma firmware to the toplevel directory so
> that the existing drivers can use it with the same path.
> 
> Fixes: 5b30b383ce ("linux-firmware: Add new VPDMA firmware 1b8.bin")
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  WHENCE                                         |   2 +-
>  ti-connectivity/vpdma-1b8.bin => vpdma-1b8.bin | Bin

I think Tomi meant moving the file to ti/ instead of ti-connectivity/. I
will let him comment on this.

>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename ti-connectivity/vpdma-1b8.bin => vpdma-1b8.bin (100%)
> 
> diff --git a/WHENCE b/WHENCE
> index 473f6fb..347593c 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2705,7 +2705,7 @@ Licence: Redistributable. See LICENCE.tda7706-firmware.txt for details.
>  
>  Driver: ti-vpe - Texas Instruments V4L2 driver for Video Processing Engine
>  
> -File: ti-connectivity/vpdma-1b8.bin
> +File: vpdma-1b8.bin
>  
>  Licence: Redistributable. See LICENCE.ti-tspa for details.
>  
> diff --git a/ti-connectivity/vpdma-1b8.bin b/vpdma-1b8.bin
> similarity index 100%
> rename from ti-connectivity/vpdma-1b8.bin
> rename to vpdma-1b8.bin

-- 
Regards,

Laurent Pinchart
