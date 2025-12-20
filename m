Return-Path: <linux-media+bounces-49241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2214CD3352
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 17:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82FDC3015AB2
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 16:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE7830497C;
	Sat, 20 Dec 2025 16:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="nWq4gqf1"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E882FC011;
	Sat, 20 Dec 2025 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766247290; cv=none; b=pb4jZKcCs2Q4uxh4s5gP/zVCn+DxuqBabRI1tQWXhlFvNIMqQxOcz6lGPKi2Qs2NChAao3CMy/aldL/XoQ2gd2vCrXezMN7ttwDMUxmgkRTHdnTltfVBPRBn4mbvgSolkJo9inNRmdVwkgk5bzWc6eXIUSWej3LxPOn6xN5732w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766247290; c=relaxed/simple;
	bh=BkNVy1H41U05dxEhNrlaQUW5hRNhDhwA/idDFLn0jgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nh9g2Mhd9RNlG9hMKSdANJ9KbAMC8alKo1w3cyeDAG/cBqgwtjTadLEB7Dy/2WSt4BmMWZyVedoMsEdsKpFBhKFlz5cfpDpaV6CYZBk/7OKuxPoslQX3XW3/hspmdjxfDrrkIxcMfdwQerPxhWVnXQlaqjkkEd3hawj6hSoI4ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=nWq4gqf1; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1766246788; bh=BkNVy1H41U05dxEhNrlaQUW5hRNhDhwA/idDFLn0jgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nWq4gqf1mU941RFlJ6Eazhl7FVPBHFS4MYxevgRyWnNeuM623cJk55ZIEs3hKW8wW
	 P9TusnZAY9s7ycLs/PhkQpiC1vCAGSpTZP7TaCaDFVp9/bX/FLOfGyBHpUsnexWa+A
	 n4dmbuHeSTvhNIyw2oPE0WT37MXceSLixEwfWZ728NXtpnhQVaE5VB7rJ5G8eMT+Gw
	 II6byw1RCqI1GTDTkT39oWJIMmAiOqaI19pNDJ+LHGy/kX41yycwxsbrtr8AI7KmFQ
	 w+kyvLoaVAGzedJg0PGvWpXBoSWXWyl5t7PIYI9V44QMzOhzZbNQ1dpTXZ2Fuz49vO
	 5N8ympe2Agguw==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 5D3D81003B8; Sat, 20 Dec 2025 16:06:28 +0000 (GMT)
Date: Sat, 20 Dec 2025 16:06:28 +0000
From: Sean Young <sean@mess.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mceusb: fix race between device disconnection and
 urb callback
Message-ID: <aUbJhEhuGTyu24TU@gofer.mess.org>
References: <20251114101432.2566-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114101432.2566-1-vulab@iscas.ac.cn>

On Fri, Nov 14, 2025 at 06:14:31PM +0800, Haotian Zhang wrote:
> The mceusb_disconnect() function calls rc_unregister_device() before
> usb_kill_urb(), creating a race condition similar to the one fixed in
> commit 'f656cfbc7a29'. If rc_unregister_device() executes while the URB
> callback mceusb_dev_recv() is still running, mceusb_process_ir_data()
> may call ir_raw_event_store_with_filter() or ir_raw_event_handle() with
> a freed ir->rc->raw pointer, leading to a NULL pointer dereference.
> 
> Call usb_kill_urb() before rc_unregister_device() to ensure all URB
> callbacks complete before freeing device resources.

First of all, I must apologise for not responding earlier. Haotian, you
have found a real issue here, thank you for finding and reporting it.

I've been thinking about this for some time now. I think I've found an
alternative solution, which I'l shortly be posting to the list.

Thank you 

Sean

> 
> Fixes: d8b4b5822f51 ("[media] ir-core: make struct rc_dev the primary interface")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/media/rc/mceusb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
> index 044767eb3a38..fb5c393dcb94 100644
> --- a/drivers/media/rc/mceusb.c
> +++ b/drivers/media/rc/mceusb.c
> @@ -1845,8 +1845,8 @@ static void mceusb_dev_disconnect(struct usb_interface *intf)
>  
>  	ir->usbdev = NULL;
>  	cancel_work_sync(&ir->kevent);
> -	rc_unregister_device(ir->rc);
>  	usb_kill_urb(ir->urb_in);
> +	rc_unregister_device(ir->rc);
>  	usb_free_urb(ir->urb_in);
>  	usb_free_coherent(dev, ir->len_in, ir->buf_in, ir->dma_in);
>  	usb_put_dev(dev);
> -- 
> 2.50.1.windows.1

