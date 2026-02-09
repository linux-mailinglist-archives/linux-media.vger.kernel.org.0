Return-Path: <linux-media+bounces-52419-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOf6Nqr5iWkiFQAAu9opvQ
	(envelope-from <linux-media+bounces-52419-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:13:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD8F111C02
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5750300ECA5
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B240B37E2E1;
	Mon,  9 Feb 2026 15:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KLxAm5rA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E4E295DAC;
	Mon,  9 Feb 2026 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650012; cv=none; b=ueaGOYer/P4Aoie42OYtDt8ZfYydJB9h1wF+zqmMaw2N8GszoRkVJq/XOdC26VllB1uOFtpeP1Rape/R//14ZUJjwVAKvclHJiDTRcBcAL/AHPLq30a53MX5BVZ1Y4rGkFsOdFNSCQaGJzmPeJifTqKu/3+TyOGGtRi6WJIddQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650012; c=relaxed/simple;
	bh=qln5MWNl5E1ZmsYC/IhNp6ONaDvQwsVe1loj/Qq4q0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWx0qY19VCF1WYjDBqCqV9rSbxFIeT+jXwzhEmY9t8OKTLImJZg8MCV96eKVol1M3C26j1OeEVoXUeYbeFY2oJempQces+VaTw5+sRvka0OYxUeqQuvTTH0qxucICNrYOJqyqK6fRmOvjLtFPj0/pFCdcz9aDr0KtYSZbd2JJrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KLxAm5rA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAEDF454;
	Mon,  9 Feb 2026 16:12:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770649963;
	bh=qln5MWNl5E1ZmsYC/IhNp6ONaDvQwsVe1loj/Qq4q0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KLxAm5rAhTREzXxItz3WCZQ2SFL1ShHNpuH8zaw9zAEafNbIOWyUq65uerHD7fA+o
	 IzL6st2dqeF07DfM8Tq3QwvtuKwY6yPKhRLmUxoG21M+SSxayHPaDew+4ENgGr2mvz
	 vvfN+tvNcRTSmVFqTWeqK1SpHvnEW6fg+qhMTmL8=
Date: Mon, 9 Feb 2026 16:13:26 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Use only frame end interrupts for
 DMA stopping state
Message-ID: <aYn3UZ-O4HNc4lvY@zed>
References: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
 <62200deb6cceb09fa9f6086c3d9ef9031b8db5e4.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <62200deb6cceb09fa9f6086c3d9ef9031b8db5e4.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52419-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,kernel.org,ideasonboard.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4FD8F111C02
X-Rspamd-Action: no action

Hi Tommaso

On Tue, Dec 30, 2025 at 06:09:16PM +0100, Tommaso Merciai wrote:
> On RZ/G3E the CRU driver relies on frame end interrupts to detect the
> completion of an active frame when stopping DMA.

Why do you think it does so ?

I read in rzg2l_cru_stop_image_processing()

	/* Stop the operation of image conversion */
	rzg2l_cru_write(cru, ICnEN, 0);

	/* Wait for streaming to stop */
	while ((rzg2l_cru_read(cru, ICnMS) & ICnMS_IA) && retries++ < RZG2L_RETRIES) {
		spin_unlock_irqrestore(&cru->qlock, flags);
		msleep(RZG2L_TIMEOUT_MS);
		spin_lock_irqsave(&cru->qlock, flags);
	}

Which seems to suggest the driver is polling a register to detect when
the Image Converter is still processing data or not.

>
> Update the driver to enable only frame end interrupts (CRUnIE2_FExE),
> dropping the use of frame start interrupts, which are not required for
> this flow.

This might be ok, but I don't think it's related to to detecting when
the DMA has actually stopped.

>
> Fix the interrupt status handling in the DMA stopping state by checking
> the correct frame end status bits (FExS) instead of the frame start ones
> (FSxS). Add a dedicated CRUnINTS2_FExS() macro to reflect the actual
> register bit layout.
>
> This ensures that DMA stopping is triggered by the intended frame end
> events and avoids incorrect interrupt handling.

I don't see where the frame end interrupt triggers the DMA stopping,
sorry

>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    | 1 +
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c   | 9 ++++-----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> index a5a57369ef0e..102a2fec5037 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> @@ -19,6 +19,7 @@
>
>  #define CRUnINTS_SFS			BIT(16)
>
> +#define CRUnINTS2_FExS(x)		BIT(((x) * 3) + 1)
>  #define CRUnINTS2_FSxS(x)		BIT(((x) * 3))
>
>  #define CRUnRST_VRESETN			BIT(0)
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 480e9b5dbcfe..34e74e5796e8 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -437,7 +437,6 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
>
>  void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
>  {
> -	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FSxE(cru->svc_channel));
>  	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FExE(cru->svc_channel));
>  }
>
> @@ -697,10 +696,10 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>  		}
>
>  		if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> -			if (irq_status & CRUnINTS2_FSxS(0) ||
> -			    irq_status & CRUnINTS2_FSxS(1) ||
> -			    irq_status & CRUnINTS2_FSxS(2) ||
> -			    irq_status & CRUnINTS2_FSxS(3))
> +			if (irq_status & CRUnINTS2_FExS(0) ||
> +			    irq_status & CRUnINTS2_FExS(1) ||
> +			    irq_status & CRUnINTS2_FExS(2) ||
> +			    irq_status & CRUnINTS2_FExS(3))

As the cru->state flag is accessed and set to RZG2L_CRU_DMA_STOPPING
without any lock and concurrently inspected by the IRQ handler, I guess
litterally anything can happen. Which makes me wonder
1) is the STOPPING condition useful at all
2) what is the purpose of this error detection

Thanks
  j

>  				dev_dbg(cru->dev, "IRQ while state stopping\n");
>  			return IRQ_HANDLED;
>  		}
> --
> 2.43.0
>

