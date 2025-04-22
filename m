Return-Path: <linux-media+bounces-30744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66DA9780F
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 22:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45B761722A3
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 20:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09E12DDCFC;
	Tue, 22 Apr 2025 20:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Td9rOfDt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D662DA0F0;
	Tue, 22 Apr 2025 20:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745355322; cv=none; b=YZBtcZ3sPMIwACqlogW6w/SETPHuPExGP4T+c5/1aql0yIO/fE2wQjMtg7XmDOA5NlLQP+atSioATtDXAGIvVsSWTx+U51rBPjS7NaBZMfH/Bn3EjWtkqonLPUDjKYBw3z1jSsLNqk6w0EzQTAptWfSF2+qbkfd+ug+bd3x00MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745355322; c=relaxed/simple;
	bh=mYYMs9Y9SFdWAQ8K0/Eq8i6h3bLpc7eVwC6yojKBfDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m759u81iQU44u+ol1c5HR3jttdt6iac9cv3HPBPqLjG2C/rW39Wnz8plt81lL7Zny4YneMDywo47if+OoQsn+5YahbuDrZ5b9gh4/aEBxQsTbB1gfYkHSiLwv2Zjl++ZjPxup59x2p9Nhsxk7yNaPgaNnYpUTK8aQoQuQJlY8yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Td9rOfDt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC41C10D;
	Tue, 22 Apr 2025 22:55:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745355318;
	bh=mYYMs9Y9SFdWAQ8K0/Eq8i6h3bLpc7eVwC6yojKBfDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Td9rOfDtMNLpm8yTFyKPuY9ww5XnbmdYcNSYVxMBL0fNBwoGiwADqIRRme1SnYwWf
	 kDLXV2wUgg2j74PcWkObO5q0+gEF6xGq9LPV2889gBLCmAHS9etJyyF6+9vdNqw98y
	 IPv0hxPYrgDnO0n9tgjPcYlSi+i04gOHPgagnmds=
Date: Tue, 22 Apr 2025 23:55:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH v2 2/3] media: uvcvideo: Send control events for partial
 succeeds
Message-ID: <20250422205515.GN17813@pendragon.ideasonboard.com>
References: <20250224-uvc-data-backup-v2-0-de993ed9823b@chromium.org>
 <20250224-uvc-data-backup-v2-2-de993ed9823b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224-uvc-data-backup-v2-2-de993ed9823b@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Feb 24, 2025 at 10:34:54AM +0000, Ricardo Ribalda wrote:
> Today, when we are applying a change to entities A, B. If A succeeds and B
> fails the events for A are not sent.
> 
> This change changes the code so the events for A are send right after

s/send/sent/

> they happen.
> 
> Cc: stable@kernel.org
> Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index f2484f6d21c1..7d074686eef4 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1705,7 +1705,9 @@ static bool uvc_ctrl_xctrls_has_control(const struct v4l2_ext_control *xctrls,
>  }
>  
>  static void uvc_ctrl_send_events(struct uvc_fh *handle,
> -	const struct v4l2_ext_control *xctrls, unsigned int xctrls_count)
> +				 struct uvc_entity *entity,
> +				 const struct v4l2_ext_control *xctrls,
> +				 unsigned int xctrls_count)
>  {
>  	struct uvc_control_mapping *mapping;
>  	struct uvc_control *ctrl;
> @@ -1716,6 +1718,9 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
>  		u32 changes = V4L2_EVENT_CTRL_CH_VALUE;
>  
>  		ctrl = uvc_find_control(handle->chain, xctrls[i].id, &mapping);
> +		if (ctrl->entity != entity)
> +			continue;
> +
>  		if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>  			/* Notification will be sent from an Interrupt event. */
>  			continue;
> @@ -1954,11 +1959,12 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  					uvc_ctrl_find_ctrl_idx(entity, ctrls,
>  							       err_ctrl);
>  			goto done;
> +		} else if (ret > 0 && !rollback) {
> +			uvc_ctrl_send_events(handle, entity,
> +					     ctrls->controls, ctrls->count);
>  		}
>  	}
>  
> -	if (!rollback)
> -		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
>  	ret = 0;
>  done:
>  	mutex_unlock(&chain->ctrl_mutex);

-- 
Regards,

Laurent Pinchart

