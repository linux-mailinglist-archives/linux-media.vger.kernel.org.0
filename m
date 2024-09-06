Return-Path: <linux-media+bounces-17729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F398D96E9E8
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 08:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A02D01F23E51
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 06:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D0A141987;
	Fri,  6 Sep 2024 06:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ps6pc50W"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F74512EBDB;
	Fri,  6 Sep 2024 06:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725603348; cv=none; b=RvBTB7YoHmSWGAsPT16/7/H4+3jerK29rJsFvRfh22HWeXG6Wap9pLDSXxiw0KvSykU4HSqUCUOHLbN1Vybzgec5YPV0C8ZjLhlBx13BTH+kT2oBr2l8bm19hNUoDRJFzTiOaDn6TxB6Pfc2pQcQgUxW/dM3UUEqpFky//Frzvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725603348; c=relaxed/simple;
	bh=uKrZh1jdPMoORV9fa/jntxXR+oVK/tJHtgjFJMvQhDM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rgfD5FhmNMk9PxlJ/L81OrP1AOlMGQhlwDazaOXn15sz5qJ4yZAcCE9OF5T7mm7dfwHnqNTz6lb2vpVwwALbnueqIy3DRgwjtAO9Xs8hXk164A1KV7G4t8pPAc5eHo3jqfcc5a/ckL6f36WCsUvrqhXNxC6tfDjl0h14mzlBbqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ps6pc50W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6921BC4CEC4;
	Fri,  6 Sep 2024 06:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725603347;
	bh=uKrZh1jdPMoORV9fa/jntxXR+oVK/tJHtgjFJMvQhDM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ps6pc50WPRj+gGrrhcCgI1vqj3/y19/szxyR5TX9GQNLi47ORzP+tceC7Ds9VzCU+
	 rHF8pDfOh5gHhI/+rfK68w9u3sfA7nJfB3Vv3Js54B6y7s+pcKyuvpdZN3aJWPT3m8
	 2lMvhV9tpgldf2peTp2RTG0kTR4Y2CIoIWsMLKyg1KEYawD6S64A2gdwBgTZP94p7t
	 Nd4Sy+GCCjExEuW3++SpElM5qTlkqjjTmucqge9gDB54ijG2uaEgqNQG7hq/LobZlo
	 vIHnR7BTeucWKPSU1qBbJqG2A8yYsGAsIFGGobZXlbQjjawcay5ychqy2amTcaxDL3
	 orRoyuEetyTJQ==
Date: Fri, 6 Sep 2024 08:15:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Hans de Goede
 <hdegoede@redhat.com>
Cc: David.Laight@ACULAB.COM, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: Use clamp_t() in
 ia_css_eed1_8_vmem_encode()
Message-ID: <20240906081542.5cb0c142@foz.lan>
In-Reply-To: <155aba6ab759e98f66349e6bb4f69e2410486c09.1722084704.git.christophe.jaillet@wanadoo.fr>
References: <155aba6ab759e98f66349e6bb4f69e2410486c09.1722084704.git.christophe.jaillet@wanadoo.fr>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 27 Jul 2024 14:51:56 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> escreveu:

> Using clamp_t() instead of min_t(max_t()) is easier to read.
> 
> It also reduces the size of the preprocessed files by ~ 193 ko.
> (see [1] for a discussion about it)
> 
> $ ls -l ia_css_eed1_8.host*.i
>  4829993 27 juil. 14:36 ia_css_eed1_8.host.old.i
>  4636649 27 juil. 14:42 ia_css_eed1_8.host.new.i
> 
> [1]: https://lore.kernel.org/all/23bdb6fc8d884ceebeb6e8b8653b8cfe@AcuMS.aculab.com/
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  .../isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
> index e4fc90f88e24..96c13ebc4331 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
> @@ -172,25 +172,25 @@ ia_css_eed1_8_vmem_encode(
>  		base = shuffle_block * i;
>  
>  		for (j = 0; j < IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS; j++) {
> -			to->e_dew_enh_x[0][base + j] = min_t(int, max_t(int,
> -							     from->dew_enhance_seg_x[j], 0),
> -							     8191);
> -			to->e_dew_enh_y[0][base + j] = min_t(int, max_t(int,
> -							     from->dew_enhance_seg_y[j], -8192),
> -							     8191);
> +			to->e_dew_enh_x[0][base + j] = clamp_t(int,
> +							       from->dew_enhance_seg_x[j],
> +							       0, 8191);
> +			to->e_dew_enh_y[0][base + j] = clamp_t(int,
> +							       from->dew_enhance_seg_y[j],
> +							       -8192, 8191);

Such change introduces two warnings on smatch:

drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c: drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c:177 ia_css_eed1_8_vmem_encode() warn: assigning (-8192) to unsigned variable 'to->e_dew_enh_y[0][base + j]'
drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c: drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c:182 ia_css_eed1_8_vmem_encode() warn: assigning (-8192) to unsigned variable 'to->e_dew_enh_a[0][base + j]'

Should dew_enhance_seg_x and dew_enhance_seg_y be converted to signed?


Thanks,
Mauro

