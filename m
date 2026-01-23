Return-Path: <linux-media+bounces-51432-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHBOM3iVc2lgxQAAu9opvQ
	(envelope-from <linux-media+bounces-51432-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 16:36:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E1577D6B
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 16:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 549603023DB0
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A0D229B1F;
	Fri, 23 Jan 2026 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r0+peo8Q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C23296BC5;
	Fri, 23 Jan 2026 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769182575; cv=none; b=q85qcHwUXCsa1gi2OjcmbaEnR1Z+JKW26Lzd6vKV9pfLITnEB73iVnX8o37RbCUTiGc/em5Tx64mQSoLUH2VXPwPo5+QrJGXnzAmR9+4C1pgdA71h5ea+jetzICHipRtzMM/ObuuOs3NJHpCA/dfT+Xyk659gkyJ5MZ91NFGgMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769182575; c=relaxed/simple;
	bh=veP5Zq0B8RmCRU3vzf5VmdMpehKE3iDoJc4G6/L9dd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSsv+6TRRXkAb/bI1QgeVTEY2WFFFXTeVsWLWtaol+jYPg/H6AXiBRTcBDxVylX3Xi4re3aatKfFNyhof8KFxyT6MNscuUXarNTVWV43KV6rOdQ9dkhrEQ3ypekta5BfxiM+GJBTFcaEHHyRrvGBqwcGypC5yCrgy5/oPgDiHtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r0+peo8Q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CE1AE9CE;
	Fri, 23 Jan 2026 16:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769182539;
	bh=veP5Zq0B8RmCRU3vzf5VmdMpehKE3iDoJc4G6/L9dd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0+peo8QYRalO+QSLfjqcbJOcDTsJiZrHlspFkoCh6updd9oxLVN3ckGQ6x58TG6a
	 ZdNFAlc8UCrRa2PReYeGZlrZ9ppWSfl35ZYlx+ncbKYWmHogHAKcY6aZz7xqr9YJ4l
	 Vq9/RU2fUpHO0jXZWWEsC5ElIDg9FwEYu/Kz0QNk=
Date: Fri, 23 Jan 2026 17:36:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nick Huang <sef1548@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kusogame68@gmail.com
Subject: Re: [PATCH] drm/xcsi2rxss: use str_true_false() for boolean dev_info
 output
Message-ID: <20260123153610.GB415966@killaraus>
References: <20260123153108.19204-1-sef1548@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123153108.19204-1-sef1548@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51432-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,vger.kernel.org,lists.infradead.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.931];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 39E1577D6B
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 03:31:04PM +0000, Nick Huang wrote:
> Refactor dev_info calls in xcsi2rxss_log_status() to use the
> str_true_false() helper instead of inline ternary operators
> ("true" : "false"). This makes the code cleaner, more readable,
> and easier to maintain.

That's a matter of personal preference, and I disagree with that. Please
don't post this kind of refactoring that doesn't bring actual
improvements, that's not a good use of reviewers and maintainers' time.

> Added #include <linux/string_choices.h>
> for future use if symbolic flag printing is needed.
> 
> Signed-off-by: Nick Huang <sef1548@gmail.com>
> ---
>  drivers/media/platform/xilinx/xilinx-csi2rxss.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> index 146131b8f..e0c5b2ceb 100644
> --- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> +++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> @@ -17,6 +17,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/v4l2-subdev.h>
> +#include <linux/string_choices.h>
>  #include <media/media-entity.h>
>  #include <media/mipi-csi2.h>
>  #include <media/v4l2-common.h>
> @@ -400,19 +401,19 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
>  	dev_info(dev, "***** Core Status *****\n");
>  	data = xcsi2rxss_read(xcsi2rxss, XCSI_CSR_OFFSET);
>  	dev_info(dev, "Short Packet FIFO Full = %s\n",
> -		 data & XCSI_CSR_SPFIFOFULL ? "true" : "false");
> +		 str_true_false(data & XCSI_CSR_SPFIFOFULL));
>  	dev_info(dev, "Short Packet FIFO Not Empty = %s\n",
> -		 data & XCSI_CSR_SPFIFONE ? "true" : "false");
> +		 str_true_false(data & XCSI_CSR_SPFIFONE));
>  	dev_info(dev, "Stream line buffer full = %s\n",
> -		 data & XCSI_CSR_SLBF ? "true" : "false");
> +		 str_true_false(data & XCSI_CSR_SLBF));
>  	dev_info(dev, "Soft reset/Core disable in progress = %s\n",
> -		 data & XCSI_CSR_RIPCD ? "true" : "false");
> +		 str_true_false(data & XCSI_CSR_RIPCD));
>  
>  	/* Clk & Lane Info  */
>  	dev_info(dev, "******** Clock Lane Info *********\n");
>  	data = xcsi2rxss_read(xcsi2rxss, XCSI_CLKINFR_OFFSET);
>  	dev_info(dev, "Clock Lane in Stop State = %s\n",
> -		 data & XCSI_CLKINFR_STOP ? "true" : "false");
> +		 str_true_false(data & XCSI_CLKINFR_STOP));
>  
>  	dev_info(dev, "******** Data Lane Info *********\n");
>  	dev_info(dev, "Lane\tSoT Error\tSoT Sync Error\tStop State\n");
> @@ -421,9 +422,9 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
>  		data = xcsi2rxss_read(xcsi2rxss, reg);
>  
>  		dev_info(dev, "%d\t%s\t\t%s\t\t%s\n", i,
> -			 data & XCSI_DLXINFR_SOTERR ? "true" : "false",
> -			 data & XCSI_DLXINFR_SOTSYNCERR ? "true" : "false",
> -			 data & XCSI_DLXINFR_STOP ? "true" : "false");
> +			 str_true_false(data & XCSI_DLXINFR_SOTERR),
> +			 str_true_false(data & XCSI_DLXINFR_SOTSYNCERR),
> +			 str_true_false(data & XCSI_DLXINFR_STOP));
>  
>  		reg += XCSI_NEXTREG_OFFSET;
>  	}

-- 
Regards,

Laurent Pinchart

