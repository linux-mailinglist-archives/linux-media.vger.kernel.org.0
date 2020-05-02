Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C2F1C262A
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 16:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgEBOaO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 10:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbgEBOaN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 10:30:13 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09ED3C061A0C
        for <linux-media@vger.kernel.org>; Sat,  2 May 2020 07:30:13 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x18so15330035wrq.2
        for <linux-media@vger.kernel.org>; Sat, 02 May 2020 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JZn3PBtPKWQHICyiJv9bOn2MbP7mYUkW7yMhl8xMtxI=;
        b=fNOg/LExbPKV7GGQ2iYGQejKfVuQCUrGO8ZyH99x8WtLg2kb6C55sjt2w5hHknl8R4
         vAGdeMRxls4TJ7gKEpHhW1Y3Mxd8DeMUmHAk7W5Dz1U5zDr92oSKWWLRNLGk/sGeqMYf
         jUDlwfi/f8RXHrgyqTeIVSP5hNlhswGI1bfeSpoj3RWCPKvsiN0R2jyL8dY7aFkhNQVc
         44dc8ma5EuLu5acyknQBA43GK/BLrJXsvce35pvTaGy4/lx6DVyC+FAVyvfXZBqDNJrQ
         O+eMQ65FgFgY293V8+DSKbK7+uStVr1p/ZqHMBCKGItGjz0c8BEzp3hlPKPCxvc4a5PM
         9DIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JZn3PBtPKWQHICyiJv9bOn2MbP7mYUkW7yMhl8xMtxI=;
        b=osTMlAPkr9IVyOsGiy1cUVuFuKjSXFoJw6kPHGT0uYASx6LO1kC1FYVXzaSDssB8Ni
         c0mRFv7cOSGoV2pSUNSeP9KzibfqwF0rBmywVB0cu+v75sij4+/YBv2OgQlMvnXoiXQ8
         kcFEmOpmdS0RPwTccEvxnBmyqmMsDR21F3Seh65liQEs8kq5+BoyqOUDlmpU9811ZFTr
         OzFCIhPyHXIA/LPf7P1HU4xWAsUcIX7zxpks1ajkVsu2ci6Sp/upLmpXC2t6YFwEXxRZ
         27mr/rMfFbDDBtKb+HJ3dCn6nOaoJcZlgInEP6mZ68toNE88xV/mcQNJaPTzo7mWvFy2
         Z3XA==
X-Gm-Message-State: AGi0Puai4ZHd1b6zQGt/vus71JZyOtXx9eBT9RuEidS32Wlp+ou5I46y
        UE/e2g4961ala1VYPjxMZC0=
X-Google-Smtp-Source: APiQypKuRnOmY9ZXNEKGLJzPGgtw5qIwcr9QVMf6sTVstihUrGKeVizBw6ieUOwv+hSf2ibUmXpmNg==
X-Received: by 2002:a5d:6a8b:: with SMTP id s11mr9393427wru.258.1588429811443;
        Sat, 02 May 2020 07:30:11 -0700 (PDT)
