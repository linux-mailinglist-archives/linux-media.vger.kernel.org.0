Return-Path: <linux-media+bounces-21832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 386B99D5DE2
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 12:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA0CDB252B9
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589C61DE4EB;
	Fri, 22 Nov 2024 11:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oaqu1ELi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AE51D7E4A;
	Fri, 22 Nov 2024 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732274220; cv=none; b=pDRbnedz4qmdb35Dr0n2ZjequjFbb+D4VJ9WY18RiwMyJRBxU1+XrhCRf2fUqRkOX83dx0lTwbeoxHN/ur+G4QHqPjCetktiWdxqBBzY38ycQSCKPDDqrUSGz8wKpElqa1Y/FZ4RXO8WZzuhSldWQ+Uji4hMj4lzsvhWPPJIa3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732274220; c=relaxed/simple;
	bh=NVK6/CsUYwiqYc0OPINVnd5BflobHg/wmw5JJWAnOoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZML5Il1IoNaJtHzAJDQRnqIZEt+HzEKsn7dNnbkGhHLaFaoOG547KDtVPGuH8sm+te19luU8yCs+IR8GVWIDBjM+TNJp7IUF6tpkyhD1g3Z25UVJGx4Xo4hSrE334vSUQvxyXoy9QvL7VDoVNVG1C+tHLZD2/XxG/QUpHDrNLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oaqu1ELi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F8054C9;
	Fri, 22 Nov 2024 12:16:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732274198;
	bh=NVK6/CsUYwiqYc0OPINVnd5BflobHg/wmw5JJWAnOoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oaqu1ELiiNPLnKRxxPoLzabtNZZaoIGchzZjiBmDBmYzHpKkE1HpOSQFAXHWa5JBK
	 0pTnp1dRar/jTin5ZbKlo7Apv5E2P+IMxPgT6oheT6QzD4tBiSD3wdQEZt4uGW8SC6
	 o7xgUqHOw/yhr/rB6QyIt7lPgsg/IKMzOOjGdMdY=
Date: Fri, 22 Nov 2024 12:16:54 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jacopo.mondi@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 2/5] drivers: media: bcm2835-unicam: Allow setting of
 unpacked formats
Message-ID: <ax22djd5jqiqsjjzl7qmfajpfvyryqwmmfeufwx6kh3orehimq@2kq4jriiboye>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-3-naush@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122084152.1841419-3-naush@raspberrypi.com>

Hi Naush

On Fri, Nov 22, 2024 at 08:41:49AM +0000, Naushir Patuck wrote:
> When matching formats via try_fmt/set_fmt ioctls, test for the unpacked
> formats as well as packed formats. This allows userland clients setup
> unpacking to 16-bits from the 10/12/14-packed CSI2 formats.
>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 36fb186a0421..d573d4d89881 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -547,7 +547,8 @@ unicam_find_format_by_fourcc(u32 fourcc, u32 pad)
>  	}
>
>  	for (i = 0; i < num_formats; ++i) {
> -		if (formats[i].fourcc == fourcc)
> +		if (formats[i].fourcc == fourcc ||
> +		    formats[i].unpacked_fourcc == fourcc)
>  			return &formats[i];
>  	}
>
> --
> 2.34.1
>
>

