Return-Path: <linux-media+bounces-60590-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGrEH+42+2nUXwMAu9opvQ
	(envelope-from <linux-media+bounces-60590-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:41:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D394DA5BD
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 727AC300B182
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 12:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632E844D682;
	Wed,  6 May 2026 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GeLo/yo3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8538144CF54;
	Wed,  6 May 2026 12:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071273; cv=none; b=p30Ts1PKYCjldANfMnGEIrNqV4PmEWGwN+EVvKtL6eC42fWkv5YxNMuUBqTpLqZLLPT579GKArFzKLblP6V2I8sFDufjBrBv6E7gGI2TbJGdunJJaBvzXsg/mcp6C1h+KEreX5B6gDqewf1SWv4mPo5TgyPrDS8lJRV+fkFR6Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071273; c=relaxed/simple;
	bh=/4qS0BCUqnUnIcX+Zc+8rx4aZz63MpUdpO+lQvtF0Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cShB2UqS0tVC7tq9j49gWjgb4O52eZuQr1DfzOlMA5g6J7KeVWzj+hqWdA6BtJuJG1yEL+frHTtrrtFW+hIiZfQoEVd5JihC5lCDRk6Y+xMNLbxgJpRQrwG+lHM0xYun7UnUm1KTRFU3Ceo7Avvg3ZPM+EfYMl4XTavbyt8YTwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GeLo/yo3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4965463D;
	Wed,  6 May 2026 14:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778071267;
	bh=/4qS0BCUqnUnIcX+Zc+8rx4aZz63MpUdpO+lQvtF0Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GeLo/yo3QjcqXJGrQ7VPAVJ05lU97o1Q6RzYZ+aFuik9ya4cG8e7L7Fcb0LuT2IcV
	 zLelYH2L7ryuBTxslH6ztkeSl+MiKOlhDh1RoAjYblIAyz0phRMGq9rXhfuPYkj7Ip
	 v/Tip/5I+5UHTSN/gkg/1+LNq93yfHO6YqEtvqk4=
Date: Wed, 6 May 2026 15:41:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: mchehab@kernel.org, Frank.li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	jacopo@jmondi.org, guoniu.zhou@nxp.com, s.riedmueller@phytec.de,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: imx8-isi: fix isi->pipes memory leak in
 probe and remove
Message-ID: <20260506124109.GP1598374@killaraus.ideasonboard.com>
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
 <20260506031210.2769998-4-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506031210.2769998-4-xiaolei.wang@windriver.com>
X-Rspamd-Queue-Id: 28D394DA5BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-60590-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,windriver.com:email,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]

Hello Xiaolei,

Thank you for the patch.

On Wed, May 06, 2026 at 11:12:09AM +0800, Xiaolei Wang wrote:
> mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
> frees it on any probe failure path or in mxc_isi_remove(), leaking
> the allocation on every failed probe and every normal unbind.
> 
> Fix this by switching from kzalloc_objs() to devm_kcalloc(), which
> ties the allocation lifetime to the device and eliminates the need
> for explicit kfree() in all error paths and in mxc_isi_remove().

There's ongoing work to add a devm_kzalloc_objs(), to I'd rather not
revert to kcalloc. If you want to fix this leak now without waiting for
devm_kzalloc_objs(), I would prefer adding kfree() in error paths and in
mxc_isi_remove().

> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 2d639b789910..2b76fb9c18f6 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -485,7 +485,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  
>  	isi->pdata = of_device_get_match_data(dev);
>  
> -	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
> +	isi->pipes = devm_kcalloc(dev, isi->pdata->num_channels,
> +				  sizeof(*isi->pipes), GFP_KERNEL);
>  	if (!isi->pipes)
>  		return -ENOMEM;
>  

-- 
Regards,

Laurent Pinchart

