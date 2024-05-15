Return-Path: <linux-media+bounces-11464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D1A8C63B5
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 11:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0BC31F23F4D
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 09:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBEE58ADD;
	Wed, 15 May 2024 09:32:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0BA4C61C
	for <linux-media@vger.kernel.org>; Wed, 15 May 2024 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715765552; cv=none; b=AJHQMY7CgU4bt61y0VDybbqkCLmJxy0Mt+P0C4GpAgMXbA4OU8s31Ni8hUaNeD77iV7y07yHB2sMwQ92SkiyoawqK3G7ij6ZxRxWstqALZY2f3IjqHQA4z/uSNVwJm46pz3S42YT/2ULm+G+H9XIVGy+XMAtoSqf8aQO058y1JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715765552; c=relaxed/simple;
	bh=EfmiCnvdqCxmfzhvgqhKh0dXW7DuUi0etWUdoEjoYUM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hN11zRlSC6juvuHU043C9N7cIEY4JiL/stbdWUOxsYLQec0aUNLZ/Cyb/04yXbeDpv8XJ4AyjyBkKcxlLlXRdwj05baRh+qJeoRUq9jS6NH1EyPAAPdPmg0XOGJKAaTzZjc3SaGRngcScpIWEg2loiMP2OkHTr4met2mYMgNtgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D14C116B1;
	Wed, 15 May 2024 09:32:29 +0000 (UTC)
Message-ID: <568b8c9d-410f-49a8-a560-0cf948297ab4@xs4all.nl>
Date: Wed, 15 May 2024 11:32:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Content-Language: en-US
From: Hans Verkuil <hverkuil@xs4all.nl>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
In-Reply-To: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 5/6/24 13:33, Hans Verkuil wrote:
> Hi all,
> 
> We will organize another Media Summit on Monday September 16th to coincide with
> the Open Source Summit Europe in Vienna:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/
> 
> Avnet Silica has very kindly offered to host this summit at their Vienna
> office, which is about 35 minutes by public transport from the OSSE venue.
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
> 
> If you want to attend the meeting (either in person or remote), then send an email to me
> directly. Since the number of seats is limited, I may have to put people on a waiting list.
> Please let me know sooner rather than later (ideally by mid-July) so I have a good idea
> what to expect.
> 
> Priority goes to presenters and the core media maintainers. If multiple people of the same
> company want to attend, then I may ask to limit attendance to one or two people.
> 
> It is hard to predict how many people want to attend, so I'll see how it goes.

Just a quick update:

After just 9 days I already have 5 people who want to present something.
And currently I have 10 people who want to attend in person and one remotely.

So I am confident that we should be able to fill that room :-)

Regards,

	Hans

