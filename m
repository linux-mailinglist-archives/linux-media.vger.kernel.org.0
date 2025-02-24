Return-Path: <linux-media+bounces-26754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD8A414EE
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 06:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80B3E7A204D
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 05:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B881C6FF7;
	Mon, 24 Feb 2025 05:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nFhfYlTh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4341448E3;
	Mon, 24 Feb 2025 05:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740376337; cv=none; b=U81cF6A2X6/pFaIGIEbfTWT7I0eWEcmEWTKnjYecjMoyhrgl52zSnOdK8qyWw1DOJSpTJaz8HBDA97Vnsvu95w+aP5vSJMZ1IBi3O+qFL03v4l1yhjNKZMnf/sMQaW17QbmlBb0JGi6WiXiE0U6hj+YpAdOxZq5BZsvu3o8l5m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740376337; c=relaxed/simple;
	bh=53H9/x0j02AhPT7w+jFHCR4eR6p48BOhp4/DcjS/5+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvyYW/l5WNzj09lI+29IjljfOOJQHYggw3aSQK+fVNMW6aratY8hWG3NJbUQh7WKXicc/+GeqiflVAbFUA1pJUzpx3lZ5AzSpBpggdmDxqefcj9jbdFmtNhcKoqaIgs83bFUM1I8epnT2mS6hTBOE7usPvZa0VtsRdXnqf79nC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nFhfYlTh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EF5C4CED6;
	Mon, 24 Feb 2025 05:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740376336;
	bh=53H9/x0j02AhPT7w+jFHCR4eR6p48BOhp4/DcjS/5+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFhfYlTh/vn6++4NrrfuzW63KF6xlniD4USCI+6lyNK0LkAXyU6nIDl5SFg1zC3CY
	 8fULK3IP96tqdq8wj0IN9ERcTVWyWI3H3V9uAAtBXOlUWhDjNvrfCCJ7Iv899ih7hL
	 3+mhMk9Xko2hwR2SeMve8H0FOP832WEiYxQKehyY=
Date: Mon, 24 Feb 2025 06:52:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Joseph Liu <kwliu@nuvoton.com>,
	Marvin Lin <kflin@nuvoton.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marvin Lin <milkfafa@gmail.com>, linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/4] media: nuvoton: Fix reference handling of ece_pdev
Message-ID: <2025022426-lilly-next-72e0@gregkh>
References: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
 <20250121-nuvoton-v1-1-1ea4f0cdbda2@chromium.org>
 <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
 <dffc8e0b-2603-4e7e-ba64-15691c11ff7e@xs4all.nl>
 <CANiDSCsMCSJMEsY3R=pnZ4XUTiEYuPz-N1kEX7y13yTzE6Dm5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCsMCSJMEsY3R=pnZ4XUTiEYuPz-N1kEX7y13yTzE6Dm5w@mail.gmail.com>

On Sun, Feb 23, 2025 at 07:34:30PM +0100, Ricardo Ribalda wrote:
> On Fri, 21 Feb 2025 at 10:18, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >
> > On 21/02/2025 10:04, Hans Verkuil wrote:
> > > Hi Ricardo,
> > >
> > > On 21/01/2025 22:14, Ricardo Ribalda wrote:
> > >> When we obtain a reference to of a platform_device, we need to release
> > >> it via put_device.
> > >>
> > >> Found by cocci:
> > >> ./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > >> ./platform/nuvoton/npcm-video.c:1684:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > >> ./platform/nuvoton/npcm-video.c:1690:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > >> ./platform/nuvoton/npcm-video.c:1694:1-7: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > >
> > > This driver uses this construct:
> > >
> > >                 struct device *ece_dev __free(put_device) = &ece_pdev->dev;
> > >
> > > to automatically call put_device. So this patch would 'put' the device twice.
> > >
> > > Does cocci understand constructs like this? If I hadn't looked closely at the
> > > code first, I would just have merged it.
> >
> > Oh wait, now that I am reading the following patches I see that it was those later
> > patches that add the __free code.
> >
> > This is far too confusing. Please post a v2 that just combines the 'fix references'
> > and 'use cleanup.h macros' in a single patch. It makes no sense to have this two-phase
> > approach.
> 
> I believe this is discouraged.
> 
> cleanup.h macros does not exist in old kernel versions, so makes it
> impossible to backport the fix to them.

That's not a problem, fix things properly in the main tree and let the
stable/lts kernels work it out on their own.

> This is an example of other series following this policy:
> https://lore.kernel.org/lkml/173608125422.1253657.3732758016133408588.stgit@devnote2/
> 
> They also mention the same here:
> https://hackerbikepacker.com/kernel-auto-cleanup-1 .... I am pretty
> sure that I read the policy in a more official location... but I
> cannot find it right now :)

No, it is NOT official policy at all.  Otherwise you would be saying
that no one could use these new functions for 6 years just because of
really old kernels still living around somewhere.  That's not how kernel
development works, thankfully.

thanks,

greg k-h

