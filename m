Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9CC6A17C4
	for <lists+linux-media@lfdr.de>; Fri, 24 Feb 2023 09:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjBXIOR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Feb 2023 03:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjBXIOQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Feb 2023 03:14:16 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2700C367D3
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 00:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677226455; x=1708762455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nHIWGaKsJPdlh5gF1nOkkFbUI1/jl8K5ddFeNRoqJyE=;
  b=WAvTrar8ujF2DX20g2nm/VCDP7FkFifCn9w9LsMO9ZVOvqbs+CRHx3oy
   hVQ8pEGKsa5Jtplvdci5bhRtH0tLkFeUWiedcypp/FkilnFulrUDP+GJR
   03OPxE1sKznACOxIty6fTBwtvW5UQCYlXuEF9hSgeX33Gd0nEthazHzzK
   iWLalCyLlvKoU558sb5BjQ7nbTkASyKxwuDP0GB/6SKP6D5GlNU7YhEgn
   6q5zJh8QdYEQ/2tDTaFh9rWS3XAT/wD+jlj6YNy5m9OMXWwJyi+BcndEo
   7okF5Wb70z2DI/UVI72F1dj+12Qn1xQOV2X/86FPLk6r5wb81Lk4NZqdS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="332109306"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="332109306"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 00:14:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="736720022"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="736720022"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 00:14:03 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 63D24121357;
        Fri, 24 Feb 2023 10:14:00 +0200 (EET)
Date:   Fri, 24 Feb 2023 10:14:00 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        tomi.valkeinen@ideasonboard.com
Subject: Re: IPU3 cameras not working with latest kernel code ?
Message-ID: <Y/hxyEd/WpRfBQaL@kekkonen.localdomain>
References: <441f2951-402b-0f3c-5ea6-8d6df3f3e894@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <441f2951-402b-0f3c-5ea6-8d6df3f3e894@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Feb 23, 2023 at 11:04:12PM +0100, Hans de Goede wrote:
> Hi All,
>=20
> While trying to test Kate's tps68470 patches for the privacy LED
> on the back of the Surface Go 1/2 I hit this oops when trying
> to run qcam:

Thanks for reporting this.

There have been recent changes in how link validation works, also cc Tomi.

