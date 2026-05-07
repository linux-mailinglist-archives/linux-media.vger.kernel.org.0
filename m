Return-Path: <linux-media+bounces-60783-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD07ERF9/GnXQgAAu9opvQ
	(envelope-from <linux-media+bounces-60783-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:52:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E2C4E7C74
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5D9A300FC7E
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 11:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7356F3EDAA7;
	Thu,  7 May 2026 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kW2XKo/2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD86A3ED136
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154757; cv=pass; b=etQln78LekRV9x5tL87Xv3jNdaxefQFJ2Oscakh/EUxcVOQ0m8krcSGhp5Gn6n4DGOKYJw/3O5ZRg4a/6lxUnHbhjVpDIU34+8VP9lZx6sW8enj0nXzalmTFNF4TOi2S7EqEukktIHzfH/eU6XoODZWFnv8ZxfRsKOTcYmd1m4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154757; c=relaxed/simple;
	bh=h2fMYnCYIrNFnwnb1qtbtb1UtOtqen5sV4Rb7709pMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTtSPVxEeNhuIHe8W80fbiswEABaW2yxmE6Ky2dzEsZ3DtfGmb4b9Jb0R31ennCl+3fEhmMGZ/rvE92Dr9r8xNBy4vfGgW+1YnfCeAwjlx2Efs5jY5PZUelZE4Z4X6unoCrWSitD0QAOSvzYJZTusDlOTQ1Q88nq+GU97GWpR6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kW2XKo/2; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so84085e9.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 04:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778154752; cv=none;
        d=google.com; s=arc-20240605;
        b=bZqKkZzCHjFA5yBdlmlvUbB154w4mjd99auAwGIzArnfQ97KK3SCE4Tzsv2v/6BVmP
         LDsJMyuOYCHiiCHN6Qf5o1x6TcWvLcATRF/BcwuRM+rzzy6dXHWhNH/UvS8EgI7a/q6A
         9CKDzHI/nc9wxZoEhVDIWPHLPuzD+GCov/CDeszVKzIaLGV9ZcFzwLC3T2Kjfl0VZeu2
         glMgTCalz5SlZy0bSuQeELqbytwznpVeO2uldFpuS49OGUil3KOi4pvMOJVyO+oVER+J
         l7S8NgeIDZyQp1M60yy8aDZI3mDAS4+ibcxGaNvvu5C27g7uxN96/0XznuPVRXmOj/HT
         S9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h2fMYnCYIrNFnwnb1qtbtb1UtOtqen5sV4Rb7709pMQ=;
        fh=GriXeuc0rK9+BFqpQZPaJPF/3tM2TGZfs6uTkp0knv0=;
        b=Utr2R9tw0eL0WEeJFnRqFLpESjFKzvPv6ODCvPQNKRv/S/YsOqqCTAaZSxu43s1kDC
         jcOZ/hhN8kI9KB9LxBdPiE0suzcMlnYhI381XbqrVkl9AFZvelvbmzHBjhfQ9R4/pUzD
         whNEv1mrWbUP6HdvX3JsKxHNiG30erqJZTiRcWqxXqUgNUiNjfKgOsZ1he+LGG1NyHax
         Mxdf1S1Rgmz4Y7M+7PLGoCSL7evJPQJo1VQYnI7E98w/ESmwbjRFBLDmgjOfXdjPGaJg
         e7UeHhCu2toLoxAFTczybGqOQWD0WDOYh5HchW1PB/lYL/RcglDOmSoJJpEPy3joAB3c
         htLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778154752; x=1778759552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2fMYnCYIrNFnwnb1qtbtb1UtOtqen5sV4Rb7709pMQ=;
        b=kW2XKo/2q5pr1pzq7vS83d9qQljQOLF8yntYCFp1Av0/YCA1hD8LDGA9h/8gpBcHBE
         VhCZEWfgT+sfJpJDGN8N4tum+/o1ovX2W9UDO1mwdTx/S2bZrn6uoxln8PnBaFx2IbCc
         ZbPjfZz042MLORVc7pz5K5Aw6Cdm9gDlzOG+XzX8PWT/roW4XHyTLG0J6SjxTp/2liNl
         rwT8bNFjGx60Rm45/4LwsvBU+ffLArxXl6E3na05jmQ5OC5wkyji4ba5o2jVFcD8TjvX
         HhULalHl+3xl36yEJ1gC+OiXxBXU6qRmFqPGdL3YVrGJigdogH8FNdtNIOD+K7NornIU
         eYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778154752; x=1778759552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h2fMYnCYIrNFnwnb1qtbtb1UtOtqen5sV4Rb7709pMQ=;
        b=Y3rIHaj8BzlES+ZF2T19UGd+uBcRINp82TZ0Hevq3+560R3IwxX6xp0K9xPYhpxfaw
         CVwmqqepH4ke0FAHE6oDdfoFeaau4zP0xfwJTX0Oq37sJn1B5VdP/4RTXpHdG/NYbla6
         HtCdnqNIKeRKVa1//+nFSpIMEPKX95079VouPlevN4T1RAobZ+0LC91B/iTqy8gTATgU
         +6ulw/jTuE6lSGN7GSoZVhKPA+TxHmg3DWeusn2u80GAOBm+IQ9j+dPVTqwtgJzF5O7w
         /EEmI5kZd2ZHXuzaAm5+QFIP7rHTIPRgBq/C08CnyYSCgf0jWWiVef9U3EJbqHfwMNZN
         M8dg==
X-Forwarded-Encrypted: i=1; AFNElJ/Bf9bT1Xn2dJA6sVYY4VBNyTZyJmT2eowOCcllwaTvPQ1uJ1GSFHYSBHPNGCe1GajKd6mmjf4EikdBjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuOWsh2v0PxOi2939Kdn268NkwLZY+Zh+8YnFO920sRU/6/PrZ
	hyPf8z/WvByZJ8uwZzCACiBxR2HCx+brrgiSlsL7aZUfaU+J2trwNsXVjNg+aEyhvj4Op7z5WP7
	6lz1duBzLk338uLFcXg9+1R9CljG2U3Btk5AnS2RA
X-Gm-Gg: AeBDietHdHT2l7odcblF/BK0g0+Jjes9x7UjOsZ76KMJZAEV6Gj2Vb9Ys2q4Cqg3sry
	pT2QlxiWIh+NsClzi2/zwsWsDBeTsCBHdHZmneqyfdCxJ+WZfYGqnQztNlAzdZtcZONWbxj9RtB
	JPa6MKPVfa3HQ0JPRWkqs+QSgFSxBrIEXLrRCiEcEatnf//dgkoG0shZxX2tCeh9hWaB1XbSp2b
	ChomV+yd0aoPg+6OhAeFDcn8S13Aah7MfndZtnLg1/yH/md91f+ydWnWiQ9YyYXqyVVryb0sT+j
	MhhCiDl0+0HzxBPyYDopx+G7Iq/HMt/HuWMOXmDJVeZckQugnI6I5SkL8+R/
X-Received: by 2002:a05:600d:6450:10b0:48a:55dc:9c1e with SMTP id
 5b1f17b1804b1-48e5d45d30dmr663245e9.10.1778154751362; Thu, 07 May 2026
 04:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHijbEXhuVRgkkPA2dAC=njGBU7vpAbxAbsSmxvvPznO-ckVRA@mail.gmail.com>
 <cf945dda-f526-4544-bc43-22f70acb28f5@amd.com> <CAHijbEXQfm4QDDfo1yiVBV9mVvogGqt_BAu2ipnhqa-EDOKteg@mail.gmail.com>
 <CABdmKX1pDc7wpLVQzM0ihH6AfW+=KWdyaZuorMqWCbC80Y7-Bw@mail.gmail.com> <b9c1b7a3-12a8-4104-b98f-a1e57b343046@amd.com>
In-Reply-To: <b9c1b7a3-12a8-4104-b98f-a1e57b343046@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 7 May 2026 04:52:19 -0700
X-Gm-Features: AVHnY4LrtQD1vp6VlN2Vm6s4bEP0BXc-IojZFRNiMBPSNFKjm4nQmQFAY7f1gs8
Message-ID: <CABdmKX0KQqD=QtongicEBL5y-3xMvf94YC3wqH_FynLVTJaAew@mail.gmail.com>
Subject: Re: Regression due to /sys/kernel/dmabuf/buffers removal
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Julian Orth <ju.orth@gmail.com>, corbet@lwn.net, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 98E2C4E7C74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lwn.net,lists.freedesktop.org,lists.linaro.org,vger.kernel.org,linaro.org];
	TAGGED_FROM(0.00)[bounces-60783-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,android.com:url]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 4:35=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 5/5/26 16:32, T.J. Mercier wrote:
