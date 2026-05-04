Return-Path: <linux-media+bounces-60318-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICnYH/TM+Gma0wIAu9opvQ
	(envelope-from <linux-media+bounces-60318-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:44:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CF64C18FF
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBCE43035267
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 16:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922A33E3C57;
	Mon,  4 May 2026 16:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="sDce3ILZ"
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B02621C9EA;
	Mon,  4 May 2026 16:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777913038; cv=none; b=ih1BO8KLVhDZMsrJAcbP1mb7Mr0v8ijQFtiLxQ2qpmv7mElIkgXnNvV+jrCI66J4UEG4KVrz3UdArx5qyXfJ2GpPYPxTAxQHrMYgVZfyTV3Fw93IRw2UZMmHMT6YlxMUqj7uqVLdSk4/FfkLSkRW0Hd1dCA1R/Os2uDXT2dyPAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777913038; c=relaxed/simple;
	bh=JBC3neUw2D4+88wlHvHCMnPdv+fkZwDKmX1lADy5AR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8m41TpUxe/tKSJqHPYDy8XZ1G8CI18wtyIEjPpMQ3ffRWr+OlQ1AASCMBGY91ohv9wgDxrYk/5e1pwmoocwAuuZhJQ4A1Gf97Yi0JvXGXW++uQIRHi7dAMRefcqa33C1EMtZJwenGAOXyPYpgD90KMqO7xxNeT6DDQSdpwUxuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=sDce3ILZ; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1777913028; bh=JBC3neUw2D4+88wlHvHCMnPdv+fkZwDKmX1lADy5AR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDce3ILZMqZJO7+ikPpkGNUEYEBicCqDL6bnR4YBO23SkoYB2ha1LrZi8v/VO5rbT
	 IklcIZ8GzhcKpD6ZLIOIEQn7fDPuAzAQROkbDfvaby6WF3ugjw/LmM8Ynwg4z9FSxB
	 WMM33CcJLvestL/nFHzCSyi0iY06hGH2bptniqH2sr5bgcltLuQHRmhsUstD87Pxa1
	 POnENygeiUaQjTM16sGA6mBfUS0wcP1HMtkFZmNvdVlxf7fRfYIq6v48FyN4ZkzOCa
	 t5oFBYSViaRML3NY29ieGHF2tsq+833qotwdadgWWuqYVESaKz5l74I3oE6+qviGYm
	 I2lJHc1eIJ2vg==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id D972D41CDC; Mon, 04 May 2026 17:43:48 +0100 (BST)
Date: Mon, 4 May 2026 17:43:48 +0100
From: Sean Young <sean@mess.org>
To: Rohaniyaa <rohanmithari09@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	syzbot+5d7eece664082e0c5c1a@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: rc: igorplugusb: fix memory corruption race
 condition in probe
Message-ID: <afjMxJQ8Ftzb8kSq@extorris.mess.org>
References: <20260404183507.773866-1-rohanmithari09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404183507.773866-1-rohanmithari09@gmail.com>
X-Rspamd-Queue-Id: D1CF64C18FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60318-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mess.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,5d7eece664082e0c5c1a];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,mess.org:dkim,appspotmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi,

On Sun, Apr 05, 2026 at 12:05:07AM +0530, Rohaniyaa wrote:
> From: Rohan Mithari <rohanmithari09@gmail.com>
> 
> Syzbot reported a race condition causing a WARNING in usb_submit_urb.
> 
> In igorplugusb_probe(), the driver registers the RC device via
> rc_register_device() before initializing the internal interface data
> via usb_set_intfdata().
> 
> If the device is abruptly disconnected or accessed by userspace
> immediately after registration, the disconnect function or active URB
> submission can trigger a NULL pointer dereference or Use-After-Free.
> Without KASAN enabled, this race condition silently corrupts the slab
> allocator, leading to a delayed fatal panic in kmem_cache_alloc().
> 
> This patch fixes the race by ensuring the private data (ir) is safely
> attached to the USB interface and the hardware is fully initialized
> before exposing the device to the subsystem via rc_register_device().
> 
> Reported-by: syzbot+5d7eece664082e0c5c1a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5d7eece664082e0c5c1a
> 
> Signed-off-by: Rohan Mithari <rohanmithari09@gmail.com>
> ---
>  drivers/media/rc/igorplugusb.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
> index 3e10f6fe89f8..a694ed1e5c1f 100644
> --- a/drivers/media/rc/igorplugusb.c
> +++ b/drivers/media/rc/igorplugusb.c
> @@ -214,17 +214,14 @@ static int igorplugusb_probe(struct usb_interface *intf,
>  	rc->rx_resolution = 85;
>  
>  	ir->rc = rc;
> +	usb_set_intfdata(intf, ir);
> +	igorplugusb_cmd(ir, SET_INFRABUFFER_EMPTY);
>  	ret = rc_register_device(rc);
>  	if (ret) {
>  		dev_err(&intf->dev, "failed to register rc device: %d", ret);
>  		goto fail;
> -	}
> -
> -	usb_set_intfdata(intf, ir);
> -
> -	igorplugusb_cmd(ir, SET_INFRABUFFER_EMPTY);
> -

I don't understand how that fixes anything.

> -	return 0;
> +}
> +return 0;

That's messy.

>  fail:
>  	usb_poison_urb(ir->urb);
>  	timer_delete(&ir->timer);
> @@ -233,8 +230,7 @@ static int igorplugusb_probe(struct usb_interface *intf,
>  	rc_free_device(ir->rc);
>  	kfree(ir->buf_in);
>  	kfree(ir->request);
> -
> -	return ret;
> +return ret;

Again, do not do that - that's messy.

Thanks,

Sean

>  }
>  
>  static void igorplugusb_disconnect(struct usb_interface *intf)
> -- 
> 2.34.1
> 

