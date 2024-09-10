Return-Path: <linux-media+bounces-18067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E1D973299
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 12:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE60C286979
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 10:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA30197A99;
	Tue, 10 Sep 2024 10:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fTy9BUaF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C16172BAE;
	Tue, 10 Sep 2024 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963537; cv=none; b=ip6pFy4OIFH4ftH59ohWC9KynOPvavRprPyWW4DzxwqS04UNZmVz2POgH1HvTXzliB1LTcSWtWasQKfBQEiA7M4oSVPEhH8r3YF/q2lwH8LXhr/wHwKJ8ifo9djSaX7SGJqERQJ1TyOaYYiB047aQN2t0BZAQRreigwQm5wnn3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963537; c=relaxed/simple;
	bh=aJ1k/F8YDt/bGKW3O/jYwKwGwBrRW2D3DV2RXryYuFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfCTtxqvITqxi2BjwBT5xery2PxlwMReEHXrMauUdpHqMuV/hPayszfPnPfzilTYUGn2ryOx7T0YpplFVJq9Fe0EUjYJgYHkj78HwUK0WM3HTlBTXfEucs5GkmuZ40TOvPPMpVTbAWtMBo2iwwby5Cd4FxqsnUb5/ud+wn5qWGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fTy9BUaF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEC5263F;
	Tue, 10 Sep 2024 12:17:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725963456;
	bh=aJ1k/F8YDt/bGKW3O/jYwKwGwBrRW2D3DV2RXryYuFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTy9BUaF30nyMnIDVlpDx2jbZPXG9aHaa0rcf3zxv7qMOIfDaSJMp8PIW6c5/GtZr
	 qkVU06IS6fBuR+6Zy8AfG65q3V2tVn3tBYFuCuFnG6eCansEqaf64lp6I3ek8cGGNj
	 EE8F6HTURmeZsidqHKg6H9TjwitrVA+HRIdWEMqI=
Date: Tue, 10 Sep 2024 12:18:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Naushir Patuck <naush@raspberrypi.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/4] media: raspberrypi: Add support for RP1-CFE
Message-ID: <csfjh3rdhdieemasmfjmvuy4uaypvbct7y7vm2zogdgmglsc56@u7yzkyrbuthz>
References: <20240905111120.GK16183@pendragon.ideasonboard.com>
 <40cc1e95-b9fc-4c27-9428-1698d0bf9d25@ideasonboard.com>
 <763b3147-d7cb-44a7-b73b-8f7f4fd622ab@ideasonboard.com>
 <yib2r4wisxvk3kgogbjqawrpmfq6lcezfk4xjmftj44jzkbclc@icapodv2ffzk>
 <d5188c0a-4a52-4378-89b1-48f606e448cc@ideasonboard.com>
 <ggtlreq5gyhzfdv6yzeuia46y7fxpuyvg236prig52t43xsl2a@crlqks2nhfpe>
 <20240909134516.GA9448@pendragon.ideasonboard.com>
 <Zt8ZysTT5DIZr-J7@kekkonen.localdomain>
 <jdtjdspf4qyrgn6jmyxeab5ueo53wjd5vuhvlpin3pdiyifwht@dndfcqnmv7sd>
 <49e375a3-d8e4-4b58-9456-1e6395b02a07@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <49e375a3-d8e4-4b58-9456-1e6395b02a07@ideasonboard.com>

Hi Tomi

On Tue, Sep 10, 2024 at 12:56:38PM GMT, Tomi Valkeinen wrote:
> On 10/09/2024 12:19, Jacopo Mondi wrote:
>
> > However, I think this current patch is correct (assuming the above
> > reasoning on i2c sensor drivers is correct) and doesn't require
> > CONFIG_PM, so I would be tempted to keep this version.
>
> I think the existence of this discussion alone proves my point that we
> should only support PM-case, unless !PM is a requirement =).
>
> But if you do want to keep !PM:
>
> Is there a reason why not mark the device as active with
> pm_runtime_set_active() after calling pispbe_runtime_resume and before

cargo-cult ?

> accessing the device? That feels like the most logical way to use the
> function, and it would be right regardless whether the core will enable the
> parents before probe() or not.

Possibly more accurate, but there's no guarantee it's correct. The
peripheral might have requirements on the clock or power rails
enablement order and some might be managed by the parent. I know we're
talking hypothesis but my point is that there's not correctness
guarantee we can enforce unless the parent is powered up when the
device probes ?

Anyway, I'll defer the call to the group: either keep the patch as it
is right now on the list, or go full runtime_pm. I understand there is
no reason to care about !CONFIG_PM but somehow I feel "bad" in listing
it as a dependency if the peripheral can actually work without it.
Maybe I should just ignore that feeling ?


>
> And not related to the BE or CFE drivers, but it strikes me odd that to
> support PM and !PM we need to play with these tricks. I think the core
> should just do the right thing if the driver does pm_runtime_get_sync() even
> with !PM (although maybe the time has passed to be able to do that).

I wish that was the case.

>
>  Tomi
>