> > On Tue, May 5, 2026 at 6:00=E2=80=AFAM Julian Orth <ju.orth@gmail.com> =
wrote:
> >>
> >> On Tue, May 5, 2026 at 2:41=E2=80=AFPM Christian K=C3=B6nig <christian=
.koenig@amd.com> wrote:
> >>>
> >>> Hi Julian,
> >>>
> >>> On 5/5/26 14:25, Julian Orth wrote:
> >>>> In ab4c3dcf9a71582503b4fb25aeab884c696cab25 ("dma-buf: Remove DMA-BU=
F
> >>>> sysfs stats") the /sys/kernel/dmabuf/buffer directory was removed.
> >>>>
> >>>> I've been using this interface, specifically the exporter_name file,
> >>>> to detect dmabufs created via udmabuf. Such dmabufs show "udmabuf" i=
n
> >>>> exporter_name. I've been doing this for two reasons: 1) to detect th=
at
> >>>> mmap on such buffers will be fast and 2) to detect that GPU access t=
o
> >>>> such buffers will be slow.
> >>>
> >>> Crap, I really hoped that Android was the only user of that sysfs int=
erface since that approach turned out to be quite broken.
> >>>
> >>> It's number one rule on Linux that we don't break userspace. So I hop=
e that you don't insist on bringing that interface back, but if you do I wi=
ll just revert the removal until we found a better solution.
> >>
> >> Bringing it back shouldn't be necessary.
> >>
> >>>
> >>>> With the removal of that file, that detection mechanism no longer wo=
rks.
> >>>>
> >>>> I'm not particularly fond of that mechanism but it was the only one
> >>>> providing that functionality that I could find at the time. If there
> >>>> is another one, ideally an ioctl on the dmabuf, please let me know.
> >>>
> >>> The virtual fdinfo file you can find under /proc/$pid/fdinfo/$fd also=
 contains the exporter name for the DMA-buf.
