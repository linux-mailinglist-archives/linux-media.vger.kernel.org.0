Return-Path: <linux-media+bounces-24825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AECEAA130E8
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 02:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C686E165FCD
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 01:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C942F3D97A;
	Thu, 16 Jan 2025 01:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltckbMT0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1901DA31;
	Thu, 16 Jan 2025 01:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736992015; cv=none; b=mc5ZEzV1ReuejhXbJv3RwNvZ0hWahGZZjCjjYhgXLcZRbjlWjBnITO6eb6CZO8Cw2tOiMIkIZ6qb1RLhY6q1nDpBnXDD3kOmd2H1Fnu5CiAKZapLSuNT+G5/3N1ocTj58U0M0UsNSwIVlY2LkHb46EFe8MWiC+lYZTVpFzU2GI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736992015; c=relaxed/simple;
	bh=T5C/WOvZgx4zV5k73aBBSvSWf1MY20XkowTYZ1yid4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4PoAgEFsEBXC7Fy7rAGPMPAPwD1HDARtG9xB4lBQCBt2o1MO6Hrff6fMJf9W8V/HDKT/mnGazvEX3bsMQK4RpSY9Oxk8ukzJ1L/cqPNauwjZaHC2qJCjEFAkF8o41+vX2irC7EtYh3Qgr2FduMjJ+LuKI3mAMBiN0tVr68b2c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltckbMT0; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5426f48e501so69402e87.2;
        Wed, 15 Jan 2025 17:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736992011; x=1737596811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8PoeOsoXnkcQ1O7xfrGNP7/yyYzidTgWWnK8gVG9bI=;
        b=ltckbMT030Z/nWMgtuSxm8IA7PTUhuS4kjQvyf8iMsYYcLTql4Eaeiy+0ND674xv/7
         LAB/Bgo8LQda2cUpBrq/hhkI2mwsgNIfGSlEfEsU6YIuPnDUuapU7WthnCcVZ/8snNdm
         dEFcMnjxHC7Z7CH3/a3tIYBHXO3iigXd3CflbqJ+39UVoOXpG68S6Fljm7jIOI0JI454
         UQ/SyHd7ZiEA73z6WTe/WbKSF3WAHOoLF03ZADsGFlO1Pb+fhHmQv2UBWQNPr9+Ey5q7
         9N02JT4VUQO9DOueklhPfu8XZEGxKqc9BFT39rr31ykEVmxKxRQqwRLYnmyGuYmn/9Cb
         0zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736992011; x=1737596811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8PoeOsoXnkcQ1O7xfrGNP7/yyYzidTgWWnK8gVG9bI=;
        b=eMfOl/EcRuhe+llAvUJYw/FhrHYPhYGovh0J5es1TlKy55B4oyeNT4UOAg1SEhrEVz
         lLYwo6dld83Psg2uj9aXlyj7GJaeznON8detsX9TBmk/2AqRPl95ZbW6Epu3aNur05h8
         i2cnjZxVD+JYZ6saQUtUgwVxeWCV4v7dkMZKuPlkkpY/u5SMzlvO07Hk4akoMHFv2zET
         trVgNF7NfChcS0SgOp1pdUN0zfGlKYEOcNAvyfd8mcXRZn0ZKfSz5V9BhsT/5Q/2dZxJ
         9stK8Uc4pjoX7308Rw1BPgQeGby9VWkuUBsQTHyygDwTYKdHVHBj1i7xWghPFFkwpY0h
         evfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfkjFwnlDZbqCYNFJ+632k7zCuquhmAHeBH5ly3LO0mxoT4aRzuff8ZdQGNjWzXD4c+kFT/sXx6jhlhGE=@vger.kernel.org, AJvYcCVEnGWKR/4/T6z/7IUkDza4CCW52JFWiqgFXjVe092PGX4NpAgar8qrAUXovT5BmURRkOx1iphIIW4vHSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YywkqbiF3xCiR9P99SIEgIKMQ2YSFkPWKkIgZss2eXCCpm3gI0D
	uPx4LGNk24NDDWPII9DAIgjobiiDMqknJXzdS6LrwgPnishi/zNSivDdwgtCaenF3eqmyDv6rKz
	C4eY978K/cjTpb2pReBxzQhS/uYo=
X-Gm-Gg: ASbGncvdUtDwFP8HLPESIMsWadLnCPZ7FvLa06IjugIcxLWBMxwo+1FLGRAxKRktAc0
	f0xK0m1oE5keXHQQ9tXJIYt86g+/TV7D/D660PZQ=
X-Google-Smtp-Source: AGHT+IHnNLWeeqpj57WGvJejzaCSapO0If0R+l2iOTzev4nPKnL5beC7psjCRroxUhM+vE5Xk3YyT2D3LaljS2es8/s=
X-Received: by 2002:a2e:a54b:0:b0:2ff:c3d2:b0a0 with SMTP id
 38308e7fff4ca-305f45591d2mr37589001fa.5.1736992010959; Wed, 15 Jan 2025
 17:46:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115061805.3495048-1-zhaoyang.huang@unisoc.com> <bfd19718-e7dc-45c4-8f86-34205e733916@amd.com>
