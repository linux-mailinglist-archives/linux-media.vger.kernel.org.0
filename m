Return-Path: <linux-media+bounces-33260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74608AC23A7
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 15:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68B49A475B8
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 13:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F4D2920B7;
	Fri, 23 May 2025 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="aSbNNCve"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1507C4437C
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748006385; cv=none; b=O+HEv0ehGcE/ii6e3Fb/8+svFhn6n7An8F+APRZnznvH66bvXbYuI+a81rPLR4WEu2kULqwRJGHlMS/jceeOLifF6FTwtmVn/nALY9HbDWgq74dAxkQu0+fVI0O7SLcoZy0Pw11XJUVylEXJEuhW5AIOIBXrsELLGTHJLndEPvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748006385; c=relaxed/simple;
	bh=vJcshC/sfTpYGZq7vfTspgsnH3QNbvRTzezqqAYWGnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MAnaoqyISnLhpL8kNJbx2lVKW2NOVU2qjfiBZC8tu3TCIFOzTdiFi9uhQpmQGzTDIdeV8n/fek+UsQlwd8DuksO6OVvWEg95jOEolYNr3J6dC0bk2sd6k82j2LqWLZakzW02GVnhvB+fXGyyLUPdP2FSkpD/6N2weocrdoA2I4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=aSbNNCve; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCvrMk005085;
	Fri, 23 May 2025 15:18:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	E9gOeFM3/s6P1Th6CKvzWGGfb7Dg1vtxolArjL1T3PA=; b=aSbNNCveWWIxacie
	VwXIMmxvoNlhrrX0pyoa6TMZouMAPTET23td4UmAjNWZ0jXef53hqkHNAUD/w/6x
	nlclKETizGznz7l6GBg++2uR9L9wu1VIZtYBjmYxVerUJ2MvMC6Gy5YJ/CgmTQ34
	XyBZPkfQa3F4ysWfU53ENRKnNjt9z0/bT+jzI7bd6Uv9pfiqz3osBlzZ2hWHes2Y
	atvzdzZVRQt3RKmEDrFMYyRIpOf5m1qtK+CJCncwddqRJiFWwbEuPeZSrvbTiDLU
	TE3xtsT5zBXVmn+gOSXESMg5edRWk6p3NmFHI55oC2Enza5DcofnDK0pyaUMdh5A
	aZQH0Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfae3u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 15:18:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6021740049;
	Fri, 23 May 2025 15:16:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C97BA3DBE8;
	Fri, 23 May 2025 15:15:50 +0200 (CEST)
Received: from [10.252.4.195] (10.252.4.195) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 15:15:48 +0200
Message-ID: <c2736f05-e2ca-4e03-befb-d4da3717ced8@foss.st.com>
Date: Fri, 23 May 2025 15:15:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: libcamera workshop 2025 - WildCamera
To: <w.robertson@cairnwater.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: Alain Volmat <alain.volmat@foss.st.com>,
        Andrej Gardijan
	<andrej.gardijan@tuta.com>,
        David Plowman <david.plowman@raspberrypi.com>,
        Devarsh Thakkar <devarsht@ti.com>, Hans de Goede <hdegoede@redhat.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Jerry Wu
	<jerry.w.hu@intel.com>,
        =?UTF-8?Q?Jesper_Taxb=C3=B8l?= <jesper@taxboel.dk>,
        Josuah Demangeon <me@josuah.net>,
        Kieran Bingham
	<kieran.bingham@ideasonboard.com>,
        Mattijs Korpershoek
	<mkorpershoek@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Naush Patuck <naush@raspberrypi.com>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
	<niklas.soderlund@ragnatech.se>,
        Ricardo Ribalda <ricardo.ribalda@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Stefan Klug
	<stefan.klug@ideasonboard.com>,
        <libcamera-devel@lists.libcamera.org>, <linux-media@vger.kernel.org>,
        Urs Fassler <urs.fassler@iqilio.ch>
References: <20250512154445.GA4523@pendragon.ideasonboard.com>
 <20250516070137.GA20271@pendragon.ideasonboard.com>
 <4b162dd50b40acdfd2c26bb7b9ff2d75@cairnwater.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <4b162dd50b40acdfd2c26bb7b9ff2d75@cairnwater.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_04,2025-05-22_01,2025-03-28_01

