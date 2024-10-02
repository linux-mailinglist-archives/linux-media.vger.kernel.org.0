Return-Path: <linux-media+bounces-19011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E898E45D
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 22:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92A0D1C23549
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 20:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A681217317;
	Wed,  2 Oct 2024 20:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="kSVJYgQC"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE488F5B;
	Wed,  2 Oct 2024 20:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727901982; cv=none; b=aXDZyLgqyoTlaGIfsxuMc4SIWOtA9a1JrSVOq0KrYpGRuFRHodVWnofkci2xN1Zb11gzOXtu7d/tfaggvjOWrLa8tqZsKUY0EJzxnM2ZCFFCgO+FqzXokuXlD4aHyg2mOt9YQzJJHf7greXt5Gvzp41nLQXjo7rsMlf5JXg00/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727901982; c=relaxed/simple;
	bh=67QpdFC+L1rRGZlRfeTtF9Y8U1xxe0dN9xmw86SLqeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlFQYfAf/MkGRVu6mZpgOvZVaF6weeFYeA+TcxEkuhP+s3o7KMu46VFooFfx+hVaig1gDeDMTsVEGWN+Kzw/DKdgBCOrzwIKoQJuVkxXJBK8Sr6Ss9J3f68+tmfn0O0RFqzStYTil+9x/GGjUc4hbpEzQoQ7SCA5Dusxy8raGRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=kSVJYgQC; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1727901977; bh=67QpdFC+L1rRGZlRfeTtF9Y8U1xxe0dN9xmw86SLqeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSVJYgQCdSzkNJA24L/VSkK9XGmE6A2DBchAPhL77x+q5EiOts6m/suZl95rSxE2l
	 cAOgE4BOVxU0wT+t/LM1akCRyolpJjljmZWpF7juRz25HdpUe18BATvwtRbTXsQ35/
	 9qmcvdv5NnLTcKmziMP289HI987WqkSMczzIOuwhCDCbl9v44S2zS1uQ6OqaJET7IU
	 DTluvLNpxjaSPYPd0NmtHzBVcXwpX9p9RZM1RbQsz1hNcJLtvvnyaJcAl2d7E0BbQf
	 idXRcDpuDGMVi6vvK2dusaMM3sGfgznno2C5Npx3IJkAx9GbacxTQdufxCy6OT9Vlj
	 opyG+QwY8xUjA==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id B600C1003B9; Wed,  2 Oct 2024 21:46:17 +0100 (BST)
Date: Wed, 2 Oct 2024 21:46:17 +0100
From: Sean Young <sean@mess.org>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: mchehab@kernel.org, huanglipeng@vivo.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] media: rc-core: Modify the timeout waiting time for
 the infrared remote control.
Message-ID: <Zv2xGbdhm8kXgDFe@gofer.mess.org>
References: <20240927105808.9284-1-shenlichuan@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927105808.9284-1-shenlichuan@vivo.com>

On Fri, Sep 27, 2024 at 06:58:08PM +0800, Shen Lichuan wrote:
> When transmitting codes from certain infrared remote controls, the kernel
> occasionally fails to receive them due to a timeout during transmission.
> 
> This issue arises specifically in instances where the duration of the 
> signal exceeds the predefined limit (`IR_MAX_DURATION`) in the code
> handling logic located within `lirc_dev.c`:
> 
> if (txbuf[i] > IR_MAX_DURATION - duration || !txbuf[i]) {
> 	pr_err("lirc_transmit duration out range[%d] txbuf:%d duration:%d\n",
> 		i, txbuf[i], duration);
> 	ret = -EINVAL;
> 	goto out_kfree;
> }
> 
> The error manifests as an `EINVAL` (error number 22) being returned when
> attempting to send infrared signals whose individual elements exceed the
> maximum allowed duration (`xbuf[i] > IR_MAX_DURATION - duration`).
> 
> As evidenced by logs, attempts to send commands with extended durations,
> such as those associated with the "Power" button on a Skyworth TV remote,
> fail with this error.
> 
> To rectify this and ensure compatibility with a broader range of infrared
> remote controls, particularly those with lengthy code sequences, this patch
> proposes to increase the value of `IR_MAX_DURATION`. 

IR_MAX_DURATION is already half second; can you elaborate on the signal
that the "Power" button on a Skyworth TV remote looks like? I doubt that
a signal button press would produce more than 500ms of IR; that would be
a lot IR for a single button, and would also have terrible latency for the
user.

My guess is that the signal is repeating, and you're trying to send
the signals with the repeats in one go. It would be nice to hear what
protocol this is and what it looks like encoded.

If the signal contains large gaps/spaces, then the signal can be split
up into multiple sends. For example, if you have this signal

+100 -150000 +150

You can also send this like so (pseudo code):

int fd = open("/dev/lirc0", O_RW);
write(fd, [100], 1);
usleep(150000);
write(fd, [100], 1);
close(fd);

This overcomes the limitation of the IR_MAX_DURATION, and also makes it
possible to send on much larger variety of infrared hardware, lots of them
do not support sending large gaps or long signals.

> This adjustment will allow for successful transmission of these extended
> codes, thereby enhancing overall device compatibility and ensuring proper
> functionality of remotes with long duration signals.
> 
> Example log entries highlighting the issue:
> 	D ConsumerIrHal: IRTX: Send to driver <268>
> 	E ConsumerIrHal: irtx write fail, errno=22 <269>
> 	D ConsumerIrHal: Done, Turn OFF IRTX <270>

What software is this, anything you can share about it?

> Modifying the maximum timeout time in this area can solve this issue.

We hold various locks during the transmit, and keeping it to a minimum
is much nicer. The gpio-ir-tx driver disables interrupts for this duration,
and many other drivers hold the rcdev mutex.

Thanks,

Sean

> 
> Signed-off-by: Huang Lipeng <huanglipeng@vivo.com>
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> ---
>  include/media/rc-core.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/media/rc-core.h b/include/media/rc-core.h
> index d095908073ef..2f575c18b6b6 100644
> --- a/include/media/rc-core.h
> +++ b/include/media/rc-core.h
> @@ -303,7 +303,7 @@ struct ir_raw_event {
>  
>  #define US_TO_NS(usec)		((usec) * 1000)
>  #define MS_TO_US(msec)		((msec) * 1000)
> -#define IR_MAX_DURATION		MS_TO_US(500)
> +#define IR_MAX_DURATION		MS_TO_US(1000)
>  #define IR_DEFAULT_TIMEOUT	MS_TO_US(125)
>  #define IR_MAX_TIMEOUT		LIRC_VALUE_MASK
>  
> -- 
> 2.17.1

