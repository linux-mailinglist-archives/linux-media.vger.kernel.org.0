Return-Path: <linux-media+bounces-29560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 796EBA7EDB1
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 21:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00A50188DEBD
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 19:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A208A2153D1;
	Mon,  7 Apr 2025 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VFyJIO2+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFFC1EE032
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744054779; cv=none; b=OgQZORVdAquYuyGPBDawFSFpevS79xrzo74S0QC60JwnKCs1DfUjqQOAWNnVukViBh5zdq3bjmqv/439WrVvvilKBqgqAVvGZ2A69r+D10RGXsj1dUymdlPwDdd81OKV5ZhIzduKsKxBrzep0d9THgV4rH1pnyD92ab4rkKiDQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744054779; c=relaxed/simple;
	bh=pszJM6O5YYeUGoj5VRNm8IAYskRjEbHf2aFNB22drqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JR75NbRKlhgLsW1NvKd+EhTuRv7E8sl1gB3yJJ/ZXhgz6wEy9U3yWhR6wTZ7hGTSI7rAg1YsFcy1NRjq30huztcCUoQZnl1Z4Mvcy+Zp/5jYab9D0LnzRNvB4TCuVv9NrMkUAzo81Dv7E8Hfnn3Of9l6ErB/ivTqQ1/JuisS5LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VFyJIO2+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93030236;
	Mon,  7 Apr 2025 21:37:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744054656;
	bh=pszJM6O5YYeUGoj5VRNm8IAYskRjEbHf2aFNB22drqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFyJIO2+/mUBZpCa9UCSTkYYQNt7BsQxAPPPrtF8GLw0x35pyNwH6pSBfLNFFYoFR
	 gRZR+FHyOma5ZhVITutUxjyxN5ogFJSrhIPvXUPTqYBGx5erTurqofMj1z2Sjas9DC
	 T5Wo1rhuYUJdOZiGCCkMt7O+bkjE+MvzF5UTCnPI=
Date: Mon, 7 Apr 2025 22:39:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	"stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [ANN] Registration and Request for Topics for the Media Summit
 on May 13th in Nice, France
Message-ID: <20250407193909.GA17385@pendragon.ideasonboard.com>
References: <044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl>

Hi Hans,

On Fri, Mar 14, 2025 at 10:59:58AM +0100, Hans Verkuil wrote:
> Hi all,
> 
> We will organize another Media Summit on Tuesday May 13th to coincide with
> the Embedded Recipes Conference in Nice, France:
> 
> https://embedded-recipes.org/2025/
> 
> Note that there are also some workshops held after this conference:
> 
> https://embedded-recipes.org/2025/workshops/
> 
> And apparently a gStreamer event during the weekend. If anyone has more
> details about this, please reply to this post.
> 
> The Media Summit will be held at Hotel Campanile:
> 
> https://nice-aeroport.campanile.com/en-us/
> 
> It is close to the Airport and to the Embedded Recipes venue.
> 
> The meeting room can hold up to 30 people and has video conferencing support.
> 
> That said, I want to keep remote participation to a minimum. This yearly summit is meant
> for active media developers to meet up face-to-face and to discuss media subsystem issues.
> But if you are an active media developer and are really not able to attend in person, then
> remote participation is an option.
> 
> If you want to attend the meeting (either in person or remote), then send an email to me
> directly. The deadline for that is May 2nd as the hotel needs to know the final number of
> attendees by then. We have more seats available than last year, so I do not expect to run out.
> In the unlikely case that this becomes a problem, then I will revisit this.
> 
> There is no registration fee.
> 
> If you have a topic that you want to discuss, just 'Reply All' to this announcement.
> It would be very much appreciated if you can also add a guesstimate of the time
> you need for your topic.
> 
> See last year's Media Summit Report as an example of what to expect:
> 
> https://lore.kernel.org/linux-media/45e4f5d4-f6c4-4f0b-96b5-f5e1125b0845@xs4all.nl/
> 
> There are two topics already for the upcoming Media Summit:
> 
> Paul Kocialkowski:
> Stateless video encoding uAPI
> 
> Hans Verkuil:
> Status of Media CI/Multi-committers
> Duration guesstimate: 1 hour

I would like to propose the following topic.

Review of the status of staging drivers

We have a set of 11 drivers in drivers/staging/media/, with various
states of maturity and development activity. drivers/staging/ is not
meant as a place for drivers to die, we should nudge the relevant
maintainers and consider dropping drivers that show no hope of
progressing.

-- 
Regards,

Laurent Pinchart

