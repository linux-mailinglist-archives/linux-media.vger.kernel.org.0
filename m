Return-Path: <linux-media+bounces-30428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB529A914B5
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 09:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63C4E7AA064
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 07:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6A2218589;
	Thu, 17 Apr 2025 07:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jI+pvAHp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856882063FD;
	Thu, 17 Apr 2025 07:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873537; cv=none; b=afdLsWuXMlej4epzxFlyVDe46LMcr4avKVoUtRg6DDaPclCAK7QPlPay9vNrDPHWtsMzlSLAwIuOM4yj0rkQG/tGOTs4nFDBgiottu6EarQJjhk2TzLjhuKT8kZmlSk7vXC+1NP7QKuhGr1YQzAoTWlX36fh8GTmATKNkHhQQy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873537; c=relaxed/simple;
	bh=HXk4O8PMWonZDVGYsC+GG/p3eTnTGqZeZARIUtOwmWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZR1a1ekdapLFVzWlmYSo78FIqnhMhigjY3R/vuQsABkEq6DjrQRufrvoHlDXNMTqeoGWqEDftNQbhwbvKFDvTYuvU3m1Ng3XriKhxqK0LH0ivzbeOFrUOSr4h5yB9DFhx3wAwnqhBLQ6k+8gSbPJ04MEZiJkUMiLjStQXChCd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jI+pvAHp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D0CC4CEE4;
	Thu, 17 Apr 2025 07:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744873537;
	bh=HXk4O8PMWonZDVGYsC+GG/p3eTnTGqZeZARIUtOwmWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jI+pvAHpmd7VY5o+w0aJbKAF+X3uQwMXqELGRlHY+4ARFRGmaQ6Zpr2WrlBdLZe1y
	 RJckbMt7Ltg9ebBPcqyUn1NxiXygdUkDKWA4C3AS6y/eeEa/NCIra+UZqmqEdDDTLK
	 KtOy7Pm6swIFMqu5VGIPDMAm37adJEBw5xWmd/wVjXTYaU44LY/5xIcV2uMRKtQprN
	 75l00jZaVGDBKKB/nmidNcO4pLtKxc3SXcxUgMbr79NBshBTujFAwaWPtFto/PbHEL
	 2fPzUWNiSjruyYrFaZe7nmMb1L0UGg2FdjmdwWMbyI+br0iz2ahVRBReQxLlpI0AZZ
	 pt9agOJIn0BJg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u5JJY-000000005lf-2mza;
	Thu, 17 Apr 2025 09:05:36 +0200
Date: Thu, 17 Apr 2025 09:05:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Nikiforov <Dm1tryNk@yandex.ru>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH v3] media: davinci: vpif: Fix memory leak in probe error
 path
Message-ID: <aACoQJbpN5v_UGrj@hovoldconsulting.com>
References: <20250416205121.2348-1-Dm1tryNk@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416205121.2348-1-Dm1tryNk@yandex.ru>

On Wed, Apr 16, 2025 at 11:51:19PM +0300, Dmitry Nikiforov wrote:
> If an error occurs during the initialization of `pdev_display`,
> the allocated platform device `pdev_capture` is not released properly,
> leading to a memory leak.
> 
> Adjust error path handling to fix the leak.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 43acb728bbc4 ("media: davinci: vpif: fix use-after-free on driver unbind")
> Signed-off-by: Dmitry Nikiforov <Dm1tryNk@yandex.ru>
> ---
> v2: also fix of_graph_get_endpoint_by_regs() error path.
> v3: Rework incorrect error handling added in v2.
> Also fix missing platform_device_del() in another error path (Johan Hovold).

Thanks for the update. Looks good:

Reviewed-by: Johan Hovold <johan@kernel.org>

