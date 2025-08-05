Return-Path: <linux-media+bounces-38922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D283B1B2A0
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 913353BADC7
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 11:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB30247DEA;
	Tue,  5 Aug 2025 11:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="JVhE1oTY"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BF8199252
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 11:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754393574; cv=none; b=M8l60YSwOp4cSDhcn+oM1eu4NW9EknSNhmQzdh2BpN5f5iO53qpSb9EPH0ek4cGLcSIvre9tlYQdDHYk5jHEfxnHLVUDniLdKwga5FjsbQIukW31Y/KkSkb5+gXlYXwVnk69ZlxfxLqKu/HqPXFrzCBFaAI6sgflCUXcHXZmP48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754393574; c=relaxed/simple;
	bh=fzalzp7mUthweY1Uyxo7OY+K9ofd5VxVAzWEC1BV4kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9uUgp3ixo+hs+67JRVRbfhxe9y5MnEc/mp52mFxZnZXNQ4U6paHaQjG8h3tQH/QF8QUuC/dN6J6tDLIcTvm58cIItMwhgrJ4ovswOmdsv/V/cyywf/eq/bS8e8LI3BLBzHRBHU9lenPJFmOfAcThYxWtDaq7ljAOsDwDI+A7Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=JVhE1oTY; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1754393564; bh=fzalzp7mUthweY1Uyxo7OY+K9ofd5VxVAzWEC1BV4kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVhE1oTY4xXw1TDNb7/c3LS31LGCoTJL7zXWkGXbfh7v6DkIMsZbNUL6dL7GLrMGk
	 ++RugChz50s1Ldegp+0kKXM8CWydBKoDhbGBGyyl+FeUPB0dXq9cO2oCkCjZu03I/4
	 2vJQ+VSPow+sfELZdXhg2g348nBwlPRw+pCUalHqi58xQLaGDWsqpVcrMAMo3WuoJx
	 YI8c4rUxKq56+BD0pw97mPRQb6xlbFn6yNaRMkpT90gcfAxOG+cqL9ZexoP3K9+RV5
	 5aM4kKVT8ZfILbAmGPKqTBf2yvKIlRCHtny1jIZdR592hHNsqPVwibcwj4zoo1bOMW
	 tPvUwSFLtxMJQ==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id E58D5100090; Tue,  5 Aug 2025 12:32:44 +0100 (BST)
Date: Tue, 5 Aug 2025 12:32:44 +0100
From: Sean Young <sean@mess.org>
To: James Le Cuirot <chewi@gentoo.org>
Cc: linux-media@vger.kernel.org, Sam James <sam@gentoo.org>
Subject: Re: [PATCH] meson: Allow BPF code to be built with GCC
Message-ID: <aJHr3EZj22gDDIAH@gofer.mess.org>
References: <20250803081759.13952-1-chewi@gentoo.org>
 <aJB5rmwRfiYv7sJb@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJB5rmwRfiYv7sJb@gofer.mess.org>

On Mon, Aug 04, 2025 at 10:13:18AM +0100, Sean Young wrote:
> On Sun, Aug 03, 2025 at 09:17:59AM +0100, James Le Cuirot wrote:
> > Disclaimer: I haven't actually tested the result of the GCC build.
> 
> Let me test this.

It doesn't work:

