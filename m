Return-Path: <linux-media+bounces-32218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C981AB220E
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 10:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E83EE4E177F
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 08:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0541F1E9901;
	Sat, 10 May 2025 07:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Y8BrEOej";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gHHHOHWO"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032711E991A
	for <linux-media@vger.kernel.org>; Sat, 10 May 2025 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863942; cv=none; b=M4oNAQYk42evLtQO+1pHspEakHg63Nl2yevO12OrwbtlXqaEcjfaNKGvbpYlQh43hUB1qRlOBRot8GS5A8LJ0NnW64kM5dfNikj3rK65Z/Wqr09CSkFePsMhuBx2ZtDx+aqprhcHUf4wkgNV842zEYP3b2G449ZyIN3iqlIRAeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863942; c=relaxed/simple;
	bh=DhZAlpZZfySq9jgd/MNvY48t2EhLzLEPM7E7t0Jx+ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFvvcqnA2gDAmjCcvsaOlLHU78rZXYRvv6ByJEhzVRTlzmPzoSRgTdKjIS6EKVDLchNtXJI7gMNrnMAjxNP1xRZOu/PXjnjFs6Mxt1eNShkypwXKKS73JdfuCV7gQ9/Mx8OsdJ3Lf0ApmpoZsYEQhS0+tq9WujnLrPln9sWIwqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Y8BrEOej; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gHHHOHWO; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 92E9D114013F;
	Sat, 10 May 2025 03:58:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 10 May 2025 03:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746863937;
	 x=1746950337; bh=g1V29Bf+SJmrjO7SHblCDnuqZu/LkA7jBvlYNTMQyoE=; b=
	Y8BrEOejwThJcglj2Xif5Uk9+po6Swrrjx2uqpCmNCigwxP7MhS8YReEs6XxHky1
	5l2uGGO911P7VLeTuIAIqIcJE8wlZZKtSk88gJxgHcl7vFwA62P176vMtB9pIBip
	eGRcFcsjWZttZQsKoU5WcOWNYi6QqeSGs2AO2H0Dm10DjEEWPDH62ZBsOdQwv15v
	CWpPqAEaURKW4IKdTcm4LcAP4EpaNyUW5OrepCi9GeKe/EUF6YPkDtR+MC7/kZu0
	imOw41YnyNJ1zR1ZGSWz6NmGa+QYb7km3meSm+YZ/h0uKueKDqVEfRAPkkVsmU8c
	ciIQQjvs26+GJjiGn+ZcPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746863937; x=
	1746950337; bh=g1V29Bf+SJmrjO7SHblCDnuqZu/LkA7jBvlYNTMQyoE=; b=g
	HHHOHWOEg2ksJzz+aliTtioxW4faKaM9M0NF88NN4ZnJXKvWLJRmtgUkvI38yIiJ
	1xOgut5Sf5cfUu/uiH8baAeHxmR5iZnfEFvWKA8QzpVSYddwP52WLsmcbykpwNeT
	DqLEBO8LcHG8zJMqdpry/Cuk0+8OgbEUyjeiALfRBkyPdLTp201HYhLx/uaSyP+z
	qAQply90EiOuWbX6pg0J1H4pO6AwixHaQ0YlQW5LKhM1dd9SoAPn43qjM1oK/soq
	4kvttlR+YnIkB/dL824/XIH7El3MRPr7S0rOH5e5yWU9EoBSsF4PGQKihSQYXLP5
	5XICSMeiWWx4o7wI5V86Q==
X-ME-Sender: <xms:QQcfaO33A5_FG7nXznvbr2azbHay6-0Vr50oFSpHUrNIrvGO_JWi9Q>
    <xme:QQcfaBGa4aErGIyMbtVtZNX-B_H1PJLEmlsF37mxFeq0oJw5gbBF9DC2MS2uczNjk
    CwMIanXBOF-xkLylnk>
