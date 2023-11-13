Return-Path: <linux-media+bounces-280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E95FA7EA103
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 17:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 894141F21B81
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 16:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A59922337;
	Mon, 13 Nov 2023 16:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iv55K2ux"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB2722303
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 16:11:36 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E13D44
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 08:11:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D47929A;
	Mon, 13 Nov 2023 17:11:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699891867;
	bh=H06sF2UC7suAj4u6arM0kfIyZ+nxGWF8PU0Q3F6xnfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iv55K2uxsylR0sVATpMw3TFuKmT/td5GNy40QgDHKBBTmVhC0ZZxCRnAetIqvsxTX
	 6+fq2tsCeyEagZnH01NpalU0I8HtiDHUZFeZ9qDU88Hhv2M07kK18BAKxNPd0EUKN4
	 OxJ5k8dIH6y/O2d3dAYzKzkx6XCflJ6u/9IWvIKc=
Date: Mon, 13 Nov 2023 18:11:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH v3 3/6] media: v4l: cci: Add macros to obtain register
 width and address
Message-ID: <20231113161138.GH24338@pendragon.ideasonboard.com>
References: <20231113160601.1427972-1-sakari.ailus@linux.intel.com>
 <20231113160601.1427972-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231113160601.1427972-4-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Nov 13, 2023 at 06:05:58PM +0200, Sakari Ailus wrote:
> Add CCI_REG_WIDTH() macro to obtain register width in bits and similarly,
> CCI_REG_WIDTH_BYTES() to obtain it in bytes.
> 
> Also add CCI_REG_ADDR() macro to obtain the address of a register.
> 
> Use both macros in v4l2-cci.c, too.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Please write per-patch changelogs. You would then have likely caught the
issue below.

> ---
>  drivers/media/v4l2-core/v4l2-cci.c | 8 ++++----
>  include/media/v4l2-cci.h           | 9 +++++++--
>  2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
> index bc2dbec019b0..3179160abde3 100644
> --- a/drivers/media/v4l2-core/v4l2-cci.c
> +++ b/drivers/media/v4l2-core/v4l2-cci.c
> @@ -25,8 +25,8 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
>  	if (err && *err)
>  		return *err;
>  
> -	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> -	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
> +	len = CCI_REG_WIDTH_BYTES(reg);
> +	reg = CCI_REG_ADDR(reg);
>  
>  	ret = regmap_bulk_read(map, reg, buf, len);
>  	if (ret) {
> @@ -75,8 +75,8 @@ int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
>  	if (err && *err)
>  		return *err;
>  
> -	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> -	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
> +	len = CCI_REG_WIDTH_BYTES(reg);
> +	reg = CCI_REG_ADDR(reg);
>  
>  	switch (len) {
>  	case 1:
> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> index ee469f03e440..50df3aa4af1d 100644
> --- a/include/media/v4l2-cci.h
> +++ b/include/media/v4l2-cci.h
> @@ -7,6 +7,7 @@
>  #ifndef _V4L2_CCI_H
>  #define _V4L2_CCI_H
>  
> +#include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/types.h>
>  
> @@ -36,8 +37,12 @@ struct cci_reg_sequence {
>  /*
>   * Private CCI register flags, for the use of drivers.
>   */
> -#define CCI_REG_PRIVATE_SHIFT		28U
> -#define CCI_REG_PRIVATE_MASK		GENMASK(31U, CCI_REG_PRIVATE_SHIFT)
> +#define CCI_REG_PRIVATE_SHIFT		28
> +#define CCI_REG_PRIVATE_MASK		GENMASK(31, CCI_REG_PRIVATE_SHIFT)

Was this meant to be in the previous patch ?

> +
> +#define CCI_REG_WIDTH_BYTES(x)		FIELD_GET(CCI_REG_WIDTH_MASK, x)
> +#define CCI_REG_WIDTH(x)		(CCI_REG_WIDTH_BYTES(x) << 3)
> +#define CCI_REG_ADDR(x)			FIELD_GET(CCI_REG_ADDR_MASK, x)
>  
>  #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))

-- 
Regards,

Laurent Pinchart

