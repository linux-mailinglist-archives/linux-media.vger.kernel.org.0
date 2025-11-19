Return-Path: <linux-media+bounces-47390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF6C6FEBF
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 17:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 86A523527C2
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 15:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023E1327C0B;
	Wed, 19 Nov 2025 15:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Kj6H2xtX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2AB327BF7
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567477; cv=none; b=D+eo0VEi7KpesKnkJSz/vv/Wzn5YYZ6gPW7mHvJPUvDemBeEXtzujt35MpfGGuE1ME51N0JtksWeA5UBM2KPZ9gmEH/ObSuK9cCAnJqk79czYmBjHgElO4e54dDjKRJlt8RoGID7MFvpE3mUVxnysCa8tKgqZTuRXGlebRTG/94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567477; c=relaxed/simple;
	bh=URqyHjs55zOFqqjd2BtmGNA1Gw1aEjZauFlz7pfk4Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBP2RSvMRnt2tNAbmEAldtv+WwmQ+8kW9/Bf93cQ1+pYMK8hsoDLuEcGsJXnKVI9sDRYW22r5OIe/d4+/M+Uz671W3/20Xd/1uckkOVYfumnLqt3v/1TpKFfvJBFwlZrKUuq2Qb63cXqgkamwmP52SzukHA9HDkF+Imb4Z+FtGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Kj6H2xtX; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2d56eaaceso452137485a.0
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 07:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763567474; x=1764172274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iS6cTtIbe+eK6ugfzKEdqUzSK9RbsRwcAJ2aewsT3RU=;
        b=Kj6H2xtXQefRPMybcSPo1wknr+jML2M9gAW6Jzgx0xcBz4JqEppcoP/Qt2dfMV4tb0
         XV3gxCh0ZuZHDGAAXc/KpU5euUasFFpoJbrPtROpjCSAE9GgczIHc5rhFXqTR4BW8sqT
         q3GVVcU+dh7cMt1GW3NQ67L+LoStzTXwFU6KqYyskfOS/im7fs6Qxj5i8JzMFXIuFrif
         plVCrg3frIV3wpscZKS/cynD+p4VJa3idnQ+bNRM7pCUW9FrtsqgOyfrfaTsOHCWgmrm
         Po0ejHaNul9EgliqYfVl6zMK9ebcpdYYiTTtV/y6VIw6AVctgHCpT0M9J/wOOK7cXPmJ
         btdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567474; x=1764172274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iS6cTtIbe+eK6ugfzKEdqUzSK9RbsRwcAJ2aewsT3RU=;
        b=fMrNTE2JO93XceUV7CFVcvZgSokx0PxghuMbdZgz813K35YeV3C8f8KtdE6h1Y/8X8
         kvGwx8pmK9QHjKS7cWdzXA5zBCtH5Nlu9n5EyQ/I4y9f89CbR2SEy4gjCYAjp/BxumPF
         hZVsY7cXt1HX26bYpA4kaYbruB7XsxvpHHgV6SxsHaHEmH/Leuw8loaStuAuzY2LFZ22
         +eYMcaz13o3kWQMNd8l5mog9OasBwA9v9OVmL9hxTQpyg7GkbB1oaIZBR6XVeEVMXXaq
         Hm5qNKl6RpQ9IhFcU9+jlpnnJp/bMi6kihaBOE31PFj/KYJHIYBqGGIiTkOFr/nlHZIj
         wtGQ==
X-Gm-Message-State: AOJu0YwUC/dtUDKfwphkjz+a/EOh6oQzcZHC5oEWFcftW1pkXMSRElz2
	iGiFA2CrubDo2IhszeAYDiP2BlfUBsx7wF0afMu0wxJ1gR1+qyWVQYqNzsi1Zkp1Gg==
X-Gm-Gg: ASbGncuEsQ8aERtGhrLGlOYd9PadBoPhV2lrntuI3N/fekjOLwsYfVc+8HBPtSXeVmi
	8ugiK01jWkS27XS/jfi4ygBB82Kc0p1+1ZgCj3DAJI2g9No8AtRydC7VMDWoDlgW6wkVgdkjW6k
	bdPTsypoQ1XSM8UQam3K6tfgcNKoqCVIEB0YUCIsDsPn8yyl9sRUPcW44egdiAYb5PRQ4BCMoiC
	+yye0HWGnRULluf4EDP3jSbSxY9cGGXoomCx9pgXRNs8CjWJL1IbEHO9F13ddvFfcgIW7zSAJqG
	t6qrxlkB6lGgjiq/BAu3Ocl0BzJnoBqdI71Bl06xhH7o5pD6GY8BhgcD+6gjxe4hXw19FMxqecE
	p+2Il72s1TzCuZkNU1x5lQShXaH1vGcpYvyVOMeVbSVzm5qz8clCw8VrnCoZtqHpmlBoncEGiSK
	RIpYk9p053G+ACYzqsiSk0UDd76vcRMw==
X-Google-Smtp-Source: AGHT+IHeIbTV4FHMV0GwEl6WOWGBv403c8qCD0HfAFnZsQui7PmnKJsLA6lH5dgIjUpSfPkintZXTw==
X-Received: by 2002:a05:620a:1a86:b0:8ad:32ae:b6c1 with SMTP id af79cd13be357-8b3170568c2mr446526885a.47.1763567474088;
        Wed, 19 Nov 2025 07:51:14 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2e44c3154sm901098285a.20.2025.11.19.07.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:51:13 -0800 (PST)
Date: Wed, 19 Nov 2025 10:51:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Nalivayko Sergey <Sergey.Nalivayko@kaspersky.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antoine Jacquet <royale@zerezo.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	lvc-project@linuxtesting.org,
	syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] dvb-usb: dtv5100: rewrite i2c message usb_control
 send/recv
