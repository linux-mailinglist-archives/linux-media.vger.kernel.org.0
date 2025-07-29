Return-Path: <linux-media+bounces-38607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD0CB14710
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 06:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49F7D17EA38
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 04:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFC3228C99;
	Tue, 29 Jul 2025 04:14:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D5212D1F1;
	Tue, 29 Jul 2025 04:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.189.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753762477; cv=none; b=jCHiC0A1fa1IFC48uBVvqnTGC5tovzMLOylXe2Ir/B7aqY+kZxl68zAtIbINOLnwTx8pt2uDED2gUNhJ7y95GDkxNGontFHoYS7jhudBZDz4CpnHb4rEz+SBTIblVKwlWEFJIJOaoNVDyhhi2/y+IkNtAZM8hL9FzoKytYtgXlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753762477; c=relaxed/simple;
	bh=gfVnpk2wVqzl2txcCe5ykaQSP4YyBFc/JTyuva1tWg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8NO3DVpiauyXruqFqF9XhqFNgbn1z0BxNr+vBT30UftO8Mhc6jWFqqebW9PslytIEWiUxeabLLYAoK9pcQ2iQH1jIjtFEnhVB/WfsSDMURwGw0V90WdOBNiYbcbB6zgCdkv4tCgkpG7u9XsPw/p1gwx/VH5XR6nufVzjWxlEe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iodev.co.uk; spf=pass smtp.mailfrom=iodev.co.uk; arc=none smtp.client-ip=46.30.189.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iodev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iodev.co.uk
Received: from pirotess (112.red-83-45-208.dynamicip.rima-tde.net [83.45.208.112])
	by iodev.co.uk (Postfix) with ESMTPSA id B61AF450BD5;
	Tue, 29 Jul 2025 06:08:39 +0200 (CEST)
Date: Tue, 29 Jul 2025 06:08:38 +0200
From: Ismael Luceno <ismael@iodev.co.uk>
To: Philipp Stanner <phasta@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] media: solo6x10: Replace deprecated PCI functions
Message-ID: <aIhJRp0Y3VsfHabN@pirotess>
References: <20250404135344.93241-2-phasta@kernel.org>
 <20250404135344.93241-6-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404135344.93241-6-phasta@kernel.org>

On 04/Apr/2025 15:53, Philipp Stanner wrote:
> pcim_iomap_table() and pcim_iomap_regions() have been deprecated.
> Replace them with pcim_iomap_region().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/media/pci/solo6x10/solo6x10-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/solo6x10/solo6x10-core.c b/drivers/media/pci/solo6x10/solo6x10-core.c
> index 6ec1480a6d18..febb2c156cf6 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-core.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-core.c
> @@ -477,10 +477,10 @@ static int solo_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	pci_write_config_byte(pdev, 0x40, 0x00);
>  	pci_write_config_byte(pdev, 0x41, 0x00);
>  
> -	ret = pcim_iomap_regions(pdev, BIT(0), SOLO6X10_NAME);
> +	solo_dev->reg_base = pcim_iomap_region(pdev, 0, SOLO6X10_NAME);
> +	ret = PTR_ERR_OR_ZERO(solo_dev->reg_base);
>  	if (ret)
>  		goto fail_probe;
> -	solo_dev->reg_base = pcim_iomap_table(pdev)[0];
>  
>  	chip_id = solo_reg_read(solo_dev, SOLO_CHIP_OPTION) &
>  				SOLO_CHIP_ID_MASK;

It mostly looks OK, but the error check needs to happen before setting
solo_dev->reg_base, because it's used by free_solo_dev.

