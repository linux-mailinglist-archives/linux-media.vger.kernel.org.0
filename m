Return-Path: <linux-media+bounces-38943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5B7B1B70A
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 17:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96B0217FF72
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 15:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC942797BA;
	Tue,  5 Aug 2025 15:03:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C1A23F295
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754406214; cv=none; b=YSagONT4xIuVmFoiSExA6dHZZC0DSGoBIHv8zOESARUl9c9MSm/lgmXkxcyR8DbVpZLd749QvntWqBxm0zFl2qF14R+slQCHkWiA0g2jiocoTssquwluGRo1ac9D/bzuTPu7ytqrIM7PYvC8RjrBrbFkhy/ahwd8bC05Kiipylc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754406214; c=relaxed/simple;
	bh=Zz+k3xh/HZ5MUxYOdve/V/OA7SMAd4Yz55jkMYZsCp0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oTASN1VnThuumGyIbnVfVJk3nndUYNNSmQ4912lG4bhNGR82Lzyu3KhlKT8svHo+HoPimsrGSJpBlEibgYFN09WeFPP8hFyiew5Is1dYl4PYGdwofFO3afFg9XfeksPida83mWLwM5Bcc/p0Fd44WcyaH6FAUxX7KPix6Gtno/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DF24133FE7D;
	Tue, 05 Aug 2025 15:03:31 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Sean Young <sean@mess.org>
Cc: James Le Cuirot <chewi@gentoo.org>,  linux-media@vger.kernel.org
Subject: Re: [PATCH] meson: Allow BPF code to be built with GCC
In-Reply-To: <aJHr3EZj22gDDIAH@gofer.mess.org>
Organization: Gentoo
References: <20250803081759.13952-1-chewi@gentoo.org>
	<aJB5rmwRfiYv7sJb@gofer.mess.org> <aJHr3EZj22gDDIAH@gofer.mess.org>
User-Agent: mu4e 1.12.12; emacs 31.0.50
Date: Tue, 05 Aug 2025 16:03:28 +0100
Message-ID: <87y0rxyfnj.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sean Young <sean@mess.org> writes:

