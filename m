Return-Path: <linux-media+bounces-56346-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOJxI5cVvGnbrwIAu9opvQ
	(envelope-from <linux-media+bounces-56346-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 16:26:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE422CDB33
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 16:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8AB7D3045065
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB02E384229;
	Thu, 19 Mar 2026 15:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="V5RpUSRM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652EAE54B
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 15:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933400; cv=none; b=kyfVD0iq7l8aUSqOZ1ayhBQZOMbWX0P6OPDnl1YmCfTsfEzTCMXycxKLMS/w2uGeX3Pp3YQKnLx0ancPXtwfu5Azy52wkNWeiGIgK1k5PXzwPw+T0uIl/HzmSD66EDXfVgsVYnKN+xypXezIieknObbTOz+CcEONfwo4NP1v7uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933400; c=relaxed/simple;
	bh=w2jQTThKw1uTdLfhLRHlUZdTdDhLT36uUBu7iIxlFvk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RR2gc0jqJaLhm7eA0iNkugUxMq9faS/rzys0q6jHUq3i/9IlKoQDXpXHbtqkpy4njsxrj8jf0KH+TXeQz/3THiPUdWJIYuGExg29gLj/Hk+wHpJIIMRIOW1G1rPTB3xS4d80j08H5/LHpCnOSbNmTxVgHo54nMo1ppURlw0657U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=V5RpUSRM; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-89a14be4733so13787846d6.2
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 08:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773933397; x=1774538197; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w2jQTThKw1uTdLfhLRHlUZdTdDhLT36uUBu7iIxlFvk=;
        b=V5RpUSRMu1NbZGksb6hWQTz1r0M3BF0m1knh8tII1JpjJaqD2n+Ib8yeT6DE/W2ixO
         ybEjhNwlrJR1ohuF7Z5k61fS7Zpatq3aaJrRLOrsgUfLHCxpFFR4nQeW0EMFSGuqIp12
         CTS+OEK2wlvlT05hHde6oqegG5oGh7jyrVl1KnTHUe7x1+buAibSe99jJmwRLDKggvMy
         pF1tlwwfocV0pNWtU/GhVgWJz7HJcEu9Sg6jCZwVbycW0jZUgQ4y6iropbsU2xoVfCJ4
         H71PogUiTbC1f1jJ7QyjtqKmzpeUjGLaNYFAaO+0INdmmCEHW0/mwXY5KJAWA63khUh6
         930Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773933397; x=1774538197;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2jQTThKw1uTdLfhLRHlUZdTdDhLT36uUBu7iIxlFvk=;
        b=lumQhubIoDS4cILsJoOTzZOC//IhljyLgOQkdZJyl3TE6tNdjb5rCYzH5T+FO34Mgg
         AOH4R1XFoarichF1WfFwdmBBIWzY/cKWKNF/Ig5qOvfh+Kaq2l+tMEvXwk2h1UC8OAr6
         1VkDDLSsdguLOsNoJJVHijaL62FXWbFffmolBzR+5K+GcB2YGpoMxmOGxKm6sWZOEKUf
         p2VtNPhPMn/jC6xzP5fSXlWpaH6jIllxz98fj/dZwMIhS5Gb9obgiOcsSLiKGjBzpBQK
         FVee9QlGuhJfD5bXXw5mXT0of7Wrn8Gx0ONWipS2G1fZE0NZ604wZWKBpLfDrcTs7BnA
         IkZA==
X-Gm-Message-State: AOJu0YygeuzMOj06j6M3XrzEXZ5fKkqR+urHM8IkaxbIB1M/iQRM1+q5
	9bJEy125ew3payCX9+CS1HRMC2b1rD76jggUS2j2NFuoXttq/+fg8MNnNUketpqxoOM=
X-Gm-Gg: ATEYQzxAcfI96RAiXQwkRDz1q1SEbowr5lHjxjFbUK0Dv0EUdT00gzxQnfojNuAhke7
	tH6gxmNguODjkt2HEvXfbYGiKnP9h072hyGvx1s7EvOQ2CyHCFERp5SLxfih1dpmskg36WW49yD
	NjYgr5tbJoBvV56ww6JuKy6p0NEYfAGKxqnzvdzwM/szkguXGhPhPIO8RCzBzhxoeoE3fNAswgG
	Hdmiv8aTyItxi1oJyJkoiomyptuOsV0kiKvAocGLu0hLjA9btdxnvIoIsush0pbKAyDD4NOqvDv
	ftc9YRl8KU3TsOpZAG9DZoxfb5SwGI/oa9C9PN3unJxV0NRHk+axJGoULDEO+We0S7zJr4Xpfh0
	zbLr6s9ymDts6C7D5xuS2cmF2sKY9jlnKPC/iAe0MJ7ekO/4BXe+mSvmVOyuP7t0QrwLR7s6d4u
	0szsk+mM2z5GSxxZdF/EN0Uca6XqGx
X-Received: by 2002:a0c:f104:0:b0:899:ed40:464d with SMTP id 6a1803df08f44-89c6b590f5fmr104083706d6.29.1773933396898;
        Thu, 19 Mar 2026 08:16:36 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c6b90d2b4sm63135116d6.19.2026.03.19.08.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:16:35 -0700 (PDT)
Message-ID: <a95628d3b3d573f1d91a927eb6279c143c2a2c14.camel@ndufresne.ca>
Subject: Re: Linux 7.0-rc4: v4l2src0:src: page allocation failure -
 increased memory usage in 7.0?
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
	 <marmarek@invisiblethingslab.com>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mm@kvack.org
Date: Thu, 19 Mar 2026 11:16:34 -0400
In-Reply-To: <abtAylIlW3I8s1T-@mail-itl>
References: <abtAylIlW3I8s1T-@mail-itl>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-HFUCsXEeUhtZsg9l+P4Y"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56346-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ndufresne.ca:mid,ndufresne-ca.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 7FE422CDB33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-HFUCsXEeUhtZsg9l+P4Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 19 mars 2026 =C3=A0 01:18 +0100, Marek Marczykowski-G=C3=B3recki a=
 =C3=A9crit=C2=A0:
> Hello,
>=20
> When testing 7.0-rc4 (and also got it with 7.0-rc1), I got page
> allocation failure in uvcvideo when using v4l2 camera in a VM. The setup
> is rather memory constrained - it's a HVM with just 300MB of memory
> running on Xen, with PCI passthrough of USB controllers (to which an USB
> camera is connected). But the very same setup works just fine with older
> kernel (last known good is 6.19.5, built with the same config).
>=20
> I'm not exactly sure if uvcvideo is really to blame here, or is it just
> a victim of something else using more memory. Any advice how to check
> for that?

I've seen the same backtrace this morning but on 6.19.7-200.fc43.x86_64 and
through Pipewire instead of GStreamer. I think that rules out the userspace=
. To
me it seems quite likely a UVC regression that got backported).

