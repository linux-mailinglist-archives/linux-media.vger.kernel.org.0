Return-Path: <linux-media+bounces-15746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A067946A0E
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 16:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EE341F213F9
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 14:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1CE1509A2;
	Sat,  3 Aug 2024 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pJanuU94";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UvTRz/DL"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386D7E54C;
	Sat,  3 Aug 2024 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722695075; cv=none; b=Qid+WHGl/OOHyJLKO/pKYEYKHrU6AF7BquvJn7WaQNfUszqa1VPHAoWQ1hwRtaw0d+GtkH16ajVKt5EXNNvu9KE9hU+Xm8jhEQGY4RpSVfrCHUWLXQNIBAJt3eDQkf0eSTRVIKuqKwRW0VMTNhPG7pnWC6pWI1eb+tkvU6BrX9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722695075; c=relaxed/simple;
	bh=sG/hCDyLBQED55kt/MG12Ng84iUh7sYK076FQO4iQ18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/KVkdqQyqhXB56HHl0jwq1myJ0WiOqrwM0IW2DQZU0y4nPiQkgKOKngzUNCCIG7SFRjFv66K1Z1WZmiNQIv6Y0xU/49fGjvRBQ0bQDfIH9+zFkbu9XmYlTOhbTyduUh6sEQqHVOCPlAnne1fvUV2xmmTPwip1W5ISUe1sOJnE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pJanuU94; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UvTRz/DL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Sat, 3 Aug 2024 16:24:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722695071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PzRgRxFQhZJyxeqlhNJixm647fCXUiwll9idU2QRwfs=;
	b=pJanuU94ItM6200qfAr0x0gj7RoOy31MLRRX1Xf0QMsCfrjISJUDFyQVobqlZWK7IvXxkg
	+tWCoXLdDWv7QLP6tmng3cxMV08ITEeuKujEPXCy4TQPIKHt3w2qI2tVCYtPHx3tJe5nf0
	bpNqRr/Tl45MfDPedU13tJ0kncNXPiELZAlkn4c4C8oo/bbXtUh2Z2jyanSl/4K4EYb/eR
	/9QYChQS3kB0klFWsgnxADArzW0dq1CWSc9DqTzOp33z8LUuGdARgWXU/RWLKxjGA5NZnE
	sR0COVnAv4YbplDs9PniyWVaB3vUWcyEhmn/ZI2y2zZbrwxfW2qxSaM6CwEa0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722695071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PzRgRxFQhZJyxeqlhNJixm647fCXUiwll9idU2QRwfs=;
	b=UvTRz/DLpde057EZu6JBXr64cMQ4xn/mW1/hGJpcb+NhVdX9Miu2b3Lv/KLib/wFLVlkGC
	ClzkCtfT3l50/xAA==
From: Nam Cao <namcao@linutronix.de>
To: syzbot <syzbot+ca2eaaadab55de6a5a42@syzkaller.appspotmail.com>
Cc: florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [staging?] [usb?] WARNING in
 r8712_usb_write_mem/usb_submit_urb (2)
Message-ID: <20240803142426.d8uduX0h@linutronix.de>
References: <00000000000095a6be061ebea91f@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000095a6be061ebea91f@google.com>

On Fri, Aug 02, 2024 at 08:01:38PM -0700, syzbot wrote:
> usb 1-1: BOGUS urb xfer, pipe 3 != type 1
> WARNING: CPU: 0 PID: 2583 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
...
> Call Trace:
>  <TASK>
>  r8712_usb_write_mem+0x2e4/0x3f0 drivers/staging/rtl8712/usb_ops_linux.c:170
>  rtl8712_dl_fw+0x7ab/0xfe0 drivers/staging/rtl8712/hal_init.c:203
>  rtl8712_hal_init drivers/staging/rtl8712/hal_init.c:330 [inline]
>  rtl871x_hal_init+0xb3/0x190 drivers/staging/rtl8712/hal_init.c:394
>  netdev_open+0xea/0x800 drivers/staging/rtl8712/os_intfs.c:397

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-6.6.y

