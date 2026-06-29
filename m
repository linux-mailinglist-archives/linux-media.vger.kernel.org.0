Return-Path: <linux-media+bounces-65855-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mcz8GxEkQmqQ0wkAu9opvQ
	(envelope-from <linux-media+bounces-65855-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:51:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8096D72E9
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:51:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JmHQL8lE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65855-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65855-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBC093023E38
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5408A3CE0A2;
	Mon, 29 Jun 2026 07:40:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24073469E0;
	Mon, 29 Jun 2026 07:40:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718839; cv=none; b=Adj+BN4cRNb15RTDU+e9ywETYNySfDxifCBlFM+LVAMitwq9/QjAKIpyrZaVL/L3fRET/MSbuqOhjYaAZx06ygD9RZpWHiuedq8063WF4llzShDAXhH+pws2uutFPee2Ccq0zJSMQD3su8w07C3Iq7EMWOyIzFiRJdABd0EycAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718839; c=relaxed/simple;
	bh=F0v2Tf0kPpSnYaBMv+x2qAbbqASb6qfz4FwTchwvMY4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=god3SEvZVW1VazUzSZsZtTDNwQMHavIG9yXPzI1KtYwLbXmxOwFyr7xw84tQ0UaGQX4HHliVjv7L+oCzvG9g3/uLLoq5X/p0wMU2fXYJ5xryP6++y2ijQILbljLFe5J9cxRLyZCclcaF+QSQiEovjYwiTJlkV6RaXC4Daa4AxwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmHQL8lE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7FD1F000E9;
	Mon, 29 Jun 2026 07:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782718836;
	bh=WgIRlcejZoj2vu7HrtjrPtuhxXds25sfbR6cc/Z3oZM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=JmHQL8lE9+PyPwTcD5p+IiQj7vBq5CdTbQo2NSAJonNiW8tzZXju3VE3viSbOi/Xe
	 JYmVavc4AmKQJvVtMNuC2TV+UU1uVsyR07xu/sjuauulxWjhnPjfmhHMHLqyJIC29e
	 7lGap7OLcO0L4xXy9+7E9Le12gWMZesIHTPtdiSsL2MY6OcWRAht+0B8Rh+ypIKUBt
	 qpNyNbyKN5DFkB84ieGPYkldqWilITr3giSQsKXs6lhHTMw8vMdlNU9Jqh17IffV0E
	 G/VeVpPc/LFlr4kpGRj8TuQ1Cwj+S7Sv8MELoIcnMrGn0+7vzkWtMF8/SN/MqsUpw8
	 3XABLFRBgmBxA==
Message-ID: <91381a8b-d562-4363-ac52-470c1ca53d80@kernel.org>
Date: Mon, 29 Jun 2026 09:40:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: WARNING in usb_free_urb
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Michal Pecio <michal.pecio@gmail.com>
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
 <b50be148-f7e4-4c11-9893-54d4278b2e32@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <b50be148-f7e4-4c11-9893-54d4278b2e32@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vbabka@kernel.org,m:michal.pecio@gmail.com,m:sanan.hasanou@gmail.com,m:vbabka@suse.cz,m:akpm@linux-foundation.org,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:harry.yoo@oracle.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:syzkaller@googlegroups.com,m:contact@pgazz.com,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:dinghao.liu@zju.edu.cn,m:michalpecio@gmail.com,m:sananhasanou@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-65855-lists,linux-media=lfdr.de,cisco];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,suse.cz,linux-foundation.org,gentwo.org,google.com,linux.dev,oracle.com,kvack.org,vger.kernel.org,googlegroups.com,pgazz.com,linuxfoundation.org,kernel.org,zju.edu.cn];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,linuxtv.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC8096D72E9

There are a lot of lifetime issues in em28xx.

This patch series should fix them:

https://patchwork.linuxtv.org/project/linux-media/list/?series=26968

If you can, then please test with this series and see if this issue
still appears.

Regards,

	Hans

