Return-Path: <linux-media+bounces-37180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B08F0AFE270
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 10:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 399F716C91E
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 08:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE14A26B752;
	Wed,  9 Jul 2025 08:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lR6YE0G8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE3523C4E7;
	Wed,  9 Jul 2025 08:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752049384; cv=none; b=a+A1pmhMp6SEXs3IM0KI7FGPI9kWXdj96uzNQdaZBq2+ldVcQRIuORmEan8/kw7hleJtXuUZOwaVXcerQfaqysn8eI3t/c6uX9PLUpxeRi7XECPFKvyYmUIcsG7CgaK16IL5yeXPFXWRky7mJEDs7uXH9wAHdkTdJU8RIOKYI98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752049384; c=relaxed/simple;
	bh=A9019nVfMSMLWI/CAsi4t7MlFGfUblRFvC7BXLtnNY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ut4HUKfRBQtRVEsfq8OLkw+3MTaOLdT+AJfDo+b3UX1cUMM7GKOwNSfVg2OooYN+1rYpR1U7juAEYTr+y+W5TeoTp9rcIWodbPunGUWRtj6t/lUvpLra4RzJezI6zzUiouhQmQQ3d0rVu+wjuY1N12lKS7azloo2m88qXTwZLVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lR6YE0G8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-141-178.net.vodafone.it [5.90.141.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C983C6AE;
	Wed,  9 Jul 2025 10:22:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752049353;
	bh=A9019nVfMSMLWI/CAsi4t7MlFGfUblRFvC7BXLtnNY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lR6YE0G8UAXi7ANPhtU0OYRJweRaxiSUxem23Zx6EUpQGDE9COJPD+pDdH7LJVFNE
	 waY8T0RgFs6brRyBK4oW2jRKGYxtWczy4hmctBOt3pLxk852pPcj5OQHaAbY5rCzDG
	 dVod6xWj5tfrW3O6dCd8kyrTAdSZXzH6St5FPd70=
Date: Wed, 9 Jul 2025 10:22:56 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 4/5] media: platform: Add Renesas Input Video Control
 block driver
Message-ID: <5ie24zvi6jupjn5hn3x642wmr25vleuercp4dxc6wxyatwxzke@5vpzqr7dnscv>
References: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
 <20250704-ivc-v3-4-5c45d936ef2e@ideasonboard.com>
 <4yt5pvsft7hgkmzsm6febhr7tp2scui6lj2gqkiwklsugb4y2l@wribzukxkpqv>
 <f59029bb-ba62-4aaf-b53e-9a8cb4887d32@ideasonboard.com>
 <dy3eecuuaacidhpdcuo3nvt5gputvrvm2v7mkknngks4sppsjz@74lh37ymei7r>
 <db08a8db-c7e5-4431-b83e-11a92ab3fe54@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <db08a8db-c7e5-4431-b83e-11a92ab3fe54@ideasonboard.com>

Hi Dan

  I recall Sakari in the past had opinions on platform drivers selecting
CONFIG_PM, let's cc him

On Wed, Jul 09, 2025 at 09:13:51AM +0100, Dan Scally wrote:
> Morning
>
> On 08/07/2025 16:51, Jacopo Mondi wrote:
> > Hi Dan
> >
> > On Tue, Jul 08, 2025 at 03:57:46PM +0100, Dan Scally wrote:
> > > Hi Jacopo
> > >
> > [snip]
> >
> > > > > +
> > > > > +static int __maybe_unused rzv2h_ivc_runtime_resume(struct device *dev)
> > > > The driver doesn't depend or select CONFIG_PM, so this is rightfully
> > > > marked as __maybe_unused.
> > > >
> > > > However, it doesn't seem to me that the probe() routine manually
> > > > enable the peripheral, so in case of !CONFIG_PM am I wrong or the
> > > > device won't operate at all ?
> > > >
> > > > I would select CONFIG_PM, or otherwise call this function from the probe()
> > > > routine and then call pm_runtime_set_active() to inform runtime_pm
> > > > that the peripheral is active, and at the end of the probe routine
> > > > call pm_runtime_put_autosuspend(): in case of CONFIG_PM the peripheral
> > > > will suspend, in case of !CONFIG_PM the pm_runtime_put_autosuspend()
> > > > reduces to a nop leaving the peripheral enabled.
> > > Ack
> > > > I would just select CONFIG_PM tbh
> > > I dropped it on Philipp's suggestion in the last review; I have no strong
> > I only see a comment from Philipp here
> > https://lore.kernel.org/all/8301d2862546507303e2dba1dd61906b848552c2.camel@pengutronix.de/
> > about the RESET_CONTROLLER. Have I missed other comments maybe ?
> Oh no you're right; I misremembered. Sorry for the noise!
> >
> > > feelings to be honest, I would expect it to be enabled in any configuration
> > > that was intending to use this...but I suppose there's no harm accounting
> > > for the possibility that it won't be
> > no harm no, but a bit more complex handling of the device power up
> > sequences.
>
> No problem; I'll just select CONFIG_PM.

You can then remove __maybe_unused from the function declaration.

>
>
> Thanks
>
> Dan
>

