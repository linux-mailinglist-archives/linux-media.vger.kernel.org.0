Return-Path: <linux-media+bounces-26694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C9BA4105D
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AC0F171A7E
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 17:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7474149C7D;
	Sun, 23 Feb 2025 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FfTO7U1J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F50117D2;
	Sun, 23 Feb 2025 17:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740330625; cv=none; b=MwsiiG3RcYSfE6q9OonNf3EKQnl7OElCu7l5eIEsGKp5hut0ctnnyBxevBWaa1ws96WqnA9lFh3u+6kloPw1Qz4PYW2syx6qQK1DKH4Xn9xjltyQm6yUm2pcJfWAwM4ytgX2IqYErlAg2e+n0fXjtWygatzcKT97UC1ao/zptQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740330625; c=relaxed/simple;
	bh=E3cZXomExK8csD+So2sOtih9MS1eRY4qlK/Iq2CodPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUVWmbUP2GAcUHjIf5DIjS7LBE1LURdravK7CV4Y2goBQFkk2qjkFnN8azC4cI/vTssSulEhFSfdbQrk78dGgRgxoeQb+qeFQAh2rf2ykupUXjlfDGfWwztMDPysy2RuJBuKQ+O4fny0UFXc0BIyhEuwmx4pYjDn47rxX+N+Vho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FfTO7U1J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6A6C4DC;
	Sun, 23 Feb 2025 18:08:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740330536;
	bh=E3cZXomExK8csD+So2sOtih9MS1eRY4qlK/Iq2CodPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfTO7U1JTpFiVlgFb20eV0MS5XaAFLyyeXZgNI1nvU7+HktM14T61GaViXqy/wYqA
	 fjbypbC1WWhW3PsY2CwsK3fHADQHIleP+Usc2P4wfKxxolUlhArQMTo32RLOleJcMN
	 ys8plUdi+uEQ6cHmNCQRW7r+kZiHyQTfEXpMkmTQ=
Date: Sun, 23 Feb 2025 19:10:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH 2/3] media: uvcvideo: Do not send events for not changed
 controls
Message-ID: <20250223171005.GC2821@pendragon.ideasonboard.com>
References: <20241210-uvc-data-backup-v1-0-77141e439cc3@chromium.org>
 <20241210-uvc-data-backup-v1-2-77141e439cc3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210-uvc-data-backup-v1-2-77141e439cc3@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Tue, Dec 10, 2024 at 10:22:23PM +0000, Ricardo Ribalda wrote:
> Only send events for controls that have actually changed.
> E.g.: We are changing entities A, B and C. If we get an error while
> we change B we do not continue setting C. But the current code sends an
> event also for C.

Does it ? If uvc_ctrl_commit_entity() fails the 'goto done' statement
skips over uvc_ctrl_send_events().

> Due to the fact that the controls are grouped by entities, and the user
> might group them in different orders, we cannot send the events at the
> end, but when we change an entity.
> 
> Cc: stable@kernel.org
> Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 7e2fc97c9f43..9496ac970267 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1669,7 +1669,9 @@ static bool uvc_ctrl_xctrls_has_control(const struct v4l2_ext_control *xctrls,
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
> @@ -1680,6 +1682,9 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
>  	for (i = 0; i < xctrls_count; ++i) {
>  		ctrl = uvc_find_control(handle->chain, xctrls[i].id, &mapping);
>  
> +		if (ctrl->entity != entity)
> +			continue;
> +
>  		if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>  			/* Notification will be sent from an Interrupt event. */
>  			continue;
> @@ -1911,11 +1916,12 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
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
>  done:
>  	mutex_unlock(&chain->ctrl_mutex);
>  	return ret < 0 ? ret : 0;

-- 
Regards,

Laurent Pinchart

