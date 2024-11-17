Return-Path: <linux-media+bounces-21485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F289D0659
	for <lists+linux-media@lfdr.de>; Sun, 17 Nov 2024 22:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0421F21D7C
	for <lists+linux-media@lfdr.de>; Sun, 17 Nov 2024 21:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD811DDC2D;
	Sun, 17 Nov 2024 21:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BcPsu1h+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578641DDC25
	for <linux-media@vger.kernel.org>; Sun, 17 Nov 2024 21:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731879529; cv=none; b=s30Vac6Rd8Nz5NBg6VHAMq9A74lCh+vIZXwV03y/2X1fuRi93uwHYI7QwFtIYQy7v46VAQqjWvoHioVjuApEM6CW1Vd66xtMjfO7NIg0z5ZOwIkGQOOCS35moRn6ZnB690P+65Rxg521/xaBIKLcCM+5K/FYr+R9uPWMFBups50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731879529; c=relaxed/simple;
	bh=oO5j492PNbuBDaCltH3pUqqUL2kP6VYZwL1QMaTmcRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f14n9yJi7p8nhGwivGm8AjpOIHJrn6GuiuwAhliPqPFw+syBnBkg5po1BqphptJnH5KEI8HgOqZK4rfEWvHkwfiEBl2DYyR+ZejFmEJtYMApkoHbJd56xj7Fc/C5hS3d25/s0VD7NnFI6ZHRGh3fDlfKIbUHDQL6ZwNhLq5CbX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BcPsu1h+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 709BF7CA;
	Sun, 17 Nov 2024 22:38:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731879510;
	bh=oO5j492PNbuBDaCltH3pUqqUL2kP6VYZwL1QMaTmcRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BcPsu1h+yLhPeBxt6exiaTaXTYQtyV9535xue0Tj/s6iSdBZWa8zstipDxcz3mxgk
	 WI/8etDBrbcKsq7Wa5SQ9YjoQVXfa0koHb5VIQGKanl9qrYLsCzBpBmL2UOsFpGaSp
	 bUUy7K0mYgf0qjud1f0M8/76Um1xQ6CYzir6nvl4=
Date: Sun, 17 Nov 2024 23:38:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Hans de Goede as USB VIDEO CLASS
 co-maintainer
Message-ID: <20241117213837.GJ12409@pendragon.ideasonboard.com>
References: <20241116113855.50976-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241116113855.50976-1-hdegoede@redhat.com>

Hi Hans,

On Sat, Nov 16, 2024 at 12:38:55PM +0100, Hans de Goede wrote:
> Add myself as co-maintainer for the UVC driver.

Thanks for volunteering to help.

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 91d0609db61b..1da403e89159 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24063,6 +24063,7 @@ F:	drivers/usb/host/uhci*
>  
>  USB VIDEO CLASS
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +M:	Hans de Goede <hdegoede@redhat.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	http://www.ideasonboard.org/uvc/

I think we should update the git tree entry as well, as we're using
https://gitlab.freedesktop.org/linux-media/users/uvc/. As that's
temporary until we can merge patches directly in the multi-committers
tree, it may however not be worth it. What do you think ?

-- 
Regards,

Laurent Pinchart

