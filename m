Return-Path: <linux-media+bounces-52410-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLksBKHtiWlpEQAAu9opvQ
	(envelope-from <linux-media+bounces-52410-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 15:22:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 673841102E1
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 15:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6859C3016EC4
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 14:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1221237AA99;
	Mon,  9 Feb 2026 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vuvyfge1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A3837AA68;
	Mon,  9 Feb 2026 14:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770646925; cv=none; b=fetPMIHMB0UY+Sjjxr5LLeJY02qS+TQCUVrJbC9pnBA+djUDrRuKmnBqTI+QWGntjc/m+QucY3s9Gointnlpjci3R7IL1gyGNUcqsQ83doG0KFc7lA5dyysMv05XyXr+7iKr1+z1yAIQMh6zZZcEA9IurGqYwI+egC6Vs45/YwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770646925; c=relaxed/simple;
	bh=GG125Lp4neS8ImAz00uzxR2fy2bc60gNczE6VkakuZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZBPIXAjLf63SwAu3rE/ujOs0J093Jwcyq1ZjjqOBQijYfFsA3VRNlfo5R+OaS+zB8IdrqqBvDQ98l6lFJNvbKKG5dJsl7MoC5duU3qvo+bqlgMw1Q1CFjFI97OFhNcS4JQAIdQYVZ1rAZ+0dkltSbP2Lb9WaTQEXGeFpzjwg7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vuvyfge1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBB7B63F;
	Mon,  9 Feb 2026 15:21:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770646876;
	bh=GG125Lp4neS8ImAz00uzxR2fy2bc60gNczE6VkakuZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vuvyfge1OSwMR7Z+CN2+U7JS7Jt4F/QzL+4lL4q+3thhn5BUjMvCkYqGoh1Z2IQbc
	 wp8SApWsdsWrmwgSwlejqBUNyERJSOtGGiiKP6vmLrQKhRy2wHlVwBPA0d2O/38Q7B
	 57gIB0+xWHsTmkwLAQQ/oYKlUNqnMYwQe7G6J95g=
Date: Mon, 9 Feb 2026 15:21:59 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rzg2l-cru: Skip ICnMC configuration when
 ICnSVC is used
Message-ID: <aYnnRWR-5xOPSHOh@zed>
References: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
 <b9aeabb34829b8e97559610a3d00ef67399a300c.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b9aeabb34829b8e97559610a3d00ef67399a300c.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52410-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,kernel.org,ideasonboard.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 673841102E1
X-Rspamd-Action: no action

Hi Tommaso

On Tue, Dec 30, 2025 at 06:09:15PM +0100, Tommaso Merciai wrote:
> When the CRU is configured to use ICnSVC for virtual channel mapping,
> as on the RZ/{G3E, V2H/P} SoC, the ICnMC register must not be
> programmed.

I see a difference indeed between the [G3E, V2H/P] and the G2L version
of the IP in the presence of the VCSEL[1:0] field in register ICnMC.

On [G3E, V2H/P] the selection of which virtual channel to accept
doesn't go through VCSEL[1:0] in ICnMC but a dedicated register ICnSVC
is provided for that purpose. So far so good.

>
> Return early after setting up ICnSVC to avoid overriding the ICnMC
> register, which is not applicable in this mode.
>
> This prevents unintended register programming when ICnSVC is enabled.
>
> Fixes: 3c5ca0a48bb0 ("media: rzg2l-cru: Drop function pointer to configure CSI")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 162e2ace6931..480e9b5dbcfe 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -268,6 +268,8 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
>  		rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
>  		rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
>  				ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> +
> +		return;
>  	}
>
>  	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;

However, the rest of the rzg2l_cru_csi2_setup() doesn't only program
the virtual channel filtering through ICnMC (which should be skept for
G3E, V2H/P) but also programs DT filtering in INF[5:0] of register
ICnIPMC_C0 which seems to be available on G3E and V2H/P as well.

Section "9.2.4.3.6 VC/Data Type Selector (for Image Processing)" of
the chip manual (V2H/P) prescribes:

Only one data type can be handled by each SVC and the data types are
selected in the ICnIPMC_C0 to 3.INF[5:0] registers.

And this patch makes the driver skips that part.
Has this patch been tested ? It breaks my V2H/P setup:

 rzg2l-cru 16010000.cru1: Invalid MB address 0x0 (out of range)


> --
> 2.43.0
>
>

