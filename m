Return-Path: <linux-media+bounces-67427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jUGUOSGNVGronAMAu9opvQ
	(envelope-from <linux-media+bounces-67427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:00:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA0F747C24
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:00:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=RwDhEm8y;
	dkim=pass header.d=redhat.com header.s=google header.b=IcAfwHCx;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67427-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67427-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF0CE30237CC
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 07:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B9E36920D;
	Mon, 13 Jul 2026 07:00:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF65F3659FD
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 07:00:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783926027; cv=pass; b=sjdpXy8+YId4Gn9hpAdafxrgb73UNNYAbJJryXSzLRZj31HjWTzkLGVjMusEiWw8zaplSkUOyeKNVQetw/c3hE+it8615M8gLRCibXwZAGL3RQ28WwN9zbqMHBCKqz3QCQGhDrD0qVRND8YG1LoWVUyqii6WiCsgLXs+m3L883M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783926027; c=relaxed/simple;
	bh=eC5GpoKfKxvsELUEqf2RNXAik2cyFhLNi3JDYAbcpUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JU+45nf0TlMzeLQigJTJ5HszoDewKLGnpaIDb3dJZFGjhHJ2gr+08EBePVNswctzlckZtsuZqBvEeaJLLXSPxJjmLplVc9o4LsXg//tuUdlzr8XkgYJDw9w9pasHZEyr7KD540EbYvE8nrOtLtnyIaiSweLj4nbAzwmt8mwi84c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RwDhEm8y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IcAfwHCx; arc=pass smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783926024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eC5GpoKfKxvsELUEqf2RNXAik2cyFhLNi3JDYAbcpUs=;
	b=RwDhEm8yZRE17qnM6YPg/QRFGF8JCT37vu0E1TUdcYLdQzGam6yb3jNIDgqD6CxwuheDde
	7o0lTccHx9og6DqkvIWAz1oqsfq+aCZ/r6eo4rnZ2hbBACaeFnhT9roMJ69uWdkgrTtYZW
	CNPk0rWRQP2Ztdm5mJv/qpxyvfXdaPQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-vt7Ew-t8NV-diRv4xIwBGQ-1; Mon, 13 Jul 2026 03:00:21 -0400
X-MC-Unique: vt7Ew-t8NV-diRv4xIwBGQ-1
X-Mimecast-MFC-AGG-ID: vt7Ew-t8NV-diRv4xIwBGQ_1783926021
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e76f0dec0so72590407b3.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 00:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783926021; cv=none;
        d=google.com; s=arc-20260327;
        b=b8gff6YcoedzRtlAU/ScCNgysMGuaixQRWCabR3TSxFDvWlJhLwGMkN/jSF/5ZtISZ
         wg4JUclWaW4Sn0+iIsfLUnpNix1kORo/2nlccecQ0iZA+jwNBeNp3A9uryrRrsDwfhFk
         LHdLyBvowaX9Z5f3IIwPofkkerC5BLFlGbHX6KdggYyQyf/MXRs4Mae2UcUAtjMR0Uta
         PdAgliIpjdQFhE7Rsl7ptvVQzocZl5+FbDqRaozCpX1A/4hmgONXg5Xg/OYvrLf7COm6
         HFusqXBYs5CHbf0XCHTtEQpE6yai8PFgCSUsvwXE8nTp/k54FsGlMrE/XPScKWVdqjay
         LfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eC5GpoKfKxvsELUEqf2RNXAik2cyFhLNi3JDYAbcpUs=;
        fh=g8giq9UPfmqnMdmU2RXTR7m8k+Tx2miCWmeLC532tmU=;
        b=J/x/TRhhz67rB5mlunKn/e5PRX+xRmHeH251w5xSdM2qxewe1ctH/GQUDY3U0porr6
         uzITdqd8ZMu6mYKPMzO/otHFrHEU3QelngSPoCp4K623595ivCc7j29UICT2i8q/8urc
         Y3mnfaAxcNKLDtBQbaZanmrPyws+IwJWfHaXS4ddS5ixlTBASJo45kjMFD/weK8uA0/t
         rL8aTA/WLzNkQjmOXHjlWWr3vxD810mFyyNewB9Tt1ZFTIVxVpeGxj3mW134kUDOly8P
         dECATTYPPhMjV1CcDF2noy6xDuU4jDYbmeBATH+9sCpqgBsMm0bOodIdKem5TfpR1lba
         yR4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783926021; x=1784530821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eC5GpoKfKxvsELUEqf2RNXAik2cyFhLNi3JDYAbcpUs=;
        b=IcAfwHCxex4/lu1HfDTQujc9UyNLjfnxCdcRseQOBMXO7uo8XGYEl1JI5HkIFfTmfb
         6NSNdquCX/idBnAo0CRbENA3FPuMHG1BfV/Y6ToFd0/prWvo6sEO+MV3sFb0YWn78srP
         hJAG06EykHqJBP797lPa/1dO36yUCxM/bd/K1pyBk57ICPNWUv1UopAFMjl34JUDjo2Q
         ZI2W09iveY4eOjzA62LukPpJDI/Cca7MHxZ12sRZiqfWuz7V+b8XeWgru/xNIz9/OaA5
         LMM3TBlWO2JkGoc/h7azvwSv+DXox4NfZMMX6t6zBh4X/3T0b8ci/AhtcKLxMd+1aumx
         wdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926021; x=1784530821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC5GpoKfKxvsELUEqf2RNXAik2cyFhLNi3JDYAbcpUs=;
        b=LDzTUBGJ85JsyR//ZBp6q0Ufk1QKjEQr3K/8G+T6BuCYGfd/Mcuqtdle2c9h9PjEiD
         8+Ge6RHeCXL4zUUJyvo1jm89To/N/uCdJ+qGKfJP/LmTX/ZOP05a5aKfh/fWu6iv7ZrG
         NcU2e1i+qZz6zC8XBXQs2mbCaa2K4MNKqrQh59daLe7zOLGa/yRcMZqTXt+F9MGKBzcL
         xWDRV/UelyxO6YHqyLbvXYLdgQwP9pJpLk/s8fdjRmW2yvRn2dAvdlXYsoWhea4w8B2c
         tksCvnTLps4ruF+TXXCgkdBhIJLsidSae1SU9qrQe0tiP2zXZoffkepthcrENDl+wBdW
         kFgw==
X-Forwarded-Encrypted: i=1; AHgh+RpeGIR5qtacZQvUDVY1hpP+wgtf7rEhAewHb07Bf3nQAWwVl3RDdNVQ0Ymw39rB+U70zL7mXR6l8/KRPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWskgdRvYbDJ2MBywDdLrEJnqw8xrBC/40U4FhNm+GOXWRyEjl
	Xua6vC+3Od+szfVlf8lpL30nRVpgeXLAZkuPJwpogSVrtO4hAYgdfmJywGyi/m5mOP2g3IOaSaE
	xq6NcZyS/svASmlNmvyNIuWLJnR1ykdm/8ewBXonKqR59FE8DTaYRnmcNl3qo32+AvlFAkSPkcS
	DeMbvHY/3d2gqjBxnZIrE8y4AADmvsTo+G3nFVfLQ=
X-Gm-Gg: AfdE7cmBEq0AdxfJJXW2T+o9+KOQGjmYdGAFGdJBt4VsNomCuVImwN1B2KV09mkWQuJ
	0Sko8SgNAkYHZrcpMh/HRSzShrPdAdpgdx8P8r9xnvR6VZmpv00Sv9zNIeCBhHGJ29aFSkuPjfS
	ocNbem+/m4wfFkNOf2mXWg6Mwj5ENnSq5T0EWLonoQlicoHZwoR2yrXr9bprRvJ9Otwas=
X-Received: by 2002:a05:690c:6f03:b0:80e:dc2:873b with SMTP id 00721157ae682-81e9073d1efmr51155437b3.16.1783926020737;
        Mon, 13 Jul 2026 00:00:20 -0700 (PDT)
X-Received: by 2002:a05:690c:6f03:b0:80e:dc2:873b with SMTP id
 00721157ae682-81e9073d1efmr51155287b3.16.1783926020220; Mon, 13 Jul 2026
 00:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622204343.1994418-1-briandaniels@google.com> <20260712091036.5b0f170c@foz.lan>
In-Reply-To: <20260712091036.5b0f170c@foz.lan>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 13 Jul 2026 09:00:08 +0200
X-Gm-Features: AVVi8CeRKs7MaGFl4VgdlnIBfaYMvYk4BjPSu6rUnReNBedWrQaBg8R849tbmoo
Message-ID: <CADSE00JkzGmN8Hvo1fuAsO1o9TKMrPwpmag-dtcFH1+NvkP6HA@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] media: add virtio-media driver
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Brian Daniels <briandaniels@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com, 
	adelva@google.com, changyeon@google.com, daniel.almeida@collabora.com, 
	eperezma@redhat.com, gnurou@gmail.com, gurchetansingh@google.com, 
	hverkuil@xs4all.nl, jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67427-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab+huawei@kernel.org,m:briandaniels@google.com,m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mst@redhat.com,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,kernel.org,collabora.com,redhat.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AA0F747C24

