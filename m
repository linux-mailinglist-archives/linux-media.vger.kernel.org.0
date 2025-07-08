Return-Path: <linux-media+bounces-37134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A46AFCFC2
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B658D188D267
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 15:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC052E2672;
	Tue,  8 Jul 2025 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jXMe0r3W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA46221D87;
	Tue,  8 Jul 2025 15:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751989921; cv=none; b=izycvOwn7itTKIPCYIBKIlEdiUzOus8c6Xje1U/8YJQwuPHJn6rqT8ZSSt0GRW3XMiSzvwMfUUgCBnXY6JD1GJiBz1QmAZOjh4dhFNrnJhqa9OmxqWue1k96SA3CnDO0xTfnKJhBPYFPxqsbIZ2ApUnpCD2Zre32Z3maxMIU3/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751989921; c=relaxed/simple;
	bh=YhjSlzE7p5RzxelE/zKz1IoT+TiBjRm46C932t1PGq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeuyecN7yWaPKg9wBmKE6w9phWUj6+USzRWU8LAGIQFUIXtwDlJH26g7epaqqWUkkjqc+f/PVdLJWpTymH+3r0Tdt09P6UJPnjzGeCS85i7gRPn1mKjsdCQUzYZD5OAG7o/nX11kJc5WWU9CspsfhfFYdF5YcR9nmDRHyBIsP+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jXMe0r3W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 197B54A4;
	Tue,  8 Jul 2025 17:51:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751989890;
	bh=YhjSlzE7p5RzxelE/zKz1IoT+TiBjRm46C932t1PGq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXMe0r3Wd+Wj7J3tpcOMG33iLNAM1OkY7VAmnZgqh4QztF6TmOORecuQoyd8xYYFK
	 KducOtlugFtFU+FWhC+NjG0yTFtu5YQaMrHPXjN3dG0MG1cskpt/PvW/erMkTnOk/M
	 ivyHaFTgLp4DFRIAOnqkX2K/+9rSdUZvUSzt2jfE=
Date: Tue, 8 Jul 2025 17:51:51 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 4/5] media: platform: Add Renesas Input Video Control
 block driver
Message-ID: <dy3eecuuaacidhpdcuo3nvt5gputvrvm2v7mkknngks4sppsjz@74lh37ymei7r>
References: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
 <20250704-ivc-v3-4-5c45d936ef2e@ideasonboard.com>
 <4yt5pvsft7hgkmzsm6febhr7tp2scui6lj2gqkiwklsugb4y2l@wribzukxkpqv>
 <f59029bb-ba62-4aaf-b53e-9a8cb4887d32@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f59029bb-ba62-4aaf-b53e-9a8cb4887d32@ideasonboard.com>

Hi Dan

On Tue, Jul 08, 2025 at 03:57:46PM +0100, Dan Scally wrote:
> Hi Jacopo
>

[snip]

> > > +
> > > +static int __maybe_unused rzv2h_ivc_runtime_resume(struct device *dev)
> > The driver doesn't depend or select CONFIG_PM, so this is rightfully
> > marked as __maybe_unused.
> >
> > However, it doesn't seem to me that the probe() routine manually
> > enable the peripheral, so in case of !CONFIG_PM am I wrong or the
> > device won't operate at all ?
> >
> > I would select CONFIG_PM, or otherwise call this function from the probe()
> > routine and then call pm_runtime_set_active() to inform runtime_pm
> > that the peripheral is active, and at the end of the probe routine
> > call pm_runtime_put_autosuspend(): in case of CONFIG_PM the peripheral
> > will suspend, in case of !CONFIG_PM the pm_runtime_put_autosuspend()
> > reduces to a nop leaving the peripheral enabled.
> Ack
> >
> > I would just select CONFIG_PM tbh
> I dropped it on Philipp's suggestion in the last review; I have no strong

I only see a comment from Philipp here
https://lore.kernel.org/all/8301d2862546507303e2dba1dd61906b848552c2.camel@pengutronix.de/
about the RESET_CONTROLLER. Have I missed other comments maybe ?

> feelings to be honest, I would expect it to be enabled in any configuration
> that was intending to use this...but I suppose there's no harm accounting
> for the possibility that it won't be

no harm no, but a bit more complex handling of the device power up
sequences.

