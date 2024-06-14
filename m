Return-Path: <linux-media+bounces-13224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD719083FF
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 08:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09EEE28594D
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 06:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502091487C3;
	Fri, 14 Jun 2024 06:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVsCQ+qf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE28148316
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 06:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718347913; cv=none; b=P8RxSyir72QpCb/sclw2PXLL/EaZJxGrAw1uNkESc34jjn3E+B8MbdfF+1q1uF6IOPKuPAzqdqopvTB5aNV3T/YnEVwQPay+6pjbUdX4LmfAqQPrLoh0MvyZQLlR1r2aafUU8diREV2whEIGfvdTcoOUOnOSaUkPQgpWWpR+4rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718347913; c=relaxed/simple;
	bh=dIlL/a9nos8oalZD5FzUJgvOo4j3F5avaDI8AcJ5R7o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bU4QKQ0Q6XynGN80jVqBNd4SxMt/t2IzAK5SIhJXWcGsrBkMG7MKmaj4Na8FNiui6MJY0qbSnnQbp62tHrqJeVD9LDWWmMrmARUEUI5xoGsnNQHowLVBbHVhI3MKC96x1KZ4t9J0hA+KoR77K8TbOLMOqxevAN0JNQeJaRjINKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVsCQ+qf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D0FC2BD10;
	Fri, 14 Jun 2024 06:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718347913;
	bh=dIlL/a9nos8oalZD5FzUJgvOo4j3F5avaDI8AcJ5R7o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YVsCQ+qf2IeGrd/6dNzA4WwewIbEKi+M7Iv+PwMRDuK/eRY+qxgmDmBq+3gmc7gwo
	 tdt8z4sW+ktsDUqDe/dJa38XcNLf2BrwPxMFvP8Cm+Q4WkW9ugxT3z5soonW+IuCsY
	 kAdXxFEY8kkr+kEaapjcu8KNiZRvj9i54NrSxkeFquxrw2pgTzOvf5+1uSOxv+pnGg
	 YrIyOuPE7Mm4JCnneDxkA/GtcStpGvqXubG9HHSYA5OJPVZ/bkSqqJxh5RMbHGxTyA
	 KWN07b8NgSsJWeYps+EAPy+Hs2hAcIj3+hvrhmQBVsYjELy74DZrFpaJ2pbckdQ1vt
	 EdLbZHqOFWzFg==
Date: Fri, 14 Jun 2024 08:51:48 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Umang Jain <umang.jain@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: imx283: drop CENTERED_RECTANGLE due to clang
 failure
Message-ID: <20240614085148.2bca27f5@coco.lan>
In-Reply-To: <171829240304.2248009.15616094068000525791@ping.linuxembedded.co.uk>
References: <ff7a05e2-2908-4da0-817a-1d7c271e788a@xs4all.nl>
	<171829240304.2248009.15616094068000525791@ping.linuxembedded.co.uk>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 13 Jun 2024 16:26:43 +0100
Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:

> Quoting Hans Verkuil (2024-06-13 16:19:08)
> > The CENTERED_RECTANGLE define fails to compile on clang and old gcc
> > versions. Just drop it and fill in the crop rectangles explicitly.  
> 
> So back when I was playing around with this I thought it would have got
> dropped during review / upstreaming before now - because I couldn't find
> a way to make sure the macro args were guaranteed to be used only once,
> by putting some locals in the macro (because of the initialisation).
> 
> So I'm not surprised that it needs to be removed, but I am surprised
> that it wasn't for the reason I expected ;-)
> 
> Anyway - maybe later I'll experiement with more common helpers perhaps -
> but not if it hits compile errors..

IMO, a helper just makes it worse for humans. I mean, just looking at:

	.crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),

I can't tell what values for top/left would be used.

> I do recall using v4l2_rects to define the active area so they could be
> used collectively rather than initialising things as
> 	.width = WIDTH,
> 	.height = HEIGHT,

Using defines for the minimum/maximum visible area makes sense,
e. g. something similar to this:

               .crop = {
                      .top = MIN_VISIBLE_TOP,
                      .left = MIN_VISIBLE_LEFT,
                      .width = MAX_WIDTH,
                      .height = MAX_HEIGHT,
               },

would also be fine, as it would be clear that the crop region is
the one containing the hardware limits.

> So - perhaps this could be (if it compiles):
>	.crop = imx283_active_area,

This should equally work, but maybe you could do, instead:

	.crop = &imx283_active_area,	// e.g. using a pointer

to avoid duplicating for every supported mode.

Thanks,
Mauro

