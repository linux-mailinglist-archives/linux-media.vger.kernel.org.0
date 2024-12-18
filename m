Return-Path: <linux-media+bounces-23709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F33219F69EF
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 16:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E48E167120
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 15:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462191DE3DE;
	Wed, 18 Dec 2024 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TskqVGxa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993961C5CC2
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734535426; cv=none; b=JnBVwZvax+IUK5c8yf6Qk8WTUSEo7wM1NIf7blJDzrhUFYSTv/obNrnOMTL/ZiLUE/BlOIcqBhWOAPoIVsQQ/P+2ojvXxtp5VKIQ5za8mj74ds+noAIoZyRFWeXBXPRnn+Zs+Ibp+Vds9QnI4XdBFfomCSku0R4hY9B65jDi4Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734535426; c=relaxed/simple;
	bh=6isPewvZO7mep6ORXfFLvPJtKQXnrg1IW8DlfaqLYRA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BtiCZyPl2/OtJYTBBR/mj4Zugkj4TOHRNWrSpW1qvRaRCpyJy1XBmHw2sra3IbX5ZXlD/cs5NSVZ9tmZe9GYKSVDI4qvjuBRx0fchaWWmpyStailSwx4FxayN0cEsWaqPgYY5XpNxnNuCE1sPb6VQM7f7sDzJTA9f324afgzlzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TskqVGxa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE02EC4CECD;
	Wed, 18 Dec 2024 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734535426;
	bh=6isPewvZO7mep6ORXfFLvPJtKQXnrg1IW8DlfaqLYRA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TskqVGxaykkVLnnPMzKiKKPgWKSTPZaO8XTsGtH/OFy5TpYHX2OoCtjIJhvHn0czm
	 9MBPNWtXvBNFaZ5ktPlqI88LvgwoAa14+jOmB5gPmO3aEPNNaw2w8yjw3W1P+yOHUv
	 tJGM1rMFk8Z3jsEXdYcvlTNwqN8g/sZmZco/QbVuYZOm9N6q4+zi8Zd90GYWv/xX6l
	 yt1/kqhKg5faLwITS/J2OFr23RDf8BKsL6xpmnTxV9JV9k7odFkurfM/oEoVvvFbtH
	 s4B/QEA5ZLN5bS8WK4xullLiXAcjV4LRcWgv4S1HfqLmDGjTf9dq6X63bajQXMDgOx
	 0H5kVoh97hTkA==
Date: Wed, 18 Dec 2024 16:23:41 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linuxtv-commits@linuxtv.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [GIT,PULL,FOR,v6.14] imx8-isi fixes and improvements
Message-ID: <20241218162341.4c6f1814@foz.lan>
In-Reply-To: <20241218021847.GA1844@pendragon.ideasonboard.com>
References: <20241218004058.GA24802@pendragon.ideasonboard.com>
	<67622b40.050a0220.3a9c93.6e95@mx.google.com>
	<20241218021847.GA1844@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 18 Dec 2024 04:18:47 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> On Tue, Dec 17, 2024 at 05:54:08PM -0800, Patchwork Integration wrote:
> > Dear Laurent Pinchart:
> > 
> > Thanks for your patches! Unfortunately media-ci detected some issues:
> > 
> > # Test media-patchstyle:./0001-media-nxp-imx8-isi-fix-v4l2-compliance-test-errors.patch media style
> > WARNING: Commit cf21f328fcafacf4f96e7a30ef9dceede1076378 found in the stable tree, but stable@vger.kernel.org not in Cc:
> > WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")'
> > #16: 
> > Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")  
> 
> I don't think Cc: stable makes sense for this particular commit.

Sure, not all commits are actually fixing things, but, in this
particular case, it sounds that it contains a real problem:

	Running the v4l2-compliance (1.27.0-5208, SHA: af114250d48d) on the m2m
	device fails on the MMAP streaming tests, with the following messages:

	fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
	fail: v4l2-test-buffers.cpp(1508): buf.qbuf(node)

causing userspace to fail. For me, it seems that such patch needs to 
be backported.

In doubt, please add c/c stable when fixes is used. If there are good
reasons why not doing it, please place the rationale at the patch.

> > total: 0 errors, 1 warnings, 15 lines checked
> > WARNING: ./0001-media-nxp-imx8-isi-fix-v4l2-compliance-test-errors.patch: Fails some mandatory checkpatch tests
> > 
> > # Test checkpatch:./0001-media-nxp-imx8-isi-fix-v4l2-compliance-test-errors.patch checkpatch
> > WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")'
> > #16: 
> > Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> > 
> > total: 0 errors, 1 warnings, 0 checks, 15 lines checked  
> 
> This I can fix. I'll wait for replies to the above though.

Please do it.

The rest of the PR sounds OK on my eyes.

Thanks,
Mauro

