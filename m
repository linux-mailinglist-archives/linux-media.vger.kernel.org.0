Return-Path: <linux-media+bounces-61569-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJSZM1GBBWrjXgIAu9opvQ
	(envelope-from <linux-media+bounces-61569-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:01:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCB953F064
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 270323019822
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B243B6BEB;
	Thu, 14 May 2026 08:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D+L4ENID"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3623F413B;
	Thu, 14 May 2026 08:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745675; cv=none; b=kOYWdKp6CE8LcAFQwpF+vBn2UhbfdLv4HW/ZkE8C+ipUZY8NogmBE8/5Ik5i69iRwmyscq0w2xIuWla/+KSLHfBVB5SsAi6zcHevvsQUBmbD7NPb6zu7kw6Ut+r0dRxMx0P0pK5KZbHs968mTcmQod6ZozazDyjiTTPwF4WeCVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745675; c=relaxed/simple;
	bh=LBjYh0WyTrCmwMWHfUohe1fuFl6BoJ/p5bOEjPTnQKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrFOpsbPK+7YsfjEQjTL+/hPKlBnDfUOUBFabx9vsSrt5Dbv12RIp2Xl80vhDk8Y4+1120gdS70nAzzM1HLooHpJZAFjYc4hEtjTaGt8I6/wAbcc2zPfBnphfXNDafHbsS8A6rK0d5B4yHMz9tYFnVNUyDy9G452tCIhdIsXGjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D+L4ENID; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BB811283;
	Thu, 14 May 2026 10:01:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778745663;
	bh=LBjYh0WyTrCmwMWHfUohe1fuFl6BoJ/p5bOEjPTnQKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+L4ENIDLel4nvuFIOeYw7UR3zh80t5L5evdJnQTHezjNCN1VsOfmGKft6YsSWIr7
	 vqEi9Bq8sx3oowCWYEVhHccO+kJquf1PDaHkZ2lVorwWaAgpl6hW+ZM0JvhF5KI0as
	 G0WUkYnTr+C69q7FlZ2KZvHAROtz8t1bh7IK24Xk=
Date: Thu, 14 May 2026 10:01:09 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Steve Longerbeam <slongerbeam@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] media: i2c: ov5640: Set exposure minimum and
 defaults
Message-ID: <agWA7eGkbUkOEwZG@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
 <20260501-ov5640_cleanup-v1-2-0869a7802a33@ideasonboard.com>
 <agV_cPZeRh-BI1NW@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <agV_cPZeRh-BI1NW@zed>
X-Rspamd-Queue-Id: 0BCB953F064
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
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-61569-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 09:58:43AM +0200, Jacopo Mondi wrote:
> Hi Kieran
>
> On Fri, May 01, 2026 at 04:39:04PM +0100, Kieran Bingham wrote:
> > A zero exposure would be a fully black image and not useful as a sensor.
> > Increase the minimum and default control values to sane parameters.
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 01ea6b2bfeeb..b5e529ea662b 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -3479,7 +3479,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> >  						 V4L2_EXPOSURE_MANUAL, 0,
> >  						 V4L2_EXPOSURE_AUTO);
> >  	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
> > -					    0, 65535, 1, 0);
> > +					    4, 65535, 1, 1000);
>
> Where does 1000 come from ? The register default is 512, should we use
> that value ?
>
> Also, is the 4 lines step value correct ?

Sorry, this is the minimum of course. How did you pick 4 ?


>
> >  	/* Auto/manual gain */
> >  	ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_AUTOGAIN,
> >  					     0, 1, 1, 1);
> >
> > --
> > 2.52.0
> >
> >

