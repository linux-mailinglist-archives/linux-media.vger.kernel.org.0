Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3C7454442
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbhKQJ5G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:57:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:57902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235406AbhKQJ5F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:57:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4514661504;
        Wed, 17 Nov 2021 09:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637142847;
        bh=+zxN20/5znRjh88KZaCtOQPVCBZVkwSroT6dfnYe1i0=;
        h=Date:From:Cc:Subject:In-Reply-To:References:From;
        b=WJmvs5m3diIYeiS80EbsAN/hYPtl79aihs2COBEUw2F1RnDerxz2i/FPdayv3SMNL
         Sr5OZ1Dff5CUk110BjWreZdI2v94K7Tg5D4GdTmrZWWb2d8Y5nL/e71fCDphYMKuVp
         wYtTy3xvQAJQqlr8B9Q2eyQf96d1kl5274pKJBiOcrFCP9P5DBhDeOWxtrWJWFWmyH
         sB55A/odaIUTfYpA/4kCwJtG/niIBm60JPfEZnXR9/itlZqu20pNHxnaQs5xiBNYDH
         57/xG9oASpEcEWKDjMpUFYFZ7woIAyF7oAUFCBEKvH68atkRYYuyGF+1J9H0tLyIov
         Omx31+yG257pA==
Date:   Wed, 17 Nov 2021 09:54:02 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 12/13] media: atomisp: fix a bug when applying the
 binning factor
Message-ID: <20211117095402.2b6cd0df@sal.lan>
In-Reply-To: <8d41e31e14941b8a0352bd1e2a8c6c5e11c273ca.1637140900.git.mchehab+huawei@kernel.org>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
        <8d41e31e14941b8a0352bd1e2a8c6c5e11c273ca.1637140900.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 17 Nov 2021 09:25:37 +0000
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> The binning factor is actually a shift value, where 0 means
> to not touch the value. This is propagated from the sensors'
> properties:
> 
> 	.bin_factor_x
> 	.bin_factor_y
> 
> At their resolution setting tables.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

It turns that this actually not a bug. It is just that I reverted
the logic on patch 08/13.

So, I'll merge this one there and re-send this series.


> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1637140900.git.mchehab+huawei@kernel.org/
> 
>  .../staging/media/atomisp/pci/sh_css_param_shading.c   | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
> index 90b5f9014c5e..005b0ab41588 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
> @@ -283,16 +283,16 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
>  	 * by cropping the non-binned part of the shading table and then
>  	 * increasing the size of a grid cell with this same binning factor.
>  	 */
> -	input_width   *= sensor_binning;
> -	input_height  *= sensor_binning;
> +	input_width   <<= sensor_binning;
> +	input_height  <<= sensor_binning;
>  	/*
>  	 * We also scale the padding by the same binning factor. This will
>  	 * make it much easier later on to calculate the padding of the
>  	 * shading table.
>  	 */
> -	left_padding  *= sensor_binning;
> -	right_padding *= sensor_binning;
> -	top_padding   *= sensor_binning;
> +	left_padding  <<= sensor_binning;
> +	right_padding <<= sensor_binning;
> +	top_padding   <<= sensor_binning;
>  
>  	/*
>  	 * during simulation, the used resolution can exceed the sensor
