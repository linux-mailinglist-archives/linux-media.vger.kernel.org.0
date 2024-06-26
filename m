Return-Path: <linux-media+bounces-14198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9E5918DAB
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 19:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5C541F242AE
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 17:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50E2190079;
	Wed, 26 Jun 2024 17:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JeNdukrt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D247190069
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 17:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719424618; cv=none; b=lwbZ+FXMR232q5i3bkoqCeT7qCsIQkgzcgk1ifvfQAwN+BqJNVlVXkJx+IGdbNLIwvkasJpllzZfEE8fE1IvTueoggFaGnJUVq0VKvWmAqqeXlrs4kj/RSK3sjPgvALeoc2B/KQ6LYB3LpVxXYW5/FuljRg64CRaZWSSFEddC0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719424618; c=relaxed/simple;
	bh=8eytwYiEFQWIZ8cL7YLym9eoQNHg1tf73UNx9KU7DP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LunIqzNLKnpVplr/UDHMuBihcjrWprgqSTZLoRAFjY8aIb5OaZ5i5b5fjj501uESvrkw0pNxDaumnA61njbvQrtcnHkl+LJv0rhAQ8wn2+0E/Yehf8FdTvFAEMDry9aZ74UARDExEFGKyqazfnj2jZPSYABzfvkOKzfq8r4fi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JeNdukrt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 887864CF;
	Wed, 26 Jun 2024 19:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719424590;
	bh=8eytwYiEFQWIZ8cL7YLym9eoQNHg1tf73UNx9KU7DP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JeNdukrtTymu+ifl6/ooSkxu627j7qlBn8rwaFwYSxB/k5HGAv6da0fJnY/hlpZya
	 vtEv7LRo6hzwdgecL6wE7pmZxzdEzGTJ3g92jNF2fiYauX0LOAdRVdpjSJs9tIlc0S
	 7AyV50rF6uYqWRv452xWW6JPrBFlybLkA1mr4dqQ=
Date: Wed, 26 Jun 2024 19:56:51 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, David Plowman <david.plowman@raspberrypi.com>, 
	Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v10 6/8] media: dt-bindings: Add bindings for Raspberry
 Pi PiSP Back End
Message-ID: <arxitdywhgsfxlebvnhbb6ehdoyaux5z4urwbj5oa63tnkvwbs@fuch3t3zafxz>
References: <20240626160144.87871-1-jacopo.mondi@ideasonboard.com>
 <20240626160144.87871-7-jacopo.mondi@ideasonboard.com>
 <CAL_JsqKe1UHEBuwxXRg1tB-1StJ6C2_ixEbmQCR+e_Zmkcrjig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKe1UHEBuwxXRg1tB-1StJ6C2_ixEbmQCR+e_Zmkcrjig@mail.gmail.com>

Hi Rob

On Wed, Jun 26, 2024 at 11:49:59AM GMT, Rob Herring wrote:
> On Wed, Jun 26, 2024 at 10:02 AM Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
> >
> > Add bindings for the Raspberry Pi PiSP Back End memory-to-memory image
> > signal processor.
> >
> > Datasheet:
> > https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Sigh. Use get_maintainers.pl and send to the right lists/people so
> that automated tests run.

Ah ups sorry, I dropped the dt list after this had been reviewed a
long time ago. I'll add it back

>
> I know I didn't review this without that happening.
>
> Rob

