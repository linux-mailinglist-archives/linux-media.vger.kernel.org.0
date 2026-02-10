Return-Path: <linux-media+bounces-52543-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLUOE8OPi2nYWAAAu9opvQ
	(envelope-from <linux-media+bounces-52543-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 21:06:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCF711EE55
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 21:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DA9A306A18E
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 20:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8C4331A5F;
	Tue, 10 Feb 2026 20:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MwTKNKhy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C767F330B31
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 20:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770753944; cv=pass; b=NKrZvB12BuF2ABeidTIIuewivej0Rurrcg3v9les43LpCxT7dwFTr89+eCH1GW/iai50NthClNqieC3TBaRsUGxi7jZC/qhFZ49Tgq08vH65YWLW+Yo8uEotfFNBrpW8oMl5Fo00DChny0GCzcETvkScAsUSv+c/Jafhq4J/8NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770753944; c=relaxed/simple;
	bh=FjgzgAFhvlP8wZ+0kqVUcsibosrCr2odjKDIt5RjDY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQQnfVvuRZ8TJzTs4iwylbmBb2P8ztTvmE9+XI6pR+2gJj/3OKTG3qBcgShWoCh6fwenTIRY7RVb3o24zU2LNwBc6aNKNMAZTQZoEfbsdf7K97Zoc+cbU+J6JwXg6rDvzv87NV6G3ipGcQaoTlQKZLZEVT/fiW+tqOfuZtlNrlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MwTKNKhy; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6581234d208so7781111a12.3
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 12:05:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770753941; cv=none;
        d=google.com; s=arc-20240605;
        b=VFt3aoELnoTYv/ETSyzBp1kuRHL9v4tPE+/m7NgFRpewjKJeRUW8m1Exnyh77LQ+Bp
         Qca0Yqc7EVYe6pdTnAXHMVeLGeiQF/SoXaRdIoU0s5Qfn07YhXimlySf7OL3fah+6PG3
         E3xb8MGJVmD4HQCi8TOSs2Ju/OVeasNeQQZ1ulVvzVll1NLsp1Aly1ime7Xh3/FWKhcd
         iFngoMNvHq5wlF3kGcxegTbi1I28R6PTQKhkYo9uibP6DrI+m0ZqDIZ2xRXilFv/PDYd
         Qy+D7/JQqXj8PczwZDjdf2IxgfQbU39jcJXHq2Vr329zxHM1VYdqH7EYqctGldo5okws
         O53g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EUYV2jK4EVNH8IU6ztF+fhRopz1DxZCdX+to/Ge4VzA=;
        fh=xiJ2yBK9Zww4uHLWG6hYWn3st0BMWmIy0MVYZ1cVkIA=;
        b=Rb2JSXMBpQxCykE+kV+k7kApJ92OfvjzvDExt/w/LtBZr0kQBOkis+p6um+TJkqn6F
         1+VqlNmeYhPDUbASZKkO4WvhDI6sWfpCHqWSkIJ6+aUUOeBKQGqOlAsbVuXqX+4/aWRJ
         UTVsYwNheQapInc/TFmGKwysC7bQ9ia4UcGnvDJDApzXwcNB0UZpT60iSbE4v+zH551i
         PDzaZ3Zi/3HX70HltThB/pBzDsHAdjn3QBSUuNzqdk743FCCrK5MB1zXHk64zz4q9vdc
         2gaPWSWxX6juKtTktEVzwyKqOR/kX3v6BfcT8gftZMlX4UNsI0cf82o/2RB+PJ9rIzx6
         kqHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770753941; x=1771358741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUYV2jK4EVNH8IU6ztF+fhRopz1DxZCdX+to/Ge4VzA=;
        b=MwTKNKhye2Vco7EwcFtCQE16W/2ZTpMXizxhRmDPEXk3Ter+FbAENjU/fqETbNwNi6
         QD6ks3sOmO0vIrogukgzKAKVKugq3ZeLlKLjCIJXsESnQFPsq/OWgo4od3A87u2GZX+C
         U1wQm3ztLR/m2s5yjXXtBMuoqcdfD4QTc2zc9p9q8/wGXcSvO2azYVmJdrQr2/ycNKiz
         7YxqAA7PlOCp+/cNYVnjRn7ZLfGd+sPA6RrDhhAjQJ6gdFtSjsQqO09JJusldJkLD9P6
         lX/smuLgvHGJxUxCu/CGIgFpCXfofyLCMNuejUf7YwFdNUwguB2HcGt75b4bkYy6axLh
         783w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770753941; x=1771358741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EUYV2jK4EVNH8IU6ztF+fhRopz1DxZCdX+to/Ge4VzA=;
        b=weL/3NFTmE5hrBKH0zEoCEj9jdCnu03s0E2iCJnm42dDtI0NQR14WZi45T4TsCI6E9
         KWjFTLtvU9LtcH76zTRXn9UHU64k6YxfULSn+TLKHJfG1gcp9ekoQEFwqjFBZ4uV/l/B
         u5cQtde1Uppdg0Y/qeALgamI6nLs11fqnJlxeCMPKiq/fqpZuefzVwR7D31JJrbPhivW
         bprBlbvcE2wWhTID/eM2Up45iGJqKvV4d/i1EqH0meEkv9lX2sctDO3A6yu8E3TLlHb9
         X9uxq5Si4yxipUjM+t2Bt7VZ1s+Bev/6fUVn8mzTv7PR2uSh5VmN7Fm7mMLmgHS2Xyo4
         1+5g==
X-Forwarded-Encrypted: i=1; AJvYcCVdBqnUafpUGkfRzGOoGsBTrscg8xw2F5+6hNbH3AZoNLFAFP2Xlie2QiBfRTdx7WcPyk5jtvJkVX/Kzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+H0i7bly34RwYxpcncXEeuoI+/ywi6RtrgVPOj3cGnsB0JfLx
	AvMfNnhXC9WURQBIz7GCddj8Um2xnz7G1FBZaCUFbPfJiaHo/b5Mmo9ly/WooG1JVESR9KrX15V
	0zbV4hKHlVD7e0V+GmxAUpnpKzZ6kOKgUbrcrLPNILEOyuezNSJl0f/c=
X-Gm-Gg: AZuq6aJmpvcIENz2h7KFnDEn6ArO1AjpNj5Bs0Aju6+XQJMK9zTVZ23cBgwem7lne1b
	p1aNoIoA3QktYI+7lhig2fGIChlA6jWsv7jPj4IAGIGmg+0HrIm+L/ycD4BxMuhqSBigN4I3Glw
	un/nlfjS17/BqPuUbW1qbqSC4wCXM8FWC6HcNN1ylPcErLfO5+iEDd7r93tfAIJkeVxorby7rt4
	c58TLIcqRPsRUcUPPMdSNxrMCLafirJhIFezTq7PcIGRMKofY5TLkrLRO3VryOS42svQTjf5V7f
	kroKyqM25g/3QMpmOLBlKqWWEfJ/7MqebwO/
X-Received: by 2002:a17:907:720d:b0:b88:48ba:cd7 with SMTP id
 a640c23a62f3a-b8f6a8e0786mr22320766b.3.1770753940692; Tue, 10 Feb 2026
 12:05:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209153809.250835-1-jiri@resnulli.us> <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <hwdezwktndbm6hoko3rz5lffgfljodegcygzf6rbdf2ferokj6@ftk2uk3rqfdq> <20260210124819.GC12887@unreal>
In-Reply-To: <20260210124819.GC12887@unreal>
From: John Stultz <jstultz@google.com>
Date: Tue, 10 Feb 2026 12:05:28 -0800
X-Gm-Features: AZwV_Qgy-DNinnCzC9ZTU6U_Twqy09ClMg2rE0gJxLuPqw6IHh5sTKTnvXMZwaA
Message-ID: <CANDhNCoaYoe5Ckin9CnZT2LdQJ2K7amBSUS9GBDzbx_1=U9txw@mail.gmail.com>
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap flags
To: Leon Romanovsky <leon@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	jgg@ziepe.ca, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jstultz@google.com,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,nvidia.com:email,resnulli.us:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52543-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[google.com:+]
X-Rspamd-Queue-Id: BBCF711EE55
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 4:48=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
> On Tue, Feb 10, 2026 at 10:05:14AM +0100, Jiri Pirko wrote:
> > Mon, Feb 09, 2026 at 09:08:03PM +0100, jstultz@google.com wrote:
> > >On Mon, Feb 9, 2026 at 7:38=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> w=
rote:
> > >>
> > >> From: Jiri Pirko <jiri@nvidia.com>
> > >>
> > >> Currently the flags, which are unused, are validated for all heaps.
> > >> Since the follow-up patch introduces a flag valid for only one of th=
e
> > >> heaps, allow to specify the valid flags per-heap.
> > >
> > >I'm not really in this space anymore, so take my feedback with a grain=
 of salt.
> > >
> > >While the heap allocate flags argument is unused, it was intended to
> > >be used for generic allocation flags that would apply to all or at
> > >least a wide majority of heaps.
> > >
> > >It was definitely not added to allow for per-heap or heap specific
> > >flags (as this patch tries to utilize it). That was the mess we had
> > >with ION driver that we were trying to avoid.
> > >
> > >The intent of dma-buf heaps is to try to abstract all the different
> > >device memory constraints so there only needs to be a [usage] ->
> > >[heap] mapping, and otherwise userland can be generalized so that it
> > >doesn't need to be re-written to work with different devices/memory
> > >types.  Adding heap-specific allocation flags prevents that
> > >generalization.
> > >
> > >So instead of adding heap specific flags, the general advice has been
> > >to add a separate heap name for the flag property.
> >
> > Right, my original idea was to add a separate heap. Then I spotted the
> > flags and seemed like a great fit. Was not aware or the history or
> > original intention. Would be probably good to document it for
> > future generations.
> >
> > So instead of flag, I will add heap named something
> > like "system_cc_decrypted" to implement this.
>
> It is problematic to expose a user=E2=80=91visible API that depends on a =
name.
> Such a design limits our ability to extend the functionality in the
> future, should new use cases arise.

Yes, how userland chooses a heap name is an open problem.

 The difficulty is that userland is the only thing that knows what
devices the buffer will be shared (and this knowledge may be
incomplete if userland passes a buffer between processes) with, so it
has to pick.  But the kernel doesn't give it a way to solve the
constraints of what memory types work with what devices. There have
been some proposals for device sysfs directories to have links to heap
types they support, but that also requires every driver to understand
every heap type. And then you get to the fact that performance is what
folks really want, not compatibility and that may require some system
specific knowledge to decide.

The working solution right now is to have the system provide a  [use]
-> [heap] mapping for a specific system.

I think of this as similar to the vfs and /etc/fstab. So /home/ might
be /dev/sdb1 on one device or dev/sda1 on another.  You need some
system specific configuration.

In Android, this mapping is done by Gralloc, so buffers are requested
for a use and then Gralloc decides which heap to allocated from.

Unfortunately there doesn't seem to be a similar standard convention
elsewhere.  And I'll admit even then the enumeration of uses/pipelines
in some general form is also difficult problem (and is somewhat more
bounded for Android).

thanks
-john