Received: from ASUS (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id n25sm4785551wmk.9.2020.05.02.07.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 07:30:11 -0700 (PDT)
Date:   Sat, 2 May 2020 16:29:51 +0200
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200502162951.0ad8a080@ASUS>
In-Reply-To: <20200502113414.618964a9@coco.lan>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <23b3a078-2a9a-5f50-a35e-9f40f5aa8a6e@gmail.com>
        <86413836-e4b5-cb53-3ac0-1764c693ec7b@gmail.com>
        <682558b0-a2cf-9fe2-6e54-20462ecccb5d@gmail.com>
        <20200425132255.4bf872b2@coco.lan>
        <131a4247-cef3-d651-a0ea-defd32b8bf20@gmail.com>
        <20200426185007.1954885a@coco.lan>
        <45817a6a-dd2f-13a6-835b-fd2b04ded23f@gmail.com>
        <20200427235027.15cd4e03@coco.lan>
        <d9ec5067-142c-66c9-c412-51ddf38e44f7@gmail.com>
        <20200429011339.03af3c2a@coco.lan>
        <3b7366b9-463d-c49b-0f2d-51a1d5475a9d@gmail.com>
        <20200429201753.3b2d679b@coco.lan>
        <6fffdf73-a0eb-1b1c-d894-e4799b8ef944@gmail.com>
        <20200430125544.10a9830d@coco.lan>
        <403b799e-6ae9-d62b-1f3a-a1b6b874071b@gmail.com>
        <20200501002510.0ead955d@coco.lan>
        <1a17ffad-9792-a4ff-519e-a4306e7bf3e1@gmail.com>
        <20200501113812.7f16b7ca@coco.lan>
        <20200501192844.397efcaa@ASUS>
        <20200501213023.7fe29188@coco.lan>
        <20200502101542.2972010a@ASUS>
        <20200502113414.618964a9@coco.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2 May 2020 11:34:14 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Sat, 2 May 2020 10:15:42 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> 
>  [...]  
>  [...]  
> 
> > > Ok. Btw, there is a driver for Atomisp on an yocto tree:
> > > 
> > > 	https://github.com/intel-aero/meta-intel-aero.git
> > > 
> > > It got removed back in 2018, but if you checkout this changeset:
> > > 
> > > 	Merge: db1df368eb58 08f476112708
> > > 	Author: Lucas De Marchi <lucas.demarchi@intel.com>
> > > 	Date:   Tue Apr 4 11:51:42 2017 -0700
> > > 
> > > 	    Merge pull request #70 from zehortigoza/jam
> > >         
> > 
> > Cool, the code might give additional information.  
> 
> Yes. And, as it was released from Intel for a specific device,
> it should very likely work for the model supported there (with
> the Yocto 4.4 Kernel). So, it could be valuable to help identifying
> if some of the cleanup patches would have broken something.
> 
> ON a quick look, it sounds that such build was is targeted for
> ISP2401:
> 
> 	+++ b/drivers/media/pci/atomisp/Makefile
> 	@@ -0,0 +1 @@
> 	+obj-$(CONFIG_VIDEO_ATOMISP) += css2401a0_v21_build/
> 
> > I've also send a
> > request regarding the firmware and HW documentation to the author and
> > the engineers that signed the patch. The firmware in the patch has a
> > different version string and the size is surprisingly a few MB bigger
> > than the one I used for the first experiment.   
> 
> There are some vendors that generate a firmware together with a source
> code. This could be the case here. That's my feeling when looking into
> a file like:
> 
> 	drivers/staging/media/atomisp/pci/css_2401_system/spmem_dump.c
> 
> Which contains lots of addresses that it is different betwen 2401 and
> 2400.
> 
> If so, using a different firmware version will likely cause at least
> some parts of the driver to fail.
> 
> 
>  [...]  
>  [...]  
> > 
> > It looks a this firmware is for the 2400 variant; I could also not
> > extract the irci version string. Thus I'll not try them for the moment
> > to perform experiments.  
> 
> Ok.
> 
>  [...]  
> > 
> > It identifies itself as irci_stable_bw10p_0518_20150801_0537;   
> 
> Same year as what we had. Just a little older. Yeah, some things there
> could work.

Below the result from the test with
irci_stable_bw10p_0518_20150801_0537 - looks like it loaded the
firmare; I got an a message when the file was not present, or the
version did not add up. I tried to cleanup the dmesg output a little
(removed what was unrelated to atom-isp):

[    9.072291] mc: Linux media interface: v0.10
[    9.156498] videodev: Linux video capture interface: v2.00
[    9.237603] atomisp_ov2680: loading out-of-tree module taints kernel.
[    9.240478] atomisp_ov2680: module is from the staging directory, the quality is unknown, you have been warned.
[    9.323975] ov2680 i2c-OVTI2680:00: gmin: initializing atomisp module subdev data.PMIC ID 1
[    9.334204] ov2680 i2c-OVTI2680:00: supply V1P2A not found, using dummy regulator
[    9.346739] ov2680 i2c-OVTI2680:00: supply VPROG4B not found, using dummy regulator
[    9.357528] ov2680 i2c-OVTI2680:00: supply Regulator1p8v not found, using dummy regulator
[    9.373085] ov2680 i2c-OVTI2680:00: supply Regulator2p8v not found, using dummy regulator
[    9.418879] atomisp_ov2680: module is from the staging directory, the quality is unknown, you have been warned.
[    9.446467] ov2680 i2c-OVTI2680:00: unable to set PMC rate 1
[    9.474456] ov2680 i2c-OVTI2680:00: camera pdata: port: 1 lanes: 1 order: 00000002
[    9.474533] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=0 as /devices/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input17
[    9.483924] ov2680 i2c-OVTI2680:00: sensor_revision id = 0x2680, rev= 0
[    9.491798] ov2680 i2c-OVTI2680:00: register atomisp i2c module type 1
[    9.549017] atomisp: module is from the staging directory, the quality is unknown, you have been warned.
[    9.738785] atomisp-isp2 0000:00:03.0: enabling device (0000 -> 0002)
[    9.802937] atomisp-isp2 0000:00:03.0: ISP HPLL frequency base = 1600 MHz
[   10.052114] atomisp-isp2 0000:00:03.0: Subdev OVTI2680:00 successfully register
[   10.056691] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port0 was not initialized!
[   10.061721] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port1 was not initialized!
[   10.071887] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port2 was not initialized!
[   10.071901] atomisp-isp2 0000:00:03.0: Entity type for entity file_input_subdev was not initialized!
[   10.080785] atomisp-isp2 0000:00:03.0: Entity type for entity tpg_subdev was not initialized!
[   10.084988] atomisp-isp2 0000:00:03.0: Entity type for entity ATOMISP_SUBDEV_0 was not initialized!
[   10.089196] ------------[ cut here ]------------
[   10.093225] WARNING: CPU: 1 PID: 503 at drivers/media/v4l2-core/v4l2-dev.c:885 __video_register_device+0x93e/0x1120 [videodev]
[   10.097258] Modules linked in: irqbypass snd_intel_sst_acpi(+) snd_seq_midi punit_atom_debug snd_intel_sst_core snd_seq_midi_event snd_soc_sst_atom_hifi2_platform intel_cstate snd_soc_acpi_intel_match snd_soc_acpi snd_soc_rt5645(+) ath10k_pci joydev snd_soc_rl6231 ath10k_core snd_soc_core snd_rawmidi asus_nb_wmi efi_pstore hid_sensor_gyro_3d atomisp(CO+) snd_compress hid_sensor_accel_3d hid_sensor_trigger intel_chtdc_ti_pwrbtn ath industrialio_triggered_buffer ac97_bus mac80211 snd_hdmi_lpe_audio kfifo_buf snd_pcm_dmaengine hid_sensor_iio_common hid_multitouch intel_xhci_usb_role_switch cfg80211 industrialio snd_pcm libarc4 roles cros_ec_ishtp mei_txe processor_thermal_device cros_ec atomisp_ov2680(CO) intel_rapl_common mei snd_seq videobuf_vmalloc intel_soc_dts_iosf videobuf_core snd_seq_device snd_timer snd videodev mc intel_hid 8250_dw spi_pxa2xx_platform soundcore int3400_thermal acpi_thermal_rel int3403_thermal soc_button_array acpi_pad int3406_thermal dw_dmac int340x_thermal
 _zone
[   10.097306]  dw_dmac_core intel_int0002_vgpio mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables autofs4 hid_sensor_custom hid_sensor_hub intel_ishtp_loader intel_ishtp_hid hid_asus asus_wmi sparse_keymap crct10dif_pclmul crc32_pclmul ghash_clmulni_intel mmc_block hid_generic i915 aesni_intel i2c_algo_bit crypto_simd drm_kms_helper cryptd glue_helper syscopyarea sysfillrect sysimgblt fb_sys_fops usbhid cec lpc_ich drm intel_ish_ipc intel_ishtp wmi i2c_hid intel_soc_pmic_chtdc_ti video hid sdhci_acpi sdhci
[   10.144416] CPU: 1 PID: 503 Comm: systemd-udevd Tainted: G         C O      5.7.0-rc1+ #2
[   10.144429] intel_sst_acpi 808622A8:00: SHIM base: 0x91540000
[   10.148909] Hardware name: ASUSTeK COMPUTER INC. T101HA/T101HA, BIOS T101HA.305 01/24/2018
[   10.148930] RIP: 0010:__video_register_device+0x93e/0x1120 [videodev]
[   10.148936] Code: 00 76 54 83 f8 04 0f 84 b9 06 00 00 0f 82 9b 00 00 00 83 f8 05 0f 85 ee 00 00 00 c7 43 2c 01 00 01 00 41 bc 05 02 00 00 eb 4b <0f> 0b 41 bd ea ff ff ff 48 8b 7d d0 65 48 33 3c 25 28 00 00 00 44
[   10.148938] RSP: 0018:ffffbb0b0065b940 EFLAGS: 00010246
[   10.148941] RAX: ffff982c6a80c028 RBX: ffff982c771a0fd0 RCX: 0000000000000000
[   10.148948] RDX: 00000000ffffffff RSI: 0000000000000000 RDI: ffff982c771a0fd0
[   10.186454] RBP: ffffbb0b0065b990 R08: ffffffffc0ccaf40 R09: 0000000000000000
[   10.191217] R10: 0000000000000000 R11: 0000000000000001 R12: 00000000ffffffff
[   10.195989] R13: ffffffffc0ccaf40 R14: 0000000000000000 R15: 0000000000000001
[   10.200763] FS:  00007fc84cccd880(0000) GS:ffff982c7be80000(0000) knlGS:0000000000000000
[   10.205557] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.210325] CR2: 000055d999a9a998 CR3: 00000001704be000 CR4: 00000000001006e0
[   10.215153] Call Trace:
[   10.219992]  atomisp_video_register+0x33/0x50 [atomisp]
[   10.224839]  atomisp_subdev_register_entities+0x39/0xd0 [atomisp]
[   10.224887]  atomisp_pci_probe.cold.19+0x71a/0x116f [atomisp]
[   10.234924]  local_pci_probe+0x47/0x80
[   10.234928]  pci_device_probe+0xff/0x1b0
[   10.234935]  really_probe+0x1c8/0x3e0
[   10.234942]  driver_probe_device+0xd9/0x120
[   10.245045]  device_driver_attach+0x58/0x60
[   10.245049]  __driver_attach+0x8f/0x150
[   10.245053]  ? device_driver_attach+0x60/0x60
[   10.245056]  ? device_driver_attach+0x60/0x60
[   10.245061]  bus_for_each_dev+0x79/0xc0
[   10.293310]  ? kmem_cache_alloc_trace+0x167/0x230
[   10.298004]  driver_attach+0x1e/0x20
[   10.302623]  bus_add_driver+0x154/0x1f0
[   10.307229]  ? 0xffffffffc0bf6000
[   10.311819]  driver_register+0x70/0xc0
[   10.316432]  ? 0xffffffffc0bf6000
[   10.316435]  __pci_register_driver+0x54/0x60
[   10.316476]  atomisp_pci_driver_init+0x23/0x1000 [atomisp]
[   10.316480]  do_one_initcall+0x4a/0x200
[   10.316484]  ? kfree+0x22e/0x250
[   10.316488]  ? _cond_resched+0x19/0x30
[   10.316491]  ? kmem_cache_alloc_trace+0x167/0x230
[   10.316496]  do_init_module+0x60/0x230
[   10.316499]  load_module+0x224a/0x24e0
[   10.316506]  __do_sys_finit_module+0xbd/0x120
[   10.316509]  ? __do_sys_finit_module+0xbd/0x120
[   10.316513]  __x64_sys_finit_module+0x1a/0x20
[   10.316517]  do_syscall_64+0x57/0x1b0
[   10.316521]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   10.316524] RIP: 0033:0x7fc84d24194d
[   10.316528] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 13 e5 0c 00 f7 d8 64 89 01 48
[   10.316529] RSP: 002b:00007fffd0506a88 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   10.316532] RAX: ffffffffffffffda RBX: 000055d999a78560 RCX: 00007fc84d24194d
[   10.316534] RDX: 0000000000000000 RSI: 00007fc84d11ecad RDI: 000000000000000f
[   10.316535] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000000
[   10.316537] R10: 000000000000000f R11: 0000000000000246 R12: 00007fc84d11ecad
[   10.316538] R13: 0000000000000000 R14: 000055d999a8b4c0 R15: 000055d999a78560
[   10.316543] ---[ end trace 7f4c17cfaa1f3f65 ]---
[   10.316618] atomisp-isp2 0000:00:03.0: atomisp_video_register: could not register video device (-22)
[   10.333529] atomisp-isp2 0000:00:03.0: atomisp_subdev_register_entities fail
[   10.366495] atomisp-isp2 0000:00:03.0: atomisp_register_entities failed (-22)

