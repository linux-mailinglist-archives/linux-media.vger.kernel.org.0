Return-Path: <linux-media+bounces-17864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0FB970040
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 07:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ADC11F227E5
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 05:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C84612D766;
	Sat,  7 Sep 2024 05:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SB5djsi4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A462F2AE8A
	for <linux-media@vger.kernel.org>; Sat,  7 Sep 2024 05:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725688141; cv=none; b=ivCBInvxw1kQB0pJGuZJVKvERUnFC8adss8VaQnByDlj+AC6aJM6+EFebdSOOwqn+rfZEth5Ox6nmkCPwTfVk5RT3ltPXiTUBj54+ZhTbEBr2iTiz4NfAyohVCBnbDt7gn5tO0TysaAQ538qY4+6OqRa+CnxA/jk+/J9iWDWZhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725688141; c=relaxed/simple;
	bh=y5CuRZoAfmz5Hm07hQSAAE5GLKPVsGSnV7nHnf5p2Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cehx9PEWDAQQTncdTsBkcMEM7jzuwaozc5vyQrL1s9YZi/VvDRpcgWogajlFzWM4px15atPoIfsRWBYlM4yvsbvR22YhWGpSIYk6a713PnU5VnZnrm60fhZlHbpIMBlF4OeQxvJE0icL1+KIxwxY9q+/Zq89B0BftoIkmW6RC/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SB5djsi4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76B3C4CEC2;
	Sat,  7 Sep 2024 05:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725688141;
	bh=y5CuRZoAfmz5Hm07hQSAAE5GLKPVsGSnV7nHnf5p2Mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SB5djsi4P/T6Z5wmYC3ob+OewFp2nBBsG7im6Q2SBTuUlTg6roAMYylDySmUn+/q7
	 u3ggU0UaNOEvAx35CKUsVaTS5MR+IhJGDezf/6GtOyC6ildmjwvmKoxR1g6xtoj2HD
	 iZJpcd1imUFWNqr+N8P/o7+GdfQW1j67r3gEDZg4=
Date: Sat, 7 Sep 2024 07:48:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com, ricardo@marliere.net,
	ruanjinjie@huawei.com, linux-media@vger.kernel.org
Subject: Re: [PATCH -next v2 2/2] media: siano: remove redundant null pointer
 checks in cec_devnode_init()
Message-ID: <2024090737-pavement-santa-b360@gregkh>
References: <20240907034400.3693797-1-lizetao1@huawei.com>
 <20240907034400.3693797-2-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240907034400.3693797-2-lizetao1@huawei.com>

On Sat, Sep 07, 2024 at 11:44:00AM +0800, Li Zetao wrote:
> Since the debugfs_create_dir() never returns a null pointer, checking
> the return value for a null pointer is redundant, Remove this check
> since debugfs_create_file can handle IS_ERR pointers.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
> v1 -> v2: Remove this check since debugfs_create_file can
> handle IS_ERR pointers.
> v1:
> https://lore.kernel.org/all/20240903143607.2004802-2-lizetao1@huawei.com/
> 
>  drivers/media/common/siano/smsdvb-debugfs.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/common/siano/smsdvb-debugfs.c b/drivers/media/common/siano/smsdvb-debugfs.c
> index 73990e469df9..9db38ae4ecee 100644
> --- a/drivers/media/common/siano/smsdvb-debugfs.c
> +++ b/drivers/media/common/siano/smsdvb-debugfs.c
> @@ -411,10 +411,6 @@ void smsdvb_debugfs_register(void)
>  	 * subsystem.
>  	 */
>  	d = debugfs_create_dir("smsdvb", usb_debug_root);
> -	if (IS_ERR_OR_NULL(d)) {
> -		pr_err("Couldn't create sysfs node for smsdvb\n");
> -		return;
> -	}
>  	smsdvb_debugfs_usb_root = d;

Why is d even needed here, just assign it to smsdvb_debugfs_usb_root
directly, right?

thanks,

greg k-h

