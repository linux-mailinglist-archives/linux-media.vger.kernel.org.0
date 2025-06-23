Return-Path: <linux-media+bounces-35637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26604AE4050
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10F13167B76
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E5C24293F;
	Mon, 23 Jun 2025 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bv90bew9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6220F23E23C
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681740; cv=none; b=Z4CwOcH45WoujD7Cq7Xf11RxxCCMyyxVVO+1CBQb9KtqOItoXQsatBm9ahQcLpfzQJCZ9zNimKXUSBa09TUvImhOeYVtdbK0N41Kx2PVTD3EGgnAfeG40Myh1mA7zNj9R/j6oEpYLpS/oZRE2PziO4JD8OReBiFx1RYqdenjZ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681740; c=relaxed/simple;
	bh=8cjfLiNNHnBqmd51SXoZl6v6F3DmwkNfV+ITjUb5uwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qst6k7JHw53GmwOImB3gfcgClkztZQaYRzeK6qB6VytAGGzsD6y0kIOgXp44ODW4gEwN4/L+83mYzGbk3csmpjoNCDh9n1pLihUWis9N6Tn2GeIwIequeX+1P4SXERGOaPBDND8dz+c6+o40/GYvtrZbFonREpiOACxf44Arc7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bv90bew9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5799AD77;
	Mon, 23 Jun 2025 14:28:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750681721;
	bh=8cjfLiNNHnBqmd51SXoZl6v6F3DmwkNfV+ITjUb5uwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bv90bew9/T3H1HDAtgqdJS2TQxMkm8tQH5uiIZHWwxyonD+iEvobvAf3sLGHrvOEw
	 paW5RFbCEVJmJtN4801d7tZtBhNfGWtXsM9wrF1HrSjfBbqr8NCGNecwYlhL9Cxapz
	 qezgIfkwOWj5JO0FCAut80ieIWjfeYUYQ4X2a6Ew=
Date: Mon, 23 Jun 2025 15:28:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH v4 3/3] media: Documentation: Document new
 v4l2_ctrl_handler_free() behaviour
Message-ID: <20250623122838.GH826@pendragon.ideasonboard.com>
References: <20250623122314.2346635-1-sakari.ailus@linux.intel.com>
 <20250623122314.2346635-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623122314.2346635-4-sakari.ailus@linux.intel.com>

On Mon, Jun 23, 2025 at 03:23:14PM +0300, Sakari Ailus wrote:
> v4l2_ctrl_handler_free() no longer resets the handler's error code.
> Document it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/driver-api/media/v4l2-controls.rst | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/v4l2-controls.rst b/Documentation/driver-api/media/v4l2-controls.rst
> index b2e91804829b..fc04907589ab 100644
> --- a/Documentation/driver-api/media/v4l2-controls.rst
> +++ b/Documentation/driver-api/media/v4l2-controls.rst
> @@ -110,6 +110,7 @@ For sub-device drivers:
>  
>  	v4l2_ctrl_handler_free(&foo->ctrl_handler);
>  
> +:c:func:`v4l2_ctrl_handler_free` does not touch the handler's ``error`` field.
>  
>  2) Add controls:
>  
> @@ -191,12 +192,8 @@ These functions are typically called right after the
>  			V4L2_CID_TEST_PATTERN, ARRAY_SIZE(test_pattern) - 1, 0,
>  			0, test_pattern);
>  	...
> -	if (foo->ctrl_handler.error) {
> -		int err = foo->ctrl_handler.error;
> -
> -		v4l2_ctrl_handler_free(&foo->ctrl_handler);
> -		return err;
> -	}
> +	if (foo->ctrl_handler.error)
> +		return v4l2_ctrl_handler_free(&foo->ctrl_handler);
>  
>  The :c:func:`v4l2_ctrl_new_std` function returns the v4l2_ctrl pointer to
>  the new control, but if you do not need to access the pointer outside the

-- 
Regards,

Laurent Pinchart

