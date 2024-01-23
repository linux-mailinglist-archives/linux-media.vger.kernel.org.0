Return-Path: <linux-media+bounces-4120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCF2839BF6
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 23:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 819F0B299FF
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 22:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289404F203;
	Tue, 23 Jan 2024 22:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZddDnMBI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8817D3A8F5;
	Tue, 23 Jan 2024 22:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706048236; cv=none; b=XqtZjg/D/mO4Cu77zZPaM8djDMJGJlb1UQ5S+BHlD3KKwmqSnR2wNONqv/KNAx2E/AMZ6VvgLWQKNg2GMlPOf5PETE1g+CTCAg3uj8vT+EatLSfFeJndEEU1ZRCRZ6JTZWd4r/xfCy9SC3mFgmwixwzx0huezq3EGYbuTStQvCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706048236; c=relaxed/simple;
	bh=ZYrkozOyLePsyDUHkFeLK+Ms9MTJKTDC30haTRwkBfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQVAO4OGIBUs7DImpXI5VwN2aCIGmYodfPBamOWTYEkA6Sc5yyqZFtRn+gw5yrTsUs5ES/tkihi3/JoVhqeXeiFEajEp5Ec7wgXcj68/Gr7gMyN1WpOBeaFR0A0+q4/QDtTMGdm47qkrNaF0laGPxSdg156P7D92G3+AeUhpkdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZddDnMBI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1AC71890;
	Tue, 23 Jan 2024 23:15:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706048157;
	bh=ZYrkozOyLePsyDUHkFeLK+Ms9MTJKTDC30haTRwkBfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZddDnMBIjyJ/f4w1rGaDYwbdRpJfJQZXc3qPnS/UpBP16aGtIwxAqIPjjshVmuwkr
	 PDjPjKjC6iKaaFsqY92yM29onhtS4+9+jBd9CxY9086SmMx3aQlemnFnZpHJ+ODwwi
	 ZcfowKlCok8fQG81IKdaprQxlEHX/JZE6HhXxAD8=
Date: Wed, 24 Jan 2024 00:17:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/4] media: platform: rzg2l-cru: rzg2l-csi2: Switch to
 RUNTIME_PM_OPS()
Message-ID: <20240123221709.GB16581@pendragon.ideasonboard.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-2-biju.das.jz@bp.renesas.com>
 <20240123152906.GP10679@pendragon.ideasonboard.com>
 <TYCPR01MB11269085947ED450E817D54BB86742@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYCPR01MB11269085947ED450E817D54BB86742@TYCPR01MB11269.jpnprd01.prod.outlook.com>

On Tue, Jan 23, 2024 at 06:33:57PM +0000, Biju Das wrote:
> > On Tue, Jan 23, 2024 at 11:58:18AM +0000, Biju Das wrote:
> > > SET_RUNTIME_PM_OPS() are deprecated
> > 
> > Not that I particularly care about SET_RUNTIME_PM_OPS, but I'm not aware
> > of it being deprecated. Has that been announced somewhere ?
> 
> I was under the impression from [1], this is new style and old style going to be deprecated.
> 
> If it is not the case, I would like to drop this patch.
> 
> [1] https://www.spinics.net/lists/stable/msg691416.html

I'm not against this change, I was just wondering about the status of
SET_RUNTIME_PM_OPS. If you think using RUNTIME_PM_OPS is better, I have
no problem with that. The commit message should probably state that the
latter is better, instead of saying that SET_RUNTIME_PM_OPS is
deprecated.

