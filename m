Return-Path: <linux-media+bounces-52960-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPN4AksllGnXAAIAu9opvQ
	(envelope-from <linux-media+bounces-52960-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:22:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 711E4149E4F
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10DC4303100C
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4C22E7BB6;
	Tue, 17 Feb 2026 08:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="A6I8Qsq+"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FD82DB7BA
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 08:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316526; cv=none; b=opId3y+v/tUQksCA3rFMoM+kijpJ7r6QGoaKX+gxsI+xMDVbYmKvI0hax6BeVzQg9OjMxpp4Do+M1edhCiTZwmAmALPz+7P2FqLAxWSDs0MfQzFZTNpShbQb2jV893ezfA2yB35Vv+Mx1HK8+ultj6IEO4BR4lg7a9bXD99wFJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316526; c=relaxed/simple;
	bh=bfkGzTeqMXPNb2FVxSufc857pf0CokCiO6u91ismLhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=tFpNIKwKwr9O9AqrUzMVATV0Cf6Q5HoizNIr0io7O5i8DDAddK0o8AMN8EwM+MjMdE5Uu7L3q0FZqPWwBoPNciRX1g6Ea1T87oK4ZY5SdWC5n9FkCWY3RvMS+6XqJDsucjpqHP6YIFLdkKUJ2qG1qqdmVcoYijSm7YbVp6nMPR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=A6I8Qsq+; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260217082155euoutp02793e9e36c7b132de80515d0bb0545530~U_vxYtUzu1670516705euoutp027
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 08:21:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260217082155euoutp02793e9e36c7b132de80515d0bb0545530~U_vxYtUzu1670516705euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1771316515;
	bh=ff9z6TTvPWiEy9lEgyawztrHtxW4KWIFJrR1ygeF3dY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=A6I8Qsq+XJdYZRm42vZU0xJ4pvePHr0SqFDSTvRrw8c17hCatnjTeJZeCSR8nzPlv
	 nDuOx0pBAc9o2bqfhrevuoK8bOwvBLLl3xv5A30rUutBgHUlZ6kindmncntMtlrN3r
	 0c04vesa9kYIjSDB6uBwD0kEu07k56HA/6xglvdQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260217082154eucas1p2a2fc74fee77203c5ad24cc011c2efafc~U_vxFq01c1480414804eucas1p2z;
	Tue, 17 Feb 2026 08:21:54 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260217082153eusmtip1baa04ca6f6de2cc98cc632f532719bb3~U_vwAPOHH0073900739eusmtip1X;
	Tue, 17 Feb 2026 08:21:53 +0000 (GMT)
Message-ID: <ce0f5d88-da59-4e0b-812f-5ae753cbabfd@samsung.com>
Date: Tue, 17 Feb 2026 09:21:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] media: videobuf2: Set vma_flags in vb2_dma_sg_mmap
To: Janne Grunau <j@jannau.net>, Tomasz Figa <tfiga@chromium.org>, Mauro
	Carvalho Chehab <mchehab@kernel.org>, Kyungmin Park
	<kyungmin.park@samsung.com>, Hans Verkuil <hverkuil@kernel.org>, Maarten
	Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260215-media-vb2-dma-sg-v1-1-91b6aa6c1cec@jannau.net>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260217082154eucas1p2a2fc74fee77203c5ad24cc011c2efafc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260215174311eucas1p1fbf6fb7183edf87af9af0ae2f3a934fd
