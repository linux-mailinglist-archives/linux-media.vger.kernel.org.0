Return-Path: <linux-media+bounces-48394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD42BCACF9D
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 12:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8C9D3049D38
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 11:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9ED731352F;
	Mon,  8 Dec 2025 11:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tj+lQZy8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B192EA730;
	Mon,  8 Dec 2025 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765192784; cv=none; b=c3is4pBCxf9+HCRzsUAgsuo1PyCDXCVNiJzn73K0CcOlP+65khcLNWX0kSC7Lf9n7CdrYiGIL1Lgf7x+VFgDi2JWlvOBnzKp4im1TEuH4169Q8lsp8aCaDHbowitARLWd/IkZGNrzHsm9gyaetinIz89J2/JUoyDNNmVZbt4eeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765192784; c=relaxed/simple;
	bh=ouM4nqEOH1mPEBEmwmybUs/1AZY+VQRDjo8H3w870tE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxZhbVbHvBAsB91NCHDt31ixOrf8SyRRbwIocZy+D7tYqd8v8qGSRfa0jjM1mUOz98BMA/DZ+2EeFOpjYUNA6F5RqgogDkymMkZTUpjazN8d3rLSGX+ubh5NCmJhfFHU9YAr8fISCiV9QnMBv4/vdZSfg1ar6ebjPQrXuO+Qthc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tj+lQZy8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C830C4CEF1;
	Mon,  8 Dec 2025 11:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765192783;
	bh=ouM4nqEOH1mPEBEmwmybUs/1AZY+VQRDjo8H3w870tE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tj+lQZy8byWE4C1qodH5yqjakB3iPp/4Lz2ysXBdxktT/dEcxDznoWaFtFMa5BHpA
	 yE5AbBrFtIun9Cs25mrgWlNMhU+Bkt3KOSmgiLiKgw1zxVttpQJ1TrvCBBt1lHJo5E
	 RsG1WXVBZAmmalnYBhQj0qRzA1m5AKzu8DcvFyyt52NlB5NDolzRfMmdSWl3huPJLt
	 IVpn1RwLVxR2sgIspkhExrt6I6tcZL7M+pZ3NUiWgX8IR0eZ9HQF3pbDCYYqacB30x
	 lHjT/F/0kHvlOuSrony33pyeEXzvdkik8KhjmiIUSoOQcsB0xazdDEiukVgOq56IvZ
	 4htq/JNPh8atA==
Message-ID: <93931a19-43a5-411b-9f81-60da07a8229b@kernel.org>
Date: Mon, 8 Dec 2025 12:19:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] media: uvcvideo: Document how to format GUIDs
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-4-0359ffb98c9e@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20251119-uvcdynctrl-v2-4-0359ffb98c9e@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
> Manual formatting the GUIDs can lead to errors, document a
> programmatically way to format the GUIDs from lsusb into something tha
> the driver can use.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Since this is independent of the rest of the series I've merged this into my local
uvc/for-next branch which I will push out later today.

Regards,

Hans



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
>   */
>  #define UVC_GUID_UVC_CAMERA \
>  	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> 


