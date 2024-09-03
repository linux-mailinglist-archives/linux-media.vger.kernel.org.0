Return-Path: <linux-media+bounces-17489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9253996A60E
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 20:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 306A2B24BB2
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 18:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F287E18E741;
	Tue,  3 Sep 2024 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lBrF56Hy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E091F9DF
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725386506; cv=none; b=mAqbHLChQMoXYb71LmDzG0oGZSd4IBGODRupUkP5AdFsUQ7VUGwrj8eXIe1J/WexeL/ggvH53Lu401w5ujCxVrt8tM16aqnXnd5y6pLhCbW7v9K5g2cX2DCSk1jRtsZhjw1rG2GBC/31h2B0OoFru1pPhEj8T7+l4IeSdsffdiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725386506; c=relaxed/simple;
	bh=397YjbGxn55sn7oWWPCdX0tA5QOEYmiTY6LUN7S6tg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpzhwtedxax5X+RTJfkB7giwBf6kMEjEw6UklKatKBj9LFj6I3WBcwWL5pHM4UELk8F77TL3V+TXG5WJFiauxiQ4Wuw7i+0IFJykgCutjYmPUHX1gcxAQ6ewFHBYk+ipbSbQWc94aB/aIZzCqsuTQl9MVfYrCgYW31q/sPfOPlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lBrF56Hy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2B4C4CEC4;
	Tue,  3 Sep 2024 18:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725386505;
	bh=397YjbGxn55sn7oWWPCdX0tA5QOEYmiTY6LUN7S6tg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBrF56HyZq0NPw5vJwQFoFSs8AL4zw8O2wmS0hshX3zfmvEQDGbqqU9MfaMxdHwIq
	 4YiAbpnq4PdqVJWrlqbxShiNdpV8KrF843dzuxU7izLcigu5VHIMuVG4Z2zAZMELQX
	 cYe10zKt6s+VEJdaSMqqlPFc13wUeXKa8ynSBEhE=
Date: Tue, 3 Sep 2024 20:01:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, ricardo@marliere.net,
	laurent.pinchart+renesas@ideasonboard.com, ruanjinjie@huawei.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH -next 2/2] media: siano: remove redundant null pointer
 checks in cec_devnode_init()
Message-ID: <2024090334-garment-goliath-3c73@gregkh>
References: <20240903143607.2004802-1-lizetao1@huawei.com>
 <20240903143607.2004802-2-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903143607.2004802-2-lizetao1@huawei.com>

On Tue, Sep 03, 2024 at 10:36:07PM +0800, Li Zetao wrote:
> Since the debugfs_create_dir() never returns a null pointer, checking
> the return value for a null pointer is redundant, and using IS_ERR is
> safe enough.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/media/common/siano/smsdvb-debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/siano/smsdvb-debugfs.c b/drivers/media/common/siano/smsdvb-debugfs.c
> index 73990e469df9..325d674c74d9 100644
> --- a/drivers/media/common/siano/smsdvb-debugfs.c
> +++ b/drivers/media/common/siano/smsdvb-debugfs.c
> @@ -411,7 +411,7 @@ void smsdvb_debugfs_register(void)
>  	 * subsystem.
>  	 */
>  	d = debugfs_create_dir("smsdvb", usb_debug_root);
> -	if (IS_ERR_OR_NULL(d)) {
> +	if (IS_ERR(d)) {
>  		pr_err("Couldn't create sysfs node for smsdvb\n");

Again, just do not check.

thanks,

greg k-h

