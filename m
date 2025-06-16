Return-Path: <linux-media+bounces-34936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3993ADB353
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58026171636
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9AB1E833D;
	Mon, 16 Jun 2025 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGDkef+o"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ECF1F5433;
	Mon, 16 Jun 2025 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083333; cv=none; b=IPYxxQP+sIXFloIeqn7o8GzvEDnr7ABDjOsmRkLTz3n3Fb0gmSt8ZspaFBNi2MZHtV8v1M6zoi5LLgl8q3dUPITYvV6Ph2ZaFnML3qUsCu13/co3yRuj9irwqwgHKnag1yjZVicNbb8X/Jho2vOTWXa9ftXX3IXqyFCbnpR60bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083333; c=relaxed/simple;
	bh=/3CJgSOwPdPo826UIeavKPgGS4HiPBzDsjcDffcRgxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcnFYYaBGw2VdGSGXaoZcHUfPBpwZmsqg/3sm1vSKE7Ko1ngvWpCFDslWTcYnbn5dmvnrFgNKQJno61vfn18xfScyHscgkPOyVLHOPZXf71FIPkKOFtDiYkfsf8mJk0zt+XNvKEHmM60ecZqCi5c2TpPUDfaDA/TnxjtxmIHkMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGDkef+o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFF6C4CEEA;
	Mon, 16 Jun 2025 14:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750083333;
	bh=/3CJgSOwPdPo826UIeavKPgGS4HiPBzDsjcDffcRgxM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SGDkef+o8vbJ5sRYuUxN2ujmAZwdy7ufZAZbz4u18f/I3Tuy9hNKsoevuQ48AkM2c
	 t41AeA/avmUT0l0DBpVvm99fbzh5nCi5ugY8KKb3OH0oR43eHvCVfS36akAMGUhCTJ
	 g3pFuvX6IesVQ3BLuC0Apn98rwgxCGey47T2XWDPfL7VYmdABIn/jR883Xi/FKi5Ac
	 GBPDWVUN0bMMSKWKQEAtAuDw3SyElrQb76gtGhpCs1iDDypSlzlISKm343AZxGBfmA
	 E/iInd4gsKOJlvr81HHw7PwGOCrG+3n4Q8JA11j4Yaglsn7kwVf5rv+xCkzHaKnYWq
	 GdamraQue8f2g==
Message-ID: <a059f615-8afe-4e9b-8b03-b3fcdf0b0b0a@kernel.org>
Date: Mon, 16 Jun 2025 16:15:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] media: uvcvideo: Support granular power saving for
 compat syscalls
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
 <20250602-uvc-grannular-invert-v2-9-c871934ad880@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-9-c871934ad880@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 2-Jun-25 15:06, Ricardo Ribalda wrote:
> Right now we cannot support granular power saving on compat syscalls
> because the VIDIOC_*32 NRs defines are not accessible to drivers.
> 
> Use the v4l2_compat_translate_cmd  helper to convert the compat syscall
> NRs into syscall NRs.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 13388879091c46ff74582226146521b5b5eb3d10..8358ca54b248dd1cf7c984b206b8e550cd883e54 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1237,15 +1237,13 @@ static long uvc_v4l2_pm_ioctl(struct file *file,
>  static long uvc_v4l2_unlocked_ioctl(struct file *file,
>  				    unsigned int cmd, unsigned long arg)
>  {
> -	/*
> -	 * For now, we do not support granular power saving for compat
> -	 * syscalls.
> -	 */
> +	unsigned int converted_cmd = cmd;
> +
>  	if (in_compat_syscall())
> -		return uvc_v4l2_pm_ioctl(file, cmd, arg);
> +		converted_cmd = v4l2_compat_translate_cmd(cmd);
>  
>  	/* The following IOCTLs do need to turn on the camera. */
> -	switch (cmd) {
> +	switch (converted_cmd) {
>  	case UVCIOC_CTRL_QUERY:
>  	case VIDIOC_G_CTRL:
>  	case VIDIOC_G_EXT_CTRLS:
> 


