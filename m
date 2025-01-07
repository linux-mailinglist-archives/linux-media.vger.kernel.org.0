Return-Path: <linux-media+bounces-24329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C04A03C9F
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 11:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D1FD3A1F73
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 10:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641F51E4929;
	Tue,  7 Jan 2025 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="UcmPnSMQ"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6431DE4F1;
	Tue,  7 Jan 2025 10:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246344; cv=none; b=l9pKkn3SzlIUDFODREPVyQS3aTTy3zXCOJBjwJzhxbSbK3OACjU58YN6h57a3o4CCdxHcFH79rAhpEo6+EwtmuqQ7QAB8dhQjmVclvDWy2N47m3ADVqNojkXDCaxJ2cex6kU+QqWC9URKZz3ItXveU4EU9FbEGC3DXZcD8VWkDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246344; c=relaxed/simple;
	bh=+idnI7ORUQPTBfdeA3MSGyFmW9zVZcE5vYifktjkSPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEfteor8yn7MdVM9FFJ5zsnSGcp8wguBZBFYhkdVOFo30Y/9FgMTjm5U4HH/N1GA7tgD9Ee85A20OnjeozAWt6Ga3srvc+n7i4qzkVrfvCZB2oRnbuKRjaluoz4FETSVMqfhdqa+ADNxAgMdCfoTToLVb4DAWP1Y6Z0FAFwhM3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=UcmPnSMQ; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1736246339; bh=+idnI7ORUQPTBfdeA3MSGyFmW9zVZcE5vYifktjkSPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UcmPnSMQfuy3DSMuGZ3OVgJ/B+lc81iGCJhHum3EtRnM9HVEVJ/LFyqBCTglBKjF3
	 s/3TAobzEkpk8uORuzVJxBJdOJyBn58srqYBxSM36IB9YNuI0mx9s/Np20BjV8nYlP
	 muconSJmjwSsLXT53/Um8Pyw7gRI/Zz3TOa/LnOSpfzVZK0RIVb+WVw/h6aU8RA+mQ
	 xi6r6InhthId7fyAp66c0k6fqR59bKVdVkCzmv485XC13SdFPMZHPiBC7qDwftOEHK
	 vILnHuxonLcNh6Dh/UMThPzHT86KXoyn5HEdOWZa1lyxRRdBHbgriwRNAUPzEXtBUz
	 y0UBXSZb357FQ==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 164C91002BF; Tue,  7 Jan 2025 10:38:59 +0000 (GMT)
Date: Tue, 7 Jan 2025 10:38:59 +0000
From: Sean Young <sean@mess.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	mchehab@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: lirc: Fix error handling in lirc_register()
Message-ID: <Z30EQ2BabFjYOj81@gofer.mess.org>
References: <Z3u2zVQyammNo_o3@gofer.mess.org>
 <20250107015143.655306-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107015143.655306-1-make24@iscas.ac.cn>

On Tue, Jan 07, 2025 at 09:51:43AM +0800, Ma Ke wrote:
> Sean Young<sean@mess.org> wrote:
> > Hi,
> > 
> > On Sun, Jan 05, 2025 at 06:01:01PM +0800, Ma Ke wrote:
> > > When cdev_device_add() failed, calling put_device() to explicitly
> > > release dev->lirc_dev. Otherwise, it could cause the fault of the
> > > reference count.
> > > 
> > > Found by code review.
> > 
> > Interesting find, thanks for finding and reporting.
> > 
> > So I think the idea is right, but there is a problem. lirc_release_device()
> > will do a put_device() on the rcdev, but no corresponding get_device() is
> > done in this code path.
> > 
> > 
> > Sean
> Thank you for your reply and suggestions. Following your instructions,
> I took a close look at the code. Perhaps you meant to suggest removing
> the put_device() call from lirc_release_device(), effectively making 
> lirc_release_device() an empty function? 

That would introduce a memory leak and presumably the rc device would never
be cleaned up, so no I don't think that would work.

I'm not sure what the right solution is yet.

Sean

