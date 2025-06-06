Return-Path: <linux-media+bounces-34207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E160DACFE8D
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 10:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA7941767AD
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 08:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6152857EF;
	Fri,  6 Jun 2025 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5+qurqB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554E8265CC5
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 08:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199873; cv=none; b=DCqepp/RzMOCnBPhHf6lXyoraPGzTfEsSV+i8dnCHjqVZ5fiHGhi+C1Vf4E2fmusA+54aKZegsxodbi6hjXJ7NL1aNEfHPvZ4+tmAp83Nzm4yn48WDQnpW4OmAJqDZf3AE/izFpYUR78bvGTCIfohErzaA5+GULhj46w11Uaw4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199873; c=relaxed/simple;
	bh=8x6oMLhpEU6SE0dJgbU69gGoCEWo3BM6JaIDVdpjsWM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhmJm0g4maL945U/EHI2fCPXwDK3W91ZW9s/TXj/oECUFhuEx6/rCa8wSeqS62H4BqIclkxomrnTsG1AFf49UN6LOMygweuAvMpMerFOfu0ZyTULIJfRZ+kDsoUNqZoJaApWp7xq/rsaKwHxMP5Y7neP3+Adu8/FE+qHrDodfpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5+qurqB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCA4C4CEEB;
	Fri,  6 Jun 2025 08:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749199872;
	bh=8x6oMLhpEU6SE0dJgbU69gGoCEWo3BM6JaIDVdpjsWM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S5+qurqB3Rwl22DqJkT7/2Tc5HTnK9IKGrEPKL8hVXab4Wizoy/JH4b6MXijCZ1pz
	 nmG8TAy4/5z24H0FDTKlL0/oGKOojT+HUIeHTKMkUhz2sdoaiRWG5j/fsV5z2pGs8N
	 J2r5Thc3Q1735GyoC7eVQdBY/UTgBpp1j0O/yWFr8ylaCLeosAubpUOcddwdPwARC6
	 UyZGxe9iZngbCz5MAR0ju6K6I+3pyGwBCEh4va7hqliPvueOurST3B0Y0xL9lF5vLH
	 wq0KuMx9IwDFxUPoLpoKFfqa4xl9W/hNgNbWEoFYVclps7MRkWCT3zApCaCMwlVmoK
	 tz37mZZ9mZtpA==
Date: Fri, 6 Jun 2025 10:51:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil
 <hans@jjverkuil.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils] CONTRIBUTE: Add simple contribution
 instructions
Message-ID: <20250606105108.2578ac7b@foz.lan>
In-Reply-To: <CANiDSCtEiEe4J76tJzEv5dTNxVepTN22XCt7a6B-ncgxnVo3rA@mail.gmail.com>
References: <20250605-prefix-v1-1-450aff98308a@chromium.org>
	<20250605124635.GC29935@pendragon.ideasonboard.com>
	<CANiDSCs4B8ovA2jipUiDr3tC3SSCpJOownohx-X+UvD+2W2w9g@mail.gmail.com>
	<20250605131700.GA25847@pendragon.ideasonboard.com>
	<20250606095230.3a987c30@foz.lan>
	<CANiDSCtEiEe4J76tJzEv5dTNxVepTN22XCt7a6B-ncgxnVo3rA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 6 Jun 2025 10:08:58 +0200
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> Hi
> 
> On Fri, 6 Jun 2025 at 09:52, Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Thu, 5 Jun 2025 16:17:00 +0300
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> >  
> > > On Thu, Jun 05, 2025 at 02:54:33PM +0200, Ricardo Ribalda wrote:  
> > > > On Thu, 5 Jun 2025 at 14:46, Laurent Pinchart wrote:  
> > > > > On Thu, Jun 05, 2025 at 12:09:57PM +0000, Ricardo Ribalda wrote:  
> > > > > > In the media summit we discussed the need of a special prefix for
> > > > > > v4l-utils. This helps patchwork and media-ci.
> > > > > >
> > > > > > Create a new file with a brief introductions on how to contribute and
> > > > > > make the `v4l-utils` official.
> > > > > >
> > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>  
> > > > >
> > > > > I think this is a good idea. I don't know how we'll get users to
> > > > > actually use the prefix, but documenting it is a necessary first step.  
> >
> > It is a good idea, but I'd say that, if there is "v4l-utils" anywhere
> > at the patch series subject, media CI shall not change the patch
> > status. Same applies to the other userspace tools we maintain.  
> 
> media-CI only changes the status if the followings conditions are met:
> - There is no v4l-utils in the subject

Please check also for the other userspace tools we maintain.

> - The patch can be applied on top of media-committers
> - It does not modify any media file
> 
> Only if those 3 conditions are met, we mark the patch as
> not-applicable and send an email to media-maintainers about that to
> avoid false positives.

With the addition of the names of the other userspace tools, that's
OK!

Thanks,
Mauro

