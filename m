Return-Path: <linux-media+bounces-24928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 812A2A169AE
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 10:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACFF6162E56
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 09:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1C5192B9D;
	Mon, 20 Jan 2025 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Kx2gnZMO"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4E2189B91
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365720; cv=none; b=EiRKfqJwNu3zAKsvsB/I95sIs1ZLfpPa+1fgF0NvrbbkT/7Z6mz/b902DE0PhE2+NOA1D/Cw0SvbJYrZvrIIR8c9RInFECG3GlMAfpybhoyUBS6mpdYGHl/tMeOIAM5TuKD9wuUvZBgQfNnvdZxNslk9RkIsdDufp7ObMgw68P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365720; c=relaxed/simple;
	bh=nQoAqWtSIywJlZaP+Ug/klTaIbYP0k9jpFhy9EL6H1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqdQQi8WChO+YhSbVLk6hN1smB97Y+v2hYZz4ZKF5EI1lG114J/7Wj6a/ns/TVTlllA/GACiH7dJcbUcr/sjVUgv31Yko6tFL0t3JEuPb4i5aL/F/Hk8aJqpcNGsUvOkL0mIFpt+3u61U5mw5XKJgny1dDcEikawgDLf/O4qeHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Kx2gnZMO; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1737365210; bh=nQoAqWtSIywJlZaP+Ug/klTaIbYP0k9jpFhy9EL6H1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kx2gnZMOLLun2JaLTlz7qBd+vyGBNm/KJ8W/zkZMJ8fk/kna4oMEdGqsvqVA4G/hE
	 KVvWr+9oQqziueFiHyA6d8oBNknTBw8cZFHlBiDvXN4Zf2KvHaaum5xk9msS+uzRga
	 eVT2iipcGvnS+cqRoDo8+yO5toko5RCD4BbiQfLKPp3bo6dL1naE0yyzED4PeDO8z+
	 pknEBEEphgzDBC2YP1XEg6I/rnUdvDE3f08eOSVe0H+3aE7bpndEKvfObn/vzjulw4
	 a0rAiaC8akFrXs6Aaav+mM4wE05ijES1xP3uSGZtmXNNZgG0OXRlcY7bOWDeQaanTh
	 /s2Vit9t2PMuA==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 44E99100087; Mon, 20 Jan 2025 09:26:50 +0000 (GMT)
Date: Mon, 20 Jan 2025 09:26:50 +0000
From: Sean Young <sean@mess.org>
To: Patrick Zacharias <littlefighter19@web.de>
Cc: linux-media@vger.kernel.org
Subject: Re: mceusb: No keypresses on Formosa Infrared Receiver
Message-ID: <Z44W2kpjTpVvsrva@gofer.mess.org>
References: <f609b2e2-2c7f-4fcc-8f55-4b1c1f0e3671@web.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f609b2e2-2c7f-4fcc-8f55-4b1c1f0e3671@web.de>

Hi Patrick,

On Sun, Jan 19, 2025 at 05:34:18PM +0100, Patrick Zacharias wrote:
> Hello there,
> 
> while using the Formos Infrared Receiver (147a:e016), I've noticed, that
> it won't stop blinking and doesn't register any presses.
> This issue appears to have been present since 2019,
> according to a thread on a German VDR forum.

That's interesting, mind sharing a link to the forum discussion please.

Also what does the device look like, it would be useful to get it and
test it myself if possible.

> And appears to be a regression, as according to that thread it used to
> work with their software
> (yavdr-0.6.2, which appears to based on kernel 3.13.0).

A git bisect would be useful.

> I've tried this on 5.16-rc2 (mainline on an X86 machine) and with
> 6.6.62+rpt-rpi-v8 from the latest Raspberry Pi OS.
> 
> I've analyzed a PCAP dump from a Windows 7 machine to see where the
> initialization differs and noticed,
> that an undocumented byte 0xF4 is being sent, after DEVICE_RESUME and
> G_REVISION (which are both sent in one packet).

You mean during device probe?

> By unbinding the driver, manually sending 0xF4 to the device and
> rebinding the driver, I'm able to workaround this issue.
> The blinking is gone and keypresses are now received. (Except for the OK
> key).
> 
> No further testing has been done.
> 
> I'm willing to provide PCAP traces, if of interest.

Yes please :)

Thanks,

Sean

