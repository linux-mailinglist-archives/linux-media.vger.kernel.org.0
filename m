Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03E01CF80F
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 16:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgELO4u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 10:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgELO4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 10:56:50 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6F6C061A0C
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 07:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=jJnkB/DzsFl3DKtaEgLPGbM16lqfa5AEGKPzXFeJ9wY=; b=u2W+JJ07OKO1pZDpEcwyVXHWCi
        zOGgiUJf2EfpUS8679+SQtQ8IpOLPlYecVkTWIJun4tQsWJUo6dxr6yDMkFm6UCwNNlCn7j8/5XHF
        Hy/cxQzSCe50cVYTHxXtiBH2CloS0KDP5XOOxqmq1KVVHM3ECjOMnny4t0g0pTuyYNUt0UbQUPlxX
        epJifjMSzk5gqUwrQd892EOhheO2aLZVvEITPbjpuhxg35I4Y6m1EJD/2FtaG2kO8KC44RF+xkZB5
        Yjy3oYtdIsy/jTAfDZyUaaDWIQ6hel1suO+IMj6D0wPWAf8xGld2i2LJB02uAhCFeGPLcv357iSG2
        IwlUOGRQ==;
Received: from ip5f5ad5c5.dynamic.kabel-deutschland.de ([95.90.213.197] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jYWKv-0005UK-Gj; Tue, 12 May 2020 14:56:49 +0000
Date:   Tue, 12 May 2020 16:56:44 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200512165644.6609098b@coco.lan>
In-Reply-To: <CAHp75VdDm+NLVdG7AfwO=FwmA=naqVwAiqbUyyUWc4hwHHSRHg@mail.gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
        <20200502190414.7ede79b6@coco.lan>
        <CAHp75VeeQ61nUCDr3Fr=mrhxKvVRZ6gWJet+QX+c7jXjTwEhtg@mail.gmail.com>
        <20200512122056.6ae3580f@coco.lan>
        <CAHp75VdjdZCFq=uk0M9QG0tNf+wfD6iFzZvmzBWTWNVpgUpfxQ@mail.gmail.com>
        <CAHp75VdDm+NLVdG7AfwO=FwmA=naqVwAiqbUyyUWc4hwHHSRHg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 12 May 2020 14:21:49 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Tue, May 12, 2020 at 2:12 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, May 12, 2020 at 1:21 PM Mauro Carvalho Chehab
> > <mchehab@kernel.org> wrote:
> > > Em Sat, 2 May 2020 20:33:14 +0300
> > > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> > > > On Sat, May 2, 2020 at 8:04 PM Mauro Carvalho Chehab <mchehab@kerne=
l.org> wrote:
> > > > > Em Sat, 2 May 2020 19:08:36 +0300
> > > > > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
>=20
> ...
>=20
> > Btw, https://git.linuxtv.org/mchehab/experimental.git/commit/?h=3Datomi=
sp_v2.1&id=3D65608aa8d34ea274600ab2cf6f0cf54ee86d8fd1
> > is incorrect approach. Look closer what PCI does in case when
> > pcim_enable_device() has been called.
>=20
> This has resource leaks
> https://git.linuxtv.org/mchehab/experimental.git/commit/?h=3Datomisp_v2.1=
&id=3D88b03de5d705f5f46a896dbd21ef9472030bb8d3
>=20
> Easier just to acpi_handle_info(ACPI_HANDLE(...), ...);
>=20
> We don't enumerate them w/o ACPI IIRC.

Well, at least while in staging, it would be good to know more details
about the probing issues on different hardware that people might be
testing it.

avoiding to use a get_device() here is not possible, because the
prints will use the adev to return some info we may need:

	ov2680 i2c-OVTI2680:00: ov2680_probe: ACPI detected it on bus ID=3DCAM1, H=
ID=3DOVTI2680

This, together with the DMI product ID on this message:

	atomisp-isp2 0000:00:03.0: Detected Cherrytrail version 54 (ISP2401) on T1=
01HA

may help to avoid users to run acpixtract/iasl/dmidecode when adding
new entries to the dmi match tables. Not 100%, since BIOSes may=20
still use different names for the sensor data.

>=20
> P.S. Yes, I understand that is WIP, but better to get rid  of
> unnecessary / incorrect work from the day 1 :-)

Agreed.

I added a call to "acpi_dev_put(adev)" after using the info, in order
to avoid the leak.

Btw, I guess we got some progress with the current version:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=3Datomisp_v2.1

