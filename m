Return-Path: <linux-media+bounces-38180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FDEB0C799
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 17:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDF2A7AB9D8
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 15:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5182DF3EC;
	Mon, 21 Jul 2025 15:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeooeime"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FFF2D9ED9
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111717; cv=none; b=jM65yGu2y0Bj7L4V+WkWTXFvi4l7dP6IFbJD4y8lyznppW0djJV0mJHKjr/FnZP38KBT1I+j4g1b1kaY8q7nmHhKiblVg8GTwSQkKXzMz1soRMDuAM8HpfarOXI++hkSYGRhPKW+A8vEGAbYh5AP7MBCkBfsbJz3gAz2IjXRS7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111717; c=relaxed/simple;
	bh=8sFbJR76YuC7GzTEs9wZkV2rk1fnCZqWwu68CRg0ub8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkfq1UutRM1eo7Z4Tohu6oOJ4EtyfTWZfGTTfSf1yh40hHsh9Ci5YRbVQNN55bHo/DO/JTGw0XviPylTyLD7IlRD61WZONdruDg20pdMfCGWK7qfzhwgkZdU9IpvsgODbmtPlr/ySiS0sq2iP1cSIWgn02rt8Ep3no4UfGU3dy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeooeime; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A3FC4CEED;
	Mon, 21 Jul 2025 15:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111717;
	bh=8sFbJR76YuC7GzTEs9wZkV2rk1fnCZqWwu68CRg0ub8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aeooeimerS6axN8z9snSfbyf3UCtVBqA88uIzCe9WDja7ofeMkxZX6QmFyUFYmCvb
	 akwmKw8f0VmMEdR/qBIDiSowA5/uPCRaoXWLbhfqmCtK52YcgPzDshe2jxFuk9tPuf
	 dZeHITxh02JuEyqvS6mf1KTKq/C0D/XLD2j/Cxf+3/qeREUYiLwwW5sFouOSlmDP2w
	 s7iIFIu7jdZLJmqlfupm2DLnndS1OWREAQYvv4Pf2IHX9VSnX8xoplzJzURpe6gBFH
	 69FeZ5KNsbDaxFYWxG1pQxSSVxz/vEs3PQoZh0iHbYkz0d3sk713F/Fd2Nf3FI4F6z
	 2I/i90mnzvlwg==
Message-ID: <5639c668-5373-495e-a125-15ba5f124037@kernel.org>
Date: Mon, 21 Jul 2025 17:28:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: uvcvideo: Add missing curly braces
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>
References: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
 <20250715185254.6592-3-laurent.pinchart@ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250715185254.6592-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Jul-25 8:52 PM, Laurent Pinchart wrote:
> The uvc_meta_v4l2_try_format() function is missing curly braces on an
> outer for loop statement to comply with the driver coding style. Add
> them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index b68bfb2d47df..386b04a3a102 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -67,11 +67,12 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
>  	if (format->type != vfh->vdev->queue->type)
>  		return -EINVAL;
>  
> -	for (unsigned int i = 0; i < dev->nmeta_formats; i++)
> +	for (unsigned int i = 0; i < dev->nmeta_formats; i++) {
>  		if (dev->meta_formats[i] == fmt->dataformat) {
>  			fmeta = fmt->dataformat;
>  			break;
>  		}
> +	}
>  
>  	memset(fmt, 0, sizeof(*fmt));
>  


