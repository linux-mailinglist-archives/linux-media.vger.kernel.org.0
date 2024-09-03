Return-Path: <linux-media+bounces-17488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C490B96A60D
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 20:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 849111F220A8
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 18:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4D245003;
	Tue,  3 Sep 2024 18:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0pJi2INI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADC0F9DF
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 18:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725386495; cv=none; b=MnZfgnj+vaR9iQKmxONLS/yECl7jh0k9uz7T2Pjnjp1V/iOdWVwFyYZ4vjKdXvpSGB3g2CgQuU0N+d/bEn9AvuiEl6Rs3JArBwjtNivQ+kFprSux0YX9uQSpPETcdnYa1Ic1fuaH5k48Qzo0VO9gam0XCCF/j2ZrJWe70bFrRtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725386495; c=relaxed/simple;
	bh=o60aX+SlJ/2toDJ7aV85aTDw1dWHo8cbLTvfvywNcwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3EpDNwYrzE2KOlf017KYU7+ZvV0evLpbavCldNMWFrLUF+c4hzxMNslvhF9aITWlw8zW5BLL/XWm/6+iW6wQhV9A3L+4pHsioGdHSNLLZ0PzAtJ1qH1hSNLQiXHIl3AMMGNfP+oPeyIb8fjORJmVJOwNkeSjk28jhWtZFSjCsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0pJi2INI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D417FC4CEC4;
	Tue,  3 Sep 2024 18:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725386495;
	bh=o60aX+SlJ/2toDJ7aV85aTDw1dWHo8cbLTvfvywNcwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0pJi2INIp0Gm7DNaoCb9E+EVLu17kQh/f5hz0efAP0EZ+PYLGki//uiqPIOuGbagM
	 799gvXOSApqDgEx4Fj7klOu2Z8+9Q1XBYcFBfZSnMv9GAzG4g0xD1ds2qadEhFFibf
	 +OGQkXg8AdiUBxStiH8SLCcKoqvGenGLXMGCGHDA=
Date: Tue, 3 Sep 2024 20:01:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, ricardo@marliere.net,
	laurent.pinchart+renesas@ideasonboard.com, ruanjinjie@huawei.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH -next 1/2] media: cec: remove redundant null pointer
 checks in cec_devnode_init()
Message-ID: <2024090358-pacifism-napping-728b@gregkh>
References: <20240903143607.2004802-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903143607.2004802-1-lizetao1@huawei.com>

On Tue, Sep 03, 2024 at 10:36:06PM +0800, Li Zetao wrote:
> Since the debugfs_create_dir() never returns a null pointer, checking
> the return value for a null pointer is redundant, and using IS_ERR is
> safe enough.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/media/cec/core/cec-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
> index e0756826d629..b4135447cdae 100644
> --- a/drivers/media/cec/core/cec-core.c
> +++ b/drivers/media/cec/core/cec-core.c
> @@ -441,7 +441,7 @@ static int __init cec_devnode_init(void)
>  
>  #ifdef CONFIG_DEBUG_FS

This ifdef should not be needed.

>  	top_cec_dir = debugfs_create_dir("cec", NULL);
> -	if (IS_ERR_OR_NULL(top_cec_dir)) {
> +	if (IS_ERR(top_cec_dir)) {
>  		pr_warn("cec: Failed to create debugfs cec dir\n");

No need to tell anyone anything, or ever check the return value of a
debugfs call, please change the logic to that.

>  		top_cec_dir = NULL;

Not needed either.

thanks,

greg k-h

