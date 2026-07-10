Return-Path: <linux-media+bounces-67321-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XPU4H7lZUWrSCwMAu9opvQ
	(envelope-from <linux-media+bounces-67321-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 22:44:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA77773E769
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 22:44:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=GJvfAhhO;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67321-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67321-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EA52303C7CB
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 20:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DD33A9D90;
	Fri, 10 Jul 2026 20:44:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1091385D85
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 20:44:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783716270; cv=pass; b=ZylLJsllVeuDvtGXsxVatjyaYpuWUjMBPZAHCJHU1wueIayOrX/PeYoWUotdcxqlU9MVMQdHuAL2GIBaD8Od5vlbmiYfVUG8aXvXrkiGlhB78HgMDY+aQP2xyCjopdhsskP8dlFSP9R1gjkDx8EOSu6CBUlOd6T8KOWtZxoggDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783716270; c=relaxed/simple;
	bh=F5eZusRBSt34kb/9CWPjvSF402YGSRkm2ceEuoDaj4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JM8MobZx94KW08/EDJnq2I+ZSdtcNHnzfJw1zwIMFMfjLcOYBDkdyuNgLOap/x0Z91yT78domRYdPZpygZQofCKBIxv55KduFF5P3GER7oZMsI0Poj4hYXkKmA9+3vvHqcJ1pRK31MuCgrIF8gIMFExek0Gc0Z+FPmMEqkMrdyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GJvfAhhO; arc=pass smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cb59f6ba26so28565ad.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 13:44:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783716266; cv=none;
        d=google.com; s=arc-20260327;
        b=HXUNlxusLJB7rF4Oo8oQr2voFacluWXUxKVtP1OVsN+FYgLYLc2joCWz/tfi8k1nef
         pOi2mFjIOzvl9/UNw1CUu96kjVzLuwJ0U9jZL8Sv+56sJdsc7vkPPaqSkSF+0L9V8SZF
         Nf4osmShUjiJHdXjuxQXLavn9aMiI9baua3r+N+BoGakNQh+3cq9Q4aF9xNturnvXRhZ
         DmdWjwljj8wNpSCSzRiH/z8exuHYH2z109/zk2OR9ZHLs1huMxJctGPuAJ/1whWbZ1nz
         al6dkFuusNPU6dfXU+HVYJU/zErO86QD6jLDFKXqyTt0GlGBeOLGWaPUB5tTU1jx3TeS
         sujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hhBAM2JNDsd+HBeR0c5nF4AnoyxJXmTeYD7S/5azQn0=;
        fh=R2W8zpuJfs/eIeKlMvEKeMXt1b6Am+NHlTn0kliDzfs=;
        b=GDkv+APIQOv9E9hCg66C+v2P59zqodBjq6l+zdJN/4P+i4/QlEx9nci/C4Fw3HExfM
         h4WCENyJoWk+9AEajF83EmGT3jcFAMgpCX8bD5GfspkpM3T0qeOMNJQJiyJm7ifWNydc
         6RtyahFhIki4YnnthXl0BGlqHMkAG4BmE5GyJmrXPt+waMPWKpOv67hzKHLHhoywU7gy
         I76pPyV4iEb8r6539vvuIkbnrDxFr2I1tN2tSCoXy7ugTg09Uyk/LXZM+BK487G/cUw5
         SyXkcK5k2FiUK8dREQ3ZELT2BP+thPj6hbrTm+Sr5piKCzyIX74xwlb78T/Hv3fEdgPf
         KFhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783716266; x=1784321066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hhBAM2JNDsd+HBeR0c5nF4AnoyxJXmTeYD7S/5azQn0=;
        b=GJvfAhhOGHN9NYC2rTfZjAfjRFtwPwa5n39TEPP1I1Jx5DiySt2qoCq/FdxFmxXv4X
         oPuci6R/OFjgyFkP9nSi2o170UtBBqQubnbaDJqXUlihXVTD5Oj3Y8LyP8hEwQmSVggt
         ro/uQtU/osL2LC86pObNYIDVfopUQEb0+Rl3KaxKA/xxSMo5ltERMyj7uACANKSIVIp9
         jV6B6FY07MHwSRWIzAB6BAAtRQMDODoEBfO0bshDkGJy7GC/6IXogG8v7Vlxn9uoKzEa
         sERV5FWxrBRxQKA3AOyyoo3h/SdniaVM1IwrZfIq78EV1xizqa7nNQqN4mrCS15cKfs9
         /ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783716266; x=1784321066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhBAM2JNDsd+HBeR0c5nF4AnoyxJXmTeYD7S/5azQn0=;
        b=akSJU1fUvtberF004aM01X6KL37xUDytZgIQqPKkChR2hYB5k5WNzr3S+rdMFb9iaQ
         yULEUt6Ym89UTGPbEqp8xHBKCjMQ41Fa2jK+PjWwcBwtZPQNVcaPB8qr/Miv6mzd37u8
         el+fiMxzXX1m0XV/tYl5DvC4/n0LY9uKqWVquteq7pjMovNTlUkOoZuy5kP4SExb9HY9
         2kNgec/yg2asXWlGtoRnE7/kvDxo7rmg6C9GPE4eNEoq8K13oDtyrPS+3YR/c3Lkw9MH
         5mA2E6+cPpjxdfIhjObuAsavLUV9/zjaeYx5gYW9g5DS7QAAkwlsSFQFndyDzzQPE3L9
         r3xg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3pSHjDf3s3VHteN/5HCPct89TIWu7LnlekCE1lT8sweHDnTG8H9Gaq/3MojWLRakDcQ+gyxUo/LoFeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4E4T9lqrAi79liqoJ/5Mf7nJBvmf26LEfqu0AFDwCkYtPg5kc
	uFc10J62Ttx3x0Q+YYhUQK7pKgz1reRmvW9LuunUE8RICT4RRSxH+mQgEGlNbDJlZQmCC3553xo
	iZI+Ufehi+WeNYOtka2vZSZAlD0aJIfSnVr3NMZ0=
X-Gm-Gg: AfdE7cmLAuqvIoexIeW3CXa0zqwfkGQU352h22Xxi2aEpz1frYtX4suit1+/fNFPnMg
	zrRvqQkauy2+S1KiU834L/tDWfReiByzSNthA7IuZQplSSZPJhS4QYFfjaSRbJx5aG15ES/+NiV
	Qd8KRNw2egJBW294eT3ZjAZQy+/+HbFjJ0x61c/xFJ4UdajYSqP4KdzISL+pnW32Q1hXpgZDWqw
	yXbNLTPBYXfE3JTwnJKvb04w4OLCfkveQDbWINa1ZyBrJ/rL+QikFtnOoEmZ0tubXMoSnOxINps
	xUaR5g==
X-Received: by 2002:a17:902:e54e:b0:2bd:3bfd:74f1 with SMTP id
 d9443c01a7336-2ce9ebf87bdmr958205ad.2.1783716265438; Fri, 10 Jul 2026
 13:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622170857-mutt-send-email-mst@kernel.org> <20260625202130.2983760-1-briandaniels@google.com>
In-Reply-To: <20260625202130.2983760-1-briandaniels@google.com>
From: Brian Daniels <briandaniels@google.com>
Date: Fri, 10 Jul 2026 16:44:14 -0400
X-Gm-Features: AVVi8Cfi_ey1wcct767LgdMcybrMm5FxESkoRiHCFDkt0VRF9O-s_tCnVLHtIwY
Message-ID: <CAD4i_GTPO2vEoCtDM1p1APapWv5TYqP_Hhn41kOCodTYJB5Yiw@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] media: add virtio-media driver
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com, adelva@google.com, 
	aesteve@redhat.com, changyeon@google.com, daniel.almeida@collabora.com, 
	eperezma@redhat.com, gnurou@gmail.com, gurchetansingh@google.com, 
	hverkuil@xs4all.nl, jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mst@redhat.com,m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67321-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA77773E769

