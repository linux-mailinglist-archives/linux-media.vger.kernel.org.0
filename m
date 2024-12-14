Return-Path: <linux-media+bounces-23419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 861B99F2058
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 19:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDE5816088C
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 18:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F94F1ABEB0;
	Sat, 14 Dec 2024 18:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0XHQ6cIM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489AB1A8F6B;
	Sat, 14 Dec 2024 18:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734201674; cv=none; b=oATuKlt+pvKRK/hILyIbHFxHOQZmG4HlBOPykutu/0ESWKbQKQW17rakmI5nbMbEoBYU+TLnDoNIwnqcHd/l4dzD9nxRCq/kBRYbbu3lLHppkqjkijgkOpsOI5YMHgqXSnmCAupgIGl0CqYXn24/IVqKhBjCmW1kvygpVQN+Fz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734201674; c=relaxed/simple;
	bh=qP01awV62yJKZkQCb4OBPUOVVOHgBTtxBBqfvvfobeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rL+uAui+YegFiwBSYoBzTPaWDsyYaaBke6LO8jo4Nh5tiM6p8B9JvHkwlLVxEJh3/szBpyaoiamaTY0EzaiukKoSOJJGobfvjLW2wl5GQZwkc8uFFc1O73SdxecXrsKskqH4zF6BIYUZi4va8ZzZOoHTO0jNZN0f/QhecRIDx4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0XHQ6cIM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C96FC4CED1;
	Sat, 14 Dec 2024 18:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734201673;
	bh=qP01awV62yJKZkQCb4OBPUOVVOHgBTtxBBqfvvfobeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0XHQ6cIMxKGMSutwtAtSPHjhyFH0Pl7KbeDI8W559wjGW+JnwnFgUSUEXbOggTorh
	 YvzhD47IwgbZjBsmrhYmNZ7KKDIk7bEYf4F02t8FA/R2aX8xBVQogB1SDNUmTJLUCv
	 aRBKEL2fg0isiDMMTq3R0wsSXV3O+luKYl+d0ilM=
Date: Sat, 14 Dec 2024 19:41:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
	monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com,
	stable@kernel.org, Sam Bobrowicz <sam@elite-embedded.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	"open list:V4L2 CAMERA SENSOR DRIVERS" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2] media: ov5640: fix get_light_freq on auto
Message-ID: <2024121425-ended-coastal-0c46@gregkh>
References: <2e79be9185cbb0dbe40e670eee996cf290bab0a6.1732264079.git.michal.simek@amd.com>
 <Z1v2VRzgUVpHZvXR@kekkonen.localdomain>
 <05ce02de-6eed-4f28-8052-56ca9cac4b64@amd.com>
 <2024121303-arrange-hydration-7cf4@gregkh>
 <Z13NZ0lTeTecuC57@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z13NZ0lTeTecuC57@kekkonen.localdomain>

On Sat, Dec 14, 2024 at 06:24:39PM +0000, Sakari Ailus wrote:
> Hi Greg,
> 
> On Fri, Dec 13, 2024 at 12:12:18PM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Dec 13, 2024 at 11:30:38AM +0100, Michal Simek wrote:
> > > Hi Ailus, +Greg
> > > 
> > > On 12/13/24 09:54, Sakari Ailus wrote:
> > > > Hi Michal,
> > > > 
> > > > Thanks for the patch.
> > > > 
> > > > On Fri, Nov 22, 2024 at 09:28:01AM +0100, Michal Simek wrote:
> > > > > From: Sam Bobrowicz <sam@elite-embedded.com>
> > > > > 
> > > > > Light frequency was not properly returned when in auto
> > > > > mode and the detected frequency was 60Hz.
> > > > > 
> > > > > Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> > > > > Signed-off-by: Sam Bobrowicz <sam@elite-embedded.com>
> > > > > Signed-off-by: Michal Simek <michal.simek@amd.com>
> > > > > Cc: <stable@kernel.org>
> > 
> > That address is totally acceptable.
> 
> The documentation (Documentation/process/stable-kernel-rules.rst) tells to
> use stable@vger.kernel.org nevertheless (we're not discussing the latter
> option here):
> 
> To have a patch you submit for mainline inclusion later automatically picked up
> for stable trees, add this tag in the sign-off area::
> 
>   Cc: stable@vger.kernel.org
> 
> Use ``Cc: stable@kernel.org`` instead when fixing unpublished vulnerabilities:
> it reduces the chance of accidentally exposing the fix to the public by way of
> 'git send-email', as mails sent to that address are not delivered anywhere.

Yes, either works.  But to keep the "signal" of "hey, look, a security
bug!" down, feel free to use stable@kernel.oorg also everywhere just to
make the bad guys have to do more work :)

thanks,

greg k-h

