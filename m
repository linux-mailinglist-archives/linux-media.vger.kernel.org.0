Return-Path: <linux-media+bounces-20780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BBF9BB08E
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 11:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F8071F21239
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 10:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAFD1AF4EE;
	Mon,  4 Nov 2024 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8IcbD3Q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C7F18A6B8;
	Mon,  4 Nov 2024 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714758; cv=none; b=NFghqmNJOKbS3jHnuKGmOcu2vqVKd29OAe3k+/qN5xbHPKkq+qJNbc5Zr7inMLZ/5rNS1s9k4PpjQ0YENSSpICh2wWDg4DqU416bda3GqCqbZ6OVug/8gprKAC/msuz3MwxK+EMszbA6g900aTHkUWfCw3qo4ZQC3RoToEzpb3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714758; c=relaxed/simple;
	bh=5MIEWgB4I6OC90+CJprE+MC0xoMEunPNrpjOBzrQAzc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FhOvGk9AbOPl39GKyGe8QST24o9CUgDHSKvVnzS9ffJQZDkEAnoHT/IKhxG/j08n6KtVxMXZD1FzJ83EHkbRNfwky94VJ3QoxtoQ59rSAlnuLLl+RZHzXQ6oPDYciRS8xc0EhMK1MP7eP+g4o90IVwpkQrlSUwfrz/7rqRQX2QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8IcbD3Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B393AC4CECE;
	Mon,  4 Nov 2024 10:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730714758;
	bh=5MIEWgB4I6OC90+CJprE+MC0xoMEunPNrpjOBzrQAzc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=G8IcbD3QH++aJOipB2D1nzinJpptVHVgmgxuayuxv6TpGu/cQYdspqda2/VK7F9EF
	 QXsIG+GeMo2ra8TWz05+uFPfLMLZq0S3SC1hN2+DclXxYcEjyT+TlH6LuWuzSGqTnn
	 9aaQ748P4NzD24ih/iif+cns8Fm3oB+sRgtI+QF513thGkZpkeG37UHujk3BMyRTCu
	 YyCNJLY3HS1VZzB02zRab0p5v1jJ4RJGkMUjNMWJaMol2JvGe5yFFoeOExoCtstU8F
	 yUd05H7TaVffalaWAQggek2LCpjgv8iY2WQb0K5GguD4HOIUHt5fw9iHwSDNtvkLOA
	 7Rbng2pOsvJKQ==
Date: Mon, 4 Nov 2024 11:05:53 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: chenchangcheng <ccc194101@163.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo:Create input device for all uvc devices
 with status endpoints.
Message-ID: <20241104110553.6687a58e@foz.lan>
In-Reply-To: <20241104023947.826707-1-ccc194101@163.com>
References: <20241104023947.826707-1-ccc194101@163.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon,  4 Nov 2024 10:39:47 +0800
chenchangcheng <ccc194101@163.com> escreveu:

> Some applications need to check if there is an input device on the camera
> before proceeding to the next step. When there is no input device,
> the application will report an error.

Nack.

It is not mandatory for V4L2 devices to create input devices.

It sounds to me that this is an application bug, not a Kernel one.
What applications have such bug?

> Create input device for all uvc devices with status endpoints.
> and only when bTriggerSupport and bTriggerUsage are one are
> allowed to report camera button.

Please fix the application instead.

> 
> Fixes: 3bc22dc66a4f ("media: uvcvideo: Only create input devs if hw supports it")

Regards,
Mauro

> Signed-off-by: chenchangcheng <ccc194101@163.com>
> ---
>  drivers/media/usb/uvc/uvc_status.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index a78a88c710e2..177640c6a813 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -44,9 +44,6 @@ static int uvc_input_init(struct uvc_device *dev)
>  	struct input_dev *input;
>  	int ret;
>  
> -	if (!uvc_input_has_button(dev))
> -		return 0;
> -


>  	input = input_allocate_device();
>  	if (input == NULL)
>  		return -ENOMEM;
> @@ -110,10 +107,12 @@ static void uvc_event_streaming(struct uvc_device *dev,
>  		if (len <= offsetof(struct uvc_status, streaming))
>  			return;
>  
> -		uvc_dbg(dev, STATUS, "Button (intf %u) %s len %d\n",
> -			status->bOriginator,
> -			status->streaming.button ? "pressed" : "released", len);
> -		uvc_input_report_key(dev, KEY_CAMERA, status->streaming.button);
> +		if (uvc_input_has_button(dev)) {
> +			uvc_dbg(dev, STATUS, "Button (intf %u) %s len %d\n",
> +				status->bOriginator,
> +				status->streaming.button ? "pressed" : "released", len);
> +			uvc_input_report_key(dev, KEY_CAMERA, status->streaming.button);
> +		}
>  	} else {
>  		uvc_dbg(dev, STATUS, "Stream %u error event %02x len %d\n",
>  			status->bOriginator, status->bEvent, len);



Thanks,
Mauro

