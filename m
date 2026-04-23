Return-Path: <linux-media+bounces-59406-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBmQGV0b6mmUuQIAu9opvQ
	(envelope-from <linux-media+bounces-59406-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:15:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E764529F0
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 460FD3048EC4
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 13:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE6A3EF66A;
	Thu, 23 Apr 2026 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b="WCb77Kw1"
X-Original-To: linux-media@vger.kernel.org
Received: from cse.ust.hk (cssvr7.cse.ust.hk [143.89.41.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C883EF649;
	Thu, 23 Apr 2026 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=143.89.41.157
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949802; cv=pass; b=NiTJ8NxtbMQPbekEcofbsGJVANnrYoVebpLgAoTyJwb08W6etsO3Y/wfa0L2nz0QefL+xygsPA0ct82uYo7mz/UauuCSUyRWcuRxgU2MEL002Aa7x+dYD2bQ/IPSzZVmZPyrOfYto06mbscGG3QxXxq2YoWj1ef8PAD5cKPwwNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949802; c=relaxed/simple;
	bh=ILHuQf/n09d4Jg9FCjdPE2wVeODXawLsyuECrjrv5rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOYD+fLF9U2ua9IWaVvB4+FAKZYU3SobH112259GROPjvmR8EKnVeENq1Hvb1kjvHAVsMtdbUn11zIKNPEd/aJX3AzA3uPWI96cjLhXpbTh/Fyx24kRfyc2UmWEsqTb35ChTXOMsikEACWItZ8HoWLu4fQHKa5Q2ZA7AsYGAB+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk; spf=pass smtp.mailfrom=cse.ust.hk; dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b=WCb77Kw1; arc=pass smtp.client-ip=143.89.41.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.ust.hk
ARC-Seal: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256; cv=none; t=1776949791;
	b=qpRVKkPqQgmC1sp8ZKCPrMvcb7QO93cfu/toIRHkypg9S/qe2wZiesCstWpP81WQHlZ2
	 gI7NgdX/xTycj8wvZSPX92BaIPMal9v4DmFtz1FklvL2XlZYKwETRq4ufEzBOLLt2yRsN
	 QL2GbAKLylJISsHIqiAnituv2wkpxOa9Go=
ARC-Message-Signature: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256;
	c=relaxed/relaxed; t=1776949791;
	h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version;
	bh=/3CVjjoeHzmnp3Be+kyhiFiCjKIHnhlYRgWFn//PY2M=;
	b=NBOR7PV4YynfNLwe6iabhkNvIGHVAMm9aXIpMC9LNQ4ztLMNiChZoDWr8zPSV0qIRVjL
	 KjlDuRwejzypBfdiQ0P9xA31Jv5fXQe9OZrvlE57IK6+HlBH/Sz4XaFqapU+ZfgoEjKOC
	 stcUjbJAsBXqE2R4oWFJuV3sKm3fj3J1Kw=
ARC-Authentication-Results: i=1; cse.ust.hk; arc=none smtp.remote-ip=143.89.191.45
Received: from chcpu16 (191host045.mobilenet.cse.ust.hk [143.89.191.45])
	(authenticated bits=0)
	by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 63ND9gVf1723879
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 21:09:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
	s=cseusthk; t=1776949791;
	bh=/3CVjjoeHzmnp3Be+kyhiFiCjKIHnhlYRgWFn//PY2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCb77Kw183scZUlVVECv6hjhuzGx/7hqfMLE5GyQuQvNu0xZeeA4ZCrqRaO7wUSWo
	 tPplrA7G1fviKySTxhjYEWYkYMKhjz8OubIifn9smytJmEAXxu3CxVuc4tnUVxp5pf
	 SRDqLLZ/GjAEjeWRx9VvHgESjODlX2davyR12168=
Date: Thu, 23 Apr 2026 21:09:37 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tw686x: hold dev->lock during streamoff DMA
 disable
Message-ID: <20260423130937.GA1901524@chcpu16>
References: <20260423130237.GA1894228@chcpu16>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423130237.GA1894228@chcpu16>
X-Env-From: sfual
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cse.ust.hk,none];
	R_DKIM_ALLOW(-0.20)[cse.ust.hk:s=cseusthk];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59406-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cse.ust.hk:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sfual@cse.ust.hk,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E2E764529F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Below is the local KUnit/KCSAN setup I used to reproduce the TW686x
warning.

I do not have a TW686x board or a QEMU device model for this chip, so
this is not a hardware-backed userspace repro. This setup is only my
best-effort local reference for the race.

To stay as close as possible to the real userspace trigger, I moved the
writer side up to the same internal callback reached by
VIDIOC_STREAMOFF: tw686x_stop_streaming(). The reader side stayed the
real tw686x_dma_delay() timer callback, which consumes and clears
pending_dma_en / pending_dma_cmd under dev->lock.

Locally, I used the existing kernel/kcsan/tw686x_dma_race.kunitconfig
setup, but rebuilt it with stricter KCSAN settings:

- CONFIG_KCSAN_STRICT=y
- CONFIG_KCSAN_INTERRUPT_WATCHER=y
- CONFIG_KCSAN_REPORT_ONCE_IN_MS=0
- CONFIG_KCSAN_SKIP_WATCH=100
- CONFIG_KCSAN_SKIP_WATCH_RANDOMIZE=n
- CONFIG_KCSAN_UDELAY_TASK=200
- CONFIG_KCSAN_UDELAY_INTERRUPT=100
- CONFIG_KCSAN_DELAY_RANDOMIZE=n

The build command was:

  ./tools/testing/kunit/kunit.py build \
    --arch=x86_64 \
    --kunitconfig=kernel/kcsan/tw686x_dma_race.kunitconfig \
    --build_dir=../out-tw686x-kcsan-kunit-strict \
    --make_options CC=clang-20 \
    --make_options LD=ld.bfd \
    --make_options AR=llvm-ar-20 \
    --make_options NM=llvm-nm-20 \
    --make_options OBJCOPY=llvm-objcopy-20 \
    --make_options READELF=llvm-readelf-20 \
    --make_options LLVM_IAS=1 \
    --jobs 8

Then I booted only the focused TW686x disable-vs-delay test under QEMU:

  timeout 120 qemu-system-x86_64 \
    -smp 8 \
    -m 2048 \
    -kernel out-tw686x-kcsan-kunit-strict/arch/x86/boot/bzImage \
    -append 'kunit.filter_glob=kcsan.test_tw686x_pending_dma_disable_vs_delay kunit.enable=1 console=ttyS0 kunit_shutdown=reboot' \
    -nographic \
    -no-reboot

The KUnit harness uses a fake tw686x_dev plus a minimal fake
tw686x_video_channel and vb2_queue, so the writer side can call the
real tw686x_stop_streaming() path instead of jumping straight into
tw686x_disable_channel(). The internal call chain is:

- writer side:
  test_kernel_tw686x_stop_streaming()
  -> test_tw686x_kunit_stop_streaming()
  -> tw686x_stop_streaming()
  -> tw686x_disable_channel()

- reader side:
  test_kernel_tw686x_dma_delay()
  -> test_tw686x_kunit_dma_delay()
  -> tw686x_dma_delay()

With that setup I got repeated KCSAN reports of:

  BUG: KCSAN: data-race in test_tw686x_kunit_dma_delay / tw686x_disable_channel

The first clean hit in my local log was:

  read to 0xffff8f55021d7910 of 4 bytes by interrupt on cpu 5:
   test_tw686x_kunit_dma_delay+0x3c/0x110
   test_kernel_tw686x_dma_delay+0x29/0x40
   ...
   tw686x_disable_channel+0x1e8/0x200
   tw686x_stop_streaming+0x81/0x1e0
   test_tw686x_kunit_stop_streaming+0x22/0x30
   test_kernel_tw686x_stop_streaming+0x29/0x40

  write to 0xffff8f55021d7910 of 4 bytes by task 83 on cpu 5:
   tw686x_disable_channel+0x1e8/0x200
   tw686x_stop_streaming+0x81/0x1e0
   test_tw686x_kunit_stop_streaming+0x22/0x30
   test_kernel_tw686x_stop_streaming+0x29/0x40

I then saw the same pair again later in the same run, still with
tw686x_stop_streaming() in the writer stack and
test_tw686x_kunit_dma_delay() on the reader side.

Again, this KUnit result is a local reference and best-effort proof of
the overlap, not a claim of a full hardware-backed userspace repro.

Thanks,
Shuhao

On Thu, Apr 23, 2026 at 09:05:42PM +0800, Shuhao Fu wrote:
> tw686x_dma_delay() consumes and clears dev->pending_dma_en /
> dev->pending_dma_cmd under dev->lock before replaying that deferred DMA
> image to the hardware registers. tw686x_disable_channel() updates the
> same fields. Most call sites serialize tw686x_disable_channel() with
> dev->lock, but tw686x_stop_streaming() is the exception: it checks
> dev->pci_dev under dev->lock, drops the lock, and then calls
> tw686x_disable_channel().
> 
> If dma_delay_timer fires in that window, the timer path can race the
> streamoff disable path and consume stale or partially updated pending
> DMA state. This can leave deferred DMA programming out of sync with the
> requested stream stop, so STREAMOFF may not immediately reflect the
> intended channel-disable state.
> 
> Fix with holding dev->lock across the stop-side pci_dev check and
> tw686x_disable_channel() call, so VIDIOC_STREAMOFF follows the same
> locking contract as the other channel enable/disable paths.

