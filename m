Return-Path: <linux-media+bounces-14624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C430927214
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 10:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3664BB24093
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 08:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E871A4F1F;
	Thu,  4 Jul 2024 08:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fbZLZYOc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6021AAE02
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 08:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720082999; cv=none; b=a23FTAGSp9/N3xV2J8KZL317zMqwQq5v/D6GvUl8fJ6XUIIjlxV1TFnLSJe7fvFebUrZnlKqnCbL0X0v5hPVgGLmTfjSI0dW2l8s3NR98Sabb335SNpyaB4aw5UhXWp7Daj3Vm7LY+MgECx8PreWxPalJR/eXb1dZVaNkLbZXrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720082999; c=relaxed/simple;
	bh=DXHAiAVeYsdYT60yCoC4x7/xUdVDCxQk5RVnWeB9hno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1Mr+9K5PRiyl1BfEriLFD4Kf7TG9d2hjYCQeBLVkX0zjsHdQM1BkNPUUyxD9wrCpzfEial/NgUXZBICDYCfoTrx2EjYYIaED5SOIBV5krNfNUqWJlph/w826T9mzdYoSnmMNHpzYMJ6lLSmagF5NpVYYOdM5SWP+qQDt1heSxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fbZLZYOc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 900E7541;
	Thu,  4 Jul 2024 10:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720082965;
	bh=DXHAiAVeYsdYT60yCoC4x7/xUdVDCxQk5RVnWeB9hno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbZLZYOc3zSmTXZjTX9B64J3gtRVlCM1mCgNdOhDlUd0a/bN0gnFdRNvmXxqTH2ca
	 FicAu4OvbX6NgcSxxYWStBJvqoSQIEjN/88yEEdZ2M+tCgRKVLs43HCqMjn8w3oWrt
	 a7/R9bNdvn9qLqpH71suXGd4a9fnZ8K48E/cscIc=
Date: Thu, 4 Jul 2024 10:49:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 2/5] media: rkisp1: Add features mask to extensible
 block handlers
Message-ID: <3qr3in6vqjs6xgineym473nbk5q53m2c3jr5o47qosjug2vl3e@ao4be5nusmby>
References: <20240703222533.1662-1-laurent.pinchart@ideasonboard.com>
 <20240703222533.1662-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240703222533.1662-3-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Thu, Jul 04, 2024 at 01:25:30AM GMT, Laurent Pinchart wrote:
> Future ISP parameter blocks for i.MX8MP-specific features will not
> support on Rockchip platforms as they lack the corresponding hardware.
> Introduce a features mask in the extensible block handlers to indicate
> which device features a block require, and ignore blocks that require
> unavailable features.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b10cc2701244..92312b4dabf6 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1845,6 +1845,7 @@ static const struct rkisp1_ext_params_handler {
>  	size_t size;
>  	rkisp1_block_handler handler;
>  	unsigned int group;
> +	unsigned int features;
>  } rkisp1_ext_params_handlers[] = {
>  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
>  		.size		= sizeof(struct rkisp1_ext_params_bls_config),
> @@ -1956,6 +1957,10 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,

Maybe exapand the comment to also specify the feature has to be
supported by the platform ?

		/*
                 * Make sure the block is supported by the platform and in the
                 * list of groups to configure.
                 */


>  		if (!(block_handler->group & block_group_mask))
>  			continue;
>
> +		if ((block_handler->features & params->rkisp1->info->features) !=
> +		    params->rkisp1->info->features)

This should probably be

		if ((block_handler->features & params->rkisp1->info->features) !=
		    block_handler->features)

Thanks
  j

> +			continue;
> +
>  		block_handler->handler(params, block);
>
>  		if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE)
> --
> Regards,
>
> Laurent Pinchart
>

