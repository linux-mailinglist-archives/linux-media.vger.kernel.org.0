Return-Path: <linux-media+bounces-29931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F0CA84485
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 15:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E23B7A8947
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 13:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B6F2857DA;
	Thu, 10 Apr 2025 13:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iL5LDnZx"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090142836BA;
	Thu, 10 Apr 2025 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291133; cv=none; b=cC2QERaRkHhAP8hUa44v/X5VkUEYnCpVo3wVurd4/h4oRt3tNulICVnfg/EPruuA1bEmRZt25AMgUWJIiW40rfBRKgbqMNWbf8orOl9DY7mJmVLP84yrih0fN8bTMA0Xm4P7RusAQZ5naIW8yrWxzw1U8v7N9aCOyZgQfU3ZOCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291133; c=relaxed/simple;
	bh=Di12UIlVhobgoHnspy5XejWdRPf+a4jBs6939VP4VHc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eMdk94Qwv3J0DsAue9MEkV9pXPNliO1ong7kFs7gqluo3i2pAgA4BQFrVcG1njuYtaNbqL/EUYTVvtF0l0B3h+sPkfiLHZTAuRePqQ6vGw2k13KKcdvSKE7vME8tlTKeqCZzRtXirLJyMcWbM5yYwBsFtCWj5vfQvsEhDHFxmeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iL5LDnZx; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZYL464lJXz9spM;
	Thu, 10 Apr 2025 15:18:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1744291126; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Di12UIlVhobgoHnspy5XejWdRPf+a4jBs6939VP4VHc=;
	b=iL5LDnZx1NJhnTKVgRDHv2veV6OUMzQ7spDxQa2ojPeNIHnpz6hhdfOLqY7eiQweyckfSV
	gWOgOGg8Wh+v007+bsFhnhrdz+Vi54l1yu0lMvlv5AG4/soHGC9Mseonz9ZgMxrtC5UIH9
	gAuA8ecgmxPRiD+/8Cv74ahcOtAe7qEOF1dxtDtKuNkwtClBYIQ7PjxqD1/X16iJl/4KBQ
	VI1SWI5wLAfMdo8yvm1CMXUxF1WI46FUyBfD8NW8C3mM0P7hQbEoPCHnQCZC0eJ+H3I/7n
	i4aeBxIZ2NP1fHd6XwZT2U9NgUtERr+8Qvqf71/csR/NqxA6QpyEvEssuVYo0A==
Message-ID: <c91e8331993e367c962b5e01c74966528ed16239.camel@mailbox.org>
Subject: Re: [PATCH 0/3] drm/nouveau: Fix & improve nouveau_fence_done()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	phasta@kernel.org, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
	 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
	 <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>, Sumit Semwal
	 <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 10 Apr 2025 15:18:43 +0200
In-Reply-To: <cf4717bd-6c1d-4f3a-a0ab-ceb2170c47f2@amd.com>
References: <20250410092418.135258-2-phasta@kernel.org>
	 <1cbb915240e5e09447ac8d04b5d2dc4165926de7.camel@mailbox.org>
	 <cf4717bd-6c1d-4f3a-a0ab-ceb2170c47f2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: q33jtrq4heq7q7q5tm8ar8gz7i7xr7u1
X-MBO-RS-ID: cabf72b507332c4abb0

