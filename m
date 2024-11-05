Return-Path: <linux-media+bounces-20957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 519879BD5FD
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 20:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11687282FE2
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 19:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85437212634;
	Tue,  5 Nov 2024 19:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KVlBxrWq"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1252E20E030
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 19:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730835357; cv=none; b=GcjSLxT0c5Jbul2YEAgm0d3ty9a0Z8/p7HEJtnpDgqxyCUr52Ihj9CjTmZq2lsTq0/Rfw8r1EBn6WD8b8/eTPgE44R6Dt94Bqeh104MtQlvrZAZlwhv9Ivm7SckkUEcrLDM91Nvg4xfhkbwDm79YGSdbr/OTKV7BOZDIyPNFvPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730835357; c=relaxed/simple;
	bh=4+95HUFhL8vPl9O5BC3iJiexytwjFZUxkV+lVi+6onw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIWOS+Z+Gm5BUv2m3gRQdjEg8a2Pw8dRD46szAOBnbWIPjVj1fN6XKbpT8ZjDN6jZgG9DgdAw9hCUZBP7hgmJo3mIYwsbVzRwzZGWV0kMQXp4RkoM0/XjPg28u2BA20QCZ8xzpKb5vVtE7TKECp49B5D/WcdfcxUQzoprfBx/Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KVlBxrWq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730835354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZKdK16iudZZCyq1X7AC24F8WR5QTZiOTUd+AqJ8W9U=;
	b=KVlBxrWq0RuB8nlFbbb33MIW9507V0JWaFvR08l+0xkxL1HPlkxllEPrwiKeEVD39Mwptm
	k1yNsrAsTmdTrJqKLyr9H62D4tRjgvvkGxlE7yvZXfT0MCN9DkJHFaLKOSCY8QAvzXsCMG
	E4ONYkcbUWDpXEXGKsGPBYII40OTnE4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-1ov3VDFQNH-RcqF4Qh2SqQ-1; Tue, 05 Nov 2024 14:35:52 -0500
X-MC-Unique: 1ov3VDFQNH-RcqF4Qh2SqQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a9a1e429a8fso453511666b.0
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 11:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730835351; x=1731440151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZKdK16iudZZCyq1X7AC24F8WR5QTZiOTUd+AqJ8W9U=;
        b=ptey4URSCinEoAJ6xB/00GsXFDhh71IfhAGcwXwf4v6i79BQX89Z4aeXMP7HOstoyM
         2FkJPxs2XyFpKPxfBBk+v2EIsP61KrUVNDhIEbK0Vp9slXdR8JwaV0qy1P77iZoQyquq
         3RWcasaWKQod2vgL9sM2A0w7VJrvblBHYWVjHSTsxl4G+6kpILZhR5i5GCM9GUfDBhai
         /8EwvD2zxOWVUGVCNWo/gM5SVA5NOmKtHXpPZ0ySWh5UAMYnCqkmubxEOJChwALXlyWi
         b8VR8v27gs/ztM2AT1ach4moPo0ESikTPFX5MFFlg/c0qEKpwrPDdhnpky/pcjqnsMsV
         aZNw==
X-Forwarded-Encrypted: i=1; AJvYcCWKPSZAj0F76n/Lvmh0YVV3DOqicFJujG0nry+w+i7z4+VxtxqRF0RmzRYvUcxKBCnbtVhc9zm2svy+uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUzXH2s4csHZ9bj+L45lr3qSPKew+lsF3oi11m+I0BISgxS8Xv
	mGvL9zrClv84cEt10rYKq86Ol/T7lKMO23LYEoUYQAk4HvXRVzA2Lc1RZvpz67ouJm3/sEuCfvc
	AlnUsDGTJyBcUUXH+5ycHDDvIJlFRHhTLr7w1oopDqYJOtmKejoOHB0u8jUxW
X-Received: by 2002:a05:6402:358f:b0:5ce:d6a0:be32 with SMTP id 4fb4d7f45d1cf-5ced6a0c1bamr6098498a12.1.1730835351245;
        Tue, 05 Nov 2024 11:35:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+/jS7yD4IqKehP9xWZffiKY4QUimYf6f82X8Z0SCxVKffpyKS64jEOnMQvkOYbF72XdS3wA==
X-Received: by 2002:a05:6402:358f:b0:5ce:d6a0:be32 with SMTP id 4fb4d7f45d1cf-5ced6a0c1bamr6098483a12.1.1730835350784;
        Tue, 05 Nov 2024 11:35:50 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6ac399bsm1683158a12.52.2024.11.05.11.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 11:35:49 -0800 (PST)
Message-ID: <2d5f8d30-e579-4d90-9609-be8d155d6f42@redhat.com>
Date: Tue, 5 Nov 2024 20:35:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [rft, PATCH v1 1/1] media: atomisp: Replace macros from
 math_support.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240923085652.3457117-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240923085652.3457117-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Sep-24 10:56 AM, Andy Shevchenko wrote:
> Replace rarely used macros by generic ones from Linux kernel headers.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> Please, apply only after tests that confirm everything is working
> as expected.

I gave this a try today and I'm afraid that it causes problems.

The original CEIL_DIV helper had a check to avoid divide by 0 and
it looks like that check is necessary in at least some cases
(I did not investigate this further):