Hi Michael,

Would you prefer more time to review these changes, or should I go
ahead and upload a v5 based on the existing comments?

Thanks,
Brian

On Thu, Jun 25, 2026 at 4:21=E2=80=AFPM Brian Daniels <briandaniels@google.=
com> wrote:
>
> > > From: Alexandre Courbot <gnurou@gmail.com>
> > >
> > > Add the first version of the virtio-media driver.
> > >
> > > This driver acts roughly as a V4L2 relay between user-space and the
> > > virtio virtual device on the host, so it is relatively simple, yet
> > > unconventional. It doesn't use VB2 or other frameworks typically used=
 in
> > > a V4L2 driver, and most of its complexity resides in correctly and
> > > efficiently building the virtio descriptor chain to pass to the host,
> > > avoiding copies whenever possible. This is done by
> > > scatterlist_builder.[ch].
> > >
> > > This version supports MMAP buffers, while USERPTR buffers can also be
> > > enabled through a driver option. DMABUF support is still pending.
> > >
> > > NOTE: This depends on the VIRTIO ID being added in this patch:
> > > https://lore.kernel.org/all/20260310-virtio-media-id-v1-1-be211bcf682=
b@redhat.com
>
> I saw some CI build failures come back, but that should be resolved if th=
e
> patch above is merged. If you'd rather me add it to this patch series let=
 me