On Thu, 2025-04-10 at 14:18 +0200, Christian K=C3=B6nig wrote:
> Am 10.04.25 um 11:51 schrieb Philipp Stanner:
> > On Thu, 2025-04-10 at 11:24 +0200, Philipp Stanner wrote:
> > > Contains two patches improving nouveau_fence_done(), and one
> > > addressing
> > > an actual bug (race):
> > Oops, that's the wrong calltrace. Here we go:
> >=20
> > [ 85.791794] Call Trace: [ 85.791796] <TASK> [ 85.791797] ?
> > nouveau_fence_context_kill
> > (/home/imperator/linux/./include/linux/dma-fence.h:587
> > (discriminator 9)
> > /home/imperator/linux/drivers/gpu/drm/nouveau/nouveau_fence.c:94
> > (discriminator 9)) nouveau [ 85.791874] ? __warn.cold
> > (/home/imperator/linux/kernel/panic.c:748) [ 85.791878] ?
> > nouveau_fence_context_kill
> > (/home/imperator/linux/./include/linux/dma-fence.h:587
> > (discriminator 9)
> > /home/imperator/linux/drivers/gpu/drm/nouveau/nouveau_fence.c:94
> > (discriminator 9)) nouveau [ 85.791950] ? report_bug
> > (/home/imperator/linux/lib/bug.c:180
> > /home/imperator/linux/lib/bug.c:219) [ 85.791953] ? handle_bug
> > (/home/imperator/linux/arch/x86/kernel/traps.c:260) [ 85.791956] ?
> > exc_invalid_op (/home/imperator/linux/arch/x86/kernel/traps.c:309
> > (discriminator 1)) [ 85.791957] ? asm_exc_invalid_op
> > (/home/imperator/linux/./arch/x86/include/asm/idtentry.h:621) [
> > 85.791960] ? nouveau_fence_context_kill
> > (/home/imperator/linux/./include/linux/dma-fence.h:587
> > (discriminator 9)
> > /home/imperator/linux/drivers/gpu/drm/nouveau/nouveau_fence.c:94
> > (discriminator 9)) nouveau [ 85.792028] drm_sched_fini.cold
> > (/home/imperator/linux/./include/trace/../../drivers/gpu/drm/schedu
> > ler/gpu_scheduler_trace.h:72 (discriminator 1)) gpu_sched [
> > 85.792033] ? drm_sched_entity_kill.part.0
> > (/home/imperator/linux/drivers/gpu/drm/scheduler/sched_entity.c:243
> > (discriminator 2)) gpu_sched [ 85.792037] nouveau_sched_destroy
> > (/home/imperator/linux/drivers/gpu/drm/nouveau/nouveau_sched.c:509
> > /home/imperator/linux/drivers/gpu/drm/nouveau/nouveau_sched.c:518)
> > nouveau [ 85.792122] nouveau_abi16_chan_fini.isra.0
> > (/home/imperator/linux/drivers/gpu/drm/nouveau/nouveau_abi16.c:188)
> > nouveau [ 85.792191] nouveau_abi16_fini
> > (/home/imperator/linux/drivers/gpu/drm/nouveau/nouveau_abi16.c:224
> > (discriminator 3)) nouveau [ 85.792263] nouveau_drm_postclose
> > (/home/imperator/linux/drivers/gpu/drm/nouveau/nouveau_drm.c:1240)
> > nouveau [ 85.792349] drm_file_free
> > (/home/imperator/linux/drivers/gpu/drm/drm_file.c:255) [ 85.792353]
> > drm_release
> > (/home/imperator/linux/./arch/x86/include/asm/atomic.h:67
> > (discriminator 1)
> > /home/imperator/linux/./include/linux/atomic/atomic-arch-
> > fallback.h:2278 (discriminator 1)
> > /home/imperator/linux/./include/linux/atomic/atomic-
> > instrumented.h:1384 (discriminator 1)
> > /home/imperator/linux/drivers/gpu/drm/drm_file.c:428 (discriminator
> > 1)) [ 85.792355] __fput (/home/imperator/linux/fs/file_table.c:464)
> > [ 85.792357] task_work_run
> > (/home/imperator/linux/kernel/task_work.c:227) [ 85.792360] do_exit
> > (/home/imperator/linux/kernel/exit.c:939) [ 85.792362]
> > do_group_exit (/home/imperator/linux/kernel/exit.c:1069) [
> > 85.792364] get_signal (/home/imperator/linux/kernel/signal.c:3036)
> > [ 85.792366] arch_do_signal_or_restart
> > (/home/imperator/linux/./arch/x86/include/asm/syscall.h:38
> > /home/imperator/linux/arch/x86/kernel/signal.c:264
> > /home/imperator/linux/arch/x86/kernel/signal.c:339) [ 85.792369]
> > syscall_exit_to_user_mode
> > (/home/imperator/linux/kernel/entry/common.c:113
> > /home/imperator/linux/./include/linux/entry-common.h:329
> > /home/imperator/linux/kernel/entry/common.c:207
> > /home/imperator/linux/kernel/entry/common.c:218) [ 85.792372]
> > do_syscall_64
> > (/home/imperator/linux/./arch/x86/include/asm/cpufeature.h:172
> > /home/imperator/linux/arch/x86/entry/common.c:98) [ 85.792373] ?
> > syscall_exit_to_user_mode_prepare
> > (/home/imperator/linux/./include/linux/audit.h:357
> > /home/imperator/linux/kernel/entry/common.c:166
> > /home/imperator/linux/kernel/entry/common.c:200) [ 85.792376] ?
> > syscall_exit_to_user_mode
> > (/home/imperator/linux/./arch/x86/include/asm/paravirt.h:686
> > /home/imperator/linux/./include/linux/entry-common.h:232
> > /home/imperator/linux/kernel/entry/common.c:206
> > /home/imperator/linux/kernel/entry/common.c:218) [ 85.792377] ?
> > do_syscall_64
> > (/home/imperator/linux/./arch/x86/include/asm/cpufeature.h:172
> > /home/imperator/linux/arch/x86/entry/common.c:98) [ 85.792378]
> > entry_SYSCALL_64_after_hwframe
> > (/home/imperator/linux/arch/x86/entry/entry_64.S:130) [ 85.792381]
> > RIP: 0033:0x7ff950b6af70 [ 85.792383] Code: Unable to access opcode
> > bytes at 0x7ff950b6af46. objdump: '/tmp/tmp.sfPRl5k2te.o': No such
> > file Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [ 85.792383] R=
SP:
> > 002b:00007ff93cdfb6f0 EFLAGS: 00000293 ORIG_RAX: 000000000000010f [
> > 85.792385] RAX: fffffffffffffdfe RBX: 000055d386d61870 RCX:
> > 00007ff950b6af70 [ 85.792386] RDX: 0000000000000000 RSI:
> > 0000000000000001 RDI: 00007ff928000b90 [ 85.792387] RBP:
> > 00007ff93cdfb740 R08: 0000000000000008 R09: 0000000000000000 [
> > 85.792388] R10: 0000000000000000 R11: 0000000000000293 R12:
> > 0000000000000001 [ 85.792388] R13: 0000000000000000 R14:
> > 0000000000000000 R15: 00007ff951b10b40 [ 85.792390] </TASK> [
> > 85.792391] ---[ end trace 0000000000000000 ]---
>=20
> I think I understand the problem now as well, but that backtrace is
> completely mangled in the mail.
>=20
> It would be nice if you could send that out again.