This is what it outputs to dmesg:

[   78.131669] atomisp-isp2 0000:00:03.0: Detected Cherrytrail version 54 (=
ISP2401) on T101HA
[   78.131684] atomisp-isp2 0000:00:03.0: enabling device (0000 -> 0002)
[   78.131924] atomisp-isp2 0000:00:03.0: start: 0x91000000
[   78.132121] atomisp-isp2 0000:00:03.0: base: 00000000e25c1a2a
[   78.132124] atomisp-isp2 0000:00:03.0: atomisp_io_base: 00000000e25c1a2a
[   78.132135] atomisp-isp2 0000:00:03.0: ISP HPLL frequency base =3D 1600 =
MHz
[   78.236722] atomisp-isp2 0000:00:03.0: Firmware version may not be compa=
tible with this driver
[   78.236735] atomisp-isp2 0000:00:03.0: Expecting version 'irci_ecr - mas=
ter_20150911_0724', but firmware is 'irci_stable_bw10p_0518_20150801_0537'.
[   79.533784] atomisp-isp2 0000:00:03.0: no camera attached or fail to det=
ect
[   79.533829] atomisp-isp2 0000:00:03.0: atomisp_csi_lane_config: the port=
config is 4-1-0, CSI_CONTROL is 0x000000FC
[   79.533845] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP C=
SI2-port0 was not initialized!
[   79.533872] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP C=
SI2-port1 was not initialized!
[   79.533889] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP C=
SI2-port2 was not initialized!
[   79.533905] atomisp-isp2 0000:00:03.0: Entity type for entity file_input=
_subdev was not initialized!
[   79.533923] atomisp-isp2 0000:00:03.0: Entity type for entity tpg_subdev=
 was not initialized!
[   79.533938] atomisp-isp2 0000:00:03.0: Entity type for entity ATOMISP_SU=
BDEV_0 was not initialized!
[   79.537195] atomisp-isp2 0000:00:03.0: Entity type for entity ATOMISP_SU=
BDEV_1 was not initialized!
[   79.538732] atomisp-isp2 0000:00:03.0: FILE_INPUT enable, camera_cnt: 0
[   79.538746] atomisp-isp2 0000:00:03.0: TPG detected, camera_cnt: 1
[   79.540979] atomisp-isp2 0000:00:03.0: atomisp_save_iunit_reg
[   79.541096] atomisp-isp2 0000:00:03.0: DFS target frequency=3D100.
[   79.541107] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[   79.541133] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to=
 be 0.
[   79.541247] atomisp-isp2 0000:00:03.0: atomisp_ospm_dphy_down
[   79.541282] atomisp-isp2 0000:00:03.0: IUNIT power-off.
[   79.546938] atomisp-isp2 0000:00:03.0: Firmware version may not be compa=
tible with this driver
[   79.546946] atomisp-isp2 0000:00:03.0: Expecting version 'irci_ecr - mas=
ter_20150911_0724', but firmware is 'irci_stable_bw10p_0518_20150801_0537'.
[   79.590508] atomisp_ov2680: module is from the staging directory, the qu=
ality is unknown, you have been warned.
[   79.591775] atomisp-isp2 0000:00:03.0: IUNIT power-off timeout.
[   79.602168] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP CAPTURE o=
utput
[   79.604503] ov2680 i2c-OVTI2680:00: ov2680_probe: ACPI detected it on bu=
s ID=3DCAM1, HID=3DOVTI2680
[   79.604545] ov2680 i2c-OVTI2680:00: found 'INT33F5:00' at address 0x5e, =
adapter 6
[   79.604550] ov2680 i2c-OVTI2680:00: gmin: power management provided via =
Dollar Cove TI PMIC (i2c addr 0x5e)
[   79.604566] ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_Cam=
Clk'
[   79.604573] ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_Clk=
Src'
[   79.604577] ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_Csi=
Port'
[   79.604582] ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_Csi=
Lanes'
[   79.604816] ov2680 i2c-OVTI2680:00: Found DMI entry for 'gmin_V1P8GPIO'
[   79.604823] ov2680 i2c-OVTI2680:00: Found DMI entry for 'gmin_V2P8GPIO'
[   79.604829] ov2680 i2c-OVTI2680:00: I2C write, addr: 0x5e, reg: 0x4a, va=
lue: 0x59, mask: 0xff
[   79.606914] ov2680 i2c-OVTI2680:00: I2C write, addr: 0x5e, reg: 0x49, va=
lue: 0x2f, mask: 0xff
[   79.611351] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP CAPTURE o=
utput
[   79.617114] sh_css_hrt_system_is_idle() 44: warning: SP not idle
[   79.617128] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
[   79.617539] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is =
not empty
[   79.617909] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is =
not empty
[   79.618020] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
[   79.625849] ------------[ cut here ]------------
[   79.625858] virt_to_cache: Object is not a Slab page!
[   79.625894] WARNING: CPU: 0 PID: 1396 at mm/slab.h:475 cache_from_obj+0x=
ab/0xf0
[   79.625897] Modules linked in: atomisp_ov2680(CE+) atomisp(CE) videobuf_=
vmalloc(E) videobuf_core(E) videodev(E) mc(E) ccm(E) nft_fib_inet(E) nft_fi=
b_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) n=
f_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) ip6table_nat(E) i=
p6table_mangle(E) ip6table_raw(E) ip6table_security(E) iptable_nat(E) nf_na=
t(E) nf_conntrack(E) nf_defrag_ipv6(E) libcrc32c(E) nf_defrag_ipv4(E) iptab=
le_mangle(E) iptable_raw(E) iptable_security(E) ip_set(E) nf_tables(E) nfne=
tlink(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E) cmac(E) bnep(E)=
 sunrpc(E) vfat(E) fat(E) snd_soc_sst_cht_bsw_rt5645(E) mei_hdcp(E) gpio_ke=