Nicolas

>=20
> The specific error is:
>=20
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.040844] systemd-journald[251]: Under memor=
y pressure, flushing
> caches.
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193589] v4l2src0:src: page allocation fail=
ure: order:5,
> mode:0xcc4(GFP_KERNEL|GFP_DMA32), nodemask=3D(null),cpuset=3D/,mems_allow=
ed=3D0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193645] CPU: 0 UID: 1000 PID: 1305 Comm: v=
4l2src0:src Not tainted
> 7.0.0-0.rc4.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)=20
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193648] Hardware name: Xen HVM domU, BIOS =
4.19.4 03/17/2026
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193649] Call Trace:
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193652]=C2=A0 <TASK>
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193656]=C2=A0 dump_stack_lvl+0x5d/0x80
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193661]=C2=A0 warn_alloc+0x162/0x190
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193665]=C2=A0 ? __alloc_pages_direct_compa=
ct+0x1bc/0x220
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193669]=C2=A0 __alloc_pages_slowpath.const=
prop.0+0x4ea/0xb30
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193672]=C2=A0 ? kernfs_activate+0x4c/0x60
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193676]=C2=A0 __alloc_frozen_pages_noprof+=
0x2ff/0x340
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193679]=C2=A0 __alloc_pages_noprof+0xe/0x2=
0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193682]=C2=A0 __dma_direct_alloc_pages.isr=
a.0+0x183/0x310
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193688]=C2=A0 dma_direct_alloc_pages+0x3f/=
0x190
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193693]=C2=A0 dma_alloc_noncontiguous+0xdd=
/0x290
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193698]=C2=A0 ? usb_create_ep_devs+0xab/0x=
100
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193701]=C2=A0 usb_alloc_noncoherent+0x45/0=
xa0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193709]=C2=A0 uvc_alloc_urb_buffers.part.0=
+0x93/0x130 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193722]=C2=A0 uvc_video_start_transfer+0x1=
9d/0x4e0 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193735]=C2=A0 uvc_video_start_streaming+0x=
ab/0x100 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193744]=C2=A0 uvc_start_streaming_video+0x=
ec/0x110 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193752]=C2=A0 vb2_start_streaming+0x63/0x1=
30 [videobuf2_common]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193761]=C2=A0 vb2_core_streamon+0x98/0xf0 =
[videobuf2_common]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193767]=C2=A0 ? vb2_ioctl_streamon+0x15/0x=
60 [videobuf2_v4l2]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193773]=C2=A0 __video_do_ioctl+0x419/0x540=
 [videodev]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193799]=C2=A0 video_usercopy+0x23b/0x630 [=
videodev]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193819]=C2=A0 ? __pfx___video_do_ioctl+0x1=
0/0x10 [videodev]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193836]=C2=A0 v4l2_ioctl+0x6b/0xa0 [videod=
ev]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193851]=C2=A0 __x64_sys_ioctl+0x96/0xe0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193855]=C2=A0 do_syscall_64+0x120/0x6c0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193859]=C2=A0 ? do_read_fault+0xf5/0x220
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193863]=C2=A0 ? do_fault+0x148/0x270
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193865]=C2=A0 ? __handle_mm_fault+0x470/0x=
6c0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193868]=C2=A0 ? count_memcg_events+0xeb/0x=
1b0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193871]=C2=A0 ? handle_mm_fault+0x220/0x34=
0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193873]=C2=A0 ? do_user_addr_fault+0x1e5/0=
x7f0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193876]=C2=A0 ? arch_exit_to_user_mode_pre=
pare.isra.0+0x9f/0xe0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193880]=C2=A0 entry_SYSCALL_64_after_hwfra=
me+0x76/0x7e
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193883] RIP: 0033:0x738e787000ed
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193886] Code: 04 25 28 00 00 00 48 89 45 c=
8 31 c0 48 8d 45 10 c7 45
> b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <=
89>
> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193888] RSP: 002b:0000738e730e6a00 EFLAGS:=
 00000246 ORIG_RAX:
