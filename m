Return-Path: <linux-media+bounces-42631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB8BB59DC4
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 18:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7D6E320476
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 16:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C627F301707;
	Tue, 16 Sep 2025 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNAGwlPI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276133016F1
	for <linux-media@vger.kernel.org>; Tue, 16 Sep 2025 16:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758040400; cv=none; b=BCVR1EYPpMl9I1pvOvmOjc0sWaH2mM06USpqVdIwpURwg2rLb+JwcJkueOSkw8HaqZK8pGcsHF2+CYqTkViDWVGlL4PS+AFMZVMIUQyWRuOs4cuHiVfj2hrZxk1wJC9Cpjw+p9nqoAzLtbpNj0l9JIwOdb8QVoy9GsERmsK1mkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758040400; c=relaxed/simple;
	bh=pMfBSpnUWhK/HG4KW7RfFhazN34QgVb8Nr+T59soH9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qbapwWy8nnmrMgRHA9C522uHJwmO6xqvLQj2hrIsJai2Ohzx7+CLv3/nBM4c8T7YRsgdA+dqcJ9d92BuUb9sCz126A3Bg4PGP+Lt+HvJ89LLDomHithTmdFPVLB8ybzoIL46EqItmykR+ogETCp3rtDwV2iRBLXwLuO24hsCyyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNAGwlPI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A75C4CEF7;
	Tue, 16 Sep 2025 16:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758040397;
	bh=pMfBSpnUWhK/HG4KW7RfFhazN34QgVb8Nr+T59soH9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tNAGwlPIuCz1sjgnRfyoO59RaSoTW7wxfHHZfDgF6VJ9eWXANLSXvPd2xHunHKgoQ
	 sbvhCA4DupAqFMHiPMWK7+VtYGgOSd4uS9no/Mu1zXihgXlCpE11/lj68L+PGKUNf1
	 PfDpkEVng7vL6eAy4qGzuVZc3oRP4gAagHR+5xjM6NQsZr+tUaHkqIcpC9Znd/gkcs
	 mympAerqcRc2tXj9zLpffX/s6aCYiByIgFWUNwkf4U0/tguEBpYrUfTk8pxDub2PXj
	 CfuTDsUFzekjOMzf6kzUdk4l/hSufDF0A9gSHwE5uGxJF9W1+bSb2QGCQ3IwmPELjH
	 g8oqZIBHlQk7Q==
Message-ID: <541525e8-129d-4043-ba84-ccb0947ddf06@kernel.org>
Date: Tue, 16 Sep 2025 18:33:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Replace dev_dbg() with uvc_dbg()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>
References: <20250916161453.24740-1-laurent.pinchart@ideasonboard.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250916161453.24740-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 16-Sep-25 6:14 PM, Laurent Pinchart wrote:
> The uvcvideo driver uses a uvc_dbg() macro that supports enabling debug
> message categories selectively, and prints a KERN_DEBUG message. The
> macro is used through the driver, but one direct dev_dbg() call creeped
> in. Replace it with uvc_dbg().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 2905505c240c..d58bd888f0bf 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2929,8 +2929,7 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
>  			if (!ctrl->initialized || !ctrl->modified ||
>  			    (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
>  				continue;
> -			dev_dbg(&dev->intf->dev,
> -				"restoring control %pUl/%u/%u\n",
> +			uvc_dbg(dev, CONTROL, "restoring control %pUl/%u/%u\n",
>  				ctrl->info.entity, ctrl->info.index,
>  				ctrl->info.selector);
>  			ctrl->dirty = 1;
> 
> base-commit: 0e2ee70291e64a30fe36960c85294726d34a103e