> 
> > I'll give
> > that one a try first. As usual it will unfortunately take some time
> > until I get back to you with the results, as every experiment takes
> > many hours (building the kernel on what is essentially a tablet takes
> > time).  
> 
> I would suggest you to build on some other machine. Btw, you don't need
> to build everything every time. If you build atomisp as a module, you
> could do, instead:
> 
> 	$ make modules_prepare && make M=drivers/staging/media/atomisp
> 
> This will build just the new module(s).

Thanks; that is a huge time saver.

> 
> > > > [    9.691775] cpu_latency_qos_update_request called for unknown object  
> 
> Btw, the patch I send earlier today should fix this issue.
> 

Yep - looks like this one is gone :-).

> 
> I need to understand a little bit more about how ACPI is supposed to
> detect and register regulators. While using regulators with DT is very
> common, not many places use it for ACPI. 
> 
> I'm suspecting that, before being able of calling regulator_get(),
> the code should use some match logic to get the regulators on this
> board and call regulator_register().
> 
> Please run this command on your tablet:
> 
> 	$ sudo cat /sys/kernel/debug/regulator/supply_map
> 
> If this returns nothing - as I suspect - then calling regulator_get()
> won't be doing anything. 

The statement to read the supply_map did return nothing, as you'd
expected.

> 
> Thanks,
> Mauro

with kind regards,
Patrik