diff --git a/drivers/staging/rtl8712/hal_init.c b/drivers/staging/rtl8712/hal_init.c
index 1148075f0cd6..80d8c462fafa 100644
--- a/drivers/staging/rtl8712/hal_init.c
+++ b/drivers/staging/rtl8712/hal_init.c
@@ -152,6 +152,10 @@ static u8 chk_fwhdr(struct fw_hdr *pfwhdr, u32 ulfilelength)
 	return _SUCCESS;
 }
 
+static const int pipetypes[4] = {
+	PIPE_CONTROL, PIPE_ISOCHRONOUS, PIPE_BULK, PIPE_INTERRUPT
+};
+
 static u8 rtl8712_dl_fw(struct _adapter *adapter)
 {
 	sint i;
@@ -167,6 +171,29 @@ static u8 rtl8712_dl_fw(struct _adapter *adapter)
 	u32 txdscp_sz = sizeof(struct tx_desc);
 	u8 ret = _FAIL;
 
+	struct intf_hdl *hdl = &adapter->pio_queue->intf;
+	struct intf_priv *pintfpriv = hdl->pintfpriv;
+	struct dvobj_priv *pdvobj = (struct dvobj_priv *)pintfpriv->intf_dev;
+	struct usb_device *pusbd = pdvobj->pusbdev;
+
+	for (int i = 0; i < 16; ++i) {
+		struct usb_host_endpoint *ep = pusbd->ep_in[i];
+		if (!ep)
+			continue;
+		int xfertype = usb_endpoint_type(&ep->desc);
+		int type = pipetypes[xfertype];
+		pr_err("ep_in[%d] type=%d\n", i, type);
+	}
+
+	for (int i = 0; i < 16; ++i) {
+		struct usb_host_endpoint *ep = pusbd->ep_out[i];
+		if (!ep)
+			continue;
+		int xfertype = usb_endpoint_type(&ep->desc);
+		int type = pipetypes[xfertype];
+		pr_err("ep_out[%d] type=%d\n", i, type);
+	}
+
 	ulfilelength = rtl871x_open_fw(adapter, &mappedfw);
 	if (mappedfw && (ulfilelength > 0)) {
 		update_fwhdr(&fwhdr, mappedfw);
@@ -200,6 +227,7 @@ static u8 rtl8712_dl_fw(struct _adapter *adapter)
 			txdesc->txdw0 |= cpu_to_le32(dump_imem_sz &
 						       0x0000ffff);
 			memcpy(payload, ptr, dump_imem_sz);
+			pr_err("%s:%d\n", __func__, __LINE__);
 			r8712_write_mem(adapter, RTL8712_DMA_VOQ,
 					dump_imem_sz + TXDESC_SIZE,
 					(u8 *)txdesc);
@@ -229,6 +257,7 @@ static u8 rtl8712_dl_fw(struct _adapter *adapter)
 			txdesc->txdw0 |= cpu_to_le32(dump_emem_sz &
 						       0x0000ffff);
 			memcpy(payload, ptr, dump_emem_sz);
+			pr_err("%s:%d\n", __func__, __LINE__);
 			r8712_write_mem(adapter, RTL8712_DMA_VOQ,
 					dump_emem_sz + TXDESC_SIZE,
 					(u8 *)txdesc);
@@ -282,6 +311,7 @@ static u8 rtl8712_dl_fw(struct _adapter *adapter)
 		txdesc->txdw0 |= cpu_to_le32(fwhdr.fw_priv_sz & 0x0000ffff);
 		txdesc->txdw0 |= cpu_to_le32(BIT(28));
 		memcpy(payload, &fwhdr.fwpriv, fwhdr.fw_priv_sz);
+		pr_err("%s:%d\n", __func__, __LINE__);
 		r8712_write_mem(adapter, RTL8712_DMA_VOQ,
 				fwhdr.fw_priv_sz + TXDESC_SIZE, (u8 *)txdesc);
 