Hi Will,

On 5/23/25 11:38, w.robertson@cairnwater.com wrote:
> Hello everyone,
> 
> It was great to join you all at the libcamera workshop and to learn more
> about the internal architecture of libcamera!

Personally, it was really refreshing and insightful to have you explain
your camera needs for such a good cause. Thank you.

I also take this opportunity to thank all the libcamera team for
organizing this great event.

> 
> If folk have any questions or suggestions about WildCamera please let me
> know - I'd be very happy to hear comments, ideas and suggestions for
> improvements by email or voice or video call.
> 
> I'm often in the tree crowns chainsaw carving nest holes and setting up
> field studies but the mobile signal is fairly good and I'm always happy
> to hear people's ideas and suggestions.
> 
> Thank you all again for everything!
> 
> Have a great weekend!
> 
> Will
> 
> On 2025-05-16 08:01, Laurent Pinchart wrote:
>> Hello everybody,
>>
>> Here's a link to the etherpad we will use to take notes today.
>>
>> https://pad.systemli.org/p/libcamera-workshop-nice-2025
>>
>> On Mon, May 12, 2025 at 05:44:45PM +0200, Laurent Pinchart wrote:
>>> Hello everybody,
>>>
>>> I'm looking forward to seeing you all on Friday the 16th of May for the
>>> libcamera workshop. Here is the first agenda draft, along with logistic
>>> information for on-site and remote attendees.
>>>
>>> As all workshop agendas, this is tentative and we will adjust the exact
>>> timing depending on how the discussions progress.
>>>
>>> 09:00 - 09:10  Welcome and agenda bashing
>>> 09:10 - 09:40  Software ISP status and future plans (Hans de Goede)
>>> 09:40 - 10:00  Slowing down the soft ISP CPU implementation (Laurent
>>> Pinchart)
>>> 10:00 - 10:30  Using a single IPA with multiple pipeline handlers
>>> (Hans de Goede)
>>> 10:30 - 11:00  Break
>>> 11:00 - 11:45  Bayer reprocessing (David Plowman)
>>> 11:45 - 12:30  Startup frames (David Plowman)
>>> 12:30 - 13:30  Lunch
>>> 13:30 - 14:00  State of gstreamer support (Nicolas Dufresne)
>>> 14:00 - 14:30  Multi-context support (Nicolas Dufresne)
>>> 14:30 - 15:30  Per frame control (David Plowman)
>>> 15:30 - 16:00  Break
>>> 16:00 - 16:45  libcamera on Zephyr (Josuah Demangeon)
>>> 16:45 - 17:15  The importance of libcamera to WildCamera
>>> 17:15 - 17:45  TBD
>>>
>>> Each agenda item is listed with the name of the person who proposed it.
>>> We expect those persons to introduce the topic (orally or with slides,
>>> at your discretion) and drive the discussion.
>>>
>>> We will use Jitsi Meet for remote access. The event will be accessible
>>> at https://meet.jit.si/libcamera-workshop-nice-2025. We can however
>>> not guarantee the quality of the network connection on site.
>>>
>>> All times are in the CEST (UTC+2) time zone. If you plan to attend
>>> remotely and are located in a time zone that makes the agenda items you
>>> are most interested in occur at an inconvenient time, please let me know
>>> and we will try to reorder the discussion topics.
>>>
>>> Discussions will not be recorded, but the minutes of the workshop will
>>> be posted to the mailing list after the event.
>>>
>>> The workshop will be hosted by Embedded Recipes as part of their
>>> workshop day (https://embedded-recipes.org/2025/workshops/) and will be
>>> located at the Sheraton Nice Airport
>>> (https://www.openstreetmap.org/way/1084319591)
>>> a few minutes away from the Embedded Recipes location. For more
>>> information refer to
>>> https://embedded-recipes.org/2025/attend/#getting-there-block.
>>>
>>> Lunch is included and complimentary for attendees. We will go off-site
>>> to Fragrance Culinaire - Arénas
>>> (https://maps.app.goo.gl/cKuspzV8PSKeWuqD9).
>>> The restaurant offers salads and sandwiches and can cater for vegetarian
>>> diets. If you have a more restrictive diet, please let me know.

-- 
Regards,
Benjamin

