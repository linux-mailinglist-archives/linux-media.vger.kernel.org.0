Return-Path: <linux-media+bounces-62247-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NzdAOSjDWq10QUAu9opvQ
	(envelope-from <linux-media+bounces-62247-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:07:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2BB58D473
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2123030F21DA
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB913D75B9;
	Wed, 20 May 2026 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLLFzq1N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114133CBE78
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 11:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277575; cv=pass; b=SHLqGyyZ2FGJ+ht7gjHh+52/Wy5Xfdo4s0bWaVsKn7Rv30NDyYmVQMQCYYUlCZuhUpbIPS0OFbUwHDBDmsgWRVSaOCENQ+3WMBNvehDiRHIAcaUDoJNhufbNyHCtGRZTSKSDDJ+jjyGMuhihbx0bk9X8MatwaRgxCVK3mdXSMyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277575; c=relaxed/simple;
	bh=mwQC2VpgPcAOO/eSiXMuOlKGLERJ6tVL0QZy3DdZeqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c74um4Ilhvf0C7fWLbaHy5T4EXdu0Jcbxw+z4cVYvg+hthc8//aG7hYO2sGj6nO6kcwvbWOjlixkeZ+QAK6rg5OWQrermcfkCx/UVdtjV97TX2QkUDjVc6r055ZTj7lmM7Nf9Zu1vHS17B7PW8aAJ7W8dVEg7AjLmrjtd2JAUkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLLFzq1N; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-65c2cd216c9so4006203d50.3
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 04:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779277573; cv=none;
        d=google.com; s=arc-20240605;
        b=A+7Cvt+m1rEnBle6dYA4LyLTvUy2Fpvag7fZoEvMwDGevNyn+4UOFqqUHLdAUe56/7
         1+4LpFkVOwaGgzF62ZDmqS7RxwuokZs5aG91BbZEpdFZQPWuzN0DPRKg7Mhj2g/nzz7d
         J90l0RhdmQqlq1sO6Ax/d7IRtLmFL9HnceM3gmvQZ5AfIRdDOkBttFv8sJLDqYHLmIMI
         Ubjushw0HCrTvY+tPrjmG3SjThpKsUVsgvk8oQ2lusxLDA7ECMRVrjgtSXffdwlE31Uc
         s+oY3KCcZlfUEaZV8JFPxUlB2FHtkWwzARaA8HcYr1x21iSUsq9T7cxqzUreQEi5KaPN
         M5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mwQC2VpgPcAOO/eSiXMuOlKGLERJ6tVL0QZy3DdZeqg=;
        fh=V3BDrcCqDQUwZQZvueeKPf7VDpkBY+Poaz43X34PJWA=;
        b=ElJSpoWBAx7Xau+T+MzCSHaGnrRgKvNUBN7eQPZHvxofBAs7lD8CuyN5EfuVMOfRSt
         o7dW+PJx3+Dfa1tQldBttpfcfPw01XRM0XThfqQrSVoQfr4jAdhQoY1Vg/sllkIcRQlC
         p7ETmaALxCgwwOo9C5Am/RWnqNpTmL6YDKaRx9M4ZnVL2Ssd0/SQ3xv5vHS/9U3plk8U
         qlpDtvvvSjzpZ5i284vMREYsgXIwZbmrQ5vKjQDShfPC5k13c2Yup+Bhgw0/wdRcxHIO
         ESdXMtjWF3/ppj10A21Kglurz37YVYPaTPQkb0CSiZ8Aevbb3p1T5ibgZ5ZJZLathBVi
         MGBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779277573; x=1779882373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwQC2VpgPcAOO/eSiXMuOlKGLERJ6tVL0QZy3DdZeqg=;
        b=DLLFzq1NI/jlE0KjxAF+xBgYr0bijFFLMLnQXRF9R+yg2s3RjBXBZQNjb/M41Ql3EQ
         +ZheyYRDDN9kkHa9dnnqjzyXzQj/lZippxiK1tSuOwMhmI2qy9lMle+0b22N0RKRFbu7
         lv+r5D+s6/LoQMztNtN2U69qRAjas2hZcCwd7hgqtUfMh+fIafWtQKACTWfQrn6UHGdy
         Ru4qqJpuDWEMTgAfRByrjP2/ckcxnn3QmrX/lMngpYgC4lgHEVJ2w3xGDq20PHZNs8O5
         g/JaTcX5f093Iga9G9Go7DUID3PH1u3ZyXMSGCnglb1l46M+eAwY/p9mJXVmhrxjRmv/
         U52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779277573; x=1779882373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mwQC2VpgPcAOO/eSiXMuOlKGLERJ6tVL0QZy3DdZeqg=;
        b=JYFp51nS7CnbwOGV0SSIe3IkIchxPkr9+EzX3zUi/YYwtzqhgGiGVE3Z5Ik3Oc+x4A
         blGNpboXEcMtKsc3Bz0qlCHKDRYbyWp7ozgE4SkBebYLXOBs5H7FLl7WLPK4AuMzUOx0
         mx+q+YhO1GWTDsy4BKhbSAHFc+HLp6FU8TdDp9YY1c4EQTqNMLrNoOl/EJuheOVArX7B
         vuoHZWsJZaEQbA7FF7Ekj6P3N16ggwFr1WG7xdmFeoAFzu+joMZZKd2emGGdRivTO46F
         c9jtlBDZiwLigHgC8AVG0BevzUCz9uYx4RQ9h56v9gWizIS28zaWiyMLrHhUXGVnzYZ3
         x05Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Ed1dSAgHpR9LZtMpDBbgqyWfn7UQ+/bYcg/kA2ENZd8ET90cxZulQ793bLrApimgVbBv2LiRkH1ql0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2D7vyfBvHy0kdNTOuBz9F1H4Ou7qSFXJqQEPJ+GXb+1VRpluY
	yMmj3VOK0ilF/hnfdvM20qnsS/QxtXoSRDfLbkDhvSmprUU0Jff1RCDomOQj1MQHyfmUtvnNIAz
	a5jpWFAeQQ3sNNuGv/at1y5cjh+Xu87Q=
X-Gm-Gg: Acq92OFSoMbgWNRGo8IVER3gfZXiJ+tSeOyMZU7qZZOC7nfgEWA9YagTZys/s48gSL6
	hWG4gDUPppLxnhqhAUYngFqqxSD1dwaW/uSMBGmt/nWj8Be784CZvVG9Z7iudDk0SlI6zxjdkk2
	74teBDx4Jum3g0IjA9BZDo0cktBLD+VQplDXh53aAEByz5Qb8AaXRKhisUWzKOTZndGUphW0bjV
	vikg9PguxL+y5sYrV5ebfpS8W1teWVRO/wCO/9AFTX79lTjOFdavE5dujldXJ3WbULlsPbZSMPH
	2D8DK2OnIkaJZ1yxPX0Iw7vR1mSh7JRrcGy3uoV9VVFJRJ4c
X-Received: by 2002:a05:690e:1487:b0:65e:4b06:f89b with SMTP id
 956f58d0204a3-65e4b06fd2cmr14416343d50.51.1779277572905; Wed, 20 May 2026
 04:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com> <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
 <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com> <CAHijbEWqc2+kSkk3i_LxB2PQ6XwUetw1UkdUdXJfdv3zgKd1kA@mail.gmail.com>
 <38551bfe-75e1-4978-b57d-adc43cebc85e@amd.com> <CAHijbEWHp960qvZFoK7+9ppHAqkAR7=UQhtMUccqWzGd_pFPQA@mail.gmail.com>
 <5ee6d5af-ac48-41d7-a19f-e08a3c5b7d19@amd.com> <CAFZQkGwmeipZnvmBkcE7KhvUSMkSE=fzLBZtiMyhv3mM04Vudg@mail.gmail.com>
 <dff60378-4e47-4753-8878-feec6e1c2690@amd.com> <385a4d4f-fe22-41a7-8d4b-4dc6bc9930d3@mailbox.org>
 <1e94106a-f72e-447e-9885-2d2cc8f8e722@amd.com>
In-Reply-To: <1e94106a-f72e-447e-9885-2d2cc8f8e722@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Wed, 20 May 2026 13:46:00 +0200
X-Gm-Features: AVHnY4JZYLaQrAuUqg_r9R4xrt_7B8lof_FLZgmpinm1lpd54PV11HWLkp9qJk4
Message-ID: <CAHijbEWSnwm5_uTAbRDYOkMFwu+X3_xGHxjHyK-XeaO15KTGOQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
	Xaver Hugl <xaver.hugl@kde.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62247-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,kde.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 7B2BB58D473
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 1:21=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/20/26 10:13, Michel D=C3=A4nzer wrote:
> > On 5/19/26 18:00, Christian K=C3=B6nig wrote:
> >> On 5/19/26 17:31, Xaver Hugl wrote:
> >>> Am Di., 19. Mai 2026 um 15:29 Uhr schrieb Christian K=C3=B6nig
> >>> <christian.koenig@amd.com>:
> >>>>> 1. This series makes the ability to manipulate syncobjs available
> >>>>> independently of attached hardware.
> >>>>> 2. It makes it available under a consistent path /dev/syncobj.
> >>>>
> >>>> Exactly that is a big no-go. This has to be under /dev/dri.
> >>> FWIW udmabuf is also under /dev directly, but I don't think any
> >>> compositor developer would complain about a different path.
> >>> What are the rules for that? Could this simply be put in /dev/dri/syn=
cobj?
> >>
> >> The syncobj are actually the DRM specific way of doing things. The gen=
eral kernel wide way is to use sync files (see drivers/dma-buf/sync_file.c)=
.
> >>
> >> But there has already been tons of problems with those sync files. E.g=
. they doesn't support your use case at all since they don't have wait befo=
re submit behavior.
> >>
> >> So there are already ways to do this, but the Linux kernel so far told=
 everybody that this is forbidden. The DRM syncobj wait before signal funct=
ionality is much better, but then basically the second try to do this.
> >
> > I'm not quite sure what you're getting at here, just to be clear though=
:
> >
> > While the syncobj Wayland protocol extension supports wait-before-submi=
t behaviour at the Wayland protocol level, it doesn't need or cause wait-be=
fore-submit behaviour for DMA fences in the kernel. The usual rules apply t=
o fences attached to syncobj timeline points. The wait-before-submit behavi=
our at the Wayland protocol level comes from allowing submit before a fence=
 is attached to the acquire timeline point.
>
> Yeah I know. I'm one of the people who came up with the idea of doing wai=
t before signal this way in the drm_syncobj.
>
> What I wanted to say is that a lot of people used the dma_fence to implem=
ent wait before signal before and got a bloody nose from that.
>
> > (It took me a while to realize this distinction, before which I mistake=
nly thought the kernel's DMA fence rules would prohibit wait-before-submit =
behaviour at the Wayland protocol level as well)
>
> This is what surprised me.
>
> The drm_syncobj implementation solved the wait before signal for the kern=
el, but my last feedback was that we basically just moved the issue to user=
space and Wayland compositors would have quite some overhead to implement i=
t correctly.
>
> That compositors now use eventfd to simplify that was news to me but make=
s totally sense in hindsight.
>
> But anyway, we need to somehow simplify the drm_syncobj -> eventfd usage =
in the compositor.

That is not the only usage in the compositor. Compositors use all of
the following operations on syncobjs:

- creating syncobjs
- waiting for points synchronously
- signaling points without a sync file
- querying points
- transferring sync files between points
- exporting sync files
- importing sync files

Which you can see by looking at the userspace code linked in the cover
letter. Bypassing the handle in one ioctl would gain compositors
nothing since they would still have to convert to handles and manage
their lifetime for all other ioctls.

> That requirement is perfectly justified and avoiding importing the drm_sy=
ncobj fd into any DRM driver should actually be really easy to implement.

That is what this series does.

>
> Regards,
> Christian.

