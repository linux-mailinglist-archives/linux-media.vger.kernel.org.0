Return-Path: <linux-media+bounces-25347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F32A20D1A
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 16:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A5491888C0F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 15:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83BB1B4223;
	Tue, 28 Jan 2025 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OkiibKYu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A92F9F8
	for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 15:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738078327; cv=none; b=TSVO87JwUlQhfkrjUGWQv2MriihliPAnMfiOTnkW5Jgqpwenan2++TiWz93djLgAT749Y/qUnTCWwofa0z8XQ+YCDlC182sBkkaAQJ1TtuybS/WApJmWsN+Nr2Eh/YPEV2WPmAleTR5DbS7qt54+TzG2h5/OUOHhiOP0ZX6zW5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738078327; c=relaxed/simple;
	bh=rDPwKTqOeByyD0+59GhzPIqMUK/x8TM04HYrLzcg5uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUKDZ7dkexYEGaPq9BTEYZEXY8qoNHyVVrEyCucNVKN7L4dCL2r6BAjhpRUiEnRMG0C2oT+mo/1nhBmJEZAIb5FdoVly3yVzYfDUT/Fx33W+n1zPyKDVALy/yfMP4oPBVNJ0fY2hLi47M0huTWmdJg22Jym4XloAn+VLm9SoICU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OkiibKYu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 386E83A4;
	Tue, 28 Jan 2025 16:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738078257;
	bh=rDPwKTqOeByyD0+59GhzPIqMUK/x8TM04HYrLzcg5uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OkiibKYu5fIN1gdNkKiIhHsi1q0+aBFPRv2Eqnw4n8qG9SscgC1M8hkClN6MGHRjI
	 k/fM9CXEewWGqq4L5wjjrpVUBYI1Kj5vYZWsdSR/U2XwRS7uD0iV8wFsL8rX3l1b8h
	 7v4wf+D1Wloo+fYHV+gtEliDQMciRI93P4KtAUuo=
Date: Tue, 28 Jan 2025 17:31:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-rpi-kernel@lists.infradead.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [RESEND PATCH] staging: bcm2835-camera: drop
 vb2_ops_wait_prepare/finish
Message-ID: <20250128153153.GD12673@pendragon.ideasonboard.com>
References: <f01dc977-bc4a-46f5-abd7-35089c8f2031@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f01dc977-bc4a-46f5-abd7-35089c8f2031@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Tue, Jan 28, 2025 at 04:16:27PM +0100, Hans Verkuil wrote:
> Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> are NULL") it is no longer needed to set the wait_prepare/finish
> vb2_ops callbacks as long as the lock field in vb2_queue is set.
> 
> Since the vb2_ops_wait_prepare/finish callbacks already rely on that field,
> we can safely drop these callbacks.
> 
> This simplifies the code and this is a step towards the goal of deleting
> these callbacks.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Note that once we merge a driver for the ISP, this driver will likely be
removed.

> ---
> Resend, adding missing CC to linux-media. No other changes.
> ---
>  drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index deec33f63bcf..b839b50ac26a 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -658,8 +658,6 @@ static const struct vb2_ops bcm2835_mmal_video_qops = {
>  	.buf_queue = buffer_queue,
>  	.start_streaming = start_streaming,
>  	.stop_streaming = stop_streaming,
> -	.wait_prepare = vb2_ops_wait_prepare,
> -	.wait_finish = vb2_ops_wait_finish,
>  };
> 
>  /* ------------------------------------------------------------------
> -- 
> 2.45.2
> 

-- 
Regards,

Laurent Pinchart

