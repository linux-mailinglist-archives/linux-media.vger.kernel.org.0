Return-Path: <linux-media+bounces-46192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 484ACC2B063
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 11:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0813C3B3A29
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 10:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544862FCC10;
	Mon,  3 Nov 2025 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jy49iS8p"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BC228E5
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 10:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762165437; cv=none; b=J/GHYLcaEYPflwycbVniieRndM7tAi3RwlQYaWFxPTfOY9cuH2kcnGa7S2ZABQPTgCkPhlZUpebsvPCHdu+KbuwLTNSJlZ8otUBkPr5iPK9QzLgAB5WWvy+e1HLbBm3gJEIJnaKQGFSojjItqQDYJrqHWYsWcl0Lt7z/hVht5eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762165437; c=relaxed/simple;
	bh=ugn+vGIRYW50OgaGIEESu5bvCwCsBoecFf8+YyB4uGA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QU5UrdcLp6Jl890gtthxAHzZJdmDKgvKF8P9nKotlfKc7FDkoyxi9CyYFoST8QtYzJ5AFe7Q4Ba0Kncc+l0HVFPYcMFNFZ8Z8itLtOX4yH8IhxXomJzPAJ66qLlF4H/g75zLH26AYHpVro4wTLgb31Tt/KWwixGUMsx3pOs8oJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jy49iS8p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB91C4CEE7;
	Mon,  3 Nov 2025 10:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762165437;
	bh=ugn+vGIRYW50OgaGIEESu5bvCwCsBoecFf8+YyB4uGA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=jy49iS8pRZ3lq0qLgtp4fs9FQTkyfAYPfOQsLY0lzbJFXtyj3f4fMDqvNCTnQYN2m
	 QIsKuSkT8DVsI6vWdJXqjefPPdQzhqfXyD0r0tEYJHQwaCjscwIkLnIVOJR3Iu2ZfS
	 7yx225aJRIi+OsvKfhYZTuwDOwWlkF1Qa3xjHUT1q+oXwKVXDtFFHAXZnj7hHRtkn6
	 4v2FDWK63mlEcEH/+NX3BMR6/0puJ6TB+Mu7f6vD9GaJi9QKzh4UQQnL4x07hTZMML
	 2aT5S5E3NRLF69lXmzJwAEtjh7sytDL2EQbIVk8DAbU+dbdzeN1psN5WyQd6ySxPts
	 rOkUspNeoMVLw==
Message-ID: <77522908-59f2-4d4c-9184-7441d1803d0f@kernel.org>
Date: Mon, 3 Nov 2025 11:23:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: usb: as102: reset file private data on device
 release
To: Dmitry Antipov <dmantipov@yandex.ru>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
References: <20250507111808.546803-1-dmantipov@yandex.ru>
Content-Language: en-US, nl
In-Reply-To: <20250507111808.546803-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/05/2025 13:18, Dmitry Antipov wrote:
> In case of successful 'as102_open()', store 'struct file' pointer
> in 'struct as102_dev_t' data to ensure that file's private data
> is reset to NULL after device removal via 'as102_usb_release()'.
> Leaving private data dangling may be the reason of things like
> https://syzkaller.appspot.com/bug?extid=47321e8fd5a4c84088db.
> Since there is no reproducer, mark this as compile tested only.
> 
> Fixes: 41b44e041811 ("[media] staging: as102: Initial import from Abilis")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  drivers/media/usb/as102/as102_drv.h     | 3 +++
>  drivers/media/usb/as102/as102_usb_drv.c | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/media/usb/as102/as102_drv.h b/drivers/media/usb/as102/as102_drv.h
> index 4342c7ce3407..037795dd955f 100644
> --- a/drivers/media/usb/as102/as102_drv.h
> +++ b/drivers/media/usb/as102/as102_drv.h
> @@ -61,6 +61,9 @@ struct as102_dev_t {
>  	/* timer handle to trig ts stream download */
>  	struct timer_list timer_handle;
>  
> +	/* used to reset private data on device release */
> +	struct file *file;
> +
>  	struct mutex sem;
>  	dma_addr_t dma_addr;
>  	void *stream;
> diff --git a/drivers/media/usb/as102/as102_usb_drv.c b/drivers/media/usb/as102/as102_usb_drv.c
> index e0ef66a522e2..c1b8eb1d055a 100644
> --- a/drivers/media/usb/as102/as102_usb_drv.c
> +++ b/drivers/media/usb/as102/as102_usb_drv.c
> @@ -304,6 +304,8 @@ static void as102_usb_release(struct kref *kref)
>  
>  	as102_dev = container_of(kref, struct as102_dev_t, kref);
>  	usb_put_dev(as102_dev->bus_adap.usb_dev);
> +	if (as102_dev->file)
> +		as102_dev->file->private_data = NULL;
>  	kfree(as102_dev);
>  }
>  
> @@ -439,6 +441,9 @@ static int as102_open(struct inode *inode, struct file *file)
>  	/* save our device object in the file's private structure */
>  	file->private_data = dev;
>  
> +	/* save file's pointer to reset private data on release */
> +	dev->file = file;
> +
>  	/* increment our usage count for the device */
>  	kref_get(&dev->kref);
>  

Eww :-)

That's just - at best - fixing the symptom, not the cause.

This approach looks more promising:

https://patchwork.linuxtv.org/project/linux-media/patch/20250904054629.3849431-1-aha310510@gmail.com/

Regards,

	Hans

