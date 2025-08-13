Return-Path: <linux-media+bounces-39842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4A9B255E6
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 23:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 020751C87D2B
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 21:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23762E716C;
	Wed, 13 Aug 2025 21:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l2/COFig"
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21BA3009F0
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 21:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121584; cv=none; b=KAUf/PNgYP81/fFMOaCmtCButBe0pP4K/lnjSfQzH3pzEQK1cD7pL20IhFBV4R4T7UDrsjmLECmtZRPbMguPM1rNffnYC+3NRkVoHfZ7Z1evgNKShaCBO1C0c6NcG5DCxiWcKD8xprPnbZvcURqbGwsXpWjBIGEj4oKK291921I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121584; c=relaxed/simple;
	bh=Y8ZT1omRWVh2D9pbGNUAIUVOIcYLDnqbxdj4q0qn92o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPllXAF2JlNd52LGP+mekZROj28SYUTMuCVY1q1zrpuDLMVEfNQHss+KyPQ61SEQ4rceDGFMxy9fIxXiXiBSMqWJetNUkM4oM47kSZS5LyxmrN0nmbppWPYJHH2ocAkWj7lTtXRnWAXFNXRTBHUK72ICpT8fBUXDLYeydgIXYik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l2/COFig; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 13 Aug 2025 23:46:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755121569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/DqFL26+UsS+8mNqc4oz88CmU86CRRwfKfxjUz3a3k=;
	b=l2/COFigXLA1PcXRav9SSuBhtOpmcB4C3+TNzdqWZ85P8fhGNjusU+tWOaepjs787SYydf
	JbhN0MMYtaMMk4D5j+BIOEjj0hN/a/g0XXvHv8ag9/oyQqCq4EfzibWxvJ1ApR/u7dqKCm
	RogDvtQKVyqv7vCZbEjNT32hvzKsMsY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Subject: Re: [PATCH v2 0/2] media: nxp: imx8-isi: fix streaming cleanup on
 release
Message-ID: <5szbp7ae7sbfpzvfw73t2l5cwgd7i2hjmeljhmf4mxz32agwth@ycttzoi5ux46>
References: <20250813212451.22140-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813212451.22140-1-laurent.pinchart@ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

Hi Laurent,

On Thu, Aug 14, 2025 at 12:24:49AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series fixes an issue initially reported by Richard in [1],
> with a proposed fix. I've recommended an alternative approach, and gave
> it a try.

Thanks for reviewing that patch of mine [1].
And thank you for providing this alternative approach. It looks way
cleaner now :-) I previously tought of a similar approach as yours,
but then opted for the "less invasive" one. So again what learned for
me. Thanks!

As I've never had such a situation and wasn't able to find something in
the docs [2] about it: Do you need/want a Reviewed or Tested-By tag on
patch 1/2 of this series? (Altough there's also a SoB from me before
your Co-Developed tag)

[2] https://www.kernel.org/doc/html/latest/process/submitting-patches.html

regards;rl

> 
> Patch 1/2 fixes streaming cleanup on release. Patch 2/2 then cleans up
> the driver a bit by dropping an unneeded structure field.
> 
> The changes have been tested by opening and closing the video device
> while streaming in another process. I have also tested suspend/resume
> during streaming.
> 
> [1] https://lore.kernel.org/linux-media/20250709-imx8-isi-release-fix-v1-1-c47c659ce1a6@linux.dev/
> 
> Laurent Pinchart (1):
>   media: nxp: imx8-isi: Drop mxc_isi_video.is_streaming field
> 
> Richard Leitner (1):
>   media: nxp: imx8-isi: Fix streaming cleanup on release
> 
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     |   3 +-
>  .../platform/nxp/imx8-isi/imx8-isi-video.c    | 156 +++++++-----------
>  2 files changed, 57 insertions(+), 102 deletions(-)
> 
> 
> base-commit: 078f1a7eb48eef9b3cb78bcd2254356f3a332358
> -- 
> Regards,
> 
> Laurent Pinchart
> 

