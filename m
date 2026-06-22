Return-Path: <linux-media+bounces-65364-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2k5oIygjOWpynQcAu9opvQ
	(envelope-from <linux-media+bounces-65364-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 13:57:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D78D46AF401
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 13:57:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=pl+lMrxj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65364-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65364-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CA0230325B0
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BACC2E0902;
	Mon, 22 Jun 2026 11:57:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99722DA76C;
	Mon, 22 Jun 2026 11:57:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129442; cv=none; b=SxWlqF48FPwUmPHMLhok/wp2B36UQskqlspambFXLh9eoWqrb3UzVBxAQQea8pbl6cuTmvRV+PO+ODYHLIpNByULyR/ec9qC/INRIb+XDoZzZhVCwdv4QrXO0nv0m1ghfUPk12wPQR3ZSCZ++Calz3oX8XRnWN5MxNWlWGLgt68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129442; c=relaxed/simple;
	bh=motJcgx6Rp/JcX3QEyA5X2+wVGq3FES59TwBK2EswIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqNmDUOz7MTL5m68oBhvMvYh01x9uKq91Fh75KQco0+IbQRW64v45YMZL+FkEQyJrcZa4+SNQ6wtevokkMtS+JKYRWKjsbJHI0sf3HkfTDHs2XeC8OfVsb93yqGydMDodrnAcLyTgu5tYGFPxixhNQU0fXIaCx2vXaiFpM7ATzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pl+lMrxj; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F9B59CE;
	Mon, 22 Jun 2026 13:56:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782129401;
	bh=motJcgx6Rp/JcX3QEyA5X2+wVGq3FES59TwBK2EswIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pl+lMrxjzBpFEP/jWWQRSYs5tjwoHB/A4wPOxXRpryjZHYnQDXVF3tQSWJCIgOlaX
	 PBYxop4LABI/khAuLHRq/q/LbzdlxKFdQpAypA2w9XrBBko56dV115/yaoRiH+LpvF
	 6nnQ2scCCk56Hh6BE/aYiv1/ivpb3HGuZ8Rvcbjs=
Date: Mon, 22 Jun 2026 14:57:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Biren Pandya <birenpandya@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Subject: Re: [PATCH v2 1/4] media: renesas: rcar-csi2: Add missing
 media_entity_cleanup()
Message-ID: <20260622115718.GH3872967@killaraus.ideasonboard.com>
References: <20260619102241.22887-6-birenpandya@gmail.com>
 <20260619121729.24899-5-birenpandya@gmail.com>
 <ajjsrRVdvV-tkr-i@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajjsrRVdvV-tkr-i@zed>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65364-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:birenpandya@gmail.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linux.intel.com,kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D78D46AF401

On Mon, Jun 22, 2026 at 10:06:54AM +0200, Jacopo Mondi wrote:
> Hi Biren
> 
> On Fri, Jun 19, 2026 at 05:47:30PM +0530, Biren Pandya wrote:
> > The probe error paths and remove function are missing calls to
> > media_entity_cleanup(). Add them and introduce an err_entity label
> > to ensure teardown logic properly inverses initialization.
> >
> > Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> 
> Have you at least compiled this patch ?
> 
> ../drivers/media/platform/renesas/rcar-csi2.c: In function ‘rcsi2_probe’:
> ../drivers/media/platform/renesas/rcar-csi2.c:2634:1: error: label ‘error_entity’ defined but not used [-Werror=unused-label]
>  2634 | error_entity:
>       | ^~~~~~~~~~~~
> 
> Also, don't send v(n+1) in reply to v(n). Each version of a series
> goes in its own thread, with a proper cover letter and changelog.
> 
> I suggest to use b4.

Also, while it's OK to not send all patches of a series to everybody,
the cover letter must be send to all recipients.

> > ---
> >  drivers/media/platform/renesas/rcar-csi2.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > index 7305cc4a04cb..61d7dfe14688 100644
> > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > @@ -2631,6 +2631,8 @@ static int rcsi2_probe(struct platform_device *pdev)
> >  	v4l2_subdev_cleanup(&priv->subdev);
> >  error_pm_runtime:
> >  	pm_runtime_disable(&pdev->dev);
> > +error_entity:
> > +	media_entity_cleanup(&priv->subdev.entity);
> >  error_async:
> >  	v4l2_async_nf_unregister(&priv->notifier);
> >  	v4l2_async_nf_cleanup(&priv->notifier);
> > @@ -2646,6 +2648,7 @@ static void rcsi2_remove(struct platform_device *pdev)
> >  	v4l2_async_nf_cleanup(&priv->notifier);
> >  	v4l2_async_unregister_subdev(&priv->subdev);
> >  	v4l2_subdev_cleanup(&priv->subdev);
> > +	media_entity_cleanup(&priv->subdev.entity);
> >
> >  	pm_runtime_disable(&pdev->dev);
> >  }

-- 
Regards,

Laurent Pinchart

