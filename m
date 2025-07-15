Return-Path: <linux-media+bounces-37802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AABEDB06629
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 20:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12F7C18991CE
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 18:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C863D2BE647;
	Tue, 15 Jul 2025 18:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LpY6pURJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44E1298984;
	Tue, 15 Jul 2025 18:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604982; cv=none; b=KYF73B361CCOk07WZU8xgME8Hgm0q+Cc3K9VP5cUgr7Z2aUkt8DQ/umGJV26xKax9vNratE1Iq5thzwipQ74PuYwGd2GaV95/A++pQahy/mYKA2GVVUnBrc6BpVjC1FyRSh7pW4QYpLTtj0R3D9sHvMyhLDcw2v/QGwbYyrNsrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604982; c=relaxed/simple;
	bh=3Sk8OD1GPqm014HeEtd4jh5A62bNxih3I2406/Aru7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Glf5MzlAFSXuRHNTfSz1/PfnMkw2I3pzRmtWl8UOV1zf4R0TIiObaAWTbu5pzA4TxBdJCvMrGWxg0N6ulidgHnKLGMOnQoJW5TF/n0ZokGDP+WYOLEwufS/btjw0qsMKFBtyd8D+Z6U/cP8XA5afhPzXrQpeRIO0Xo6m3hwrtPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LpY6pURJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 604B578E;
	Tue, 15 Jul 2025 20:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752604946;
	bh=3Sk8OD1GPqm014HeEtd4jh5A62bNxih3I2406/Aru7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LpY6pURJoVzQ3RyVwnojcld6jswGontVdnJOuUPiIyk5T89kBkemJjRdCYy7L3Q45
	 G1I2kdZ4d4WAv4hIcC0ZHPjXnXWGNV1O9iw/K99tffQGWNIoiVc/Z/Hg98rGZetswa
	 r99MzFp+kJoToaGGjDa+SAIi2u2XweSE90HhQw6Y=
Date: Tue, 15 Jul 2025 21:42:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Darshan Rathod <darshanrathod475@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix assignment in if condition
Message-ID: <20250715184257.GM20231@pendragon.ideasonboard.com>
References: <20250715113056.2519-1-darshanrathod475@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715113056.2519-1-darshanrathod475@gmail.com>

Hi Darshan,

Thank you for the patch.

On Tue, Jul 15, 2025 at 11:30:56AM +0000, Darshan Rathod wrote:
> The function uvc_input_init() used an assignment of the return value

s/used/uses/

> of input_register_device() within the condition of an if statement.
> 
> This coding style is discouraged by the Linux kernel coding style guide
> as it can be confused with a comparison and hide potential bugs.
> The checkpatch.pl script flags this as an error:
> "ERROR: do not use assignment in if condition"
> 
> Separate the assignment into its own statement before the conditional
> check to improve code readability and adhere to the kernel's
> coding standards.
> 
> Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'll update the commit message as mentioned above when applying, no need
for a v2.

> ---
>  drivers/media/usb/uvc/uvc_status.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index ee01dce4b783..3c29c0bb3f7c 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -62,7 +62,8 @@ static int uvc_input_init(struct uvc_device *dev)
>  	__set_bit(EV_KEY, input->evbit);
>  	__set_bit(KEY_CAMERA, input->keybit);
>  
> -	if ((ret = input_register_device(input)) < 0)
> +	ret = input_register_device(input);
> +	if (ret < 0)
>  		goto error;
>  
>  	dev->input = input;

-- 
Regards,

Laurent Pinchart

