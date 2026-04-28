Return-Path: <linux-media+bounces-59819-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N8nJP968GnMTwEAu9opvQ
	(envelope-from <linux-media+bounces-59819-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:16:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE2F481241
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A63E2301F35C
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B391B3D6CBB;
	Tue, 28 Apr 2026 09:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LqmLbjfa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF64D372EF3;
	Tue, 28 Apr 2026 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367642; cv=none; b=K8gcwnu3nQoX2Ev1OmMUzZGHoWKhO8BI1Rep28qNH90Lb0XxPPUDy0Pb6GslSqCxkMUvwqfkZyxIhhATAs93kb4Ypi4JXcFtOtSV64jU356aw+RaLGNyRU4B5XJ4EcMvCv8BTfFbo/DmyXU6eL4TGdwV6QA/DKqQnN1o1utSqec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367642; c=relaxed/simple;
	bh=k+xuNsML8zI2fYT6x0RTdrSzoknGs/KEVEjs6PfYcyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tN55hhqJFRwT8xAk8G/0+g8qlAL2Zay9nKpgqyddibhN6rHSsKw0GnqVlUFBge+fTFqqmrJVIesYPLU74hLNRxAa6mE9R2d59Nc2WzpkJGoVKTx0qldQMFq7OoyzZ/+9maU2FIsxc5X6RNNjOBrPxyET1UUJ3K37P3BRqdRE5Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LqmLbjfa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56B86C79;
	Tue, 28 Apr 2026 11:12:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777367535;
	bh=k+xuNsML8zI2fYT6x0RTdrSzoknGs/KEVEjs6PfYcyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LqmLbjfaxwSTdxDX4kfIu4zANFxfpi4fFNwWAE9cHsga+7PK1bPsxp3iqak4hoTtj
	 0EGhl2rfUwlJKPFs0On7Kq7N6yoo35kYB42Ikh6uozchRncnp4kyUUHCzvRoAM/doF
	 o+UawaDLoZwiEWwbTRKN/wyxWq9XOHNE5q+D/Gfo=
Date: Tue, 28 Apr 2026 12:13:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: rafael@kernel.org, lenb@kernel.org, pavel@kernel.org,
	linux-pm@vger.kernel.org, hansg@kernel.org, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: skip resume when writing
 hibernation image
Message-ID: <20260428091356.GF3219146@killaraus.ideasonboard.com>
References: <20260428080513.1833515-1-tuhaowen@uniontech.com>
 <20260428080513.1833515-3-tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428080513.1833515-3-tuhaowen@uniontech.com>
X-Rspamd-Queue-Id: 3AE2F481241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-59819-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,uniontech.com:email,ideasonboard.com:dkim]

On Tue, Apr 28, 2026 at 04:05:13PM +0800, Haowen Tu wrote:
> When a UVC camera is in active use and the system enters S4 hibernation,
> the camera is suspended as part of the normal device freeze sequence.
> However, after create_image() saves the memory snapshot, the kernel
> briefly resumes all devices with PMSG_THAW to write the hibernation image
> to storage.  This causes uvc_video_resume() to run and reinitialize the
> camera hardware, which visibly turns on the camera indicator LED during
> this intermediate phase -- even though the system is about to power off.
> 
> The UVC device is not needed during the image-write window, where the
> system only needs devices required for writing the hibernation image.
> USB .resume callbacks do not receive pm_message_t (unlike .suspend),
> so use the PM-layer helper to detect this phase and return early from
> uvc_video_resume(), preventing the unnecessary hardware reinitialization
> and the spurious LED activation.
> 
> Skipping the THAW resume is safe: stream->frozen remains 1 (set during
> the earlier FREEZE suspend), the device is powered off immediately after
> swsusp_write() with no intervening suspend, and the subsequent
> PMSG_RESTORE resume on the restored kernel calls uvc_video_resume()
> with pm_hibernation_storing_image() returning false, performing the full
> reinitialization as normal.
> 
> Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index f6c8e3223796..16a911b684d5 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -12,6 +12,7 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> +#include <linux/suspend.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
>  #include <linux/videodev2.h>
> @@ -2135,6 +2136,15 @@ int uvc_video_resume(struct uvc_streaming *stream, int reset)
>  {
>  	int ret;
>  
> +	/*
> +	 * After taking the hibernation memory snapshot, the kernel briefly resumes
> +	 * devices with PMSG_THAW to write the image to storage before powerdown.
> +	 * The UVC device is not involved in storage I/O, so skip reinitializing
> +	 * it to avoid unnecessary USB traffic during this transient phase.
> +	 */

Will all leaf drivers need to implement something similar ? How does
that scale ?

> +	if (pm_hibernation_storing_image())
> +		return 0;
> +
>  	/*
>  	 * If the bus has been reset on resume, set the alternate setting to 0.
>  	 * This should be the default value, but some devices crash or otherwise

-- 
Regards,

Laurent Pinchart

