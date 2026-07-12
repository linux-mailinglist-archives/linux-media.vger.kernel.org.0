Return-Path: <linux-media+bounces-67383-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YJfMMvg9U2rXZAMAu9opvQ
	(envelope-from <linux-media+bounces-67383-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 09:10:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B8E744096
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 09:10:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YdB3Anbc;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67383-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67383-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF2D73012BC9
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 07:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6561E372075;
	Sun, 12 Jul 2026 07:10:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52DA352C35;
	Sun, 12 Jul 2026 07:10:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783840243; cv=none; b=E2sKlGZjXuDI6cXVkf2Ub3f3lA5Akx/iYidbiozXo4gEurCRGHdg/LiijfT06T67/px0JWsLQvTxv1bgYZCs7Ysb2UYML/BLSOzP8b/l0ZIsaRI0WLrCkrjgQqfEjHrTYSWHBpiZwxqQKdGqoJBlmSXpwQNXx+qSbu+7sU6l8GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783840243; c=relaxed/simple;
	bh=ewZwKx8MO5dqB+JlWtw6uwySbY+raeNAfe0OrBOf7kU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ex/ndtHje31RbepxxN0gYlY23vGbc+r6wU1URQJCZBuPsj0IrrqDU48EC67aeRuQ6GsZhosDcmCxSuRDb2SFMhyPB5I5Liug++Lo/gMBOkaB1z/oOWro1Z7/9F9j7qUCEEPXSVYwwakfhvnEd3kgnyINmQ8Z6Re6zLyEyposv/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdB3Anbc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E019D1F000E9;
	Sun, 12 Jul 2026 07:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783840242;
	bh=HhnMoXP32pcQQfm7pYPdDLSgY8bpdim9TS9niEyNijk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YdB3Anbcn61g6KsA0UhNJHc2ow1QuO6UFacVyRw1FRNGJvCL/m+PKRMw6UrVXMuJa
	 grVMm3z6xC8peoV8DPNbfoZfqTi0LaJWRRbkkO7s64gPz4p95my+8LUqqS35mSm5Df
	 pt+Bi7N20MSi9URHUHJLiIOJRD3elajiiZvKYgyok4+ufwn5xayjjQpPdf8qYeFg7T
	 7XyohuXbDpLzw3DZWgMyztBwQ4K/SCLByHTl+IbH4J0piwg3HJ9lRvm9VNtW1Q/YJs
	 SAu3CsCL6OCf+RUUOPtD1IlbnGyB6FW80mDBnK0eM+pqP6cDnYJOz0o0GmuJi77Fts
	 zfc07N2ZEgbIQ==
Date: Sun, 12 Jul 2026 09:10:36 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com,
 adelva@google.com, aesteve@redhat.com, changyeon@google.com,
 daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com,
 gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mst@redhat.com,
 nicolas.dufresne@collabora.com, virtualization@lists.linux.dev,
 xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v4 0/8] media: add virtio-media driver
Message-ID: <20260712091036.5b0f170c@foz.lan>
In-Reply-To: <20260622204343.1994418-1-briandaniels@google.com>
References: <20260622204343.1994418-1-briandaniels@google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:briandaniels@google.com,m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mst@redhat.com,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67383-lists,linux-media=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,foz.lan:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22B8E744096

On Mon, 22 Jun 2026 16:43:35 -0400
Brian Daniels <briandaniels@google.com> wrote:

> From: Alexandre Courbot <gnurou@gmail.com>
> 
> Add the first version of the virtio-media driver.
> 
> This driver acts roughly as a V4L2 relay between user-space and the
> virtio virtual device on the host, so it is relatively simple, yet
> unconventional. It doesn't use VB2 or other frameworks typically used in
> a V4L2 driver, and most of its complexity resides in correctly and
> efficiently building the virtio descriptor chain to pass to the host,
> avoiding copies whenever possible. This is done by
> scatterlist_builder.[ch].
> 
> This version supports MMAP buffers, while USERPTR buffers can also be
> enabled through a driver option. DMABUF support is still pending.

In practice, USERPTR was used on several drivers that wanted to
share buffers between V4L2 and GPU (so, a previous approach before
DMABUF implementation).

On my tests with this driver, I was unable use a 1080p camera with
V4L2 and GPU on crossvm. Lower resolutions worked. No idea if this
was a limitation of crossvm (I only used it to test this driver)
or if it is due to a poor MMAP implementation.



> Compliance Testing
> 
> This was tested using v4l2-compliance. Since virtio-media serves as
> a proxy to host devices for the guest VMs, we expect the guest
> compliance test to essentially match the host compliance test for the
> same device.
> 
> NOTE: v4l2-compliance changes its test behavior depending on the driver
> name. In the guest, the driver name for virtio-media proxied-devices is
> always "virtio-media", even if the actual host device has a driver name
> of e.g. "uvcvideo". To ensure the test is consistent between the host
> and the guest, I created a patch for the v4l2-compliance tool that
> allows you to override the driver name. All test results that follow use
> this patch:
> https://lore.kernel.org/r/20260528163448.4031965-1-briandaniels@google.com/

As mentioned before, please submit this with their rationale in
separate as a [PATCH v4l-utils] to linux-media ML.

> 
> All tests used a Logitech USB Webcam C925e.

Please test it displaying inside crossvm - or even better to QEMU if 
you manage to add virtio-media support to it.

Being at QEMU makes a lot easier for everyone to test it.


Thanks,
Mauro

