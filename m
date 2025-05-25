Return-Path: <linux-media+bounces-33335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A63AAC36C2
	for <lists+linux-media@lfdr.de>; Sun, 25 May 2025 22:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 020881894111
	for <lists+linux-media@lfdr.de>; Sun, 25 May 2025 20:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8001A5B95;
	Sun, 25 May 2025 20:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cairnwater.com header.i=@cairnwater.com header.b="tAHRNlH3"
X-Original-To: linux-media@vger.kernel.org
Received: from euk33.eukhosting.net (euk33.eukhosting.net [213.175.196.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FF7374F1
	for <linux-media@vger.kernel.org>; Sun, 25 May 2025 20:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.175.196.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748205181; cv=none; b=SZl23jz2N+uiDBhcOK6X5Tkdiapv/1jqTmELqjTzuR0p/fyhcG92RYQBkxKmgvU2sneLXnidvqJdNmseRJblFo6yl9jRWUyGFbAm9DLBZxn6OWdbjVc96sTVoiPiX180cBzRau46SBaUA3sD7PfyGQbvRqXKaIDqQvNy1R8eDTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748205181; c=relaxed/simple;
	bh=sWvSym30hIrrj6QT7YpOIwLqF3sRkRRacxr00QCLEcA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=d0nm1jUqE74iXBwI4uxFW0Ow48CAqkqCq73d8UEWFDOoQohdrmStdZqKVEDdvBnDPKZQW1woG7bgop7djpo7yacvTK98ckixpUsIDJffDq3d91mXabDBvgut6/KgBAUnZDYV2V5uX0TyyIe7jOcVlm1O+eMVfd6N105hG1q+JfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cairnwater.com; spf=pass smtp.mailfrom=cairnwater.com; dkim=pass (2048-bit key) header.d=cairnwater.com header.i=@cairnwater.com header.b=tAHRNlH3; arc=none smtp.client-ip=213.175.196.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cairnwater.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cairnwater.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cairnwater.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zyPL+AxqXoYVC4z9UuxLHcJWcsSH/3LFnW+O6J9Y2mI=; b=tAHRNlH3B0TPW165WMZIANSY86
	Zg1s6Ms8JEEwASI6RoRaRi25xLeHoWPel9ApWyaJfEjgb6OXEnTU4DcgfUPvCrNhwIM2CVFVXwotJ
	v8lqlaNnNWv/YBrTi122SfyGQFwhFFJ5H+Wq3VtJIJ3N7SJUovxzPbi2KOWrFrH1C1PBh1sTOteeZ
	1GmZhX+uJ37XhKNgsrvCDyntbXhpvzimv4bmXRb6GWRV8y1CuySxaMnZtSIH/3uPuWH+qPa1UTOen
	aENK40PIeDbjTISdolvYtYynUxtLTKTf6epvHOPwAmuvi3OlUom+r4BWo1SJt/CfDLko7aH0RndsL
	nj6COAeQ==;
Received: from [::1] (port=50382 helo=euk33.eukhosting.net)
	by euk33.eukhosting.net with esmtpa (Exim 4.98.1)
	(envelope-from <w.robertson@cairnwater.com>)
	id 1uJI1Y-000000093hI-0C7u;
	Sun, 25 May 2025 21:32:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 May 2025 21:32:46 +0100
From: w.robertson@cairnwater.com
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Andrej Gardijan <andrej.gardijan@tuta.com>,
 David Plowman <david.plowman@raspberrypi.com>, Devarsh Thakkar
 <devarsht@ti.com>, Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Jerry Wu <jerry.w.hu@intel.com>,
 =?UTF-8?Q?Jesper_Taxb=C3=B8l?= <jesper@taxboel.dk>, Josuah Demangeon
 <me@josuah.net>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mattijs
 Korpershoek <mkorpershoek@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Naush Patuck <naush@raspberrypi.com>, Nicolas
 Dufresne <nicolas@ndufresne.ca>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Ricardo Ribalda
 <ricardo.ribalda@gmail.com>, Sakari Ailus <sakari.ailus@iki.fi>, Stefan Klug
 <stefan.klug@ideasonboard.com>, libcamera-devel@lists.libcamera.org,
 linux-media@vger.kernel.org, Urs Fassler <urs.fassler@iqilio.ch>
Subject: Re: libcamera workshop 2025 - WildCamera
In-Reply-To: <c2736f05-e2ca-4e03-befb-d4da3717ced8@foss.st.com>
References: <20250512154445.GA4523@pendragon.ideasonboard.com>
 <20250516070137.GA20271@pendragon.ideasonboard.com>
 <4b162dd50b40acdfd2c26bb7b9ff2d75@cairnwater.com>
 <c2736f05-e2ca-4e03-befb-d4da3717ced8@foss.st.com>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <a02f60a5d8b56d2c35afa82edc6dd632@cairnwater.com>
X-Sender: w.robertson@cairnwater.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - euk33.eukhosting.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - cairnwater.com
X-Get-Message-Sender-Via: euk33.eukhosting.net: authenticated_id: w.robertson@cairnwater.com
X-Authenticated-Sender: euk33.eukhosting.net: w.robertson@cairnwater.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Benjamin,

Thank you very much!

I'm just back from carving nest holes in the tree crowns at a forest 
South of Basel for Garden Dormice (Eliomys quercinus) and for one of the 
WildCmaera field studies.

Would anyone be willing to help get libcamera working on a development 
board (e.g. the Debix Model A i.MX 8M Plus boards we're currently using 
for prototype development)? I'm able to build and boot mainline linux 
for the board using buildroot but we're not yet able yet to do this 
using Yocto or to get device tree or driver for an image sensor into the 
build.

Will

On 2025-05-23 14:15, Benjamin Mugnier wrote:
> Hi Will,
> 
> On 5/23/25 11:38, w.robertson@cairnwater.com wrote:
>> Hello everyone,
>> 
>> It was great to join you all at the libcamera workshop and to learn 
>> more
>> about the internal architecture of libcamera!
> 
> Personally, it was really refreshing and insightful to have you explain
> your camera needs for such a good cause. Thank you.
> 
> I also take this opportunity to thank all the libcamera team for
> organizing this great event.
> 
>> 
>> If folk have any questions or suggestions about WildCamera please let 
>> me
>> know - I'd be very happy to hear comments, ideas and suggestions for
>> improvements by email or voice or video call.
>> 
>> I'm often in the tree crowns chainsaw carving nest holes and setting 
>> up
>> field studies but the mobile signal is fairly good and I'm always 
>> happy
>> to hear people's ideas and suggestions.
>> 
>> Thank you all again for everything!
>> 
>> Have a great weekend!
>> 
>> Will
>> 
>> On 2025-05-16 08:01, Laurent Pinchart wrote:
>>> Hello everybody,
>>> 
>>> Here's a link to the etherpad we will use to take notes today.
>>> 
>>> https://pad.systemli.org/p/libcamera-workshop-nice-2025
>>> 
>>> On Mon, May 12, 2025 at 05:44:45PM +0200, Laurent Pinchart wrote:
>>>> Hello everybody,
>>>> 
>>>> I'm looking forward to seeing you all on Friday the 16th of May for 
>>>> the
>>>> libcamera workshop. Here is the first agenda draft, along with 
>>>> logistic
>>>> information for on-site and remote attendees.
>>>> 
>>>> As all workshop agendas, this is tentative and we will adjust the 
>>>> exact
>>>> timing depending on how the discussions progress.
>>>> 
>>>> 09:00 - 09:10  Welcome and agenda bashing
>>>> 09:10 - 09:40  Software ISP status and future plans (Hans de Goede)
>>>> 09:40 - 10:00  Slowing down the soft ISP CPU implementation (Laurent
>>>> Pinchart)
>>>> 10:00 - 10:30  Using a single IPA with multiple pipeline handlers
>>>> (Hans de Goede)
>>>> 10:30 - 11:00  Break
>>>> 11:00 - 11:45  Bayer reprocessing (David Plowman)
>>>> 11:45 - 12:30  Startup frames (David Plowman)
>>>> 12:30 - 13:30  Lunch
>>>> 13:30 - 14:00  State of gstreamer support (Nicolas Dufresne)
>>>> 14:00 - 14:30  Multi-context support (Nicolas Dufresne)
>>>> 14:30 - 15:30  Per frame control (David Plowman)
>>>> 15:30 - 16:00  Break
>>>> 16:00 - 16:45  libcamera on Zephyr (Josuah Demangeon)
>>>> 16:45 - 17:15  The importance of libcamera to WildCamera
>>>> 17:15 - 17:45  TBD
>>>> 
>>>> Each agenda item is listed with the name of the person who proposed 
>>>> it.
>>>> We expect those persons to introduce the topic (orally or with 
>>>> slides,
>>>> at your discretion) and drive the discussion.
>>>> 
>>>> We will use Jitsi Meet for remote access. The event will be 
>>>> accessible
>>>> at https://meet.jit.si/libcamera-workshop-nice-2025. We can however
>>>> not guarantee the quality of the network connection on site.
>>>> 
>>>> All times are in the CEST (UTC+2) time zone. If you plan to attend
>>>> remotely and are located in a time zone that makes the agenda items 
>>>> you
>>>> are most interested in occur at an inconvenient time, please let me 
>>>> know
>>>> and we will try to reorder the discussion topics.
>>>> 
>>>> Discussions will not be recorded, but the minutes of the workshop 
>>>> will
>>>> be posted to the mailing list after the event.
>>>> 
>>>> The workshop will be hosted by Embedded Recipes as part of their
>>>> workshop day (https://embedded-recipes.org/2025/workshops/) and will 
>>>> be
>>>> located at the Sheraton Nice Airport
>>>> (https://www.openstreetmap.org/way/1084319591)
>>>> a few minutes away from the Embedded Recipes location. For more
>>>> information refer to
>>>> https://embedded-recipes.org/2025/attend/#getting-there-block.
>>>> 
>>>> Lunch is included and complimentary for attendees. We will go 
>>>> off-site
>>>> to Fragrance Culinaire - Arénas
>>>> (https://maps.app.goo.gl/cKuspzV8PSKeWuqD9).
>>>> The restaurant offers salads and sandwiches and can cater for 
>>>> vegetarian
>>>> diets. If you have a more restrictive diet, please let me know.

