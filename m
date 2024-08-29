Return-Path: <linux-media+bounces-17144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961A964751
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 15:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58938B2357A
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 13:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7961AD418;
	Thu, 29 Aug 2024 13:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rSO0/ESR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ADB18A6BA;
	Thu, 29 Aug 2024 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724939261; cv=none; b=VB+Dre+NjO4eSBp+Vs32ZWf+ZHURNJOqFdQU5Qn60K4gJavkof6FQ83XjBULwrUGuRu/8Pebsz792EfaZO3c5yFECswWmMBTYHJOHqN14sEKODsjQdkzzLpskwMaEzWM+qw6lvc88+s8ShyeN6uY5CemVqpy0/kMdE2+h6u4lW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724939261; c=relaxed/simple;
	bh=wPiEcD9mSr7N0UPxqrFBrrpYVDcBrR8iPmNv8z1Fb8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/xeMZgPZ0H70Cdm2jpO7L6T6sk8za18Z3HorOf1Wk5XfQXvkL72QwaNXsMWWrTUVJL3zJG6wTNxkpmZap7WOlBnJ4VSazVmvQI3VwUHlxilQFbnFndHLvtHrAZxA45crCQ9liFQMKcXjW16LYgbMVjhRH9M+pVghql8fIEM354=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rSO0/ESR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23853226;
	Thu, 29 Aug 2024 15:46:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724939190;
	bh=wPiEcD9mSr7N0UPxqrFBrrpYVDcBrR8iPmNv8z1Fb8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rSO0/ESRJQl/Ta/pvR5KElqvD+Fhx0zBDB65zeT05gupP9USFGFU4taaI07wahF8e
	 GkstIL4C/wSSPYeZSs4OovmUhuiK6iW5ahBaGDinTSGKIuE8vah2Ll8kh17N1gTufI
	 MGc4KvmZU1lzbVkMbHygLCAg67daEscfSZHBnggo=
Date: Thu, 29 Aug 2024 16:47:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liao Chen <liaochen4@huawei.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sakari.ailus@linux.intel.com, jacopo@jmondi.org, mchehab@kernel.org,
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH -next 1/2] media: i2c: mt9v111: Enable module autoloading
Message-ID: <20240829134708.GF12951@pendragon.ideasonboard.com>
References: <20240829125203.539977-1-liaochen4@huawei.com>
 <20240829125203.539977-2-liaochen4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240829125203.539977-2-liaochen4@huawei.com>

Hi Liao,

Thank you for the patch.

On Thu, Aug 29, 2024 at 12:52:02PM +0000, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> on the alias from of_device_id table.
> 
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Sakari, I expect you will merge this series through your tree.

> ---
>  drivers/media/i2c/mt9v111.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
> index b0b98ed3c150..b6a2623798c5 100644
> --- a/drivers/media/i2c/mt9v111.c
> +++ b/drivers/media/i2c/mt9v111.c
> @@ -1265,6 +1265,7 @@ static const struct of_device_id mt9v111_of_match[] = {
>  	{ .compatible = "aptina,mt9v111", },
>  	{ /* sentinel */ },
>  };
> +MODULE_DEVICE_TABLE(of, mt9v111_of_match);
>  
>  static struct i2c_driver mt9v111_driver = {
>  	.driver = {

-- 
Regards,

Laurent Pinchart

