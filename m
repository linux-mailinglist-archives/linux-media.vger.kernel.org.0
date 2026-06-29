Return-Path: <linux-media+bounces-65849-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kNdQHxEeQmoR0gkAu9opvQ
	(envelope-from <linux-media+bounces-65849-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:26:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C73C06D6FB8
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:26:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mn2xdmTS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65849-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65849-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34D8B301877F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330BE3C9896;
	Mon, 29 Jun 2026 07:20:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB803C81B4
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 07:20:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717642; cv=none; b=PTwxEiz5IJqm/jDLxoBvdA28m9jMiWrnd2WLK6qw0NwH36mC8dm14zJKIzNoSSafsH0u31riKlKvQq8Sekc2ryYXO9ZKfY3E3oXA0TY+6TxL9xVTtaHqPTpri8trJtZMB3APXb3RyEPpbDE2CMW6juz/sXHNQ5WMmcwevcljXxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717642; c=relaxed/simple;
	bh=M12UWYnEzdYXr503Rui7pKm062AJX8vC728B50jiC7s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lE+MNrBt1Vrz5fAOZ/zwKwnZ6OcRqOeqEa8oU8lK2WKhe+Z+4gYhoViLvBjJF2TApcDwH0Dtk6Asxtazq1oRdeQhQL2xNtvgm8twAvEi2zeJgdS686bh6QB3mwkgdk7uW2kZuGGyDFh9ljbDV1AUHRpI8MYHVzUXrb2pk9amECI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mn2xdmTS; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47231f1f8f3so1881391f8f.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 00:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782717638; x=1783322438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ega7ohzS6r6GgV/ue9UrgO9PLazVFbtWrIRnE4VyLbg=;
        b=mn2xdmTShptxI5vM3SKW3f+mapAxdZhFCU0OnlpcRLPfCXo15g+50LsOMwNt/OtA+g
         7e7sEe/85Tm139Of0YdWWAUXsCtnHVL01w4ZztdhmHgsGjso+TT90FtP8HFLGPI+VaJU
         X+1j0F42O5IBh/YXaRIJ7ixahH6WaGyGukptazJTw5/NTIQ7NNERn0fJtAA8K6kGCReO
         xcXFx2BGe/5B5ClhSBz1VojLtGCT7nVZkIYP8FCd32cCfIAqXFTPmj8zblayqGVGb59p
         jqeH4EKCumvaBhev7ia76uf57eVjnf/iY/64Z60f5eMA/gxypyU8BN4U/J+ttBsvC+C3
         t9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717638; x=1783322438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ega7ohzS6r6GgV/ue9UrgO9PLazVFbtWrIRnE4VyLbg=;
        b=SL0GT4VoIxCIRr2cSc0w41w8tUgARhnwSPaBPZtSMh9g03GH0hwpa+0NNl+hbSA31/
         lGcy8p+sL7FSDNn04W+HegRKZlqFtM5qrxaw3x9gqqk8wsbG3Fwhzoq+ns62JJMapvlr
         MOefLsYYGrDhgTf/ZWl37lr57ZCNqumX6a64s9SEH7r0BmtarKx6q555GQXpdhh0DzuU
         ejWUJTxdDEDapiLxygCsshXpopz17pH6TgXXosjJXUVGg9mwkG3E0xogGBWdybW9gAu3
         IFDSq389wyK2t5X1Sc4CKL75OUwNLajWNKiSuYuS5w8aIa2olsYo2v2vVTgSY25213sJ
         06hw==
X-Forwarded-Encrypted: i=1; AHgh+RrfGSYZHgMKIC+cGorJI96RVDUebb+gD0h0QywQt1u1QqIovum4FP7aj9+FNT2X/pQrmfuHaYZ7aVUhaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIb0tD6bOETdkfDEoPpx8llO+RRItfEzvQsmie1od8mz+lXVaD
	2Cu3TUHPxJk6pkn1E8iKJn4dVMes6kOqURy8ofLY+0KQ2BOrt2cUBE8H
X-Gm-Gg: AfdE7ckXlMOYxAkrmeLjVsGQv+mys3v4K8GBw0x66z+y7UFJZIHMT+LFScxRvgLwjzS
	xiuNvSR35YVHHdAhu1R9N+ECmRjC9gIQMaJ9LzaLJ/SXwF+GWTQcZQTv2M6jGkPe4UFOzWEItvf
	zvFjrksbxlclgy0N0TU66ZrjHE4GQaOKbtpVOtoPphz03sjfAytTd/TX9AUoxLtdXW8nupT2LJw
	aoMbatjeLGUftpkzkE9ldnJnmA7leblhqTMt7KR7UW88SWbjpk1V8q7/eduCS0zj1K0lYo4tMbQ
	qcIWTyVunjIgX4MpBYx7ECS8ifamvpHSIKNQeNh3Cp4jqkI2xk8+ScechMgdLBuZaCPrbs2W1iS
	fXdYdnA0ZsBLcIRgMlb59abJ3vbHLM4WQ+G4AKGEuhjobPN+MANHN7ofi6a12EojzDapc8zwm0u
	KzJhczZmgIn2i2FezbpgNKlJFo
X-Received: by 2002:a05:6000:706:b0:46f:558:a43f with SMTP id ffacd0b85a97d-46f0558a904mr17320972f8f.4.1782717637738;
        Mon, 29 Jun 2026 00:20:37 -0700 (PDT)
Received: from foxbook (bgu190.neoplus.adsl.tpnet.pl. [83.28.84.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm49368953f8f.9.2026.06.29.00.20.36
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 29 Jun 2026 00:20:37 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:20:33 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: sanan.hasanou@gmail.com, vbabka@suse.cz, akpm@linux-foundation.org,
 cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev,
 harry.yoo@oracle.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 syzkaller@googlegroups.com, contact@pgazz.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Dinghao Liu
 <dinghao.liu@zju.edu.cn>
Subject: Re: WARNING in usb_free_urb
Message-ID: <20260629092033.4a83e91b.michal.pecio@gmail.com>
In-Reply-To: <85cf5045-b52b-4aaa-a038-ca1b856b55f9@kernel.org>
References: <6a3eeead.7fb353d3.354599.b0b0@mx.google.com>
	<85cf5045-b52b-4aaa-a038-ca1b856b55f9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65849-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vbabka@kernel.org,m:sanan.hasanou@gmail.com,m:vbabka@suse.cz,m:akpm@linux-foundation.org,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:harry.yoo@oracle.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:syzkaller@googlegroups.com,m:contact@pgazz.com,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:dinghao.liu@zju.edu.cn,m:sananhasanou@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michalpecio@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,suse.cz,linux-foundation.org,gentwo.org,google.com,linux.dev,oracle.com,kvack.org,vger.kernel.org,googlegroups.com,pgazz.com,linuxfoundation.org,kernel.org,zju.edu.cn];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C73C06D6FB8

On Mon, 29 Jun 2026 08:27:48 +0200, Vlastimil Babka (SUSE) wrote:
> On 6/26/26 23:27, sanan.hasanou@gmail.com wrote:
> > Good day, dear maintainers,
> > 
> > We found a bug using a modified version of syzkaller.  
> 
> Subject says "usb_free_urb" but you only CC'd slab maintainers, where slab
> slab is most likely a victim here of e.g. double kfree() or a kfree() of
> otherwise broken pointer.
> 
> Ccing USB and EM28XX maintainers. But they can feel free to ignore this per
> the next point.
> 
> > Kernel Branch: 7.0-rc1  
> 
> Why use such a version for fuzzing? rc1 will have many bugs that are
> already fixed in 7.0 final. And it's not even latest, 7.1 was
> released 2 weeks ago too.

To be fair, em28xx had no changes since 2024 until 7.1-rc1, so the bug
must be present in various stable releases and likely in mainline too.

> > WARNING: mm/slub.c:6352 at free_large_kmalloc+0xb3/0x160 mm/slub.c:6352, CPU#1: kworker/1:4/12317  
> 
> A kfree() was attempted on a pointer that's neither from a slab page nor a
> large kmalloc page. Might be double free or corrupted.
> 
> > Call Trace:
> >  <TASK>
> >  kfree+0xae/0x630 mm/slub.c:6437
> >  urb_destroy drivers/usb/core/urb.c:25 [inline]  
> 
> static void urb_destroy(struct kref *kref)
> {
>         struct urb *urb = to_urb(kref);
> 
>         if (urb->transfer_flags & URB_FREE_BUFFER)
>                 kfree(urb->transfer_buffer);  <--- this one
> 
>         kfree(urb);
> }
> 
> >  kref_put include/linux/kref.h:65 [inline]
> >  usb_free_urb+0xd1/0x120 drivers/usb/core/urb.c:96  
> 
> USB layer itself is likely also not the root cause.
> 
> >  em28xx_uninit_usb_xfer+0x165/0x310 drivers/media/usb/em28xx/em28xx-core.c:833
> >  em28xx_alloc_urbs+0xf2a/0x1130 drivers/media/usb/em28xx/em28xx-core.c:-1
> >  em28xx_dvb_init+0x2b0/0x4a20 drivers/media/usb/em28xx/em28xx-dvb.c:-1
> >  em28xx_init_extension+0x121/0x1d0 drivers/media/usb/em28xx/em28xx-core.c:1117  
> 
> So it might be this driver doing something wrong?

Yes, it is. 

        /* allocate urbs and transfer buffers */
        for (i = 0; i < usb_bufs->num_bufs; i++) {
                urb = usb_alloc_urb(usb_bufs->num_packets, GFP_KERNEL);
                if (!urb) {
                        em28xx_uninit_usb_xfer(dev, mode);
                        return -ENOMEM;
                }
                usb_bufs->urb[i] = urb;

                usb_bufs->buf[i] = kzalloc(sb_size, GFP_KERNEL);
                if (!usb_bufs->buf[i]) {
                        for (i--; i >= 0; i--)
                                kfree(usb_bufs->buf[i]);

                        em28xx_uninit_usb_xfer(dev, mode);
                        return -ENOMEM;
                }

                urb->transfer_flags = URB_FREE_BUFFER;

If buf[i] allocation fails, all previous buffers are freed and then all
previous URBs are destroyed. But they already have the URB_FREE_BUFFER
flag set, which causes a double free as shown above.

The free(buf[i]) loop should simply be removed. It was mistakenly added
by d571b592c6206, then a26efd1961a18 recognized the double free but
attempted to fix it only by changing the order of freeing. Sent from
.edu domain, so probably an automatic static analyzer fix...

Regards,
Michal

