Return-Path: <linux-media+bounces-63212-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PXACj8vHWo4WAkAu9opvQ
	(envelope-from <linux-media+bounces-63212-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 09:05:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2252C61AA50
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 09:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 019B4300D54B
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 07:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BA5382F31;
	Mon,  1 Jun 2026 07:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="L6KHJt0S"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B8B382F1F;
	Mon,  1 Jun 2026 07:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780297428; cv=pass; b=VVS5JBP/MD8UNNr0s7/gqFKI9td9TfgRT7FzFcU7X7YEfOwhL5s2Q5uxCe7Y50aTel9DBEGtX2om8KBBxfgSrOZWEQVbZwzjyTEQ/AT6zknt1spIndbKr5RaM1vhAr2t7zIlPKhjJZam06EKgvtYuLNJ3G18z6dy75T4zlMxNWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780297428; c=relaxed/simple;
	bh=3cVHoTs9yIJLWxEQnk9A0TGwbvrqcT4lJZl9MBwsvfE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=agMbVHD7OgWVH/0U75PwSZrbPT7mmWWPVz8z+1Do4OLVuO2AxBtYvtRVplzk29H3HrAgzc1uZd4MIC9S2XXV5KHAHJrIyXVXqS0KiLyCpvwhQB4AIBdPw3iXv0/t5GuaMaSJRZkrcJAKX15DKWeip4FFNaEGEWDD09Fl9vnzZkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=L6KHJt0S; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1780297408; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fkMe4pbAWpDntsPu1e74bIEM/oqdRyymB/ChZzBA6Ij+MKejLq01j2fZQmoEL+g1NV926gogTPw+zAT+DykEsfF5m4IC79eDvt5R7gYyVDE9LoYBUqUulzEtZw/iqLmWcHbPJAB8TCC+uXU4X4qFPl6T4hwRvyYjcoRi7jCRcQc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780297408; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QLCPiUeXBpuiNP7Dd5XfYFOCbvsBtllxZtOQ2WJE6js=; 
	b=GLoctPx0OnzfMSZFc/CciDZFpqWgg3fo60qW7DyweCgmJn8yFIzhMLzrGqHZGcmXN0rFFZoZn5RTywEE7kSpmnLcHLpEHMg+iiJNYpcsC5g4bdCIjckN3kvD225QtLpZn4B8C66NRhqEIP7oaKGDpY+4GBG42y1/JD9C18Zbm28=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780297408;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=QLCPiUeXBpuiNP7Dd5XfYFOCbvsBtllxZtOQ2WJE6js=;
	b=L6KHJt0SJcleHALx/I8/21KXoJ0EFDVPZeaH1b+NPRTvnTIyzdzig/I8bjRH4azw
	Y399K/dPQTfEhc1EjvVaQ1XGv/eQiDGQR02iMBQSFcE59fIfQu76GzCLvswt9a9Ui9k
	U1t+7MI8xoS5Kp81nn87gJ3UYwyUir/6L1cTej5QeechPhHyI5BZSTmT7ZHrR/9dsPs
	3QMZhFimNPV92HiroyDWd12O4dHqDnVkkCkgYm910k7KH8NnxxsD+2WjicqxeLw+lFz
	oBSzvRrS1PP48Od39az8YISdjjozoKNdjCdUSqjYyAgm0AaDyza2gVweEhOYs4xjFI5
	YzvwjnLYag==
Received: by mx.zohomail.com with SMTPS id 1780297406409465.9604788970639;
	Mon, 1 Jun 2026 00:03:26 -0700 (PDT)
Message-ID: <1e61d12528c7c0a8b8d05f9d789b5b40024e8001.camel@icenowy.me>
Subject: Re: [PATCH] media: mtk-jpeg: fix use-after-free in release path due
 to uncancelled work
From: Icenowy Zheng <uwu@icenowy.me>
To: Fan Wu <fanwu01@zju.edu.cn>, bin.liu@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: irui.wang@mediatek.com, kyrie.wu@mediatek.com, hverkuil@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 01 Jun 2026 15:03:19 +0800
In-Reply-To: <20260304031934.147483-1-fanwu01@zju.edu.cn>
References: <20260304031934.147483-1-fanwu01@zju.edu.cn>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[icenowy.me,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63212-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[zju.edu.cn,mediatek.com,kernel.org,gmail.com,collabora.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,icenowy.me:mid,icenowy.me:dkim,zju.edu.cn:email]
X-Rspamd-Queue-Id: 2252C61AA50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=E5=9C=A8 2026-03-04=E4=B8=89=E7=9A=84 03:19 +0000=EF=BC=8CFan Wu=E5=86=99=
=E9=81=93=EF=BC=9A
> The mtk_jpeg_release() function frees the context structure (ctx)
> without
> first cancelling any pending or running work in ctx->jpeg_work. This
> creates a race window where the workqueue callback may still be
> accessing
> the context memory after it has been freed.

This patch leads to frequent kernel warning on my mt8188-geralt-ciri
device:

```
[   42.493013] ------------[ cut here ]------------
[   42.497645] WARNING: kernel/workqueue.c:4302 at
__flush_work+0x34c/0x380, CPU#2: wireplumber/1100
[   42.506521] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq
snd_seq_device aes_ce_ccm rfcomm hid_himax(OE) bnep mtk_vcodec_dec_hw
btusb memconsole_coreboot btmtk btrtl btbcm vpd_sysfs cbmem
nf_conntrack_netbios_ns memconsole framebuffer_coreboot btintel
nf_conntrack_broadcast nft_fib_inet bluetooth nft_fib_ipv4 nft_fib_ipv6
nft_fib mt7921e nft_reject_inet mt7921_common nf_reject_ipv4
nf_reject_ipv6 mt792x_lib nft_reject mt76_connac_lib mt76 nft_ct
mtk_jpeg mt8188_mt6359 snd_soc_hdmi_codec mtk_vcodec_dec airoha_eth
mt6359_accdet v4l2_vp9 airoha_npu mtk_jpeg_enc_hw mtk_vcodec_enc
snd_soc_mt6359 v4l2_h264 mac80211 nft_chain_nat mtk_vcodec_dbgfs
mtk_jpeg_dec_hw mtk_vcodec_common mtk_vpu cfg80211 ip6table_nat
mtk_mdp3 ip6table_mangle v4l2_mem2mem ip6table_raw ofpart
videobuf2_dma_contig dsa_core videobuf2_memops phylink
ip6table_security hsr cmdlinepart videobuf2_v4l2 videobuf2_common
iptable_nat nf_nat bridge videodev cros_ec_sensors spi_nor nf_conntrack
stp mc cros_ec_sensors_core llc mtd
[   42.506764]  industrialio_triggered_buffer kfifo_buf nf_defrag_ipv6
snd_sof_mt8186 rfkill mtk_adsp_common nf_defrag_ipv4 iptable_mangle
mtk_adsp_ipc snd_soc_es8326 snd_soc_max98390 iptable_raw
snd_sof_xtensa_dsp mediatek_cpufreq_hw iptable_security snd_sof_of
snd_soc_mt8188_afe snd_sof snd_soc_dmic snd_soc_mtk_common
snd_sof_utils mt6359_auxadc snd_soc_core snd_compress ac97_bus mtk_scp
mt6577_auxadc snd_pcm_dmaengine snd_pcm mtk_rpmsg lvts_thermal
nf_tables mtk_scp_ipi snd_timer industrialio rpmsg_core snd
ip6table_filter coreboot_table soundcore ip6_tables iptable_filter
ip_tables x_tables joydev mousedev qrtr tun sch_fq_codel fuse nfnetlink
onboard_usb_dev panel_himax_hx83102 cros_usbpd_charger cros_ec_hwmon
cros_ec_sysfs cros_ec_sensorhub cros_usbpd_notify sbs_battery
gpio_cros_ec hwmon cros_charge_control cros_ec_chardev
cros_usbpd_logger cros_ec_debugfs hid_google_hammer hid_multitouch
hid_vivaldi_common cros_ec_keyb i2c_cros_ec_tunnel hid_generic
led_class cros_ec_dev rtc_mt6397 mt6359_regulator
[   42.594635]  tpm_tis_i2c_cr50 xhci_mtk_hcd i2c_hid_of tpm_tis_spi
i2c_hid tpm_tis_core cros_ec_spi cros_ec clk_mt8188_vdo1
clk_mt8188_vdo0 cros_ec_proto mt6397 clk_mt8188_vpp0 clk_mt8188_vpp1
mtk_dp ghash_ce phy_mtk_dp drm_dp_aux_bus phy_mtk_tphy sm4 mediatek_drm
drm_dma_helper drm_display_helper cec clk_mt8188_ipe clk_mt8188_venc
rc_core clk_mt8188_vdec clk_mt8188_cam clk_mt8188_img clk_mt8188_ccu
clk_mt8188_wpe panfrost mtk_mmsys mtk_mutex governor_simpleondemand
phy_mtk_mipi_dsi_drv clk_mt8188_mfg mtk_cmdq_helper nvmem_mtk_efuse
gpu_sched mtk_smi spi_mtk_nor mtu3 clk_mt8188_imp_iic_wrap mtk_sd roles
mmc_hsq udc_core cqhci spmi_mtk_pmif i2c_mt65xx spmi_devres
pwm_mtk_disp spi_mt65xx clk_mt8188_peri_ao clk_mt8188_adsp_audio26m
clk_mt8188_infra_ao spmi clk_mt8188_apmixedsys mtk_pmic_wrap mtk_wdt
mtk_adsp_mailbox mtk_iommu clk_mt8188_topckgen mtk_cmdq_mailbox fixed
ramoops pwm_bl i2c_dev aes_neon_bs aes_neon_blk aes_ce_blk
[   42.765118] CPU: 2 UID: 975 PID: 1100 Comm: wireplumber Tainted: G=20
W  OE       7.0.10-aosc-main #1 PREEMPT(lazy)=20
[   42.775983] Tainted: [W]=3DWARN, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
[   42.782155] Hardware name: Google Ciri sku1 board (DT)
[   42.787286] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
BTYPE=3D--)
[   42.794243] pc : __flush_work+0x34c/0x380
[   42.798251] lr : __cancel_work_sync+0x90/0xe0
[   42.802604] sp : ffff8000854f3980
[   42.805912] x29: ffff8000854f39e0 x28: ffff0000c9530000 x27:
0000000000000000
[   42.813048] x26: 0000000000000000 x25: 0000000000000000 x24:
0000000000000001
[   42.820183] x23: ffffb0d11de2bd40 x22: ffff0000c98db6c0 x21:
0000000000000001
[   42.827319] x20: 0000000000000000 x19: ffff0000c2679f20 x18:
ffff8000851ad068
[   42.834454] x17: 0000000000000000 x16: 0000000000000000 x15:
0000000000000000
[   42.841588] x14: 0000000000000000 x13: 0000000000000000 x12:
0000000000000000
[   42.848723] x11: 0000000000000000 x10: 0000000000000000 x9 :
ffffb0d11993da28
[   42.855858] x8 : 0000000000000000 x7 : 0000000000000000 x6 :
0000000000000000
[   42.862992] x5 : 0000000000000000 x4 : 0000000000000000 x3 :
0000000000000000
[   42.870126] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
0000000000000000
[   42.877262] Call trace:
[   42.879704]  __flush_work+0x34c/0x380 (P)
[   42.883713]  __cancel_work_sync+0x90/0xe0
[   42.887719]  cancel_work_sync+0x20/0x50
[   42.891551]  mtk_jpeg_release+0x38/0xb0 [mtk_jpeg]
[   42.896348]  v4l2_release+0x94/0x118 [videodev]
[   42.900910]  __fput+0xec/0x330
[   42.903968]  fput_close_sync+0x44/0x160
[   42.907803]  __arm64_sys_close+0x44/0xa0
[   42.911723]  invoke_syscall.constprop.0+0x60/0xf0
[   42.916426]  el0_svc_common.constprop.0+0x114/0x140
[   42.921302]  do_el0_svc+0x28/0x58
[   42.924614]  el0_svc+0x44/0x1e0
[   42.927754]  el0t_64_sync_handler+0xc0/0x108
[   42.932019]  el0t_64_sync+0x1b8/0x1c0
[   42.935680] ---[ end trace 0000000000000000 ]---

```

Thanks,
Icenowy

>=20
> Race condition:
>=20
> =C2=A0=C2=A0=C2=A0 CPU 0 (release)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 CPU 1 (workqueue)
> =C2=A0=C2=A0=C2=A0 ----------------=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --=
----------------
> =C2=A0=C2=A0=C2=A0 close()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtk_jpeg_release()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 mtk_jpegenc_worker()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ctx =3D work->data
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 // accessing ctx
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(ctx)=C2=A0 // freed!
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 access ctx=C2=A0 // UAF!
>=20
> The work is queued via queue_work() during JPEG encode/decode
> operations
> (via mtk_jpeg_device_run). If the device is closed while work is
> pending
> or running, the work handler will access freed memory.
>=20
> Fix this by calling cancel_work_sync() BEFORE acquiring the mutex.
> This
> ordering is critical: if cancel_work_sync() is called after
> mutex_lock(),
> and the work handler also tries to acquire the same mutex, it would
> cause
> a deadlock.
>=20
> Note: The open error path does NOT need cancel_work_sync() because
> INIT_WORK() only initializes the work structure - it does not
> schedule
> it. Work is only scheduled later during ioctl operations.
>=20
> Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index c01124a349f6..8c684756d5fc 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1202,6 +1202,7 @@ static int mtk_jpeg_release(struct file *file)
> =C2=A0	struct mtk_jpeg_dev *jpeg =3D video_drvdata(file);
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D mtk_jpeg_file_to_ctx(file);
> =C2=A0
> +	cancel_work_sync(&ctx->jpeg_work);
> =C2=A0	mutex_lock(&jpeg->lock);
> =C2=A0	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> =C2=A0	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);

