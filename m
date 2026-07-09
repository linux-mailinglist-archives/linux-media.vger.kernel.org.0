Return-Path: <linux-media+bounces-67107-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tYS6DftJT2pqdgIAu9opvQ
	(envelope-from <linux-media+bounces-67107-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 09:12:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3073D72D7D3
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 09:12:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=Taaa+6Oo;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67107-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67107-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 55A70300863D
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 07:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1569F3DD526;
	Thu,  9 Jul 2026 07:12:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091863D3D18;
	Thu,  9 Jul 2026 07:12:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581158; cv=none; b=sgK69m5MiUEldPcWIwHOW5+dIi+I6TbkZG++RO8wIyW8adL7i99yCjLMeyWxPSymg6iFhP6A4NZB9qnSnY/tZg85c70fvgFaCZDRoZ5hDFv4pWkWiOe8K14Nzwgo8nbtq53eG3fMKbSogqxYI+ZdHP3nB7RqKTGF9z56na6UN3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581158; c=relaxed/simple;
	bh=M1pFjA5KJic4AEdltKopPMI6uc5gHRM33VPZKOAQ1MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaPpma2SqiCJPADsaKKmk68Woo95g04RKU/gzah983TSW2jimIMaPkykhtvxBCE8SD8SOLvxNYnCdoTCeUl0irMRzU+rVMs3nM6sZuHlGlRygVvoOsvDlOGHnuDl0nBsVeJzWx4WU/NbLQQrUNL03+JyOXnfoO1Y17ENwQxdvdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Taaa+6Oo; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB3736BFA;
	Thu,  9 Jul 2026 09:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783580699;
	bh=M1pFjA5KJic4AEdltKopPMI6uc5gHRM33VPZKOAQ1MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Taaa+6Oo3TeP/6dLZFfvqYJ+pRbF47dkPyQG5NgQhCaxhWu11zXNoVQdc8UOLsKMK
	 ufv7h8d7VsMDkoC/4qLB41vMSeIyUCTk0kudBKIWfDp7d3yC8Sii2l3T6JUYijWVNf
	 gDwUisNF/a3PjXaUY15qWYXRKXrzt4sHyL+QOt7A=
Date: Thu, 9 Jul 2026 09:05:46 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: niklas.soderlund@ragnatech.se, mchehab@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] media: renesas: rzg2l-core: Add missing
 media_entity_cleanup()
Message-ID: <ak9G5g8sw5W_c8nf@zed>
References: <20260708170843.55076-6-birenpandya@gmail.com>
 <20260708170843.55076-10-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708170843.55076-10-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67107-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[ragnatech.se,kernel.org,glider.be,gmail.com,ideasonboard.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3073D72D7D3

Hi Biren

On Wed, Jul 08, 2026 at 10:38:48PM +0530, Biren Pandya wrote:
> The probe error paths and the remove function fail to call
> media_entity_cleanup() upon teardown.
>
> While currently a no-op, calling media_entity_cleanup()
> is an API requirement for entities initialized with
> media_entity_pads_init()
> to prevent memory leaks.

Here and in the other patches, why break the line ?

>
> Add the missing media_entity_cleanup() calls.
>
> Additionally, patch the error path in rzg2l_cru_media_init() to ensure
> that media_device_cleanup(), media_entity_cleanup(), and mutex_destroy()
> are invoked and the error code is correctly returned if
> rzg2l_cru_mc_parse_of_graph() fails, rather than silently returning 0
> and leaving the initialized structures lingering.
>
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 3c5fbd857371c..77b17bcf7aeb7 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -234,6 +234,10 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
>  		mutex_lock(&cru->mdev_lock);
>  		cru->v4l2_dev.mdev = NULL;
>  		mutex_unlock(&cru->mdev_lock);
> +		media_device_cleanup(mdev);
> +		media_entity_cleanup(&cru->vdev.entity);
> +		mutex_destroy(&cru->mdev_lock);
> +		return ret;

Mmmm, this is growing enough  to qualify for a label I guess...

Unrelated, but I wonder what

        mutex_lock(&cru->mdev_lock);
        cru->v4l2_dev.mdev = NULL;
	mutex_unlock(&cru->mdev_lock);

Protects against...

What do you think of reworking the error path to make it like

	ret = rzg2l_cru_mc_parse_of_graph(cru);
	if (ret)
                goto err_mc_parse;

        return 0;

error_mc_parse:
        media_device_cleanup(mdev);
        cru->v4l2_dev.mdev = NULL;
        media_entity_cleanup(&cru->vdev.entity);
        mutex_destroy(&cru->mdev_lock);
        return ret;

?

In this case, please reword the commit message accordingly, as the
patch won't just be about adding media_entity_cleanup() but rather
about reworking the rzg2l_cru_media_init() error path.

Thanks
  j

>  	}
>
>  	return 0;
> @@ -312,6 +316,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
>  	v4l2_async_nf_cleanup(&cru->notifier);
>
>  	rzg2l_cru_video_unregister(cru);
> +	media_entity_cleanup(&cru->vdev.entity);
>  	media_device_cleanup(&cru->mdev);
>  	mutex_destroy(&cru->mdev_lock);
>
> --
> 2.50.1 (Apple Git-155)
>

