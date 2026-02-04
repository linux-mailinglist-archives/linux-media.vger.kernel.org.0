Return-Path: <linux-media+bounces-52191-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wC82G0tag2mJlQMAu9opvQ
	(envelope-from <linux-media+bounces-52191-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 15:40:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC69FE73A3
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 15:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 351763039322
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 14:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B2D413242;
	Wed,  4 Feb 2026 14:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hl7Kax3Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E34E3ED10B
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215800; cv=none; b=gAJ6Asbtt7QZ86vKlZu25BmV8UFYQECJBNpWRlEPN57eJCvgo+gMvKBFgEwsxqb2PQ46ObwcSFlvZh/nQd/kpl4F0KYPDV311cUGS2PAjAJJTnnw7hntegxsxX8reaEngwIGBBjkmcAZpdpYkHMYB4tyB5F0ujr9FoTPb276e+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215800; c=relaxed/simple;
	bh=qluAUiwfLUMJzb2W/Y6DByTBsw8lBNgs8qZOFp8eq8c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cutMHed5hnI3kGDe6WAhuIB98RvVTW37yzCARMoQ4+9quu1APdFggeoawPWjFSjbpTm5qocqGzpgOhdoPIXLCXrExu0A206nE/5AYzj8AcX6dtt33p11HTneyrnVlCwvP9/X/3VRxiIQT4c/DndGv29UU1AvxaG/3/lnwp344kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hl7Kax3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9423C4CEF7;
	Wed,  4 Feb 2026 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770215799;
	bh=qluAUiwfLUMJzb2W/Y6DByTBsw8lBNgs8qZOFp8eq8c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hl7Kax3ZpgcoFxI4ReGvZUuNXbHsQtlK4uk+B3/3d0HAuvOIFVBY0eg4A8OcO0RQ6
	 B4nSo0K0XEfcDQVdH3HJsgSNJFxsay4Zz0LDdfkIPlt9TFhWPaIOv8KhkUi2TBsuZ3
	 h/8TTpzq5gLZ2r6Sqh51y3UE6mJ/gArSbgxAoHbEEOs2sUV/Zr1/DosgNfiZ5AsfBU
	 Q+/EjmeKs2It3RVxrCXH4C+wkd4MZjmSPMxMhNFpJ/adj8h7NCE+PnIZz6k3Zb52uz
	 F9/ct8Vx4n61aUA/m2qjqAcVC8l1g2jYY0/zK7HCqpE2P2P6LSc9hUKOXeOVsu0ipC
	 BGdVKIZIk93/w==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vndzh-00000005RFV-2Ifg;
	Wed, 04 Feb 2026 15:36:37 +0100
Date: Wed, 4 Feb 2026 15:36:36 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCHv7 0/3] docs: media: multicommitters model documentation
Message-ID: <20260204153636.53d6ed47@localhost>
In-Reply-To: <cover.1769511207.git.hverkuil+cisco@kernel.org>
References: <cover.1769511207.git.hverkuil+cisco@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52191-lists,linux-media=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,xs4all.nl:url]
X-Rspamd-Queue-Id: DC69FE73A3
X-Rspamd-Action: no action

Hi Hans,

On Tue, 27 Jan 2026 11:53:24 +0100
Hans Verkuil <hverkuil+cisco@kernel.org> wrote:

> Here is v7, based on yesterday's meeting.
> 
> The main change is what a "Media Maintainer" is. In v6 I considered a
> Media Maintainer to be someone who has patchwork access and has
> responsibility for an area of the media subsystem, deciding when a
> patch is ready to be merged and making PRs.
> 
> That was confusing since that name was too generic.
> 
> In v7 a "Media Driver Maintainer" is anyone who is listed in MAINTAINERS
> for a media driver. "Media Driver/Core/Subsystem Maintainers" are collectively
> called "Media Maintainers".
> 
> I also added the distinction of being granted patchwork access: only Media
> Maintainers with patchwork access can decide when a patch is ready to be
> merged and make PRs. If you are trusted enough to be able to do that, then
> patchwork access is granted since you need that to be able to delegate patches
> and update the patch status.
> 
> I'm still not entirely satisfied with this, as I would prefer to have a
> specific name for such maintainers. Saying "Media Maintainers with patchwork
> access" is a mouthful. I can't think of a good name, though.
> 
> So the hierarchy is as follows:
> 
> - Media Contributor: posts patches
> - Media Driver Maintainer: as above, but also reviews patches and is
>   listed in MAINTAINERS
> - Media Driver Maintainer with patchwork access: decides when patches are
>   ready for mainline, posts PRs, keeps patchwork up to date. Optionally
>   has commit rights.
> - Media Core Maintainer: same as above, but is also responsible for one
>   or more media core frameworks.
> - Media Subsystem Maintainer: as above, but is also responsible for the
>   whole subsystem, processes PRs and has commit rights.
> 
> 
> 
> Patch 1/3 updates maintainer-entry-profile.rst: it introduces the
> three Media maintainer levels (Media Driver Maintainer, Media Core Maintainer
> and Media Subsystem Maintainer) and what the responsibilities are.
> 
> Patch 2/3 adds back and updates the list of Media Maintainers that
> disappeared in patch 1/3. Please verify this whether the email
> addresses are the correct ones, and verify that the areas of responsibility
> are correct and that nothing is missing.
> 
> Patch 3/3 adds media-committer.rst: that focusses on the additional
> commit rights that can be granted to a Media Maintainer.
> 
> It feels much more consistent to me, I'm looking forward to the
> review comments.
> 
> I have uploaded the documentation with these patches here:
> 
> https://hverkuil.home.xs4all.nl/spec/driver-api/maintainer-entry-profile.html
> https://hverkuil.home.xs4all.nl/spec/driver-api/media-committer.html
> 
> Regards,
> 
> 	Hans

This new version is much better than v6. There are a couple of
minor changes to be changes, but afterwards, I guess we're ready
to go. I'll submit such changes as two patches at the end of this
series.


-- 
Thanks,
Mauro