I really need to install Mutt soon..

Let's try it this way:
https://paste.debian.net/1368679/

P.

>=20
> Thanks,
> Christian.
>=20
> >=20
> > By the way, for reference:
> > I did try whether it could be done to have nouveau_fence_signal()
> > incorporated into nouveau_fence_update() and nouveau_fence_done().
> > This, however, would then cause a race with the list_del() in
> > nouveau_fence_no_signaling(), WARNing because of the list poison.
> >=20
> > So the "solution" space is:
> > =C2=A0* A cleanup callback on the dma_fence.
> > =C2=A0* Keeping the current race or
> > =C2=A0* replacing it with another race with another function.
> > =C2=A0* Just preventing nouveau_fence_done() from signaling fences othe=
r
> > =C2=A0=C2=A0 than through nouveau_fence_update/signal
> >=20
> > The later seems clearly like the cleanest solution to me.
> > Alternative
> > would be a work-intensive rework of all the misdesigns broken in
> > nouveau_fence.c
> >=20
> >=20
> > P.
> >=20
> > > [=C2=A0=C2=A0 39.848463] WARNING: CPU: 21 PID: 1734 at
> > > drivers/gpu/drm/nouveau/nouveau_fence.c:509
> > > nouveau_fence_no_signaling+0xac/0xd0 [nouveau]
> > > [=C2=A0=C2=A0 39.848551] Modules linked in: snd_seq_dummy snd_hrtimer
> > > nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet
> > > nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_ine
> > > t nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat
> > > nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set
> > > nf_tables qrtr sunrpc snd_sof_pci_intel_
> > > tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic snd_sof_pci
> > > snd_sof_xtensa_dsp snd_sof_intel_hda_common snd_soc_hdac_hda
> > > snd_sof_intel_hda snd_sof snd_sof_utils snd
> > > _soc_acpi_intel_match snd_soc_acpi snd_soc_acpi_intel_sdca_quirks
> > > snd_sof_intel_hda_mlink snd_soc_sdca snd_soc_avs snd_ctl_led
> > > snd_soc_hda_codec intel_rapl_msr snd_hda_
> > > codec_realtek snd_hda_ext_core intel_rapl_common
> > > snd_hda_codec_generic snd_soc_core snd_hda_scodec_component
> > > intel_uncore_frequency intel_uncore_frequency_common snd_hd
> > > a_codec_hdmi intel_ifs snd_compress i10nm_edac skx_edac_common
> > > nfit
> > > snd_hda_intel snd_intel_dspcfg libnvdimm snd_hda_codec
> > > binfmt_misc
> > > snd_hwdep snd_hda_core snd_seq sn
> > > d_seq_device dell_wmi
> > > [=C2=A0=C2=A0 39.848575]=C2=A0 dell_pc x86_pkg_temp_thermal spi_nor
> > > platform_profile
> > > sparse_keymap intel_powerclamp dax_hmem snd_pcm cxl_acpi coretemp
> > > cxl_port iTCO_wdt mtd rapl intel
> > > _pmc_bxt pmt_telemetry cxl_core dell_wmi_sysman pmt_class
> > > iTCO_vendor_support snd_timer isst_if_mmio vfat intel_cstate
> > > dell_smbios dcdbas fat dell_wmi_ddv dell_smm_hwmo
> > > n dell_wmi_descriptor firmware_attributes_class wmi_bmof
> > > intel_uncore
> > > einj pcspkr isst_if_mbox_pci atlantic snd isst_if_common
> > > intel_vsec
> > > e1000e macsec mei_me i2c_i801=20
> > > spi_intel_pci soundcore i2c_smbus spi_intel mei joydev loop
> > > nfnetlink
> > > zram nouveau drm_ttm_helper ttm polyval_clmulni iaa_crypto
> > > gpu_sched
> > > polyval_generic rtsx_pci_sdmm
> > > c ghash_clmulni_intel i2c_algo_bit mmc_core drm_gpuvm
> > > sha512_ssse3
> > > nvme drm_exec drm_display_helper sha256_ssse3 idxd sha1_ssse3 cec
> > > nvme_core idxd_bus rtsx_pci nvme_au
> > > th pinctrl_alderlake ip6_tables ip_tables fuse
> > > [=C2=A0=C2=A0 39.848603] CPU: 21 UID: 42 PID: 1734 Comm: gnome-shell
> > > Tainted:
> > > G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.14.0-rc4+ #11
> > > [=C2=A0=C2=A0 39.848605] Tainted: [W]=3DWARN
> > > [=C2=A0=C2=A0 39.848606] Hardware name: Dell Inc. Precision 7960
> > > Tower/01G0M6,
> > > BIOS 2.7.0 12/17/2024
> > > [=C2=A0=C2=A0 39.848607] RIP: 0010:nouveau_fence_no_signaling+0xac/0x=
d0
> > > [nouveau]
> > > [=C2=A0=C2=A0 39.848688] Code: db 74 17 48 8d 7b 38 b8 ff ff ff ff f0=
 0f c1
