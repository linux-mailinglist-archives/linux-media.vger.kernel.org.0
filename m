Return-Path: <linux-media+bounces-53094-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHvHA+MQl2n7uAIAu9opvQ
	(envelope-from <linux-media+bounces-53094-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 14:32:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4E515F183
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 14:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 435AC3019C85
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 13:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695852FD1B1;
	Thu, 19 Feb 2026 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QqbpXktc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E9D253B42;
	Thu, 19 Feb 2026 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771507934; cv=none; b=NdEM7QoCfoBJLbkbRndoLH+RNnS+2BDifc0l31yEmRmdjQBrC0x/7Neh+X9JKs5PXWQayKtxy5IZVmo+EZC3gHxzIjitmo1k0lsEGCbwDmSWMSe2eaZH3VUtLiXUIe/Lzc1ZoNnW5zajHIVUTJCZkuPX9caRb7Bb2B5v+DjpRDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771507934; c=relaxed/simple;
	bh=mcsnqZ16IpK00yn4MFJzFSCszgBqb7AWgIKK7weVzvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snhT2cHmT8t2T0BY+fa1Go1Y/XY2D7Y0bV8AdsVW+45/OwbnAGSIEdTyPHEdAqPLk5Mjca8pj6xgJUig/Yx4CxH2we8OZWCPQkXy/IGeuHT1yeEE3MDTfB2YKUmBN/TVTML5KJJUYVzXiYiZZdEaD2RqRdATYl97rilbRtd8hmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QqbpXktc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [83.245.237.175])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C7277673;
	Thu, 19 Feb 2026 14:31:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771507878;
	bh=mcsnqZ16IpK00yn4MFJzFSCszgBqb7AWgIKK7weVzvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QqbpXktchrWx7RSzbn1a66YGbA62+uf8/f6ezgr8iZ+5zqE7aMIS96tTI8w0Q6QYn
	 Ktka68v/4QfuZwKsABrl3b2SrdbNTICs4hfFe5l1xYumDjCidVUKpaBKWmi/jgWYE+
	 cBdBqhFCQJegmaC26v5NvFiHCjJ5IZlM1fXruqUI=
Date: Thu, 19 Feb 2026 14:32:06 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jayesh Puri <jayeshkpuri@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] Modified uvc_driver
Message-ID: <20260219133206.GM520738@killaraus.ideasonboard.com>
References: <20260219131816.1930881-1-jayeshkpuri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260219131816.1930881-1-jayeshkpuri@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53094-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 6F4E515F183
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 06:48:11PM +0530, Jayesh Puri wrote:
> ---
>  Kconfig                            | 0
>  drivers/media/usb/uvc/uvc_driver.c | 2 ++
>  2 files changed, 2 insertions(+)
>  mode change 100644 => 100755 Kconfig
> 
> diff --git a/Kconfig b/Kconfig
> old mode 100644
> new mode 100755
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index aa3e8d295e0f..cec117328ab2 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2191,6 +2191,8 @@ static int uvc_probe(struct usb_interface *intf,
>  		(const struct uvc_device_info *)id->driver_info;
>  	int function;
>  	int ret;
> +	
> +	pr_info("I changed uvcvideo driver in the Linux Kernel\n");

Congratulations, but I'm afraid we're out of medals.

Shuah, I thought LFD103 has been updated to avoid spamming the lists
with such patches. What happened ?

>  
>  	/* Allocate memory for the device and initialize it. */
>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);

-- 
Regards,

Laurent Pinchart

