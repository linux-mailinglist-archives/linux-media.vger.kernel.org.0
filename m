Return-Path: <linux-media+bounces-11662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE148C9EFC
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 16:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDAD41C2119F
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 14:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29951369BB;
	Mon, 20 May 2024 14:47:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C93145026;
	Mon, 20 May 2024 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716216444; cv=none; b=fe0d5sphvEl4ZOU4ZilSkPrRKAfI5Q/A5all0UkBwQRX5EEn2LFkDENakLWPuyNN3EPYhVbw9LYDQcUVXEVmP9F8rItzp++C4p6Zq0aibK+xMk6Eunxbh3eRk3yQ2OxB3EuvqhrIh0ptNnHJmmozo9Ys79jeHqyXU1O/1nuIUHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716216444; c=relaxed/simple;
	bh=NszCYuGG62vA2thKcJ8SoYDRFimKvFGOM29xafLKn54=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MF8uMF+4J/0tY9u+S4D4arEfEPA13cNMZ8/NAP98TP0fSID1fPMkkD7Jc0lD3WdokmIMnaAlIQWTrajyEb5mFl4/FCv+7q/eArNm5XXNHi9xY7pOcPyWvw2UtgEhHaqyabgou0hur2ptq4CM6XsJQr5IXKmvTAqG5pqlRAZANuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 20 May
 2024 17:47:11 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 20 May
 2024 17:47:11 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: syzbot <syzbot+83763e624cfec6b462cb@syzkaller.appspotmail.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	<Larry.Finger@lwfinger.net>, <florian.c.schilhabel@googlemail.com>,
	<gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-usb@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] [staging?] [usb?] memory leak in _r8712_init_xmit_priv (2)
Date: Mon, 20 May 2024 07:46:41 -0700
Message-ID: <20240520144641.17643-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <000000000000809328060a8a4c1c@google.com>
References:
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Hi,

> BUG: memory leak
> unreferenced object 0xffff888107a5c000 (size 4096):
>   comm "kworker/1:0", pid 22, jiffies 4294943134 (age 18.720s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<ffffffff816337cd>] kmemleak_alloc_recursive include/linux/kmemleak.h:42 [inline]
>     [<ffffffff816337cd>] slab_post_alloc_hook mm/slab.h:766 [inline]
>     [<ffffffff816337cd>] slab_alloc_node mm/slub.c:3478 [inline]
>     [<ffffffff816337cd>] __kmem_cache_alloc_node+0x2dd/0x3f0 mm/slub.c:3517
>     [<ffffffff8157e625>] kmalloc_trace+0x25/0x90 mm/slab_common.c:1098
>     [<ffffffff83cee442>] kmalloc include/linux/slab.h:600 [inline]
>     [<ffffffff83cee442>] _r8712_init_xmit_priv+0x2b2/0x6e0 drivers/staging/rtl8712/rtl871x_xmit.c:130
>     [<ffffffff83ce9033>] r8712_init_drv_sw+0xc3/0x290 drivers/staging/rtl8712/os_intfs.c:311
>     [<ffffffff83ce7ce6>] r871xu_drv_init+0x1c6/0x920 drivers/staging/rtl8712/usb_intf.c:386
>     [<ffffffff832d0f0b>] usb_probe_interface+0x16b/0x3a0 drivers/usb/core/driver.c:396
>     [<ffffffff82c3bb06>] call_driver_probe drivers/base/dd.c:579 [inline]

I am inclined to think that this issue might be false positive. During
repro the device is initialized correctly, does some work and then
exits, calling all required functions to clean things up
(i.e. _free_xmit_priv()), including pxmitbuf->pallocated_buf.
Kmemleak triggers disappear if you set longer intervals between
scannning for them (obviously). And if all the things get cleared up
when the device disconnects, isn't that correct and expected
behaviour? Could the scanner just "lose track" of some of the objects
here?

Or am I missing something?

Regards,
Nikita

