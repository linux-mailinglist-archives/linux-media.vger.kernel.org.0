Return-Path: <linux-media+bounces-60588-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAXHF8k1+2nfXgMAu9opvQ
	(envelope-from <linux-media+bounces-60588-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:36:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 006D94DA46A
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90F9C304BE52
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 12:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194FD44CF45;
	Wed,  6 May 2026 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vv96Wrda"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B16D44BCA5;
	Wed,  6 May 2026 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070716; cv=none; b=f6RaxDNBKHtaj+R1S/qbScuwlvdk2foPHiWx7KdXwc6CAk7SrHgCb3q0HT1V0XRskfrrIZuJeQGsu0NteH8uv9Hqk0JQu0GbKcmP0X1kTGdWwjspr2Cjamz7PfUhBTvtF8/zDXaNzeebipTFKJc33/JoqF9gLzDt+ClceL9XBrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070716; c=relaxed/simple;
	bh=KZrtDt/6j/qhsaVg4cuWkGmW5irl6jJerSBpBcqY1fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CArWGKI2CDnFSzy1kIT1CRWb54/XV6TfFl6cT4jCRqJRuY5bywZVn4UeDdiCwrXhOy2utAdh4Bnll8D0De56lUkHr2Z19fmhOOBcfNh6Ev0hv0bjmVStNu2ktOQHFGQWgDHNneVNVrXdhExZ+RPaL8DRSCJXW5YZG7n4WxPI910=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vv96Wrda; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F0D763D;
	Wed,  6 May 2026 14:31:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778070710;
	bh=KZrtDt/6j/qhsaVg4cuWkGmW5irl6jJerSBpBcqY1fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vv96Wrda6sp2mnhCJRY1/Mxfk52pN5rDgKQyP7MGJZ/3cjoDkvwhYTjpg0A/pjHAQ
	 znSUflykD0W1adFenMpb8ZSiY1FA98sy9xyIvb2L81DO31Fs95SHSX0WS76VPzhVkn
	 oYGvQqRfZj2D+QD3BSp3MXzr+TqlglZIJAy9dpsI=
Date: Wed, 6 May 2026 15:31:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: mchehab@kernel.org, Frank.li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	jacopo@jmondi.org, guoniu.zhou@nxp.com, s.riedmueller@phytec.de,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: imx8-isi: fix use-after-free on remove
Message-ID: <20260506123152.GN1598374@killaraus.ideasonboard.com>
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
 <20260506031210.2769998-2-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506031210.2769998-2-xiaolei.wang@windriver.com>
X-Rspamd-Queue-Id: 006D94DA46A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-60588-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hello Xiaolei,

Thank you for the patch.

On Wed, May 06, 2026 at 11:12:07AM +0800, Xiaolei Wang wrote:
> KASAN reports a slab-use-after-free in __media_entity_remove_link()
> during rmmod of imx8_isi:
> 
>   BUG: KASAN: slab-use-after-free in __media_entity_remove_link+0x608/0x650
>   Read of size 2 at addr ffff0000d47cb02a by task rmmod/724
> 
>   Call trace:
>    __media_entity_remove_link+0x608/0x650
>    __media_entity_remove_links+0x78/0x144
>    __media_device_unregister_entity+0x150/0x280
>    media_device_unregister_entity+0x48/0x68
>    v4l2_device_unregister_subdev+0x158/0x300
>    v4l2_async_unbind_subdev_one+0x22c/0x358
>    v4l2_async_nf_unbind_all_subdevs+0xfc/0x1c0
>    v4l2_async_nf_unregister+0x5c/0x14c
>    mxc_isi_remove+0x124/0x2a0 [imx8_isi]
> 
>   Allocated by task 249:
>    __kmalloc_noprof+0x27c/0x690
>    mxc_isi_crossbar_init+0x22c/0x560 [imx8_isi]
> 
>   Freed by task 724:
>    kfree+0x1e4/0x5b0
>    mxc_isi_crossbar_cleanup+0x34/0x80 [imx8_isi]
>    mxc_isi_remove+0x11c/0x2a0 [imx8_isi]
> 
> The problem is that mxc_isi_remove() calls mxc_isi_crossbar_cleanup()
> before mxc_isi_v4l2_cleanup(). The crossbar cleanup frees the media
> entity pads, but the subsequent v4l2 cleanup still tries to remove
> media links that reference those pads.
> 
> Fix this by calling mxc_isi_v4l2_cleanup() before
> mxc_isi_crossbar_cleanup() to ensure all media entities are properly
> unregistered while the pads are still valid.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 4bf8570e1b9e..2d639b789910 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -556,8 +556,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
>  		mxc_isi_pipe_cleanup(pipe);
>  	}
>  
> -	mxc_isi_crossbar_cleanup(&isi->crossbar);
>  	mxc_isi_v4l2_cleanup(isi);
> +	mxc_isi_crossbar_cleanup(&isi->crossbar);
>  }
>  
>  static const struct of_device_id mxc_isi_of_match[] = {

-- 
Regards,

Laurent Pinchart

