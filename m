Return-Path: <linux-media+bounces-22316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362699DC21D
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA67916461B
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937E718EFC1;
	Fri, 29 Nov 2024 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juN9ka5C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F4D155753;
	Fri, 29 Nov 2024 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732876198; cv=none; b=aZvwgGLemEcXXF3iISRHi63gG4W5t8rAce1i7sfI4swkEKS8Ti+BPyfcm41JEaiaRIDCkoFUzMuRMU00CqYjBUI6WO6j3hvHAnJsm934PDlmxhIcAMHMe6YE4rTMF5hGub92RfVBHE6FQichpVwx2OHqPy153JS31n5XQkuGIgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732876198; c=relaxed/simple;
	bh=HV+KcdHMNiDCGNGg2MmmAJ5nak2w5W33ipZ4Sc1GXhw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KTvjNdxcMxiWL9asILWMIrEWr6VDFWZ837YShkE7LiRqO33unIK9zo+UE3iLEduiYkL32bf0UYQMIpytX0K3Q0txQyMOi+k95aYyJbo6ce63KC9vZw7G/aTvGicfCiy2gB+oKnoFtR6pwOt9fNLg6PoyRlv1BBeo8+gRPiVbWv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juN9ka5C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC5AC4CECF;
	Fri, 29 Nov 2024 10:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732876196;
	bh=HV+KcdHMNiDCGNGg2MmmAJ5nak2w5W33ipZ4Sc1GXhw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=juN9ka5CxUFx4jWCoyz+a+vgTGVvpJuN0wzxdCjdGfSsVolHoByTNIfj7EcZZ3N1n
	 6cr3NOBJrhIKR7LhxSBI/V0Odqm690D9Pf6ZGjvTPqKw2ZMBjz4YvUdsVlUIq7EWTr
	 ASAkYYw9/iunDsp8g3OOocJv6qgClxtQLj377c89+4fW9shwClGYpYhNq1YXy9Koi2
	 Ll2qQPCyFFsUHMrApjZ7UMRa5j1su5lCoG9a0TxbkRhcoi+1hRpqr5HV4AzP44i/+9
	 5srfxsk1HLh0tBqn0enJ8ARB6D63Dr+tcph+l8cmQfYdEeg5SG9l+6sh4klw5gfmrt
	 lz6+DuGLdBz5g==
Date: Fri, 29 Nov 2024 11:29:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241129112952.1f0c9222@foz.lan>
In-Reply-To: <20241128190707.GA13852@pendragon.ideasonboard.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
	<20241126151930.GA5493@pendragon.ideasonboard.com>
	<e0535e20-6e97-437f-8565-53fd257c7618@xs4all.nl>
	<20241127132515.GH31095@pendragon.ideasonboard.com>
	<20241128191543.289f0d84@foz.lan>
	<20241128190707.GA13852@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 28 Nov 2024 21:07:07 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> > With that in mind, every committer has duties of reviewing other
> > developer's patches submitted for the drivers that they're listed as
> > a maintainer at the MAINTAINERS file entries.  
> 
> I'm sorry but that's not a multi-committer model, it's a co-maintenance
> model. If that's what you really want we can reopen the discussion and
> start anew, but I don't think it's a good idea.
> 
> As I said before, if it increases my work load, I don't want commit
> rights. I'll keep sending pull requests, you'll have to keep processing
> them, and patches will be merged slower. It will be a lose-lose
> situation for everybody, you, me, contributors and users.
> 
> Starting with a situation where we are understaffed and trying to solve
> it by putting more work on the few people who currently keep the
> subsystem alive doesn't sound like a winning strategy. 

After sleeping over it, I agree that you're partially right on this.

Doing timely reviews is orthogonal of being a committer. What defines
if you need to do timely reviews is if you're listed or not at the
MAINTANERS file as "M:" - e.g. if the developer is a maintainer
(on its broader sense) or not. This applies for both PR and MR workflows.

Still, if one is not fulfilling its duty as maintainer, he may end
losing maintainership status and the corresponding committer rights.

I wrote a separate patch to make it clear. See below.

Thanks,
Mauro

---

[PATCH] docs: media: profile: make it clearer about maintainership duties

During the review of the media committes profile, it was noticed
that the responsibility for timely review patches was not clear:
such review is expected that all developers listed at MAINTAINERS
with the "M:" tag (e.g. "maintainers" on its broad sense).

This is orthogonal of being a media committer or not. Such duty
is implied at:

	Documentation/admin-guide/reporting-issues.rst

and at the MAINTAINERS header, when it says that even when the
status is "odd fixes", the patches will flow in.

So, let make it explicit at the maintainer-entry-profile that
maintainers need to do timely reviews.

Also, while right now our focus is on granting committer rights to
maintainers, the media-committer model may evolve in the future to
accept other committers that don't have such duties.

So, make it clear at the media-committer.rst that the duties
related to reviewing patches from others are for the drivers
they are maintainers as well.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index 650803c30c41..6daf71bc72c1 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -147,6 +147,11 @@ b. Committers' workflow: patches are handled by media committers::
 On both workflows, all patches shall be properly reviewed at
 linux-media@vger.kernel.org before being merged at media-committers.git.
 
+Such patches will be timely-reviewed by developers listed as maintainers at
+the MAINTAINERS file. Such maintainers will follow one of the above
+workflows, e. g. they will either send a pull request or merge patches
+directly at the media-committers tree.
+
 When patches are picked by patchwork and when merged at media-committers,
 CI bots will check for errors and may provide e-mail feedback about
 patch problems. When this happens, the patch submitter must fix them
diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
index 1756a7af6353..a873ef84fbca 100644
--- a/Documentation/driver-api/media/media-committer.rst
+++ b/Documentation/driver-api/media/media-committer.rst
@@ -87,9 +87,9 @@ be delegating part of their maintenance tasks.
 Due to that, to become a committer or a core committer, a consensus between
 all subsystem maintainers is required, as they all need to trust a developer
 well enough to be delegated the responsibility to maintain part of the code
-and to properly review patches from third parties, in a timely manner and
-keeping the status of the reviewed code at https://patchwork.linuxtv.org
-updated.
+and to properly review patches from third parties for the drivers they are
+maintainers in a timely manner and keeping the status of the reviewed code
+at https://patchwork.linuxtv.org updated.
 
 .. Note::
 


