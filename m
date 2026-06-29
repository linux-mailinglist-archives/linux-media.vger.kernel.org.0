Return-Path: <linux-media+bounces-65851-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 76/NMm4hQmr50gkAu9opvQ
	(envelope-from <linux-media+bounces-65851-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:40:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF3F6D71A2
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:40:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RPpyMNwD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65851-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65851-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2DA33050E5A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5550432B11A;
	Mon, 29 Jun 2026 07:31:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10ED328610;
	Mon, 29 Jun 2026 07:31:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718295; cv=none; b=A4gxRzSCW90MdXs+5QyH962Y1jKryuzK061Jj/EyithPVY8io7WkLAESh47xdJ8TyRDkw1/7GMMNR7nEJ8JBpSh05/P6l4vMHr/fR628udEsGcIksMCzABoYRFKGCn91DQ56QvwRVRVxZ81MdTzEFpi2kwpQ3Z3TYVu7isT5Y+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718295; c=relaxed/simple;
	bh=SwHiPs+xOpgxja93LG00y7ipfqihNQwmq9d/QZteab8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0hk2TmSHDuwtEyiNazIUSD3eg3efM/HsmqimbmiVzHDBPEGkNV/ElFpXuXzfj/80Vi81uzBEsU8hJJhE8+VMQheHGna77xDrhTFctSjP6UcECDagW2S9ojaoNLNv6TtBRSwvb5glRUvZEsrbXXv7jTCnAGo/a6qncdfV/FZ5aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPpyMNwD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2251F000E9;
	Mon, 29 Jun 2026 07:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782718291;
	bh=gfFSSbFa1kkiEFju+F2cWFK+kFerBLm7T/klRFOuIwg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RPpyMNwDxysjUcOYZ4W+pforECuPsD7hMwvFilq+ds9qaGhx1Igu2VE42OfdXIsQy
	 ZzDXfSX/hk1IUtpf3E4WAW09xj/bDch7THnUpa5oUa7aSX4lOq/6SciAFiGOr/XquU
	 6boEJD3X4bCxX3SK0foOnvI7rwfvikUW2jM+0kaKSgzAhOIe7tFcIRm/6ZbSSMJWCK
	 /UAIzIs/z1ArHGGH/37tj0FGbmOpGGvAyjoqqnDhMvD2rhqx70PENKtqRq8lAMzzy6
	 l2SfLXFGOu/Ckq3xO2wVbcbhxGlrUEzrG2kFJjPXivhlkiEnP/3AYhWk+MrFk6gZYv
	 AYwoZpNALHhWg==
Message-ID: <b50be148-f7e4-4c11-9893-54d4278b2e32@kernel.org>
Date: Mon, 29 Jun 2026 09:31:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING in usb_free_urb
Content-Language: en-US
To: Michal Pecio <michal.pecio@gmail.com>
Cc: sanan.hasanou@gmail.com, vbabka@suse.cz, akpm@linux-foundation.org,
 cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev,
 harry.yoo@oracle.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 syzkaller@googlegroups.com, contact@pgazz.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Dinghao Liu <dinghao.liu@zju.edu.cn>
References: <6a3eeead.7fb353d3.354599.b0b0@mx.google.com>
 <85cf5045-b52b-4aaa-a038-ca1b856b55f9@kernel.org>
 <20260629092033.4a83e91b.michal.pecio@gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20260629092033.4a83e91b.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michal.pecio@gmail.com,m:sanan.hasanou@gmail.com,m:vbabka@suse.cz,m:akpm@linux-foundation.org,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:harry.yoo@oracle.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:syzkaller@googlegroups.com,m:contact@pgazz.com,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:dinghao.liu@zju.edu.cn,m:michalpecio@gmail.com,m:sananhasanou@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-65851-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vbabka@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,suse.cz,linux-foundation.org,gentwo.org,google.com,linux.dev,oracle.com,kvack.org,vger.kernel.org,googlegroups.com,pgazz.com,linuxfoundation.org,kernel.org,zju.edu.cn];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AF3F6D71A2

