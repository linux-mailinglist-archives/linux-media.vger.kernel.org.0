Return-Path: <linux-media+bounces-60748-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GSuIJpM/GmZNwAAu9opvQ
	(envelope-from <linux-media+bounces-60748-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:26:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDB24E4C29
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF32F30C941B
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 08:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F0E3A16B6;
	Thu,  7 May 2026 08:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o0rJHX7W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91FC38424D
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141916; cv=none; b=tIv3t4L8LdNP19kEz5pGLHvNMFTkyfr/u3R0d9onSjuqV0AwDNcu5gylie2stE7+DFaPwR1xByslIvSz2ZYd0Y5wtaunTnQjnMQ+g5NNe/LGgU2eh5L0u6wFdij5qiIPnbjpohXVZB/uqPye07qQ/sxn6TN9Qu9SojcpXpkoCmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141916; c=relaxed/simple;
	bh=06wOGzWoXzkHq2LcM+5S2I2vseMjD/9LkN1iU6IDqm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+3zy5hDqpnXoGpmP0/yRc7XOAneyCvdY5TSZ/A9YBwT5qE7po0UfDdOR8x4p23GvWbI8FHr2w2YklkK0F17Ns3ecgaXKLtdzrcxa7tSU0LzXMpMW8IZg3BNyJ0ItWGZIBXpEv/6yfU7TNkNa6Xx+z/PdFHuC++XoZSE4uL6iDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o0rJHX7W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68A01454;
	Thu,  7 May 2026 10:18:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778141901;
	bh=06wOGzWoXzkHq2LcM+5S2I2vseMjD/9LkN1iU6IDqm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0rJHX7Wh/JAnz3/pdYcwXYPNstifF53mOlLcTb+iWepQz44sUMm6LQiCpNpjOT9L
	 jxgE1pFXTKCPS1SQw9wrzsrODK9SsbzpY3VWTYAW2Zpauh6zNTfRyVBt4Zv030M0VK
	 ISs39fZbqvcI7H+ldj7u65Aqg2kW7Zy4VMKxntrg=
Date: Thu, 7 May 2026 11:18:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [v2,0/2] media: renesas: vsp1: Fix display pipeline regression
Message-ID: <20260507081823.GG1778786@killaraus.ideasonboard.com>
References: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
 <69fbc7c8.9d0a0220.1bdb77.e857@mx.google.com>
 <20260506231134.GD1778786@killaraus.ideasonboard.com>
 <CANiDSCvfB3xJGfwwSAgXEBHQEU8qoyLOrtSEEfGaBwMWYaCG4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvfB3xJGfwwSAgXEBHQEU8qoyLOrtSEEfGaBwMWYaCG4w@mail.gmail.com>
X-Rspamd-Queue-Id: CFDB24E4C29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60748-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

On Thu, May 07, 2026 at 07:30:43AM +0200, Ricardo Ribalda wrote:
> On Thu, 7 May 2026 at 01:11, Laurent Pinchart wrote:
> > On Wed, May 06, 2026 at 03:59:20PM -0700, Patchwork Integration wrote:
> > > Dear Laurent Pinchart:
> > >
> > > Thanks for your patches! Unfortunately the Media CI robot detected some
> > > issues:
> > >
> > > # Test media-patchstyle:./0001-Revert-media-renesas-vsp1-Initialize-format-on-all-p.patch media style
> > > ERROR: ./0001-Revert-media-renesas-vsp1-Initialize-format-on-all-p.patch: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
> > > ERROR: Commit 133ac42af0a1b389e8b7b3dc7c1cc8c30ff162b6 found in the stable tree, but stable@vger.kernel.org not in Cc:
> > >
> > > # Test media-patchstyle:./0002-Revert-media-renesas-vsp1-brx-Fix-format-propagation.patch media style
> > > ERROR: ./0002-Revert-media-renesas-vsp1-brx-Fix-format-propagation.patch: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
> >
> > I'm not going to add your SoB to my patches :-)
> 
> You did not get the memo. From now on, all patches in the kernel need
> to be SoB my me :P
> 
> Sorry about that, Yesterday I had to recreate the local repo and
> forgot to set the proper committer. It should be fixed now.
> 
> > > ERROR: Commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f found in the stable tree, but stable@vger.kernel.org not in Cc:
> >
> > I don't see these commits in any of the stable branches. Does the
> > message mean the mainline tree, not the stable tree ?
> 
> It means the stable tree
> 
> ribalda@ribalda:~/work/linux$ git fetch
> git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> 937f3e6b51f1cea079be9ba642665f2bf8bcc31f
> From git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux
>  * branch
> 937f3e6b51f1cea079be9ba642665f2bf8bcc31f -> FETCH_HEAD

Ah right. But I don't think that's relevant. The commit is from the
master branch of the stable tree, which simply mirrors Linus' tree. It's
not in any stable branch.

$ git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git stable
Cloning into 'stable'...
[...]
laurent@killaraus ~/src/kernel $ cd stable
laurent@killaraus ~/src/kernel/stable $ git branch -a --contains 937f3e6b51f1cea079be9ba642665f2bf8bcc31f
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/master
laurent@killaraus ~/src/kernel/stable $ git tag --contains 937f3e6b51f1cea079be9ba642665f2bf8bcc31f
v7.1-rc1
v7.1-rc2

This means the commit hasn't been backported to stable, it has just been
merged to mainline.

If the purpose of this is to check if the commit has been merged in
mainline, I think the message should refer to mainline. If it's to check
if it has been backported to a stable kernel, then those are false
positives.

Note that commit ID change when they're backported. If you want to check
if a commit has been backported, you'll need to grep for

    commit ${upstream_commit_id} upstream.

in commit *messages* of all stable branches.

> > Given that this series should be merged in v7.1 as a regression fix, why
> > should it CC stable ?
> 
> Somehow that patch has been backported, so I guess it should cc stable.

No, it hasn't been backported.

> > > Please fix your series, and upload a new version. If you have a patchwork
> > > account, do not forget to mark the current series as Superseded.
> > >
> > > For more details, check the full report at:
> > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99198847/artifacts/report.htm .
> > >
> > >
> > >
> > > Best regards, and Happy Hacking!
> > > Media CI robot on behalf of the linux-media community.
> > >
> > > ---
> > > Check the latest rules for contributing your patches at:
> > > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> > >
> > > If you believe that the CI is wrong, kindly open an issue at
> > > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > > to this message.

-- 
Regards,

Laurent Pinchart

