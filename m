Return-Path: <linux-media+bounces-65330-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UHl7JdzrOGplkAcAu9opvQ
	(envelope-from <linux-media+bounces-65330-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 10:01:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E58546AD78A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 10:01:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=UeHDRADs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65330-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65330-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C6283044F11
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 07:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDA4383338;
	Mon, 22 Jun 2026 07:59:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEA23815DD;
	Mon, 22 Jun 2026 07:59:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782115144; cv=none; b=GfKNmERtsZoQQRZrB9qLc/RidmmR/rtjYlVS9WdbUCsuyymdD5qy4+NGwBJpi6MdnNSdkwWlur6yf9qaUOT/5Hbvali3NwjNg9lbld+R2FkD+lVW0d1wVOvv7zsrQidlhMb6ZQMhQMGS8ARJ8moSQNgn0AnZIKDch4FeMmt07Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782115144; c=relaxed/simple;
	bh=91QdCSk232KiUANG4CEhHOZADC/4ruPF70HDR+2rVoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ganaDeuY4ggby3jngSnHoI1zVgjDxpz+sbzx1rWTum5oB7KGuP73Zzy620WtLU3rcepC1GL+OJZ6m7ENbqrLw5INE4jIYU2MJY0FuSm2a9Xct/xXNnBchRn/tpLi9G3T8E+pnhnbIoZvj2h/1oaEMEP5FvmiTgPOdsoLcBo3o0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UeHDRADs; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-109-113-9-173.net.vodafone.it [109.113.9.173])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40EFF1E6;
	Mon, 22 Jun 2026 09:58:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782115103;
	bh=91QdCSk232KiUANG4CEhHOZADC/4ruPF70HDR+2rVoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeHDRADsEzARdpfx9wqYb97j7Ckk9PpBDNWUtrP/rJNzZ5rReLLLghp3vJqv7JvA5
	 F1xIQk8Mcpw+JMW8+Gjn/5M0wxM0za/0iqkqVp+QhVPRs/vn1Kf392bqZ+vvlidDkY
	 FOMFY5Hy0qelSOc2KzDosYyZ7jvh8S8iOxOVhf84=
Date: Mon, 22 Jun 2026 09:58:57 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "open list:RDACM21 Camera Sensor" <linux-media@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: rdacm21: Fix missing
 media_entity_cleanup()
Message-ID: <ajjp7QW_F2Hryuw9@zed>
References: <20260621060709.54396-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260621060709.54396-2-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65330-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,zed:mid,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E58546AD78A

Hi Biren

On Sun, Jun 21, 2026 at 11:37:06AM +0530, Biren Pandya wrote:
> If an error occurs after media_entity_pads_init() is called, the media
> entity is left uncleaned, potentially leaking resources or leaving it
> in an invalid state. Similarly, the remove path misses the cleanup.
>
> Add media_entity_cleanup() to both the error path in rdacm21_probe()
> and the rdacm21_remove() function to ensure proper resource release.
>
> Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> Cc: stable@vger.kernel.org

I wouldn't backport this. media_entity_cleanup() does nothing at the
moment and will do nothing on stable kernels as well.

It is anyway worth adding it to the driver in case in future it will
do something.

> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/i2c/rdacm21.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index bcab462708c7..41d4242a9b58 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -594,6 +594,7 @@ static int rdacm21_probe(struct i2c_client *client)
>
>  error_free_ctrls:
>  	v4l2_ctrl_handler_free(&dev->ctrls);
> +	media_entity_cleanup(&dev->sd.entity);

Don't you think a new label befoer error_free_ctrls: (possibile named
error_entity_cleanup) would be better ?

The code jumps to error_free_ctrls: even before calling
media_entity_pads_init().

Thanks
   j

>  error:
>  	i2c_unregister_device(dev->isp);
>
> @@ -606,6 +607,7 @@ static void rdacm21_remove(struct i2c_client *client)
>
>  	v4l2_async_unregister_subdev(&dev->sd);
>  	v4l2_ctrl_handler_free(&dev->ctrls);
> +	media_entity_cleanup(&dev->sd.entity);
>  	i2c_unregister_device(dev->isp);
>  }
>
> --
> 2.50.1 (Apple Git-155)
>

