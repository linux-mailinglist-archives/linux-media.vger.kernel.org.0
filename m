Return-Path: <linux-media+bounces-22269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E85F9DBD66
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 22:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DD97281E87
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B6B1C4609;
	Thu, 28 Nov 2024 21:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BK8C7c8a"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D439463;
	Thu, 28 Nov 2024 21:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732830706; cv=none; b=j7210yTmk+NLxi+bhFq09ek+75tOKgqYTDy5u7zRaKxwXTQuLJorivr0hEZq3j1NvebwZYTCjE/1tF2tcaq0ZmdatbWGpR+x/aO/n6YnfJVi36fQTYCYG796Cr6GR4G07I00Hr3tzGQEeOKqrjKbUK+3aFLmd64aP3DFk7NY2Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732830706; c=relaxed/simple;
	bh=CocPaM2r3EMAfXo5wgp/lPK0N6jFIF6eF3jxk2rMOH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjwcVNlbfSScLrfLYZWz6CUm3rufKKZrWTW2JsulGEAWUOx92Ah41etsNM8QjCTGSQ6+VYGjyYvO05NCokknw6K99EuAwhzR7FM7fCAAZIGXwH7RXT03Wf+fElIAELtkaDID0GgkH62xBlJVNRI0P1JrQvqFzEplf+IQfWVqMSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BK8C7c8a; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1895526;
	Thu, 28 Nov 2024 22:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732830679;
	bh=CocPaM2r3EMAfXo5wgp/lPK0N6jFIF6eF3jxk2rMOH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BK8C7c8aZgNKlZQtn+YlctWHHhmVldGQGC2ZUSljOHwN6PDczeg/nK+oKs0n24uGo
	 X6PM+Rds4Xhk5zkUUIGhxlJNyAKBAUjWilc6ZD+dodreXqJfHVHKZXCKQEoSQfs+Ox
	 gWTJ/gf3yEjzdzk3/5iBlwPuKQr+xSQwlvvojGIg=
Date: Thu, 28 Nov 2024 23:51:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: uvcvideo: Annotate lock requirements for
 uvc_ctrl_set
Message-ID: <20241128215130.GF25839@pendragon.ideasonboard.com>
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-3-510aab9570dd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241127-uvc-fix-async-v2-3-510aab9570dd@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Wed, Nov 27, 2024 at 12:14:51PM +0000, Ricardo Ribalda wrote:
> Make it explicit that the function is always called with ctrl_mutex
> being held.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3f8ae35cb3bc..99ddc5e9dff8 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1946,6 +1946,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  	s32 max;
>  	int ret;
>  
> +	lockdep_assert_held(&chain->ctrl_mutex);
> +
>  	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
>  		return -EACCES;
>  

-- 
Regards,

Laurent Pinchart

