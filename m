Return-Path: <linux-media+bounces-44386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9384DBD8988
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 11:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE7C6543F63
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 09:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D1A2ECE8A;
	Tue, 14 Oct 2025 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzlsX3EB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98552EA464;
	Tue, 14 Oct 2025 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435510; cv=none; b=Y6TFZ4nir22F9CwgaZLM/f/Rx6tuGrjOgdtg0fpkyslc6sq+SASf5jQWCjaSpbiUa1/xXvBjE2/Wn6g3h+x/p7pIq/XXBu3SUJEn13Ikh4IfFttu5o0VldcuE4teWexMvWfiGHshzRGUY6+x1AH6shFjQQW1sQ51YJ1/JGpb3jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435510; c=relaxed/simple;
	bh=WqW5ZbUmABmzx1qaIZI77c81KCOJrnUC11x+N+bX780=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lqupn1KoPdLforn6mjI4V4YdJ6IXohIKrH751DK9pWnoufFp04MsCK4ZA8ZdUEpGdMOflitI2k0dU2e5mgTeLiNAkgHG40UW3jssCRxVgtaRxlcKGRxoSf7V5wB6aRxQgahNpVzkrksqyRtEjCRawpLndyyqr4189jZ9kKG7yk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzlsX3EB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAFEC4CEE7;
	Tue, 14 Oct 2025 09:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435509;
	bh=WqW5ZbUmABmzx1qaIZI77c81KCOJrnUC11x+N+bX780=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=WzlsX3EB+aY7QkdPLCjs0OjWUaQ9Xzbb/RCHrJ6usJdqe8nxX4j2dnJNhQmIogf8J
	 SEEZXbhiZP/ECyE8ZKvaJkUdoyEVkkAg+r8h6tsVje5jKlzRhvO9f0x7uJGGgBXOVS
	 F5CW7/+shHPOV/7YjyXIQheKeU8nmauAm1Q0clD0TEv8hrdxGVv80eFKNqFsPekGf9
	 uWv8f6xC0O4LlOBhjVA90USRuArWlmVa7MnXUXqMKJz168dGuX7UMOBUHUtC05AE4u
	 VxT1z8YRmYXgcCUOG0HsAOade3xRu+GiKFIjYud4dVZIbic0GOnUxtsIttReo8FtGG
	 xComsdIi+Fz3g==
Message-ID: <aa78a288-0a1e-4851-a2a5-4378e96da305@kernel.org>
Date: Tue, 14 Oct 2025 11:51:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 RESEND] media: hackrf: fix to not free memory after the
 device is registered in hackrf_probe()
To: Jeongjun Park <aha310510@gmail.com>, mchehab@kernel.org,
 hverkuil@kernel.org
Cc: laurent.pinchart+renesas@ideasonboard.com, crope@iki.fi,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 syzbot+6ffd76b5405c006a46b7@syzkaller.appspotmail.com,
 syzbot+f1b20958f93d2d250727@syzkaller.appspotmail.com
References: <20250904054232.3848637-1-aha310510@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20250904054232.3848637-1-aha310510@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jeongjun Park,

On 04/09/2025 07:42, Jeongjun Park wrote:
> In hackrf driver, the following race condition occurs:
> ```
> 		CPU0						CPU1
> hackrf_probe()
>   kzalloc(); // alloc hackrf_dev
>   ....
>   v4l2_device_register();
>   ....
> 						open("/path/to/dev"); // open hackrf dev
> 						....
>   v4l2_device_unregister();
>   ....
>   kfree(); // free hackrf_dev
>   ....
> 						ioctl(fd, ...);
> 						  v4l2_ioctl();
> 						    video_is_registered() // UAF!!
> 						....
> 						close(fd);
> 						  v4l2_release() // UAF!!
> 						    hackrf_video_release()
> 						      kfree(); // DFB!!
> ```
> 
> When a V4L2 or video device is unregistered, the device node is removed so
> new open() calls are blocked.
> 
> However, file descriptors that are already open-and any in-flight I/O-do
> not terminate immediately; they remain valid until the last reference is
> dropped and the driver's release() is invoked.
> 
> Therefore, freeing device memory on the error path after hackrf_probe()
> has registered dev it will lead to a race to use-after-free vuln, since
> those already-open handles haven't been released yet.
> 
> And since release() free memory too, race to use-after-free and 
> double-free vuln occur.
> 
> To prevent this, if device is registered from probe(), it should be
> modified to free memory only through release() rather than calling
> kfree() directly.
> 
> Cc: <stable@vger.kernel.org>
> Reported-by: syzbot+6ffd76b5405c006a46b7@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=6ffd76b5405c006a46b7
> Reported-by: syzbot+f1b20958f93d2d250727@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=f1b20958f93d2d250727
> Fixes: 8bc4a9ed8504 ("[media] hackrf: add support for transmitter")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
> v2: Fix incorrect patch description style and CC stable mailing list
> - Link to v1: https://lore.kernel.org/all/20250822142729.1156816-1-aha310510@gmail.com/
> ---
>  drivers/media/usb/hackrf/hackrf.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
> index 0b50de8775a3..d7a84422193d 100644
> --- a/drivers/media/usb/hackrf/hackrf.c
> +++ b/drivers/media/usb/hackrf/hackrf.c
> @@ -1515,6 +1515,8 @@ static int hackrf_probe(struct usb_interface *intf,
>  	video_unregister_device(&dev->rx_vdev);
>  err_v4l2_device_unregister:
>  	v4l2_device_unregister(&dev->v4l2_dev);

Instead of v4l2_device_unregister() this should call v4l2_device_put().
Otherwise the memory will never be freed since the v4l2_device refcount
will never reach 0.

> +	dev_dbg(&intf->dev, "failed=%d\n", ret);

Drop this line, it doesn't add anything.

Regards,

	Hans

> +	return ret;
>  err_v4l2_ctrl_handler_free_tx:
>  	v4l2_ctrl_handler_free(&dev->tx_ctrl_handler);
>  err_v4l2_ctrl_handler_free_rx:
> --
> 


