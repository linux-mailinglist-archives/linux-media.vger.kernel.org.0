Return-Path: <linux-media+bounces-49937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C8ACF5286
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 19:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B59AA30734D1
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 18:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07445342535;
	Mon,  5 Jan 2026 18:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mAvWOkj+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC56322DC1
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 18:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767636057; cv=none; b=Ywax6mQBZJFVbXT8UfPM2iZ43I2ISCp8bGhFwqOAFKx7z/NpNe076DiBygNqTQUeLvTpJyrmfKmTYfQUDaF8OwziddCA2g6RaUuFj+myGXeVzlvQyJAfI/UsriaARo9/A3LCANvxAPNpl4hVzghEafZXBoHE1exZpKXd+LfVoOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767636057; c=relaxed/simple;
	bh=Efalw4yPnFi6tZ4mGM6uyoosUWtV4UQOt3KF4dgKgNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cu9lUaaANMc+rgNOJ3RR+p3SLOOPsom8EQtiax0/IoEYml76VJlinR6UsmbpL5hQRHbA1gAI16grLbMtGTvaMOMPeFrydS+Kxcfq4y2fc/7NXQ1QGpo6IV7z2a4WEIWNvFCBw0VPhXl11GOdBMgsFjuElkAYU26aQMUCKOqZO3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mAvWOkj+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2794D14C7;
	Mon,  5 Jan 2026 19:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767636032;
	bh=Efalw4yPnFi6tZ4mGM6uyoosUWtV4UQOt3KF4dgKgNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mAvWOkj+6xl5yUZQQ6y43cGp+BFBjCl6H0BTGS39XgIDYrSBVJGE7WmaKYfWcbSAA
	 wYn7JGZPjJIimIGkBQuQ4Wl6AgqpeWh4rjd6V4p2BpUVqkSSHvpIoNGXEA0LgZdVTS
	 tWmNr59fF3NHpA+t7t6iHcPmRgq9xeq2tTqroFYY=
Date: Mon, 5 Jan 2026 20:00:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Ralf Jung <post@ralfj.de>, Salvatore Bonaccorso <carnil@debian.org>,
	1121718@bugs.debian.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org, regressions@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD
 Pro Webcam shows flickering artifacts (sometimes)
Message-ID: <20260105180033.GE10026@pendragon.ideasonboard.com>
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
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>

On Mon, Jan 05, 2026 at 04:29:24PM +0100, Ricardo Ribalda wrote:
> Hi Ralf
> 
> Thanks for the bisect and the report.
> 
> 
> The patch to remove noprod parameter has been queued for 6.20 :S so we
> should look into a more permanent fix soon.
> 
> When you say zoom, do you mean the desktop version of zoom (
> https://zoom.us/download?os=linux ) or the web version
> I would assume that it is the zoom app, that is ignoring the "error"
> flag from the frames and showing them to the users. Can you confirm
> that? Hopefully we can reach zoom and they can fix it.

Should we revert the nodrop removal in the meantime ?

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

-- 
Regards,

Laurent Pinchart

