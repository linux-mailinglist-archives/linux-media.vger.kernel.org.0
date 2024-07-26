Return-Path: <linux-media+bounces-15354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E043093CF0D
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 09:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9359E1F2296B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 07:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBD3176ADA;
	Fri, 26 Jul 2024 07:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e20e/rbW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB7417625C;
	Fri, 26 Jul 2024 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721980141; cv=none; b=Cl3asWk6A/FxPBCm7XdFSkB1ls5xm0xt38HEwb37cNXZMiE9J28V3+wUU6SIW6a/aKuDCs1F648qDpGosSfhHNIKlY32JQGvvozDE7UPgg3kjF2dJtJK5JeKPS9VR4sJwIDpj9IQuFxLj9JxjE0OfVchkwrSvhiLttmUwQSLuXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721980141; c=relaxed/simple;
	bh=2MfHuog33syRQOQk+cSfq53QFPYTOF5wtCPCig5gRCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stsxp/JlIRSf6DqS+f3oj+zKesIcpbG4BuZCTBh0r0MQonlgETxBBPc/ZYzsX3GXG7nu1KuUPN3wgUMy0hydawSAoFmunq+6Y+oR6hjCDQhkPCJUmDUrScSjM7MVqWRYSty55xC90Lmxy3E7FvEMfJssV2lE3oP5Qxm+x97TYQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e20e/rbW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FB1C32782;
	Fri, 26 Jul 2024 07:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721980140;
	bh=2MfHuog33syRQOQk+cSfq53QFPYTOF5wtCPCig5gRCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e20e/rbW/O/Ay2WfvvEeexBRJxlE5babK/W2K8sEXpinETGu9D2gT8nJOGAPcgj2B
	 4iBgsIQkIX6i02HPL2pnvltHBYGeW/babtN7eP0fi1WCZyFe1AkZlT+Ks9OOJiPNnA
	 PwQuHvQxf34hcRzYdK5nRHEgehH7Im+BGsd9Ut7c=
Date: Fri, 26 Jul 2024 09:48:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: omap4iss: add check for
 media_pad_remote_pad_first
Message-ID: <2024072625-stubborn-garlic-11ae@gregkh>
References: <20240726072814.3534601-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726072814.3534601-1-nichen@iscas.ac.cn>

On Fri, Jul 26, 2024 at 03:28:14PM +0800, Chen Ni wrote:
> Add check for the return value of media_pad_remote_pad_first() and
> return the error if it fails in order to avoid NULL pointer dereference.
> 
> Fixes: b2e44430b634 ("media: mc-entity: Rename media_entity_remote_pad() to media_pad_remote_pad_first()")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/staging/media/omap4iss/iss_csi2.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/media/omap4iss/iss_csi2.c b/drivers/staging/media/omap4iss/iss_csi2.c
> index 0e6c5bd81930..43851bbd0cc3 100644
> --- a/drivers/staging/media/omap4iss/iss_csi2.c
> +++ b/drivers/staging/media/omap4iss/iss_csi2.c
> @@ -539,6 +539,9 @@ static int csi2_configure(struct iss_csi2_device *csi2)
>  		return -EBUSY;
>  
>  	pad = media_pad_remote_pad_first(&csi2->pads[CSI2_PAD_SINK]);
> +	if (!pad)
> +		return -EPIPE;

How was this found and tested?

thanks,

greg k-h

