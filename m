Return-Path: <linux-media+bounces-25348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73475A20D1B
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 16:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4FA6162608
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 15:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F181B4223;
	Tue, 28 Jan 2025 15:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jsIeLBAJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E9BF9F8
	for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 15:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738078357; cv=none; b=WM+ypU82qrcCgAMHFS1rjzbJ3ZBxd15cliFu7xpmYRxvY61ZNBWtME8d8R+IPeKTQOM7l0ngNAmRfH11GGx9zr/8he5G8KGR2jLCISRpjRcH/SxkNfHF04TN6G8d7lC3Ss8TCgWsd4vbYni2tF2sFWNdhAJZrNmqyRFZmyJgVJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738078357; c=relaxed/simple;
	bh=1ndxqggmMcTcfuGB45rKcwepOis6YZ2f3HHP46JgXbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKdbz7IUc/hAqpWtufX5UtL6g9qHg6O179lDg3e21dGdeEG4hAPSJuSsdCrCSGrPifr0yw7vK29vOXXktj6BkB3e/1rPwtNf6+i/r70W34agr9fULn2XzcN7CYjBGwN8+12YqcseyRz2iJ9h2DcUf+V3G0WZtoR0/Y6jEz7BmyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jsIeLBAJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 026A93A4;
	Tue, 28 Jan 2025 16:31:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738078287;
	bh=1ndxqggmMcTcfuGB45rKcwepOis6YZ2f3HHP46JgXbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsIeLBAJxXlun5WMgzKgxbp8BWOK6YCkl/LkWdE6ikUT5A8F4qrRV7y9rhHjaky8J
	 E17sLouFvMAdsYrO4w5x5kh8h5TtK+mF6TJ70DNoVyZZvZ7cfYNvtJTD6hfDgny8hU
	 /HSo/hEYSNQVF4w9eYU1MKThDsQ7O/4rXtNUNRbo=
Date: Tue, 28 Jan 2025 17:32:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] media: platform: rpi1-cfe: drop
 vb2_ops_wait_prepare/finish
Message-ID: <20250128153223.GE12673@pendragon.ideasonboard.com>
References: <91a3443e-6723-4e80-a532-8a43ff74cd4f@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <91a3443e-6723-4e80-a532-8a43ff74cd4f@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Tue, Jan 28, 2025 at 04:03:39PM +0100, Hans Verkuil wrote:
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

> ---
>  drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 12660087b12f..ff6f05b28c13 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -1315,8 +1315,6 @@ static void cfe_stop_streaming(struct vb2_queue *vq)
>  }
> 
>  static const struct vb2_ops cfe_video_qops = {
> -	.wait_prepare = vb2_ops_wait_prepare,
> -	.wait_finish = vb2_ops_wait_finish,
>  	.queue_setup = cfe_queue_setup,
>  	.buf_prepare = cfe_buffer_prepare,
>  	.buf_queue = cfe_buffer_queue,

-- 
Regards,

Laurent Pinchart

