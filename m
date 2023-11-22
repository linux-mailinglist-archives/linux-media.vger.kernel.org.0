Return-Path: <linux-media+bounces-823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD377F4873
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBDD828156C
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 14:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB5E4B5A1;
	Wed, 22 Nov 2023 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hXUBjRkC"
X-Original-To: linux-media@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B702101;
	Wed, 22 Nov 2023 06:02:50 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A49C20011;
	Wed, 22 Nov 2023 14:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700661769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NWBqSZ0d2/YYtI3gI0JVxUXQAtOv2ZHu2s8DSzjbYUI=;
	b=hXUBjRkC+zbu4gxz3FlLfskV2M9hDWhTvgbmgp50mfxfNrhQDvRlYkr+OiW5l0/723GtXS
	FEyKOthGV8afYUqry2TW3eGXoj8CU1IMixeno1gM7TldbmwB+QSix7NKAZVMGhuL+0i4x2
	rJQP01jVfEDSYgEHzm1bmgQe6vaYi6nGOO6r3bzp6OGteGB4Rrvblh8m8J4oXNdlua+fJR
	RWrSFGZaXBLEAeYnQWVbe0tNlalWRR3WphnOJWtJENXKZE7/eU+n6fiFebwwJdrb237IQW
	2fhWtssuFA5T7sYgaK4xORm5Bp1yZZJOj3isGKsnICAJHTdUBSrW+dnOSV0BWA==
Date: Wed, 22 Nov 2023 15:02:47 +0100
From: Mehdi Djait <mehdi.djait@bootlin.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Michael Riesch <michael.riesch@wolfvision.net>,
	Tommaso Merciai <tomm.merciai@gmail.com>, mchehab@kernel.org,
	heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com
Subject: Re: [PATCH v11 2/3] media: rockchip: Add a driver for Rockchip's
 camera interface
Message-ID: <ZV4KB7/TO66if41o@pc-70.home>
References: <cover.1700132457.git.mehdi.djait@bootlin.com>
 <db605935ad21c4780b73db87605b52d30bc936a4.1700132457.git.mehdi.djait@bootlin.com>
 <ZVz58b0r4gtxyVQy@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <9570dc1c-a437-46d4-95e7-1f3dd399e458@wolfvision.net>
 <ZV3_xe6A0v7kKgmo@aptenodytes>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV3_xe6A0v7kKgmo@aptenodytes>
X-GND-Sasl: mehdi.djait@bootlin.com

Hello everyone,

> > >>  create mode 100644 drivers/media/platform/rockchip/cif/Kconfig
> > >>  create mode 100644 drivers/media/platform/rockchip/cif/Makefile
> > >>  create mode 100644 drivers/media/platform/rockchip/cif/capture.c
> > >>  create mode 100644 drivers/media/platform/rockchip/cif/capture.h
> > >>  create mode 100644 drivers/media/platform/rockchip/cif/common.h
> > >>  create mode 100644 drivers/media/platform/rockchip/cif/dev.c
> > >>  create mode 100644 drivers/media/platform/rockchip/cif/regs.h
> > > 
> > > Just a logigistic comment on my side for now, sorry :)
> > > What about use cif-* prefix in front of driver files?
> > > 
> > > like:
> > > 
> > > cif-capture.c
> > > cif-capture.h
> > > cif-common.h
> > > cif-dev.c
> > > cif-regs.h
> > 
> > What would be the rationale here?
> > 
> > IMHO the files are in a folder named cif, so adding this prefix seems
> > kind of redundant.
> > 
> > That said, if there is a good reason I could live with cif-*.{c,h} as
> > well, of course. My only request would be to agree on something ASAP.
> 
> It's rather common to do that in Linux and one advantage is that it makes it
> clear in your text editor which driver you are looking at when only the file
> name is shown.
> 
> I don't have any strong opinion on this either though.

I see that the majority of the drivers are named like suggested. I will
change the names in the V12.

--
Kind Regards
Mehdi Djait

