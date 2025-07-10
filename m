Return-Path: <linux-media+bounces-37420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B50B00C67
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 21:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CC3A5A1716
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040302FD877;
	Thu, 10 Jul 2025 19:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="LEkKR+BV"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBA4156C6A;
	Thu, 10 Jul 2025 19:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752177544; cv=none; b=TJeqAaX+KzLgIToS2SnLfG/JOWcM2ue+v64zBnBCYINeY2yPIkglRxJySOvZ9qw3KJpOnDtiYPaVsnjvXJ261m5kvHBrtS0wUevpGSYGx9Qrs9YlP4zevJqiNLUcCd1ZjX3CGa/Oyztmwq91Evm566DN/WAWkWTo8afZx/N4pqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752177544; c=relaxed/simple;
	bh=hIEHGKqnWBN1npDvYQHi5KSQKkSDsFC0CfAOfVnneHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAkllENLkV54HMPImMNt/54FE4ZA0njN4oJyaodcp4bKFOK+MqcVBrWXAUTlPnN+H8bVeI6FkpoCcY+CTxpfPTysj/znj9evmVcQwm40JKBKoWUnmNttAjK492GJd/OzPNmUMta6qw4vBzb8wQK5AMmVbwAOaX2njKVzwEc/6MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=LEkKR+BV; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1752177534; bh=hIEHGKqnWBN1npDvYQHi5KSQKkSDsFC0CfAOfVnneHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEkKR+BVcQ2ou0NSHtMKzGA7zc72lp6IcpQlfdwVvbjilOaRYpqw6aHdhWbJd8Ck3
	 QLZ3ZQ2AWmvFVWaw5Gvv324JKokzMo/HJs+fn4TcC1G9hi4ttzL91Kbus9U9WOPJJn
	 p3GBeH4EJKLtqkRjRKROxCGAJ37o8t5r9Pef4NTXO8UXu5Vn5Jj6za1uUP65eK4to9
	 8JwtVDC9+lQla5Mu2oTGuQRNW5Oivg1phE+xfXgC3SkYLQV+yG/uGGIoP6IeMzY5bK
	 3ndSjajjotoPQJNOxlr+vUm69Kd/jWC7FF0TBCE0Y7DnfVsCiy25fUqTKjxd/1xzpH
	 FN1yAVJMyUxtQ==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id DB06F1002BF; Thu, 10 Jul 2025 20:58:54 +0100 (BST)
Date: Thu, 10 Jul 2025 20:58:54 +0100
From: Sean Young <sean@mess.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: imon: ratelimit usb_rx_callback_intf{0,1} error
 messages
Message-ID: <aHAbfmpBWzVVT1r8@gofer.mess.org>
References: <56c16d80-57d0-4873-98c8-03e37edbbbdf@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56c16d80-57d0-4873-98c8-03e37edbbbdf@I-love.SAKURA.ne.jp>

Hello Tetsuo,

Thank you for submitting your patch.

On Thu, Jul 10, 2025 at 10:43:56AM +0900, Tetsuo Handa wrote:
> Ratelimiting flood of
> 
>   imon 1-1:0.0: imon usb_rx_callback_intf0: status(-71): ignored
> 
> message helps reducing possibility of hitting
> 
>   rcu: INFO: rcu_preempt self-detected stall on CPU
>   rcu: 	0-....: (10485 ticks this GP) idle=ff54/1/0x4000000000000000 softirq=53201/53201 fqs=5246
>   rcu: 	         hardirqs   softirqs   csw/system
>   rcu: 	 number:     6548       7856            0
>   rcu: 	cputime:        0        739        51598   ==> 52490(ms)
>   rcu: 	(t=10500 jiffies g=34137 q=35661 ncpus=2)
>   CPU: 0 UID: 0 PID: 6858 Comm: kworker/0:4 Not tainted 6.16.0-rc4-syzkaller-00300-g81c3b7256f9e #0 PREEMPT(voluntary)
>   Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
>   Workqueue: usb_hub_wq hub_event
>   RIP: 0010:console_flush_all+0x9a2/0xc60 kernel/printk/printk.c:3227
> 
> messages.
> 
> Link: https://syzkaller.appspot.com/bug?extid=592e2ab8775dbe0bf09a
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
>  drivers/media/rc/imon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> index f5221b018808..10124a26ffde 100644
> --- a/drivers/media/rc/imon.c
> +++ b/drivers/media/rc/imon.c
> @@ -1765,7 +1765,7 @@ static void usb_rx_callback_intf0(struct urb *urb)
>  		break;
>  
>  	default:
> -		dev_warn(ictx->dev, "imon %s: status(%d): ignored\n",
> +		dev_warn_ratelimited(ictx->dev, "imon %s: status(%d): ignored\n",

>  			 __func__, urb->status);

I'm not sure this is the right way to go about this. When the usb callback
receives urb status -71 (-EPROTO, i.e. protocol error or unplug), then there
is no use in continuing to resubmit the urb; you will only get more failures
like you are seeing here.

So I think for -EPROTO, simply return and do not resubmit the urb. TBH
I am not sure if usb_unlink_urb() is required in this case, that needs
investigation.

>  		break;
>  	}
> @@ -1806,7 +1806,7 @@ static void usb_rx_callback_intf1(struct urb *urb)
>  		break;
>  
>  	default:
> -		dev_warn(ictx->dev, "imon %s: status(%d): ignored\n",
> +		dev_warn_ratelimited(ictx->dev, "imon %s: status(%d): ignored\n",
>  			 __func__, urb->status);

Same here.

>  		break;
>  	}
> -- 
> 2.47.1
> 

