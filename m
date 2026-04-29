Return-Path: <linux-media+bounces-59911-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLISEQai8WmwjAEAu9opvQ
	(envelope-from <linux-media+bounces-59911-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:15:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA24948FAD2
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B905302D5DD
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 06:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8479333EB1B;
	Wed, 29 Apr 2026 06:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UmwI/ks0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E1037999D;
	Wed, 29 Apr 2026 06:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777443317; cv=none; b=hfdE/FbqDWgu8sbH2s4i9TFxTrUKvFaOLtBoxWzS9ZSAavVD+VzOq67V78wM412cQWTJbp7+n658gSiwe5zqWqNYfRLSLM6Pa0qySWx9oTvoJv5VsMKv4bH0FjFixz20Dtrr+xrcsIQ4D5icJpUPFdW1mOi5nLYiLrf/Yv0dAW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777443317; c=relaxed/simple;
	bh=E0rLcnJrp9Z37zcGd5gJlVqphBlGcRls1balcq+rPC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0AZa4XCVqc3ZH1TlOU2PSPWVH54tk3wI0ElulcwHbNdAL6L0OjTretOHEtpunowexEnf4IVf5GAkjJcBlabIW3/CA8ptzfsYhg9PUKoQGdI8SYuGf6GnkZyzmYbC6gEQzrYIewARWTCJEFLfY4zpasPqdu7ievY54NnnBPrA34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UmwI/ks0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C79F227;
	Wed, 29 Apr 2026 08:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777443200;
	bh=E0rLcnJrp9Z37zcGd5gJlVqphBlGcRls1balcq+rPC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UmwI/ks0Jg6z+pZO9hSA9d71M6i/WyhbvfNyy9ntw6daWwcs9ZSnx3IU0KeQeq0ye
	 JpoSO5QKqk6znkRtsvVcrAQlbosWhCF/dc/LcVB6OOp1IxdX6caQtbrrXcMEPdE1UL
	 bzj3MNLmkCNfPm/yAK/VAYeLXAY+r9S9NsKTbvfE=
Date: Wed, 29 Apr 2026 08:15:01 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 6/6] media: amlogic-c3: Add validations for ae and awb
 config
Message-ID: <afGgKdauTs8GFoWg@zed>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org>
 <20260428131038.GA120836@killaraus.ideasonboard.com>
 <CANiDSCvaS-Jz9m5H2OHo2akD-o-sffsZyEw6_CrfUhD1BN+m2g@mail.gmail.com>
 <20260428132649.GD120836@killaraus.ideasonboard.com>
 <CANiDSCv=sHfJAZNcmXkubAvjkMy4cL5Ez=zq9MRxTTRXRPECyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCv=sHfJAZNcmXkubAvjkMy4cL5Ez=zq9MRxTTRXRPECyQ@mail.gmail.com>
X-Rspamd-Queue-Id: AA24948FAD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59911-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hello

   thank you Ricardo for the fix

On Tue, Apr 28, 2026 at 03:49:49PM +0200, Ricardo Ribalda wrote:
> On Tue, 28 Apr 2026 at 15:26, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Tue, Apr 28, 2026 at 03:14:21PM +0200, Ricardo Ribalda wrote:
> > > On Tue, 28 Apr 2026 at 15:10, Laurent Pinchart wrote:
> > > > On Tue, Apr 28, 2026 at 12:41:12PM +0000, Ricardo Ribalda wrote:
> > > > > Avoid invalid memory access if the zones_num is bigger than
> > > > > zone_weight.
> > > > >
> > > > > This patch fixes the following smatch errors:
> > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > >  drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > index 6f9ca7a7dd88..42d780f684d1 100644
> > > > > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
> > > > >       c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
> > > > >
> > > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > > +     if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
> > > >
> > > > This is triggerable by userspace, it shouldn't result in a WARN_ON().
> > > > Ideally the horiz_zones_num and vert_zones_num should be validated at
> > > > buf prepare time, and an error should be returned to userspace. That
> > > > will likely not fix your smatch issue though, I don't think it will be
> > > > able to understand that the values have been validated.
> > >
> > > Based on the warnings from the other drivers I also suspect that if
> > > you have validated the data somewhere else smatch will understand it.
> > >
> > > Even if you add a validate function I would suggest to keep the
> > > WARN_ON(), ideally it should never trigger, and if it triggers it will
> > > get a lot more attention to get it fixed.
> >
> > We could keep the WARN_ON() if we first validate the data, but the
> > driver doesn't currently :-/ I expect there could be more similar
> > issues.
>
> Yep, I got that. I will let you or Jacopo figure out the best way to
> implement the validation in buf_prepare. If you do not have time to
> implement it now I will just remove the WARN_ON in the interim... but
> from my experience we only fix stuff if we get an oops.
>
> Regards!
>
> >
> > > > Jacopo, do we need to add a validate function pointer to
> > > > v4l2_isp_params_block_type_info ?

To allow drivers to provide an additional per-block validation
function ? I think it could be nice indeed.

Ricardo, could you spare this patch for the moment ? I think we can
WARN_ON() to please smatch but we should pre-validate the buffer (without
spamming the system log in case of errors) to make sure we actually
never hit the WARN_ON() :)

I have some patches in the pipe for v4l2-isp to add support for
extensible stats, I could pile up a few more to give drivers a space
where to implement additional per-block validations

> > > >
> > > > > +             zones_num = C3_ISP_AWB_MAX_ZONES;
> > > > >
> > > > >       /* Need to write 8 weights at once */
> > > > >       for (i = 0; i < zones_num / 8; i++) {
> > > > > @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
> > > > >       c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
> > > > >
> > > > >       zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> > > > > +     if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
> > > > > +             zones_num = C3_ISP_AE_MAX_ZONES;
> > > > >
> > > > >       /* Need to write 8 weights at once */
> > > > >       for (i = 0; i < zones_num / 8; i++) {
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
>
> --
> Ricardo Ribalda