On 6/29/26 09:20, Michal Pecio wrote:
> On Mon, 29 Jun 2026 08:27:48 +0200, Vlastimil Babka (SUSE) wrote:
>> On 6/26/26 23:27, sanan.hasanou@gmail.com wrote:
>> > Good day, dear maintainers,
>> > 
>> > We found a bug using a modified version of syzkaller.  
>> 
>> Subject says "usb_free_urb" but you only CC'd slab maintainers, where slab
>> slab is most likely a victim here of e.g. double kfree() or a kfree() of
>> otherwise broken pointer.
>> 
>> Ccing USB and EM28XX maintainers. But they can feel free to ignore this per
>> the next point.
>> 
>> > Kernel Branch: 7.0-rc1  
>> 
>> Why use such a version for fuzzing? rc1 will have many bugs that are
>> already fixed in 7.0 final. And it's not even latest, 7.1 was
>> released 2 weeks ago too.
> 
> To be fair, em28xx had no changes since 2024 until 7.1-rc1, so the bug
> must be present in various stable releases and likely in mainline too.

OK I didn't check that, but in general my comment stands.

>> > WARNING: mm/slub.c:6352 at free_large_kmalloc+0xb3/0x160 mm/slub.c:6352, CPU#1: kworker/1:4/12317  
>> 
>> A kfree() was attempted on a pointer that's neither from a slab page nor a
>> large kmalloc page. Might be double free or corrupted.
>> 
>> > Call Trace:
>> >  <TASK>
>> >  kfree+0xae/0x630 mm/slub.c:6437
>> >  urb_destroy drivers/usb/core/urb.c:25 [inline]  
>> 
>> static void urb_destroy(struct kref *kref)
>> {
>>         struct urb *urb = to_urb(kref);
>> 
>>         if (urb->transfer_flags & URB_FREE_BUFFER)
>>                 kfree(urb->transfer_buffer);  <--- this one
>> 
>>         kfree(urb);
>> }
>> 
>> >  kref_put include/linux/kref.h:65 [inline]
>> >  usb_free_urb+0xd1/0x120 drivers/usb/core/urb.c:96  
>> 
>> USB layer itself is likely also not the root cause.
>> 
>> >  em28xx_uninit_usb_xfer+0x165/0x310 drivers/media/usb/em28xx/em28xx-core.c:833
>> >  em28xx_alloc_urbs+0xf2a/0x1130 drivers/media/usb/em28xx/em28xx-core.c:-1
>> >  em28xx_dvb_init+0x2b0/0x4a20 drivers/media/usb/em28xx/em28xx-dvb.c:-1
>> >  em28xx_init_extension+0x121/0x1d0 drivers/media/usb/em28xx/em28xx-core.c:1117  
>> 
>> So it might be this driver doing something wrong?
> 
> Yes, it is. 

Cool :)

>         /* allocate urbs and transfer buffers */
>         for (i = 0; i < usb_bufs->num_bufs; i++) {
>                 urb = usb_alloc_urb(usb_bufs->num_packets, GFP_KERNEL);
>                 if (!urb) {
>                         em28xx_uninit_usb_xfer(dev, mode);
>                         return -ENOMEM;
>                 }
>                 usb_bufs->urb[i] = urb;
> 
>                 usb_bufs->buf[i] = kzalloc(sb_size, GFP_KERNEL);
>                 if (!usb_bufs->buf[i]) {
>                         for (i--; i >= 0; i--)
>                                 kfree(usb_bufs->buf[i]);
> 
>                         em28xx_uninit_usb_xfer(dev, mode);
>                         return -ENOMEM;
>                 }
> 
>                 urb->transfer_flags = URB_FREE_BUFFER;
> 
> If buf[i] allocation fails, all previous buffers are freed and then all
> previous URBs are destroyed. But they already have the URB_FREE_BUFFER
> flag set, which causes a double free as shown above.
> 
> The free(buf[i]) loop should simply be removed. It was mistakenly added
> by d571b592c6206, then a26efd1961a18 recognized the double free but
> attempted to fix it only by changing the order of freeing. Sent from
> .edu domain, so probably an automatic static analyzer fix...
> 
> Regards,
> Michal


