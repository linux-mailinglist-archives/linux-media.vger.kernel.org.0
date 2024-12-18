Return-Path: <linux-media+bounces-23743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4BA9F70C1
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1949316DEFA
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BAF1FCFFE;
	Wed, 18 Dec 2024 23:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LgcWtWQr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028221991B8;
	Wed, 18 Dec 2024 23:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734564416; cv=none; b=HW04u4oc3JKt8wG214zOngWqhSyJgvhQ6mN7EjYx22bfckxFT8Py9DTmpmhlMsb+12G1owpR0t5ms0GerCZ9ckn2orIT+YuWETS8WzL/BIJvH3KLCTV8V7j+UpkwaQAoqauzaxU9lMtvhgSj0Gd4o94mnDirKQ7ex4TWswzo1OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734564416; c=relaxed/simple;
	bh=dcpiKoLjvWDP86Pgkaf7/AV0ygEtdSDxh1L12+6f5V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2aO/YAVYI3A6jcPZwlyNjbi1eouiSGUUQYRUcf0wWyBLf2TA5t0EMgvfmFZKmy6AKldBJtdlWeOGoVZcAso/L4GpowKjeWPVup/xjY1iD708wAXR+UR2nj1CVDYfn1VX/Dnk+uFXty3Oc/vJOam55ndhbKKrzEPsnjzcS4t2q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LgcWtWQr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 246B6163;
	Thu, 19 Dec 2024 00:26:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734564375;
	bh=dcpiKoLjvWDP86Pgkaf7/AV0ygEtdSDxh1L12+6f5V0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LgcWtWQrpUlQGzwlKw7cVq6svrnAKkEBpT/PPBR5aYVqqsIlM5CVsTiua5vlR2No2
	 qmR+l7tw4BQLCkTGagRGkAA+JJS1gb1s6CgGnR4NRsUAXmeQpXisi4rhZPnVRHX6XS
	 EXH9t2SXY8RBcJ3QJyjqxNaWiB03WrIQcZVmcgMY=
Date: Thu, 19 Dec 2024 01:26:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: uvcvideo: Propagate buf->error to userspace
Message-ID: <20241218232650.GA5518@pendragon.ideasonboard.com>
References: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
 <20241218-uvc-deprecate-v2-1-ab814139e983@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-uvc-deprecate-v2-1-ab814139e983@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Wed, Dec 18, 2024 at 09:39:08PM +0000, Ricardo Ribalda wrote:
> Now we return VB2_BUF_STATE_DONE for valid and invalid frames. Propagate
> the correct value, so the user can know if the frame is valid or not via
> struct v4l2_buffer->flags.
> 
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Closes: https://lore.kernel.org/linux-media/84b0f212-cd88-46bb-8e6f-b94ec3eccba6@redhat.com
> Fixes: 6998b6fb4b1c ("[media] uvcvideo: Use videobuf2-vmalloc")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_queue.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 26ee85657fc8..f8464f0aae1b 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -479,7 +479,8 @@ static void uvc_queue_buffer_complete(struct kref *ref)
>  
>  	buf->state = buf->error ? UVC_BUF_STATE_ERROR : UVC_BUF_STATE_DONE;
>  	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, buf->bytesused);
> -	vb2_buffer_done(&buf->buf.vb2_buf, VB2_BUF_STATE_DONE);
> +	vb2_buffer_done(&buf->buf.vb2_buf, buf->error ? VB2_BUF_STATE_ERROR :
> +							VB2_BUF_STATE_DONE);
>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart

