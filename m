Return-Path: <linux-media+bounces-22518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 208F69E1791
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 10:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8C58165854
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 09:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28A91DFE07;
	Tue,  3 Dec 2024 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUOiOw+F"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17294192583;
	Tue,  3 Dec 2024 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218130; cv=none; b=U7b+xH/e8BhgY/rdTxcDdmPbF1UTtNo7k3zsn3yybG6bJp9MPN18ERSVFnpBWE0uaLMz1ggHUyhsUw/gpPEA1ANM0ofmPtWkKz7ctV70UrO9MPVeq+ygXEbpuU+81LGrL5O2TSzdtse8iwJ2jkLGzk7GR3Onsg5E1f5pQmRsRRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218130; c=relaxed/simple;
	bh=hSUTZ+7c2lAqNzwNB66gSvhu3iCfehKaHKcTiRiETzU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V9VjJOxVfljyj3GD10xCEEj/1rV2YqvxHkSQ66857j09G3FGyXFq4QSvfInNHJM9Y99qBPqPi6oi+Xq0Xh907/Ah0CUhL3zYSskUydCAfhyS3UpZilpPVlz2Fr8POt67aQk3HoSRrSgsjma9ZlZVDmGwKrUYqsJ71F0cH3lncOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUOiOw+F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C73C4CED6;
	Tue,  3 Dec 2024 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733218129;
	bh=hSUTZ+7c2lAqNzwNB66gSvhu3iCfehKaHKcTiRiETzU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HUOiOw+FRrSqH2cWn+B4dS2L9ciiGipo1T86uNLmYArskZUCCZ1yUGs9xtRxOD2my
	 4nhl/xNKbV6mAQi4qWOE+DUUv+sPgL3OXP/MRwcAVmVxz7M0pD//JGCR/wmCjp4tml
	 XPVBfvSIxObsgbwamW7Shy9ErAJ7LmMGDdspklAQfTypUIPDSpTedrtm1GFN8au6+D
	 0wOI+myWFcKwcdGOHeDT/QcYnl7C0GspUzjj+/lsB6uS0LVKo5yhl1W94Ceb3foS3D
	 X3RLSqIvIboZJXGX1gKQWQ+E0Ev80BGJ/rPEwPhRCXhYtVIa2bU1WMNAHqfVJ7GqC4
	 cqzn9S0MpzNpQ==
Date: Tue, 3 Dec 2024 10:28:46 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] docs: media: profile: make it clearer about
 maintainership duties
Message-ID: <20241203102846.6fb3ab52@foz.lan>
In-Reply-To: <Z03I1R0aRylSz742@valkosipuli.retiisi.eu>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
	<f47082a84e0c799dd047525d4bc351eb3a759e83.1733131405.git.mchehab+huawei@kernel.org>
	<Z03I1R0aRylSz742@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 2 Dec 2024 14:48:53 +0000
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
> 
> On Mon, Dec 02, 2024 at 10:26:21AM +0100, Mauro Carvalho Chehab wrote:
> > During the review of the media committes profile, it was noticed  
> 
> s/committe\K/r/

Addressed this and the other editorial changes.

> Can we expect people listed as maintainers to either send PRs or be media
> committers? I think this might be eventually the result but I think we're
> quite far from this currently and I expect things to remain that way in the
> near future.

Yes, having driver maintainers being committers and sending PRs is what we
expect to happen first.

For mid/long-term, once driver maintainers get in board, we may also have
other committers for the drivers whose maintainer is also a committer.

Now, having committers for drivers whose maintainer is not a committer
doesn't sound a good idea, except if such committer is doing just
janitorial work and gets A-B/R-B from the driver maintainer on all
patches he merges.

Thanks,
Mauro