ys(E) intel_rapl_msr(E) intel_powerclamp(E) coretemp(E) kvm_intel(E) kvm(E)=
 irqbypass(E) crct10dif_pclmul(E) crc32_pclmul(E) ghash_clmulni_intel(E) in=
tel_cstate(E) asus_nb_wmi(E) wdat_wdt(E) pcspkr(E) ath10k_pci(E) ath10k_cor=
e(E) intel_chtdc_ti_pwrbtn(E) ath(E) mac80211(E) btusb(E) btrtl(E) joydev(E=
) btbcm(E) btintel(E)
[   79.625960]  bluetooth(E) ecdh_generic(E) libarc4(E) ecc(E) cfg80211(E) =
hid_sensor_accel_3d(E) hid_sensor_gyro_3d(E) hid_sensor_trigger(E) hid_sens=
or_iio_common(E) industrialio_triggered_buffer(E) kfifo_buf(E) industrialio=
(E) snd_soc_rt5645(E) snd_soc_rl6231(E) snd_intel_sst_acpi(E) snd_intel_sst=
_core(E) intel_hid(E) snd_soc_sst_atom_hifi2_platform(E) snd_soc_acpi_intel=
_match(E) snd_soc_acpi(E) spi_pxa2xx_platform(E) snd_soc_core(E) snd_compre=
ss(E) dw_dmac(E) int3406_thermal(E) int3403_thermal(E) snd_hdmi_lpe_audio(E=
) int3400_thermal(E) acpi_thermal_rel(E) snd_seq(E) intel_int0002_vgpio(E) =
soc_button_array(E) acpi_pad(E) snd_seq_device(E) intel_xhci_usb_role_switc=
h(E) snd_pcm(E) snd_timer(E) snd(E) soundcore(E) mei_txe(E) lpc_ich(E) mei(=
E) processor_thermal_device(E) intel_soc_dts_iosf(E) intel_rapl_common(E) i=
nt340x_thermal_zone(E) ip_tables(E) hid_sensor_hub(E) intel_ishtp_loader(E)=
 intel_ishtp_hid(E) mmc_block(E) hid_multitouch(E) crc32c_intel(E) i915(E) =
