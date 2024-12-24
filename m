Return-Path: <linux-media+bounces-24031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B2B9FBB26
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 10:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61FA91636D6
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 09:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DA31B2180;
	Tue, 24 Dec 2024 09:28:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9951C1ADFE3;
	Tue, 24 Dec 2024 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735032525; cv=none; b=qzhKJRHrrt86nqCKV23B96cHF3Zj4h6vJoXxI1XSpkrM26taTUtjzoMENhemSmsgWHgN+jAua37WyT1/fWOUossleZUmQ/DZzrviQ33QcaiI9sJ/lNp51d+VNKa2QDBvmMLwJi/70BfnhWvvwJbIu4fWzc2IlGkstRKHW6KwVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735032525; c=relaxed/simple;
	bh=iMruZDV4VOq/Cq/2W4TU5FA/fF49BGnBYt6mjD7mnDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2zMJUAycUTTCBsSPsqlmq/Bh3O2tPAJsSG1SKb8VrN1l7PX0dI0XVFOU8Gv4J9/T9amSGYH1NbloC/sI/o/J4f8So0xBgajsKgayiKzaEcUX2oeGciURbYssYBU8k7VxkN3pUykQqW+K3J0ywuECxh9bslSZuvN46FOAWEkSVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id B069D100DECA6;
	Tue, 24 Dec 2024 10:28:31 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 7E7CC35A1CC; Tue, 24 Dec 2024 10:28:31 +0100 (CET)
Date: Tue, 24 Dec 2024 10:28:31 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: simona.vetter@ffwll.ch, Jens Wiklander <jens.wiklander@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <Z2p-v-xjhzhPso6u@wunner.de>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>

On Tue, Dec 24, 2024 at 12:05:19PM +0530, Sumit Garg wrote:
> Restricted memory is a feature enforced by hardware specific firewalls
> where a particular TEE implementation governs which particular block
> of memory is accessible to a particular peripheral or a CPU running in
> a higher privileged mode than the Linux kernel.
[...]
> - Another possible use-case can be for the TEE implementation to store
> key material in a restricted buffer which is only accessible to the
> hardware crypto accelerator.

Just a heads-up:

For RSA sign/verify operations using rsassa-pkcs1 encoding,
the message to be signed/verified (which I understand could
be located in restricted memory) is prepended by a padding.

The crypto subsystem does the prepending of the padding in software.
The actual signature generation/verification (which is an RSA encrypt
or decrypt operation) may be performed in hardware by a crypto
accelerator.

Before commit 8552cb04e083 ("crypto: rsassa-pkcs1 - Copy source
data for SG list"), the kernel constructed a scatterlist
consisting of the padding on the one hand, and of the message
to be signed/verified on the other hand.  I believe this worked
for use cases where the message is located in restricted memory.

However since that commit, the kernel kmalloc's a new buffer and
copies the message to be signed/verified into it.  The argument
was that although the *kernel* may be able to access the data,
the crypto accelerator may *not* be able to do so.  In particular,
portions of the padding are located in the kernel's .rodata section
which is a valid virtual address on x86 but not on arm64 and
which may be inaccessible to a crypto accelerator.

However in the case of restricted memory, the situation is exactly
the opposite:  The kernel may *not* be able to access the data,
but the crypto accelerator can access it just fine.

I did raise a concern about this to the maintainer, but to no avail:
https://lore.kernel.org/r/Z1Kym1-9ka8kGHrM@wunner.de/

This is the alternative solution I would have preferred:
https://lore.kernel.org/r/3de5d373c86dcaa5abc36f501c1398c4fbf05f2f.1732865109.git.lukas@wunner.de/

> I am also in favour of end to end open source use-cases. But I fear
> without progressing in a step wise manner as with this proposal we
> would rather force developers to upstream all the software pieces in
> one go which will be kind of a chicken and egg situation. I am sure
> once this feature lands Mediatek folks will be interested to port
> their secure video playback patchset [3] on top of it. Similarly other
> silicon vendors like NXP, Qcom etc. will be motivated to do the same.

The crypto use case may be easier to bring up than the video decoding
use case because you don't need to implement a huge amount of
user space code.

Thanks,

Lukas

