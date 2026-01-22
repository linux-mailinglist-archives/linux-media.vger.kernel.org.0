Return-Path: <linux-media+bounces-51309-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEPaG1OCcWk1IAAAu9opvQ
	(envelope-from <linux-media+bounces-51309-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 02:50:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2716D60865
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 02:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 20D8844078A
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 01:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6086E354AF4;
	Thu, 22 Jan 2026 01:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mUCihPtd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0813352949;
	Thu, 22 Jan 2026 01:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046598; cv=none; b=LuOGYrQAOVvqytp3+eyafrHK32bu3ZA8AOEIJGqaFwl/744ZPPONOZYFQ5kl/7elr0PlrnDUvOcN78vw3CmcpOmy/IttXe+3LI+VnmLZfXms+aACixqCYH0gPuLQAyRcIES/+y8pkLZQm88cDraGLMHDtE566DmPAfqZnLTmrBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046598; c=relaxed/simple;
	bh=Ja7V76ohRL3wBsMJQTfP53ib4Fj0mdTSoof+L5zm4dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eb6g5ptF0E8ohSVDAdN8Liw7moGnB1Elgc8R1GnqY3SBnOxe4DqS7wrjVpr7HWMI4r7KXLpKpbcg3qQjkfaZfY0WRsvO7Em1lP122IYHzCAz2drWrRKfNTk7TQ7+WZ4ttosG9nGsWGSkEi5bspz9e774frmZ/hlQfu+69TVlIHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mUCihPtd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 470BD2DD;
	Thu, 22 Jan 2026 02:49:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769046561;
	bh=Ja7V76ohRL3wBsMJQTfP53ib4Fj0mdTSoof+L5zm4dM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUCihPtd462XckreDMDpZXBLa49Y1+S2+XNStwY+AZ02CkqfZ2/oiizzoc0OA9ENt
	 lpBxQXpHDCSdsp3IO2YcAPxIa52FFIjiP0yUM7JKptCj8MTn/yi0noELZQOpANIFTj
	 6SIW6419x76JuZ3mYyf1yGOBXdwIJC5Lcabr4NMA=
Date: Thu, 22 Jan 2026 03:49:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Laurent Pinchart <laurent.pinchart@skynet.be>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: uvcvideo: use min() for npacket calculation
Message-ID: <20260122014952.GC183118@killaraus>
References: <20260114-uvc-alloc-urb-v1-0-cedf3fb66711@chromium.org>
 <20260114-uvc-alloc-urb-v1-3-cedf3fb66711@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114-uvc-alloc-urb-v1-3-cedf3fb66711@chromium.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51309-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,chromium.org:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 2716D60865
X-Rspamd-Action: no action

Hi Ricardo,

Thank you for the patch.

On Wed, Jan 14, 2026 at 10:32:15AM +0000, Ricardo Ribalda wrote:
> Make the code slightly more appealing by making use of min(). There
> shall not be any functional change from this patch.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 59eb95a4b70c05b1a12986e908b7e9979b064fd0..db02080f15772e0bc1d5cfcadd32463f4e6ea045 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1808,9 +1808,7 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>  	 * Compute the number of packets. Bulk endpoints might transfer UVC
>  	 * payloads across multiple URBs.
>  	 */
> -	npackets = DIV_ROUND_UP(size, psize);
> -	if (npackets > UVC_MAX_PACKETS)
> -		npackets = UVC_MAX_PACKETS;
> +	npackets = min(UVC_MAX_PACKETS, DIV_ROUND_UP(size, psize));

Do you think this improves readability ? I find the existing code easier
to read, its purpose is immediately clear: it computes npackets and
clamps it to a max value. With min() I have to pause and think.

I'll take patches 1/3 and 2/3 in my tree already as 1/3 fixes an issue.

>  
>  	/* Retry allocations until one succeed. */
>  	for (; npackets > 0; npackets /= 2) {

-- 
Regards,

Laurent Pinchart