> > > 43
> > > 38 83 f8 01 74 29 85 c0 7e 17 31 c0 5b 5d c3 cc cc cc cc e8 76 b2
> > > c5
> > > f0 eb 96 <0f> 0b e9 67 ff ff f
> > > f be 03 00 00 00 e8 83 76 33 f1 31 c0 eb dd e8
> > > [=C2=A0=C2=A0 39.848690] RSP: 0018:ff1cc1ffc5c039f0 EFLAGS: 00010046
> > > [=C2=A0=C2=A0 39.848691] RAX: 0000000000000001 RBX: ff175a3b504da980 =
RCX:
> > > ff175a3b4801e008
> > > [=C2=A0=C2=A0 39.848692] RDX: ff175a3b43e7bad0 RSI: ffffffffc09d3fda =
RDI:
> > > ff175a3b504da980
> > > [=C2=A0=C2=A0 39.848693] RBP: ff175a3b504da9c0 R08: ffffffffc09e39df =
R09:
> > > 0000000000000001
> > > [=C2=A0=C2=A0 39.848694] R10: 0000000000000001 R11: 0000000000000000 =
R12:
> > > ff175a3b6d97de00
> > > [=C2=A0=C2=A0 39.848695] R13: 0000000000000246 R14: ff1cc1ffc5c03c60 =
R15:
> > > 0000000000000001
> > > [=C2=A0=C2=A0 39.848696] FS:=C2=A0 00007fc5477846c0(0000)
> > > GS:ff175a5a50280000(0000)
> > > knlGS:0000000000000000
> > > [=C2=A0=C2=A0 39.848698] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 000000=
0080050033
> > > [=C2=A0=C2=A0 39.848699] CR2: 000055cb7613d1a8 CR3: 000000012e5ce004 =
CR4:
> > > 0000000000f71ef0
> > > [=C2=A0=C2=A0 39.848700] DR0: 0000000000000000 DR1: 0000000000000000 =
DR2:
> > > 0000000000000000
> > > [=C2=A0=C2=A0 39.848701] DR3: 0000000000000000 DR6: 00000000fffe07f0 =
DR7:
> > > 0000000000000400
> > > [=C2=A0=C2=A0 39.848702] PKRU: 55555554
> > > [=C2=A0=C2=A0 39.848703] Call Trace:
> > > [=C2=A0=C2=A0 39.848704]=C2=A0 <TASK>
> > > [=C2=A0=C2=A0 39.848705]=C2=A0 ? nouveau_fence_no_signaling+0xac/0xd0=
 [nouveau]
