Return-Path: <linux-media+bounces-59194-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGwnHVoZ52nT3wEAu9opvQ
	(envelope-from <linux-media+bounces-59194-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 08:29:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30A436F50
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 08:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF9EF300CE45
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 06:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66393845B6;
	Tue, 21 Apr 2026 06:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b="CqPp9Uow"
X-Original-To: linux-media@vger.kernel.org
Received: from cse.ust.hk (cssvr7.cse.ust.hk [143.89.41.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7481F5821;
	Tue, 21 Apr 2026 06:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=143.89.41.157
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776752849; cv=pass; b=ihSiXFoBm4+wNqk9bYU382eZrUjhMcVFiKcp46xF+tIlgw8YM5CVhql4TRySZPVssaxaIN3GqQySXdVFmCqYVOkKsAcZOid3Cw+gLT0ltd0SpaSGa9GqSEs3zLJAO6tSqZSeFIjsYcAxQyxWY0gaa3Eprjl62aNpwrp2KIKtr5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776752849; c=relaxed/simple;
	bh=8M9d/bByhJUaNN5Itg9WkVkfc6oybZO3x/00QJGCbcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3ds67UX0DMAIbgPFHrcVf8y5zgxVRK981UH7cevYPRDbSmNtPp62TafNRzd2hfN16qqPQ114lZkSmJ1qXIlhm38Ts5BEc22lNXqUtXYRwtGP7l2afu7Hk8iOEukz5Vx8NkqwnFxfhHRbQBqBKWxrgq64ZeUY1ts4Q58b/xYSU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk; spf=pass smtp.mailfrom=cse.ust.hk; dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b=CqPp9Uow; arc=pass smtp.client-ip=143.89.41.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.ust.hk
ARC-Seal: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256; cv=none; t=1776752840;
	b=QcC4AGRcavL6+eoJQOzmwBsZfzpnAR9DgHuK/PB4u9EcvembR746PpK2dzlRwk3YUq77
	 UC4OJ+ACihMQ0DTkXqgiDCSFwmMxNcG0CR50v6VlEayo+YScLAnkucmDIM8aiS6tWHTtd
	 JKoy5TMe8S4LunZDxpxBRMOTy2WexZhsQA=
ARC-Message-Signature: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256;
	c=relaxed/relaxed; t=1776752840;
	h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version;
	bh=/Qk/jV+3+8hL+4U92zgRELVLaYTe5Rxdl5O/PzlWOeA=;
	b=SfdD88t+RaUR2V5faq1+Rbi5Uy3C5uozBt9UhCk7YAN7jSmwoQyS21ZGOpS5EpCTJVd1
	 JHLZvgCZhHOdQw0coqG/ak36J2hWhuXtrb+oeUUG8Gv0JI/yVHEmOvmlrYQlIPcEURQke
	 AOBQjRAe3YVtjzr8quoJ6gRE6arDMZ4R9w=
ARC-Authentication-Results: i=1; cse.ust.hk; arc=none smtp.remote-ip=143.89.191.45
Received: from chcpu16 (191host045.mobilenet.cse.ust.hk [143.89.191.45])
	(authenticated bits=0)
	by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 63L6RDxG894643
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 14:27:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
	s=cseusthk; t=1776752840;
	bh=/Qk/jV+3+8hL+4U92zgRELVLaYTe5Rxdl5O/PzlWOeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CqPp9UowPh3kjRVFadGLEPLmPyAknfZ6+E8aNLdepGZidQJ8OeJXreTGp02LUgrzz
	 uceG0TgCpjVJUL+6JKLli39jjkq1s1+fXLbXUigOX3frhJl9xivEekyIg676Xr9GwC
	 W1sSVqi67kRsUIeyciYWcb4n/6kExP4Wa8dCflKU=
Date: Tue, 21 Apr 2026 14:27:08 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rzg2l-cru: serialize state transitions with qlock
Message-ID: <20260421062708.GA2548544@chcpu16>
References: <20260421060307.GA2522920@chcpu16>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421060307.GA2522920@chcpu16>
X-Env-From: sfual
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cse.ust.hk,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cse.ust.hk:s=cseusthk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59194-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sfual@cse.ust.hk,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[cse.ust.hk:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cse.ust.hk:dkim]
X-Rspamd-Queue-Id: CD30A436F50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Here is the best reproduction detail I could put together locally.

From source review, I think there are two windows where process-context
state updates can overlap the IRQ handler's reads of `cru->state`:

- on streamoff, `rzg2l_cru_stop_streaming()` stores `STOPPING` before
  it calls `rzg2l_cru_set_stream(cru, 0)`, while interrupts are only
  disabled later in `rzg2l_cru_stop_image_processing()`
- on streamon, `rzg2l_cru_start_image_processing()` enables interrupts
  before `rzg2l_cru_set_stream(cru, 1)` returns, while
  `rzg2l_cru_start_streaming_vq()` stores `STARTING` only after that

I do not have an RZ/G2L board or an arm64/QEMU model for this CRU
block, so I could not reproduce either path from a real userspace V4L2
stream on actual hardware. The setup below is only the best local
reference proof I could produce in this environment. It is not a claim
of a natural hardware-backed repro.

Locally, I targeted the streamoff-side `STOPPING` vs IRQ overlap.

1. Build a KCSAN/KUnit kernel with the dedicated config fragment:

   ./tools/testing/kunit/kunit.py build \
     --arch=x86_64 \
     --kunitconfig=kernel/kcsan/rzg2l_cru.kunitconfig \
     --build_dir=../out-rzg2l-kunit-red2 \
     --make_options CC=clang-20 \
     --make_options LD=ld.bfd \
     --make_options AR=llvm-ar-20 \
     --make_options NM=llvm-nm-20 \
     --make_options OBJCOPY=llvm-objcopy-20 \
     --make_options READELF=llvm-readelf-20 \
     --make_options LLVM_IAS=1 \
     --jobs 8

2. Boot that kernel under QEMU:

   timeout 90 qemu-system-x86_64 \
     -m 1024 \
     -kernel out-rzg2l-kunit-red2/arch/x86/boot/bzImage \
     -append 'kunit.filter_glob=kcsan.test_rzg2l_cru_state_stop_vs_irq* kunit.enable=1 console=ttyS0 kunit_shutdown=reboot' \
     -no-reboot \
     -nographic \
     -accel tcg \
     -smp 4

3. The KUnit/KCSAN test creates a fake `rzg2l_cru_dev`, records the
   address of `cru->state`, and then runs two worker sides concurrently:

   - writer side: `test_rzg2l_cru_kunit_stop()`, which just calls the
     real `rzg2l_cru_stop_streaming()`
   - reader side: `test_rzg2l_cru_kunit_irq()`, which seeds minimal
     fake MMIO state and then calls the real `rzg2l_cru_irq()`

So the harness does not invent a fake state variable or a fake reader.
It only provides enough fake object/MMIO state for the real driver code
to run on x86 and reproduce the stop-side overlap in a controlled way.

With that setup I got repeated KCSAN reports of:

   BUG: KCSAN: data-race in rzg2l_cru_irq / test_rzg2l_cru_kunit_stop

The first hit in my local log was:

   write to 0xffff9bd4c1c03cf4 of 4 bytes by task 54 on cpu 0:
    test_rzg2l_cru_kunit_stop+0x14/0x30
    test_kernel_rzg2l_cru_stop+0x20/0x30
    access_thread+0x93/0xe0

   read to 0xffff9bd4c1c03cf4 of 4 bytes by task 53 on cpu 3:
    rzg2l_cru_irq+0x110/0x2d0
    test_rzg2l_cru_kunit_irq+0x4d/0x60
    test_kernel_rzg2l_cru_irq+0x20/0x30

The same run then hit the same race again in the 3-thread and 4-thread
variants, still on the same 4-byte `state` address and still with the
same writer/reader pair.

Thanks,
Shuhao


On Tue, Apr 21, 2026 at 02:03:26PM +0800, Shuhao Fu wrote:
> struct rzg2l_cru_dev.state is documented as protected by qlock, and the
> IRQ path already reads and updates it under that lock. However,
> rzg2l_cru_stop_streaming() writes STOPPING and
> rzg2l_cru_start_streaming_vq() writes STARTING without taking qlock.
> 
> That lets process-context stream control race with rzg2l_cru_irq().
> If the IRQ handler misses a concurrent STOPPING update, it can continue
> normal frame completion and slot refill after streamoff has begun. A
> similar race around STARTING can make the IRQ path observe the wrong
> phase during startup synchronization.
> 
> Fix both state transitions by serializing the writes with qlock, while
> still keeping rzg2l_cru_set_stream() outside the locked region.