# ir-keytable -p ./imon_rsc.o 
Protocols changed to 
symbol  has unknown section 6
bpf_load_program() err=Permission denied
0: R1=ctx() R10=fp0
0: (bf) r6 = r1                       ; R1=ctx() R6_w=ctx()
1: (62) *(u32 *)(r10 -4) = 0          ; R10=fp0 fp-8=0000????
2: (bf) r2 = r10                      ; R2_w=fp0 R10=fp0
3: (18) r1 = 0xffff89ed1318f800       ; R1_w=map_ptr(ks=4,vs=16)
5: (07) r2 += -4                      ; R2_w=fp-4
6: (85) call bpf_map_lookup_elem#1    ; R0_w=map_value(ks=4,vs=16)
7: (bf) r4 = r0                       ; R0_w=map_value(ks=4,vs=16) R4_w=map_value(ks=4,vs=16)
8: (15) if r0 == 0x0 goto pc+7        ; R0_w=map_value(ks=4,vs=16)
9: (61) r0 = *(u32 *)(r6 +0)          ; R0_w=scalar(smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff)) R6_w=ctx()
10: (bf) r1 = r0                      ; R0_w=scalar(id=1,smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff)) R1_w=scalar(id=1,smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff))
11: (bf) r2 = r0                      ; R0_w=scalar(id=1,smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff)) R2_w=scalar(id=1,smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff))
12: (54) w1 &= -16777216              ; R1_w=scalar(smin=0,smax=umax=umax32=0xff000000,smax32=0x7f000000,var_off=(0x0; 0xff000000))
13: (54) w2 &= -33554432              ; R2=scalar(smin=0,smax=umax=umax32=0xfe000000,smax32=0x7e000000,var_off=(0x0; 0xfe000000))
14: (16) if w2 == 0x0 goto pc+3       ; R2=scalar(smin=umin=umin32=1,smax=umax=umax32=0xfe000000,smax32=0x7e000000,var_off=(0x0; 0xfe000000))
15: (16) if w1 == 0x3000000 goto pc+31 47: R0=scalar(id=1,smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff)) R1=0x3000000 R2=scalar(smin=umin=umin32=1,smax=umax=umax32=0xfe000000,smax32=0x7e000000,var_off=(0x0; 0xfe000000)) R4=map_value(ks=4,vs=16) R6=ctx() R10=fp0 fp-8=0000????
47: (61) r5 = *(u32 *)(r4 +8)         ; R4=map_value(ks=4,vs=16) R5_w=scalar(smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff))
48: (16) if w5 == 0x1 goto pc+7 56: R0=scalar(id=1,smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff)) R1=0x3000000 R2=scalar(smin=umin=umin32=1,smax=umax=umax32=0xfe000000,smax32=0x7e000000,var_off=(0x0; 0xfe000000)) R4=map_value(ks=4,vs=16) R5_w=1 R6=ctx() R10=fp0 fp-8=0000????
56: (57) r0 &= 16777215               ; R0_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=0xffffff,var_off=(0x0; 0xffffff))
57: (b6) if w0 <= 0x960 goto pc+22    ; R0_w=scalar(smin=umin=smin32=umin32=2401,smax=umax=smax32=umax32=0xffffff,var_off=(0x0; 0xffffff))
58: (61) r1 = *(u32 *)(r4 +12)        ; R1_w=scalar(smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff)) R4=map_value(ks=4,vs=16)
59: (04) w1 += -4                     ; R1=scalar(smin=0,smax=umax=0xffffffff,var_off=(0x0; 0xffffffff))
60: (26) if w1 > 0x1 goto pc-11       ; R1=scalar(smin=smin32=0,smax=umax=smax32=umax32=1,var_off=(0x0; 0x1))
61: (79) r3 = *(u64 *)(r4 +0)         ; R3_w=scalar() R4=map_value(ks=4,vs=16)
62: (57) r3 &= 15                     ; R3_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=15,var_off=(0x0; 0xf))
63: (07) r3 += -1                     ; R3_w=scalar(smin=smin32=-1,smax=smax32=14)
64: (25) if r3 > 0xe goto pc+46       ; R3_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=14,var_off=(0x0; 0xf))
65: (67) r3 <<= 2                     ; R3_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=56,var_off=(0x0; 0x3c))
66: (18) r2 = 0x3c                    ; R2_w=60
68: (18) r9 = 0x0                     ; R9_w=0
70: (0f) r2 += r3                     ; R2_w=scalar(smin=umin=smin32=umin32=60,smax=umax=smax32=umax32=116,var_off=(0x0; 0x7c)) R3_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=56,var_off=(0x0; 0x3c))
71: (0f) r9 += r3                     ; R3_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=56,var_off=(0x0; 0x3c)) R9_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=56,var_off=(0x0; 0x3c))
72: (81) r2 = *(s32 *)(r2 +0)
R2 invalid mem access 'scalar'
processed 40 insns (limit 1000000) max_states_per_insn 0 total_states 3 peak_states 3 mark_read 1

Needs some analysis but I don't think your patch is ready for merging.

Thanks,
Sean