> > > [=C2=A0=C2=A0 39.848782]=C2=A0 ? __warn.cold+0x93/0xfa
> > > [=C2=A0=C2=A0 39.848785]=C2=A0 ? nouveau_fence_no_signaling+0xac/0xd0=
 [nouveau]
> > > [=C2=A0=C2=A0 39.848861]=C2=A0 ? report_bug+0xff/0x140
> > > [=C2=A0=C2=A0 39.848863]=C2=A0 ? handle_bug+0x58/0x90
> > > [=C2=A0=C2=A0 39.848865]=C2=A0 ? exc_invalid_op+0x17/0x70
> > > [=C2=A0=C2=A0 39.848866]=C2=A0 ? asm_exc_invalid_op+0x1a/0x20
> > > [=C2=A0=C2=A0 39.848870]=C2=A0 ? nouveau_fence_no_signaling+0xac/0xd0=
 [nouveau]
> > > [=C2=A0=C2=A0 39.848943]=C2=A0 nouveau_fence_enable_signaling+0x32/0x=
80
> > > [nouveau]
> > > [=C2=A0=C2=A0 39.849016]=C2=A0 ? __pfx_nouveau_fence_cleanup_cb+0x10/=
0x10
> > > [nouveau]
> > > [=C2=A0=C2=A0 39.849088]=C2=A0 __dma_fence_enable_signaling+0x33/0xc0
> > > [=C2=A0=C2=A0 39.849090]=C2=A0 dma_fence_add_callback+0x4b/0xd0
> > > [=C2=A0=C2=A0 39.849093]=C2=A0 nouveau_fence_emit+0xa3/0x260 [nouveau=
]
> > > [=C2=A0=C2=A0 39.849166]=C2=A0 nouveau_fence_new+0x7d/0xf0 [nouveau]
> > > [=C2=A0=C2=A0 39.849242]=C2=A0 nouveau_gem_ioctl_pushbuf+0xe8f/0x1300=
 [nouveau]
