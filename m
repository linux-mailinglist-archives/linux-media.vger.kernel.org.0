Return-Path: <linux-media+bounces-41553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C41B3FC85
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2239A4E3579
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E50283FF1;
	Tue,  2 Sep 2025 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HE91gcmx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C400032F757;
	Tue,  2 Sep 2025 10:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756809174; cv=none; b=DeY3L+viVxGOPeboLPscxsBf23dZ2uJWHzWe0qhNEtf86NUV1FeYUQDbIAoxq1vN3nhgn5P/ElzVt24cbLowr2DgCu3/Jcm2k0OljJ2MtD5TsaJKM3IYMBL/leiVIXNhZpWwcBKpe1KMi7iXd2z7YL6wpyzmJYP5G6oPgFymG0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756809174; c=relaxed/simple;
	bh=/Xb7tjcBTs0irk+53t/twPJrZDuNfzc0qeTp6XJFqPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cB6veRWC1Da/jSivVx+2eM5xhnBXYq/2SHUy6eCFRKx8YfoozPehTryldctHmtR1Vj/rTSdiLrWFFtCNJIvQ+C0EhdK1Hskh97Fi4d3QM9Llsb2mDrspVHJPXxfhOGiag+2vF80AJSn4CIPQPBlNiJ5v0uKSuzoRsU49hz9dcMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HE91gcmx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3273EC4CEED;
	Tue,  2 Sep 2025 10:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756809174;
	bh=/Xb7tjcBTs0irk+53t/twPJrZDuNfzc0qeTp6XJFqPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HE91gcmxT+twJbwhYN33w1GmU3/c6KhtfcvBeHeYmGx/oK0OuBfdgCtmDdCIp7FC0
	 eSGJ7cZJSuh+/6mZB3PGRvO3BrIZRBu2dHZqtudOOSZUfYC1o7AIDHJ77pY2CR3yn5
	 nv6YJZcbu0KT0RVVrARt4nGZ3RGLwr7FtkOhIYjGkrEagmMM6/2aUpR/mqKIDbE8Ra
	 WjnT9Q+xK1uxYuwC6zYLcjl83Mp2a3tM796W5pKhnPsCfcVXYbcdu0QPzk4SdJcV23
	 KFOifRYtH4mhjP4ewcETZiNRjUYz8n6duRwgNjwWj59dB5+mSzuGQHTlOMprfueU2v
	 HnRqfkqalSr8w==
Date: Tue, 2 Sep 2025 11:32:49 +0100
From: Lee Jones <lee@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux@treblig.org, arnd@arndb.de, mchehab@kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Remove the wl1273 FM Radio
Message-ID: <20250902103249.GG2163762@google.com>
References: <20250625133258.78133-1-linux@treblig.org>
 <20250808154903.GB23187@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808154903.GB23187@pendragon.ideasonboard.com>

On Fri, 08 Aug 2025, Laurent Pinchart wrote:

> On Wed, Jun 25, 2025 at 02:32:54PM +0100, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > I noticed that the wl1273 radio had an unused symbol, but then noticed
> > it is on Arnd's unused driver list:
> >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > 
> > So, delete it.
> > The components seem pretty separable, except for Kconfig dependencies.
> > 
> > That lore URL is over 75 chars, which checkpatch warns about,
> > suggestions welcome.
> > 
> > Dave
> > 
> > Dr. David Alan Gilbert (4):
> >   media: radio-wl1273: Remove
> >   ASoC: wl1273: Remove
> >   mfd: wl1273-core: Remove
> >   mfd: wl1273-core: Remove the header
> 
> Mark, Lee, how would you like this to be merged ? I have a large patch
> series targetting v6.18 that depends on 1/4, and I would like to merge
> it in the media tree as soon as possible after -rc1 gets released.
> Patches 1/4, 2/4 and 3/4 are independent of each other, but patch 4/4
> depends on the first three. Can we merge 1/4 in the media tree and
> provide a stable branch right on top of -rc1 ?

I'm also set-up pretty well to provide this.  Happy either way.

If you decide to take it:

  Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

