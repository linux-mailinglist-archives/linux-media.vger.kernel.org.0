Return-Path: <linux-media+bounces-13211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 639AE907CE5
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 21:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09A41286221
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 19:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C807BAE5;
	Thu, 13 Jun 2024 19:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/29w/Ek"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9555A12E61;
	Thu, 13 Jun 2024 19:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718308104; cv=none; b=go20rwfs6hhANtgrk05JQOjYzxHt7WUQu6pCvyu+3DvPdeOWkB/b11sANNLoQN6oqaBryZ2nQm1EBmLp4O5k7wA0jeLkmE7FUz8UPHs9i36wefxlbMdeVsMcKSNB1Lyxwcmr4Uq/MXnyoEt9tT/rc75jPUx9ZNnF99pYOFwS1iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718308104; c=relaxed/simple;
	bh=d5k7qeBB3qAzuzjjyeGZ3zW/UhPAaVxxOu//yIZx5YU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hur5KbxUZjFZBRDpNaRqQodv0ovtzjeE/Ur94pKUbBwbtBjLyZiT1SV1JItsi+57p+DHOORRPt9MXJT6MFCsWBtR9U9HhUt8IKKmR5gTyQNFEoNj6NB2ECdcOOX4NuKoUHK6i9RFbWDni6/8vyAlx4NN6Syws3zrMLvfzXZe+FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/29w/Ek; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BABC2BBFC;
	Thu, 13 Jun 2024 19:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718308104;
	bh=d5k7qeBB3qAzuzjjyeGZ3zW/UhPAaVxxOu//yIZx5YU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V/29w/EkouTsMlONN0IQowRokIusbn9ZLB7zJofW/jgftLyZOEqaTjHWxPJTcmmWq
	 dzW1o8obFpFgtqhc3Ev3MQoA7j1NbWdUhCIh1oFZE9UZDximuHWr2WbYytPB3+irFt
	 2qHpVvAFYerq/5pexj6mTCv8BiMej16iNqPvFU4+MsFH9kuze027Yi51JpYK+sRKd/
	 MisyvMzLawmIe43YfO1jcs1HjLZx0MN2JGTJa28doXZtx9HeXuIPk97lm92jDZ4e2G
	 wHLdWruTI01517dCGo5R6rj8lRfJwAs8hyGt8518xbXmW9Du5ElFQx/AcRN51nFSMS
	 OGOX0y4Iaiu+g==
Date: Thu, 13 Jun 2024 21:48:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, Andy
 Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v6 05/49 RESEND] media: atomisp: Switch to new Intel CPU
 model defines
Message-ID: <20240613214819.13f8e1f2@coco.lan>
In-Reply-To: <SJ1PR11MB6083C042F658644B304C1A13FCC12@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20240611173406.352874-1-tony.luck@intel.com>
	<38336785-cb59-464f-b2a7-49812f4c2ce0@redhat.com>
	<20240612172355.11c470a3@coco.lan>
	<SJ1PR11MB6083C042F658644B304C1A13FCC12@SJ1PR11MB6083.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 13 Jun 2024 15:35:57 +0000
"Luck, Tony" <tony.luck@intel.com> escreveu:

> > > My intent is to get this send to Mauro (media-next) in time
> > > for the 6.11 merge window.  
> >
> > Hans,
> >
> > It seems that you already acked to this one, right?
> >
> > If so, please add my acked-by, if this will end being merged
> > via some other tree.
> >
> > Tony,
> >
> > I don't object having this merged via your tree with Hans
> > ack.
> >
> > We may also have it merged on media via Hans tree. He usually
> > send me one or two pull requests per Kernel cycle with lots
> > of atomisp patches on it.  
> 
> The only tree I currently have that feeds to linux-next is the RAS tree
> I share with Boris. This doesn't belong there.
> 
> I'm asking various subsystem maintainers to take these through
> the appropriate trees and having quite good success. This patch
> is one of seven looking for a home.
> 
> So please take it through the media tree.

Ok!

I'll pick it and merge it.

Hans, no need to pick it on your tree ;-)

Regards,
Mauro

