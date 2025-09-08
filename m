Return-Path: <linux-media+bounces-41968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 946EAB4875F
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 10:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15B9F7B1AFE
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 08:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3DE2E3B08;
	Mon,  8 Sep 2025 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pfzt9lSC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FB27081E;
	Mon,  8 Sep 2025 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320643; cv=none; b=bzDvRWoQid3ZcISUngNfcHP+KItoSq7dGaDenGOPlbNLtmqUni5LZsxmqSxLvNAKe7G3rp8HA/g1uYwdj+UwZSwxLpUwZK+QVS0LjAd1S3ffehtoB3ZyxLhcWpXb1aIvJYhOgPOFjLKzsPkX+0NaJb+gsJIf3za5V8/MEkOsKqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320643; c=relaxed/simple;
	bh=T6WU6FMdJVN6whhptxwic2lsfg9pbzgcAQ2WPzt0LMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCOy83yDbt/yWBADk6o34MPEM3vwgSIXDaUXBB72SmGqv4TOiCMmVOKPsz5WwAqUt2s/c7br7Hu4bgPoZfaoRQS13eYqzdEXMw0hjVWTBdB9fgmdc1OBtry+xJ4SGLR4mnhQqlmtU7TsrNEYNp5Mdq3DuDJEHWpJkiPZrUl/cxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pfzt9lSC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2788D99F;
	Mon,  8 Sep 2025 10:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757320566;
	bh=T6WU6FMdJVN6whhptxwic2lsfg9pbzgcAQ2WPzt0LMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pfzt9lSCLMr0VtUCxpDNcP/CKOt7vxq8WIXGBH0eoaWffwS9Xydqs/gNt3rqFCipJ
	 bhwb7Gm15hvMxbMtK7uFjoP73t8cGGLKo9LEsWXSAH3Fx3LbN6X4ZbBteRfVpFE8py
	 4L+yoK8h4xG71Hm1wXuhsCALMJeQ+Sb38iv3uRZc=
Date: Mon, 8 Sep 2025 10:36:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Shorten the transfer size non
 compliance message
Message-ID: <20250908083655.GB23493@pendragon.ideasonboard.com>
References: <20250904081429.592e439f.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904081429.592e439f.michal.pecio@gmail.com>

On Thu, Sep 04, 2025 at 08:14:29AM +0200, Michal Pecio wrote:
> This message is much longer than others and doesn't fit even in a 160
> column window when printed, despite providing little real information.
> 
> Also replace 'transmission' with 'transfer' because that's the actual
> name and 'max packet' with 'limit' because it isn't same thing with
> isochronus endpoints. Remove cryptic abbreviations like 'ep'.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
> 
> By the way, this hack doesn't help much in the opposite case:
> dwMaxPayloadTransferSize is right, but EP descriptors are a mess.

Have you encountered such devices ?

> But no harm in trying, I guess.
> I can live with it either way.
> 
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 82d9d8ae059d..baf4ace41dbe 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -266,7 +266,7 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>  	if (stream->intf->num_altsetting > 1 &&
>  	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
>  		dev_warn_ratelimited(&stream->intf->dev,
> -				     "UVC non compliance: the max payload transmission size (%u) exceeds the size of the ep max packet (%u). Using the max size.\n",
> +				     "UVC non compliance: Reducing max payload transfer size (%u) to fit endpoint limit (%u).\n",
>  				     ctrl->dwMaxPayloadTransferSize,
>  				     stream->maxpsize);
>  		ctrl->dwMaxPayloadTransferSize = stream->maxpsize;

-- 
Regards,

Laurent Pinchart

