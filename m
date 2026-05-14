Return-Path: <linux-media+bounces-61570-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ip7LGCCBWo5XwIAu9opvQ
	(envelope-from <linux-media+bounces-61570-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:05:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE64953F0FD
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 362E13014BD4
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372413D669C;
	Thu, 14 May 2026 08:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D92GnvFU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B28F386556;
	Thu, 14 May 2026 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745942; cv=none; b=JZuyL8GPVgujeiiwT/BmZoClt1lzGtbUS/AqZFmBeitwp50Kkub1OemC01/7Df18T6hTA+2pmfiTf5L36+VjM80pZ6od2f9jdEQDlFqF1uVZ8q/9LcLYyDWxiyC14AzDR7dxxg+BUeOs0qwOmdyLNHu3O2rXFLdFmRU7y8/aqEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745942; c=relaxed/simple;
	bh=cmpBdhYjIsN7g3KpJc91OHDxZysetJlZSdqaz9vUzfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKRchGtAldDDuB1Gj9ERphHgOdhEMqfuJ+XgaHrx2xjsgggCLDJsIG07NcFf4gnbBs310Bz46gcJhWbDUXJOxdkKdWq1jVnVhiphZsHYarmu0QxOIJ4V8OqenjKDoSNKBj1xAFCnw2A5FZs76JDW5UUsfMvF3NiesIFWAEDHz7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D92GnvFU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA8FE8E0;
	Thu, 14 May 2026 10:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778745930;
	bh=cmpBdhYjIsN7g3KpJc91OHDxZysetJlZSdqaz9vUzfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D92GnvFUrfeERUK8kMtJPaGPZeKv7fEvi1RiTqj7QaUj1lGJq/NS5mdMMJ8xLcVCc
	 am8hzyQZr1EovoKrajEQjPRiZFTQcNFVWT7vLpqykfP4oZlCchsWEv83BjRAu3K1Yi
	 JM4UaRtcOh00ELC6enPVR+oyyujNyaglCqd+kHaY=
Date: Thu, 14 May 2026 10:05:37 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] media: i2c: ov5640: Fix minimum gain to 1.0x
Message-ID: <agWB0BpbI8IEFO1H@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
 <20260501-ov5640_cleanup-v1-3-0869a7802a33@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-ov5640_cleanup-v1-3-0869a7802a33@ideasonboard.com>
X-Rspamd-Queue-Id: EE64953F0FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61570-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 01, 2026 at 04:39:05PM +0100, Kieran Bingham wrote:
> Adjust the Analogue Gain control to only provide a minimum gain of 1.0,
> and ensure that this is the default value rather than '0' which is
> invalid.
>
> Requesting an Analogue gain of 0 would result in a black frame, and when
> the sensor is over exposed the Exposure should be reduced instead.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index b5e529ea662b..0dc4f4272d05 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3484,7 +3484,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  	ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_AUTOGAIN,
>  					     0, 1, 1, 1);
>  	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
> -					0, 1023, 1, 0);
> +					16, 1023, 1, 16);

Again the register is not documented, but it is said that 0xff = x32
which suggests Q6.4 hence 16 should be x1.0

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>  	ctrls->saturation = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_SATURATION,
>  					      0, 255, 1, 64);
>
> --
> 2.52.0
>
>

