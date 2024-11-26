Return-Path: <linux-media+bounces-22117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7EB9D9F30
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 23:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 227C5282D47
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 22:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6781DFE06;
	Tue, 26 Nov 2024 22:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tN+Dy8AW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3621DA632;
	Tue, 26 Nov 2024 22:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732660078; cv=none; b=p5+WN840NetrH+I8J01hfmMHqOzneOWubCnOYoMSVYoa5Tsw+vPInoI1aGU7YscTCu1GpaJ3n2gD3tcRMk7dGCqqJqwvVxO1sdDTZx9X8WdzViKVdaSmUoPb0oLSsmU4siupVoBOXM1nIry4w/f/WHiR/Uhr3mpew1NDVPWHz20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732660078; c=relaxed/simple;
	bh=GzZ8oVk5MZ79g5dw7DokNA5vq6PyiBw5xTLBORCElQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFo0Flz/hgYeGTYc4LBr7546ptGr6lobcdckY6AIUdsCGQi//s0T4ryShcUamwu2Lv4CRVNhBCNZRMB6liC5SxwQyzvrpF3psV/KxEoe4GT79w6eUFPayMg7rHDCW045AGpOI2Q/miSJcil+zvoNhUjxRzaPotwFj6Y2MlbgQgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tN+Dy8AW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2799DC4CECF;
	Tue, 26 Nov 2024 22:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1732660077;
	bh=GzZ8oVk5MZ79g5dw7DokNA5vq6PyiBw5xTLBORCElQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tN+Dy8AW26HHkT7e7XD6Y2+YyIUtZ2IXKUvPC6qI1Bd6b8+JqyAIXCkcKq8R+Oqqc
	 EcTOUUhpsXs2yH7KOaq0QgQGL+0KEZPQgFY8om9gvuhlA3DNWNE254n8M9GRkxuATZ
	 fithpFoR83Gy5xicW+oeDah8SnZfWFhP4D25sudk=
Date: Tue, 26 Nov 2024 23:27:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: sean@mess.org, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: rc: iguanair: handle timeouts
Message-ID: <2024112608-easter-radiance-4a6c@gregkh>
References: <20241126131722.22175-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126131722.22175-1-oneukum@suse.com>

On Tue, Nov 26, 2024 at 02:17:22PM +0100, Oliver Neukum wrote:
> In case of a timeout the IO must be cancelled or
> the next IO using the URB will fail and/or overwrite
> an operational URB.
> 
> The automatic bisection fails because it arrives
> at a commit that correctly lets the test case run
> without an error.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Fixes: e99a7cfe93fd9  ("[media] iguanair: reuse existing urb callback for command responses")
> Reported-by: syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com
> Tested-by: syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com
> ---
>  drivers/media/rc/iguanair.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
> index 276bf3c8a8cb..8af94246e591 100644
> --- a/drivers/media/rc/iguanair.c
> +++ b/drivers/media/rc/iguanair.c
> @@ -194,8 +194,10 @@ static int iguanair_send(struct iguanair *ir, unsigned size)
>  	if (rc)
>  		return rc;
>  
> -	if (wait_for_completion_timeout(&ir->completion, TIMEOUT) == 0)
> +	if (wait_for_completion_timeout(&ir->completion, TIMEOUT) == 0) {
> +		usb_kill_urb(ir->urb_out);
>  		return -ETIMEDOUT;
> +	}
>  
>  	return rc;
>  }
> -- 
> 2.47.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