In-Reply-To: <bfd19718-e7dc-45c4-8f86-34205e733916@amd.com>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Thu, 16 Jan 2025 09:46:39 +0800
X-Gm-Features: AbW1kvZMIDWkIbbFDGe-0Zd-xPI-J2w2DbOKu3HU-iaXKLtJhuUsl6jRHJUc_ds
Message-ID: <CAGWkznFPpU6uHQbgYrdwwWO8L-ct5nJoYnmdfqewxgNtMu2Qqg@mail.gmail.com>
Subject: Re: [RFC PATCH] driver: dma-buf: use vmf_insert_page for cma_heap_vm_fault
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	"open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>, 
	"open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>, 
	"moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, linux-kernel@vger.kernel.org, 
	steve.kang@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 7:49=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 15.01.25 um 07:18 schrieb zhaoyang.huang:
> > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >
> > When using dma-buf as memory pool for VMM. The vmf_insert_pfn will
> > apply PTE_SPECIAL on pte which have vm_normal_page report bad_pte and
> > return NULL. This commit would like to suggest to replace
> > vmf_insert_pfn by vmf_insert_page.
>
> Setting PTE_SPECIAL is completely intentional here to prevent
> get_user_pages() from working on DMA-buf mappings.
ok. May I ask the reason?
>
> So absolutely clear NAK to this patch here.
>
> What exactly are you trying to do?
I would like to have pkvm have guest kernel be faulted of its second
stage page fault(ARM64's memory virtualization method) on dma-buf
which use pin_user_pages.
>
> Regards,
> Christian.
>
> >
> > [  103.402787] kvm [5276]: gfn(ipa)=3D0x80000 hva=3D0x7d4a400000 write_=
fault=3D0
> > [  103.403822] BUG: Bad page map in process crosvm_vcpu0  pte:168000140=
000f43 pmd:8000000c1ca0003
> > [  103.405144] addr:0000007d4a400000 vm_flags:040400fb anon_vma:0000000=
000000000 mapping:ffffff8085163df0 index:0
> > [  103.406536] file:dmabuf fault:cma_heap_vm_fault [cma_heap] mmap:dma_=
buf_mmap_internal read_folio:0x0
> > [  103.407877] CPU: 3 PID: 5276 Comm: crosvm_vcpu0 Tainted: G        W =
 OE      6.6.46-android15-8-g8bab72b63c20-dirty-4k #1 1e474a12dac4553a3ebba=
3a911f3b744176a5d2d
> > [  103.409818] Hardware name: Unisoc UMS9632-base Board (DT)
> > [  103.410613] Call trace:
> > [  103.411038] dump_backtrace+0xf4/0x140
> > [  103.411641] show_stack+0x20/0x30
> > [  103.412184] dump_stack_lvl+0x60/0x84
> > [  103.412766] dump_stack+0x18/0x24
> > [  103.413304] print_bad_pte+0x1b8/0x1cc
> > [  103.413909] vm_normal_page+0xc8/0xd0
> > [  103.414491] follow_page_pte+0xb0/0x304
> > [  103.415096] follow_page_mask+0x108/0x240
> > [  103.415721] __get_user_pages+0x168/0x4ac
> > [  103.416342] __gup_longterm_locked+0x15c/0x864
> > [  103.417023] pin_user_pages+0x70/0xcc
> > [  103.417609] pkvm_mem_abort+0xf8/0x5c0
> > [  103.418207] kvm_handle_guest_abort+0x3e0/0x3e4
> > [  103.418906] handle_exit+0xac/0x33c
> > [  103.419472] kvm_arch_vcpu_ioctl_run+0x48c/0x8d8
> > [  103.420176] kvm_vcpu_ioctl+0x504/0x5bc
> > [  103.420785] __arm64_sys_ioctl+0xb0/0xec
> > [  103.421401] invoke_syscall+0x60/0x11c
> > [  103.422000] el0_svc_common+0xb4/0xe8
> > [  103.422590] do_el0_svc+0x24/0x30
> > [  103.423131] el0_svc+0x3c/0x70
> > [  103.423640] el0t_64_sync_handler+0x68/0xbc
> > [  103.424288] el0t_64_sync+0x1a8/0x1ac
> >
> > Signed-off-by: Xiwei Wang <xiwei.wang1@unisoc.com>
> > Signed-off-by: Aijun Sun <aijun.sun@unisoc.com>
> > Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > ---
> >   drivers/dma-buf/heaps/cma_heap.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/c=
ma_heap.c
> > index c384004b918e..b301fb63f16b 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -168,7 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault=
 *vmf)
> >       if (vmf->pgoff > buffer->pagecount)
> >               return VM_FAULT_SIGBUS;
> >
> > -     return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->page=
s[vmf->pgoff]));
> > +     return vmf_insert_page(vma, vmf->address, buffer->pages[vmf->pgof=
f]);
> >   }
> >
> >   static const struct vm_operations_struct dma_heap_vm_ops =3D {
>

