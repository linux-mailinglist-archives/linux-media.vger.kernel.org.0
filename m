Return-Path: <linux-media+bounces-15516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F1494087A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 08:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20D01B23B9A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 06:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87EA618F2DC;
	Tue, 30 Jul 2024 06:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xyb2uWMz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BAF1662F4;
	Tue, 30 Jul 2024 06:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722321536; cv=none; b=ibWmXuamFGsOQqla8rCpCiOnZ89pml3NiWWTxd+xv3BhzPdbYl8MXFH7f47U9/kE4wdUS1OTOhFzXbYvPr91GdOOHJOupBLq0ntDmTlUMGi2ITIM0KG0G37qXgwfAFW9+wfV67Vi8wT50X9L96kg0pgx9CyI/F2rINzlNQqkY4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722321536; c=relaxed/simple;
	bh=gt9cgNB6We7Ss9zxjvpz6ujv1fhZjUUStTI5lvNSIY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewQA5PxEBSRIZj5fx4mTCFz7Y7esAnfzdn8sBMEZUmNQp74NkXGzlPk0dw0nobQMrB2/p8VDIeLohbBJ7lIJKIJ5D4qLQqHjzJdHdDRumrP5dY3+2k3IqCLJwIZVPsL4CEor2ALgl0Qtjgfu7/6KzaNfv8N8m5GloL/lrK9b0DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Xyb2uWMz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECEFC32782;
	Tue, 30 Jul 2024 06:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722321535;
	bh=gt9cgNB6We7Ss9zxjvpz6ujv1fhZjUUStTI5lvNSIY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xyb2uWMza7vktlaGfpPCyChRIHduXENKAW+d7OfZN+bmuBVlm+dJSIMXRCeb4tGa9
	 7LrafFAH31oH0GFcWjLYZ2IdbLk3fyO2AdyYOcDXkWlZqu+HLRjp/6v5aoyzdTHus/
	 0uXetVCZbHsTCGTbHGVhNfOitYhmr1EAIrTpuuZI=
Date: Tue, 30 Jul 2024 08:38:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sean Whitton <spwhitton@spwhitton.name>
Cc: ~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Add parentheses around macro
 definitions
Message-ID: <2024073020-reload-vanquish-f937@gregkh>
References: <20240730062348.46205-2-spwhitton@spwhitton.name>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730062348.46205-2-spwhitton@spwhitton.name>

On Tue, Jul 30, 2024 at 03:23:45PM +0900, Sean Whitton wrote:
> Fix checkpatch error
> "ERROR: Macros with complex values should be enclosed in parentheses"
> at hive_isp_css_include/sp.h:41, hive_isp_css_include/sp.h:42.
> 
> Signed-off-by: Sean Whitton <spwhitton@spwhitton.name>
> ---
>  drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> This is my first Linux kernel patch, from Helen Koike's DebConf24 workshop.
> Thanks!
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h
> index a7d00c7bb8bc..128109afe842 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/sp.h
> @@ -38,8 +38,8 @@
>  #define STORAGE_CLASS_SP_C
>  #include "sp_public.h"
>  #else  /* __INLINE_SP__ */
> -#define STORAGE_CLASS_SP_H static inline
> -#define STORAGE_CLASS_SP_C static inline
> +#define STORAGE_CLASS_SP_H (static inline)
> +#define STORAGE_CLASS_SP_C (static inline)

This isn't a "complex values", and really should just be removed
entirely and use the correct "static inline" properly.

thanks,

greg k-h

