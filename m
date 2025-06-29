Return-Path: <linux-media+bounces-36182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 473E0AECECF
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 18:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FABC189515B
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D792356CE;
	Sun, 29 Jun 2025 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uwd3ty0p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C747F22068D;
	Sun, 29 Jun 2025 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751216240; cv=none; b=Os1QHt7izvlpuUQ1+13kLFd66MuikTRnveG1TbJKz7zl1B3U962mJbrXfE5jJOMQ2bPO2pt0qxxI+BeVVhQiXxiiGIWKcmLQI8/q+K1ACjNEhSBCAz6Y0EdRmPbeQhfmNXI5rTB/XoAO+Gict98X4MAIrHRb0m1V8qYPC78yI7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751216240; c=relaxed/simple;
	bh=O2WUhZQwagXbY2UihWVnNmJrE/h0bilixFhKXaD22Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpeSc4rCui3vRqj4w5laeMBJISCRlLcF+y2IhV+KC54lJAHh/2PE/pHRulNu3LfB7x/Cgv7kl7gN+0+3iSdJo/khE+TiKtDdrBB9rlOmUyPhRb5uaPVo3pnPMOWGT3bBsu31uK2eUqXpLN38wm2dSvOaqIuV7pTcyCEQ6X8c1Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uwd3ty0p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 26AC3C67;
	Sun, 29 Jun 2025 18:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751216210;
	bh=O2WUhZQwagXbY2UihWVnNmJrE/h0bilixFhKXaD22Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwd3ty0pK1DRICvGUwNj5a95qXcg3Y3UwaPGIFsrSjwrJ/rR4ia0X7y31KrJwWBzm
	 j6hEhJHx6puTd2PkG21SIfeQUkIE4Uug/9TdIHERSiZUOxWn3bxfy7VKrUGc8cxSxj
	 QUiND6iz26zByDj55KJWEVhfgw227EIjygZjVd3k=
Date: Sun, 29 Jun 2025 19:56:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] media: i2c: imx214: Remove unneeded parentheses
Message-ID: <20250629165644.GI24912@pendragon.ideasonboard.com>
References: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
 <20250629-imx214_fixes-v1-1-873eb94ad635@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250629-imx214_fixes-v1-1-873eb94ad635@apitzsch.eu>

On Sun, Jun 29, 2025 at 04:49:20PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> The parentheses are not needed to calculate bit_rate_mbps.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx214.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index a0cef9e61b41be8ea76a6d6e4b8c9fc4060cfa0f..8e9b5c9c93b0888f3d6be857168711edaf050db3 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1029,8 +1029,8 @@ static int imx214_start_streaming(struct imx214 *imx214)
>  		return ret;
>  	}
>  
> -	bit_rate_mbps = (imx214->pll.pixel_rate_csi / 1000000)
> -			* imx214->pll.bits_per_pixel;
> +	bit_rate_mbps = imx214->pll.pixel_rate_csi / 1000000
> +		      * imx214->pll.bits_per_pixel;
>  	ret = cci_write(imx214->regmap, IMX214_REG_REQ_LINK_BIT_RATE,
>  			IMX214_LINK_BIT_RATE_MBPS(bit_rate_mbps), NULL);
>  	if (ret) {

-- 
Regards,

Laurent Pinchart