> know.
>
> > > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > > Signed-off-by: Brian Daniels <briandaniels@google.com>
> >
> > Thanks for the patches!
> > Sent some comments on individual patches.
>
> Thanks for the feedback!
>
> I've started to prepare v5 based on the comments so far, I'll hold off on
> sending it until we've resolved the other open threads.
>
> > > ---
> > > Guest Setup
> > >
> > > Tests were ran on a Debian 12 guest running with crosvm. The guest im=
age
> > > was created with:
> > >
> > > $ virt-builder debian-12 --root-password password:""
> > >
> > > Build crosvm and launch the guest starting at the "Crosvm" section on
> > > this page: https://github.com/chromeos/virtio-media/blob/main/TRY_IT_=
OUT.md#crosvm
> > >
> > > NOTE: Before running v4l2-compliance in the guest, you need to instal=
l
> > > v4l-utils and ffmpeg:
> > >
> > > $ apt update && apt install v4l-utils ffmpeg
> > >
> > > ---
> > > Compliance Testing
> > >
> > > This was tested using v4l2-compliance. Since virtio-media serves as
> > > a proxy to host devices for the guest VMs, we expect the guest
> > > compliance test to essentially match the host compliance test for the
> > > same device.
> > >
> > > NOTE: v4l2-compliance changes its test behavior depending on the driv=
er
> > > name. In the guest, the driver name for virtio-media proxied-devices =
is
> > > always "virtio-media", even if the actual host device has a driver na=
me
> > > of e.g. "uvcvideo". To ensure the test is consistent between the host
> > > and the guest, I created a patch for the v4l2-compliance tool that
> > > allows you to override the driver name. All test results that follow =
use
> > > this patch:
> > > https://lore.kernel.org/r/20260528163448.4031965-1-briandaniels@googl=
e.com/
> > >
> > > All tests used a Logitech USB Webcam C925e.
> > >
> > > As tested on the host:
> > >
> > > $ v4l2-compliance -d1 -s
> > >
> > > v4l2-compliance 1.33.0-5471, 64 bits, 64-bit time_t
> > > v4l2-compliance SHA: 9f2d3ea879ff 2026-05-28 14:45:11
> > >
> > > Compliance test for uvcvideo device /dev/video1:
> > >
> > > Driver Info:
> > >     Driver name      : uvcvideo
> > >     Card type        : Logitech Webcam C925e
> > >     Bus info         : usb-0000:04:00.1-3
> > >     Driver version   : 6.18.14
> > >     Capabilities     : 0x84a00001
> > >             Video Capture
> > >             Metadata Capture
> > >             Streaming
> > >             Extended Pix Format
> > >             Device Capabilities
> > >     Device Caps      : 0x04200001
> > >             Video Capture
> > >             Streaming
> > >             Extended Pix Format
> > > Media Driver Info:
> > >     Driver name      : uvcvideo
> > >     Model            : Logitech Webcam C925e
> > >     Serial           : 686F371F
> > >     Bus info         : usb-0000:04:00.1-3
> > >     Media version    : 6.18.14
> > >     Hardware revision: 0x00000016 (22)
> > >     Driver version   : 6.18.14
> > > Interface Info:
> > >     ID               : 0x03000002
> > >     Type             : V4L Video
> > > Entity Info:
> > >     ID               : 0x00000001 (1)
> > >     Name             : Logitech Webcam C925e
> > >     Function         : V4L2 I/O
> > >     Flags            : default
> > >     Pad 0x01000007   : 0: Sink
> > >       Link 0x0200001f: from remote pad 0x100000a of entity 'Processin=
g 3' (Video Pixel Formatter): Data, Enabled, Immutable
> > >
> > > Required ioctls:
> > >     test MC information (see 'Media Driver Info' above): OK
> > >     test VIDIOC_QUERYCAP: OK
> > >     test invalid ioctls: OK
> > >
> > > Allow for multiple opens:
> > >     test second /dev/video1 open: OK
> > >     test VIDIOC_QUERYCAP: OK
> > >     test VIDIOC_G/S_PRIORITY: OK
> > >     test for unlimited opens: OK
> > >
> > > Debug ioctls:
> > >     test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > >     test VIDIOC_LOG_STATUS: OK (Not Supported)
> > >
> > > Input ioctls:
> > >     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > >     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > >     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > >     test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > >     test VIDIOC_G/S/ENUMINPUT: OK
> > >     test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > >     Inputs: 1 Audio Inputs: 0 Tuners: 0
> > >
> > > Output ioctls:
> > >     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > >     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > >     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > >     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > >     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > >     Outputs: 0 Audio Outputs: 0 Modulators: 0
> > >
> > > Input/Output configuration ioctls:
> > >     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > >     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > >     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > >     test VIDIOC_G/S_EDID: OK (Not Supported)
> > >
> > > Control ioctls (Input 0):
> > >     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > >     test VIDIOC_QUERYCTRL: OK
> > >     test VIDIOC_G/S_CTRL: OK
> > >             fail: v4l2-test-controls.cpp(983): ret !=3D EINVAL (got 1=
3)
> > >     test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> > >     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > >     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > >     Standard Controls: 19 Private Controls: 0
> > >
> > > Format ioctls (Input 0):
> > >     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > >     test VIDIOC_G/S_PARM: OK
> > >     test VIDIOC_G_FBUF: OK (Not Supported)
> > >     test VIDIOC_G_FMT: OK
> > >     test VIDIOC_TRY_FMT: OK
> > >     test VIDIOC_S_FMT: OK
> > >     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > >     test Cropping: OK (Not Supported)
> > >     test Composing: OK (Not Supported)
> > >     test Scaling: OK (Not Supported)
> > >
> > > Codec ioctls (Input 0):
> > >     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > >     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > >     test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > >
> > > Buffer ioctls (Input 0):
> > >     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > >     test CREATE_BUFS maximum buffers: OK
> > >     test VIDIOC_REMOVE_BUFS: OK
> > >     test VIDIOC_EXPBUF: OK
> > >     test Requests: OK (Not Supported)
> > >     test blocking wait: OK
> > >
> > > Test input 0:
> > >
> > > Streaming ioctls:
> > >     test read/write: OK (Not Supported)
> > >
> > >     Video Capture: Frame #000
> > >     Video Capture: Frame #001
> > >     Video Capture: Frame #002
> > >     Video Capture: Frame #003
> > >     Video Capture: Frame #004
> > >     Video Capture: Frame #005
> > >     Video Capture: Frame #006
> > >     Video Capture: Frame #007
> > >     Video Capture: Frame #008
> > >     Video Capture: Frame #009
> > >     Video Capture: Frame #010
> > >     Video Capture: Frame #011
> > >     Video Capture: Frame #012
> > >     Video Capture: Frame #013
> > >     Video Capture: Frame #014
> > >     Video Capture: Frame #015
> > >     Video Capture: Frame #016
> > >     Video Capture: Frame #017
> > >     Video Capture: Frame #018
> > >     Video Capture: Frame #019
> > >     Video Capture: Frame #020
> > >     Video Capture: Frame #021
> > >     Video Capture: Frame #022
> > >     Video Capture: Frame #023
> > >     Video Capture: Frame #024
> > >     Video Capture: Frame #025
> > >     Video Capture: Frame #026
> > >     Video Capture: Frame #027
> > >     Video Capture: Frame #028
> > >     Video Capture: Frame #029
> > >     Video Capture: Frame #030
> > >     Video Capture: Frame #031
> > >     Video Capture: Frame #032
> > >     Video Capture: Frame #033
> > >     Video Capture: Frame #034
> > >     Video Capture: Frame #035
> > >     Video Capture: Frame #036
> > >     Video Capture: Frame #037
> > >     Video Capture: Frame #038
> > >     Video Capture: Frame #039
> > >     Video Capture: Frame #040
> > >     Video Capture: Frame #041
> > >     Video Capture: Frame #042
> > >     Video Capture: Frame #043
> > >     Video Capture: Frame #044
> > >     Video Capture: Frame #045
> > >     Video Capture: Frame #046
> > >     Video Capture: Frame #047
> > >     Video Capture: Frame #048
> > >     Video Capture: Frame #049
> > >     Video Capture: Frame #050
> > >     Video Capture: Frame #051
> > >     Video Capture: Frame #052
> > >     Video Capture: Frame #053
> > >     Video Capture: Frame #054
> > >     Video Capture: Frame #055
> > >     Video Capture: Frame #056
> > >     Video Capture: Frame #057
> > >     Video Capture: Frame #058
> > >     Video Capture: Frame #059
> > >
> > >     test MMAP (no poll, REQBUFS): OK
> > >
> > >     Video Capture: Frame #000 (select)
> > >     Video Capture: Frame #001 (select)
> > >     Video Capture: Frame #002 (select)
> > >     Video Capture: Frame #003 (select)
> > >     Video Capture: Frame #004 (select)
> > >     Video Capture: Frame #005 (select)
> > >     Video Capture: Frame #006 (select)
> > >     Video Capture: Frame #007 (select)
> > >     Video Capture: Frame #008 (select)
> > >     Video Capture: Frame #009 (select)
> > >     Video Capture: Frame #010 (select)
> > >     Video Capture: Frame #011 (select)
> > >     Video Capture: Frame #012 (select)
> > >     Video Capture: Frame #013 (select)
> > >     Video Capture: Frame #014 (select)
> > >     Video Capture: Frame #015 (select)
> > >     Video Capture: Frame #016 (select)
> > >     Video Capture: Frame #017 (select)
> > >     Video Capture: Frame #018 (select)
> > >     Video Capture: Frame #019 (select)
> > >     Video Capture: Frame #020 (select)
> > >     Video Capture: Frame #021 (select)
> > >     Video Capture: Frame #022 (select)
> > >     Video Capture: Frame #023 (select)
> > >     Video Capture: Frame #024 (select)
> > >     Video Capture: Frame #025 (select)
> > >     Video Capture: Frame #026 (select)
> > >     Video Capture: Frame #027 (select)
> > >     Video Capture: Frame #028 (select)
> > >     Video Capture: Frame #029 (select)
> > >     Video Capture: Frame #030 (select)
> > >     Video Capture: Frame #031 (select)
> > >     Video Capture: Frame #032 (select)
> > >     Video Capture: Frame #033 (select)
> > >     Video Capture: Frame #034 (select)
> > >     Video Capture: Frame #035 (select)
> > >     Video Capture: Frame #036 (select)
> > >     Video Capture: Frame #037 (select)
> > >     Video Capture: Frame #038 (select)
> > >     Video Capture: Frame #039 (select)
> > >     Video Capture: Frame #040 (select)
> > >     Video Capture: Frame #041 (select)
> > >     Video Capture: Frame #042 (select)
> > >     Video Capture: Frame #043 (select)
> > >     Video Capture: Frame #044 (select)
> > >     Video Capture: Frame #045 (select)
> > >     Video Capture: Frame #046 (select)
> > >     Video Capture: Frame #047 (select)
> > >     Video Capture: Frame #048 (select)
> > >     Video Capture: Frame #049 (select)
> > >     Video Capture: Frame #050 (select)
> > >     Video Capture: Frame #051 (select)
> > >     Video Capture: Frame #052 (select)
> > >     Video Capture: Frame #053 (select)
> > >     Video Capture: Frame #054 (select)
> > >     Video Capture: Frame #055 (select)
> > >     Video Capture: Frame #056 (select)
> > >     Video Capture: Frame #057 (select)
> > >     Video Capture: Frame #058 (select)
> > >     Video Capture: Frame #059 (select)
> > >
> > >     test MMAP (select, REQBUFS): OK
> > >
> > >     Video Capture: Frame #000 (epoll)
> > >     Video Capture: Frame #001 (epoll)
> > >     Video Capture: Frame #002 (epoll)
> > >     Video Capture: Frame #003 (epoll)
> > >     Video Capture: Frame #004 (epoll)
> > >     Video Capture: Frame #005 (epoll)
> > >     Video Capture: Frame #006 (epoll)
> > >     Video Capture: Frame #007 (epoll)
> > >     Video Capture: Frame #008 (epoll)
> > >     Video Capture: Frame #009 (epoll)
> > >     Video Capture: Frame #010 (epoll)
> > >     Video Capture: Frame #011 (epoll)
> > >     Video Capture: Frame #012 (epoll)
> > >     Video Capture: Frame #013 (epoll)
> > >     Video Capture: Frame #014 (epoll)
> > >     Video Capture: Frame #015 (epoll)
> > >     Video Capture: Frame #016 (epoll)
> > >     Video Capture: Frame #017 (epoll)
> > >     Video Capture: Frame #018 (epoll)
> > >     Video Capture: Frame #019 (epoll)
> > >     Video Capture: Frame #020 (epoll)
> > >     Video Capture: Frame #021 (epoll)
> > >     Video Capture: Frame #022 (epoll)
> > >     Video Capture: Frame #023 (epoll)
> > >     Video Capture: Frame #024 (epoll)
> > >     Video Capture: Frame #025 (epoll)
> > >     Video Capture: Frame #026 (epoll)
> > >     Video Capture: Frame #027 (epoll)
> > >     Video Capture: Frame #028 (epoll)
> > >     Video Capture: Frame #029 (epoll)
> > >     Video Capture: Frame #030 (epoll)
> > >     Video Capture: Frame #031 (epoll)
> > >     Video Capture: Frame #032 (epoll)
> > >     Video Capture: Frame #033 (epoll)
> > >     Video Capture: Frame #034 (epoll)
> > >     Video Capture: Frame #035 (epoll)
> > >     Video Capture: Frame #036 (epoll)
> > >     Video Capture: Frame #037 (epoll)
> > >     Video Capture: Frame #038 (epoll)
> > >     Video Capture: Frame #039 (epoll)
> > >     Video Capture: Frame #040 (epoll)
> > >     Video Capture: Frame #041 (epoll)
> > >     Video Capture: Frame #042 (epoll)
> > >     Video Capture: Frame #043 (epoll)
> > >     Video Capture: Frame #044 (epoll)
> > >     Video Capture: Frame #045 (epoll)
> > >     Video Capture: Frame #046 (epoll)
> > >     Video Capture: Frame #047 (epoll)
> > >     Video Capture: Frame #048 (epoll)
> > >     Video Capture: Frame #049 (epoll)
> > >     Video Capture: Frame #050 (epoll)
> > >     Video Capture: Frame #051 (epoll)
> > >     Video Capture: Frame #052 (epoll)
> > >     Video Capture: Frame #053 (epoll)
> > >     Video Capture: Frame #054 (epoll)
> > >     Video Capture: Frame #055 (epoll)
> > >     Video Capture: Frame #056 (epoll)
> > >     Video Capture: Frame #057 (epoll)
> > >     Video Capture: Frame #058 (epoll)
> > >     Video Capture: Frame #059 (epoll)
> > >
> > >     test MMAP (epoll, REQBUFS): OK
> > >
> > >     Video Capture: Frame #000
> > >     Video Capture: Frame #001
> > >     Video Capture: Frame #002
> > >     Video Capture: Frame #003
> > >     Video Capture: Frame #004
> > >     Video Capture: Frame #005
> > >     Video Capture: Frame #006
> > >     Video Capture: Frame #007
> > >     Video Capture: Frame #008
> > >     Video Capture: Frame #009
> > >     Video Capture: Frame #010
> > >     Video Capture: Frame #011
> > >     Video Capture: Frame #012
> > >     Video Capture: Frame #013
> > >     Video Capture: Frame #014
> > >     Video Capture: Frame #015
> > >     Video Capture: Frame #016
> > >     Video Capture: Frame #017
> > >     Video Capture: Frame #018
> > >     Video Capture: Frame #019
> > >     Video Capture: Frame #020
> > >     Video Capture: Frame #021
> > >     Video Capture: Frame #022
> > >     Video Capture: Frame #023
> > >     Video Capture: Frame #024
> > >     Video Capture: Frame #025
> > >     Video Capture: Frame #026
> > >     Video Capture: Frame #027
> > >     Video Capture: Frame #028
> > >     Video Capture: Frame #029
> > >     Video Capture: Frame #030
> > >     Video Capture: Frame #031
> > >     Video Capture: Frame #032
> > >     Video Capture: Frame #033
> > >     Video Capture: Frame #034
> > >     Video Capture: Frame #035
> > >     Video Capture: Frame #036
> > >     Video Capture: Frame #037
> > >     Video Capture: Frame #038
> > >     Video Capture: Frame #039
> > >     Video Capture: Frame #040
> > >     Video Capture: Frame #041
> > >     Video Capture: Frame #042
> > >     Video Capture: Frame #043
> > >     Video Capture: Frame #044
> > >     Video Capture: Frame #045
> > >     Video Capture: Frame #046
> > >     Video Capture: Frame #047
> > >     Video Capture: Frame #048
> > >     Video Capture: Frame #049
> > >     Video Capture: Frame #050
> > >     Video Capture: Frame #051
> > >     Video Capture: Frame #052
> > >     Video Capture: Frame #053
> > >     Video Capture: Frame #054
> > >     Video Capture: Frame #055
> > >     Video Capture: Frame #056
> > >     Video Capture: Frame #057
> > >     Video Capture: Frame #058
> > >     Video Capture: Frame #059
> > >
> > >     test MMAP (no poll, CREATE_BUFS): OK
> > >
> > >     Video Capture: Frame #000 (select)
> > >     Video Capture: Frame #001 (select)
> > >     Video Capture: Frame #002 (select)
> > >     Video Capture: Frame #003 (select)
> > >     Video Capture: Frame #004 (select)
> > >     Video Capture: Frame #005 (select)
> > >     Video Capture: Frame #006 (select)
> > >     Video Capture: Frame #007 (select)
> > >     Video Capture: Frame #008 (select)
> > >     Video Capture: Frame #009 (select)
> > >     Video Capture: Frame #010 (select)
> > >     Video Capture: Frame #011 (select)
> > >     Video Capture: Frame #012 (select)
> > >     Video Capture: Frame #013 (select)
> > >     Video Capture: Frame #014 (select)
> > >     Video Capture: Frame #015 (select)
> > >     Video Capture: Frame #016 (select)
> > >     Video Capture: Frame #017 (select)
> > >     Video Capture: Frame #018 (select)
> > >     Video Capture: Frame #019 (select)
> > >     Video Capture: Frame #020 (select)
> > >     Video Capture: Frame #021 (select)
> > >     Video Capture: Frame #022 (select)
> > >     Video Capture: Frame #023 (select)
> > >     Video Capture: Frame #024 (select)
> > >     Video Capture: Frame #025 (select)
> > >     Video Capture: Frame #026 (select)
> > >     Video Capture: Frame #027 (select)
> > >     Video Capture: Frame #028 (select)
> > >     Video Capture: Frame #029 (select)
> > >     Video Capture: Frame #030 (select)
> > >     Video Capture: Frame #031 (select)
> > >     Video Capture: Frame #032 (select)
> > >     Video Capture: Frame #033 (select)
> > >     Video Capture: Frame #034 (select)
> > >     Video Capture: Frame #035 (select)
> > >     Video Capture: Frame #036 (select)
> > >     Video Capture: Frame #037 (select)
> > >     Video Capture: Frame #038 (select)
> > >     Video Capture: Frame #039 (select)
> > >     Video Capture: Frame #040 (select)
> > >     Video Capture: Frame #041 (select)
> > >     Video Capture: Frame #042 (select)
> > >     Video Capture: Frame #043 (select)
> > >     Video Capture: Frame #044 (select)
> > >     Video Capture: Frame #045 (select)
> > >     Video Capture: Frame #046 (select)
> > >     Video Capture: Frame #047 (select)
> > >     Video Capture: Frame #048 (select)
> > >     Video Capture: Frame #049 (select)
> > >     Video Capture: Frame #050 (select)
> > >     Video Capture: Frame #051 (select)
> > >     Video Capture: Frame #052 (select)
> > >     Video Capture: Frame #053 (select)
> > >     Video Capture: Frame #054 (select)
> > >     Video Capture: Frame #055 (select)
> > >     Video Capture: Frame #056 (select)
> > >     Video Capture: Frame #057 (select)
> > >     Video Capture: Frame #058 (select)
> > >     Video Capture: Frame #059 (select)
> > >
> > >     test MMAP (select, CREATE_BUFS): OK
> > >
> > >     Video Capture: Frame #000 (epoll)
> > >     Video Capture: Frame #001 (epoll)
> > >     Video Capture: Frame #002 (epoll)
> > >     Video Capture: Frame #003 (epoll)
> > >     Video Capture: Frame #004 (epoll)
> > >     Video Capture: Frame #005 (epoll)
> > >     Video Capture: Frame #006 (epoll)
> > >     Video Capture: Frame #007 (epoll)
> > >     Video Capture: Frame #008 (epoll)
> > >     Video Capture: Frame #009 (epoll)
> > >     Video Capture: Frame #010 (epoll)
> > >     Video Capture: Frame #011 (epoll)
> > >     Video Capture: Frame #012 (epoll)
> > >     Video Capture: Frame #013 (epoll)
> > >     Video Capture: Frame #014 (epoll)
> > >     Video Capture: Frame #015 (epoll)
> > >     Video Capture: Frame #016 (epoll)
> > >     Video Capture: Frame #017 (epoll)
> > >     Video Capture: Frame #018 (epoll)
> > >     Video Capture: Frame #019 (epoll)
> > >     Video Capture: Frame #020 (epoll)
> > >     Video Capture: Frame #021 (epoll)
> > >     Video Capture: Frame #022 (epoll)
> > >     Video Capture: Frame #023 (epoll)
> > >     Video Capture: Frame #024 (epoll)
> > >     Video Capture: Frame #025 (epoll)
> > >     Video Capture: Frame #026 (epoll)
> > >     Video Capture: Frame #027 (epoll)
> > >     Video Capture: Frame #028 (epoll)
> > >     Video Capture: Frame #029 (epoll)
> > >     Video Capture: Frame #030 (epoll)
> > >     Video Capture: Frame #031 (epoll)
> > >     Video Capture: Frame #032 (epoll)
> > >     Video Capture: Frame #033 (epoll)
> > >     Video Capture: Frame #034 (epoll)
> > >     Video Capture: Frame #035 (epoll)
> > >     Video Capture: Frame #036 (epoll)
> > >     Video Capture: Frame #037 (epoll)
> > >     Video Capture: Frame #038 (epoll)
> > >     Video Capture: Frame #039 (epoll)
> > >     Video Capture: Frame #040 (epoll)
> > >     Video Capture: Frame #041 (epoll)
> > >     Video Capture: Frame #042 (epoll)
> > >     Video Capture: Frame #043 (epoll)
> > >     Video Capture: Frame #044 (epoll)
> > >     Video Capture: Frame #045 (epoll)
> > >     Video Capture: Frame #046 (epoll)
> > >     Video Capture: Frame #047 (epoll)
> > >     Video Capture: Frame #048 (epoll)
> > >     Video Capture: Frame #049 (epoll)
> > >     Video Capture: Frame #050 (epoll)
> > >     Video Capture: Frame #051 (epoll)
> > >     Video Capture: Frame #052 (epoll)
> > >     Video Capture: Frame #053 (epoll)
> > >     Video Capture: Frame #054 (epoll)
> > >     Video Capture: Frame #055 (epoll)
> > >     Video Capture: Frame #056 (epoll)
> > >     Video Capture: Frame #057 (epoll)
> > >     Video Capture: Frame #058 (epoll)
> > >     Video Capture: Frame #059 (epoll)
> > >
> > >     test MMAP (epoll, CREATE_BUFS): OK
> > >
> > >     Video Capture: Frame #000
> > >     Video Capture: Frame #001
> > >     Video Capture: Frame #002
> > >     Video Capture: Frame #003
> > >     Video Capture: Frame #004
> > >     Video Capture: Frame #005
> > >     Video Capture: Frame #006
> > >     Video Capture: Frame #007
> > >     Video Capture: Frame #008
> > >     Video Capture: Frame #009
> > >     Video Capture: Frame #010
> > >     Video Capture: Frame #011
> > >     Video Capture: Frame #012
> > >     Video Capture: Frame #013
> > >     Video Capture: Frame #014
> > >     Video Capture: Frame #015
> > >     Video Capture: Frame #016
> > >     Video Capture: Frame #017
> > >     Video Capture: Frame #018
> > >     Video Capture: Frame #019
> > >     Video Capture: Frame #020
> > >     Video Capture: Frame #021
> > >     Video Capture: Frame #022
> > >     Video Capture: Frame #023
> > >     Video Capture: Frame #024
> > >     Video Capture: Frame #025
> > >     Video Capture: Frame #026
> > >     Video Capture: Frame #027
> > >     Video Capture: Frame #028
> > >     Video Capture: Frame #029
> > >     Video Capture: Frame #030
> > >     Video Capture: Frame #031
> > >     Video Capture: Frame #032
> > >     Video Capture: Frame #033
> > >     Video Capture: Frame #034
> > >     Video Capture: Frame #035
> > >     Video Capture: Frame #036
> > >     Video Capture: Frame #037
> > >     Video Capture: Frame #038
> > >     Video Capture: Frame #039
> > >     Video Capture: Frame #040
> > >     Video Capture: Frame #041
> > >     Video Capture: Frame #042
> > >     Video Capture: Frame #043
> > >     Video Capture: Frame #044
> > >     Video Capture: Frame #045
> > >     Video Capture: Frame #046
> > >     Video Capture: Frame #047
> > >     Video Capture: Frame #048
> > >     Video Capture: Frame #049
> > >     Video Capture: Frame #050
> > >     Video Capture: Frame #051
> > >     Video Capture: Frame #052
> > >     Video Capture: Frame #053
> > >     Video Capture: Frame #054
> > >     Video Capture: Frame #055
> > >     Video Capture: Frame #056
> > >     Video Capture: Frame #057
> > >     Video Capture: Frame #058
> > >     Video Capture: Frame #059
> > >
> > >     test USERPTR (no poll): OK
> > >
> > >     Video Capture: Frame #000 (select)
> > >     Video Capture: Frame #001 (select)
> > >     Video Capture: Frame #002 (select)
> > >     Video Capture: Frame #003 (select)
> > >     Video Capture: Frame #004 (select)
> > >     Video Capture: Frame #005 (select)
> > >     Video Capture: Frame #006 (select)
> > >     Video Capture: Frame #007 (select)
> > >     Video Capture: Frame #008 (select)
> > >     Video Capture: Frame #009 (select)
> > >     Video Capture: Frame #010 (select)
> > >     Video Capture: Frame #011 (select)
> > >     Video Capture: Frame #012 (select)
> > >     Video Capture: Frame #013 (select)
> > >     Video Capture: Frame #014 (select)
> > >     Video Capture: Frame #015 (select)
> > >     Video Capture: Frame #016 (select)
> > >     Video Capture: Frame #017 (select)
> > >     Video Capture: Frame #018 (select)
> > >     Video Capture: Frame #019 (select)
> > >     Video Capture: Frame #020 (select)
> > >     Video Capture: Frame #021 (select)
> > >     Video Capture: Frame #022 (select)
> > >     Video Capture: Frame #023 (select)
> > >     Video Capture: Frame #024 (select)
> > >     Video Capture: Frame #025 (select)
> > >     Video Capture: Frame #026 (select)
> > >     Video Capture: Frame #027 (select)
> > >     Video Capture: Frame #028 (select)
> > >     Video Capture: Frame #029 (select)
> > >     Video Capture: Frame #030 (select)
> > >     Video Capture: Frame #031 (select)
> > >     Video Capture: Frame #032 (select)
> > >     Video Capture: Frame #033 (select)
> > >     Video Capture: Frame #034 (select)
> > >     Video Capture: Frame #035 (select)
> > >     Video Capture: Frame #036 (select)
> > >     Video Capture: Frame #037 (select)
> > >     Video Capture: Frame #038 (select)
> > >     Video Capture: Frame #039 (select)
> > >     Video Capture: Frame #040 (select)
> > >     Video Capture: Frame #041 (select)
> > >     Video Capture: Frame #042 (select)
> > >     Video Capture: Frame #043 (select)
> > >     Video Capture: Frame #044 (select)
> > >     Video Capture: Frame #045 (select)
> > >     Video Capture: Frame #046 (select)
> > >     Video Capture: Frame #047 (select)
> > >     Video Capture: Frame #048 (select)
> > >     Video Capture: Frame #049 (select)
> > >     Video Capture: Frame #050 (select)
> > >     Video Capture: Frame #051 (select)
> > >     Video Capture: Frame #052 (select)
> > >     Video Capture: Frame #053 (select)
> > >     Video Capture: Frame #054 (select)
> > >     Video Capture: Frame #055 (select)
> > >     Video Capture: Frame #056 (select)
> > >     Video Capture: Frame #057 (select)
> > >     Video Capture: Frame #058 (select)
> > >     Video Capture: Frame #059 (select)
> > >
> > >     test USERPTR (select): OK
> > >     test DMABUF: Cannot test, specify --expbuf-device
> > >
> > > Total for uvcvideo device /dev/video1: 58, Succeeded: 57, Failed: 1, =
Warnings: 0
> > >
> > > As tested on the guest:
> > >
> > > $ v4l2-compliance -d0 -s --driver-name uvcvideo
> > >
> > > v4l2-compliance 1.33.0-5457, 64 bits, 64-bit time_t
> > > v4l2-compliance SHA: e7e240f546f3 2026-05-28 17:06:12
> > >
> > > Compliance test for uvcvideo device (overridden from virtio-media) /d=
ev/video0:
> > >
> > > Driver Info:
> > >     Driver name      : uvcvideo
> > >     Card type        : Logitech Webcam C925e
> > >     Bus info         : platform:virtio-media
> > >     Driver version   : 7.1.0
> > >     Capabilities     : 0x84200001
> > >             Video Capture
> > >             Streaming
> > >             Extended Pix Format
> > >             Device Capabilities
> > >     Device Caps      : 0x04200001
> > >             Video Capture
> > >             Streaming
> > >             Extended Pix Format
> > >
> > > Required ioctls:
> > >     test VIDIOC_QUERYCAP: OK
> > >     test invalid ioctls: OK
> > >
> > > Allow for multiple opens:
> > >     test second /dev/video0 open: OK
> > >     test VIDIOC_QUERYCAP: OK
> > >     test VIDIOC_G/S_PRIORITY: OK
> > >     test for unlimited opens: OK
> > >
> > > Debug ioctls:
> > >     test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > >     test VIDIOC_LOG_STATUS: OK (Not Supported)
> > >
> > > Input ioctls:
> > >     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > >     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > >     test VIDIOC_S_HW_FREQ_SEEK: OK
> > >     test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > >     test VIDIOC_G/S/ENUMINPUT: OK
> > >     test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > >     Inputs: 1 Audio Inputs: 0 Tuners: 0
> > >
> > > Output ioctls:
> > >     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > >     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > >     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > >     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > >     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > >     Outputs: 0 Audio Outputs: 0 Modulators: 0
> > >
> > > Input/Output configuration ioctls:
> > >     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > >     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > >     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > >     test VIDIOC_G/S_EDID: OK (Not Supported)
> > >
> > > Control ioctls (Input 0):
> > >     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > >     test VIDIOC_QUERYCTRL: OK
> > >     test VIDIOC_G/S_CTRL: OK
> > >             fail: v4l2-test-controls.cpp(981): ret (got 22)
> > >     test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> > >     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > >     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > >     Standard Controls: 19 Private Controls: 0
> > >
> > > Format ioctls (Input 0):
> > >     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > >     test VIDIOC_G/S_PARM: OK
> > >     test VIDIOC_G_FBUF: OK (Not Supported)
> > >     test VIDIOC_G_FMT: OK
> > >     test VIDIOC_TRY_FMT: OK
> > >     test VIDIOC_S_FMT: OK
> > >     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > >     test Cropping: OK (Not Supported)
> > >     test Composing: OK (Not Supported)
> > >     test Scaling: OK (Not Supported)
> > >
> > > Codec ioctls (Input 0):
> > >     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > >     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > >     test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > >
> > > Buffer ioctls (Input 0):
> > >     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > >     test CREATE_BUFS maximum buffers: OK
> > >     test VIDIOC_REMOVE_BUFS: OK
> > >     test VIDIOC_EXPBUF: OK (Not Supported)
> > >     test Requests: OK (Not Supported)
> > >     test blocking wait: OK
> > >
> > > Test input 0:
> > >
> > > Streaming ioctls:
> > >     test read/write: OK (Not Supported)
> > >
> > >     Video Capture: Frame #000
> > >     Video Capture: Frame #001
> > >     Video Capture: Frame #002
> > >     Video Capture: Frame #003
> > >     Video Capture: Frame #004
> > >     Video Capture: Frame #005
> > >     Video Capture: Frame #006
> > >     Video Capture: Frame #007
> > >     Video Capture: Frame #008
> > >     Video Capture: Frame #009
> > >     Video Capture: Frame #010
> > >     Video Capture: Frame #011
> > >     Video Capture: Frame #012
> > >     Video Capture: Frame #013
> > >     Video Capture: Frame #014
> > >     Video Capture: Frame #015
> > >     Video Capture: Frame #016
> > >     Video Capture: Frame #017
> > >     Video Capture: Frame #018
> > >     Video Capture: Frame #019
> > >     Video Capture: Frame #020
> > >     Video Capture: Frame #021
> > >     Video Capture: Frame #022
> > >     Video Capture: Frame #023
> > >     Video Capture: Frame #024
> > >     Video Capture: Frame #025
> > >     Video Capture: Frame #026
> > >     Video Capture: Frame #027
> > >     Video Capture: Frame #028
> > >     Video Capture: Frame #029
> > >     Video Capture: Frame #030
> > >     Video Capture: Frame #031
> > >     Video Capture: Frame #032
> > >     Video Capture: Frame #033
> > >     Video Capture: Frame #034
> > >     Video Capture: Frame #035
> > >     Video Capture: Frame #036
> > >     Video Capture: Frame #037
> > >     Video Capture: Frame #038
> > >     Video Capture: Frame #039
> > >     Video Capture: Frame #040
> > >     Video Capture: Frame #041
> > >     Video Capture: Frame #042
> > >     Video Capture: Frame #043
> > >     Video Capture: Frame #044
> > >     Video Capture: Frame #045
> > >     Video Capture: Frame #046
> > >     Video Capture: Frame #047
> > >     Video Capture: Frame #048
> > >     Video Capture: Frame #049
> > >     Video Capture: Frame #050
> > >     Video Capture: Frame #051
> > >     Video Capture: Frame #052
> > >     Video Capture: Frame #053
> > >     Video Capture: Frame #054
> > >     Video Capture: Frame #055
> > >     Video Capture: Frame #056
> > >     Video Capture: Frame #057
> > >     Video Capture: Frame #058
> > >     Video Capture: Frame #059
> > >
> > >     test MMAP (no poll, REQBUFS): OK
> > >
> > >     Video Capture: Frame #000 (select)
> > >     Video Capture: Frame #001 (select)
> > >     Video Capture: Frame #002 (select)
> > >     Video Capture: Frame #003 (select)
> > >     Video Capture: Frame #004 (select)
> > >     Video Capture: Frame #005 (select)
> > >     Video Capture: Frame #006 (select)
> > >     Video Capture: Frame #007 (select)
> > >     Video Capture: Frame #008 (select)
> > >     Video Capture: Frame #009 (select)
> > >     Video Capture: Frame #010 (select)
> > >     Video Capture: Frame #011 (select)
> > >     Video Capture: Frame #012 (select)
> > >     Video Capture: Frame #013 (select)
> > >     Video Capture: Frame #014 (select)
> > >     Video Capture: Frame #015 (select)
> > >     Video Capture: Frame #016 (select)
> > >     Video Capture: Frame #017 (select)
> > >     Video Capture: Frame #018 (select)
> > >     Video Capture: Frame #019 (select)
> > >     Video Capture: Frame #020 (select)
> > >     Video Capture: Frame #021 (select)
> > >     Video Capture: Frame #022 (select)
> > >     Video Capture: Frame #023 (select)
> > >     Video Capture: Frame #024 (select)
> > >     Video Capture: Frame #025 (select)
> > >     Video Capture: Frame #026 (select)
> > >     Video Capture: Frame #027 (select)
> > >     Video Capture: Frame #028 (select)
> > >     Video Capture: Frame #029 (select)
> > >     Video Capture: Frame #030 (select)
> > >     Video Capture: Frame #031 (select)
> > >     Video Capture: Frame #032 (select)
> > >     Video Capture: Frame #033 (select)
> > >     Video Capture: Frame #034 (select)
> > >     Video Capture: Frame #035 (select)
> > >     Video Capture: Frame #036 (select)
> > >     Video Capture: Frame #037 (select)
> > >     Video Capture: Frame #038 (select)
> > >     Video Capture: Frame #039 (select)
> > >     Video Capture: Frame #040 (select)
> > >     Video Capture: Frame #041 (select)
> > >     Video Capture: Frame #042 (select)
> > >     Video Capture: Frame #043 (select)
> > >     Video Capture: Frame #044 (select)
> > >     Video Capture: Frame #045 (select)
> > >     Video Capture: Frame #046 (select)
> > >     Video Capture: Frame #047 (select)
> > >     Video Capture: Frame #048 (select)
> > >     Video Capture: Frame #049 (select)
> > >     Video Capture: Frame #050 (select)
> > >     Video Capture: Frame #051 (select)
> > >     Video Capture: Frame #052 (select)
> > >     Video Capture: Frame #053 (select)
> > >     Video Capture: Frame #054 (select)
> > >     Video Capture: Frame #055 (select)
> > >     Video Capture: Frame #056 (select)
> > >     Video Capture: Frame #057 (select)
> > >     Video Capture: Frame #058 (select)
> > >     Video Capture: Frame #059 (select)
> > >
> > >     test MMAP (select, REQBUFS): OK
> > >
> > >     Video Capture: Frame #000 (epoll)
> > >     Video Capture: Frame #001 (epoll)
> > >     Video Capture: Frame #002 (epoll)
> > >     Video Capture: Frame #003 (epoll)
> > >     Video Capture: Frame #004 (epoll)
> > >     Video Capture: Frame #005 (epoll)
> > >     Video Capture: Frame #006 (epoll)
> > >     Video Capture: Frame #007 (epoll)
> > >     Video Capture: Frame #008 (epoll)
> > >     Video Capture: Frame #009 (epoll)
> > >     Video Capture: Frame #010 (epoll)
> > >     Video Capture: Frame #011 (epoll)
> > >     Video Capture: Frame #012 (epoll)
> > >     Video Capture: Frame #013 (epoll)
> > >     Video Capture: Frame #014 (epoll)
> > >     Video Capture: Frame #015 (epoll)
> > >     Video Capture: Frame #016 (epoll)
> > >     Video Capture: Frame #017 (epoll)
> > >     Video Capture: Frame #018 (epoll)
> > >     Video Capture: Frame #019 (epoll)
> > >     Video Capture: Frame #020 (epoll)
> > >     Video Capture: Frame #021 (epoll)
> > >     Video Capture: Frame #022 (epoll)
> > >     Video Capture: Frame #023 (epoll)
> > >     Video Capture: Frame #024 (epoll)
> > >     Video Capture: Frame #025 (epoll)
> > >     Video Capture: Frame #026 (epoll)
> > >     Video Capture: Frame #027 (epoll)
> > >     Video Capture: Frame #028 (epoll)
> > >     Video Capture: Frame #029 (epoll)
> > >     Video Capture: Frame #030 (epoll)
> > >     Video Capture: Frame #031 (epoll)
> > >     Video Capture: Frame #032 (epoll)
> > >     Video Capture: Frame #033 (epoll)
> > >     Video Capture: Frame #034 (epoll)
> > >     Video Capture: Frame #035 (epoll)
> > >     Video Capture: Frame #036 (epoll)
> > >     Video Capture: Frame #037 (epoll)
> > >     Video Capture: Frame #038 (epoll)
> > >     Video Capture: Frame #039 (epoll)
> > >     Video Capture: Frame #040 (epoll)
> > >     Video Capture: Frame #041 (epoll)
> > >     Video Capture: Frame #042 (epoll)
> > >     Video Capture: Frame #043 (epoll)
> > >     Video Capture: Frame #044 (epoll)
> > >     Video Capture: Frame #045 (epoll)
> > >     Video Capture: Frame #046 (epoll)
> > >     Video Capture: Frame #047 (epoll)
> > >     Video Capture: Frame #048 (epoll)
> > >     Video Capture: Frame #049 (epoll)
> > >     Video Capture: Frame #050 (epoll)
> > >     Video Capture: Frame #051 (epoll)
> > >     Video Capture: Frame #052 (epoll)
> > >     Video Capture: Frame #053 (epoll)
> > >     Video Capture: Frame #054 (epoll)
> > >     Video Capture: Frame #055 (epoll)
> > >     Video Capture: Frame #056 (epoll)
> > >     Video Capture: Frame #057 (epoll)
> > >     Video Capture: Frame #058 (epoll)
> > >     Video Capture: Frame #059 (epoll)
> > >
> > >     test MMAP (epoll, REQBUFS): OK
> > >
> > >     Video Capture: Frame #000
> > >     Video Capture: Frame #001
> > >     Video Capture: Frame #002
> > >     Video Capture: Frame #003
> > >     Video Capture: Frame #004
> > >     Video Capture: Frame #005
> > >     Video Capture: Frame #006
> > >     Video Capture: Frame #007
> > >     Video Capture: Frame #008
> > >     Video Capture: Frame #009
> > >     Video Capture: Frame #010
> > >     Video Capture: Frame #011
> > >     Video Capture: Frame #012
> > >     Video Capture: Frame #013
> > >     Video Capture: Frame #014
> > >     Video Capture: Frame #015
> > >     Video Capture: Frame #016
> > >     Video Capture: Frame #017
> > >     Video Capture: Frame #018
> > >     Video Capture: Frame #019
> > >     Video Capture: Frame #020
> > >     Video Capture: Frame #021
> > >     Video Capture: Frame #022
> > >     Video Capture: Frame #023
> > >     Video Capture: Frame #024
> > >     Video Capture: Frame #025
> > >     Video Capture: Frame #026
> > >     Video Capture: Frame #027
> > >     Video Capture: Frame #028
> > >     Video Capture: Frame #029
> > >     Video Capture: Frame #030
> > >     Video Capture: Frame #031
> > >     Video Capture: Frame #032
> > >     Video Capture: Frame #033
> > >     Video Capture: Frame #034
> > >     Video Capture: Frame #035
> > >     Video Capture: Frame #036
> > >     Video Capture: Frame #037
> > >     Video Capture: Frame #038
> > >     Video Capture: Frame #039
> > >     Video Capture: Frame #040
> > >     Video Capture: Frame #041
> > >     Video Capture: Frame #042
> > >     Video Capture: Frame #043
> > >     Video Capture: Frame #044
> > >     Video Capture: Frame #045
> > >     Video Capture: Frame #046
> > >     Video Capture: Frame #047
> > >     Video Capture: Frame #048
> > >     Video Capture: Frame #049
> > >     Video Capture: Frame #050
> > >     Video Capture: Frame #051
> > >     Video Capture: Frame #052
> > >     Video Capture: Frame #053
> > >     Video Capture: Frame #054
> > >     Video Capture: Frame #055
> > >     Video Capture: Frame #056
> > >     Video Capture: Frame #057
> > >     Video Capture: Frame #058
> > >     Video Capture: Frame #059
> > >
> > >     test MMAP (no poll, CREATE_BUFS): OK
> > >
> > >     Video Capture: Frame #000 (select)
> > >     Video Capture: Frame #001 (select)
> > >     Video Capture: Frame #002 (select)
> > >     Video Capture: Frame #003 (select)
> > >     Video Capture: Frame #004 (select)
> > >     Video Capture: Frame #005 (select)
> > >     Video Capture: Frame #006 (select)
> > >     Video Capture: Frame #007 (select)
> > >     Video Capture: Frame #008 (select)
> > >     Video Capture: Frame #009 (select)
> > >     Video Capture: Frame #010 (select)
> > >     Video Capture: Frame #011 (select)
> > >     Video Capture: Frame #012 (select)
> > >     Video Capture: Frame #013 (select)
> > >     Video Capture: Frame #014 (select)
> > >     Video Capture: Frame #015 (select)
> > >     Video Capture: Frame #016 (select)
> > >     Video Capture: Frame #017 (select)
> > >     Video Capture: Frame #018 (select)
> > >     Video Capture: Frame #019 (select)
> > >     Video Capture: Frame #020 (select)
> > >     Video Capture: Frame #021 (select)
> > >     Video Capture: Frame #022 (select)
> > >     Video Capture: Frame #023 (select)
> > >     Video Capture: Frame #024 (select)
> > >     Video Capture: Frame #025 (select)
> > >     Video Capture: Frame #026 (select)
> > >     Video Capture: Frame #027 (select)
> > >     Video Capture: Frame #028 (select)
> > >     Video Capture: Frame #029 (select)
> > >     Video Capture: Frame #030 (select)
> > >     Video Capture: Frame #031 (select)
> > >     Video Capture: Frame #032 (select)
> > >     Video Capture: Frame #033 (select)
> > >     Video Capture: Frame #034 (select)
> > >     Video Capture: Frame #035 (select)
> > >     Video Capture: Frame #036 (select)
> > >     Video Capture: Frame #037 (select)
> > >     Video Capture: Frame #038 (select)
> > >     Video Capture: Frame #039 (select)
> > >     Video Capture: Frame #040 (select)
> > >     Video Capture: Frame #041 (select)
> > >     Video Capture: Frame #042 (select)
> > >     Video Capture: Frame #043 (select)
> > >     Video Capture: Frame #044 (select)
> > >     Video Capture: Frame #045 (select)
> > >     Video Capture: Frame #046 (select)
> > >     Video Capture: Frame #047 (select)
> > >     Video Capture: Frame #048 (select)
> > >     Video Capture: Frame #049 (select)
> > >     Video Capture: Frame #050 (select)
> > >     Video Capture: Frame #051 (select)
> > >     Video Capture: Frame #052 (select)
> > >     Video Capture: Frame #053 (select)
> > >     Video Capture: Frame #054 (select)
> > >     Video Capture: Frame #055 (select)
> > >     Video Capture: Frame #056 (select)
> > >     Video Capture: Frame #057 (select)
> > >     Video Capture: Frame #058 (select)
> > >     Video Capture: Frame #059 (select)
> > >
> > >     test MMAP (select, CREATE_BUFS): OK
> > >
> > >     Video Capture: Frame #000 (epoll)
> > >     Video Capture: Frame #001 (epoll)
> > >     Video Capture: Frame #002 (epoll)
> > >     Video Capture: Frame #003 (epoll)
> > >     Video Capture: Frame #004 (epoll)
> > >     Video Capture: Frame #005 (epoll)
> > >     Video Capture: Frame #006 (epoll)
> > >     Video Capture: Frame #007 (epoll)
> > >     Video Capture: Frame #008 (epoll)
> > >     Video Capture: Frame #009 (epoll)
> > >     Video Capture: Frame #010 (epoll)
> > >     Video Capture: Frame #011 (epoll)
> > >     Video Capture: Frame #012 (epoll)
> > >     Video Capture: Frame #013 (epoll)
> > >     Video Capture: Frame #014 (epoll)
> > >     Video Capture: Frame #015 (epoll)
> > >     Video Capture: Frame #016 (epoll)
> > >     Video Capture: Frame #017 (epoll)
> > >     Video Capture: Frame #018 (epoll)
> > >     Video Capture: Frame #019 (epoll)
> > >     Video Capture: Frame #020 (epoll)
> > >     Video Capture: Frame #021 (epoll)
> > >     Video Capture: Frame #022 (epoll)
> > >     Video Capture: Frame #023 (epoll)
> > >     Video Capture: Frame #024 (epoll)
> > >     Video Capture: Frame #025 (epoll)
> > >     Video Capture: Frame #026 (epoll)
> > >     Video Capture: Frame #027 (epoll)
> > >     Video Capture: Frame #028 (epoll)
> > >     Video Capture: Frame #029 (epoll)
> > >     Video Capture: Frame #030 (epoll)
> > >     Video Capture: Frame #031 (epoll)
> > >     Video Capture: Frame #032 (epoll)
> > >     Video Capture: Frame #033 (epoll)
> > >     Video Capture: Frame #034 (epoll)
> > >     Video Capture: Frame #035 (epoll)
> > >     Video Capture: Frame #036 (epoll)
> > >     Video Capture: Frame #037 (epoll)
> > >     Video Capture: Frame #038 (epoll)
> > >     Video Capture: Frame #039 (epoll)
> > >     Video Capture: Frame #040 (epoll)
> > >     Video Capture: Frame #041 (epoll)
> > >     Video Capture: Frame #042 (epoll)
> > >     Video Capture: Frame #043 (epoll)
> > >     Video Capture: Frame #044 (epoll)
> > >     Video Capture: Frame #045 (epoll)
> > >     Video Capture: Frame #046 (epoll)
> > >     Video Capture: Frame #047 (epoll)
> > >     Video Capture: Frame #048 (epoll)
> > >     Video Capture: Frame #049 (epoll)
> > >     Video Capture: Frame #050 (epoll)
> > >     Video Capture: Frame #051 (epoll)
> > >     Video Capture: Frame #052 (epoll)
> > >     Video Capture: Frame #053 (epoll)
> > >     Video Capture: Frame #054 (epoll)
> > >     Video Capture: Frame #055 (epoll)
> > >     Video Capture: Frame #056 (epoll)
> > >     Video Capture: Frame #057 (epoll)
> > >     Video Capture: Frame #058 (epoll)
> > >     Video Capture: Frame #059 (epoll)
> > >
> > >     test MMAP (epoll, CREATE_BUFS): OK
> > >     test USERPTR (no poll): OK (Not Supported)
> > >     test USERPTR (select): OK (Not Supported)
> > >     test DMABUF (no poll): OK (Not Supported)
> > >     test DMABUF (select): OK (Not Supported)
> > >
> > > Total for uvcvideo device /dev/video0: 59, Succeeded: 58, Failed: 1, =
Warnings: 0
> > >
> > > ---
> > > Changes in v4:
> > > - Rebased on top of v7.1-rc1
> > > - Replace usages of filep->private_data with file_to_v4l2_fh()
> > >   throughout the driver
> > > - Link to v3: https://lore.kernel.org/r/20250412-virtio-media-v3-1-97=
dc94c18398@gmail.com
> > >
> > > Changes in v3:
> > > - Rebased on top of v6.15-rc1 and removes obsolete control callbacks.
> > > - Link to v2: https://lore.kernel.org/r/20250201-virtio-media-v2-1-ac=
840681452d@gmail.com
> > >
> > > Changes in v2:
> > > - Fixed kernel test robot and media CI warnings (ignored a few false
> > >   positives).
> > > - Changed in-driver email address to personal one since my Google one
> > >   will soon become invalid.
> > > - Link to v1: https://lore.kernel.org/r/20250123-virtio-media-v1-1-81=
e2549b86b9@gmail.com
> > >
> > > Brian Daniels (8):
> > >   media: virtio: Add protocol
> > >   media: virtio: Add virtio-media driver structs and function
> > >     declarations
> > >   media: virtio: Add virtio-media session related structures
> > >   media: virtio: Add scatterlist_builder
> > >   media: virtio: Add virtio_media_ioctls
> > >   media: virtio: Add virtio_media_driver
> > >   media: virtio: Add virtio-media to the build system
> > >   media: virtio: Add MAINTAINERS entry
> > >
> > >  MAINTAINERS                                |    6 +
> > >  drivers/media/Kconfig                      |   13 +
> > >  drivers/media/Makefile                     |    2 +
> > >  drivers/media/virtio/Makefile              |    8 +
> > >  drivers/media/virtio/protocol.h            |  287 +++++
> > >  drivers/media/virtio/scatterlist_builder.c |  574 +++++++++
> > >  drivers/media/virtio/scatterlist_builder.h |  112 ++
> > >  drivers/media/virtio/session.h             |  130 ++
> > >  drivers/media/virtio/virtio_media.h        |   95 ++
> > >  drivers/media/virtio/virtio_media_driver.c |  959 ++++++++++++++
> > >  drivers/media/virtio/virtio_media_ioctls.c | 1338 ++++++++++++++++++=
++
> > >  11 files changed, 3524 insertions(+)
> > >  create mode 100644 drivers/media/virtio/Makefile
> > >  create mode 100644 drivers/media/virtio/protocol.h
> > >  create mode 100644 drivers/media/virtio/scatterlist_builder.c
> > >  create mode 100644 drivers/media/virtio/scatterlist_builder.h
> > >  create mode 100644 drivers/media/virtio/session.h
> > >  create mode 100644 drivers/media/virtio/virtio_media.h
> > >  create mode 100644 drivers/media/virtio/virtio_media_driver.c
> > >  create mode 100644 drivers/media/virtio/virtio_media_ioctls.c
> > >
> > >
> > > base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
>
>