> > > [=C2=A0=C2=A0 39.849338]=C2=A0 ? __pfx_nouveau_gem_ioctl_pushbuf+0x10=
/0x10
> > > [nouveau]
> > > [=C2=A0=C2=A0 39.849431]=C2=A0 drm_ioctl_kernel+0xad/0x100
> > > [=C2=A0=C2=A0 39.849433]=C2=A0 drm_ioctl+0x288/0x550
> > > [=C2=A0=C2=A0 39.849435]=C2=A0 ? __pfx_nouveau_gem_ioctl_pushbuf+0x10=
/0x10
> > > [nouveau]
> > > [=C2=A0=C2=A0 39.849526]=C2=A0 nouveau_drm_ioctl+0x57/0xb0 [nouveau]
> > > [=C2=A0=C2=A0 39.849620]=C2=A0 __x64_sys_ioctl+0x94/0xc0
> > > [=C2=A0=C2=A0 39.849621]=C2=A0 do_syscall_64+0x82/0x160
> > > [=C2=A0=C2=A0 39.849623]=C2=A0 ? drm_ioctl+0x2b7/0x550
> > > [=C2=A0=C2=A0 39.849625]=C2=A0 ? __pfx_nouveau_gem_ioctl_pushbuf+0x10=
/0x10
> > > [nouveau]
> > > [=C2=A0=C2=A0 39.849719]=C2=A0 ? ktime_get_mono_fast_ns+0x38/0xd0
> > > [=C2=A0=C2=A0 39.849721]=C2=A0 ? __pm_runtime_suspend+0x69/0xc0
> > > [=C2=A0=C2=A0 39.849724]=C2=A0 ? syscall_exit_to_user_mode_prepare+0x=
15e/0x1a0
> > > [=C2=A0=C2=A0 39.849726]=C2=A0 ? syscall_exit_to_user_mode+0x10/0x200
> > > [=C2=A0=C2=A0 39.849729]=C2=A0 ? do_syscall_64+0x8e/0x160
> > > [=C2=A0=C2=A0 39.849730]=C2=A0 ? exc_page_fault+0x7e/0x1a0
> > > [=C2=A0=C2=A0 39.849733]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x=
7e
> > > [=C2=A0=C2=A0 39.849735] RIP: 0033:0x7fc5576fe0ad
> > > [=C2=A0=C2=A0 39.849736] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48=
 8d 45
> > > 10
> > > c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00
> > > 00
> > > 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
> > > 28
> > > 00 00 00
> > > [=C2=A0=C2=A0 39.849737] RSP: 002b:00007ffc002688a0 EFLAGS: 00000246
> > > ORIG_RAX:
> > > 0000000000000010
> > > [=C2=A0=C2=A0 39.849739] RAX: ffffffffffffffda RBX: 000055cb74e316c0 =
RCX:
> > > 00007fc5576fe0ad
> > > [=C2=A0=C2=A0 39.849740] RDX: 00007ffc00268960 RSI: 00000000c0406481 =
RDI:
> > > 000000000000000e
> > > [=C2=A0=C2=A0 39.849741] RBP: 00007ffc002688f0 R08: 0000000000000000 =
R09:
> > > 000055cb74e35560
> > > [=C2=A0=C2=A0 39.849742] R10: 0000000000000014 R11: 0000000000000246 =
R12:
> > > 00007ffc00268960
> > > [=C2=A0=C2=A0 39.849744] R13: 00000000c0406481 R14: 000000000000000e =
R15:
> > > 000055cb74e3cd10
> > > [=C2=A0=C2=A0 39.849746]=C2=A0 </TASK>
> > > [=C2=A0=C2=A0 39.849746] ---[ end trace 0000000000000000 ]---
> > > [=C2=A0=C2=A0 39.849776] ------------[ cut here ]------------
> > >=20
> > >=20
> > > This is the first WARN_ON() in dma_fence_set_error(), called by
> > > nouveau_fence_context_kill().
> > >=20
> > > It's rare, but it is a bug, or rather: the archetype of a race,
> > > since
> > > (as Christian pointed out) nouveau_fence_update() later at some
> > > point
> > > will remove the signaled fence (by signaling it again).
> > >=20
> > >=20
> > > P.
> > >=20
> > >=20
> > > Philipp Stanner (3):
> > > =C2=A0 drm/nouveau: Prevent signaled fences in pending list
> > > =C2=A0 drm/nouveau: Remove surplus if-branch
> > > =C2=A0 drm/nouveau: Add helper to check base fence
> > >=20
> > > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 32 ++++++++++++++----=
-
> > > ----
> > > --
> > > =C2=A01 file changed, 18 insertions(+), 14 deletions(-)
> > >=20
>=20


