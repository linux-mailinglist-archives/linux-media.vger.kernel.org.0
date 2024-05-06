Return-Path: <linux-media+bounces-10869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B248BCDFC
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59E351C236AA
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 12:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269ECE570;
	Mon,  6 May 2024 12:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rYInCtaq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF09E748F
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714998682; cv=none; b=j9tpY/AKFwVPm7v3tmOesnz2pu07dLqtuB9MSYfVKXJvEs9oDUh5Ht0Zy7sATDHuy6KW91r8tyK6xE4AaRrDo6BIeRC3Vk5EPjlI4ilxBrYCSh1y/71J1sB1OlvxHRmvl/DqIZiRPXKFJpt+4TwVtzeTSABlVBNwAqqqGO7OxzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714998682; c=relaxed/simple;
	bh=qWM2RZUGde1tsBjc3avRsd95bxYM4lG5+oU8+/RS30g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qlp8P2HlVhJmtrqXkK8l3iFQLRSfAkl0ottbN3DhXuXQp/1uwwOD/PRkU8m/7/y+VZ2evsKQ0ZG+QHnyY8yYmQ63zCOCYLApkc0EwUhXlAzDItUgaRN/2Bb0lk7JuqVCI6rkRFPZ7RFAxzcYXP0Ph3VUUulVXYHJgrr7LxEtrYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rYInCtaq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A5B7899;
	Mon,  6 May 2024 14:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714998677;
	bh=qWM2RZUGde1tsBjc3avRsd95bxYM4lG5+oU8+/RS30g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYInCtaqhS2jzLzcdT3saRYWf7Qi+8qobCYZ10Ue0HbuzWn8INyUiF/CY0D/xs6D1
	 gf3d56ZvKj9qQ+/eHWKVnDRbfAbscUtDXGg9RpdqaXFdf+uuSVmYEP3k0u3J8qgHuz
	 g6Ikc7TQdCL0y90PDAkvKOi1rCilD1ArzPlW47As=
Date: Mon, 6 May 2024 15:31:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Message-ID: <20240506123111.GA29108@pendragon.ideasonboard.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>

Hi Hans,

On Mon, May 06, 2024 at 01:33:32PM +0200, Hans Verkuil wrote:
> Hi all,
> 
> We will organize another Media Summit on Monday September 16th to coincide with
> the Open Source Summit Europe in Vienna:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/
> 
> Avnet Silica has very kindly offered to host this summit at their Vienna
> office, which is about 35 minutes by public transport from the OSSE venue.

A big thank you to Avnet !

> 
> Location:
> 
> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu
> 
> The meeting room can hold 18 people and has video conferencing support (MS Teams).
> 
> That said, I want to keep remote participation to a minimum. This yearly summit is meant
> for active media developers to meet up face-to-face and to discuss media subsystem issues.
> But if you are an active media developer, but are not able to attend in person, then this
> is an option.
> 
> If you have a topic that you want to discuss, just 'Reply All' to this announcement.
> It would be very much appreciated if you can also add a guesstimate of the time
> you need for your topic.

With the recently merged support for streams in the subdev API, I would
like to discuss the next steps we plan for subdevs, state, and usage of
the media controller device to submit requests.

> If you want to attend the meeting (either in person or remote), then send an email to me
> directly. Since the number of seats is limited, I may have to put people on a waiting list.
> Please let me know sooner rather than later (ideally by mid-July) so I have a good idea
> what to expect.
> 
> Priority goes to presenters and the core media maintainers. If multiple people of the same
> company want to attend, then I may ask to limit attendance to one or two people.
> 
> It is hard to predict how many people want to attend, so I'll see how it goes.

-- 
Regards,

Laurent Pinchart

