Return-Path: <linux-media+bounces-11862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B72FB8CEAB8
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 22:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9516DB213C4
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 20:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19FF5F87D;
	Fri, 24 May 2024 20:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WpeJsYyv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hoYbLTxK"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A86F1CFB2;
	Fri, 24 May 2024 20:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716581541; cv=none; b=S953cpxf/RL76m4pUol/DF+/p38CZudOAQmHHLEQC7H4APZatmSVki/V6UjQBIiCNtWGWqw7IFhfNBEbS0qia+PTS9ttMxB6kmF2gGUHytLOqqMqvS/G+vdS4BdSCUtBriReOAJQjVKKFpQcZ3tjl+IGKZozH4xVmh+GcXulLFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716581541; c=relaxed/simple;
	bh=/0AJ4dHxpn+FPk7XO9/c18yo0iSc19ctgk3pqPUkIwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/bXPbG3CIzTkTOVcY3jLjkPlJHjAItxEplrL5z3vN8GwMgiYQMYTOyW6Bbj1172o/7PPF24TIrjQ6QenIAB8iBiow708zYyznYFHGEuC+wNpqzpZq+tRmAqNSUxIj+x71g738YVP8CdkIf7XvGCDjETzO1tnPPH6nSNT9BYMdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WpeJsYyv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hoYbLTxK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 24 May 2024 22:12:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716581537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtvCptJpVCuAsJ2ZJytWgyRQHpaYiuYuk+w0LKHWO7c=;
	b=WpeJsYyvfRQCdvsuiugotFM2OeN+eJK54kuZZFjeHwH/jI6N5gBK8SruIep0g4FivxhfPF
	+qEmvoBZaWWjuojdVBRmEaQ3oExGnbzPP+9FMx4Tq8NtGL3V5qRgfoE3IX81TXotpzcieC
	WMQCa1uaoW1M+hn0y3BH0dJQCQBmdkO96DQFK0W5aR1KXwEj2Xq3c39ZEkzutwANhvkSf9
	uh9U3PmdeLo8K4FAS+wjmXY3wvqp0p4K0t7BAmnY8kYRCQMicxYqSDv2kFflawbBefhc73
	LQC8oEr0YhGl9oQjCXJi9ubmSypOix7KvmuTYTvYM+/lRJQ3ZbQ6/uMH7upZ8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716581537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtvCptJpVCuAsJ2ZJytWgyRQHpaYiuYuk+w0LKHWO7c=;
	b=hoYbLTxKk+aDa5qSkASfvMUdMj1vNefW8gt92TzKCuE1gbUgOMVWr/wdeOPwdaw2XPQzN1
	kEfvwJIoFPfGjXCQ==
From: Nam Cao <namcao@linutronix.de>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: syzbot <syzbot+83763e624cfec6b462cb@syzkaller.appspotmail.com>,
	Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [staging?] [usb?] memory leak in _r8712_init_xmit_priv
 (2)
Message-ID: <20240524201212.mjMDljAc@linutronix.de>
References: <000000000000809328060a8a4c1c@google.com>
 <20240520144641.17643-1-n.zhandarovich@fintech.ru>
 <20240520171848.60Nzvv8y@linutronix.de>
 <5b351cfa-6537-4e3d-9d5b-0435e4eceef9@fintech.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b351cfa-6537-4e3d-9d5b-0435e4eceef9@fintech.ru>

On Wed, May 22, 2024 at 06:33:57AM -0700, Nikita Zhandarovich wrote:
> On 5/20/24 10:18, Nam Cao wrote:
> > On Mon, May 20, 2024 at 07:46:41AM -0700, Nikita Zhandarovich wrote:
> >>> BUG: memory leak
> >>> unreferenced object 0xffff888107a5c000 (size 4096):
> >>>   comm "kworker/1:0", pid 22, jiffies 4294943134 (age 18.720s)
> >>>   hex dump (first 32 bytes):
> >>>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >>>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >>>   backtrace:
> >>>     [<ffffffff816337cd>] kmemleak_alloc_recursive include/linux/kmemleak.h:42 [inline]
> >>>     [<ffffffff816337cd>] slab_post_alloc_hook mm/slab.h:766 [inline]
> >>>     [<ffffffff816337cd>] slab_alloc_node mm/slub.c:3478 [inline]
> >>>     [<ffffffff816337cd>] __kmem_cache_alloc_node+0x2dd/0x3f0 mm/slub.c:3517
> >>>     [<ffffffff8157e625>] kmalloc_trace+0x25/0x90 mm/slab_common.c:1098
> >>>     [<ffffffff83cee442>] kmalloc include/linux/slab.h:600 [inline]
> >>>     [<ffffffff83cee442>] _r8712_init_xmit_priv+0x2b2/0x6e0 drivers/staging/rtl8712/rtl871x_xmit.c:130
> >>>     [<ffffffff83ce9033>] r8712_init_drv_sw+0xc3/0x290 drivers/staging/rtl8712/os_intfs.c:311
> >>>     [<ffffffff83ce7ce6>] r871xu_drv_init+0x1c6/0x920 drivers/staging/rtl8712/usb_intf.c:386
> >>>     [<ffffffff832d0f0b>] usb_probe_interface+0x16b/0x3a0 drivers/usb/core/driver.c:396
> >>>     [<ffffffff82c3bb06>] call_driver_probe drivers/base/dd.c:579 [inline]
> >>
> >> I am inclined to think that this issue might be false positive. During
> >> repro the device is initialized correctly, does some work and then
> >> exits, calling all required functions to clean things up
> >> (i.e. _free_xmit_priv()), including pxmitbuf->pallocated_buf.
> >> Kmemleak triggers disappear if you set longer intervals between
> >> scannning for them (obviously). And if all the things get cleared up
> >> when the device disconnects, isn't that correct and expected
> >> behaviour? Could the scanner just "lose track" of some of the objects
> >> here?

