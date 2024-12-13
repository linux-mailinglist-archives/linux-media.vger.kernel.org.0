Return-Path: <linux-media+bounces-23376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D00D9F0A86
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 12:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9DA9188A7AE
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 11:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3021D88DB;
	Fri, 13 Dec 2024 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L0EtYUeh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC781C4A17;
	Fri, 13 Dec 2024 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734088343; cv=none; b=J9QRJcIxdpSBFKYSVctCH+DbJUtODra8mnN5iVssDAvRbq+ywaLndAfgtJDr9jrY6+SZZVJnirSz3lNuBqZ4BO+gxx4QHxK6dBZXfUkjeK4rK+iEoy1+0NwdxW+JRWqjXlKTyipLfi0/Dv+pHYmzgKOzFsrjX4MPtAsty+1YYVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734088343; c=relaxed/simple;
	bh=S9uT282d1tR0BVxh+b3RkmobojVIPvPqNJ0Idd/cOqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAN9QAovuTOKc3I6RZ2nRjijNyOuLaa6GLvnRsCfXkEvm5XP8WxN58Rznfi6LTQIJFZyWHqMszdLB8pfWgcBmXchHFNlt76mBCahnFPGcJXNCZnhqNkxpuSqdYniluDSXA/swewqfF24sJnX0BifokUeHixQvGb1mVf00AtwSKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=L0EtYUeh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328E9C4CED0;
	Fri, 13 Dec 2024 11:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734088342;
	bh=S9uT282d1tR0BVxh+b3RkmobojVIPvPqNJ0Idd/cOqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0EtYUeh3OC2Dy5+uI1mB0FFrQa4HTIhACvXhesaIzrW33XX0EbP5lnSuPImkZvLK
	 p7JxNrdcfrttXJWrD1MMJGOOoi4WBhPvqakuUviuctxoccf3d+KUOknuVpi7+PJhUb
	 jvhzpAgXwZDpmZt0VUdpaLeuTOMgbkzMYYKtVsb4=
Date: Fri, 13 Dec 2024 12:12:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, monstr@monstr.eu,
	michal.simek@xilinx.com, git@xilinx.com, stable@kernel.org,
	Sam Bobrowicz <sam@elite-embedded.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	"open list:V4L2 CAMERA SENSOR DRIVERS" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2] media: ov5640: fix get_light_freq on auto
Message-ID: <2024121303-arrange-hydration-7cf4@gregkh>
References: <2e79be9185cbb0dbe40e670eee996cf290bab0a6.1732264079.git.michal.simek@amd.com>
 <Z1v2VRzgUVpHZvXR@kekkonen.localdomain>
 <05ce02de-6eed-4f28-8052-56ca9cac4b64@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05ce02de-6eed-4f28-8052-56ca9cac4b64@amd.com>

On Fri, Dec 13, 2024 at 11:30:38AM +0100, Michal Simek wrote:
> Hi Ailus, +Greg
> 
> On 12/13/24 09:54, Sakari Ailus wrote:
> > Hi Michal,
> > 
> > Thanks for the patch.
> > 
> > On Fri, Nov 22, 2024 at 09:28:01AM +0100, Michal Simek wrote:
> > > From: Sam Bobrowicz <sam@elite-embedded.com>
> > > 
> > > Light frequency was not properly returned when in auto
> > > mode and the detected frequency was 60Hz.
> > > 
> > > Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> > > Signed-off-by: Sam Bobrowicz <sam@elite-embedded.com>
> > > Signed-off-by: Michal Simek <michal.simek@amd.com>
> > > Cc: <stable@kernel.org>

That address is totally acceptable.

> > Cc: stable@vger.kernel.org
> > 
> > And right after the Fixes: tag.
> > 
> > I fixed it this time.

Neither is required at all.

> Thanks for this. I was trying to find out if this is described anywhere
> because in stable tree both ways are used. Also Greg's script didn't report
> any issue with it. Is it a rule for media tree or your rule or described
> somewhere?

It's not a rule anywhere, and the use of stable@kernel.org is also
documented (it routes to /dev/null and can be used just to tag stuff, no
one is going to answer that email at all.)

> I have no problem with that rule but just want to understand where this
> request is coming from.

No idea, I have no such rule, and in fact I use stable@kernel.org all
the time for my subsystems.

thanks,

greg k-h

