Return-Path: <linux-media+bounces-67343-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PH/IFKwGUmpxLQMAu9opvQ
	(envelope-from <linux-media+bounces-67343-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 11:02:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7479C740F52
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 11:02:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=ObNlzBMT;
	dkim=pass header.d=redhat.com header.s=google header.b=X0MejwfI;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67343-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67343-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59B05301E21A
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 09:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403F437F721;
	Sat, 11 Jul 2026 09:02:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2346C2DE6F8
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 09:02:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783760546; cv=none; b=QSqlmv+QPWq/zd5NNFzV6m+hMyxIvIE0D1VpxfB/t8dPDfdTKetuO0zdz6xhcWwVu27oMGwra2Y6PgJye4I5kh3ndXemMkeRbKRTdxpsIEoJDQ2RgplxQWgYHgbQZsPCmdkD/Cnq4DSrMtUZd+yncTwWQxmym61RqfkRxdnKBKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783760546; c=relaxed/simple;
	bh=KXx7dvfjXLVyDheeGcNbD4ybDXqPv3M0pGdG296nHiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQpXAxhV4T3oxMY3x+G/i+mDJUQvqyP+SzVLGaJiaQxB/TXS3upUw84MgzNA2/rSxrJvisjtFur5s32rifY3ypclEUyjVkCHYHyB0fRduiXOPwJOdxRMhGvTj5e05SW7XtkskUrQ2CzRoMqGSzAqrTeXsfluzAffv8TV/y96QsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ObNlzBMT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0MejwfI; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783760542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r5eKRLs+8y57XLj+PG01G4IzY51uTdfnzpX6LbdGauc=;
	b=ObNlzBMTyoTEdIAnyPJuAtSGncfCnFfoJ2bK8XqygBdnUEmaZRsQ84SgcvorJTBZvY2fmZ
	C0BscBaZWG+Qcwcjg+BuBD+9ECq7TenpAJ7J/kvF8efpb+UHPBuGMXMF/kIO6qMkYh3zJw
	wTs/VkuoSzISBkuoZeIr9Ay+SPl1Lj4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-cPN0dGwvPIK1wnxBvhXdfw-1; Sat, 11 Jul 2026 05:02:20 -0400
X-MC-Unique: cPN0dGwvPIK1wnxBvhXdfw-1
X-Mimecast-MFC-AGG-ID: cPN0dGwvPIK1wnxBvhXdfw_1783760539
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-698aa6fe074so1675477a12.3
        for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783760539; x=1784365339; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5eKRLs+8y57XLj+PG01G4IzY51uTdfnzpX6LbdGauc=;
        b=X0MejwfISIlMsRLcfc/kXSEK4w4BAm6H8WNzPXcIf8BaGCXE+0fURdN0Krr9kLhpmM
         MCNhL80lYNdbCl9qESjiswxfJ2tdgnVoTpGiE5o/uk24gxTdlqljcwtKnX3rWlTwFlI6
         5o0szRgCDhDNHgCir00Yq0JeHU9G1w0k0HElihQEHNmEv3E/HEFt/L+AxM4AZeEtnJnk
         esFczUjL82QW2ZRu0rHsYInFg4Lj7y2UBLWabtahmGAo3c+VYNugJ5lQplF8tAuW2wlL
         8pdKeuN2XrnAStfp3/IBLL2JBK/m7YaV6QYyOWzYfdG5IkFqfv21OgxrXf2nTWgwYitx
         UwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783760539; x=1784365339;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r5eKRLs+8y57XLj+PG01G4IzY51uTdfnzpX6LbdGauc=;
        b=AJT/1M+OQS4WajKl/az+EMhTjdtaEYVrC4z9G6YkiN2DroyhhrKtI8aBntBI2yCKw1
         blCVipENITPlhcUDGloRMDsKASVfULU+iRtQluqv/EnjBj+s8cRUxg/i3mcju02QNXmd
         qXO+H+kEOuTHU7zYhCFCwCVXfoMUWmgtJvGbIFj/CHzoBoUJTShxv3+Lwkm8yjfsDGST
         Rw/L3MPF+yOSursLhs6m8/HEguvnZoLqnRJ3Xh1vCTp3D+yMSf5qMRsmCfO3UyRxRhUW
         0Xm5vBTWBxkIO1JmF4YEbq4obssWixeKP7Eo/JEQTEGhBVXhtb+i/eYQhmEFk0yGDlGV
         hd/w==
X-Forwarded-Encrypted: i=1; AHgh+RqA6rtZFv+URaYoereSzmMnUC3NXqYbgafX/Gfh4oX01U46I2vO6r9xkwzmyNHJ3mVV248s8jJ224v2JA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd96JCsYXjJ7u0L9Z96eGqYw1sryXQHwF0Dll0++yn1yC6t2Na
	M2x1NKWW9h2gzCEFyT6hR1j7wQBPJzZJiOZX7k9nJhLnTYOK5SdgI4Kj8j30yIuIBmffW6B4oMq
	ED4uzO3Tx4cMQ9/LB5p/Gig9bhMWxC89zv9inXYpfSL7fmisuWM3CGAZimUZ5A+B5
X-Gm-Gg: AfdE7clbh56fahnajBHMA5v9buJPx+FvcpZy795GZi+wLpT7i4RsMzW7GR3ffmilyKP
	oC1G91fm+FCaOf3u8WQiwrU405dHuzVYTOZN0Ndd0zo7q5xdpXp77sjlZIz8LUSTvbj3X65XSQM
	WRNgbU46lRtgw1BaPhxTXkUYwOq5hJrPlvBLLw2zAGm7M1uegsJW9gGjIaLD2mwSVq8r6aBLv8K
	OpVNkLpnr1zvJcdjqOJHrIjRIWbpizWO0UFf8Uor5EBIuZ6KwP/z+lomDSsg0lxHb4pSRnEqg8S
	y1RmcTJx8KO6rYGjCwyLalOihIUUWpsywCW+PkbcQp/8MpqshH3gu/KyJDv29dLKX17WEmBcuy9
	7lwNDqOv4/uTRpgpqmgbHl1OefpA/1+JzMZ1ypCoSYA==
X-Received: by 2002:a05:6402:2811:b0:699:6415:751b with SMTP id 4fb4d7f45d1cf-69c5f108780mr1082813a12.24.1783760538569;
        Sat, 11 Jul 2026 02:02:18 -0700 (PDT)
X-Received: by 2002:a05:6402:2811:b0:699:6415:751b with SMTP id 4fb4d7f45d1cf-69c5f108780mr1082780a12.24.1783760537812;
        Sat, 11 Jul 2026 02:02:17 -0700 (PDT)
Received: from redhat.com (bzq-79-177-145-168.red.bezeqint.net. [79.177.145.168])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4ad4sm12183637a12.12.2026.07.11.02.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 02:02:15 -0700 (PDT)
Date: Sat, 11 Jul 2026 05:02:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com,
	adelva@google.com, aesteve@redhat.com, changyeon@google.com,
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com,
	gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v4 0/8] media: add virtio-media driver
Message-ID: <20260711050159-mutt-send-email-mst@kernel.org>
References: <20260622170857-mutt-send-email-mst@kernel.org>
 <20260625202130.2983760-1-briandaniels@google.com>
 <CAD4i_GTPO2vEoCtDM1p1APapWv5TYqP_Hhn41kOCodTYJB5Yiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD4i_GTPO2vEoCtDM1p1APapWv5TYqP_Hhn41kOCodTYJB5Yiw@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67343-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mst@redhat.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:briandaniels@google.com,m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mst@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7479C740F52

On Fri, Jul 10, 2026 at 04:44:14PM -0400, Brian Daniels wrote:
> Hi Michael,
> 
> Would you prefer more time to review these changes, or should I go
> ahead and upload a v5 based on the existing comments?
> 
> Thanks,
> Brian

Pls send v5. Thanks!

