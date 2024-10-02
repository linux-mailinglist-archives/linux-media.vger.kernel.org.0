Return-Path: <linux-media+bounces-18984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E95C598D084
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 11:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 122DD1C217F4
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 09:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0271E633B;
	Wed,  2 Oct 2024 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHBNQX07"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC5B1E632A
	for <linux-media@vger.kernel.org>; Wed,  2 Oct 2024 09:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727862800; cv=none; b=UcmyFIrRg8aYY6jS4UgoSl3eHc31Skp50thPk9tSYCrDtJg7tRKSOMr/thl601sS+3lKspMSJ+rOmUcPr9KvU+XfNhaq8rAIkA2YxacSJf7bweXTQsvcEkAt9H6/AmFikrmSXNzJe8mLXRp4cBbFhelBy9yRokDFfYfUVj+KawY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727862800; c=relaxed/simple;
	bh=FMqNs38lyKH4TOUBf8HHgLmgsUHPoWR1/XnDK5sFm3g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ExIyrL3rdqCZUMchc+Z46aBNfWdY+a6fe0DWFYzpcKNI/2VVPl7RPKioKH0fx3HDH0qXthclcZHLOC10Q5QHvD7QkxY4iEii9hqGtzE/eYQv4byaPPF2jXWwlg10rTWJ2+OrIeYEVpc/nAn+wxtmJAbHHmyjUpjQSMm2iU9RR4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHBNQX07; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260B0C4CECD;
	Wed,  2 Oct 2024 09:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727862800;
	bh=FMqNs38lyKH4TOUBf8HHgLmgsUHPoWR1/XnDK5sFm3g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qHBNQX07FkfeQyZekk/Ddt9LxMNjaqF5d3o/5DQwZT09Pojt7zfSDffc6FE8/6FG7
	 cWo+dfCpqX96c+GyRaLR6zzBBfMF9uw/fPDujVLBKFXS0pCf5pkBk1dMh8P4SS7f5A
	 X8ABTJFkuuS1F/XcmmA+51sPt931kUvfQ4sbP8vQl1iFFy5FIUV8rpaCvSk/F0GFxi
	 v2rkvuhY71IxffujP4earyiFQf+RfwyxHyLnYLWs+QNPH5DflIBAE5JezNRf6AEAeO
	 ixmFitHkhdBaOpe7KZp35cdUQxi4/sbUGgkby8PAZwDiw+eWorKZzJQ7bVtEkm7H8a
	 OQWhf+RQp98xA==
Date: Wed, 2 Oct 2024 11:53:16 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Robert Tiemann <rtie@gmx.de>, linux-media@vger.kernel.org, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Support for Si468x radio receiver
Message-ID: <20241002115316.416f2324@foz.lan>
In-Reply-To: <ed8c3d5f-2988-4aaf-a374-1d68805e87e5@xs4all.nl>
References: <ed03debb-163f-47df-99ec-9b62785172fc@gmx.de>
	<ed8c3d5f-2988-4aaf-a374-1d68805e87e5@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 2 Oct 2024 11:21:57 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Hi Robert,
> 
> On 10/1/24 15:35, Robert Tiemann wrote:
> > Hi!
> > 
> > We'd like to use the Silicon Labs Si4688 FM/HD/DAB/DAB+ radio receiver
> > chip in a product, but there is no kernel support for it yet. We have
> > the full datasheet and Si468x Programming Guide available, so it
> > should be possible to write a driver for that chip. The kernel
> > supports the Si4768 already (which can do AM/FM/HD radio, but not
> > DAB/DAB+), so I figured it should not be to hard to get the Si4688
> > supported...
> > 
> > Then I checked the kernel sources for how DAB+ radio tuners are
> > supposed to be handled by V4L2, but found nothing. Seems like V4L2 is
> > restricted to abstraction of analog radio tuners, and there is
> > currently no way to support DAB+ receivers. Is this correct or did I
> > miss something? The same seems to be true about FM HD (the
> > radio-si476x driver doesn't seem to support FM HD, only AM and FM).
> > 
> > Now, my question is, how should the FM HD/DAB/DAB+ parts of a
> > hypothetical radio-si468x driver be implemented? Since DAB is quite
> > different from FM, do we need a new tuner type in addition to
> > V4L2_TUNER_RADIO? Or just new V4L2_BAND_MODULATION_FM_HD and
> > V4L2_BAND_MODULATION_DAB definitions? Or is V4L2 sufficient the way
> > it is and I am simply failing to understand how it should work?  
> 
> First of all, I don't think we have any drivers that support DAB(+) today
> in the mainline kernel. My limited understanding of DAB is that it is actually
> something you would implement as part of the DVB API (digital video broadcasting).
> 
> I see a SYS_DAB in include/uapi/linux/dvb/frontend.h, suggesting that it is
> indeed something that should be part of dvb, but that's where my knowledge
> ends.
> 
> I CCed Mauro, he is the DVB expert, and he might know more about this.

Yeah, the best is to implement DAB support using DVB API. There are some
media drivers that support both V4L2 and DVB API, but, as we don't have
currently any driver using SYS_DAB, we'll probably need to add some
properties to handle it at the DVB frontend API.
> 
> Regards,
> 
> 	Hans



Thanks,
Mauro

