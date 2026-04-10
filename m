Return-Path: <linux-media+bounces-58540-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INNELG/d2GnHjAgAu9opvQ
	(envelope-from <linux-media+bounces-58540-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 13:22:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B403D61AE
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 13:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31C7A30480B7
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A82F38F248;
	Fri, 10 Apr 2026 11:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sNSm7DZC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DB2246783;
	Fri, 10 Apr 2026 11:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775819748; cv=none; b=IK7XvfAVxjDIAFDpDLC5RYItiLVWey0y5eIEFAXReTh4lXB5LcQQfsnJI8m4UztVGiiKWnlDAEPxCX/RmEaBsEJkFpKE9nksNEHeWKSo3gZ28CDd54BqFw0xDzfg2YhpP6LjZoJ/aK1+VQkj5qkUlJDaucdc8N1WqJ5si/Q51BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775819748; c=relaxed/simple;
	bh=YJArSvN1gwGllszRSVStYa225t1HgV1rh5X1wstccKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0tIWbq/+kVws+8rBeXbPzjwQNuVYfgzqBbRIxmQQUkSmMUTTRjvGU4Hw8kdp9dsF1uxnOQY5RetuMGoz4bHc6QvaCrK8gSLixzs+5tRuCMy6FeaA3/+WtkOxthbPvD2EUFG5xtwELuCnJIeALanhMNcP91trFGlVkMRGKhK+fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sNSm7DZC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 678E5225;
	Fri, 10 Apr 2026 13:14:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775819655;
	bh=YJArSvN1gwGllszRSVStYa225t1HgV1rh5X1wstccKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sNSm7DZCzyCrvQ3gfUdfKUIQWjpQ9WdhtaEs9fNMu2vISJb5IJ3h4h6lJfoDu5C4a
	 O5lJ++1BjGkNLOLM3OmiifLeX99sQeTKEFMdq49qwRmbGktFLZ+XK7HNPGfdnk9sEW
	 C46ewAz8IFAn3Ifk3aN7pQ4QbO0zRR7MGkGLDE5Q=
Date: Fri, 10 Apr 2026 13:15:42 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v7 01/18] media: Add RPP_X1_PARAMS and RPP_X1_STATS meta
 formats
Message-ID: <adjbMMUveL1U3tQz@zed>
References: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
 <20260410-rppx1-v7-1-43cfc6b44f1f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260410-rppx1-v7-1-43cfc6b44f1f@ideasonboard.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58540-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ragnatech.se,glider.be,gmail.com,renesas.com,vger.kernel.org,ideasonboard.com,mailbox.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 39B403D61AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jai

On Fri, Apr 10, 2026 at 02:35:36PM +0530, Jai Luthra wrote:
> Register V4L2 metadata fourcc codes for the Dreamchip RPP-X1 ISP
> parameters and statistics buffers. These formats are used by the driver
> to exchange ISP configuration and 3A statistics with userspace through
> the extensible parameters framework.
>
> Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  include/uapi/linux/videodev2.h       | 4 ++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a2b650f4ec3c32a4883521f34fb51eed13c71d76..cd3f4a86e27f22a0108ad2932cba755295af9a98 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1471,6 +1471,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>  	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
>  	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> +	case V4L2_META_FMT_RPP_X1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
> +	case V4L2_META_FMT_RPP_X1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index eda4492e40dc14a90a230601d8e23b0e13845d34..1f78b5378b3bde31a5ec464a6a609fac94e6d0d6 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -889,6 +889,10 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
>  #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
>
> +/* Vendor specific - used for Dreamchip RPP-X1 ISP */
> +#define V4L2_META_FMT_RPP_X1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
> +#define V4L2_META_FMT_RPP_X1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
> +

nice.

However you'll also need a bit of documentation.
See Documentation/admin-guide/media/mali-c55.rst and
Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst for
reference and the commits that introduced them.

They can come in a separate patch which should be part of this series.

For this one:
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  #ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
>
> --
> 2.53.0
>

