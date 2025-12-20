Return-Path: <linux-media+bounces-49248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56948CD3677
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 21:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43E83300909F
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 20:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAB33112C9;
	Sat, 20 Dec 2025 20:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1152-bit key) header.d=isely.net header.i=@isely.net header.b="B9AVZwPN"
X-Original-To: linux-media@vger.kernel.org
Received: from cnc.isely.net (cnc.isely.net [192.69.181.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32F922154B;
	Sat, 20 Dec 2025 20:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.69.181.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766261349; cv=none; b=UPSrrpELkFiDYmwlcZo2ADNYdoVfiFl/PGFImLhCF/wJ2tGEWnEOz9Y2ktxh72tBgI/v0q+XW4QP11xYaIwK6dZ+aNRS51MawOggT0/GJSwU9aGacsHzPBt5I4b+n1fUbjTbfhi7D1y4BJxymYDdoCHA0kYussnVE57RiMEtlg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766261349; c=relaxed/simple;
	bh=T4KFAEvqs11SxpvrRaApQdjw7urAPabrNB7VX1ydqog=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Mime-Version:Content-Type; b=NkTxWDGZ9prRd0hz5jsEuabq6nMJ/egnBunppUQTXRu6XUUCi0FXDZ4YSWGyxx9AbNBmZ0sPwt31H0bryUyIZnkMEOrEo/MmCCcVZKOsoI1SbLhBNu9Mqy6rpuK3zBRA5xjeLFqBn/lDSOKq8EG1uvBf3o1k6JyJHGcgIBLAeww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isely.net; spf=pass smtp.mailfrom=isely.net; dkim=pass (1152-bit key) header.d=isely.net header.i=@isely.net header.b=B9AVZwPN; arc=none smtp.client-ip=192.69.181.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isely.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isely.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=isely.net; s=deb;
	t=1766261037; bh=99l8ZrUvDSSzN1qGiW1mZqwm3hYNNlPDtNukwZJBmcY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=B9AVZwPN1ipKV8N1MiDKX0Wr7j4+4XYETkKTb7jn9QRPhbQm+UDUeMxo/jyx69vGT
	 gbybLngxYIu2UkfOqVA+KPVFx/G/p602gKeXYIQw18dd09V8LoTSpOWKUobAq1FUul
	 TRbsuOrwA2JXiqRb+3Nk+KwJ4Y7tJtG+iQx5+l/M6Lgxbv5HWl4I4Gt7dnjgn
Original-Subject: Re: [PATCH] media: pvrusb2: fix URB leak in pvr2_send_request_ex
Author: Mike Isely <isely@isely.net>
Original-cc: mchehab@kernel.org, linux-media@vger.kernel.org,
  Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
  syzkaller-bugs@googlegroups.com,
  syzbot+405dcd13121ff75a9e16@syzkaller.appspotmail.com,
  Mike Isely at pobox <isely@pobox.com>
Received: from sheridan.isely.net (sheridan.isely.net [::ffff:192.168.24.5])
  (AUTH: PLAIN isely, TLS: TLS1.3,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
  by cnc.isely.net with ESMTPSA
  id 00000000000A0010.000000006947012C.00006577; Sat, 20 Dec 2025 14:03:56 -0600
Date: Sat, 20 Dec 2025 14:03:56 -0600 (CST)
From: Mike Isely <isely@isely.net>
To: Szymon Wilczek <szymonwilczek@gmx.com>
cc: mchehab@kernel.org, linux-media@vger.kernel.org,
  Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
  syzkaller-bugs@googlegroups.com,
  syzbot+405dcd13121ff75a9e16@syzkaller.appspotmail.com,
  Mike Isely at pobox <isely@pobox.com>
Subject: Re: [PATCH] media: pvrusb2: fix URB leak in pvr2_send_request_ex
In-Reply-To: <20251220182419.390675-1-szymonwilczek@gmx.com>
Message-ID: <c3ced43d-ca75-b4eb-96d2-9629f6e1f112@isely.net>
References: <20251220182419.390675-1-szymonwilczek@gmx.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Acked-By: Mike Isely <isely@pobox.com>

On Sat, 20 Dec 2025, Szymon Wilczek wrote:

> When pvr2_send_request_ex() submits a write URB successfully but fails to submit the read URB (e.g. returns -ENOMEM), it returns immediately without waiting for the write URB to complete. Since the driver reuses the same URB structure, a subsequent call to pvr2_send_request_ex() attempts to submit the still-active write URB, triggering a 'URB submitted while active' warning in usb_submit_urb().
> 
> Fix this by ensuring the write URB is unlinked and waited upon if the read URB submission fails.
> 
> Reported-by: syzbot+405dcd13121ff75a9e16@syzkaller.appspotmail.com
> 
> Closes: https://syzkaller.appspot.com/bug?extid=405dcd13121ff75a9e16
> Signed-off-by: Szymon Wilczek <szymonwilczek@gmx.com>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> index b32bb906a9de..5807734ae26c 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> @@ -3709,6 +3709,11 @@ status);
>  				   "Failed to submit read-control URB status=%d",
>  status);
>  			hdw->ctl_read_pend_flag = 0;
> +			if (hdw->ctl_write_pend_flag) {
> +				usb_unlink_urb(hdw->ctl_write_urb);
> +				while (hdw->ctl_write_pend_flag)
> +					wait_for_completion(&hdw->ctl_done);
> +			}
>  			goto done;
>  		}
>  	}
> 

