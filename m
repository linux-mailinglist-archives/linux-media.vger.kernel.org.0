Return-Path: <linux-media+bounces-14505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F8C91F07B
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 09:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C74DD1C2252F
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 07:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED8012FF71;
	Tue,  2 Jul 2024 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bD2n8Xlt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E716372;
	Tue,  2 Jul 2024 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719906558; cv=none; b=RgCoJCMOWqWz5DTOSmd8LzpkMFbfnUHfn8Iok5IB8uF5OQXa0Htd8H3wkr7N1LBB14Xpy9DMv3QlDbaNyesfko9MREK8a2QqlLCPwxZwtV2hvq3wbpuU8M9brhOTIjN1VDimq6xZSZ2p/U+XplqWzsJV352NzDfK+H8WZ/Pqun0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719906558; c=relaxed/simple;
	bh=omU/zp+xhlo5mfigTz70TZjn24ZIXFiMMwm2piQK378=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5M6SEsT14ZSFF0Wz+nVY5fq/CAT7clzmI4J2GDx0TUU1yYDyQR8bcdIvET0gxP3h2j0krFx7ZM4T0klH5AzIeDQYPcVRMgkSUZ7aSWBtObk9G+dC8C1U6/JKL/IngKhLohH0L2zzix9PtpLZyjhX/omSNjjh/w/Jn8/DDu8AFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bD2n8Xlt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F5775A4;
	Tue,  2 Jul 2024 09:48:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719906527;
	bh=omU/zp+xhlo5mfigTz70TZjn24ZIXFiMMwm2piQK378=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bD2n8Xlt3GjH50oEmxp1wd+X1GRqiG5IZggAsVmcP+GPFyp0+mU7Y4QJBYTQNvh2D
	 o/YFWX0CaVMzun39KGvd0SjaOSXGNTwQGXZmqZRXS+XnP22Cqs9/nMfmqJpvT1fB1b
	 lrNy6W+UXm+5lRmoZIP//7rKRS65uDoWb1L3I8wY=
Date: Tue, 2 Jul 2024 10:48:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: paul.elder@ideasonboard.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: thp7312: Convert comma to semicolon
Message-ID: <20240702074853.GF15391@pendragon.ideasonboard.com>
References: <20240702025711.1411715-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240702025711.1411715-1-nichen@iscas.ac.cn>

Hello Chen,

Thank you for the patch.

On Tue, Jul 02, 2024 at 10:57:11AM +0800, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.

Oops.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/media/i2c/thp7312.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
> index 19bd923a7315..75225ff5eff6 100644
> --- a/drivers/media/i2c/thp7312.c
> +++ b/drivers/media/i2c/thp7312.c
> @@ -1503,7 +1503,7 @@ static int __thp7312_flash_reg_read(struct thp7312_device *thp7312,
>  
>  	msgs[0].addr = client->addr;
>  	msgs[0].flags = 0;
> -	msgs[0].len = sizeof(thp7312_cmd_read_reg),
> +	msgs[0].len = sizeof(thp7312_cmd_read_reg);
>  	msgs[0].buf = (u8 *)thp7312_cmd_read_reg;
>  
>  	msgs[1].addr = client->addr;

-- 
Regards,

Laurent Pinchart

