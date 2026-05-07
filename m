Return-Path: <linux-media+bounces-60760-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +L/oLOlT/GlOOAAAu9opvQ
	(envelope-from <linux-media+bounces-60760-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:57:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D794E5507
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5499F30A759D
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 08:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AD4391505;
	Thu,  7 May 2026 08:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ACoCCM/T"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8A738F259
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143506; cv=none; b=DCtY/WUA4+mRL23WKXg5dejnL+s5iM2kXtAYFvnUx44GaN+mC8V+Ku2Umxg/MowrfyFLbSlDHxpAQu9a77HN2JobgBkCtZQdFd300ZwFdwu14rzNR2Wd7n1Qfm3zvy2UWneruri0QY3Z49pzjveo0TPZ+VHqi0gW+kDp/etUTNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143506; c=relaxed/simple;
	bh=Mg2imfj2tcI3Ou3+MBLyHanzCd0tVKtZ9TEg1ekABdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+FLnoDvwt9UOrfC6r97nk7452g8ku0qLGrkGQipKZyOfwD/OO9uJVM4b4waidv/nZCS1aFCTPWHa3S+f8jPJhaahdFDLJiHpGP3/cWtKfv03oAdt4eDJ64VuKeB+iP/FmTGahpyhF2lgT0rCuEVPdtn1XHScGj3vP3olyR3Rq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ACoCCM/T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB1DA664;
	Thu,  7 May 2026 10:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778143494;
	bh=Mg2imfj2tcI3Ou3+MBLyHanzCd0tVKtZ9TEg1ekABdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ACoCCM/TTmlVJgYCDf5Xq7vFz9YuAjJBvRqIxA1ZJklTqOOV3iD8Kk+vehat1xMmV
	 AXNAmWNHM241FGCgfNAlusbr3lIl/Aw7kTpFY9x2oQ8VNx/KU+u4CnAsxFQwyeZ78M
	 2J3Wdl07lUY40T26iG3IXzVUvYzvsSsKehu2LLJc=
Date: Thu, 7 May 2026 11:44:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [v2,0/2] media: renesas: vsp1: Fix display pipeline regression
Message-ID: <20260507084456.GI1778786@killaraus.ideasonboard.com>
References: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
 <69fbc7c8.9d0a0220.1bdb77.e857@mx.google.com>
 <20260506231134.GD1778786@killaraus.ideasonboard.com>
 <CANiDSCvfB3xJGfwwSAgXEBHQEU8qoyLOrtSEEfGaBwMWYaCG4w@mail.gmail.com>
 <20260507081823.GG1778786@killaraus.ideasonboard.com>
 <CANiDSCuR4cd5euyOzmW0V-cLcwmGngFFbXZQU3Y2SPBZdwywXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuR4cd5euyOzmW0V-cLcwmGngFFbXZQU3Y2SPBZdwywXg@mail.gmail.com>
X-Rspamd-Queue-Id: C9D794E5507
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60760-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 10:38:33AM +0200, Ricardo Ribalda wrote:
> On Thu, 7 May 2026 at 10:18, Laurent Pinchart wrote:
> > On Thu, May 07, 2026 at 07:30:43AM +0200, Ricardo Ribalda wrote:
> > > On Thu, 7 May 2026 at 01:11, Laurent Pinchart wrote:
> > > > On Wed, May 06, 2026 at 03:59:20PM -0700, Patchwork Integration wrote:
> > > > > Dear Laurent Pinchart:
> > > > >
> > > > > Thanks for your patches! Unfortunately the Media CI robot detected some
> > > > > issues:
> > > > >
> > > > > # Test media-patchstyle:./0001-Revert-media-renesas-vsp1-Initialize-format-on-all-p.patch media style
> > > > > ERROR: ./0001-Revert-media-renesas-vsp1-Initialize-format-on-all-p.patch: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
> > > > > ERROR: Commit 133ac42af0a1b389e8b7b3dc7c1cc8c30ff162b6 found in the stable tree, but stable@vger.kernel.org not in Cc:
> > > > >
> > > > > # Test media-patchstyle:./0002-Revert-media-renesas-vsp1-brx-Fix-format-propagation.patch media style
> > > > > ERROR: ./0002-Revert-media-renesas-vsp1-brx-Fix-format-propagation.patch: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
> > > >
> > > > I'm not going to add your SoB to my patches :-)
> > >
> > > You did not get the memo. From now on, all patches in the kernel need
> > > to be SoB my me :P
> > >
> > > Sorry about that, Yesterday I had to recreate the local repo and
> > > forgot to set the proper committer. It should be fixed now.
> > >
> > > > > ERROR: Commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f found in the stable tree, but stable@vger.kernel.org not in Cc:
> > > >
> > > > I don't see these commits in any of the stable branches. Does the
> > > > message mean the mainline tree, not the stable tree ?
> > >
> > > It means the stable tree
> > >
> > > ribalda@ribalda:~/work/linux$ git fetch
> > > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> > > 937f3e6b51f1cea079be9ba642665f2bf8bcc31f
> > > From git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux
> > >  * branch
> > > 937f3e6b51f1cea079be9ba642665f2bf8bcc31f -> FETCH_HEAD
> >
> > Ah right. But I don't think that's relevant. The commit is from the
> > master branch of the stable tree, which simply mirrors Linus' tree. It's
> > not in any stable branch.
> >
> > $ git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git stable
> > Cloning into 'stable'...
> > [...]
> > laurent@killaraus ~/src/kernel $ cd stable
> > laurent@killaraus ~/src/kernel/stable $ git branch -a --contains 937f3e6b51f1cea079be9ba642665f2bf8bcc31f
> > * master
> >   remotes/origin/HEAD -> origin/master
> >   remotes/origin/master
> > laurent@killaraus ~/src/kernel/stable $ git tag --contains 937f3e6b51f1cea079be9ba642665f2bf8bcc31f
> > v7.1-rc1
> > v7.1-rc2
> >
> > This means the commit hasn't been backported to stable, it has just been
> > merged to mainline.
> >
> > If the purpose of this is to check if the commit has been merged in
> > mainline, I think the message should refer to mainline. If it's to check
> > if it has been backported to a stable kernel, then those are false
> > positives.
> >
> > Note that commit ID change when they're backported. If you want to check
> > if a commit has been backported, you'll need to grep for
> >
> >     commit ${upstream_commit_id} upstream.
> >
> > in commit *messages* of all stable branches.
> >
> > > > Given that this series should be merged in v7.1 as a regression fix, why
> > > > should it CC stable ?
> > >
> > > Somehow that patch has been backported, so I guess it should cc stable.
> >
> > No, it hasn't been backported.
> 
> You are completely right. And we have been doing this wrong for a long time....
> 
> We have a challenge that it is not trivial to fix. The builder do not
> have a clone of linus-stable, it queries it with something similar to
> "git ls-remote". So I cannot use "git log | grep".
> 
> Ideally we could have a web server to check if a sha has been
> backported, but that does not exist yet. It could probably be a nice
> little vibecoding project.

You had me interested until I read vibecoding. /me walks out the door.

> The question right now is if it is best to disable the check
> completely or keep it and live with the false positives.
> 
> Need to check with my pillow.

Given that the check essentially flags any patch that Fixes: a commit
present in mainline, I don't think we should keep it in its current
form. If desired, we could replace it with a check that flags Fixes:
without CC: stable, unconditionally. I think that's too strict though,
so it would need to be a warning that wouldn't block merging.

> > > > > Please fix your series, and upload a new version. If you have a patchwork
> > > > > account, do not forget to mark the current series as Superseded.
> > > > >
> > > > > For more details, check the full report at:
> > > > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99198847/artifacts/report.htm .
> > > > >
> > > > >
> > > > >
> > > > > Best regards, and Happy Hacking!
> > > > > Media CI robot on behalf of the linux-media community.
> > > > >
> > > > > ---
> > > > > Check the latest rules for contributing your patches at:
> > > > > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> > > > >
> > > > > If you believe that the CI is wrong, kindly open an issue at
> > > > > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > > > > to this message.

-- 
Regards,

Laurent Pinchart

