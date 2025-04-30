Return-Path: <linux-media+bounces-31455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD44AA4B2E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 14:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFD5C3B6131
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E657E221274;
	Wed, 30 Apr 2025 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyQ8sMP7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4010E33086;
	Wed, 30 Apr 2025 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016282; cv=none; b=a7O9wbY6Bko1ZD8MHx5/+qkBEGzy38vBRoX4wre6ivs5QBEvbRr4jUS7eLDT9tQcq3A5y+RcYhdtSvfTxQP7C/GUJUduYpXc0rOlqlkM2TOnRc1XhZA2KomIDqTwKmE/9RYx+66veyLjHLlU7OZlZf7ZLRvtQhuZmaftXGAUcqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016282; c=relaxed/simple;
	bh=iB2YZOoDjQR1zdB2a6h5tsxFzWaNsDK1iAYW7Qwc+iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhYDpaHgLO4aDuPyow7QaVx/7lIfMUNQeF34WXwhg1JOFACG/9FzoO9ustWoqazQAu8+KNK016d9k2p1DDYJOsJ9GlEfe1HJKgqXinZSPhzBxdlwSUP18Yh0lwS0HsMZuU1II8rvJRSFJGq7xLlZNDJvGC2jHi1GOxPwizTxI+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyQ8sMP7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3199C4CEE9;
	Wed, 30 Apr 2025 12:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746016281;
	bh=iB2YZOoDjQR1zdB2a6h5tsxFzWaNsDK1iAYW7Qwc+iU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyQ8sMP7yqCTzX/KBkqNOs/gAnRMYFtIfVihoc6NLFzNJnJccr0eLMNIX1cxGY7CB
	 jNY8OHzEjFBO3DH/IWF1AoenUKUMrxzazMFTgcivtSga1QPzfuv23OV4bp8dBZ3JW9
	 5yp9rINThbwfMjaH9hGSXbj7YTq25JH1SIdH+T9TQ5H90hftROwBZrFfVUjQ7eQEFQ
	 ws3WtrR3iperDO7z0NtZl69XQLacu4AABFzwGI+5pnQ2v+gBIVS01MOLsg1IoI4/vu
	 7WO7y8ooVq/UygKwfhKbknFuUvClBHZ0RqGCAI31jsyT8Uw2rj+8CCzpOdrtLouSg+
	 MBFRrAGCfroXg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uA6ay-000000005WC-3Sng;
	Wed, 30 Apr 2025 14:31:24 +0200
Date: Wed, 30 Apr 2025 14:31:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
Message-ID: <aBIYHD3o3wTfvg_g@hovoldconsulting.com>
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>

On Wed, Apr 30, 2025 at 10:19:13AM +0200, Krzysztof Kozlowski wrote:
> On 30/04/2025 09:25, Johan Hovold wrote:
> > On Tue, Apr 29, 2025 at 08:08:29PM +0200, Krzysztof Kozlowski wrote:
> >> Camss drivers spam kernel dmesg with 64 useless messages during boot:
> >>
> >>   qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
> >>   qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
> >>
> >> All of these messages are the same, so it makes no sense to print same
> >> information 32 times.
> > 
> > It's even worse then that (several hundred messages during use) and I
> > sent fixes for these regressions a few weeks ago:
> > 
> > 	https://lore.kernel.org/lkml/20250407104828.3833-1-johan+linaro@kernel.org/
> > 	https://lore.kernel.org/lkml/20250407085125.21325-1-johan+linaro@kernel.org/
> 
> Oh damn...
> 
> I developed this on top of next, so already with your fixes included,
> but - following standard kernel coding practice that drivers should be
> silent on success - I think even debug messages are not needed here.

Ah, ok, it's based on my fixes and just removing the debug printks.

I think that should be made more clear in the commit message as debug
printks are not enabled by default and the rules for those are less
strict.

> There is really no point in printing (even as debug) version of hw block
> EVERY TIME I boot the hardware. It does not change, does it?

Well, it doesn't hurt to print it once on probe if this is something
read out from the hardware, but clearly printing it hundreds of times
during use make that debug statement pretty useless.

Johan

