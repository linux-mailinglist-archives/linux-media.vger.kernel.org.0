Return-Path: <linux-media+bounces-8730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A62899AF6
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 12:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B04AC1F21020
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 10:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F16012CD8F;
	Fri,  5 Apr 2024 10:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ioB9Qn76"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D787748A
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 10:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712313257; cv=none; b=R0HcIh7GqUd7U7ifV3/gFKjGsMsYIs63MTakdA0GNfGSue+aebf25Ii6rPHP7pSiemVBeiW6WxboJTIPOqxWYcD57dU/4M/FMaRAoFTWPScpHdwBmF0ny3MrXr10ysntFmclct4SsjNUdcobRrskxQWA0zgXLThvZP0g0BgvgCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712313257; c=relaxed/simple;
	bh=Ki+Q5Lk1tqES9yiJ4CyGCRmvs2hLUYHblbTpIWEx5Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEluJINbWJ0HfGJuhrGaKdBe9zlQThCYLQ2nQxeqis5cR9NdXnvMd3Bl/uheOxv0+4kp1/xj+aYXpbGEdSuCmZs+eqlOJuE8HprNUmZ7WcJMcK/3I5Y2PkNwt7rl/n7+YnmB5N4tivN1yBaCYL4XWjquvHxsCLunRgK+vidvjgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ioB9Qn76; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-51-50.net.vodafone.it [5.90.51.50])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BB36B9A;
	Fri,  5 Apr 2024 12:33:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712313214;
	bh=Ki+Q5Lk1tqES9yiJ4CyGCRmvs2hLUYHblbTpIWEx5Fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ioB9Qn76suMiDmW+3vgkCGzicORumdpOtUPgo9vjRRRkK5YNvKxtJrhrbnaAlJXMI
	 TqXrZwbbUMyU51vZN1uJX88AOlPgdvXsJN88CRw+9tGqBhj9jiExCtzWO0DIz8rQ1M
	 3XmA9Tyhl/R3pJ6Db1QF99hFcBSXHU5Ep5XAv5DM=
Date: Fri, 5 Apr 2024 12:34:08 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, "stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [ANN] Media Summit 2024: where to hold it?
Message-ID: <owxr3ldmniftjsuiacqb6hxyfx46bwosk5wq2i27wgbtss6dgz@ixs3modz3r2q>
References: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl>

Hi Hans
   thanks for starting this conversation

On Thu, Apr 04, 2024 at 09:29:34AM +0200, Hans Verkuil wrote:
> Hi all,
>
> Normally we like to have a one day Media Summit meeting co-located with
> the Embedded Linux Conference Europe, however there isn't one this year.
> Instead of organizing an ELC both in North America and in Europe each
> year, the Linux Foundation switched to alternating between NA and Europe,
> and this year it is in North America.
>
> The problem is that most media subsystem developers are based in Europe
> for some strange reason.
>
> So we have to make a choice this year: we can co-locate with the gStreamer
> and XDC conference in Montreal, Canada on October 7 or 8, or we can
> organize a meeting somewhere in Europe ourselves. One possibility is
> to try and co-locate with the Open Source Summit Europe/LPC conferences
> in Vienna, Austria in the week of September 16-20. Another is just to
> organize something ourselves somewhere in Europe. But that's a last resort,
> co-locating with a conference is generally more appealing for people.

Co-locating is always easier, people is more likely to get
permits/budget for travelling if there are other events happening.

>
> The advantage of picking Montreal is that the gStreamer conference is
> more applicable to the work we do, and we can get a meeting room there
> free of charge. Besides, I've never been to Montreal :-)
>
> But can we get enough of the core media maintainers there? There is no
> point otherwise. I suspect that the same company travel constraints that
> were present last year are still in force this year.
>
> If we pick Vienna instead (assuming we can get a meeting room for a decent
> price), would that work better?
>
> So if you are a core media maintainer, or an active media developer interested
> in joining a Media Summit, please let me know if:
>
> 1) Montreal, October 7 or 8, works for me!
> 2) Vienna, one day in the period September 16-20, works for me!
>

I would surely be interested in visiting Montreal, also considering the
co-located events happening there, but it's way more likely I'll be in
Vienna, also due to the fact there will be a mini-ELC track as part of E-OSS
program.

Option 2 would then be my preference.

Thanks
  j

> Please respond asap, I'd like to get a clear picture soon, ideally by the end
> of next week.
>
> Regards,
>
> 	Hans

