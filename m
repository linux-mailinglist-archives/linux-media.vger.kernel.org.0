Return-Path: <linux-media+bounces-16421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1C5955E7D
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 20:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF0392816E7
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 18:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1C814EC47;
	Sun, 18 Aug 2024 18:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CXi21t3a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A1F1386C6
	for <linux-media@vger.kernel.org>; Sun, 18 Aug 2024 18:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724005250; cv=none; b=M7BJh8uB/4av5kOITIl5eMB16FpZyO9GRR04f2oI0T2meBKemUci8HEJFvYWzex9DEad/YR1+7kLPk7VEpb3Su7LICSVggL1saAJE+HHtlbJdnjdGeqoR6jl6w4nN5wbgpXl+FzF9OX6q5q8NGHmTKTpR6i9DcFCLyIHVP4souk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724005250; c=relaxed/simple;
	bh=Pvjl3WgVUuDqfZ1Uvu7ysrrEkJnBzMyGdX+Q6ICQrVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hILTmpA2M5xVTuXvhyI4iSnOL3VLRpIbMSO5KcgliNXcVd7dizbcRMExXTueTvNgtNzWXEaFiWGixtxiWlRoumICVX/DGx8RTC8et94uPWBub1mVve41ru6DIkSTq8v/coPxW3ezXgglfpR8Sd4ildsksMqM0paB4kStn4BoTd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CXi21t3a; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e0885b4f1d5so3767858276.1
        for <linux-media@vger.kernel.org>; Sun, 18 Aug 2024 11:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724005247; x=1724610047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jox7T9NtUsylEjcIyLm3wfHI0IexZSdvTQ1czCVm42w=;
        b=CXi21t3ayWNRUHKd+dwn9uJMkw4ZfV9IfXs7tmO1gPAT02985C8HhZGFjcz37Jo52E
         h+5KH98fwRQ1wDT+/sg3T87mDemIFGlsSnmz8bUz2ifjl6WXd9l25T2XVf6XrvpR2GuC
         f6kGgJVZ9pxnxmtBff6yrAn4kg5zO83nur/FyEN2nlnK+LB5dC86JYKPmpqXrg1SZBzx
         FZeLgu3sEBnJpGreqngoXIEmQtAKTznHt0TSe4hEZRn+F/O/gNW71vGNTr7HlvvDstDD
         /zrbZE9lscqJFrukk5F7I8kVW02hD11GKk5CSB3D3vk4GXtI4/KeRt61bPSSGdtMIib7
         f7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724005247; x=1724610047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jox7T9NtUsylEjcIyLm3wfHI0IexZSdvTQ1czCVm42w=;
        b=su5bxgBd3AFNvDksklxbp4woVTwVBuDHpliK7+Bnw9Re5gR0BPT8J6nRqFUcolbllp
         TnNpc0qTGJ5hgTSUB3OESWQFq8J3HVhxXrIuS5XS6pElVwfp24HBbMMcma9vq/ZVigdu
         G/bUU525ORKrKX0E8tN4nCVNDprzLaB630pIvbrNmM765cmd1R/dxFwq4bVKfpf33UbM
         IA/za2YqoipnXres2g/KLC6tuL40ujF6DbVytO+2KVLuWJrbyIVIiETqzH5GWfIpXew7
         CX8IJj3R8F5KiWGe2dbt6RHBh1f0K7nFXQVEjqIs6kRWvbjqKC7y8hGVPZ2Zfe6IRmgb
         NCJw==
X-Forwarded-Encrypted: i=1; AJvYcCVYBEzAqRJBoSSV0G3H20Dh+UYIgI1/G7VuVhdU/v0RwrfDlPaZUwXm8/3aVyeNUvBPrPME2mjVmWszhNLt+HHVL6yFSy9bV90wcuw=
X-Gm-Message-State: AOJu0YzAjL1SVBXbz6UQLomB3Pw41/7p5niCsq+jfGX75Eey+nGSmeC4
	s6/+D8eB11sQSiWEYkqfsr/nWMIGXQz2qXVICXFnmtMpF2IJa15RpM/g07lu/w==
X-Google-Smtp-Source: AGHT+IFKGExb+ktmdEFnBMw0bmj29Mz0VltYqAunJK7XBt+i5y65MaxwS5GQ33CZbB2/HQmZB2ZlYw==
X-Received: by 2002:a05:690c:60c5:b0:61b:3304:b702 with SMTP id 00721157ae682-6b1b73a894amr97678307b3.5.1724005247611;
        Sun, 18 Aug 2024 11:20:47 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3ed1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff0dcac4sm368196885a.84.2024.08.18.11.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 11:20:47 -0700 (PDT)
Date: Sun, 18 Aug 2024 14:20:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media/usb/siano: Fix endpoint type checking in smsusb
Message-ID: <1959a4fb-8bf2-456b-83b8-ea28d517debf@rowland.harvard.edu>
References: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
 <0000000000009f6f85061e684e92@google.com>
 <51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>

Greg and Mauro:

Was this patch ever applied?  It doesn't appear in the current -rc 
kernel.  Was there some confusion about which tree it should be merged 
through?

Here's a link to the original submission:

https://lore.kernel.org/all/51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu/

Alan Stern

On Wed, Jul 31, 2024 at 01:29:54PM -0400, Alan Stern wrote:
> The syzbot fuzzer reports that the smsusb driver doesn't check whether
> the endpoints it uses are actually Bulk:
> 
> smsusb:smsusb_probe: board id=15, interface number 6
> smsusb:siano_media_device_register: media controller created
> ------------[ cut here ]------------
> usb 1-1: BOGUS urb xfer, pipe 3 != type 1
> WARNING: CPU: 0 PID: 42 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
> ...
> Call Trace:
>  <TASK>
>  smsusb_submit_urb+0x288/0x410 drivers/media/usb/siano/smsusb.c:173
>  smsusb_start_streaming drivers/media/usb/siano/smsusb.c:197 [inline]
>  smsusb_init_device+0x856/0xe10 drivers/media/usb/siano/smsusb.c:477
>  smsusb_probe+0x5e2/0x10b0 drivers/media/usb/siano/smsusb.c:575
> 
> The problem can be fixed by checking the endpoints' types along with
> their directions.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reported-by: syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com
> Tested-by: syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-usb/000000000000e45551061e558c37@google.com/
> Fixes: 31e0456de5be ("media: usb: siano: Fix general protection fault in smsusb")
> Cc: <stable@vger.kernel.org>
> 
> ---
> 
>  drivers/media/usb/siano/smsusb.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Index: usb-devel/drivers/media/usb/siano/smsusb.c
> ===================================================================
> --- usb-devel.orig/drivers/media/usb/siano/smsusb.c
> +++ usb-devel/drivers/media/usb/siano/smsusb.c
> @@ -410,10 +410,10 @@ static int smsusb_init_device(struct usb
>  		struct usb_endpoint_descriptor *desc =
>  				&intf->cur_altsetting->endpoint[i].desc;
>  
> -		if (desc->bEndpointAddress & USB_DIR_IN) {
> +		if (usb_endpoint_is_bulk_in(desc)) {
>  			dev->in_ep = desc->bEndpointAddress;
>  			align = usb_endpoint_maxp(desc) - sizeof(struct sms_msg_hdr);
> -		} else {
> +		} else if (usb_endpoint_is_bulk_out(desc)) {
>  			dev->out_ep = desc->bEndpointAddress;
>  		}
>  	}

