Return-Path: <linux-media+bounces-44387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B18BD8A86
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 12:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E35E18A6B0A
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A662ECE8A;
	Tue, 14 Oct 2025 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emG2uGWw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05902D2497;
	Tue, 14 Oct 2025 10:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436416; cv=none; b=Q4miTkxG4sB02GkAYY9wmYdDObpdEN8rlbWaNDQXxYfK04jPRyMcidKwtkfthBPZ+NHf8l1WSQQDsAj9Cwco9H/pQ6yQ9QmeUKciXrIYjDKCOP8vAjO4kzVpGRFRoQX9jjtO3qJvISqsqWoz+WJcYzuQNTPH0E3CwLhtpNqiTrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436416; c=relaxed/simple;
	bh=vlKsjF/WzeVNZJtjW7yz45GlPnNggzp2rEQRTt+qMx8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JzIrnqRJ1LtQMOHKcTv1tR7DL5J5Du1fQpvsyuZutGKxyPqPFjIoJQxR0FqYfM17ew9DeHbz6LbOL7W658w18WMXRE8/3UQoHOZuFkTU5POKI9MvsnvpS2T2iZG7ejicn5Ud0v04Z78qrPXH2dOIv1MsaxmeOqpdAXqXnVevvLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emG2uGWw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEA7C4CEE7;
	Tue, 14 Oct 2025 10:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760436416;
	bh=vlKsjF/WzeVNZJtjW7yz45GlPnNggzp2rEQRTt+qMx8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=emG2uGWwq7WOFnuNE32MS8Keoa4CA6KbIjZqesYktef4aX6Mo0CONPCRuEnv76kN1
	 f4hF6/CT6kPvF2sUyfMQZMx8eKIS1cVMEsFSgmpSVS7k4VNJnSfmrz2Dv2Dru0tkDD
	 b+DuY49KkTw4lTpFdwkRZtxCFCulKiJWX5GnH+2v2RF5Qt3LHkq2R8FL6sJ4reS7DY
	 fBBQodxVpdHJs7/gqDYw5fFy4w6rrEOplf2jFTSW3Jy6TJgwiSRwLLEYZnVCfTeywn
	 NqISKPRJe2hPHOAnPGiuDyV5JUdv/itXlFVZ46Z6l/7hU8PTUTPrt2DxQ5cs0Eb0ha
	 uClTwYNpBTtSg==
Message-ID: <1a6e25c6-820e-4610-80bb-518edca18bd5@kernel.org>
Date: Tue, 14 Oct 2025 12:06:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 RESEND] media: as102: fix to not free memory after the
 device is registered in as102_usb_probe()
To: Jeongjun Park <aha310510@gmail.com>, mchehab@kernel.org,
 khoroshilov@ispras.ru
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, syzbot+47321e8fd5a4c84088db@syzkaller.appspotmail.com
References: <20250904054629.3849431-1-aha310510@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20250904054629.3849431-1-aha310510@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2025 07:46, Jeongjun Park wrote:
> In as102_usb driver, the following race condition occurs:
> ```
> 		CPU0						CPU1
> as102_usb_probe()
>   kzalloc(); // alloc as102_dev_t
>   ....
>   usb_register_dev();
> 						open("/path/to/dev"); // open as102 dev
> 						....
>   usb_deregister_dev();
>   ....
>   kfree(); // free as102_dev_t
>   ....
> 						close(fd);
> 						  as102_release() // UAF!!
> 						    as102_usb_release()
> 						      kfree(); // DFB!!
> ```
> 
> When a USB character device registered with usb_register_dev() is later
> unregistered (via usb_deregister_dev() or disconnect), the device node is
> removed so new open() calls fail. However, file descriptors that are
> already open do not go away immediately: they remain valid until the last
> reference is dropped and the driver's .release() is invoked.
> 
> In as102, as102_usb_probe() calls usb_register_dev() and then, on an
> error path, does usb_deregister_dev() and frees as102_dev_t right away.
> If userspace raced a successful open() before the deregistration, that
> open FD will later hit as102_release() --> as102_usb_release() and access
> or free as102_dev_t again, occur a race to use-after-free and
> double-free vuln.
> 
> The fix is to never kfree(as102_dev_t) directly once usb_register_dev()
> has succeeded. After deregistration, defer freeing memory to .release().
> 
> In other words, let release() perform the last kfree when the final open
> FD is closed.
> 
> Cc: <stable@vger.kernel.org>
> Reported-by: syzbot+47321e8fd5a4c84088db@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=47321e8fd5a4c84088db
> Fixes: cd19f7d3e39b ("[media] as102: fix leaks at failure paths in as102_usb_probe()")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
> v2: Fix incorrect patch description style and CC stable mailing list
> - Link to v1: https://lore.kernel.org/all/20250822143539.1157329-1-aha310510@gmail.com/
> ---
>  drivers/media/usb/as102/as102_usb_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/usb/as102/as102_usb_drv.c b/drivers/media/usb/as102/as102_usb_drv.c
> index e0ef66a522e2..abde5666b2ee 100644
> --- a/drivers/media/usb/as102/as102_usb_drv.c
> +++ b/drivers/media/usb/as102/as102_usb_drv.c
> @@ -404,6 +404,7 @@ static int as102_usb_probe(struct usb_interface *intf,
>  	as102_free_usb_stream_buffer(as102_dev);
>  failed_stream:
>  	usb_deregister_dev(intf, &as102_usb_class_driver);
> +	return ret;

Here too I wonder if the memory is actually freed. I suspect a usb_put_intf()
is needed. I'm not a USB expert, though. But you should check if you didn't
replace a UAF by a memory leak.

Regards,

	Hans

>  failed:
>  	usb_put_dev(as102_dev->bus_adap.usb_dev);
>  	usb_set_intfdata(intf, NULL);
> --
> 