> 0000000000000010
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193890] RAX: ffffffffffffffda RBX: 0000738=
e64008850 RCX:
> 0000738e787000ed
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193892] RDX: 000059d3df721cf0 RSI: 0000000=
040045612 RDI:
> 0000000000000010
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193893] RBP: 0000738e730e6a50 R08: 0000738=
e6400ae40 R09:
> 0000000000000000
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193894] R10: 0000738e6400ae30 R11: 0000000=
000000246 R12:
> 0000000000000000
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193895] R13: 0000738e640012d0 R14: 0000738=
e64008850 R15:
> 0000000000000002
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193897]=C2=A0 </TASK>
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.193907] Mem-Info:
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.194897] active_anon:362 inactive_anon:3172=
 isolated_anon:0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.194897]=C2=A0 active_file:2498 inactive_fi=
le:11687 isolated_file:1
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.194897]=C2=A0 unevictable:0 dirty:0 writeb=
ack:4
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.194897]=C2=A0 slab_reclaimable:3707 slab_u=
nreclaimable:10022
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.194897]=C2=A0 mapped:4710 shmem:9 pagetabl=
es:1021
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.194897]=C2=A0 sec_pagetables:0 bounce:0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.194897]=C2=A0 kernel_misc_reclaimable:0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.194897]=C2=A0 free:3452 free_pcp:1 free_cm=
a:0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.195008] Node 0 active_anon:1448kB inactive=
_anon:12688kB
> active_file:9992kB inactive_file:46748kB unevictable:0kB isolated(anon):0=
kB
> isolated(file):4kB mapped:18840kB dirty:0kB writeback:16kB shmem:36kB
> shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0kB kernel_stack:2416kB
> pagetables:4084kB sec_pagetables:0kB all_unreclaimable? no Balloon:16384k=
B
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.195097] Node 0 DMA free:2828kB boost:0kB m=
in:132kB low:164kB
> high:196kB reserved_highatomic:0KB free_highatomic:0KB active_anon:224kB
> inactive_anon:940kB active_file:1360kB inactive_file:2408kB unevictable:0=
kB
> writepending:0kB zspages:0kB present:15992kB managed:15360kB mlocked:0kB
> bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.195186] lowmem_reserve[]: 0 195 195 195 19=
5
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196280] Node 0 DMA32 free:14880kB boost:38=
56kB min:5572kB
> low:6000kB high:6428kB reserved_highatomic:0KB free_highatomic:0KB
> active_anon:1224kB inactive_anon:11728kB active_file:8632kB
> inactive_file:40024kB unevictable:0kB writepending:16kB zspages:0kB
> present:274348kB managed:200080kB mlocked:0kB bounce:0kB free_pcp:316kB
> local_pcp:236kB free_cma:0kB
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196372] lowmem_reserve[]: 0 0 0 0 0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196388] Node 0 DMA: 193*4kB (UM) 213*8kB (=
UM) 22*16kB (UM) 0*32kB
> 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 2828kB
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196433] Node 0 DMA32: 1631*4kB (UME) 764*8=
kB (UME) 138*16kB (UME)
> 8*32kB (UM) 3*64kB (M) 1*128kB (M) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*40=
96kB
> =3D 15420kB
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196487] Node 0 hugepages_total=3D0 hugepag=
es_free=3D0 hugepages_surp=3D0
> hugepages_size=3D2048kB
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196514] 14914 total pagecache pages
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196527] 2073 pages in swap cache
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196539] Free swap=C2=A0 =3D 961672kB
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196551] Total swap =3D 1048572kB
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196563] 72585 pages RAM
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196572] 0 pages HighMem/MovableOnly
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196584] 18725 pages reserved
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196596] 0 pages cma reserved
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196608] 0 pages hwpoisoned
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196620] Memory cgroup min protection 0kB -=
- low protection 0kB
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196627] ------------[ cut here ]----------=
--
>=20
> Additionally, this failure isn't handled gracefully, it's followed with:
>=20
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196672] UBSAN: shift-out-of-bounds in /bui=
lddir/build/BUILD/kernel-
> latest-7.0-build/kernel-latest-7.0/linux-7.0-rc4/mm/page_alloc.c:1403:22
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196710] shift exponent 52 is too large for=
 32-bit type 'int'
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196730] CPU: 1 UID: 1000 PID: 1305 Comm: v=
4l2src0:src Not tainted
> 7.0.0-0.rc4.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)=20
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196733] Hardware name: Xen HVM domU, BIOS =
4.19.4 03/17/2026
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196734] Call Trace:
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196737]=C2=A0 <TASK>
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196739]=C2=A0 dump_stack_lvl+0x5d/0x80
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196744]=C2=A0 ubsan_epilogue+0x5/0x2b
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196746]=C2=A0 __ubsan_handle_shift_out_of_=
bounds.cold+0x61/0xe6
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196749]=C2=A0 __free_pages_ok.cold+0x13/0x=
a8
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196753]=C2=A0 dma_free_noncontiguous+0xbf/=
0xe0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196756]=C2=A0 ? usb_free_noncoherent+0x3a/=
0x60
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196761]=C2=A0 uvc_free_urb_buffers+0x38/0x=
90 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196773]=C2=A0 uvc_alloc_urb_buffers.part.0=
+0xe6/0x130 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196781]=C2=A0 uvc_video_start_transfer+0x1=
9d/0x4e0 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196789]=C2=A0 uvc_video_start_streaming+0x=
ab/0x100 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196797]=C2=A0 uvc_start_streaming_video+0x=
ec/0x110 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196806]=C2=A0 vb2_start_streaming+0x63/0x1=
30 [videobuf2_common]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196813]=C2=A0 vb2_core_streamon+0x98/0xf0 =
[videobuf2_common]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196819]=C2=A0 ? vb2_ioctl_streamon+0x15/0x=
60 [videobuf2_v4l2]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196824]=C2=A0 __video_do_ioctl+0x419/0x540=
 [videodev]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196847]=C2=A0 video_usercopy+0x23b/0x630 [=
videodev]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196863]=C2=A0 ? __pfx___video_do_ioctl+0x1=
0/0x10 [videodev]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196880]=C2=A0 v4l2_ioctl+0x6b/0xa0 [videod=
ev]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196895]=C2=A0 __x64_sys_ioctl+0x96/0xe0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196898]=C2=A0 do_syscall_64+0x120/0x6c0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196902]=C2=A0 ? do_read_fault+0xf5/0x220
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196906]=C2=A0 ? do_fault+0x148/0x270
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196908]=C2=A0 ? __handle_mm_fault+0x470/0x=
6c0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196911]=C2=A0 ? count_memcg_events+0xeb/0x=
1b0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196914]=C2=A0 ? handle_mm_fault+0x220/0x34=
0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196916]=C2=A0 ? do_user_addr_fault+0x1e5/0=
x7f0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196920]=C2=A0 ? arch_exit_to_user_mode_pre=
pare.isra.0+0x9f/0xe0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196924]=C2=A0 entry_SYSCALL_64_after_hwfra=
me+0x76/0x7e
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196926] RIP: 0033:0x738e787000ed
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196929] Code: 04 25 28 00 00 00 48 89 45 c=
8 31 c0 48 8d 45 10 c7 45
> b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <=
89>
> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196930] RSP: 002b:0000738e730e6a00 EFLAGS:=
 00000246 ORIG_RAX:
