Return-Path: <linux-media+bounces-49270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B672CD480A
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 01:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FE20300BB81
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 00:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F3D221FBD;
	Mon, 22 Dec 2025 00:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EXaALl+A"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D80B20C463;
	Mon, 22 Dec 2025 00:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766365025; cv=none; b=Cqh9qWW5NscPsUNOiRWBAxwKdCKDz1A7V4jDICYlSrQWv/1FieaAPQASYoGAzHW/rxZ1UvdQR8NlUoyB1q4rqKsd4i5UOlf7098kq6gKw09UcdQ7iuVqF9Ae40YbEytR6pOh3Xeotf2q08DR8gLReli8/WWta9zXf2oR5UZ1mfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766365025; c=relaxed/simple;
	bh=e+1gkkmgWXlqIQp2lPg0EH/6EU5DAV3oSZXYzOHDEto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTjXnNNIFISH2cnho2RCuC7td3begV/Kk6/JzAk1XEkWsPPp/JRVd/CPudmoAuHMj5eI0FC/DjwL0EwS5hxnrFaDEXPbfeIiiq3hZ07m2rVPDffA4uFw7EeeA8vXHjXXvI9k0BARUHiLLHWEFsz8zT1ODsH9HdL9IjQDvH7nwpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EXaALl+A; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 04BB1593;
	Mon, 22 Dec 2025 01:56:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766365004;
	bh=e+1gkkmgWXlqIQp2lPg0EH/6EU5DAV3oSZXYzOHDEto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXaALl+Am5QlFFD6ZkerUHAmMxfNwsc1fyWU1L34WAS7muSTMAXAoRHXU6QZhilML
	 Ho2ZcpKmgMHi4Yf0qOIvg5gWB0bCWelGdtGKRZdHRSRPlUbX54+mzfDgv6p7MOCqvb
	 Fs7cH7AIJuNpY3qSEIK5JwvAzsrkD/Jr+0lfg9uU=
Date: Mon, 22 Dec 2025 02:56:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 4/6] media: uvcvideo: Document how to format GUIDs
Message-ID: <20251222005634.GA5317@pendragon.ideasonboard.com>
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-4-0359ffb98c9e@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119-uvcdynctrl-v2-4-0359ffb98c9e@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Wed, Nov 19, 2025 at 07:37:13PM +0000, Ricardo Ribalda wrote:
> Manual formatting the GUIDs can lead to errors, document a
> programmatically way to format the GUIDs from lsusb into something tha

s/tha/that/

> the driver can use.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  include/linux/usb/uvc.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index b939a01da11466747249c64c72a3ea40cd364a59..dea23aabbad48270c807463c1a7e1c0d1b79fc1f 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -10,6 +10,14 @@
>  
>  /* ------------------------------------------------------------------------
>   * GUIDs
> + *
> + * The GUID returned by lsusb can be converted to this format with the
> + * following python snippet:
> + *
> + * import uuid
> + * id = "{01234567-89ab-cdef-0123-456789abcdef}"
> + * le = uuid.UUID(id).bytes_le
> + * print("{" + ", ".join([f"0x{b:02x}" for b in le]) + "}")

Note that lsusb has changed the endianness of the printed GUID at some
point :-/ That was in 2017 though, so I think we can ignore the issue
now.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>   */
>  #define UVC_GUID_UVC_CAMERA \
>  	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \

-- 
Regards,

Laurent Pinchart