>=20
> [  162.502551] BUG: unable to handle page fault for address: 000000010000=
008f
> [  162.502561] #PF: supervisor read access in kernel mode
> [  162.502566] #PF: error_code(0x0000) - not-present page
> [  162.502570] PGD 0 P4D 0=20
> [  162.502577] Oops: 0000 [#1] PREEMPT SMP PTI
> [  162.502583] CPU: 3 PID: 2030 Comm: qcam Tainted: G         C         6=
=2E2.0+ #132
> [  162.502589] Hardware name: Microsoft Corporation Surface Go/Surface Go=
, BIOS 1.0.30 12/22/2020
> [  162.502593] RIP: 0010:v4l2_subdev_link_validate+0x12a/0x1b0 [videodev]
> [  162.502631] Code: ed 74 56 8b 0d 53 c8 59 f0 85 c9 75 1d 48 8b bd 90 0=
0 00 00 31 f6 e8 95 bc 5d ef 48 89 df e8 5d fc ff ff 89 c3 e9 5b ff ff ff <=
48> 8b bd 90 00 00 00 be ff ff ff ff 48 83 c7 68 e8 b1 d2 5c ef 83
> [  162.502637] RSP: 0018:ffffb65766b93bb8 EFLAGS: 00010202
> [  162.502642] RAX: ffff95d443bf0b18 RBX: ffff95d46a84a3c0 RCX: 000000000=
0000001
> [  162.502646] RDX: 0000000000000001 RSI: 610f11f85a19d2aa RDI: ffff95d46=
a84a3c0
> [  162.502650] RBP: 00000000ffffffff R08: 0000000000000004 R09: ffff95d44=
3bf3f40
> [  162.502654] R10: 0000000000000004 R11: 000000000c3a0bc4 R12: 000000000=
0000000
> [  162.502657] R13: ffff95d443bf04e8 R14: ffff95d443bf3de8 R15: ffff95d44=
3bf3f40
> [  162.502661] FS:  00007f8181d9e6c0(0000) GS:ffff95d4aad80000(0000) knlG=
S:0000000000000000
> [  162.502666] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  162.502670] CR2: 000000010000008f CR3: 000000014506e003 CR4: 000000000=
03706e0
> [  162.502675] Call Trace:
> [  162.502678]  <TASK>
> [  162.502685]  __media_pipeline_start+0x505/0x6f0 [mc]
> [  162.502710]  media_pipeline_start+0x32/0x50 [mc]
> [  162.502728]  imgu_vb2_start_streaming+0x90/0x270 [ipu3_imgu]
> [  162.502750]  vb2_start_streaming+0x6d/0x120 [videobuf2_common]
> [  162.502767]  vb2_core_streamon+0xa4/0x100 [videobuf2_common]
> [  162.502782]  __video_do_ioctl+0x18b/0x3c0 [videodev]
> [  162.502822]  video_usercopy+0x2b9/0x8f0 [videodev]
> [  162.502852]  ? __pfx___video_do_ioctl+0x10/0x10 [videodev]
> [  162.502895]  ? lock_release+0x135/0x2d0
> [  162.502911]  v4l2_ioctl+0x46/0x50 [videodev]
> [  162.502937]  __x64_sys_ioctl+0x8d/0xd0
> [  162.502946]  do_syscall_64+0x58/0x80
> [  162.502956]  ? do_syscall_64+0x67/0x80
> [  162.502962]  ? lockdep_hardirqs_on+0x7d/0x100
> [  162.502969]  ? do_syscall_64+0x67/0x80
> [  162.502975]  ? do_syscall_64+0x67/0x80
> [  162.502982]  ? asm_exc_page_fault+0x22/0x30
> [  162.502991]  ? lockdep_hardirqs_on+0x7d/0x100
> [  162.502997]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  162.503004] RIP: 0033:0x7f8194b23baf
> [  162.503010] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [  162.503015] RSP: 002b:00007f8181d9c460 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
> [  162.503021] RAX: ffffffffffffffda RBX: 00007f8178011120 RCX: 00007f819=
4b23baf
> [  162.503025] RDX: 00007f8178011350 RSI: 0000000040045612 RDI: 000000000=
0000010
> [  162.503028] RBP: 00007f8178010bd0 R08: 00007f817800db10 R09: 00007f817=
8016670
> [  162.503032] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f817=
80127f0
> [  162.503035] R13: 00007f8178010ab0 R14: 00007f8178010bd0 R15: 00007f817=
8012950
> [  162.503050]  </TASK>
> [  162.503053] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer snd_so=
f_pci_intel_skl snd_sof_intel_hda_common bnep soundwire_intel soundwire_gen=
eric_allocation soundwire_cadence snd_sof_intel_hda snd_sof_pci snd_sof_xte=
nsa_dsp snd_sof dw9719 snd_sof_utils soundwire_bus mei_pxp mei_hdcp snd_soc=
_avs snd_soc_hda_codec gpio_tps68470 intel_rapl_msr snd_soc_skl snd_soc_hda=
c_hda snd_hda_ext_core snd_soc_sst_ipc snd_hda_codec_hdmi snd_soc_sst_dsp s=
nd_soc_acpi_intel_match snd_hda_codec_realtek snd_soc_acpi snd_hda_codec_ge=
neric ledtrig_audio qrtr snd_soc_core snd_compress ac97_bus intel_tcc_cooli=
ng snd_pcm_dmaengine x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda=
_intel snd_intel_dspcfg kvm_intel ath10k_pci snd_intel_sdw_acpi ath10k_core=
 kvm snd_hda_codec irqbypass rapl intel_cstate intel_uncore mac80211 snd_hd=
a_core btusb snd_hwdep snd_seq btrtl snd_seq_device btbcm intel_wmi_thunder=
bolt libarc4 pcspkr snd_pcm btintel ath btmtk bluetooth cfg80211 snd_timer =
snd hid_sensor_als
> [  162.503166]  hid_sensor_rotation hid_sensor_gyro_3d hid_sensor_accel_3=
d ecdh_generic soundcore joydev hid_sensor_trigger hid_sensor_iio_common in=
dustrialio_triggered_buffer kfifo_buf rfkill industrialio intel_xhci_usb_ro=
le_switch ipu3_imgu(C) ipu3_cio2 processor_thermal_device_pci_legacy proces=
sor_thermal_device processor_thermal_rfim processor_thermal_mbox videobuf2_=
dma_sg mei_me videobuf2_memops mei processor_thermal_rapl intel_rapl_common=
 videobuf2_v4l2 videobuf2_common intel_soc_dts_iosf idma64 intel_pch_therma=