I think you may be right that this is false negative.

I am guessing that kmemleak scans memory for pointers in block of 8-byte.
However, this driver aligns the buffer from kmalloc() to 4 bytes, which is
not necessary because pointers from kmalloc() is at least 8-byte-aligned.
Then more pointers are stored in this 4-byte-aligned buffer. Thus, kmemleak
misses these pointers, and falsely report memory leak.

I never interacted with syzbot before, let's hope it can catch this:

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
index 6353dbe554d3..408616e9afcf 100644
--- a/drivers/staging/rtl8712/rtl871x_xmit.c
+++ b/drivers/staging/rtl8712/rtl871x_xmit.c
@@ -117,12 +117,9 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
 	/*init xmit_buf*/
 	_init_queue(&pxmitpriv->free_xmitbuf_queue);
 	_init_queue(&pxmitpriv->pending_xmitbuf_queue);
-	pxmitpriv->pallocated_xmitbuf =
-		kmalloc(NR_XMITBUFF * sizeof(struct xmit_buf) + 4, GFP_ATOMIC);
-	if (!pxmitpriv->pallocated_xmitbuf)
+	pxmitpriv->pxmitbuf = kmalloc(NR_XMITBUFF * sizeof(struct xmit_buf), GFP_ATOMIC);
+	if (!pxmitpriv->pxmitbuf)
 		goto clean_up_frame_buf;
-	pxmitpriv->pxmitbuf = pxmitpriv->pallocated_xmitbuf + 4 -
-			      ((addr_t)(pxmitpriv->pallocated_xmitbuf) & 3);
 	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
 	for (i = 0; i < NR_XMITBUFF; i++) {
 		INIT_LIST_HEAD(&pxmitbuf->list);
@@ -165,8 +162,8 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
 		for (k = 0; k < 8; k++)		/* delete xmit urb's */
 			usb_free_urb(pxmitbuf->pxmit_urb[k]);
 	}
-	kfree(pxmitpriv->pallocated_xmitbuf);
-	pxmitpriv->pallocated_xmitbuf = NULL;
+	kfree(pxmitpriv->pxmitbuf);
+	pxmitpriv->pxmitbuf = NULL;
 clean_up_frame_buf:
 	kfree(pxmitpriv->pallocated_frame_buf);
 	pxmitpriv->pallocated_frame_buf = NULL;
@@ -193,7 +190,7 @@ void _free_xmit_priv(struct xmit_priv *pxmitpriv)
 		pxmitbuf++;
 	}
 	kfree(pxmitpriv->pallocated_frame_buf);
-	kfree(pxmitpriv->pallocated_xmitbuf);
+	kfree(pxmitpriv->pxmitbuf);
 	free_hwxmits(padapter);
 }
 
diff --git a/drivers/staging/rtl8712/rtl871x_xmit.h b/drivers/staging/rtl8712/rtl871x_xmit.h
index cdcbc87a3cad..784172c385e3 100644
--- a/drivers/staging/rtl8712/rtl871x_xmit.h
+++ b/drivers/staging/rtl8712/rtl871x_xmit.h
@@ -244,7 +244,6 @@ struct	xmit_priv {
 	int cmdseq;
 	struct  __queue free_xmitbuf_queue;
 	struct  __queue pending_xmitbuf_queue;
-	u8 *pallocated_xmitbuf;
 	u8 *pxmitbuf;
 	uint free_xmitbuf_cnt;
 };