X-ME-Received: <xmr:QQcfaG43hlpxe0FHwpjvirKfedjCQtzblBGg2vQxpH7kwvUbBIb1KdGPmu4_o1TZjm7vZYdLaTBiPkdJNQ1_BTtfqtL90DL9SQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleegleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehhedvteehudelkeejudfhvdfgkefhveffffelfeetjeehieelveeuhf
    euvddvieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghl
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghh
    rdhsvgdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprhhisggrlhgurgestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    mhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:QQcfaP3ZPeOu4hxdt6xFFOwIY2Nu_E3bckDxntyYNgheVmFCFTqN3w>
    <xmx:QQcfaBHjruqu05kxH9LOL2fpQjjQZl-mJWd-sU2H8a5nsxmbUU7AhA>
    <xmx:QQcfaI-QCp_W_flInzSnQG6whDZRAak9dYJoKS6JnEEWbVM2xDgCOA>
    <xmx:QQcfaGmY0e3YJbuXL0oin3a0OsSU4ociMU3dzQZVcOsYrFSBS7edxA>
    <xmx:QQcfaGOYWv4rA7fM8U1yI52UDP6yeNvzyBKY5ebn0uB4G2GGJQMmHn8G>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 May 2025 03:58:56 -0400 (EDT)
Date: Sat, 10 May 2025 09:58:55 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org
Subject: Re: media: v4l2-common: Reduce warnings about missing
 V4L2_CID_LINK_FREQ control
Message-ID: <20250510075855.GB1730172@ragnatech.se>
References: <20250508083745.1697364-1-niklas.soderlund+renesas@ragnatech.se>
 <681e71eb.050a0220.3a7ab3.60bf@mx.google.com>
 <20250509221131.GA1722387@ragnatech.se>
 <CANiDSCv-NFw1jbo-gyxPT=P+=mM1Mkdx71kMcTWYPKFjAD75GQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiDSCv-NFw1jbo-gyxPT=P+=mM1Mkdx71kMcTWYPKFjAD75GQ@mail.gmail.com>

Hi Ricardo,

On 2025-05-10 00:26:12 +0200, Ricardo Ribalda wrote:
> Hi Niklas
> 
> 
> On Sat, 10 May 2025 at 00:11, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> >
> > Hi Ricardo,
> >
> > Thanks for all the effort you and others put into the media CI!
> >
> > I just got this error report from the CI telling me a patched failed the
> > style check and I don't fully understand the error message, maybe it
> > could be improved?
> 
> Today I have to recreate the repository where  patchwork-ci fetches
> the patches and for some minutes the user.email and user.name was
> misconfigured and took the system default.
> 
> You were the lucky one :P. Sorry about that

No problem, I just wanted to understand the issue and if I needed to 
change my workflow somehow. Keep up the good work!

> 
> >
> > I read you where working on the CI and as far as I can tell you where
> > the one who committed the patch in question. I hope I my report go to
> > the right person, if not sorry for the noise.
> >
> > On 2025-05-09 14:21:47 -0700, Patchwork Integration wrote:
> > > Dear Niklas Söderlund:
> > >
> > > Thanks for your patches! Unfortunately the Media CI robot detected some
> > > issues:
> > >
> > > # Test media-patchstyle:./0001-media-v4l2-common-Reduce-warnings-about-missing-V4L2.patch media style
> > > ERROR: ./0001-media-v4l2-common-Reduce-warnings-about-missing-V4L2.patch: Committer Ricardo Ribalda <ribalda@chromium.org> is not the last SoB: Niklas SÃ¶derlund <niklas.soderlund@ragnatech.se>
> >
> > Do this mean you should have added your SoB when committing the patch?
> > Or is the CI confused about me using a +renesas both in From: header and
> > in my SoB? I don't understand where the error message got my mail
> > without +renesas from.
> 
> The checker removes everything between the + and @. That is expected.
> 
> >
> > Minor sidebar, the mail charset was set to utf-8 but somewhere it seems
> > to have mangled my döts :-)
> 
> The döts looks like a bug. We have two options, you can start the
> legal process to change your name, or I can look into fixing the
> encoding.
> 
> I will try the second option first  :P
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues/106

Awesome thanks! Seems you already have a proposed fix published, I will 
put the legal paperwork back in my drawer ;-)

> 
> 
> Regards!
> 
> >
> > >
> > >
> > >
> > > Please fix your series, and upload a new version. If you have a patchwork
> > > account, do not forget to mark the current series as Superseded.
> > >
> > > For more details, check the full report at:
> > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/76068776/artifacts/report.htm .
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
> > >
> >
> > --
> > Kind Regards,
> > Niklas Söderlund
> 
> 
> 
> -- 
> Ricardo Ribalda

-- 
Kind Regards,
Niklas Söderlund