On 29/06/2026 09:31, Vlastimil Babka (SUSE) wrote:
> On 6/29/26 09:20, Michal Pecio wrote:
>> On Mon, 29 Jun 2026 08:27:48 +0200, Vlastimil Babka (SUSE) wrote:
>>> On 6/26/26 23:27, sanan.hasanou@gmail.com wrote:
>>>> Good day, dear maintainers,
>>>>
>>>> We found a bug using a modified version of syzkaller.  
>>>
>>> Subject says "usb_free_urb" but you only CC'd slab maintainers, where slab
>>> slab is most likely a victim here of e.g. double kfree() or a kfree() of
>>> otherwise broken pointer.
>>>
>>> Ccing USB and EM28XX maintainers. But they can feel free to ignore this per
>>> the next point.
>>>
>>>> Kernel Branch: 7.0-rc1  
>>>
>>> Why use such a version for fuzzing? rc1 will have many bugs that are
>>> already fixed in 7.0 final. And it's not even latest, 7.1 was
>>> released 2 weeks ago too.
>>
>> To be fair, em28xx had no changes since 2024 until 7.1-rc1, so the bug
>> must be present in various stable releases and likely in mainline too.
> 
> OK I didn't check that, but in general my comment stands.
> 
>>>> WARNING: mm/slub.c:6352 at free_large_kmalloc+0xb3/0x160 mm/slub.c:6352, CPU#1: kworker/1:4/12317  
>>>
>>> A kfree() was attempted on a pointer that's neither from a slab page nor a
>>> large kmalloc page. Might be double free or corrupted.
>>>
>>>> Call Trace:
>>>>  <TASK>
>>>>  kfree+0xae/0x630 mm/slub.c:6437
>>>>  urb_destroy drivers/usb/core/urb.c:25 [inline]  
>>>
>>> static void urb_destroy(struct kref *kref)
>>> {
>>>         struct urb *urb = to_urb(kref);
>>>
>>>         if (urb->transfer_flags & URB_FREE_BUFFER)
>>>                 kfree(urb->transfer_buffer);  <--- this one
>>>
>>>         kfree(urb);
>>> }
>>>
>>>>  kref_put include/linux/kref.h:65 [inline]
>>>>  usb_free_urb+0xd1/0x120 drivers/usb/core/urb.c:96  
>>>
>>> USB layer itself is likely also not the root cause.
>>>
>>>>  em28xx_uninit_usb_xfer+0x165/0x310 drivers/media/usb/em28xx/em28xx-core.c:833
>>>>  em28xx_alloc_urbs+0xf2a/0x1130 drivers/media/usb/em28xx/em28xx-core.c:-1
>>>>  em28xx_dvb_init+0x2b0/0x4a20 drivers/media/usb/em28xx/em28xx-dvb.c:-1
>>>>  em28xx_init_extension+0x121/0x1d0 drivers/media/usb/em28xx/em28xx-core.c:1117  
>>>
>>> So it might be this driver doing something wrong?
>>
>> Yes, it is. 
> 
> Cool :)
> 
>>         /* allocate urbs and transfer buffers */
>>         for (i = 0; i < usb_bufs->num_bufs; i++) {
>>                 urb = usb_alloc_urb(usb_bufs->num_packets, GFP_KERNEL);
>>                 if (!urb) {
>>                         em28xx_uninit_usb_xfer(dev, mode);
>>                         return -ENOMEM;
>>                 }
>>                 usb_bufs->urb[i] = urb;
>>
>>                 usb_bufs->buf[i] = kzalloc(sb_size, GFP_KERNEL);
>>                 if (!usb_bufs->buf[i]) {
>>                         for (i--; i >= 0; i--)
>>                                 kfree(usb_bufs->buf[i]);
>>
>>                         em28xx_uninit_usb_xfer(dev, mode);
>>                         return -ENOMEM;
>>                 }
>>
>>                 urb->transfer_flags = URB_FREE_BUFFER;
>>
>> If buf[i] allocation fails, all previous buffers are freed and then all
>> previous URBs are destroyed. But they already have the URB_FREE_BUFFER
>> flag set, which causes a double free as shown above.
>>
>> The free(buf[i]) loop should simply be removed. It was mistakenly added
>> by d571b592c6206, then a26efd1961a18 recognized the double free but
>> attempted to fix it only by changing the order of freeing. Sent from
>> .edu domain, so probably an automatic static analyzer fix...
>>
>> Regards,
>> Michal
> 
> 


