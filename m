Return-Path: <linux-media+bounces-57444-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFJuKXntx2mcfAUAu9opvQ
	(envelope-from <linux-media+bounces-57444-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:02:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D534EC36
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8B05302F99A
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 14:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C926334C00;
	Sat, 28 Mar 2026 14:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CuR0Io7y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF77339866
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774709911; cv=none; b=BR+tm6R5SEbq+htyqqENbs/uPBC5A2xyCjwfPbP04mTDO/mSalk1OKqs64Qdc32e36A2Ja0nQQhFTrVGzKBE6b6lQE0m2rYVkR5mYONLqvFN+2Hu4X12O1xkp2tI1go5ukMcUFwD0PjFGqO3WoyxOd3/7wsA0C+bp0CepVMN0vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774709911; c=relaxed/simple;
	bh=TYj4WHoGPBNbKfyeNIcQDT3qln1vofTCuOl5SznEc28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YupBvMSM4dSpsjvgO+Ti2UeQlml7aCQdA896+puHyRNii/VSMtiHAjnymrImSi2RXZTaVRmk34WGq2L0Gv1MWJ5NEDFxSwbAD1nBMeQGFiOREKkxNhiaZo/NedoiEJG1eWMOB7+vBRS+FoI7NHrmfEpwnnEtHcgURFd//7Ojf10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CuR0Io7y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64E673DA;
	Sat, 28 Mar 2026 15:57:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774709821;
	bh=TYj4WHoGPBNbKfyeNIcQDT3qln1vofTCuOl5SznEc28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CuR0Io7yOujv8KwIzOp9X4cgrk3REiPux71MHv+fY9v5Zh6kAV3IwsCha8KtepVNK
	 4f1gDA/ExhpYhdjMLKW96OpCpSMyCXrRvMIBkl/tDWpwgO1bLZ0eAC5h/eKRhF2C0i
	 FVp1//svrZinkpJWIpUElavxa5fAKjsg7VFV6MQY=
Date: Sat, 28 Mar 2026 15:58:18 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: David Carlier <devnexen@gmail.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nayden Kanchev <nayden.kanchev@arm.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: mali-c55: add missing pm_runtime_disable()
 in remove
Message-ID: <acfrMuiiRdCTNoMw@zed>
References: <20260327150707.256752-1-devnexen@gmail.com>
 <20260327150707.256752-2-devnexen@gmail.com>
 <aca3Y6FHItK1cb9l@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aca3Y6FHItK1cb9l@zed>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57444-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,kernel.org,arm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F31D534EC36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David
  since you have to send a v4 anyway, would you care about also
powering off the device duing remove ?

I have a patch, but since you're already looking at this it doesn't
make much sense to pile another one on top.

Could you squash in the below suggestions ?

On Fri, Mar 27, 2026 at 06:01:29PM +0100, Jacopo Mondi wrote:
> Hi David
>
> On Fri, Mar 27, 2026 at 03:07:06PM +0000, David Carlier wrote:
> > pm_runtime_enable() is called during probe but mali_c55_remove() never
> > calls pm_runtime_disable(), leaving the device's runtime PM state
> > enabled after the driver is unbound.

I would use these as the commit message and the commit title:

    media: mali-c55: Power-off the peripheral in remove()

    The Mali C55 driver doesn't depend on PM. For this reason, if pm_runtime
    is not compiled in it is required to manually power-off the peripheral
    during the driver's remove() handler.

    Also pm_runtime_enable() is called during probe but mali_c55_remove() never
    calls pm_runtime_disable(), leaving the device's runtime PM state enabled
    after the driver is unbound.

    Manually power-off the peripheral in remove() if the peripheral has not
    been suspended using runtime_pm and disable runtime pm.

> >
> > Add the missing pm_runtime_disable() call to the remove path.
>
> The driver doesn't depend on PM, so we need to explicitly power-off
> the peripheral in remove() (and set the pm_runtime status to
> suspended)
>
> >
> > Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> This patch is however correct, I'll add the power-off on top.
>
> > ---
> >  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > index 5cb59c70ffc9..38b11d5ba168 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > @@ -859,6 +859,7 @@ static void mali_c55_remove(struct platform_device *pdev)
> >  	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
> >
> >  	mali_c55_media_frameworks_deinit(mali_c55);

And this should become:

+       if (!pm_runtime_suspended(&pdev->dev)) {
+               __mali_c55_power_off(mali_c55);
+               pm_runtime_set_suspended(&pdev->dev);
+       }
> > +	pm_runtime_disable(&pdev->dev);

Otherwise, if you want to keep your patch simpler, I'll add a patch
for power-off on top.

Thanks
   j

> >  	kfree(mali_c55->context.registers);
> >  	of_reserved_mem_device_release(&pdev->dev);
> >  }
> > --
> > 2.53.0
> >
> >

