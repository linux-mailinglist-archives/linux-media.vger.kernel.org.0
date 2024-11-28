Return-Path: <linux-media+bounces-22264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4D69DBD4E
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 22:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FA17281EBF
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4731C3F28;
	Thu, 28 Nov 2024 21:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fyl3n1OA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C9113DDB5;
	Thu, 28 Nov 2024 21:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732829202; cv=none; b=Pv1Rdr0JsVYEHVT5CvW5InEvNPOvNFEArqLRA3KkknlolBeKijnDAREg/30sNFiJgQpZDt6wS4IuO6L2W70LrynEBdIBHYrOxA0KuJHGUmui4RMhRHqos/U/QY1HiMdc/Olq2/TwqZ0jaRvFmclisCMkm/dvzWB96SPWwLrkvWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732829202; c=relaxed/simple;
	bh=jTD98gw1TXfjIIaWmmT4g6efz3BLtsEwLiRUIRQJkJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YF4JNGxEUyBiKJ5Xxu0giDrPv6lLi/VjANZvggwWJ9bl4MmzmIaQtg2dvHHbvNf7a7R2H4u5R7msKEUouJTdxtogZgg98q4yDpRyJLZpvgKJV/mXTG6Vig20bXiTiFnrG3W0nDRN85UhdzhjWbvzm/HEmlr4uTLYMHYaFAT3QSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fyl3n1OA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03F7C526;
	Thu, 28 Nov 2024 22:26:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732829175;
	bh=jTD98gw1TXfjIIaWmmT4g6efz3BLtsEwLiRUIRQJkJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fyl3n1OATRT+XAw6kBlAD59w61JIF+LaPWFoZp5UW5QGk4kJUdL3GvzIgtSwF+/zf
	 n9GcKRTD8S7Zp8XNky6NBMhoRay1KpWNEgsvDPBr1M+u87ZpA174qfwanxJxZJxWQo
	 QVj4yqsu3xcm9rxVjhUSe3T42IiJ7PVlwzXSL9FQ=
Date: Thu, 28 Nov 2024 23:26:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: uvcvideo: Remove redundant NULL assignment
Message-ID: <20241128212628.GD25731@pendragon.ideasonboard.com>
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-4-510aab9570dd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241127-uvc-fix-async-v2-4-510aab9570dd@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Wed, Nov 27, 2024 at 12:14:52PM +0000, Ricardo Ribalda wrote:
> ctrl->handle will only be different than NULL for controls that have
> mappings. This is because that assignment is only done inside
> uvc_ctrl_set() for mapped controls.

That seems right. I checked the unplug paths, and the mappings are
destroyed from uvc_delete(), after all file handles get closed.

I think this patch should go first in the series, as otherwise there's a
temporary state where you rely on handle never being touched without
holding the proper lock, and this code path violates that requirement.
Is there anything I may be missing that would cause issues with
bisection if I move this patch at the beginning of the series ?

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 99ddc5e9dff8..b9c9ff629ab6 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1645,10 +1645,8 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
>  	struct uvc_device *dev = chain->dev;
>  	struct uvc_ctrl_work *w = &dev->async_ctrl;
>  
> -	if (list_empty(&ctrl->info.mappings)) {
> -		ctrl->handle = NULL;
> +	if (list_empty(&ctrl->info.mappings))
>  		return false;
> -	}
>  
>  	w->data = data;
>  	w->urb = urb;

-- 
Regards,

Laurent Pinchart

