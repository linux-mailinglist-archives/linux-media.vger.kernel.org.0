Return-Path: <linux-media+bounces-22501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3089E13DC
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 08:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7F59B228B3
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 07:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B7318B470;
	Tue,  3 Dec 2024 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7EX1yHN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357F2185B76;
	Tue,  3 Dec 2024 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733210403; cv=none; b=R1UNRTXtOI2KARf79ypttDPLQxmgjkICtff2OqzQWHKU3JzBbVSQrtN7mEnsh8/fn5WhMXvAHwwicI2/r1kr5lXy/s8E0NJDacpIMt+AK7HiRg65dVHlLQwLYv+wM30UhH1/Hacpy5uHpWkVpKrk21iTzRF6lRx7FKVGMb7Duw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733210403; c=relaxed/simple;
	bh=SGjQfe0CrbhQJESfm9Sm65hmpm1uBjisW55UtWhbXTU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkBDUa0OuGl6OC9YAejY6iDA0b0I8/agUBkMt7HrrTAJ+e2YC6+ZcgZ9wjDilfLyzFefbNKHYvdxTibEpu/9YTSbc3Qc214RUUXImW7MDEbvfd4Q4ipsG2a4KklqwCVDq3GHPZDIjw0+eQiFIztUARgPxYpfOBGSq1yuVqJ0FYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7EX1yHN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EECC4CECF;
	Tue,  3 Dec 2024 07:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733210402;
	bh=SGjQfe0CrbhQJESfm9Sm65hmpm1uBjisW55UtWhbXTU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u7EX1yHNy4bujlkL5XubyzHGK8s2MytdVkTB9ayHiBZCQBHsHz1d6bzAedr6sMceN
	 TRzJnRqC3pLoXFe84x0zeQQEwzMxx93brqwLtKBP/u7Awqhjlf6KoT2H07J+6NKurF
	 nszU4643Xjz8MyJ18lETv63Ck6hq3wJHmFhFXwitSRXcbDH2QldMPvldBRj/Weq+Lv
	 AhLtYRaFqT4YuVoaNiTO+IjW8GA8T6zpHZ7722L7BZoh/HNGTP8IP6vtwYAknHmJ60
	 sx0iIbK3FY0fSt8vnOJRMpaWnzELOCHu+L1SEuTl9ixv0XAZqEtyNPi46dnZIIIfax
	 AgonPwfR8+46w==
Date: Tue, 3 Dec 2024 08:19:58 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Document the new media-committer's model
Message-ID: <20241203081958.6c186835@foz.lan>
In-Reply-To: <b0843e80-c46c-4344-b9f1-1d3b57dd2bbe@xs4all.nl>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
	<b0843e80-c46c-4344-b9f1-1d3b57dd2bbe@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 2 Dec 2024 16:03:45 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 02/12/2024 10:26, Mauro Carvalho Chehab wrote:
> > The media subsystem used to have a multi-commiter's model in the
> > past, but things didn't go well on that time, and we had to move to
> > a centralized model.
> > 
> > As the community has evolved, and as there are now new policies in
> > place like CoC, let's experiment with a multi-committers again.
> > 
> > The model we're using was inspired by the DRM multi-committers
> > model. Yet, media subsystem is different on several aspects, so the
> > model is not exactly the same.
> > 
> > The implementation will be in phases. For this phase, the goal is that 
> > all committers will be people listed at MAINTAINERS.
> > 
> > On this series,:
> > 
> > patch 1: updates the  media maintainer's entry profile and adds the
> > workflow that will be used with the new model. While here, it also
> > adds a missing "P:" tag at the MAINTAINERS file, pointing to it;
> > 
> > patch 2: adds a new document focused at the new maintainers
> > process. Its target is for developers that will be granted with
> > commit rights at the new media-maintainers.git tree. It also
> > contains a reference tag addition to kernel.org PGP chain
> > at process/maintainer-pgp-guide.rst.
> > 
> > patch 3: make documents cleared about maintainership duties.  
> 
> At least from my perspective, v3 is close to being ready and I hope
> that v4 will be good enough to be merged.
> 
> That said, what is missing in all this is that there is nothing here
> that explains why you would want to become a media committer. It is all
> very dry stuff, lots of 'shall's, and 'rights' and 'trust' and obligations,
> but nothing about the satisfaction you get when you get the responsibility
> of a part of the kernel and being able to guide the development of that
> area.
> 
> It's good enough to get the multi-committer process off the ground, but
> it definitely needs more work to make it more inviting to become a media
> committer. Because right now it is as dry as dust.

Agreed. We focused on getting a document describing what it is expected
by committers, in order to start with the model. My view is that it works
fine for such purpose. I also feel that we're close to the final document.

I'm sending today a v4 addressing the comments since last review.

Once we get people that are already interested and ready to be on board,
and we know that the model and infrastructure works properly, we may implement
a phase 2 focusing on allowing more committers. For such purpose, we need to 
document the benefits/satisfaction of becoming a new committer. Depending how
it goes, either on phase 2 or on phase 3, we can change the model from 
invitation-only to volunteer-requests.

Thanks,
Mauro