i2c_algo_bit(E) hid_asus(E)
[   79.626014]  drm_kms_helper(E) asus_wmi(E) sparse_keymap(E) rfkill(E) in=
tel_ish_ipc(E) intel_ishtp(E) drm(E) wmi(E) video(E) i2c_hid(E) pwm_lpss_pl=
atform(E) pwm_lpss(E) sdhci_acpi(E) sdhci(E) mmc_core(E) fuse(E)
[   79.626038] CPU: 0 PID: 1396 Comm: v4l_id Tainted: G         C  E     5.=
7.0-rc2+ #40
[   79.626041] Hardware name: ASUSTeK COMPUTER INC. T101HA/T101HA, BIOS T10=
1HA.306 04/23/2019
[   79.626047] RIP: 0010:cache_from_obj+0xab/0xf0
[   79.626053] Code: c3 31 c0 80 3d 1c 38 72 01 00 75 f0 48 c7 c6 20 12 06 =
b4 48 c7 c7 10 f3 37 b4 48 89 04 24 c6 05 01 38 72 01 01 e8 2c 99 e0 ff <0f=
> 0b 48 8b 04 24 eb ca 48 8b 57 58 48 8b 48 58 48 c7 c6 30 12 06
[   79.626056] RSP: 0018:ffffac0540febb10 EFLAGS: 00010282
[   79.626060] RAX: 0000000000000029 RBX: 0000000000000048 RCX: 00000000000=
00007
[   79.626063] RDX: 00000000fffffff8 RSI: 0000000000000082 RDI: ffff99ad7bc=
19cc0
[   79.626065] RBP: 0000000000c49000 R08: 00000000000003d8 R09: ffffac0540f=
eb9a0
[   79.626068] R10: 0000000000000005 R11: 0000000000000000 R12: ffffffffc13=
3ca80
[   79.626071] R13: ffff99ac6e040000 R14: 0000000000c49000 R15: ffff99ac6e0=
40000
[   79.626075] FS:  00007f542c0f0b80(0000) GS:ffff99ad7bc00000(0000) knlGS:=
0000000000000000
[   79.626078] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   79.626080] CR2: 0000563de87ab268 CR3: 00000001455f6000 CR4: 00000000001=
006f0
[   79.626083] Call Trace:
[   79.626097]  kmem_cache_free+0x19/0x180
[   79.626167]  mmu_l2_unmap+0xd1/0x100 [atomisp]
[   79.626213]  mmu_unmap+0xd0/0xf0 [atomisp]
[   79.626257]  hmm_bo_unbind+0x62/0xb0 [atomisp]
[   79.626304]  hmm_free+0x44/0x60 [atomisp]
[   79.626345]  ia_css_spctrl_unload_fw+0x30/0x50 [atomisp]
[   79.626387]  ia_css_uninit+0x3a/0x90 [atomisp]
[   79.626428]  atomisp_open+0x501/0x5c0 [atomisp]
[   79.626458]  v4l2_open+0x85/0xf0 [videodev]
[   79.626468]  chrdev_open+0xdd/0x210
[   79.626473]  ? cdev_device_add+0xc0/0xc0
[   79.626479]  do_dentry_open+0x13a/0x380
[   79.626484]  path_openat+0xa9a/0xfe0
[   79.626491]  do_filp_open+0x75/0x100
[   79.626496]  ? __check_object_size+0x12e/0x13c
[   79.626501]  ? __alloc_fd+0x44/0x150
[   79.626506]  do_sys_openat2+0x8a/0x130
[   79.626512]  __x64_sys_openat+0x46/0x70
[   79.626519]  do_syscall_64+0x5b/0xf0
[   79.626528]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   79.626533] RIP: 0033:0x7f542d23229b
[   79.626539] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 8b 04 25 18 00 =
00 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f 05 <48=
> 3d 00 f0 ff ff 0f 87 91 00 00 00 48 8b 4c 24 28 64 48 2b 0c 25
[   79.626542] RSP: 002b:00007fff3f8f7ca0 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000101
[   79.626547] RAX: ffffffffffffffda RBX: 00007fff3f8f7e98 RCX: 00007f542d2=
3229b
[   79.626549] RDX: 0000000000000000 RSI: 00007fff3f8f8f2f RDI: 00000000fff=
fff9c
[   79.626552] RBP: 00007fff3f8f8f2f R08: 0000000000000000 R09: 00000000000=
00000
[   79.626555] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000000=
00000
[   79.626557] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[   79.626562] ---[ end trace 29196eb433c515e0 ]---
[   79.631279] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: err=
or in iunit interrupt. status reg=3D0xffffffff
[   79.634585] sh_css_hrt_system_is_idle() 44: warning: SP not idle
[   79.634598] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
[   79.634947] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is =
not empty
[   79.635314] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is =
not empty
[   79.635487] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
[   79.636878] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: err=
or in iunit interrupt. status reg=3D0xffffffff
[   79.646387] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP VIDEO out=
put
[   79.678237] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP PREVIEW o=
utput
[   79.680037] sh_css_hrt_system_is_idle() 44: warning: SP not idle
[   79.680051] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
[   79.681501] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is =
not empty
[   79.681871] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is =
not empty
[   79.681983] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
[   79.683462] ov2680 i2c-OVTI2680:00: camera pdata: port: 1 lanes: 1 order=
: 00000002
[   79.684028] ov2680 i2c-OVTI2680:00: sensor_revision id =3D 0x2680, rev=
=3D 0
[   79.684060] ov2680 i2c-OVTI2680:00: I2C write, addr: 0x5e, reg: 0x4a, va=
lue: 0x58, mask: 0xff
[   79.687202] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: err=
or in iunit interrupt. status reg=3D0xffffffff
[   79.687620] ov2680 i2c-OVTI2680:00: I2C write, addr: 0x5e, reg: 0x49, va=
lue: 0x2e, mask: 0xff
[   79.692369] ov2680 i2c-OVTI2680:00: register atomisp i2c module type 1
[   79.740187] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP VIEWFINDE=
R output
[   79.742596] sh_css_hrt_system_is_idle() 44: warning: SP not idle
[   79.743030] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
[   79.743430] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is =
not empty
[   79.743799] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is =
not empty
[   79.743909] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
[   79.745403] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: err=
or in iunit interrupt. status reg=3D0xffffffff
[   79.749602] sh_css_hrt_system_is_idle() 44: warning: SP not idle
[   79.749617] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
[   79.749964] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is =
not empty
[   79.750332] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is =
not empty
[   79.750484] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
[   79.753638] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: err=
or in iunit interrupt. status reg=3D0xffffffff
[   79.776839] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP VIDEO out=
put
[   79.779316] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP MEMORY in=
put
[   79.780289] sh_css_hrt_system_is_idle() 44: warning: SP not idle
[   79.780302] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
[   79.780678] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is =
not empty
[   79.781046] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is =
not empty
[   79.781155] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
[   79.782329] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: err=
or in iunit interrupt. status reg=3D0xffffffff
[   79.790926] sh_css_hrt_system_is_idle() 44: warning: SP not idle
[   79.790946] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
[   79.791294] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is =
not empty
[   79.791702] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is =
not empty
[   79.791814] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
[   79.794120] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: err=
or in iunit interrupt. status reg=3D0xffffffff
[   79.807736] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP ACC
[   79.811965] sh_css_hrt_system_is_idle() 44: warning: SP not idle
[   79.811979] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
[   79.812327] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is =
not empty
[   79.812746] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is =
not empty
[   79.812858] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
[   79.813675] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP ACC
[   79.815783] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: err=
or in iunit interrupt. status reg=3D0xffffffff
[   79.819828] sh_css_hrt_system_is_idle() 44: warning: SP not idle
[   79.819842] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
[   79.820190] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is =
not empty
[   79.820617] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is =
not empty
[   79.820729] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
[   79.821054] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP PREVIEW o=
utput
[   79.821828] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: err=
or in iunit interrupt. status reg=3D0xffffffff
[   79.826462] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP VIEWFINDE=
R output
[   79.827449] sh_css_hrt_system_is_idle() 44: warning: SP not idle
[   79.827462] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
[   79.827812] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is =
not empty
[   79.828188] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is =
not empty
[   79.828299] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
[   79.830094] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: err=
or in iunit interrupt. status reg=3D0xffffffff
[   79.842812] sh_css_hrt_system_is_idle() 44: warning: SP not idle
[   79.842830] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
[   79.843724] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is =
not empty
[   79.845134] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is =
not empty
[   79.845760] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
[   79.847366] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: err=
or in iunit interrupt. status reg=3D0xffffffff
[  146.677485] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP CAPTURE o=
utput
[  146.687599] sh_css_hrt_system_is_idle() 44: warning: SP not idle
[  146.687611] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
[  146.687991] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is =
not empty
[  146.688359] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is =
not empty
[  146.688478] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
[  146.689792] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: err=
or in iunit interrupt. status reg=3D0xffffffff

=46rom the above, it sounds that both the ISP and the sensors got power,
although there are still some things to be fixed there, at the "pre_power"
part.

The memory alloc code has bugs, and it may have issues due to the
incompatibility between the firmware I used and the one used to
generate this driver's version.

Trying to open a video devnode returns error and produce those logs:

	[ 3262.961623] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP CAPTURE =
output
	[ 3262.971350] sh_css_hrt_system_is_idle() 44: warning: SP not idle
	[ 3262.971364] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
	[ 3262.971712] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is=
 not empty
	[ 3262.972079] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is=
 not empty
	[ 3262.972188] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	[ 3262.974982] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: er=
ror in iunit interrupt. status reg=3D0xffffffff

Thanks,
Mauro
