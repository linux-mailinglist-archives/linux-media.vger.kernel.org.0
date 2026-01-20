Return-Path: <linux-media+bounces-51100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F941D3C21E
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 09:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 14E05601AC4
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 08:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E49D3D2FE0;
	Tue, 20 Jan 2026 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TmcUMvp8"
X-Original-To: linux-media@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A6F34677F;
	Tue, 20 Jan 2026 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768896895; cv=none; b=STbABm2tKWP1rWZXHR7s5Ia49f/CYr4S1J8PLA46I9XxQjKImcaT5iSD6XYKwqDhADo767WElmEnSIS/WAmBBh3hZxgI8Dmn+4d3V4nxTPWRVuSMuzzPyB2qFa4lkJtKe71sFbOd2sqRjQQj0CReb5srX0bpLj0xFtSUavUSxrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768896895; c=relaxed/simple;
	bh=dH2vb18gq0lGLuHit1+8NSp+UbWJMoGrvmzkizN3NQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sA1E8PF6qocVMUHC/T4GIyJSkNdGJiaj6aEq+kU7gRypB5fUzEXmfLtc08Xu4g3nOKdRbPp/PrT7hUgYBG8C7fR/vQ93vlWcuLGQe+12wPiJ/b8zsxC3i0IwTKQiY3EqkALV7f1TMqDMRubPh1DsKmnlIxE0ALN6bZw25v/2EPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TmcUMvp8; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 20 Jan 2026 09:14:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768896880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fLtFMi1EZ7ac19bK6h/j0xn6vzb2Kz5knTHzfLNFIbA=;
	b=TmcUMvp8SxH0C2l11XoViyR/4fu7D3ylpWMwExDJ2TE/cI93M+s2I6FxXIZP+SQxLFGfEU
	RgZBOtfq6ISjn/fC6X4nk4+UmUsZMyNpMtIlEyuHpkRxnsFPkiu3y/wPYlyQOiSDRh7Kh2
	+ipH4yUXdwLEe9nsoK8Uhd+dRzuvsH4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v10 0/8] Add strobe duration and strobe output enable
 v4l2 ctrl
Message-ID: <66eqyvqglu4tw646ic6lluaktlrapp4i6pk4bwatbs6za42yu2@o2osfjlj6uwm>
References: <20251209-ov9282-flash-strobe-v10-0-0117cab82e2d@linux.dev>
 <h4ecxwe27hzelohvwhhosvdz5b6ybi25yopicatp54prrkaaai@sir4kskvxza5>
 <lwib4og3xnpmqrvmkenp5m6qywuzwmzilpdh74ugx2jfbm2s2o@zyvplzxtkepo>
 <w43pelg4dzxxswklhnlpmql5snvyjfvvc2hzl4ihvjkklvg2ei@6veozvnjc7pw>
 <aWoFN3XmDRoeOwfB@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWoFN3XmDRoeOwfB@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

On Fri, Jan 16, 2026 at 11:30:31AM +0200, Sakari Ailus wrote:
> Hi Richard,
> 
> On Fri, Jan 16, 2026 at 08:08:13AM +0100, Richard Leitner wrote:
> > Hi Sakari, Hi Laurent,
> > 
> > first of all, happy new year 2026 to all of you.
> > I hope you had a good start to the new year?
> > 
> > Regarding this series: Perhaps you've made it your New Year's resolution
> > to give it another round of review? ;-) Would be great to get some more
> > feedback (or Reviewed-By's).
> 
> Thanks for the ping. I thought this was already merged... oh well. It's in
> my cleanup branch now.

That's great news! Thanks. If there's anything I need/should do, please
reach out.

> 
> Thank you for your efforts on this. Having these controls really improves
> the flash LED control APIs; hopefully there would be also more users for
> these as well.

Thank you for reviewing this series and being patient. I learned a lot
between v1 and v10 ;-)

Regarding adoption of this new controls: I will do my best to promote
it: https://fosdem.org/2026/schedule/event/A7P7XE-v4l2-flash-control/
;-)

regards;rl

> 
> -- 
> Kind regards,
> 
> Sakari Ailus