> On Thu, Jun 25, 2026 at 4:21 PM Brian Daniels <briandaniels@google.com> wrote:
> >
> > > > From: Alexandre Courbot <gnurou@gmail.com>
> > > >
> > > > Add the first version of the virtio-media driver.
> > > >
> > > > This driver acts roughly as a V4L2 relay between user-space and the
> > > > virtio virtual device on the host, so it is relatively simple, yet
> > > > unconventional. It doesn't use VB2 or other frameworks typically used in
> > > > a V4L2 driver, and most of its complexity resides in correctly and
> > > > efficiently building the virtio descriptor chain to pass to the host,
> > > > avoiding copies whenever possible. This is done by
> > > > scatterlist_builder.[ch].
> > > >
> > > > This version supports MMAP buffers, while USERPTR buffers can also be
> > > > enabled through a driver option. DMABUF support is still pending.
> > > >
> > > > NOTE: This depends on the VIRTIO ID being added in this patch:
> > > > https://lore.kernel.org/all/20260310-virtio-media-id-v1-1-be211bcf682b@redhat.com
> >
> > I saw some CI build failures come back, but that should be resolved if the
> > patch above is merged. If you'd rather me add it to this patch series let me
> > know.
> >
> > > > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > > > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > > > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > >
> > > Thanks for the patches!
> > > Sent some comments on individual patches.
> >
> > Thanks for the feedback!
> >
> > I've started to prepare v5 based on the comments so far, I'll hold off on
> > sending it until we've resolved the other open threads.
> >
> > > > ---
> > > > Guest Setup
> > > >
> > > > Tests were ran on a Debian 12 guest running with crosvm. The guest image
> > > > was created with:
> > > >
> > > > $ virt-builder debian-12 --root-password password:""
> > > >
> > > > Build crosvm and launch the guest starting at the "Crosvm" section on
> > > > this page: https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md#crosvm
> > > >
> > > > NOTE: Before running v4l2-compliance in the guest, you need to install
> > > > v4l-utils and ffmpeg:
> > > >
> > > > $ apt update && apt install v4l-utils ffmpeg
> > > >
> > > > ---
> > > > Compliance Testing
> > > >
> > > > This was tested using v4l2-compliance. Since virtio-media serves as
> > > > a proxy to host devices for the guest VMs, we expect the guest
> > > > compliance test to essentially match the host compliance test for the
> > > > same device.
> > > >
> > > > NOTE: v4l2-compliance changes its test behavior depending on the driver
> > > > name. In the guest, the driver name for virtio-media proxied-devices is
> > > > always "virtio-media", even if the actual host device has a driver name
> > > > of e.g. "uvcvideo". To ensure the test is consistent between the host
> > > > and the guest, I created a patch for the v4l2-compliance tool that
> > > > allows you to override the driver name. All test results that follow use
> > > > this patch:
> > > > https://lore.kernel.org/r/20260528163448.4031965-1-briandaniels@google.com/
> > > >
> > > > All tests used a Logitech USB Webcam C925e.
> > > >
> > > > As tested on the host:
> > > >
> > > > $ v4l2-compliance -d1 -s
> > > >
> > > > v4l2-compliance 1.33.0-5471, 64 bits, 64-bit time_t
> > > > v4l2-compliance SHA: 9f2d3ea879ff 2026-05-28 14:45:11
> > > >
> > > > Compliance test for uvcvideo device /dev/video1:
> > > >
> > > > Driver Info:
> > > >     Driver name      : uvcvideo
> > > >     Card type        : Logitech Webcam C925e
> > > >     Bus info         : usb-0000:04:00.1-3
> > > >     Driver version   : 6.18.14
> > > >     Capabilities     : 0x84a00001
> > > >             Video Capture
> > > >             Metadata Capture
> > > >             Streaming
> > > >             Extended Pix Format
> > > >             Device Capabilities
> > > >     Device Caps      : 0x04200001
> > > >             Video Capture
> > > >             Streaming
> > > >             Extended Pix Format
> > > > Media Driver Info:
> > > >     Driver name      : uvcvideo
> > > >     Model            : Logitech Webcam C925e
> > > >     Serial           : 686F371F
> > > >     Bus info         : usb-0000:04:00.1-3
> > > >     Media version    : 6.18.14
> > > >     Hardware revision: 0x00000016 (22)
> > > >     Driver version   : 6.18.14
> > > > Interface Info:
> > > >     ID               : 0x03000002
> > > >     Type             : V4L Video
> > > > Entity Info:
> > > >     ID               : 0x00000001 (1)
> > > >     Name             : Logitech Webcam C925e
> > > >     Function         : V4L2 I/O
> > > >     Flags            : default
> > > >     Pad 0x01000007   : 0: Sink
> > > >       Link 0x0200001f: from remote pad 0x100000a of entity 'Processing 3' (Video Pixel Formatter): Data, Enabled, Immutable
> > > >
> > > > Required ioctls:
> > > >     test MC information (see 'Media Driver Info' above): OK
> > > >     test VIDIOC_QUERYCAP: OK
> > > >     test invalid ioctls: OK
> > > >
> > > > Allow for multiple opens:
> > > >     test second /dev/video1 open: OK
> > > >     test VIDIOC_QUERYCAP: OK
> > > >     test VIDIOC_G/S_PRIORITY: OK
> > > >     test for unlimited opens: OK
> > > >
> > > > Debug ioctls:
> > > >     test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > >     test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > >
> > > > Input ioctls:
> > > >     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > >     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > >     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > >     test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > >     test VIDIOC_G/S/ENUMINPUT: OK
> > > >     test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > >     Inputs: 1 Audio Inputs: 0 Tuners: 0
> > > >
> > > > Output ioctls:
> > > >     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > >     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > >     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > >     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > >     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > >     Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > >
> > > > Input/Output configuration ioctls:
> > > >     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > >     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > >     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > >     test VIDIOC_G/S_EDID: OK (Not Supported)
> > > >
> > > > Control ioctls (Input 0):
> > > >     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > > >     test VIDIOC_QUERYCTRL: OK
> > > >     test VIDIOC_G/S_CTRL: OK
> > > >             fail: v4l2-test-controls.cpp(983): ret != EINVAL (got 13)
> > > >     test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> > > >     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > > >     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > >     Standard Controls: 19 Private Controls: 0
> > > >
> > > > Format ioctls (Input 0):
> > > >     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > >     test VIDIOC_G/S_PARM: OK
> > > >     test VIDIOC_G_FBUF: OK (Not Supported)
> > > >     test VIDIOC_G_FMT: OK
> > > >     test VIDIOC_TRY_FMT: OK
> > > >     test VIDIOC_S_FMT: OK
> > > >     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > >     test Cropping: OK (Not Supported)
> > > >     test Composing: OK (Not Supported)
> > > >     test Scaling: OK (Not Supported)
> > > >
> > > > Codec ioctls (Input 0):
> > > >     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > >     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > >     test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > >
> > > > Buffer ioctls (Input 0):
> > > >     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > >     test CREATE_BUFS maximum buffers: OK
> > > >     test VIDIOC_REMOVE_BUFS: OK
> > > >     test VIDIOC_EXPBUF: OK
> > > >     test Requests: OK (Not Supported)
> > > >     test blocking wait: OK
> > > >
> > > > Test input 0:
> > > >
> > > > Streaming ioctls:
> > > >     test read/write: OK (Not Supported)
> > > >
> > > >     Video Capture: Frame #000
> > > >     Video Capture: Frame #001
> > > >     Video Capture: Frame #002
> > > >     Video Capture: Frame #003
> > > >     Video Capture: Frame #004
> > > >     Video Capture: Frame #005
> > > >     Video Capture: Frame #006
> > > >     Video Capture: Frame #007
> > > >     Video Capture: Frame #008
> > > >     Video Capture: Frame #009
> > > >     Video Capture: Frame #010
> > > >     Video Capture: Frame #011
> > > >     Video Capture: Frame #012
> > > >     Video Capture: Frame #013
> > > >     Video Capture: Frame #014
> > > >     Video Capture: Frame #015
> > > >     Video Capture: Frame #016
> > > >     Video Capture: Frame #017
> > > >     Video Capture: Frame #018
> > > >     Video Capture: Frame #019
> > > >     Video Capture: Frame #020
> > > >     Video Capture: Frame #021
> > > >     Video Capture: Frame #022
> > > >     Video Capture: Frame #023
> > > >     Video Capture: Frame #024
> > > >     Video Capture: Frame #025
> > > >     Video Capture: Frame #026
> > > >     Video Capture: Frame #027
> > > >     Video Capture: Frame #028
> > > >     Video Capture: Frame #029
> > > >     Video Capture: Frame #030
> > > >     Video Capture: Frame #031
> > > >     Video Capture: Frame #032
> > > >     Video Capture: Frame #033
> > > >     Video Capture: Frame #034
> > > >     Video Capture: Frame #035
> > > >     Video Capture: Frame #036
> > > >     Video Capture: Frame #037
> > > >     Video Capture: Frame #038
> > > >     Video Capture: Frame #039
> > > >     Video Capture: Frame #040
> > > >     Video Capture: Frame #041
> > > >     Video Capture: Frame #042
> > > >     Video Capture: Frame #043
> > > >     Video Capture: Frame #044
> > > >     Video Capture: Frame #045
> > > >     Video Capture: Frame #046
> > > >     Video Capture: Frame #047
> > > >     Video Capture: Frame #048
> > > >     Video Capture: Frame #049
> > > >     Video Capture: Frame #050
> > > >     Video Capture: Frame #051
> > > >     Video Capture: Frame #052
> > > >     Video Capture: Frame #053
> > > >     Video Capture: Frame #054
> > > >     Video Capture: Frame #055
> > > >     Video Capture: Frame #056
> > > >     Video Capture: Frame #057
> > > >     Video Capture: Frame #058
> > > >     Video Capture: Frame #059
> > > >
> > > >     test MMAP (no poll, REQBUFS): OK
> > > >
> > > >     Video Capture: Frame #000 (select)
> > > >     Video Capture: Frame #001 (select)
> > > >     Video Capture: Frame #002 (select)
> > > >     Video Capture: Frame #003 (select)
> > > >     Video Capture: Frame #004 (select)
> > > >     Video Capture: Frame #005 (select)
> > > >     Video Capture: Frame #006 (select)
> > > >     Video Capture: Frame #007 (select)
> > > >     Video Capture: Frame #008 (select)
> > > >     Video Capture: Frame #009 (select)
> > > >     Video Capture: Frame #010 (select)
> > > >     Video Capture: Frame #011 (select)
> > > >     Video Capture: Frame #012 (select)
> > > >     Video Capture: Frame #013 (select)
> > > >     Video Capture: Frame #014 (select)
> > > >     Video Capture: Frame #015 (select)
> > > >     Video Capture: Frame #016 (select)
> > > >     Video Capture: Frame #017 (select)
> > > >     Video Capture: Frame #018 (select)
> > > >     Video Capture: Frame #019 (select)
> > > >     Video Capture: Frame #020 (select)
> > > >     Video Capture: Frame #021 (select)
> > > >     Video Capture: Frame #022 (select)
> > > >     Video Capture: Frame #023 (select)
> > > >     Video Capture: Frame #024 (select)
> > > >     Video Capture: Frame #025 (select)
> > > >     Video Capture: Frame #026 (select)
> > > >     Video Capture: Frame #027 (select)
> > > >     Video Capture: Frame #028 (select)
> > > >     Video Capture: Frame #029 (select)
> > > >     Video Capture: Frame #030 (select)
> > > >     Video Capture: Frame #031 (select)
> > > >     Video Capture: Frame #032 (select)
> > > >     Video Capture: Frame #033 (select)
> > > >     Video Capture: Frame #034 (select)
> > > >     Video Capture: Frame #035 (select)
> > > >     Video Capture: Frame #036 (select)
> > > >     Video Capture: Frame #037 (select)
> > > >     Video Capture: Frame #038 (select)
> > > >     Video Capture: Frame #039 (select)
> > > >     Video Capture: Frame #040 (select)
> > > >     Video Capture: Frame #041 (select)
> > > >     Video Capture: Frame #042 (select)
> > > >     Video Capture: Frame #043 (select)
> > > >     Video Capture: Frame #044 (select)
> > > >     Video Capture: Frame #045 (select)
> > > >     Video Capture: Frame #046 (select)
> > > >     Video Capture: Frame #047 (select)
> > > >     Video Capture: Frame #048 (select)
> > > >     Video Capture: Frame #049 (select)
> > > >     Video Capture: Frame #050 (select)
> > > >     Video Capture: Frame #051 (select)
> > > >     Video Capture: Frame #052 (select)
> > > >     Video Capture: Frame #053 (select)
> > > >     Video Capture: Frame #054 (select)
> > > >     Video Capture: Frame #055 (select)
> > > >     Video Capture: Frame #056 (select)
> > > >     Video Capture: Frame #057 (select)
> > > >     Video Capture: Frame #058 (select)
> > > >     Video Capture: Frame #059 (select)
> > > >
> > > >     test MMAP (select, REQBUFS): OK
> > > >
> > > >     Video Capture: Frame #000 (epoll)
> > > >     Video Capture: Frame #001 (epoll)
> > > >     Video Capture: Frame #002 (epoll)
> > > >     Video Capture: Frame #003 (epoll)
> > > >     Video Capture: Frame #004 (epoll)
> > > >     Video Capture: Frame #005 (epoll)
> > > >     Video Capture: Frame #006 (epoll)
> > > >     Video Capture: Frame #007 (epoll)
> > > >     Video Capture: Frame #008 (epoll)
> > > >     Video Capture: Frame #009 (epoll)
> > > >     Video Capture: Frame #010 (epoll)
> > > >     Video Capture: Frame #011 (epoll)
> > > >     Video Capture: Frame #012 (epoll)
> > > >     Video Capture: Frame #013 (epoll)
> > > >     Video Capture: Frame #014 (epoll)
> > > >     Video Capture: Frame #015 (epoll)
> > > >     Video Capture: Frame #016 (epoll)
> > > >     Video Capture: Frame #017 (epoll)
> > > >     Video Capture: Frame #018 (epoll)
> > > >     Video Capture: Frame #019 (epoll)
> > > >     Video Capture: Frame #020 (epoll)
> > > >     Video Capture: Frame #021 (epoll)
> > > >     Video Capture: Frame #022 (epoll)
> > > >     Video Capture: Frame #023 (epoll)
> > > >     Video Capture: Frame #024 (epoll)
> > > >     Video Capture: Frame #025 (epoll)
> > > >     Video Capture: Frame #026 (epoll)
> > > >     Video Capture: Frame #027 (epoll)
> > > >     Video Capture: Frame #028 (epoll)
> > > >     Video Capture: Frame #029 (epoll)
> > > >     Video Capture: Frame #030 (epoll)
> > > >     Video Capture: Frame #031 (epoll)
> > > >     Video Capture: Frame #032 (epoll)
> > > >     Video Capture: Frame #033 (epoll)
> > > >     Video Capture: Frame #034 (epoll)
> > > >     Video Capture: Frame #035 (epoll)
> > > >     Video Capture: Frame #036 (epoll)
> > > >     Video Capture: Frame #037 (epoll)
> > > >     Video Capture: Frame #038 (epoll)
> > > >     Video Capture: Frame #039 (epoll)
> > > >     Video Capture: Frame #040 (epoll)
> > > >     Video Capture: Frame #041 (epoll)
> > > >     Video Capture: Frame #042 (epoll)
> > > >     Video Capture: Frame #043 (epoll)
> > > >     Video Capture: Frame #044 (epoll)
> > > >     Video Capture: Frame #045 (epoll)
> > > >     Video Capture: Frame #046 (epoll)
> > > >     Video Capture: Frame #047 (epoll)
> > > >     Video Capture: Frame #048 (epoll)
> > > >     Video Capture: Frame #049 (epoll)
> > > >     Video Capture: Frame #050 (epoll)
> > > >     Video Capture: Frame #051 (epoll)
> > > >     Video Capture: Frame #052 (epoll)
> > > >     Video Capture: Frame #053 (epoll)
> > > >     Video Capture: Frame #054 (epoll)
> > > >     Video Capture: Frame #055 (epoll)
> > > >     Video Capture: Frame #056 (epoll)
> > > >     Video Capture: Frame #057 (epoll)
> > > >     Video Capture: Frame #058 (epoll)
> > > >     Video Capture: Frame #059 (epoll)
> > > >
> > > >     test MMAP (epoll, REQBUFS): OK
> > > >
> > > >     Video Capture: Frame #000
> > > >     Video Capture: Frame #001
> > > >     Video Capture: Frame #002
> > > >     Video Capture: Frame #003
> > > >     Video Capture: Frame #004
> > > >     Video Capture: Frame #005
> > > >     Video Capture: Frame #006
> > > >     Video Capture: Frame #007
> > > >     Video Capture: Frame #008
> > > >     Video Capture: Frame #009
> > > >     Video Capture: Frame #010
> > > >     Video Capture: Frame #011
> > > >     Video Capture: Frame #012
> > > >     Video Capture: Frame #013
> > > >     Video Capture: Frame #014
> > > >     Video Capture: Frame #015
> > > >     Video Capture: Frame #016
> > > >     Video Capture: Frame #017
> > > >     Video Capture: Frame #018
> > > >     Video Capture: Frame #019
> > > >     Video Capture: Frame #020
> > > >     Video Capture: Frame #021
> > > >     Video Capture: Frame #022
> > > >     Video Capture: Frame #023
> > > >     Video Capture: Frame #024
> > > >     Video Capture: Frame #025
> > > >     Video Capture: Frame #026
> > > >     Video Capture: Frame #027
> > > >     Video Capture: Frame #028
> > > >     Video Capture: Frame #029
> > > >     Video Capture: Frame #030
> > > >     Video Capture: Frame #031
> > > >     Video Capture: Frame #032
> > > >     Video Capture: Frame #033
> > > >     Video Capture: Frame #034
> > > >     Video Capture: Frame #035
> > > >     Video Capture: Frame #036
> > > >     Video Capture: Frame #037
> > > >     Video Capture: Frame #038
> > > >     Video Capture: Frame #039
> > > >     Video Capture: Frame #040
> > > >     Video Capture: Frame #041
> > > >     Video Capture: Frame #042
> > > >     Video Capture: Frame #043
> > > >     Video Capture: Frame #044
> > > >     Video Capture: Frame #045
> > > >     Video Capture: Frame #046
> > > >     Video Capture: Frame #047
> > > >     Video Capture: Frame #048
> > > >     Video Capture: Frame #049
> > > >     Video Capture: Frame #050
> > > >     Video Capture: Frame #051
> > > >     Video Capture: Frame #052
> > > >     Video Capture: Frame #053
> > > >     Video Capture: Frame #054
> > > >     Video Capture: Frame #055
> > > >     Video Capture: Frame #056
> > > >     Video Capture: Frame #057
> > > >     Video Capture: Frame #058
> > > >     Video Capture: Frame #059
> > > >
> > > >     test MMAP (no poll, CREATE_BUFS): OK
> > > >
> > > >     Video Capture: Frame #000 (select)
> > > >     Video Capture: Frame #001 (select)
> > > >     Video Capture: Frame #002 (select)
> > > >     Video Capture: Frame #003 (select)
> > > >     Video Capture: Frame #004 (select)
> > > >     Video Capture: Frame #005 (select)
> > > >     Video Capture: Frame #006 (select)
> > > >     Video Capture: Frame #007 (select)
> > > >     Video Capture: Frame #008 (select)
> > > >     Video Capture: Frame #009 (select)
> > > >     Video Capture: Frame #010 (select)
> > > >     Video Capture: Frame #011 (select)
> > > >     Video Capture: Frame #012 (select)
> > > >     Video Capture: Frame #013 (select)
> > > >     Video Capture: Frame #014 (select)
> > > >     Video Capture: Frame #015 (select)
> > > >     Video Capture: Frame #016 (select)
> > > >     Video Capture: Frame #017 (select)
> > > >     Video Capture: Frame #018 (select)
> > > >     Video Capture: Frame #019 (select)
> > > >     Video Capture: Frame #020 (select)
> > > >     Video Capture: Frame #021 (select)
> > > >     Video Capture: Frame #022 (select)
> > > >     Video Capture: Frame #023 (select)
> > > >     Video Capture: Frame #024 (select)
> > > >     Video Capture: Frame #025 (select)
> > > >     Video Capture: Frame #026 (select)
> > > >     Video Capture: Frame #027 (select)
> > > >     Video Capture: Frame #028 (select)
> > > >     Video Capture: Frame #029 (select)
> > > >     Video Capture: Frame #030 (select)
> > > >     Video Capture: Frame #031 (select)
> > > >     Video Capture: Frame #032 (select)
> > > >     Video Capture: Frame #033 (select)
> > > >     Video Capture: Frame #034 (select)
> > > >     Video Capture: Frame #035 (select)
> > > >     Video Capture: Frame #036 (select)
> > > >     Video Capture: Frame #037 (select)
> > > >     Video Capture: Frame #038 (select)
> > > >     Video Capture: Frame #039 (select)
> > > >     Video Capture: Frame #040 (select)
> > > >     Video Capture: Frame #041 (select)
> > > >     Video Capture: Frame #042 (select)
> > > >     Video Capture: Frame #043 (select)
> > > >     Video Capture: Frame #044 (select)
> > > >     Video Capture: Frame #045 (select)
> > > >     Video Capture: Frame #046 (select)
> > > >     Video Capture: Frame #047 (select)
> > > >     Video Capture: Frame #048 (select)
> > > >     Video Capture: Frame #049 (select)
> > > >     Video Capture: Frame #050 (select)
> > > >     Video Capture: Frame #051 (select)
> > > >     Video Capture: Frame #052 (select)
> > > >     Video Capture: Frame #053 (select)
> > > >     Video Capture: Frame #054 (select)
> > > >     Video Capture: Frame #055 (select)
> > > >     Video Capture: Frame #056 (select)
> > > >     Video Capture: Frame #057 (select)
> > > >     Video Capture: Frame #058 (select)
> > > >     Video Capture: Frame #059 (select)
> > > >
> > > >     test MMAP (select, CREATE_BUFS): OK
> > > >
> > > >     Video Capture: Frame #000 (epoll)
> > > >     Video Capture: Frame #001 (epoll)
> > > >     Video Capture: Frame #002 (epoll)
> > > >     Video Capture: Frame #003 (epoll)
> > > >     Video Capture: Frame #004 (epoll)
> > > >     Video Capture: Frame #005 (epoll)
> > > >     Video Capture: Frame #006 (epoll)
> > > >     Video Capture: Frame #007 (epoll)
> > > >     Video Capture: Frame #008 (epoll)
> > > >     Video Capture: Frame #009 (epoll)
> > > >     Video Capture: Frame #010 (epoll)
> > > >     Video Capture: Frame #011 (epoll)
> > > >     Video Capture: Frame #012 (epoll)
> > > >     Video Capture: Frame #013 (epoll)
> > > >     Video Capture: Frame #014 (epoll)
> > > >     Video Capture: Frame #015 (epoll)
> > > >     Video Capture: Frame #016 (epoll)
> > > >     Video Capture: Frame #017 (epoll)
> > > >     Video Capture: Frame #018 (epoll)
> > > >     Video Capture: Frame #019 (epoll)
> > > >     Video Capture: Frame #020 (epoll)
> > > >     Video Capture: Frame #021 (epoll)
> > > >     Video Capture: Frame #022 (epoll)
> > > >     Video Capture: Frame #023 (epoll)
> > > >     Video Capture: Frame #024 (epoll)
> > > >     Video Capture: Frame #025 (epoll)
> > > >     Video Capture: Frame #026 (epoll)
> > > >     Video Capture: Frame #027 (epoll)
> > > >     Video Capture: Frame #028 (epoll)
> > > >     Video Capture: Frame #029 (epoll)
> > > >     Video Capture: Frame #030 (epoll)
> > > >     Video Capture: Frame #031 (epoll)
> > > >     Video Capture: Frame #032 (epoll)
> > > >     Video Capture: Frame #033 (epoll)
> > > >     Video Capture: Frame #034 (epoll)
> > > >     Video Capture: Frame #035 (epoll)
> > > >     Video Capture: Frame #036 (epoll)
> > > >     Video Capture: Frame #037 (epoll)
> > > >     Video Capture: Frame #038 (epoll)
> > > >     Video Capture: Frame #039 (epoll)
> > > >     Video Capture: Frame #040 (epoll)
> > > >     Video Capture: Frame #041 (epoll)
> > > >     Video Capture: Frame #042 (epoll)
> > > >     Video Capture: Frame #043 (epoll)
> > > >     Video Capture: Frame #044 (epoll)
> > > >     Video Capture: Frame #045 (epoll)
> > > >     Video Capture: Frame #046 (epoll)
> > > >     Video Capture: Frame #047 (epoll)
> > > >     Video Capture: Frame #048 (epoll)
> > > >     Video Capture: Frame #049 (epoll)
> > > >     Video Capture: Frame #050 (epoll)
> > > >     Video Capture: Frame #051 (epoll)
> > > >     Video Capture: Frame #052 (epoll)
> > > >     Video Capture: Frame #053 (epoll)
> > > >     Video Capture: Frame #054 (epoll)
> > > >     Video Capture: Frame #055 (epoll)
> > > >     Video Capture: Frame #056 (epoll)
> > > >     Video Capture: Frame #057 (epoll)
> > > >     Video Capture: Frame #058 (epoll)
> > > >     Video Capture: Frame #059 (epoll)
> > > >
> > > >     test MMAP (epoll, CREATE_BUFS): OK
> > > >
> > > >     Video Capture: Frame #000
> > > >     Video Capture: Frame #001
> > > >     Video Capture: Frame #002
> > > >     Video Capture: Frame #003
> > > >     Video Capture: Frame #004
> > > >     Video Capture: Frame #005
> > > >     Video Capture: Frame #006
> > > >     Video Capture: Frame #007
> > > >     Video Capture: Frame #008
> > > >     Video Capture: Frame #009
> > > >     Video Capture: Frame #010
> > > >     Video Capture: Frame #011
> > > >     Video Capture: Frame #012
> > > >     Video Capture: Frame #013
> > > >     Video Capture: Frame #014
> > > >     Video Capture: Frame #015
> > > >     Video Capture: Frame #016
> > > >     Video Capture: Frame #017
> > > >     Video Capture: Frame #018
> > > >     Video Capture: Frame #019
> > > >     Video Capture: Frame #020
> > > >     Video Capture: Frame #021
> > > >     Video Capture: Frame #022
> > > >     Video Capture: Frame #023
> > > >     Video Capture: Frame #024
> > > >     Video Capture: Frame #025
> > > >     Video Capture: Frame #026
> > > >     Video Capture: Frame #027
> > > >     Video Capture: Frame #028
> > > >     Video Capture: Frame #029
> > > >     Video Capture: Frame #030
> > > >     Video Capture: Frame #031
> > > >     Video Capture: Frame #032
> > > >     Video Capture: Frame #033
> > > >     Video Capture: Frame #034
> > > >     Video Capture: Frame #035
> > > >     Video Capture: Frame #036
> > > >     Video Capture: Frame #037
> > > >     Video Capture: Frame #038
> > > >     Video Capture: Frame #039
> > > >     Video Capture: Frame #040
> > > >     Video Capture: Frame #041
> > > >     Video Capture: Frame #042
> > > >     Video Capture: Frame #043
> > > >     Video Capture: Frame #044
> > > >     Video Capture: Frame #045
> > > >     Video Capture: Frame #046
> > > >     Video Capture: Frame #047
> > > >     Video Capture: Frame #048
> > > >     Video Capture: Frame #049
> > > >     Video Capture: Frame #050
> > > >     Video Capture: Frame #051
> > > >     Video Capture: Frame #052
> > > >     Video Capture: Frame #053
> > > >     Video Capture: Frame #054
> > > >     Video Capture: Frame #055
> > > >     Video Capture: Frame #056
> > > >     Video Capture: Frame #057
> > > >     Video Capture: Frame #058
> > > >     Video Capture: Frame #059
> > > >
> > > >     test USERPTR (no poll): OK
> > > >
> > > >     Video Capture: Frame #000 (select)
> > > >     Video Capture: Frame #001 (select)
> > > >     Video Capture: Frame #002 (select)
> > > >     Video Capture: Frame #003 (select)
> > > >     Video Capture: Frame #004 (select)
> > > >     Video Capture: Frame #005 (select)
> > > >     Video Capture: Frame #006 (select)
> > > >     Video Capture: Frame #007 (select)
> > > >     Video Capture: Frame #008 (select)
> > > >     Video Capture: Frame #009 (select)
> > > >     Video Capture: Frame #010 (select)
> > > >     Video Capture: Frame #011 (select)
> > > >     Video Capture: Frame #012 (select)
> > > >     Video Capture: Frame #013 (select)
> > > >     Video Capture: Frame #014 (select)
> > > >     Video Capture: Frame #015 (select)
> > > >     Video Capture: Frame #016 (select)
> > > >     Video Capture: Frame #017 (select)
> > > >     Video Capture: Frame #018 (select)
> > > >     Video Capture: Frame #019 (select)
> > > >     Video Capture: Frame #020 (select)
> > > >     Video Capture: Frame #021 (select)
> > > >     Video Capture: Frame #022 (select)
> > > >     Video Capture: Frame #023 (select)
> > > >     Video Capture: Frame #024 (select)
> > > >     Video Capture: Frame #025 (select)
> > > >     Video Capture: Frame #026 (select)
> > > >     Video Capture: Frame #027 (select)
> > > >     Video Capture: Frame #028 (select)
> > > >     Video Capture: Frame #029 (select)
> > > >     Video Capture: Frame #030 (select)
> > > >     Video Capture: Frame #031 (select)
> > > >     Video Capture: Frame #032 (select)
> > > >     Video Capture: Frame #033 (select)
> > > >     Video Capture: Frame #034 (select)
> > > >     Video Capture: Frame #035 (select)
> > > >     Video Capture: Frame #036 (select)
> > > >     Video Capture: Frame #037 (select)
> > > >     Video Capture: Frame #038 (select)
> > > >     Video Capture: Frame #039 (select)
> > > >     Video Capture: Frame #040 (select)
> > > >     Video Capture: Frame #041 (select)
> > > >     Video Capture: Frame #042 (select)
> > > >     Video Capture: Frame #043 (select)
> > > >     Video Capture: Frame #044 (select)
> > > >     Video Capture: Frame #045 (select)
> > > >     Video Capture: Frame #046 (select)
> > > >     Video Capture: Frame #047 (select)
> > > >     Video Capture: Frame #048 (select)
> > > >     Video Capture: Frame #049 (select)
> > > >     Video Capture: Frame #050 (select)
> > > >     Video Capture: Frame #051 (select)
> > > >     Video Capture: Frame #052 (select)
> > > >     Video Capture: Frame #053 (select)
> > > >     Video Capture: Frame #054 (select)
> > > >     Video Capture: Frame #055 (select)
> > > >     Video Capture: Frame #056 (select)
> > > >     Video Capture: Frame #057 (select)
> > > >     Video Capture: Frame #058 (select)
> > > >     Video Capture: Frame #059 (select)
> > > >
> > > >     test USERPTR (select): OK
> > > >     test DMABUF: Cannot test, specify --expbuf-device
> > > >
> > > > Total for uvcvideo device /dev/video1: 58, Succeeded: 57, Failed: 1, Warnings: 0
> > > >
> > > > As tested on the guest:
> > > >
> > > > $ v4l2-compliance -d0 -s --driver-name uvcvideo
> > > >
> > > > v4l2-compliance 1.33.0-5457, 64 bits, 64-bit time_t
> > > > v4l2-compliance SHA: e7e240f546f3 2026-05-28 17:06:12
> > > >
> > > > Compliance test for uvcvideo device (overridden from virtio-media) /dev/video0:
> > > >
> > > > Driver Info:
> > > >     Driver name      : uvcvideo
> > > >     Card type        : Logitech Webcam C925e
> > > >     Bus info         : platform:virtio-media
> > > >     Driver version   : 7.1.0
> > > >     Capabilities     : 0x84200001
> > > >             Video Capture
> > > >             Streaming
> > > >             Extended Pix Format
> > > >             Device Capabilities
> > > >     Device Caps      : 0x04200001
> > > >             Video Capture
> > > >             Streaming
> > > >             Extended Pix Format
> > > >
> > > > Required ioctls:
> > > >     test VIDIOC_QUERYCAP: OK
> > > >     test invalid ioctls: OK
> > > >
> > > > Allow for multiple opens:
> > > >     test second /dev/video0 open: OK
> > > >     test VIDIOC_QUERYCAP: OK
> > > >     test VIDIOC_G/S_PRIORITY: OK
> > > >     test for unlimited opens: OK
> > > >
> > > > Debug ioctls:
> > > >     test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > >     test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > >
> > > > Input ioctls:
> > > >     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > >     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > >     test VIDIOC_S_HW_FREQ_SEEK: OK
> > > >     test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > >     test VIDIOC_G/S/ENUMINPUT: OK
> > > >     test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > >     Inputs: 1 Audio Inputs: 0 Tuners: 0
> > > >
> > > > Output ioctls:
> > > >     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > >     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > >     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > >     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > >     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > >     Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > >
> > > > Input/Output configuration ioctls:
> > > >     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > >     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > >     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > >     test VIDIOC_G/S_EDID: OK (Not Supported)
> > > >
> > > > Control ioctls (Input 0):
> > > >     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > > >     test VIDIOC_QUERYCTRL: OK
> > > >     test VIDIOC_G/S_CTRL: OK
> > > >             fail: v4l2-test-controls.cpp(981): ret (got 22)
> > > >     test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> > > >     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > > >     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > >     Standard Controls: 19 Private Controls: 0
> > > >
> > > > Format ioctls (Input 0):
> > > >     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > >     test VIDIOC_G/S_PARM: OK
> > > >     test VIDIOC_G_FBUF: OK (Not Supported)
> > > >     test VIDIOC_G_FMT: OK
> > > >     test VIDIOC_TRY_FMT: OK
> > > >     test VIDIOC_S_FMT: OK
> > > >     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > >     test Cropping: OK (Not Supported)
> > > >     test Composing: OK (Not Supported)
> > > >     test Scaling: OK (Not Supported)
> > > >
> > > > Codec ioctls (Input 0):
> > > >     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > >     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > >     test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > >
> > > > Buffer ioctls (Input 0):
> > > >     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > >     test CREATE_BUFS maximum buffers: OK
> > > >     test VIDIOC_REMOVE_BUFS: OK
> > > >     test VIDIOC_EXPBUF: OK (Not Supported)
> > > >     test Requests: OK (Not Supported)
> > > >     test blocking wait: OK
> > > >
> > > > Test input 0:
> > > >
> > > > Streaming ioctls:
> > > >     test read/write: OK (Not Supported)
> > > >
> > > >     Video Capture: Frame #000
> > > >     Video Capture: Frame #001
> > > >     Video Capture: Frame #002
> > > >     Video Capture: Frame #003
> > > >     Video Capture: Frame #004
> > > >     Video Capture: Frame #005
> > > >     Video Capture: Frame #006
> > > >     Video Capture: Frame #007
> > > >     Video Capture: Frame #008
> > > >     Video Capture: Frame #009
> > > >     Video Capture: Frame #010
> > > >     Video Capture: Frame #011
> > > >     Video Capture: Frame #012
> > > >     Video Capture: Frame #013
> > > >     Video Capture: Frame #014
> > > >     Video Capture: Frame #015
> > > >     Video Capture: Frame #016
> > > >     Video Capture: Frame #017
> > > >     Video Capture: Frame #018
> > > >     Video Capture: Frame #019
> > > >     Video Capture: Frame #020
> > > >     Video Capture: Frame #021
> > > >     Video Capture: Frame #022
> > > >     Video Capture: Frame #023
> > > >     Video Capture: Frame #024
> > > >     Video Capture: Frame #025
> > > >     Video Capture: Frame #026
> > > >     Video Capture: Frame #027
> > > >     Video Capture: Frame #028
> > > >     Video Capture: Frame #029
> > > >     Video Capture: Frame #030
> > > >     Video Capture: Frame #031
> > > >     Video Capture: Frame #032
> > > >     Video Capture: Frame #033
> > > >     Video Capture: Frame #034
> > > >     Video Capture: Frame #035
> > > >     Video Capture: Frame #036
> > > >     Video Capture: Frame #037
> > > >     Video Capture: Frame #038
> > > >     Video Capture: Frame #039
> > > >     Video Capture: Frame #040
> > > >     Video Capture: Frame #041
> > > >     Video Capture: Frame #042
> > > >     Video Capture: Frame #043
> > > >     Video Capture: Frame #044
> > > >     Video Capture: Frame #045
> > > >     Video Capture: Frame #046
> > > >     Video Capture: Frame #047
> > > >     Video Capture: Frame #048
> > > >     Video Capture: Frame #049
> > > >     Video Capture: Frame #050
> > > >     Video Capture: Frame #051
> > > >     Video Capture: Frame #052
> > > >     Video Capture: Frame #053
> > > >     Video Capture: Frame #054
> > > >     Video Capture: Frame #055
> > > >     Video Capture: Frame #056
> > > >     Video Capture: Frame #057
> > > >     Video Capture: Frame #058
> > > >     Video Capture: Frame #059
> > > >
> > > >     test MMAP (no poll, REQBUFS): OK
> > > >
> > > >     Video Capture: Frame #000 (select)
> > > >     Video Capture: Frame #001 (select)
> > > >     Video Capture: Frame #002 (select)
> > > >     Video Capture: Frame #003 (select)
> > > >     Video Capture: Frame #004 (select)
> > > >     Video Capture: Frame #005 (select)
> > > >     Video Capture: Frame #006 (select)
> > > >     Video Capture: Frame #007 (select)
> > > >     Video Capture: Frame #008 (select)
> > > >     Video Capture: Frame #009 (select)
> > > >     Video Capture: Frame #010 (select)
> > > >     Video Capture: Frame #011 (select)
> > > >     Video Capture: Frame #012 (select)
> > > >     Video Capture: Frame #013 (select)
> > > >     Video Capture: Frame #014 (select)
> > > >     Video Capture: Frame #015 (select)
> > > >     Video Capture: Frame #016 (select)
> > > >     Video Capture: Frame #017 (select)
> > > >     Video Capture: Frame #018 (select)
> > > >     Video Capture: Frame #019 (select)
> > > >     Video Capture: Frame #020 (select)
> > > >     Video Capture: Frame #021 (select)
> > > >     Video Capture: Frame #022 (select)
> > > >     Video Capture: Frame #023 (select)
> > > >     Video Capture: Frame #024 (select)
> > > >     Video Capture: Frame #025 (select)
> > > >     Video Capture: Frame #026 (select)
> > > >     Video Capture: Frame #027 (select)
> > > >     Video Capture: Frame #028 (select)
> > > >     Video Capture: Frame #029 (select)
> > > >     Video Capture: Frame #030 (select)
> > > >     Video Capture: Frame #031 (select)
> > > >     Video Capture: Frame #032 (select)
> > > >     Video Capture: Frame #033 (select)
> > > >     Video Capture: Frame #034 (select)
> > > >     Video Capture: Frame #035 (select)
> > > >     Video Capture: Frame #036 (select)
> > > >     Video Capture: Frame #037 (select)
> > > >     Video Capture: Frame #038 (select)
> > > >     Video Capture: Frame #039 (select)
> > > >     Video Capture: Frame #040 (select)
> > > >     Video Capture: Frame #041 (select)
> > > >     Video Capture: Frame #042 (select)
> > > >     Video Capture: Frame #043 (select)
> > > >     Video Capture: Frame #044 (select)
> > > >     Video Capture: Frame #045 (select)
> > > >     Video Capture: Frame #046 (select)
> > > >     Video Capture: Frame #047 (select)
> > > >     Video Capture: Frame #048 (select)
> > > >     Video Capture: Frame #049 (select)
> > > >     Video Capture: Frame #050 (select)
> > > >     Video Capture: Frame #051 (select)
> > > >     Video Capture: Frame #052 (select)
> > > >     Video Capture: Frame #053 (select)
> > > >     Video Capture: Frame #054 (select)
> > > >     Video Capture: Frame #055 (select)
> > > >     Video Capture: Frame #056 (select)
> > > >     Video Capture: Frame #057 (select)
> > > >     Video Capture: Frame #058 (select)
> > > >     Video Capture: Frame #059 (select)
> > > >
> > > >     test MMAP (select, REQBUFS): OK
> > > >
> > > >     Video Capture: Frame #000 (epoll)
> > > >     Video Capture: Frame #001 (epoll)
> > > >     Video Capture: Frame #002 (epoll)
> > > >     Video Capture: Frame #003 (epoll)
> > > >     Video Capture: Frame #004 (epoll)
> > > >     Video Capture: Frame #005 (epoll)
> > > >     Video Capture: Frame #006 (epoll)
> > > >     Video Capture: Frame #007 (epoll)
> > > >     Video Capture: Frame #008 (epoll)
> > > >     Video Capture: Frame #009 (epoll)
> > > >     Video Capture: Frame #010 (epoll)
> > > >     Video Capture: Frame #011 (epoll)
> > > >     Video Capture: Frame #012 (epoll)
> > > >     Video Capture: Frame #013 (epoll)
> > > >     Video Capture: Frame #014 (epoll)
> > > >     Video Capture: Frame #015 (epoll)
> > > >     Video Capture: Frame #016 (epoll)
> > > >     Video Capture: Frame #017 (epoll)
> > > >     Video Capture: Frame #018 (epoll)
> > > >     Video Capture: Frame #019 (epoll)
> > > >     Video Capture: Frame #020 (epoll)
> > > >     Video Capture: Frame #021 (epoll)
> > > >     Video Capture: Frame #022 (epoll)
> > > >     Video Capture: Frame #023 (epoll)
> > > >     Video Capture: Frame #024 (epoll)
> > > >     Video Capture: Frame #025 (epoll)
> > > >     Video Capture: Frame #026 (epoll)
> > > >     Video Capture: Frame #027 (epoll)
> > > >     Video Capture: Frame #028 (epoll)
> > > >     Video Capture: Frame #029 (epoll)
> > > >     Video Capture: Frame #030 (epoll)
> > > >     Video Capture: Frame #031 (epoll)
> > > >     Video Capture: Frame #032 (epoll)
> > > >     Video Capture: Frame #033 (epoll)
> > > >     Video Capture: Frame #034 (epoll)
> > > >     Video Capture: Frame #035 (epoll)
> > > >     Video Capture: Frame #036 (epoll)
> > > >     Video Capture: Frame #037 (epoll)
> > > >     Video Capture: Frame #038 (epoll)
> > > >     Video Capture: Frame #039 (epoll)
> > > >     Video Capture: Frame #040 (epoll)
> > > >     Video Capture: Frame #041 (epoll)
> > > >     Video Capture: Frame #042 (epoll)
> > > >     Video Capture: Frame #043 (epoll)
> > > >     Video Capture: Frame #044 (epoll)
> > > >     Video Capture: Frame #045 (epoll)
> > > >     Video Capture: Frame #046 (epoll)
> > > >     Video Capture: Frame #047 (epoll)
> > > >     Video Capture: Frame #048 (epoll)
> > > >     Video Capture: Frame #049 (epoll)
> > > >     Video Capture: Frame #050 (epoll)
> > > >     Video Capture: Frame #051 (epoll)
> > > >     Video Capture: Frame #052 (epoll)
> > > >     Video Capture: Frame #053 (epoll)
> > > >     Video Capture: Frame #054 (epoll)
> > > >     Video Capture: Frame #055 (epoll)
> > > >     Video Capture: Frame #056 (epoll)
> > > >     Video Capture: Frame #057 (epoll)
> > > >     Video Capture: Frame #058 (epoll)
> > > >     Video Capture: Frame #059 (epoll)
> > > >
> > > >     test MMAP (epoll, REQBUFS): OK
> > > >
> > > >     Video Capture: Frame #000
> > > >     Video Capture: Frame #001
> > > >     Video Capture: Frame #002
> > > >     Video Capture: Frame #003
> > > >     Video Capture: Frame #004
> > > >     Video Capture: Frame #005
> > > >     Video Capture: Frame #006
> > > >     Video Capture: Frame #007
> > > >     Video Capture: Frame #008
> > > >     Video Capture: Frame #009
> > > >     Video Capture: Frame #010
> > > >     Video Capture: Frame #011
> > > >     Video Capture: Frame #012
> > > >     Video Capture: Frame #013
> > > >     Video Capture: Frame #014
> > > >     Video Capture: Frame #015
> > > >     Video Capture: Frame #016
> > > >     Video Capture: Frame #017
> > > >     Video Capture: Frame #018
> > > >     Video Capture: Frame #019
> > > >     Video Capture: Frame #020
> > > >     Video Capture: Frame #021
> > > >     Video Capture: Frame #022
> > > >     Video Capture: Frame #023
> > > >     Video Capture: Frame #024
> > > >     Video Capture: Frame #025
> > > >     Video Capture: Frame #026
> > > >     Video Capture: Frame #027
> > > >     Video Capture: Frame #028
> > > >     Video Capture: Frame #029
> > > >     Video Capture: Frame #030
> > > >     Video Capture: Frame #031
> > > >     Video Capture: Frame #032
> > > >     Video Capture: Frame #033
> > > >     Video Capture: Frame #034
> > > >     Video Capture: Frame #035
> > > >     Video Capture: Frame #036
> > > >     Video Capture: Frame #037
> > > >     Video Capture: Frame #038
> > > >     Video Capture: Frame #039
> > > >     Video Capture: Frame #040
> > > >     Video Capture: Frame #041
> > > >     Video Capture: Frame #042
> > > >     Video Capture: Frame #043
> > > >     Video Capture: Frame #044
> > > >     Video Capture: Frame #045
> > > >     Video Capture: Frame #046
> > > >     Video Capture: Frame #047
> > > >     Video Capture: Frame #048
> > > >     Video Capture: Frame #049
> > > >     Video Capture: Frame #050
> > > >     Video Capture: Frame #051
> > > >     Video Capture: Frame #052
> > > >     Video Capture: Frame #053
> > > >     Video Capture: Frame #054
> > > >     Video Capture: Frame #055
> > > >     Video Capture: Frame #056
> > > >     Video Capture: Frame #057
> > > >     Video Capture: Frame #058
> > > >     Video Capture: Frame #059
> > > >
> > > >     test MMAP (no poll, CREATE_BUFS): OK
> > > >
> > > >     Video Capture: Frame #000 (select)
> > > >     Video Capture: Frame #001 (select)
> > > >     Video Capture: Frame #002 (select)
> > > >     Video Capture: Frame #003 (select)
> > > >     Video Capture: Frame #004 (select)
> > > >     Video Capture: Frame #005 (select)
> > > >     Video Capture: Frame #006 (select)
> > > >     Video Capture: Frame #007 (select)
> > > >     Video Capture: Frame #008 (select)
> > > >     Video Capture: Frame #009 (select)
> > > >     Video Capture: Frame #010 (select)
> > > >     Video Capture: Frame #011 (select)
> > > >     Video Capture: Frame #012 (select)
> > > >     Video Capture: Frame #013 (select)
> > > >     Video Capture: Frame #014 (select)
> > > >     Video Capture: Frame #015 (select)
> > > >     Video Capture: Frame #016 (select)
> > > >     Video Capture: Frame #017 (select)
> > > >     Video Capture: Frame #018 (select)
> > > >     Video Capture: Frame #019 (select)
> > > >     Video Capture: Frame #020 (select)
> > > >     Video Capture: Frame #021 (select)
> > > >     Video Capture: Frame #022 (select)
> > > >     Video Capture: Frame #023 (select)
> > > >     Video Capture: Frame #024 (select)
> > > >     Video Capture: Frame #025 (select)
> > > >     Video Capture: Frame #026 (select)
> > > >     Video Capture: Frame #027 (select)
> > > >     Video Capture: Frame #028 (select)
> > > >     Video Capture: Frame #029 (select)
> > > >     Video Capture: Frame #030 (select)
> > > >     Video Capture: Frame #031 (select)
> > > >     Video Capture: Frame #032 (select)
> > > >     Video Capture: Frame #033 (select)
> > > >     Video Capture: Frame #034 (select)
> > > >     Video Capture: Frame #035 (select)
> > > >     Video Capture: Frame #036 (select)
> > > >     Video Capture: Frame #037 (select)
> > > >     Video Capture: Frame #038 (select)
> > > >     Video Capture: Frame #039 (select)
> > > >     Video Capture: Frame #040 (select)
> > > >     Video Capture: Frame #041 (select)
> > > >     Video Capture: Frame #042 (select)
> > > >     Video Capture: Frame #043 (select)
> > > >     Video Capture: Frame #044 (select)
> > > >     Video Capture: Frame #045 (select)
> > > >     Video Capture: Frame #046 (select)
> > > >     Video Capture: Frame #047 (select)
> > > >     Video Capture: Frame #048 (select)
> > > >     Video Capture: Frame #049 (select)
> > > >     Video Capture: Frame #050 (select)
> > > >     Video Capture: Frame #051 (select)
> > > >     Video Capture: Frame #052 (select)
> > > >     Video Capture: Frame #053 (select)
> > > >     Video Capture: Frame #054 (select)
> > > >     Video Capture: Frame #055 (select)
> > > >     Video Capture: Frame #056 (select)
> > > >     Video Capture: Frame #057 (select)
> > > >     Video Capture: Frame #058 (select)
> > > >     Video Capture: Frame #059 (select)
> > > >
> > > >     test MMAP (select, CREATE_BUFS): OK
> > > >
> > > >     Video Capture: Frame #000 (epoll)
> > > >     Video Capture: Frame #001 (epoll)
> > > >     Video Capture: Frame #002 (epoll)
> > > >     Video Capture: Frame #003 (epoll)
> > > >     Video Capture: Frame #004 (epoll)
> > > >     Video Capture: Frame #005 (epoll)
> > > >     Video Capture: Frame #006 (epoll)
> > > >     Video Capture: Frame #007 (epoll)
> > > >     Video Capture: Frame #008 (epoll)
> > > >     Video Capture: Frame #009 (epoll)
> > > >     Video Capture: Frame #010 (epoll)
> > > >     Video Capture: Frame #011 (epoll)
> > > >     Video Capture: Frame #012 (epoll)
> > > >     Video Capture: Frame #013 (epoll)
> > > >     Video Capture: Frame #014 (epoll)
> > > >     Video Capture: Frame #015 (epoll)
> > > >     Video Capture: Frame #016 (epoll)
> > > >     Video Capture: Frame #017 (epoll)
> > > >     Video Capture: Frame #018 (epoll)
> > > >     Video Capture: Frame #019 (epoll)
> > > >     Video Capture: Frame #020 (epoll)
> > > >     Video Capture: Frame #021 (epoll)
> > > >     Video Capture: Frame #022 (epoll)
> > > >     Video Capture: Frame #023 (epoll)
> > > >     Video Capture: Frame #024 (epoll)
> > > >     Video Capture: Frame #025 (epoll)
> > > >     Video Capture: Frame #026 (epoll)
> > > >     Video Capture: Frame #027 (epoll)
> > > >     Video Capture: Frame #028 (epoll)
> > > >     Video Capture: Frame #029 (epoll)
> > > >     Video Capture: Frame #030 (epoll)
> > > >     Video Capture: Frame #031 (epoll)
> > > >     Video Capture: Frame #032 (epoll)
> > > >     Video Capture: Frame #033 (epoll)
> > > >     Video Capture: Frame #034 (epoll)
> > > >     Video Capture: Frame #035 (epoll)
> > > >     Video Capture: Frame #036 (epoll)
> > > >     Video Capture: Frame #037 (epoll)
> > > >     Video Capture: Frame #038 (epoll)
> > > >     Video Capture: Frame #039 (epoll)
> > > >     Video Capture: Frame #040 (epoll)
> > > >     Video Capture: Frame #041 (epoll)
> > > >     Video Capture: Frame #042 (epoll)
> > > >     Video Capture: Frame #043 (epoll)
> > > >     Video Capture: Frame #044 (epoll)
> > > >     Video Capture: Frame #045 (epoll)
> > > >     Video Capture: Frame #046 (epoll)
> > > >     Video Capture: Frame #047 (epoll)
> > > >     Video Capture: Frame #048 (epoll)
> > > >     Video Capture: Frame #049 (epoll)
> > > >     Video Capture: Frame #050 (epoll)
> > > >     Video Capture: Frame #051 (epoll)
> > > >     Video Capture: Frame #052 (epoll)
> > > >     Video Capture: Frame #053 (epoll)
> > > >     Video Capture: Frame #054 (epoll)
> > > >     Video Capture: Frame #055 (epoll)
> > > >     Video Capture: Frame #056 (epoll)
> > > >     Video Capture: Frame #057 (epoll)
> > > >     Video Capture: Frame #058 (epoll)
> > > >     Video Capture: Frame #059 (epoll)
> > > >
> > > >     test MMAP (epoll, CREATE_BUFS): OK
> > > >     test USERPTR (no poll): OK (Not Supported)
> > > >     test USERPTR (select): OK (Not Supported)
> > > >     test DMABUF (no poll): OK (Not Supported)
> > > >     test DMABUF (select): OK (Not Supported)
> > > >
> > > > Total for uvcvideo device /dev/video0: 59, Succeeded: 58, Failed: 1, Warnings: 0
> > > >
> > > > ---
> > > > Changes in v4:
> > > > - Rebased on top of v7.1-rc1
> > > > - Replace usages of filep->private_data with file_to_v4l2_fh()
> > > >   throughout the driver
> > > > - Link to v3: https://lore.kernel.org/r/20250412-virtio-media-v3-1-97dc94c18398@gmail.com
> > > >
> > > > Changes in v3:
> > > > - Rebased on top of v6.15-rc1 and removes obsolete control callbacks.
> > > > - Link to v2: https://lore.kernel.org/r/20250201-virtio-media-v2-1-ac840681452d@gmail.com
> > > >
> > > > Changes in v2:
> > > > - Fixed kernel test robot and media CI warnings (ignored a few false
> > > >   positives).
> > > > - Changed in-driver email address to personal one since my Google one
> > > >   will soon become invalid.
> > > > - Link to v1: https://lore.kernel.org/r/20250123-virtio-media-v1-1-81e2549b86b9@gmail.com
> > > >
> > > > Brian Daniels (8):
> > > >   media: virtio: Add protocol
> > > >   media: virtio: Add virtio-media driver structs and function
> > > >     declarations
> > > >   media: virtio: Add virtio-media session related structures
> > > >   media: virtio: Add scatterlist_builder
> > > >   media: virtio: Add virtio_media_ioctls
> > > >   media: virtio: Add virtio_media_driver
> > > >   media: virtio: Add virtio-media to the build system
> > > >   media: virtio: Add MAINTAINERS entry
> > > >
> > > >  MAINTAINERS                                |    6 +
> > > >  drivers/media/Kconfig                      |   13 +
> > > >  drivers/media/Makefile                     |    2 +
> > > >  drivers/media/virtio/Makefile              |    8 +
> > > >  drivers/media/virtio/protocol.h            |  287 +++++
> > > >  drivers/media/virtio/scatterlist_builder.c |  574 +++++++++
> > > >  drivers/media/virtio/scatterlist_builder.h |  112 ++
> > > >  drivers/media/virtio/session.h             |  130 ++
> > > >  drivers/media/virtio/virtio_media.h        |   95 ++
> > > >  drivers/media/virtio/virtio_media_driver.c |  959 ++++++++++++++
> > > >  drivers/media/virtio/virtio_media_ioctls.c | 1338 ++++++++++++++++++++
> > > >  11 files changed, 3524 insertions(+)
> > > >  create mode 100644 drivers/media/virtio/Makefile
> > > >  create mode 100644 drivers/media/virtio/protocol.h
> > > >  create mode 100644 drivers/media/virtio/scatterlist_builder.c
> > > >  create mode 100644 drivers/media/virtio/scatterlist_builder.h
> > > >  create mode 100644 drivers/media/virtio/session.h
> > > >  create mode 100644 drivers/media/virtio/virtio_media.h
> > > >  create mode 100644 drivers/media/virtio/virtio_media_driver.c
> > > >  create mode 100644 drivers/media/virtio/virtio_media_ioctls.c
> > > >
> > > >
> > > > base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
> >
> >


