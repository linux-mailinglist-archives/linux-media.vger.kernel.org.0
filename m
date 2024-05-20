Return-Path: <linux-media+bounces-11663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF278CA12A
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 19:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D568B21B60
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 17:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC74137C47;
	Mon, 20 May 2024 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qw9rgYTC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="57LL6CO5"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845411369B9;
	Mon, 20 May 2024 17:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716225544; cv=none; b=KzJKGcLVofRUB8W1Q6te0I1uIoJae9Y4zImye92HHqxKnH+MBeObgCXSZv4kjnumabz1g1jsOqgzk5leKnoijLt92DqKPzB0FSYd1wmsmEdN9w+jFAHtDcI8yAe2brjuftdfg6mw94YFDk0m5H6WgbMURy/F8Xgo4LmOTokv+2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716225544; c=relaxed/simple;
	bh=ZulL6qcXBmPMizDGMFa38MV6hLqalQopbVewHPPYeiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3mnDDAtV3De8noUZ9cK1MjhxBT6M04uV4uzD0WQxm1Oyq/lP7kAxMxtfB+wrgi61QTQOnXFltuAXORKOnNjsjQZrnapuradd5OpcQ5iLCH9zqm7TBIvZHgmaCy697PzDRi2a+t/SXiNdg2DYBFPBXQCeLbU6f7rZ3ODz0Afyhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qw9rgYTC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=57LL6CO5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 20 May 2024 19:18:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716225535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P2V0fdH4t2poMRftCjRvPZHt3gefMT0fvdsrTqva5qU=;
	b=qw9rgYTCydS26maYwXWBoL/7nMIZZdaccxQIOVk787jMgA6a5txSIR+y2nffAuCPPofmn1
	oPCJW7v9dj1diB7JN+5NKhHMfIdGe72q2n6F/4ylPZFFDUt9M4SI54vbp+9grQkUTs11HU
	g+taABgvmeLWQPE4OeNu5E264f76xw02HnR9EnCMpoWCQ3mWQUiA+xFnOdcbksCT10WJty
	V7wGSrVImu6Uk7zqKu+GHtgt2hBkBe5RDwZoJJoxKQ0gMcr5ARL7ag4oSJouVmeYc/XtOP
	sXpJK+JxleCfnk+2xc8H9yeFUFJ/ISQjWbXYXXml3EnmsZkfnTPkzeHNhMbawg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716225535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P2V0fdH4t2poMRftCjRvPZHt3gefMT0fvdsrTqva5qU=;
	b=57LL6CO5ZyAXHZYeHd5nbaeYh6SIDlHkM+L3BDLsQBQc860I2EPt/5IFLRoW/wIPEuWjoZ
	jqt0WVlJI55MluDQ==
From: Nam Cao <namcao@linutronix.de>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: syzbot <syzbot+83763e624cfec6b462cb@syzkaller.appspotmail.com>,
	Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [staging?] [usb?] memory leak in _r8712_init_xmit_priv
 (2)
Message-ID: <20240520171848.60Nzvv8y@linutronix.de>
References: <000000000000809328060a8a4c1c@google.com>
 <20240520144641.17643-1-n.zhandarovich@fintech.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520144641.17643-1-n.zhandarovich@fintech.ru>

On Mon, May 20, 2024 at 07:46:41AM -0700, Nikita Zhandarovich wrote:
> Hi,
> 
> > BUG: memory leak
> > unreferenced object 0xffff888107a5c000 (size 4096):
> >   comm "kworker/1:0", pid 22, jiffies 4294943134 (age 18.720s)
> >   hex dump (first 32 bytes):
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >   backtrace:
> >     [<ffffffff816337cd>] kmemleak_alloc_recursive include/linux/kmemleak.h:42 [inline]
> >     [<ffffffff816337cd>] slab_post_alloc_hook mm/slab.h:766 [inline]
> >     [<ffffffff816337cd>] slab_alloc_node mm/slub.c:3478 [inline]
> >     [<ffffffff816337cd>] __kmem_cache_alloc_node+0x2dd/0x3f0 mm/slub.c:3517
> >     [<ffffffff8157e625>] kmalloc_trace+0x25/0x90 mm/slab_common.c:1098
> >     [<ffffffff83cee442>] kmalloc include/linux/slab.h:600 [inline]
> >     [<ffffffff83cee442>] _r8712_init_xmit_priv+0x2b2/0x6e0 drivers/staging/rtl8712/rtl871x_xmit.c:130
> >     [<ffffffff83ce9033>] r8712_init_drv_sw+0xc3/0x290 drivers/staging/rtl8712/os_intfs.c:311
> >     [<ffffffff83ce7ce6>] r871xu_drv_init+0x1c6/0x920 drivers/staging/rtl8712/usb_intf.c:386
> >     [<ffffffff832d0f0b>] usb_probe_interface+0x16b/0x3a0 drivers/usb/core/driver.c:396
> >     [<ffffffff82c3bb06>] call_driver_probe drivers/base/dd.c:579 [inline]
> 
> I am inclined to think that this issue might be false positive. During
> repro the device is initialized correctly, does some work and then
> exits, calling all required functions to clean things up
> (i.e. _free_xmit_priv()), including pxmitbuf->pallocated_buf.
> Kmemleak triggers disappear if you set longer intervals between
> scannning for them (obviously). And if all the things get cleared up
> when the device disconnects, isn't that correct and expected
> behaviour? Could the scanner just "lose track" of some of the objects
> here?
> 
> Or am I missing something?

Possibly this is because the driver's probe function doesn't clean up
itself properly if it fails in the middle (e.g. due to the system running
out of memory and kmalloc() fails). These aren't easy to reproduce, because
you would need to make probing fails somehow.

Example fix: ac83631230f7 ("staging: r8712: Fix memory leak in
_r8712_init_xmit_priv()")

Best regards,
Nam

