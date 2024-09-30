Return-Path: <linux-media+bounces-18861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FA398A3C9
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D78AE1F2724B
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB52190056;
	Mon, 30 Sep 2024 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rUoVx6PV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EA218FDA3;
	Mon, 30 Sep 2024 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727700997; cv=none; b=KC8ZmbMW2FH7M83HX23/q0uc+vg6LtHoMWa4xp8VcL/YZmX0bthV759Ky69qsOmVzSMmHoAn/k2y+zuIikcsaL1q7Ue6OBwIb8iV+yVVvoWZg8PcIjStXUxxoNHbekkEYfB8PGHeFK6+cr0RtMEmoEM5MwD/MFNchJX2Xp3FbOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727700997; c=relaxed/simple;
	bh=86l+n3oUOCw3cRUKaIVSOwRNK+3sfcj6behnUqpUl4U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IaErp4JN5rXsWjaYu/fOVUzO+RkZ2k6FPPmcSaxyxdNtEHRIRg0uohJXbRTFqI9w/vDc2v+iGlfHWXHMkKnMYmXQZzVekdk4OUcUCHUozRhb1tW6mpjFLX8yiNeDkwvVwWTn7vPYyxoE7fsaF82cUnooxNsi45/+YPX6fdKqx+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rUoVx6PV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D88C4CEC7;
	Mon, 30 Sep 2024 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727700996;
	bh=86l+n3oUOCw3cRUKaIVSOwRNK+3sfcj6behnUqpUl4U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rUoVx6PV6rUDCc6U4wZInfOCNP8K9UdicEzWn6HmqDWqtSHMeG0hQyJJSrrhT6xmq
	 3u/bHlw9T6wv1VV1oSFimbRei++Uxh8fHUdGmMVbW7+UaoOgNJZh8qIUNx2f38wkDz
	 0i4O+1yL5J6l5J8D0oZqI2JpEKkFIF2F46znp5YvyMYSJ6SjDRQ6/FqZgEdmeHZN9O
	 35XEnqQRb+eXZPluuW71hMkfQdJ/fEhfcRWCOV+TG9VBRyVa0W6TZJqaovdfxZkzMS
	 0ZSJpYFwGpNxgLdckGd45p3qyC3hlcPqPV4kJ1PCA1dVhJ4jsfm8zOGX0J+6Qy0sye
	 OjZviUqSTgiog==
Date: Mon, 30 Sep 2024 14:56:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda
 <ribalda@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu
 Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Andy
 Shevchenko <andy@kernel.org>, Mike Isely <isely@pobox.com>, Olli Salonen
 <olli.salonen@iki.fi>, Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young
 <sean@mess.org>, Sergey Kozlov <serjk@netup.ru>, Abylay Ospan
 <aospan@netup.ru>, Jemma Denson <jdenson@gmail.com>, Patrick Boettcher
 <patrick.boettcher@posteo.de>, Ming Qian <ming.qian@nxp.com>, Zhou Peng
 <eagle.zhou@nxp.com>, Andy Walls <awalls@md.metrocast.net>, Michal Simek
 <michal.simek@amd.com>, Jean-Christophe Trotin
 <jean-christophe.trotin@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Tim Harvey <tharvey@gateworks.com>, Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot
 <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Niklas
 =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund+renesas@ragnatech.se>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 00/45] media: Use string_choice helpers
Message-ID: <20240930145446.10d832e9@foz.lan>
In-Reply-To: <20240930124619.GG31662@pendragon.ideasonboard.com>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
	<20240930122157.GF31662@pendragon.ideasonboard.com>
	<4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl>
	<20240930124619.GG31662@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 30 Sep 2024 15:46:19 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> > >> Cocci has located some places where the helpers can be used. This
> > >> patchset uses the diff generated by cocci, plus these changes:  
> > > 
> > > Personally I think most of those helpers just hinder readability for not
> > > much added gain. String de-duplication is done by the linker already.
> > > The only value I see in the helpers is ensuring that the strings are
> > > consistently written, and I think we can do so through other means.  
> > 
> > Just my opinion: I'm OK with these new helpers,  
> 
> Coding style opinions are personal preferences of course :-) My opinion
> is that this hinders readability for no benefit.

Agreed. New code somewhat obfuscates what it does with no benefit
except maybe saving a few bytes on each drive.

Thanks,
Mauro