X-EPHeader: CA
X-CMS-RootMailID: 20260215174311eucas1p1fbf6fb7183edf87af9af0ae2f3a934fd
References: <CGME20260215174311eucas1p1fbf6fb7183edf87af9af0ae2f3a934fd@eucas1p1.samsung.com>
	<20260215-media-vb2-dma-sg-v1-1-91b6aa6c1cec@jannau.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[jannau.net,chromium.org,kernel.org,samsung.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52960-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jannau.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 711E4149E4F
X-Rspamd-Action: no action

On 15.02.2026 18:42, Janne Grunau wrote:
> vb2_dma_contig sets VMA flags VM_DONTEXPAND and VM_DONTDUMP and I do not
> see a reason why vb2_dma_sg should behave differently. This avoids
> hitting `WARN_ON(!(vma->vm_flags & VM_DONTEXPAND));` in
> drm_gem_mmap_obj() during mmap() of an imported dma-buf from the out of
> tree Apple ISP camera capture driver which uses vb2_dma_sg_memops.
>
> gst-launch-1.0 v4l2src ! gtk4paintablesink
>
> [   38.201528] ------------[ cut here ]------------
> [   38.202135] WARNING: CPU: 7 PID: 2362 at drivers/gpu/drm/drm_gem.c:1144 drm_gem_mmap_obj+0x1f8/0x210
> [   38.203278] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer
> snd_seq snd_seq_device uinput nf_conntrack_netbios_ns
> nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
> nft_reject_inet nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables qrtr bnep
> nls_ascii i2c_dev loop fuse dm_multipath nfnetlink brcmfmac_wcc
> hid_magicmouse hci_bcm4377 brcmfmac brcmutil bluetooth ecdh_generic
> cfg80211 ecc btrfs xor xor_neon rfkill hid_apple raid6_pq joydev
> aop_als apple_nvmem_spmi industrialio snd_soc_aop apple_z2
> snd_soc_cs42l84 tps6598x snd_soc_tas2764 macsmc_reboot spi_nor
> macsmc_hwmon rtc_macsmc gpio_macsmc macsmc_power regmap_spmi
> macsmc_input dockchannel_hid panel_summit appledrm nvme_apple dwc3
> snd_soc_macaudio drm_client_lib nvme_core phy_apple_atc hwmon
> apple_sart apple_dockchannel macsmc apple_rtkit_helper
> spmi_apple_controller aop apple_wdt mfd_core nvmem_apple_efuses
> pinctrl_apple_gpio apple_isp apple_dcp videobuf2_dma_sg mux_core
> spi_apple
> [   38.203300]  videobuf2_memops i2c_pasemi_platform snd_soc_apple_mca videobuf2_v4l2 videodev clk_apple_nco videobuf2_common snd_pcm_dmaengine adpdrm asahi apple_admac adpdrm_mipi drm_dma_helper pwm_apple i2c_pasemi_core drm_display_helper mc cec apple_dart ofpart apple_soc_cpufreq leds_pwm phram
> [   38.217677] CPU: 7 UID: 1000 PID: 2362 Comm: gst-launch-1.0 Tainted: G        W           6.17.6+ #asahi-dev PREEMPT(full)
> [   38.219040] Tainted: [W]=WARN
> [   38.219398] Hardware name: Apple MacBook Pro (13-inch, M2, 2022) (DT)
> [   38.220213] pstate: 21400005 (nzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [   38.221088] pc : drm_gem_mmap_obj+0x1f8/0x210
> [   38.221643] lr : drm_gem_mmap_obj+0x78/0x210
> [   38.222178] sp : ffffc0008dc678e0
> [   38.222579] x29: ffffc0008dc678e0 x28: 0000000000042a97 x27: ffff8000b701b480
> [   38.223465] x26: 00000000000000fb x25: ffffc0008dc67d20 x24: ffffc0008dc67968
> [   38.224402] x23: ffff8000e3ca5600 x22: ffff8000265b7800 x21: ffff80003000c0c0
> [   38.225279] x20: 0000000000000000 x19: ffff8000b68c5200 x18: ffffc0008dc67968
> [   38.226151] x17: 0000000000000000 x16: 0000000000000000 x15: ffffc000810a30a8
> [   38.227042] x14: 00007fff637effff x13: 00005555de91ffff x12: 00007fff63293fff
> [   38.227942] x11: 0000000000000000 x10: ffff8000184ecf08 x9 : ffffc0007a1900c8
> [   38.228824] x8 : ffffc0008dc67968 x7 : 0000000000000012 x6 : ffffc0015cf1c000
> [   38.229703] x5 : ffffc0008dc676a0 x4 : ffffc00081a27dc0 x3 : 0000000000000038
> [   38.230607] x2 : 0000000000000003 x1 : 0000000000000003 x0 : 00000000100000fb
> [   38.231488] Call trace:
> [   38.231806]  drm_gem_mmap_obj+0x1f8/0x210 (P)
> [   38.232342]  drm_gem_mmap+0x140/0x260
> [   38.232813]  __mmap_region+0x488/0x9a0
> [   38.233277]  mmap_region+0xd0/0x148
> [   38.233703]  do_mmap+0x350/0x5c0
> [   38.234148]  vm_mmap_pgoff+0x14c/0x200
> [   38.234612]  ksys_mmap_pgoff+0x150/0x208
> [   38.235107]  __arm64_sys_mmap+0x34/0x50
> [   38.235611]  invoke_syscall+0x50/0x120
> [   38.236075]  el0_svc_common.constprop.0+0x48/0xf0
> [   38.236680]  do_el0_svc+0x24/0x38
> [   38.237113]  el0_svc+0x38/0x168
> [   38.237507]  el0t_64_sync_handler+0xa0/0xe8
> [   38.238034]  el0t_64_sync+0x198/0x1a0
> [   38.238491] ---[ end trace 0000000000000000 ]---
>
> There were discussions in [1] at the end of 2023 that mmap() on imported
> dma-bufs should not be supported but as of v6.17 drm_gem_shmem_mmap() in
> drm_gem_shmem_helper.c still supports it.
> This might affect all gpu or accel drivers using drm_gem_shmem_mmap() or
> the wrapper drm_gem_shmem_object_mmap().
>
> [1] https://lore.kernel.org/dri-devel/bc7f7844-0aa3-4802-b203-69d58e8be2fa@linux.intel.com/
>
> Cc: stable@vger.kernel.org
> Fixes: 5ba3f757f059 ("[media] v4l: videobuf2: add DMA scatter/gather allocator")
> Signed-off-by: Janne Grunau <j@jannau.net>

This looks like an oversight from the beginning of videobuf2-dma-sg.

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> included DRM maintainers due to warning triggered from DRM code.
> ---
>   drivers/media/common/videobuf2/videobuf2-dma-sg.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index b3bf2173c14e1b3bedb8ab0bd60c889a0b97cbe3..7c30731cb9a57bebb3cf418e627e7c9f09ba8642 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -345,6 +345,7 @@ static int vb2_dma_sg_mmap(void *buf_priv, struct vm_area_struct *vma)
>   		return err;
>   	}
>   
> +	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
>   	/*
>   	 * Use common vm_area operations to track buffer refcount.
>   	 */
>
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260215-media-vb2-dma-sg-0fa33fdafdde
>
> Best regards,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


