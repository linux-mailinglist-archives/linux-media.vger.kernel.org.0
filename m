Return-Path: <linux-media+bounces-64498-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vz3FIaiSKWp5ZwMAu9opvQ
	(envelope-from <linux-media+bounces-64498-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:36:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F235E66B8AF
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:36:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=Mpn3nKjW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64498-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64498-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F34831F2A14
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD87330315;
	Wed, 10 Jun 2026 16:28:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89332BDC2A;
	Wed, 10 Jun 2026 16:28:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108883; cv=none; b=qgo+xFZ+at5ayXi2uj2X9q+zH6AU6pH3+gtybZbVGA8eRwkhxOz2dNGAKI0dkqngWDs2ikO8Ncfqa5dA75VsTsoVv2JqcpCjNLnVps9cGr5aUbVOJhFxXgAh+JvdRqoUrMS4NuSA75Nb6prlEY8r0pFrhHejo1sH9S1ktfRLjW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108883; c=relaxed/simple;
	bh=cPuoThRwDo0MU55TV2huo4Vv4tJ+HtOl9z5UaFpA8ZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8j6MnP4422Dhhph7M4u8zMwRyKuHiviH4xNYy1iQbQPdGJRvsDNv4H2cybOJ1EUNW96rYzBnLc/s6Y7BMljfrpwK4hZBxypc8ew+0m9KA3QXoELyuBjGqZqJZiFeHElwYFF72luR1LpAvUDWPLaohcclcnIFUpKuwNQYFxCf6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mpn3nKjW; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A74B524;
	Wed, 10 Jun 2026 18:27:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781108850;
	bh=cPuoThRwDo0MU55TV2huo4Vv4tJ+HtOl9z5UaFpA8ZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mpn3nKjWWpHqlJRVyqNHlRMTyrc9dMykbcYuWmaH7VGL49sXpoMzDICRoIm2JOlvb
	 Qj78vLByuyyWGbj8NVAYOgQnzipt7l+rCGJuNXraUuyPst9tN/nXzd+XCg49VCxVxu
	 474+AVHFhNw0wTkHBp6xAQP7DRi6rlQ1z8QbgmTc=
Message-ID: <99ac3dc6-c3b4-47d7-a3ee-1b50573d1b9b@ideasonboard.com>
Date: Wed, 10 Jun 2026 17:27:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: mc-entity: Add missing kerneldoc
To: Ricardo Ribalda <ribalda@chromium.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Tarang Raval <tarang.raval@siliconsignals.io>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, stable@kernel.org
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
 <20260610-media-ci-7-2-v1-3-3c61a482a44e@chromium.org>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260610-media-ci-7-2-v1-3-3c61a482a44e@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64498-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:stable@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,huawei,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,chromium.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F235E66B8AF

Hi Ricardo

On 10/06/2026 17:20, Ricardo Ribalda wrote:
> The argument args is not documented, and the latest kernel version
> complains about that.
> 
> This fixes the following warning:
> Warning: include/media/media-entity.h:1394 function parameter 'args'
> not described in 'media_entity_call'
> 
> Cc: stable@kernel.org
> Fixes: 48a7c4bac94d ("[media] docs-rst: improve the kAPI documentation for the mediactl")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   include/media/media-entity.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index d9b72cd87d52..fa393e840669 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -1387,6 +1387,7 @@ void media_remove_intf_links(struct media_interface *intf);
>    * @entity: entity where the @operation will be called
>    * @operation: type of the operation. Should be the name of a member of
>    *	struct &media_entity_operations.
> + * @args: arguments for the operation.
>    *
>    * This helper function will check if @operation is not %NULL. On such case,
>    * it will issue a call to @operation\(@entity, @args\).
> 