> >>>
> >>> You can find the full documentation here: https://docs.kernel.org/fil=
esystems/proc.html#dma-buffer-files
> >>>
> >>> Is that sufficient?
> >>
> >> I think that is sufficient. I probably didn't use fdinfo initially
> >> because 1) it's a lot more work to parse and 2) I wasn't sure if it
> >> was intended to be machine-readable or if there could sometimes be
> >> newlines in the values and such.
> >>
> >>>
> >>> Additional to that the debugfs for DMA-buf also contains that informa=
tion and I'm open to the suggestion with the IOCTL.
> >>
> >> My application runs as a regular user so it cannot access /sys/kernel/=
debug.
> >>
> >> Having an IOCTL would be ideal if it is not too much work. I'll fall
> >> back to fdinfo for now.
> >>
> >> Thanks, Julian
> >
> > Phew, I'm glad fdinfo suits your needs.
>
> Yeah, exactly my thinking as well :)
>
> A college questioned me this week how to find DMA-buf stats for debugging=
 and it turned out that Google points to the outdated DMA-buf sysfs documen=
tation instead of the debugfs one.
>
> No idea why, maybe we need to improve the documentation here a bit.

Ah, this? https://source.android.com/docs/core/graphics/implement-dma-buf-g=
pu-mem

I will update it to mark it as deprecated, and only applicable to
kernels < 6.18 where CONFIG_DMABUF_SYSFS_STATS was first disabled.

source.android.com updates are usually released with the platform,
which is very soon for Android 17.

> > Adding an ioctl would introduce new UAPI so I think we'd want to avoid
> > that unless absolutely necessary.
>
> CRIU has some similar requirements, e.g. they need to know the exporting =
driver of a DMA-buf.
>
> Not sure if the fdinfo file will be sufficient for that case or not. But =
yeah I agree that we only need this if actually necessary.
>
> Regards,
> Christian.
>
> >
> > Thanks,
> > T.J.
> >
> >>>
> >>> Regards,
> >>> Christian.
> >>>
> >>>>
> >>>> Shipping an entire BPF compiler in my application, which the origina=
l
> >>>> patch suggests as the replacement, is not an option when the removed
> >>>> alternative was simply reading a file.
> >>>>
> >>>> Thanks, Julian
> >>>
>

