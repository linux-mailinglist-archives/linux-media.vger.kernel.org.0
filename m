Return-Path: <linux-media+bounces-15748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F4F946A42
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 17:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBECD281148
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 15:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095CC1547C6;
	Sat,  3 Aug 2024 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="KNzhg/r/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51951ABEA7
	for <linux-media@vger.kernel.org>; Sat,  3 Aug 2024 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722697885; cv=none; b=FA8vusMzHW6QAgcvsaAMgFDKqRhn1FVKiH1fNK99IOALY4dkuRfDjUeBtBA5izsNiM/Cp/5wMma/EVrE/Vck3kvbzKF/Rh1H2rc6L1VQ+S+if9TH0AccJ1QSPg5dXbOARwRMQfa7RzD9eMhOyB0sdCsO7XNxtlVw0lB2l2JtbN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722697885; c=relaxed/simple;
	bh=JF/wE9u1Tne1H8W3KbB1SZ6Ig50I8A9lZKdEDGBY9Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WY29BNqlp7ar3FFhKnHjf2tCX/X4zreqgjYXlXJwSzipdZiUTOq46jJoCk0sIWOOJscj9nJ11WvEvIwj+DjVdX/F2EadLQy940cz/3wCOuENd2ATOp5rcEFpdTdBPV1w+Ciu4nNPKQME36MxiB2rrgMwFeuvlhomw/ZrFkVkxNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=KNzhg/r/; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6b7b349a98aso63203406d6.3
        for <linux-media@vger.kernel.org>; Sat, 03 Aug 2024 08:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722697882; x=1723302682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0OeF63u+VwIGDySfVB+9wYuobTQrEUq+aYb7vEKyGAA=;
        b=KNzhg/r/kbbu58uIt/ZvU+FOhLt+8YbCNWWVknkO9MtjIL7MW91xzp29EcPRAtCbxs
         cmaLbC49yIdm1eEySWTtMN1I/pYp6Davyt5Ocrmv5lt0Jnvt//Apvtwaahb7dhtMTduf
         lkfG8bV2ayPhn6AnV1G+WfJzW+KwCChlGvL6IFo21+xLg3kYhuUbMpsf33nsuqbPUL1L
         9Fz33RUi8ghi9vsnpMpd4/lj4NlE6Bzo8puzukylT7R+dPePxX3YqySdDR4rVzHLEZlu
         JolJGDszJPvNPNE1T+j8b9dmpZAJNyInRwYk3ovqoJCGCijxXvB2WM2MN9nrbOzC3tvW
         KfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722697882; x=1723302682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OeF63u+VwIGDySfVB+9wYuobTQrEUq+aYb7vEKyGAA=;
        b=IKG8BdS5m1X+ivZb6DP3y26vleUXeLT2g+0nZmpTepbeH0odvp1YQgn7fC6GZt/np2
         1j7yLu+3K1T/q8kTi1Bgx+HOrKTw/AvKe4NQJUa7/SoSZBbFakUj0/J8HWnd2JYe9HNl
         5lUYcEzKC7fSTLXt7T2ZlExAQ75FXt5WcGx2DWri2QedNhwRJStD0eY5SHcYr/g240NV
         ko71ClRaXQFWIHUEEkv19jy1TzJDVbQeEG6pC9Y6r68/d/yMKKHsLvNZGolYVwKFEaFR
         FTPe2x377iMmW333pf94SqD90MQsXNh170bIDE+iPfLa0FhA0ArWdp5c+Jz0Il70yzfE
         QzKw==
X-Forwarded-Encrypted: i=1; AJvYcCV0io479K1GtW7DNtTdZeoeiIYF+PmdvJtRZxKJxDW6yXsdBo+YUsdc1g1xXYJLCZSaz99AGCxbAHF6zigyMgmDPlDtS57f8ESaHN8=
X-Gm-Message-State: AOJu0Ywzl4W2IZdpQsOlZQJjX+XwKqXAAiJ7dMvrooGbN/xw47HNE9VV
	1SVNq4bLN8xBRQ6kUUeLWn8M+dpaxMIjMRjrvzmeU5aKS5xQnJfcsF+H8eJ7uw==
X-Google-Smtp-Source: AGHT+IGX8cvXFMW7osz5blTG0egdvz+yOFiDhNeyBs4kvLQv00+Wtle7rEJFgl6vT+sxZ0Yr5tHSUA==
X-Received: by 2002:a0c:fc4e:0:b0:6bb:9b66:f264 with SMTP id 6a1803df08f44-6bb9b66f77bmr59319746d6.0.1722697882581;
        Sat, 03 Aug 2024 08:11:22 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3ed1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c839e04sm17443846d6.97.2024.08.03.08.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 08:11:22 -0700 (PDT)
Date: Sat, 3 Aug 2024 11:11:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nam Cao <namcao@linutronix.de>
Cc: syzbot <syzbot+ca2eaaadab55de6a5a42@syzkaller.appspotmail.com>,
	florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [staging?] [usb?] WARNING in
 r8712_usb_write_mem/usb_submit_urb (2)
Message-ID: <ebce8d2c-4b9f-4c80-9d37-fa507e06b9ce@rowland.harvard.edu>
References: <00000000000095a6be061ebea91f@google.com>
 <20240803142426.d8uduX0h@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240803142426.d8uduX0h@linutronix.de>

