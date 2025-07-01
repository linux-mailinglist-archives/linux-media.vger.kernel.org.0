Return-Path: <linux-media+bounces-36378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 524CBAEEEE9
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 08:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 060D97A6FF1
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 06:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7255E25DAFC;
	Tue,  1 Jul 2025 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JTePCdHa"
X-Original-To: linux-media@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2B8189902
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 06:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351810; cv=none; b=Hc9JbHvhIqhCMeoy1MYFfNkAfn2CHIWN23/now7kSCIey5vQjijkP7DrXh3fn0guNqthFZn24GCTIMjdXs2teombcJ5n7nh49Nj1lEL57naHTIoC3QAd3uvK+VvO9RKnsGNSxXi4NmVfZ/+qzi01PgynFaQ/LPluW2fN+qXGTno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351810; c=relaxed/simple;
	bh=VywDf27K3L71M4Kf98oFVXebrMs8mnbA36L1XTLGLKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uhet/vytNj8nBeqJwr3Xgv+SixGitkDXw+zQ7lcla8YrP3a6ivX4Zw/d2W1h+9eYWBLkBEC3huN+2WcaGwui9tOpai0gkLsfrbb7hZHIKO5iofj7e1coV3TJIkkN8lAZumlI3pv8Ok2VfvPvIXHrvmrjIltUn7erhJPcrGKwSv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JTePCdHa; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 1 Jul 2025 08:36:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751351796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tPAg5AV/pT/GTJrKJM3LHlIB64Dxy2IMrD6gr24pbvE=;
	b=JTePCdHarHvSJqR++muMkmcaCZv0Q8SQ8yBg9hKaa49oMDYrsk6uRszb5mUGHSDbM6hYHU
	rsKNa6Bco4g7hZbr+izujqjsvL2uYGPIGfQdKutPMC1wf8h9vmnqBM0jb2MGSIfPpDAvIf
	pSENWehRvQfHo1tNg48Wxcc1nCzRydc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Lee Jones <lee@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Subject: Re: (subset) [PATCH v5 03/10] media: v4l2-flash: fix flash_timeout
 comment
Message-ID: <22h24d6sfthwcjkslunc6odatsj3fhsr3n4v6we377fwqfob6j@6s4lyj4gjc6y>
References: <20250617-ov9282-flash-strobe-v5-3-9762da74d065@linux.dev>
 <175032584928.604443.15779695084855330292.b4-ty@kernel.org>
 <20250619093849.GA587864@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619093849.GA587864@google.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Jun 19, 2025 at 10:38:49AM +0100, Lee Jones wrote:
> On Thu, 19 Jun 2025, Lee Jones wrote:
> 
> > On Tue, 17 Jun 2025 09:31:37 +0200, Richard Leitner wrote:
> > > The comment for the flash_timeout setter mentioned it is the "flash
> > > duration". Fix this by changing it to "flash timeout".
> > > 
> > > 
> > 
> > Applied, thanks!
> > 
> > [03/10] media: v4l2-flash: fix flash_timeout comment
> >         commit: 6012ce6b30567aa8ec8dc5b648b7841f9f74ca7c
> 
> I fixed the erroneous subject line on application.

Thanks :-)

> 
> -- 
> Lee Jones [李琼斯]

