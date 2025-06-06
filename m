Return-Path: <linux-media+bounces-34201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1FDACFDC6
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 09:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32F343A805E
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 07:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E88284685;
	Fri,  6 Jun 2025 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boRlB23J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB313284691
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 07:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196356; cv=none; b=HV/j/6iRokTRoTQyOL1LAoXYNBUzN9DEnv4eLhmfZ5oIp1seewtf4GTEtmq2p+Vv+UTtl6pvzAxomTqKCIDWHZ8+a4hb3ENUFIP/DTWQ5upVDSuC569CgPGx/N/WtLXUEhd9k2iH+WR/SMC4ligj/I/SU1rvuSZWiREky8J58hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196356; c=relaxed/simple;
	bh=5kBxOBLPqHSNpy/PVhuxWTXThfF+wwIuGF+GFV0Pn3A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HIUBtodejLRZHkHtxPkGgIUNc5sZ+JlP8Erx7n2K6CNiZrn5tPF0YPYCr2tXGyF2dTc/zXziS9qdBeuoNQqZGzZ93suqFUSWkFKO6I3xp3n9h+KEPr3u0wOm6+wsQTaXDASQMmNOBYT8rVE6LiuSd1JaZxTk0uQOh3i+srmxUF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boRlB23J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38834C4CEEB;
	Fri,  6 Jun 2025 07:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749196355;
	bh=5kBxOBLPqHSNpy/PVhuxWTXThfF+wwIuGF+GFV0Pn3A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=boRlB23JshlieVBmD+T9GJvD0xj96wX2VFby8+2r+0yDVQW5LPJai7bo0RCRFjiaX
	 kPwVgPC3BdtA1TVRxyBdNc1r6OcjmXtb65Xev26OeN0NcuODwyDILyo9rCI8sY5ATN
	 pewBUkXDgoafYxovRQJSzj+SJt37XlXNPq4Wl8LEyyRHpLJXv7D1PwZIoZn7JDfJvz
	 2HE9EDkldt7/CeUcAV+Rys5dR0VPz4hwJvxC7/wcBO5a3UAoHTb049LkA95p8nCNTT
	 dAjeIaVuqFXo54y1izNMGTACIAhiIE1WvstCm9wq3+pmensbg0eD7mFVCBgzASbAFR
	 5EYa42b6A5qZg==
Date: Fri, 6 Jun 2025 09:52:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil
 <hans@jjverkuil.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils] CONTRIBUTE: Add simple contribution
 instructions
Message-ID: <20250606095230.3a987c30@foz.lan>
In-Reply-To: <20250605131700.GA25847@pendragon.ideasonboard.com>
References: <20250605-prefix-v1-1-450aff98308a@chromium.org>
	<20250605124635.GC29935@pendragon.ideasonboard.com>
	<CANiDSCs4B8ovA2jipUiDr3tC3SSCpJOownohx-X+UvD+2W2w9g@mail.gmail.com>
	<20250605131700.GA25847@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 5 Jun 2025 16:17:00 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> On Thu, Jun 05, 2025 at 02:54:33PM +0200, Ricardo Ribalda wrote:
> > On Thu, 5 Jun 2025 at 14:46, Laurent Pinchart wrote:  
> > > On Thu, Jun 05, 2025 at 12:09:57PM +0000, Ricardo Ribalda wrote:  
> > > > In the media summit we discussed the need of a special prefix for
> > > > v4l-utils. This helps patchwork and media-ci.
> > > >
> > > > Create a new file with a brief introductions on how to contribute and
> > > > make the `v4l-utils` official.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>  
> > >
> > > I think this is a good idea. I don't know how we'll get users to
> > > actually use the prefix, but documenting it is a necessary first step.  

It is a good idea, but I'd say that, if there is "v4l-utils" anywhere
at the patch series subject, media CI shall not change the patch
status. Same applies to the other userspace tools we maintain.

Please notice, however, that the title is not enough to classify
it as userspace. See, for instance the contributions we receive for
DTV tables like this one:

	- https://lore.kernel.org/linux-media/846e7968-292d-5e96-b2a4-1e2e6b131fe3@tutr.cz/

This is not the first and probably won't be the last time we see
things like that. So, in doubt, media-ci should not tag a patch
if it can't verify that the patch is for the Kernel.

> > 
> > I can add a comment in the media-ci email. Something like:
> > 
> > I could not apply your series. Maybe it is for v4l-utils, if so,
> > please check  http://XXXX/CONTRIBUTE.md  

Makes sense, but see: currently we maintain v4l-utils, dtv-scan-tables, 
tvtime, xawtv3 and xawtv4 userspace tools.

The number of patches for the last three are really low, but when
we have patches there they are important, as they're usually
bug fixes made by distro maintainers. We should not miss those.

Regards,
Mauro

