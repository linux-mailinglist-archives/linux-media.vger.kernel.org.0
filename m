Return-Path: <linux-media+bounces-35250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F3DAE01D8
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 11:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE6A37A8BA9
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 09:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4148821D3FD;
	Thu, 19 Jun 2025 09:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrrfDgS6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D5F1E3DE8;
	Thu, 19 Jun 2025 09:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325934; cv=none; b=tVLg8ShEulIlNvKqPP/SJ1tTJYA382DoECzeqTbFn/jko0wpt1ISOwgq1/xycKPgsW0SNmQElZ+Hi6H0A2WWjlUo4uHklXeE8vaSPch+k2voWarU+aL2VlKmH+pxoP0F470lENCPHSeHwg5LRbuSwo/iSgLCmDkQJFA1mMtguuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325934; c=relaxed/simple;
	bh=tmPwogviHT2zinOSdzIGFje8vEkoX+6eWwlv0xTMK60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqZau5sa4UwjUj83AVnuKST1WCcKmXhOwdFG9Rvp/fdK5b0eKZYPJIL8UQT89f9TQQv5f5yn1sYUj1q6xVbBQ80jzZlSNFkDWKJSpFXRsa0/8l/2zKPrrwY7IywMF84XbtBPVcjxbR1hjQxeJWgxb9MdSqPfoDwCQ/9y+T+5DKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrrfDgS6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2221EC4CEEA;
	Thu, 19 Jun 2025 09:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750325934;
	bh=tmPwogviHT2zinOSdzIGFje8vEkoX+6eWwlv0xTMK60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lrrfDgS6itvAmIkOVw23+q0nuVf2a2Jh2D+eFdQX8yBKxFtfwn//XfFogywS7IY0o
	 WHn8qI7YgUg4g3gjdEBEZeDZymnkY9HRhzN9H4O+DdRwl4UaDa+HEdZsf524DsQGTs
	 NSmkhCips6XOKaqbj5yqsfcH35fretoxGA4LCDyFnGkOCYoJ3zMcGMIKXQJNUw1T7U
	 /818820O1TY3iPxKtPXu2GWWec42I0dwu4j2E0FNRBuPxbZjQUE+ORVGjlsDXenGsN
	 MA9KJZPXLxQmaPIXG019HFxfmCq4Ni/Qg9pzJWM7/1VUhK5l0joxsiYj+Nmc2zFTgt
	 RwAieXvGd7Zxw==
Date: Thu, 19 Jun 2025 10:38:49 +0100
From: Lee Jones <lee@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Richard Leitner <richard.leitner@linux.dev>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: (subset) [PATCH v5 03/10] media: v4l2-flash: fix flash_timeout
 comment
Message-ID: <20250619093849.GA587864@google.com>
References: <20250617-ov9282-flash-strobe-v5-3-9762da74d065@linux.dev>
 <175032584928.604443.15779695084855330292.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175032584928.604443.15779695084855330292.b4-ty@kernel.org>

On Thu, 19 Jun 2025, Lee Jones wrote:

> On Tue, 17 Jun 2025 09:31:37 +0200, Richard Leitner wrote:
> > The comment for the flash_timeout setter mentioned it is the "flash
> > duration". Fix this by changing it to "flash timeout".
> > 
> > 
> 
> Applied, thanks!
> 
> [03/10] media: v4l2-flash: fix flash_timeout comment
>         commit: 6012ce6b30567aa8ec8dc5b648b7841f9f74ca7c

I fixed the erroneous subject line on application.

-- 
Lee Jones [李琼斯]

