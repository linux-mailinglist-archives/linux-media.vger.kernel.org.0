Return-Path: <linux-media+bounces-49930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AF1CF47B2
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 16:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02BA6300A3DD
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 15:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B05221DB6;
	Mon,  5 Jan 2026 15:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ralfj.de header.i=@ralfj.de header.b="CjDgjmwJ"
X-Original-To: linux-media@vger.kernel.org
Received: from r-passerv.ralfj.de (r-passerv.ralfj.de [109.230.236.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA762DEA78
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.230.236.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627823; cv=none; b=m2E9jbcYDKKgUy6E06nofOzOVKd1NtG2iPPoZkf/aMQ8/vKtoX/joY6ULVL5wOb5tNO4jo16vypSOPEKmkRCz0/QIV/wpZ/ln1Ve/FbHr+j9Je57vP+BjDo1hXutrUrkLHMEk3reMDRb27Ax8n6oa3mjYoG4VkpXgjoEGwe49zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627823; c=relaxed/simple;
	bh=aKTG7CDSCYFVA//Qy4W50BjRXCEdB/SIworKV5sfRQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozO5uE2XVsGKQdug0yVoG4ynnoU5lsfenYZOxZX4dPf0HgmUHvWNBWO+E+dO6k+EHhmKwDI5D6464ySAP7cQzfRSVJP8wFNg11QUvAYNZvDGjxE4TMashhbExBOY44T2YyKfJXOKI4YrlHLjf5QqGwZqEi8mKpFeZtPDY7zailE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ralfj.de; spf=pass smtp.mailfrom=ralfj.de; dkim=pass (1024-bit key) header.d=ralfj.de header.i=@ralfj.de header.b=CjDgjmwJ; arc=none smtp.client-ip=109.230.236.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ralfj.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ralfj.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ralfj.de; s=mail;
	t=1767627813; bh=aKTG7CDSCYFVA//Qy4W50BjRXCEdB/SIworKV5sfRQQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CjDgjmwJpvj3hU+TxroSGnFtY7bXM5OX5o/QngwHXLowaCBL4tKhhux1ZvRfJ6X/w
	 Wn/BS9GTVdmweV8fMVf/MExkucxzo1j7GRGJjTSP7t0iY/DOFFCxIYIqt/zLMsoNXv
	 G4eGOYAnkOadY2VF9kdeCr9IginIFN7RbfqOS714=
Received: from [IPV6:2001:67c:10ec:5784:8000::143] (2001-67c-10ec-5784-8000--143.net6.ethz.ch [IPv6:2001:67c:10ec:5784:8000::143])
	by r-passerv.ralfj.de (Postfix) with ESMTPSA id 5CD702053392;
	Mon,  5 Jan 2026 16:43:33 +0100 (CET)
Message-ID: <70471ef9-9faf-4303-b983-63234ea469b7@ralfj.de>
Date: Mon, 5 Jan 2026 16:43:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD Pro
 Webcam shows flickering artifacts (sometimes)
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1121718@bugs.debian.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-media@vger.kernel.org, regressions@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede
 <hansg@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <aS8YBLEPwF0-NtJO@eldamar.lan>
 <ba9a132e-6296-451f-8351-4045c0b72d6c@ralfj.de>
 <4rnbopkefvp6h3dwttj4h7cexehqtbuzzz4gatnebdnjzdy2li@bupytpnlk2xh>
 <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de>
 <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <0490a39a-28d9-4925-a162-5e4d498be257@ralfj.de>
 <aVfPmZ8rUm3Vf7pT@eldamar.lan>
 <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de>
 <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
From: Ralf Jung <post@ralfj.de>
Content-Language: en-US, de-DE
In-Reply-To: <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ricardo,

> Thanks for the bisect and the report.

Thanks for taking a look. :)

> The patch to remove noprod parameter has been queued for 6.20 :S so we
> should look into a more permanent fix soon.

Ah, the days of my work-around are counted then -- good to know.

> When you say zoom, do you mean the desktop version of zoom (
> https://zoom.us/download?os=linux ) or the web version
> I would assume that it is the zoom app, that is ignoring the "error"
> flag from the frames and showing them to the users. Can you confirm
> that? Hopefully we can reach zoom and they can fix it.

Yes, I mean the Zoom app (specifically, the flatpak version: 
https://flathub.org/en/apps/us.zoom.Zoom). I have no idea how the protocol stack 
works here (how frames go from the camera to zoom and which layer is responsible 
to do what along the way); while I am a developer, I am entirely a user when it 
comes to webcam things. :D

I have not seen the error occur in Firefox -- but I am also not sure if Firefox 
ever puts the camera into the other "mode" the way Zoom does (when someone joins 
the call, the field of view of the camera slightly increases, so there are now 
things visible on the side of the frame that were previously cut off -- and then 
a few seconds later, the artifacts start to appear).

I will try the tracing flags you mention later when I have access to the camera 
again.

Kind regards,
Ralf

> 
> 
> Now about the error flag. I have given a fast look at your usb trace
> and have only seen 4 frames with "error bits" [1]. Can you add more
> tracing?
> Do something like:
> rmmod uvcvideo
> modprobe uvcvideo trace=0xffffffff
> 
> Then start zoom, trigger the error and share the content of your
> dmesg. It should contain an explanation of why the driver thinks that
> the frames are invalid.
> 
> Thanks!
> 
> [1] I used this filter in wireshark: usb.iso.data[1]!=0x0d &&
> usb.iso.data[1]!=0x0c && usb.iso.data[1]!=0x0f &&
> usb.iso.data[1]!=0x0e && usb.addr == "3.34.1"


