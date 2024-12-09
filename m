Return-Path: <linux-media+bounces-22855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D709E8D1A
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 09:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 129291883E90
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 08:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C530321518F;
	Mon,  9 Dec 2024 08:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jjmr385a"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1311754918;
	Mon,  9 Dec 2024 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733732155; cv=none; b=rpv2VfFzdD5fjKMJdbkmYUf+DomiLhV97DzDl6AKxCOc2ZIf/DudQvto7e+PzlLP4UiWsf342tI2I1/RUA0G3RSevfm/FtNiFG269qLC9RZfg5aT2i+aLSADjVhRvvljRn5BZFWqL+1P8d+ClaW+2kLSjVeSbQS5q2m8IqWJIKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733732155; c=relaxed/simple;
	bh=OcV2xYxRXTCXMuX1ekCAw7NyTEEuqu99/Vs5cwe1gBs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bIkV0e7LPdqnSyREiy0yR7tDUH4Z9JoxO5VdknOfHbvI/1DadkBMEdCoWNE0uiWsJBy4VAFqqPszv1NzaxsmdWR4FAjnWdk/L4noIHBpv7smMw9Gc4vMPRWwBoWU6pYUmB1Dx9rTBecUbf16ZG+00uov1hY5tUPe7q0ted4FEBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jjmr385a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13641C4CED1;
	Mon,  9 Dec 2024 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733732154;
	bh=OcV2xYxRXTCXMuX1ekCAw7NyTEEuqu99/Vs5cwe1gBs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Jjmr385a0JB0QLKCV/1CcCyNl02f9Avzzglhdh2HISXHY4xizV709sTTiHPmzBjlE
	 8lKa0lPqozeC8liJOK4qXeE5HDqpENxW0BywmqYb3uVQ9wHtTonD8aIo1y/fj+7elZ
	 wjFl4XcD97VFB8M4GcoC38L4I+VLPMLYnsB7ikDpVqnMqi4MrvhQbVC0TurwWpG4L0
	 eSkiC+wg23NIEzgtYC6687X2pb6HWADK7NZcLHHaM7llgO6gkpxDUU9IzIxnhKIPwR
	 p1oidmBeylmrWGzgN6ibcqc6v4J6nw3o+FsYNdHHAxJtmB1m/rghR9DRFceHSEnraL
	 6B+BzFaNG3grg==
Date: Mon, 9 Dec 2024 09:15:48 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Media committers model postponed to 6.14 - Was: Re: [PATCH v3 0/3]
 Document the new media-committer's model
Message-ID: <20241209091548.165e5152@foz.lan>
In-Reply-To: <20241203140712.57daa65f@foz.lan>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
	<b0843e80-c46c-4344-b9f1-1d3b57dd2bbe@xs4all.nl>
	<20241203081958.6c186835@foz.lan>
	<20241203112209.GR10736@pendragon.ideasonboard.com>
	<20241203140712.57daa65f@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 3 Dec 2024 14:07:12 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> 
> The idea is to gradually open media-committers to more people, as each
> phase succeeds, addressing infra, procedures, etc.
> 
> My rough idea is to do:
> 
> - Phase 0.99: beta testers;
> - Phase 1 is to invite people that regularly submit PRs;
> - Phase 2 is to invite other active maintainers;
> - Phase 3 (or 2?, TBD) to open for non-maintainers.
> 
> We shouldn't rush it, as there are a lot to be done before opening it
> broadly. So, I would say that:
> - phase 0.99 would start in -rc2 (if things go well during this week); 
> - phase 1 may still happen on this merge window, but as there will be
>   only a few weeks between -rc2 and -rc6, and people usually get
>   holidays in Dec/Jan, it is more likely that it will start for
>   6.14-rc1, again if we didn't notice big issues on phase 0.99.
> 
>   We should wait at least for a couple of releases on phase 1,
>   again to cleanup process and fine-tune infra. If things go well, 
>   we can move to phase 2.

After some discussions with Hans, we decided to postpone the
beta testers phase to the next kernel cycle. There are a couple of
reasons for that:

- This should give us more time to come up with a final version of 
  the media-committers documentation and agreement;

- This would also work better with regards to end of year's vacations,
  as they'll be affecting at least 2/3 -rc versions. Plus, we all have
  things to finish before such vacations. So, better to start fresh next
  year;

- Media CI still had issues with a patch series I submitted, as it picked
  the wrong baseline, causing CI to not test two patches that were
  applied on the top of media-committers/next branch. This was fixed
  by Ricardo, but it means that we may still need to polish CI before
  granting more people righs there.

With that, if we want to start the media committers for 6.14, we should
aim to close review this document by -rc6, or, at most, -rc7, getting 
the patches merged during the next merge window.

Regard

Thanks,
Mauro