l intel_skl_int3472_tps68470 leds_tps68470 tps68470_regulator clk_tps68470 =
ov5693 soc_button_array vfat ov7251 fat ov8865 v4l2_fwnode v4l2_async intel=
_skl_int3472_discrete videodev int3403_thermal mc int340x_thermal_zone inte=
l_hid int3400_thermal sparse_keymap acpi_thermal_rel acpi_pad zram hid_sens=
or_hub intel_ishtp_hid i915 mmc_block crct10dif_pclmul crc32_pclmul crc32c_=
intel drm_buddy drm_display_helper sdhci_pci cqhci rtsx_pci_sdmmc sdhci cec=
 intel_ish_ipc ucsi_acpi
> [  162.503269]  ghash_clmulni_intel hid_multitouch sha512_ssse3 typec_ucs=
i serio_raw mmc_core intel_ishtp rtsx_pci ttm typec i2c_hid_acpi i2c_hid vi=
deo wmi pinctrl_sunrisepoint ip6_tables ip_tables i2c_dev fuse
> [  162.503304] CR2: 000000010000008f
> [  162.503309] ---[ end trace 0000000000000000 ]---
> [  162.503313] RIP: 0010:v4l2_subdev_link_validate+0x12a/0x1b0 [videodev]
> [  162.503347] Code: ed 74 56 8b 0d 53 c8 59 f0 85 c9 75 1d 48 8b bd 90 0=
0 00 00 31 f6 e8 95 bc 5d ef 48 89 df e8 5d fc ff ff 89 c3 e9 5b ff ff ff <=
48> 8b bd 90 00 00 00 be ff ff ff ff 48 83 c7 68 e8 b1 d2 5c ef 83
> [  162.503351] RSP: 0018:ffffb65766b93bb8 EFLAGS: 00010202
> [  162.503356] RAX: ffff95d443bf0b18 RBX: ffff95d46a84a3c0 RCX: 000000000=
0000001
> [  162.503360] RDX: 0000000000000001 RSI: 610f11f85a19d2aa RDI: ffff95d46=
a84a3c0
> [  162.503363] RBP: 00000000ffffffff R08: 0000000000000004 R09: ffff95d44=
3bf3f40
> [  162.503366] R10: 0000000000000004 R11: 000000000c3a0bc4 R12: 000000000=
0000000
> [  162.503370] R13: ffff95d443bf04e8 R14: ffff95d443bf3de8 R15: ffff95d44=
3bf3f40
> [  162.503373] FS:  00007f8181d9e6c0(0000) GS:ffff95d4aad80000(0000) knlG=
S:0000000000000000
> [  162.503378] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  162.503381] CR2: 000000010000008f CR3: 000000014506e003 CR4: 000000000=
03706e0
>=20
> Note this is with a 6.2 kernel with:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=3D=
media-atomisp
>=20
> merged into it, which brings in most of media_stage.git/master, so chance=
s are
> this is caused by some of recent v4l2-core changes heading towards 6.3 .
>=20
> I have checked if later media_stage.git/master changes may fix this,
> but the only possibly relevant from after I rebased my media-atomisp
> on top of media_stage.git/master is:
>=20
> https://git.linuxtv.org/media_stage.git/commit/?id=3Da967a3a788028f541e4d=
b54beabcebc3648997db
>=20
> which does not directly seem likes a likely candidate for this.
>=20
> Before I spend time on debugging this I was wondering if anyone has any
> idea of what might be going on here ?
>=20
> Also note that the invalid pointer causing this does not look like
> a pointer at all, it looks more like 2 32 bit int fields to me?  :
>=20
> "BUG: unable to handle page fault for address: 000000010000008f"

If you have a little bit more time, could you enable dynamic debug in
v4l2-subdev to see if it prints anything interesting?

--=20
Kind regards,

Sakari Ailus
