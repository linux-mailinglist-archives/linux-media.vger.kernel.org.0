Return-Path: <linux-media+bounces-20771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0630E9BAE28
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 09:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6BBC1F22F37
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 08:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2473F19E982;
	Mon,  4 Nov 2024 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v1J3pWP+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134D117B428;
	Mon,  4 Nov 2024 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730709203; cv=none; b=HBejPDSMHeLkzqeS7tbUqu5AeY74mEJyOKd4QyX4VVFJoN54asePznLLA702PKGBCLyd+RTmNf6+YWh7W5a8FqVf8slRLRY+SEfufIGXQzYedolMoNLnS1EnKLxP3BxQyK+G5Rz9vyyHpuioGBi6yhb9fcXo1VPMGH5/rfvRfJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730709203; c=relaxed/simple;
	bh=EqMKummwQ7vaqd9KFscfZmZPOeKFWLCcnWoz9iNuZ7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ic3Z0Iv7TyCUNh/W9dd+sdX5EbU0a6vhSG8D3SfF3gQuzzkaXv6eqV/ZG3b6+b5uqoZqgfGT5TZSueWsQu2gxsmrZBK8P2cSi7Pj4YZE78kuWiCj+baJoV/zc0sKgWmuSLkZ56uH8fBp+cFHJzbeNZg1Q7uIJ98crmenIrdY5qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v1J3pWP+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-48-188.net.vodafone.it [5.90.48.188])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DC25236;
	Mon,  4 Nov 2024 09:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730709193;
	bh=EqMKummwQ7vaqd9KFscfZmZPOeKFWLCcnWoz9iNuZ7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v1J3pWP+hpJKZoRVjeOi1PKWtBMsd46Ml1SgqwkAO0CBHH/WslH0g1DcuFz4SeKxB
	 u3kc39pLaulPXwbwxI9dNAbDvioSdslWkk2Z8uwxuelLCwpOiQRmR6TOzCyTSykmiL
	 dR0p8Qo8up40VstC0Z5J7SFdnAs91nEiup/v6sIU=
Date: Mon, 4 Nov 2024 09:33:16 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Plowman <david.plowman@raspberrypi.com>
Subject: Re: [PATCH 1/3] media: i2c: imx219: Correct the minimum vblanking
 value
Message-ID: <p75bv6cdt3xuiticrw4qlrma62idasocvflpyv424r5gmqwssz@4jed7vwesukf>
References: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
 <20241029-imx219_fixes-v1-1-b45dc3658b4e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241029-imx219_fixes-v1-1-b45dc3658b4e@ideasonboard.com>

Hi Jai

On Tue, Oct 29, 2024 at 02:27:35PM +0530, Jai Luthra wrote:
> From: David Plowman <david.plowman@raspberrypi.com>
>
> The datasheet for this sensor documents the minimum vblanking as being
> 32 lines. It does fix some problems with occasional black lines at the
> bottom of images (tested on Raspberry Pi).
>
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Confirmed by the documentation of register 0x114a/0x114b

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index e78a80b2bb2e455c857390b188c128b28c224778..f98aad74fe584a18e2fe7126f92bf294762a54e3 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -74,7 +74,7 @@
>  #define IMX219_REG_VTS			CCI_REG16(0x0160)
>  #define IMX219_VTS_MAX			0xffff
>
> -#define IMX219_VBLANK_MIN		4
> +#define IMX219_VBLANK_MIN		32
>
>  /* HBLANK control - read only */
>  #define IMX219_PPL_DEFAULT		3448
>
> --
> 2.47.0
>
>