On Sat, Aug 03, 2024 at 04:24:26PM +0200, Nam Cao wrote:
> On Fri, Aug 02, 2024 at 08:01:38PM -0700, syzbot wrote:
> > usb 1-1: BOGUS urb xfer, pipe 3 != type 1
> > WARNING: CPU: 0 PID: 2583 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
> ...
> > Call Trace:
> >  <TASK>
> >  r8712_usb_write_mem+0x2e4/0x3f0 drivers/staging/rtl8712/usb_ops_linux.c:170
> >  rtl8712_dl_fw+0x7ab/0xfe0 drivers/staging/rtl8712/hal_init.c:203
> >  rtl8712_hal_init drivers/staging/rtl8712/hal_init.c:330 [inline]
> >  rtl871x_hal_init+0xb3/0x190 drivers/staging/rtl8712/hal_init.c:394
> >  netdev_open+0xea/0x800 drivers/staging/rtl8712/os_intfs.c:397
> 
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-6.6.y
> 
> diff --git a/drivers/staging/rtl8712/hal_init.c b/drivers/staging/rtl8712/hal_init.c
> index 1148075f0cd6..80d8c462fafa 100644
> --- a/drivers/staging/rtl8712/hal_init.c
> +++ b/drivers/staging/rtl8712/hal_init.c
> @@ -152,6 +152,10 @@ static u8 chk_fwhdr(struct fw_hdr *pfwhdr, u32 ulfilelength)
>  	return _SUCCESS;
>  }
>  
> +static const int pipetypes[4] = {
> +	PIPE_CONTROL, PIPE_ISOCHRONOUS, PIPE_BULK, PIPE_INTERRUPT
> +};
> +
>  static u8 rtl8712_dl_fw(struct _adapter *adapter)
>  {
>  	sint i;
> @@ -167,6 +171,29 @@ static u8 rtl8712_dl_fw(struct _adapter *adapter)
>  	u32 txdscp_sz = sizeof(struct tx_desc);
>  	u8 ret = _FAIL;
>  
> +	struct intf_hdl *hdl = &adapter->pio_queue->intf;
> +	struct intf_priv *pintfpriv = hdl->pintfpriv;
> +	struct dvobj_priv *pdvobj = (struct dvobj_priv *)pintfpriv->intf_dev;
> +	struct usb_device *pusbd = pdvobj->pusbdev;
> +
> +	for (int i = 0; i < 16; ++i) {
> +		struct usb_host_endpoint *ep = pusbd->ep_in[i];
> +		if (!ep)
> +			continue;
> +		int xfertype = usb_endpoint_type(&ep->desc);
> +		int type = pipetypes[xfertype];
> +		pr_err("ep_in[%d] type=%d\n", i, type);
> +	}
> +
> +	for (int i = 0; i < 16; ++i) {
> +		struct usb_host_endpoint *ep = pusbd->ep_out[i];
> +		if (!ep)
> +			continue;
> +		int xfertype = usb_endpoint_type(&ep->desc);
> +		int type = pipetypes[xfertype];
> +		pr_err("ep_out[%d] type=%d\n", i, type);
> +	}
> +
>  	ulfilelength = rtl871x_open_fw(adapter, &mappedfw);
>  	if (mappedfw && (ulfilelength > 0)) {
>  		update_fwhdr(&fwhdr, mappedfw);
> @@ -200,6 +227,7 @@ static u8 rtl8712_dl_fw(struct _adapter *adapter)
>  			txdesc->txdw0 |= cpu_to_le32(dump_imem_sz &
>  						       0x0000ffff);
>  			memcpy(payload, ptr, dump_imem_sz);
> +			pr_err("%s:%d\n", __func__, __LINE__);
>  			r8712_write_mem(adapter, RTL8712_DMA_VOQ,
>  					dump_imem_sz + TXDESC_SIZE,
>  					(u8 *)txdesc);
> @@ -229,6 +257,7 @@ static u8 rtl8712_dl_fw(struct _adapter *adapter)
>  			txdesc->txdw0 |= cpu_to_le32(dump_emem_sz &
>  						       0x0000ffff);
>  			memcpy(payload, ptr, dump_emem_sz);
> +			pr_err("%s:%d\n", __func__, __LINE__);
>  			r8712_write_mem(adapter, RTL8712_DMA_VOQ,
>  					dump_emem_sz + TXDESC_SIZE,
>  					(u8 *)txdesc);
> @@ -282,6 +311,7 @@ static u8 rtl8712_dl_fw(struct _adapter *adapter)
>  		txdesc->txdw0 |= cpu_to_le32(fwhdr.fw_priv_sz & 0x0000ffff);
>  		txdesc->txdw0 |= cpu_to_le32(BIT(28));
>  		memcpy(payload, &fwhdr.fwpriv, fwhdr.fw_priv_sz);
> +		pr_err("%s:%d\n", __func__, __LINE__);
>  		r8712_write_mem(adapter, RTL8712_DMA_VOQ,
>  				fwhdr.fw_priv_sz + TXDESC_SIZE, (u8 *)txdesc);

You don't have to run all these tests to figure out what the problem is; 
I can tell you.

The bug is connected to ffaddr2piphd() in usb_ops_linux.c.  That routine 
creates a bunch of Bulk pipe values with various endpoint numbers, based 
on the addr argument passed by its caller.  But the driver doesn't check 
to make sure that these endpoints actually exist in the device or that 
they are actually Bulk endpoints.

That's why the problem occurs.  In this syzbot test the endpoint in 
question is really Interrupt, not Bulk.  That's why the warning message 
appears about the pipe's type not matching the endpoint's type.

Alan Stern