> 0000000000000010
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196933] RAX: ffffffffffffffda RBX: 0000738=
e64008850 RCX:
> 0000738e787000ed
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196934] RDX: 000059d3df721cf0 RSI: 0000000=
040045612 RDI:
> 0000000000000010
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196935] RBP: 0000738e730e6a50 R08: 0000738=
e6400ae40 R09:
> 0000000000000000
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196936] R10: 0000738e6400ae30 R11: 0000000=
000000246 R12:
> 0000000000000000
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196937] R13: 0000738e640012d0 R14: 0000738=
e64008850 R15:
> 0000000000000002
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196939]=C2=A0 </TASK>
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.196940] ---[ end trace ]---
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.197835] BUG: Bad page state in process v4l=
2src0:src=C2=A0 pfn:009a0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198028] page: refcount:0 mapcount:0 mappin=
g:0000000000000000
> index:0x2a pfn:0x9a0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198054] flags: 0x7ffffc0000000(node=3D0|zo=
ne=3D0|lastcpupid=3D0x1fffff)
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198074] page_type: f0(buddy)
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198088] raw: 0007ffffc0000000 fffffac1c002=
6a08 fffffac1c0025e08
> 0000000000000000
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198111] raw: 000000000000002a 000000000000=
0002 00000000f0000000
> 0000000000000000
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198133] page dumped because: nonzero mapco=
unt
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198149] Modules linked in: nft_reject_ipv6=
 nf_reject_ipv6