[  494.054038] Oops: divide error: 0000 [#1] PREEMPT SMP PTI
[  494.054083] CPU: 0 UID: 1000 PID: 2622 Comm: qcam Tainted: G         C  E      6.12.0-rc3+ #175
[  494.054112] Tainted: [C]=CRAP, [E]=UNSIGNED_MODULE
[  494.054124] Hardware name: Acer Iconia W4-820/Cheetah3, BIOS V1.16 03/13/2014
[  494.054138] RIP: 0010:atomisp_css2_hw_store_32+0x503/0x5b0 [atomisp]
[  494.054296] Code: 48 c1 e8 23 39 f0 72 7b 4c 8b af 68 0f 00 00 41 81 bd 58 01 00 00 ff 1f 00 00 0f 87 9b 00 00 00 89 e8 31 d2 d1 e8 8d 44 01 ff <f7> f1 31 d2 89 c1 44 89 e0 d1 e8 8d 44 06 ff f7 f6 39 c1 0f 85 37
[  494.054316] RSP: 0018:ffff9e3d458379c0 EFLAGS: 00010206
[  494.054339] RAX: 00000000000003bf RBX: ffff909c42f584a0 RCX: 0000000000000000
[  494.054354] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff909c42f584a0
[  494.054369] RBP: 0000000000000780 R08: 00000000000005a0 R09: 0000000000000780
[  494.054383] R10: ffffffffc0f448e0 R11: 0000000000000000 R12: 00000000000005a0
[  494.054397] R13: ffff909c42f58028 R14: ffffffffc0f44e20 R15: ffffffffc0f44d90
[  494.054413] FS:  00007f2c5f4006c0(0000) GS:ffff909cb4800000(0000) knlGS:0000000000000000
[  494.054431] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  494.054446] CR2: 00007f2c8247ea19 CR3: 00000000327b6000 CR4: 00000000001026f0
[  494.054463] Call Trace:
[  494.054478]  <TASK>
[  494.054494]  ? __die_body.cold+0x19/0x27
[  494.054523]  ? die+0x2a/0x50
[  494.054551]  ? do_trap+0xc6/0x110
[  494.054577]  ? atomisp_css2_hw_store_32+0x503/0x5b0 [atomisp]
[  494.054717]  ? do_error_trap+0x81/0x110
[  494.054737]  ? atomisp_css2_hw_store_32+0x503/0x5b0 [atomisp]
[  494.054890]  ? exc_divide_error+0x34/0x50
[  494.054916]  ? atomisp_css2_hw_store_32+0x503/0x5b0 [atomisp]
[  494.055117]  ? asm_exc_divide_error+0x16/0x20
[  494.055147]  ? __pfx_atomisp_css_preview_get_output_frame_info+0x10/0x10 [atomisp]
[  494.055357]  ? __pfx_atomisp_css_preview_configure_pp_input+0x10/0x10 [atomisp]
[  494.055545]  ? __pfx_atomisp_css_preview_configure_output+0x10/0x10 [atomisp]
[  494.055721]  ? atomisp_css2_hw_store_32+0x503/0x5b0 [atomisp]
[  494.055933]  atomisp_css_preview_configure_pp_input+0xe0/0x1e0 [atomisp]
[  494.056151]  ? __pfx_atomisp_css_preview_configure_pp_input+0x10/0x10 [atomisp]
[  494.056367]  atomisp_set_fmt+0x774/0xb80 [atomisp]
[  494.056580]  v4l_s_fmt+0x1c7/0x5a0 [videodev]
[  494.056761]  __video_do_ioctl+0x456/0x480 [videodev]
[  494.056936]  video_usercopy+0x381/0x830 [videodev]
[  494.057052]  ? __pfx___video_do_ioctl+0x10/0x10 [videodev]
[  494.057167]  ? ioctl_has_perm.constprop.0.isra.0+0xa8/0xe0
[  494.057204]  ? __pfx_inode_insert5+0x5/0x10
[  494.057235]  ? __fget_files+0x9b/0x190
[  494.057258]  ? lock_release+0x175/0x2a0
[  494.057299]  v4l2_ioctl+0x49/0x50 [videodev]
[  494.057455]  __x64_sys_ioctl+0x90/0xd0
[  494.057485]  do_syscall_64+0x93/0x180
[  494.057511]  ? lock_release+0x175/0x2a0
[  494.057532]  ? _raw_spin_unlock_irqrestore+0x35/0x60
[  494.057563]  ? ldsem_up_read+0x17/0x40
[  494.057587]  ? file_tty_write.isra.0+0x224/0x2d0
[  494.057622]  ? vfs_write+0x259/0x510
[  494.057654]  ? syscall_exit_to_user_mode+0x11/0x280
[  494.057681]  ? do_syscall_64+0x9f/0x180
[  494.057708]  ? lockdep_hardirqs_on+0x78/0x100
[  494.057738]  ? do_syscall_64+0x9f/0x180
[  494.057765]  ? __rseq_handle_notify_resume+0x316/0x580
[  494.057804]  ? do_syscall_64+0x9f/0x180
[  494.057830]  ? lockdep_hardirqs_on+0x78/0x100
[  494.057859]  ? do_syscall_64+0x9f/0x180
[  494.057891]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  494.057920] RIP: 0033:0x7f2c818fe0ad
[  494.057950] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
[  494.057977] RSP: 002b:00007f2c5f3fe2f0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  494.058004] RAX: ffffffffffffffda RBX: 00007f2c5f3fe750 RCX: 00007f2c818fe0ad
[  494.058021] RDX: 00007f2c5f3fe390 RSI: 00000000c0d05605 RDI: 0000000000000025
[  494.058036] RBP: 00007f2c5f3fe340 R08: 00007f2c300178d0 R09: 000000000000000d
[  494.058052] R10: 00007f2c3000b320 R11: 0000000000000246 R12: 00000000ffffffea
[  494.058067] R13: 0000000000000001 R14: 00007f2c5f3fe740 R15: 00007f2c5f3fe750
[  494.058110]  </TASK>

Regards,

Hans