Message-ID: <f0c93964-2971-428f-8fb9-f72147f1ad29@rowland.harvard.edu>
References: <20251117155356.1912431-1-Sergey.Nalivayko@kaspersky.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117155356.1912431-1-Sergey.Nalivayko@kaspersky.com>

On Mon, Nov 17, 2025 at 06:53:56PM +0300, Nalivayko Sergey wrote:
> syzbot reports a WARNING issue as below:
> 
> usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
> WARNING: CPU: 0 PID: 5833 at drivers/usb/core/urb.c:413 usb_submit_urb+0x1112/0x1870 drivers/usb/core/urb.c:411
> Modules linked in:
> CPU: 0 UID: 0 PID: 5833 Comm: syz-executor411 Not tainted 6.15.0-syzkaller #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Call Trace:
>  <TASK>
>  usb_start_wait_urb+0x114/0x4c0 drivers/usb/core/message.c:59
>  usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
>  usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
>  dtv5100_i2c_msg+0x250/0x330 drivers/media/usb/dvb-usb/dtv5100.c:60
>  dtv5100_i2c_xfer+0x1a4/0x3c0 drivers/media/usb/dvb-usb/dtv5100.c:86
>  __i2c_transfer+0x871/0x2170 drivers/i2c/i2c-core-base.c:-1
>  i2c_transfer+0x25b/0x3a0 drivers/i2c/i2c-core-base.c:2315
>  i2c_transfer_buffer_flags+0x105/0x190 drivers/i2c/i2c-core-base.c:2343
>  i2c_master_send include/linux/i2c.h:109 [inline]
>  i2cdev_write+0x112/0x1b0 drivers/i2c/i2c-dev.c:183
>  do_loop_readv_writev include/linux/uio.h:-1 [inline]
>  vfs_writev+0x4a5/0x9a0 fs/read_write.c:1057
>  do_writev+0x14d/0x2d0 fs/read_write.c:1101
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>  </TASK>
> 
> The issue occurs due to insufficient validation of data passed to the USB API.
> In the current implementation, the case where the operation type is read
> but the read length is zero is not handled properly, which makes no sense.
> 
> When usb_control_msg() is called with a PIPEOUT type and a read length of
> zero, a mismatch error occurs between the operation type and the expected
> transfer direction in function usb_submit_urb. This is the trigger
> for warning.
> 
> Replace usb_control_msg() with usb_control_msg_recv() and
> usb_control_msg_send() to rely on the USB API for proper validation and
> prevent inconsistencies in the future.
> 
> Reported-by: syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=0335df380edd9bd3ff70
> Fixes: 60688d5e6e6e ("V4L/DVB (8735): dtv5100: replace dummy frontend by zl10353")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nalivayko Sergey <Sergey.Nalivayko@kaspersky.com>
> ---

Can't this problem be fixed more simply by setting the 
I2C_AQ_NO_ZERO_LEN_READ adapter quirk flag, as in some of Wolfram Sang's 
recent commits?

Alan Stern

>  drivers/media/usb/dvb-usb/dtv5100.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/dtv5100.c b/drivers/media/usb/dvb-usb/dtv5100.c
> index 3d85c6f7f6ec..05860f5d5053 100644
> --- a/drivers/media/usb/dvb-usb/dtv5100.c
> +++ b/drivers/media/usb/dvb-usb/dtv5100.c
> @@ -26,40 +26,37 @@ static int dtv5100_i2c_msg(struct dvb_usb_device *d, u8 addr,
>  			   u8 *wbuf, u16 wlen, u8 *rbuf, u16 rlen)
>  {
>  	struct dtv5100_state *st = d->priv;
> -	unsigned int pipe;
>  	u8 request;
>  	u8 type;
>  	u16 value;
>  	u16 index;
>  
> +	index = (addr << 8) + wbuf[0];
> +
> +	memcpy(st->data, rbuf, rlen);
> +	msleep(1); /* avoid I2C errors */
> +
>  	switch (wlen) {
>  	case 1:
>  		/* write { reg }, read { value } */
> -		pipe = usb_rcvctrlpipe(d->udev, 0);
>  		request = (addr == DTV5100_DEMOD_ADDR ? DTV5100_DEMOD_READ :
>  							DTV5100_TUNER_READ);
>  		type = USB_TYPE_VENDOR | USB_DIR_IN;
>  		value = 0;
> -		break;
> +		return usb_control_msg_recv(d->udev, 0, request, type, value, index,
> +			st->data, rlen, DTV5100_USB_TIMEOUT, GFP_KERNEL);
>  	case 2:
>  		/* write { reg, value } */
> -		pipe = usb_sndctrlpipe(d->udev, 0);
>  		request = (addr == DTV5100_DEMOD_ADDR ? DTV5100_DEMOD_WRITE :
>  							DTV5100_TUNER_WRITE);
>  		type = USB_TYPE_VENDOR | USB_DIR_OUT;
>  		value = wbuf[1];
> -		break;
> +		return usb_control_msg_send(d->udev, 0, request, type, value, index,
> +			st->data, rlen, DTV5100_USB_TIMEOUT, GFP_KERNEL);
>  	default:
>  		warn("wlen = %x, aborting.", wlen);
>  		return -EINVAL;
>  	}
> -	index = (addr << 8) + wbuf[0];
> -
> -	memcpy(st->data, rbuf, rlen);
> -	msleep(1); /* avoid I2C errors */
> -	return usb_control_msg(d->udev, pipe, request,
> -			       type, value, index, st->data, rlen,
> -			       DTV5100_USB_TIMEOUT);
>  }
>  
>  /* I2C */
> -- 
> 2.39.5
> 