> nft_reject_ipv4 nf_reject_ipv4 nft_reject nft_ct nft_masq nft_chain_nat n=
f_nat
> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables uvcvideo ath3k btusb
> btmtk uvc videobuf2_vmalloc btrtl videobuf2_memops videobuf2_v4l2 cdc_mbi=
m
> btbcm cdc_ncm videobuf2_common btintel cdc_ether usbnet videodev bluetoot=
h mii
> cdc_wdm mc rfkill cdc_acm joydev intel_rapl_msr intel_rapl_common
> ghash_clmulni_intel xhci_pci xhci_hcd ehci_pci ehci_hcd pcspkr i2c_piix4
> ata_generic pata_acpi i2c_smbus serio_raw xen_scsiback target_core_mod
> xen_netback xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn i2=
c_dev
> fuse loop nfnetlink overlay xen_blkfront
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198472] CPU: 1 UID: 1000 PID: 1305 Comm: v=
4l2src0:src Not tainted
> 7.0.0-0.rc4.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)=20
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198475] Hardware name: Xen HVM domU, BIOS =
4.19.4 03/17/2026
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198477] Call Trace:
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198479]=C2=A0 <TASK>
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198480]=C2=A0 dump_stack_lvl+0x5d/0x80
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198485]=C2=A0 bad_page.cold+0x7a/0x91
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198488]=C2=A0 __free_pages_ok+0x481/0x680
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198491]=C2=A0 dma_free_noncontiguous+0xbf/=
0xe0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198494]=C2=A0 ? usb_free_noncoherent+0x3a/=
0x60
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198497]=C2=A0 uvc_free_urb_buffers+0x38/0x=
90 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198507]=C2=A0 uvc_alloc_urb_buffers.part.0=
+0xe6/0x130 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198515]=C2=A0 uvc_video_start_transfer+0x1=
9d/0x4e0 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198523]=C2=A0 uvc_video_start_streaming+0x=
ab/0x100 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198531]=C2=A0 uvc_start_streaming_video+0x=
ec/0x110 [uvcvideo]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198539]=C2=A0 vb2_start_streaming+0x63/0x1=
30 [videobuf2_common]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198546]=C2=A0 vb2_core_streamon+0x98/0xf0 =
[videobuf2_common]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198551]=C2=A0 ? vb2_ioctl_streamon+0x15/0x=
60 [videobuf2_v4l2]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198555]=C2=A0 __video_do_ioctl+0x419/0x540=
 [videodev]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198574]=C2=A0 video_usercopy+0x23b/0x630 [=
videodev]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198590]=C2=A0 ? __pfx___video_do_ioctl+0x1=
0/0x10 [videodev]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198607]=C2=A0 v4l2_ioctl+0x6b/0xa0 [videod=
ev]
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198622]=C2=A0 __x64_sys_ioctl+0x96/0xe0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198625]=C2=A0 do_syscall_64+0x120/0x6c0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198629]=C2=A0 ? do_read_fault+0xf5/0x220
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198632]=C2=A0 ? do_fault+0x148/0x270
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198635]=C2=A0 ? __handle_mm_fault+0x470/0x=
6c0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198637]=C2=A0 ? count_memcg_events+0xeb/0x=
1b0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198640]=C2=A0 ? handle_mm_fault+0x220/0x34=
0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198642]=C2=A0 ? do_user_addr_fault+0x1e5/0=
x7f0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198645]=C2=A0 ? arch_exit_to_user_mode_pre=
pare.isra.0+0x9f/0xe0
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198648]=C2=A0 entry_SYSCALL_64_after_hwfra=
me+0x76/0x7e
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198651] RIP: 0033:0x738e787000ed
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198653] Code: 04 25 28 00 00 00 48 89 45 c=
8 31 c0 48 8d 45 10 c7 45
> b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <=
89>
> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198654] RSP: 002b:0000738e730e6a00 EFLAGS:=
 00000246 ORIG_RAX:
> 0000000000000010
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198656] RAX: ffffffffffffffda RBX: 0000738=
e64008850 RCX:
> 0000738e787000ed
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198657] RDX: 000059d3df721cf0 RSI: 0000000=
040045612 RDI:
> 0000000000000010
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198658] RBP: 0000738e730e6a50 R08: 0000738=
e6400ae40 R09:
> 0000000000000000
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198659] R10: 0000738e6400ae30 R11: 0000000=
000000246 R12:
> 0000000000000000
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198660] R13: 0000738e640012d0 R14: 0000738=
e64008850 R15:
> 0000000000000002
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198662]=C2=A0 </TASK>
> =C2=A0=C2=A0=C2=A0 [=C2=A0 739.198663] Disabling lock debugging due to ke=
rnel taint
>=20
> And eventually kernel panic:
>=20
> =C2=A0=C2=A0=C2=A0 [=C2=A0 740.464422] BUG: unable to handle page fault f=
or address:
> fffffac1c0800000
> =C2=A0=C2=A0=C2=A0 [=C2=A0 740.464454] #PF: supervisor read access in ker=
nel mode
> =C2=A0=C2=A0=C2=A0 [=C2=A0 740.464471] #PF: error_code(0x0000) - not-pres=
ent page
> =C2=A0=C2=A0=C2=A0 [=C2=A0 740.464488] PGD 11be0067 P4D 11be0067 PUD 1148=
f067 PMD 0=20
>=20
> Full console log is at:
> https://gist.github.com/marmarek/5d839f419b1d56e71a48e74ae66f0e7a

--=-HFUCsXEeUhtZsg9l+P4Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabwTUgAKCRDZQZRRKWBy
9JvaAPwNrk8UL2YIOTVSho1vd7sSZyPPfRuNRyAD82pcLPnNDAEA8NnL7zYN+wj3
6g1aTtXVVkbSXkhXXpdzl81rlmp41Qc=
=o/T2
-----END PGP SIGNATURE-----

--=-HFUCsXEeUhtZsg9l+P4Y--