> > > and require __maybe_unused
> > > protection against unused function warnings. The usage of pm_ptr() and
> > > RUNTIME_PM_OPS() allows the compiler to see the functions, thus
> > > suppressing the warning. Thus drop the __maybe_unused markings.
> > 
> > Have you tried to compile this with CONFIG_PM disabled, and confirmed the
> > compiler doesn't generate any warning ?
> 
> I am not able to compile with CONFIG_PM disabled as it is throwing errors in power management code.
> 
> kernel/power/suspend.c: In function ‘suspend_prepare’:
> kernel/power/suspend.c:360:10: error: implicit declaration of function ‘pm_notifier_call_chain_robust’; did you mean ‘raw_notifier_call_chain_robust’? [-Werror=implicit-function-declaration]
>   360 |  error = pm_notifier_call_chain_robust(PM_SUSPEND_PREPARE, PM_POST_SUSPEND);
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |          raw_notifier_call_chain_robust
> kernel/power/hibernate.c:325:2: error: implicit declaration of function ‘save_processor_state’ [-Werror=implicit-function-declaration]
>   325 |  save_processor_state();
>       |  ^~~~~~~~~~~~~~~~~~~~
> kernel/power/suspend.c:372:2: error: implicit declaration of function ‘pm_notifier_call_chain’; did you mean ‘raw_notifier_call_chain’? [-Werror=implicit-function-declaration]
>   372 |  pm_notifier_call_chain(PM_POST_SUSPEND);
>       |  ^~~~~~~~~~~~~~~~~~~~~~
>       |  raw_notifier_call_chain
>   CC      io_uring/timeout.o
> kernel/power/suspend.c: In function ‘suspend_enter’:
> kernel/power/suspend.c:405:10: error: implicit declaration of function ‘dpm_suspend_late’; did you mean ‘dpm_suspend_start’? [-Werror=implicit-function-declaration]
>   405 |  error = dpm_suspend_late(PMSG_SUSPEND);
>       |          ^~~~~~~~~~~~~~~~
>       |          dpm_suspend_start 

I'm surprised. Sakari, isn't !CONFIG_PM supposed to be supported ?

> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > index d20f4eff93a4..c4609da9bf1a 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > @@ -834,7 +834,7 @@ static void rzg2l_csi2_remove(struct platform_device
> > *pdev)
> > >  	pm_runtime_disable(&pdev->dev);
> > >  }
> > >
> > > -static int __maybe_unused rzg2l_csi2_pm_runtime_suspend(struct device
> > > *dev)
> > > +static int rzg2l_csi2_pm_runtime_suspend(struct device *dev)
> > >  {
> > >  	struct rzg2l_csi2 *csi2 = dev_get_drvdata(dev);
> > >
> > > @@ -843,7 +843,7 @@ static int __maybe_unused
> > rzg2l_csi2_pm_runtime_suspend(struct device *dev)
> > >  	return 0;
> > >  }
> > >
> > > -static int __maybe_unused rzg2l_csi2_pm_runtime_resume(struct device
> > > *dev)
> > > +static int rzg2l_csi2_pm_runtime_resume(struct device *dev)
> > >  {
> > >  	struct rzg2l_csi2 *csi2 = dev_get_drvdata(dev);
> > >
> > > @@ -851,7 +851,7 @@ static int __maybe_unused
> > > rzg2l_csi2_pm_runtime_resume(struct device *dev)  }
> > >
> > >  static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
> > > -	SET_RUNTIME_PM_OPS(rzg2l_csi2_pm_runtime_suspend,
> > rzg2l_csi2_pm_runtime_resume, NULL)
> > > +	RUNTIME_PM_OPS(rzg2l_csi2_pm_runtime_suspend,
> > > +rzg2l_csi2_pm_runtime_resume, NULL)
> > 
> > While at it, I would wrap the line to
> > 
> > 	RUNTIME_PM_OPS(rzg2l_csi2_pm_runtime_suspend,
> > 		       rzg2l_csi2_pm_runtime_resume, NULL)
> > 
> > Up to you.
> 
> If it is not a requirement to move to use the modern pm_ops/pm_sleep_ops
> then as said in the above I would like to drop this patch.
> 
> > >  };
> > >
> > >  static const struct of_device_id rzg2l_csi2_of_table[] = { @@ -865,7
> > > +865,7 @@ static struct platform_driver rzg2l_csi2_pdrv = {
> > >  	.driver	= {
> > >  		.name = "rzg2l-csi2",
> > >  		.of_match_table = rzg2l_csi2_of_table,
> > > -		.pm = &rzg2l_csi2_pm_ops,
> > > +		.pm = pm_ptr(&rzg2l_csi2_pm_ops),
> > >  	},
> > >  };
> > >

-- 
Regards,

Laurent Pinchart

