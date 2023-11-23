Return-Path: <linux-media+bounces-937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF5C7F6643
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 19:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED69E281CB9
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 18:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E79D3E49F;
	Thu, 23 Nov 2023 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSwA2vh8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF24C3A7
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 18:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F41C433C7;
	Thu, 23 Nov 2023 18:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700764298;
	bh=24Uq7WK8dsTpcsc+4/DvLuXT2HlvhDJHUNfuBy6tNTY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sSwA2vh8Gd4VAetxhILxIlCb6/AUupXiBXf5GbjUad5cp5Z9wWYGFd/RUUT/B4xvA
	 JFkN0PRj6xVmnmZg0+oox4uWUZmijMCe8325sAh1umP2Xtf4bJ6X7hWco/7Y6gp7tn
	 Ebj8RyZmW/5jAdScLf9YdJYJ5muvfddOimGt2gRhMCUmV+vdvlGBgY0r5+j2ikB5dY
	 ti2Rf41XE/FwGp+fn8X8nPJeyll740Npi+qsOqUoqDSaubvsWt4bbK2dHvrRig9A79
	 UACrrqr0US1v0pz5ivKKuA97ip6arMSOXIi0hFL2raIQ0WL3D85WwKJMpV3bPbk7Vz
	 lGkyCaE5ZkxfA==
Date: Thu, 23 Nov 2023 19:31:33 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 6.7] Mediatek Vcodec: Codec profile and level
 setting
Message-ID: <20231123193133.5f7323bb@coco.lan>
In-Reply-To: <CAGb2v64+-DE0t0M0aVQ4tBnMgsmaP96AeAJDy4AWPc0icAKfng@mail.gmail.com>
References: <20231027085058.k65rwgxepmx5ivu5@basti-XPS-13-9310>
	<20231123110230.7c7a9d8e@coco.lan>
	<CAGb2v64+-DE0t0M0aVQ4tBnMgsmaP96AeAJDy4AWPc0icAKfng@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Thu, 23 Nov 2023 18:38:38 +0800
Chen-Yu Tsai <wens@kernel.org> escreveu:

> On Thu, Nov 23, 2023 at 6:02=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
> >
> > Em Fri, 27 Oct 2023 10:50:58 +0200
> > Sebastian Fricke <sebastian.fricke@collabora.com> escreveu:
> > =20
> > > Hey Mauro and Hans,
> > >
> > > first attempt at doing a PR, could you please check and pull this?
> > >
> > > The following changes since commit 19e67e01eb1e84f3529770d084b93f16a4=
894c42:
> > >
> > >    media: venus: Fix firmware path for resources (2023-10-23 12:24:53=
 +0200)
> > >
> > > are available in the Git repository at:
> > >
> > >    https://gitlab.collabora.com/sebastianfricke/linux tags/for-6.7-si=
gned
> > >
> > > for you to fetch changes up to ccd08a80f5e1844819874b01c5ff61e18aa9e1=
33:
> > >
> > >    media: mediatek: vcodec: Set the supported vp9 profile for each pl=
atform (2023-10-26 09:09:21 +0200) =20
> >
> >
> > Checkpatch is producing some warnings here:
> >
> > WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possi=
ble unwrapped commit description?)
> > #32:
> > The following changes since commit 19e67e01eb1e84f3529770d084b93f16a489=
4c42:
> >
> > ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <1=
2+ chars of sha1> ("<title line>")' - ie: 'commit 19e67e01eb1e ("media: ven=
us: Fix firmware path for resources")'
> > #32:
> > The following changes since commit 19e67e01eb1e84f3529770d084b93f16a489=
4c42:
> >
> > ERROR:NOT_UNIFIED_DIFF: Does not appear to be a unified-diff format pat=
ch
> >
> > Could you please double-check those? =20
>=20
> It seems like you ran checkpatch against this pull request email, not
> the patches to be pulled in?

True. The problem seems to be due to whatever tool Sebastian made this PR.

My scripts rely on the format produced by "git pull", being picky with
the URL there. In particular, on Sebastian's PR, the URL is:

   https://gitlab.collabora.com/sebastianfricke/linux tags/for-6.7-signed

(3 spaces before URL)

While git request-pull produces:

  https://gitlab.collabora.com/sebastianfricke/linux tags/for-6.7-signed

(2 spaces before URL)

Anyway, PR applied by Hans.

Regards,
Mauro

