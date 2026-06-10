Return-Path: <linux-media+bounces-64491-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DhPqOGyRKWoKZwMAu9opvQ
	(envelope-from <linux-media+bounces-64491-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:31:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E8966B7E5
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:31:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="kjIZ/8jY";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64491-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64491-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CAB630BB606
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB5531F991;
	Wed, 10 Jun 2026 16:22:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE242FE066;
	Wed, 10 Jun 2026 16:22:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108564; cv=none; b=HhopZ2+/xPeEM9TX7RBKWZ93ldeMmp3xV/cX1vFbflGiPWtzHzOwHqzWNzEkiRdbAnwrzHJEtU4etMl3yYRP96PLoWHEtCxRSQ85vpgVP/w/wfAQzlZ+YjUuSY2KiKpLKHyAjuWs3ENQB0sPpSk2GvqgkkFzxlqvia3IKP1anZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108564; c=relaxed/simple;
	bh=Dn8ba+w9aY0Bt9pG+INLtIHvs6rE2GTTrGIs52UdO2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfH1GLH8IcNPEqu/yYy3+YD9lyRRsDgLPwMXE6GkkCaPhWqoFSjpW3eIE3BFkFCxQvwHBIuLcjIJB2SybpVCBabZ3LAVXp8hB4ec+DiT3HP40ISsqdLq0hVAnvqks/Lz2NSC4LaAsCZcKE6tBtG5r8l7lPg6ZZZF1VHPSie/IcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kjIZ/8jY; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D8CD524;
	Wed, 10 Jun 2026 18:22:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781108531;
	bh=Dn8ba+w9aY0Bt9pG+INLtIHvs6rE2GTTrGIs52UdO2U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kjIZ/8jYp67bIsVo5CFlM2y8ExhLyQhE4siplaAXtQgDBBrfqOYynGmc9qx3hfLAM
	 yBUithz5RKLXZon3B8q5Muhn4v6RkTURSUJsKJgXiQ8hrF+KCpEDWT+Nm92zbU9F4e
	 FiKjk2/BLwIhbUS5cAtzbahKwRGbazlUd4q3JYtk=
Message-ID: <8aba88da-d5b5-4252-9a15-91baad81f1ab@ideasonboard.com>
Date: Wed, 10 Jun 2026 17:22:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Remove unused kerneldoc description
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
 linux-renesas-soc@vger.kernel.org
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
 <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>
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
	TAGGED_FROM(0.00)[bounces-64491-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,chromium.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94E8966B7E5

Hi Ricardo - thanks for the patch

On 10/06/2026 17:20, Ricardo Ribalda wrote:
> The variable has been previously removed but not its kerneldoc.
> 
> Also remove the leftover reference to state in the description of qlock.
> 
> This patch fixes the following warning:
> 
> Warning: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h:164
> Excess struct member 'state' description in 'rzg2l_cru_dev'
> 
> Fixes: 85d8820d4869 ("media: rzg2l-cru: Remove the 'state' variable")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>   drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 5bf334e173d2..b426bc7898bf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -116,11 +116,9 @@ struct rzg2l_cru_info {
>    * @scratch_phys:	physical address of the scratch buffer
>    *
>    * @qlock:		protects @queue_buf, @buf_list, @sequence
> - *			@state
>    * @queue_buf:		Keeps track of buffers given to HW slot
>    * @buf_list:		list of queued buffers
>    * @sequence:		V4L2 buffers sequence number
> - * @state:		keeps track of operation state
>    *
>    * @format:		active V4L2 pixel format
>    */
> 