> On Mon, Aug 04, 2025 at 10:13:18AM +0100, Sean Young wrote:
>> On Sun, Aug 03, 2025 at 09:17:59AM +0100, James Le Cuirot wrote:
>> > Disclaimer: I haven't actually tested the result of the GCC build.
>> 
>> Let me test this.
>
> It doesn't work:
>
> # ir-keytable -p ./imon_rsc.o 
> Protocols changed to 
> symbol  has unknown section 6
> bpf_load_program() err=Permission denied
> 0: R1=ctx() R10=fp0
> 0: (bf) r6 = r1                       ; R1=ctx() R6_w=ctx()
> 1: (62) *(u32 *)(r10 -4) = 0          ; R10=fp0 fp-8=0000????
> 2: (bf) r2 = r10                      ; R2_w=fp0 R10=fp0
> 3: (18) r1 = 0xffff89ed1318f800       ; R1_w=map_ptr(ks=4,vs=16)
> 5: (07) r2 += -4                      ; R2_w=fp-4
> 6: (85) call bpf_map_lookup_elem#1    ; R0_w=map_value(ks=4,vs=16)
> 7: (bf) r4 = r0                       ; R0_w=map_value(ks=4,vs=16) R4_w=map_value(ks=4,vs=16)
> 8: (15) if r0 == 0x0 goto pc+7        ; R0_w=map_value(ks=4,vs=16)
> 9: (61) r0 = *(u32 *)(r6 +0)          ; R0_w=scalar(smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff)) R6_w=ctx()
> 10: (bf) r1 = r0                      ; R0_w=scalar(id=1,smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff)) R1_w=scalar(id=1,smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff))
> 11: (bf) r2 = r0                      ; R0_w=scalar(id=1,smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff)) R2_w=scalar(id=1,smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff))
> 12: (54) w1 &= -16777216              ; R1_w=scalar(smin=0,smax=umax=umax32=0xff000000,smax32=0x7f000000,var_off=(0x0; 0xff000000))
> 13: (54) w2 &= -33554432              ; R2=scalar(smin=0,smax=umax=umax32=0xfe000000,smax32=0x7e000000,var_off=(0x0; 0xfe000000))
> 14: (16) if w2 == 0x0 goto pc+3       ; R2=scalar(smin=umin=umin32=1,smax=umax=umax32=0xfe000000,smax32=0x7e000000,var_off=(0x0; 0xfe000000))
> 15: (16) if w1 == 0x3000000 goto pc+31 47:
> R0=scalar(id=1,smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff))
> R1=0x3000000
> R2=scalar(smin=umin=umin32=1,smax=umax=umax32=0xfe000000,smax32=0x7e000000,var_off=(0x0;
> 0xfe000000)) R4=map_value(ks=4,vs=16) R6=ctx() R10=fp0 fp-8=0000????
> 47: (61) r5 = *(u32 *)(r4 +8)         ; R4=map_value(ks=4,vs=16) R5_w=scalar(smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff))
> 48: (16) if w5 == 0x1 goto pc+7 56:
> R0=scalar(id=1,smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff))
> R1=0x3000000
> R2=scalar(smin=umin=umin32=1,smax=umax=umax32=0xfe000000,smax32=0x7e000000,var_off=(0x0;
> 0xfe000000)) R4=map_value(ks=4,vs=16) R5_w=1 R6=ctx() R10=fp0
> fp-8=0000????
> 56: (57) r0 &= 16777215               ; R0_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=0xffffff,var_off=(0x0; 0xffffff))
> 57: (b6) if w0 <= 0x960 goto pc+22    ; R0_w=scalar(smin=umin=smin32=umin32=2401,smax=umax=smax32=umax32=0xffffff,var_off=(0x0; 0xffffff))
> 58: (61) r1 = *(u32 *)(r4 +12)        ; R1_w=scalar(smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff)) R4=map_value(ks=4,vs=16)
> 59: (04) w1 += -4                     ; R1=scalar(smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff))
> 60: (26) if w1 > 0x1 goto pc-11       ; R1=scalar(smin=smin32=0,smax=umax=smax32=umax32=1,var_off=(0x0; 0x1))
> 61: (79) r3 = *(u64 *)(r4 +0)         ; R3_w=scalar() R4=map_value(ks=4,vs=16)
> 62: (57) r3 &= 15                     ; R3_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=15,var_off=(0x0; 0xf))
> 63: (07) r3 += -1                     ; R3_w=scalar(smin=smin32=-1,smax=smax32=14)
> 64: (25) if r3 > 0xe goto pc+46       ; R3_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=14,var_off=(0x0; 0xf))
> 65: (67) r3 <<= 2                     ; R3_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=56,var_off=(0x0; 0x3c))
> 66: (18) r2 = 0x3c                    ; R2_w=60
> 68: (18) r9 = 0x0                     ; R9_w=0
> 70: (0f) r2 += r3 ;
> R2_w=scalar(smin=umin=smin32=umin32=60,smax=umax=smax32=umax32=116,var_off=(0x0;
> 0x7c))
> R3_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=56,var_off=(0x0;
> 0x3c))
> 71: (0f) r9 += r3 ;
> R3_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=56,var_off=(0x0;
> 0x3c))
> R9_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=56,var_off=(0x0;
> 0x3c))
> 72: (81) r2 = *(s32 *)(r2 +0)
> R2 invalid mem access 'scalar'
> processed 40 insns (limit 1000000) max_states_per_insn 0 total_states 3 peak_states 3 mark_read 1

I'll have a look. Thanks.

>
> Needs some analysis but I don't think your patch is ready for merging.
>
> Thanks,
> Sean

