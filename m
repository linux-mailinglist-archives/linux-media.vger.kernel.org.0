Return-Path: <linux-media+bounces-994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A35DF7F7B09
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 19:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D47081C20B18
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 18:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104E939FFF;
	Fri, 24 Nov 2023 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oWjcmV9R"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B736619BB
	for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 10:00:45 -0800 (PST)
Received: from localhost (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E70076601F11;
	Fri, 24 Nov 2023 18:00:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700848844;
	bh=iiAKZ5p0aAAYzWDSMrxhIzRwjCpKlORLgDDwcFSvRhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oWjcmV9RoMbBbWtk9foy3gOnfo3BqwS/g54OUcPNwb4Mi/C+fLlmPFDOTtU6Wk/Gq
	 UKVMlq3fkwdKPTQ+/3NoCrwSgYuGBjSOm2I4BKvEAE3Sc2kM5Z9dgeNWp15sWlzxQP
	 Vu7ALF+KA/YBohyB9uSpfGAq3FQCkcuROKy1mQ8CxSPuzGI0s55A7PjYr8J2aOw9Nu
	 g3Km4wkjJrvYGOBZnithHvIv10gAaPFsWr50JxU9bRKnqbzAkNUvBGw2SR//Hj3kuv
	 xLJ//8+Y41zL9HivUPbSFpINb8AA71Nl0GwHrRKwpjcZPfqWlljSb0sDlVrEUKM4Hg
	 GK0nr4Q9cLIWg==
Date: Fri, 24 Nov 2023 10:00:40 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: build scripts: branches with forward slashes in names
Message-ID: <ZWDkyCwzFAj8VRGj@mz550>
References: <ZV_QuX5YScktbQi3@mz550>
 <67201f49-aacb-48a4-a11c-38a8875440b4@xs4all.nl>
 <4a41ef2f-99d4-4cf2-bf92-a53ec7c34335@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a41ef2f-99d4-4cf2-bf92-a53ec7c34335@xs4all.nl>

On Fri, Nov 24, 2023 at 10:37:59AM +0100, Hans Verkuil wrote:
> On 24/11/2023 08:23, Hans Verkuil wrote:
> > On 23/11/2023 23:22, Deborah Brouwer wrote:
> >> Hi Hans,
> >>
> >> Have you ever had a problem running the build scripts on branches with
> >> forward slashes in their names?
> >>
> >> So, for example, I add my repo to env.sh
> >> myrepo=https://gitlab.collabora.com/chipsnmedia/kernel
> >>
> >> I run ./build.sh setup and I can see it fetching my repo and including
> >> my branch "dbrouwer/KConfig_fix", but if try to run:
> >>
> >> ./build.sh -test all dbrouwer/KConfig_fix
> >>
> >> I get this error:
> >>
> >> "fatal: 'dbrouwer/KConfig_fix' is not a commit and a branch 'build-test' cannot be created from it"
> >>
> >> But then if I change the branch name to remove the forward slash "KConfig_fix" it works fine again.
> >>
> >> Have you noticed anything similar? Could it be easily fixed?
> >>
> >> Thanks,
> >> Deborah
> >>
> > 
> > From the README:
> > 
> > "If <branch> is absent, then it will default to media_stage/master. If it
> > contains a / character, then the branch name will be used as-is (e.g.
> > use <remote>/<branch> to build a branch on a specific remote), otherwise
> > the branch name will be prefixed by main/ (e.g. main/<branch>), which
> > uses the branch on your '$myrepo' repository."
> > 
> > I never use / in branch names (too confusing with / in pathnames), and since
> > I developed these scripts originally for myself, I just grepped for /.
> > 
> > Perhaps the build script should allow for 0-2 arguments at the end:
> > nothing means media_stage/master, 1 arg means main/<branch> and 2 args
> > means <remote>/<branch>.
> > 
> > Let me see what I can do.
> 
> I've done exactly that: after the <branch> argument you can now add an
> optional <remote> argument. So branch now supports / in the name.

Ah thanks for fixing this, I tested it and it works fine now:

"branch 'build-test' set up to track 'main/dbrouwer/KConfig_fix'."

> 
> Regards,
> 
> 	Hans
> 

