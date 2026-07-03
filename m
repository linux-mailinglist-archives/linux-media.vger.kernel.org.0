Return-Path: <linux-media+bounces-66457-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kKNbMRSoR2pBdAAAu9opvQ
	(envelope-from <linux-media+bounces-66457-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 14:16:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431B70244F
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 14:16:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66457-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66457-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5EF58301C6DB
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 12:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68AB3D170C;
	Fri,  3 Jul 2026 12:15:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F603D0936
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 12:15:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080930; cv=none; b=bCX2A4mY+H+2XgRtZxeD4P+dMwQHC4uPmFASkTNK8TCZ9DmNonNFI0XrBc0kWdGMLlb+oJsxQyBkNn9fb2j+y1MPzNdjaiLGWI0GdJpB/RUMGipw8wbJfBptj3YRODbnwYlfHKMViyRAg7yKrFQI3+AjLc3zfwasuBqUQARtLQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080930; c=relaxed/simple;
	bh=N7WOIrubAromhX0rbKY8neIG6P3RsjEgwjpFJcg5DD4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YSPDOVdnU4OzwUTzoyGuHAWhtr4OoAVOXoEa7qUetYt3MutFtLkMyP2vP10JB2PTOd9DI/UYrIe13CNuBdqH0u0bAsSoRrJWKFrMRpL1mXT1IZ+gXYckyEY0/Dp4VaKkhYRzsXOFQcnsZMCAvrzOLJMyYLymjy4mHHraXw41q5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wfcnI-0002RJ-Oc; Fri, 03 Jul 2026 14:14:56 +0200
Message-ID: <8d336c44-1fe9-4f9e-8d00-3e1d735e40b7@pengutronix.de>
Date: Fri, 3 Jul 2026 14:14:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Subject: Re: [PATCH v2 2/4] media: v4l2-common: Add kernel-doc for
 v4l2_fill_pixfmt_mp_aligned()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Nas Chung <nas.chung@chipsnmedia.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
References: <20260701165003.1495035-1-tommaso.merciai.xr@bp.renesas.com>
 <20260701165003.1495035-3-tommaso.merciai.xr@bp.renesas.com>
Content-Language: en-US
In-Reply-To: <20260701165003.1495035-3-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mehdi.djait@linux.intel.com,m:nas.chung@chipsnmedia.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66457-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7431B70244F

Hi Tommaso,

thanks for adding documentation.

On 7/1/26 6:49 PM, Tommaso Merciai wrote:
> Replace the bare placeholder comment with a full kernel-doc block
> documenting all parameters, the function behaviour for both single
> memory plane (mem_planes == 1) and multiple memory plane (mem_planes > 1)
> formats, and the return value.
>
> Signed-off-by: Tommaso Merciai<tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>   - New patch
>
>   include/media/v4l2-common.h | 27 ++++++++++++++++++++++++++-
>   1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 749fe38c134e..db59dda578f0 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -557,7 +557,32 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
>   int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>   		     u32 width, u32 height);
>   
> -/* @stride_alignment is a power of 2 value in bytes */
> +/**
> + * v4l2_fill_pixfmt_mp_aligned - Fill in a &struct v4l2_pix_format_mplane with
> + *	stride alignment requirements.
> + *
> + * @pixfmt: pointer to the &struct v4l2_pix_format_mplane to be filled
> + * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
> + * @width: image width in pixels
> + * @height: image height in pixels
> + * @stride_alignment: stride alignment in bytes; must be a power of 2
> + *
> + * Fills all fields of @pixfmt for the given pixel format, dimensions, and
> + * stride alignment.
> + *
> + * For formats stored in a single memory plane (mem_planes == 1), the
> + * behaviour matches v4l2_fill_pixfmt_aligned(): plane_fmt[0].bytesperline
Given that the v4l2_fill_pixfmt_aligned helper is added later in patch 
3, don't you want to move this patch after adding the helper?
> + * is set to the primary plane stride rounded up to @stride_alignment, and
> + * per-component alignments are scaled to keep chroma strides consistently
> + * derivable from the luma stride. plane_fmt[0].sizeimage covers all

No, it's the other way: The strides of all components are aligned to the 
@stride_alignment. To keep the chroma strides consistently derivable 
from the luma stride, strides may be aligned to a multiple of the 
@stride_alignment.

(feel free to use the above if it sounds good)

At least I read your text, as if only the y stride would be rounded up 
to the nearest alignment and for other component strides may be scaled 
down to 1/2 or 1/4 of the alignment. But most of the time the y stride 
will be scaled up (e.g. YUV420 or YUV410) and in rare cases (e.g. 
NV24/42) the component stride is scaled up.

Sincerely
     Sven

> + * component planes.
> + *
> + * For formats with multiple memory planes (mem_planes > 1), each plane's
> + * bytesperline is independently rounded up to @stride_alignment, and
> + * sizeimage is set to bytesperline multiplied by the plane height.
> + *
> + * Return: 0 on success, -EINVAL if @pixelformat is unknown.
> + */
>   int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
>   				u32 pixelformat, u32 width, u32 height,
>   				u8 stride_alignment);