On Sun, Jul 12, 2026 at 9:10=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> On Mon, 22 Jun 2026 16:43:35 -0400
> Brian Daniels <briandaniels@google.com> wrote:
>
> > From: Alexandre Courbot <gnurou@gmail.com>
> >
> > Add the first version of the virtio-media driver.
> >
> > This driver acts roughly as a V4L2 relay between user-space and the
> > virtio virtual device on the host, so it is relatively simple, yet
> > unconventional. It doesn't use VB2 or other frameworks typically used i=
n
> > a V4L2 driver, and most of its complexity resides in correctly and
> > efficiently building the virtio descriptor chain to pass to the host,
> > avoiding copies whenever possible. This is done by
> > scatterlist_builder.[ch].
> >
> > This version supports MMAP buffers, while USERPTR buffers can also be
> > enabled through a driver option. DMABUF support is still pending.
>
> In practice, USERPTR was used on several drivers that wanted to
> share buffers between V4L2 and GPU (so, a previous approach before
> DMABUF implementation).
>
> On my tests with this driver, I was unable use a 1080p camera with
> V4L2 and GPU on crossvm. Lower resolutions worked. No idea if this
> was a limitation of crossvm (I only used it to test this driver)
> or if it is due to a poor MMAP implementation.
>
>
>
> > Compliance Testing
> >
> > This was tested using v4l2-compliance. Since virtio-media serves as
> > a proxy to host devices for the guest VMs, we expect the guest
> > compliance test to essentially match the host compliance test for the
> > same device.
> >
> > NOTE: v4l2-compliance changes its test behavior depending on the driver
> > name. In the guest, the driver name for virtio-media proxied-devices is
> > always "virtio-media", even if the actual host device has a driver name
> > of e.g. "uvcvideo". To ensure the test is consistent between the host
> > and the guest, I created a patch for the v4l2-compliance tool that
> > allows you to override the driver name. All test results that follow us=
e
> > this patch:
> > https://lore.kernel.org/r/20260528163448.4031965-1-briandaniels@google.=
com/
>
> As mentioned before, please submit this with their rationale in
> separate as a [PATCH v4l-utils] to linux-media ML.
>
> >
> > All tests used a Logitech USB Webcam C925e.
>
> Please test it displaying inside crossvm - or even better to QEMU if
> you manage to add virtio-media support to it.
>
> Being at QEMU makes a lot easier for everyone to test it.

Hi,

Regarding the QEMU support mention, I created this series in QEMU to
add the virtio-media PCI device:
https://lore.kernel.org/all/20260630112310.552606-1-aesteve@redhat.com/

Testing was done using an older driver version at
https://github.com/chromeos/virtio-media/tree/main/driver as described
in the cover letter. But I can try testing it with this series. Either
way, the procedure for using QEMU is in the cover letter, so anyone
can try it.

BR,
Albert.

>
>
> Thanks,
> Mauro
>


