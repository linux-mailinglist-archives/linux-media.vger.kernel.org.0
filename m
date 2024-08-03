Return-Path: <linux-media+bounces-15744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA5F9469ED
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 15:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C55131F2163A
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 13:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D126E1509A0;
	Sat,  3 Aug 2024 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tl+Fj6uv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pOHyjtjN"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1571649659;
	Sat,  3 Aug 2024 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722693367; cv=none; b=TnbdvOdhTIlP3Fc59uMkuHZfTJ4043XCw+HFE0M3K5KsFAmzTLMkI9d+vNEHfY7/KvoYAzTi1Nr7UyiKBUAgUfdu7vkSOlzqmMra3Vx7dJtFTLXeNemBNPeZdn4Faua+/VMYHr5MmDShMmtVTI4+BEXZYV/nNm7Pou2LpMETGc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722693367; c=relaxed/simple;
	bh=sQNvDj66koO4Eh6ZdtymFhAZsCA0muFCyeA6lU/MHsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1x1YydONY6JfSVsPsSgP9fmz9WlS5rk1oNye+d7M16/R/3QpCl5UhrFhcoexnJGGXf/GmK/baukLbi470cFEVNhoem1pewGgenXvfHPrKlw1emLlTioPIYYx/UYQ1QvUR8sjrWulf+CgFW0v0pPOdOwNJIYgeIeFh09JGw9Xqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tl+Fj6uv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pOHyjtjN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Sat, 3 Aug 2024 15:55:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722693361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WTqRgmwBooyFJ0l4CO4MsQ+u1B5cCeBn3LflPJpgLKA=;
	b=tl+Fj6uv5skQ7Gk3COjTSNnSvqrm/M69Wx/4ldpVaFSD+Ely9S163m8W3N/Kof7hgTl+ej
	VTpiPH/utIaICxHRGD7BIa7Myyx8T6rObBAPj3gMyahn5V200PIJ3zQtm8zfWfs08FNJgX
	JxOXpOS0zcQgX1d0tuNvXh7Yu1a7oVyYlXmoUK1gnegUguEE3hk6Sz+cKkzWR64WhH6Wyn
	sj7gDdo1t9uelqKgka0nhuiWw0agS8rTXGzi442LBBSWN4PZI7HsFTPMkqpzRg3QA2Av7d
	P753ZA0xdeP1LkCRMQk1HJaDwf2U/jdzLXY2Sk9GPPNinsCJ/VqHFxRSpoccQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722693361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WTqRgmwBooyFJ0l4CO4MsQ+u1B5cCeBn3LflPJpgLKA=;
	b=pOHyjtjNI7M4iypHHTu3eM0lJakidHJnfTGWQNjl3C8IzmTR9HCupUDl8TAozv9lZUeKM1
	mFNLqkIx15cykrBQ==
From: Nam Cao <namcao@linutronix.de>
To: syzbot <syzbot+ca2eaaadab55de6a5a42@syzkaller.appspotmail.com>
Cc: florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [staging?] [usb?] WARNING in
 r8712_usb_write_mem/usb_submit_urb (2)
Message-ID: <20240803135554.DxjC41K7@linutronix.de>
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

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git 1722389b0d86

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
 

