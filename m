Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6871C2786
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 20:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgEBSXK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 14:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728236AbgEBSXJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 14:23:09 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87186C061A0C
        for <linux-media@vger.kernel.org>; Sat,  2 May 2020 11:23:09 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id o27so10532277wra.12
        for <linux-media@vger.kernel.org>; Sat, 02 May 2020 11:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qf2M45GlBr/FPjtDVf8OTihdkXzNyNezFcjsfCYwOSU=;
        b=T43zwqnxLwpUp4+q19Gb6sthHNiCQLtrmIzXtOQmxiTmTX16KFN8SwRxWzMnuAzEtc
         Ui5wkt6rlmV89t4cUcnHhhktHzWnTrvWcjVYhufI44GERBeN3t+IxFmWdVVWB7Zowndu
         +lb2bOiQCJMVvSUA5bBANk3AFvT5KZYfSG5Rw1uxinDdh0Ys8u8THQ7zGSr5qMMWrY7/
         JV8t8TS4vYchwu9g1N7X1hkFeQkBgm2UrMZE0H0YmEcXVcjGM2i0Cs14ll477dvO3Yy8
         G7ZTzhcFoUbMneaKYdo37xLe2jPxOZ97WhP8NISPVJkKIn9Gz1TNBzBzH5MdDYM46zAD
         Fmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qf2M45GlBr/FPjtDVf8OTihdkXzNyNezFcjsfCYwOSU=;
        b=XUbcLzfEsui3e5BpSOYcF67Z9pGa1zEKxz4U9zSX2R0xl4L4xC4iCaEYnKJQarSVwE
         gWGXiIeqcFdmL+I4zccvnJoMtsQrtiIARTB8gjQsTA56vd43YCrp5gA3c4PED/Qdm3XI
         h8k96aiBhe/t/WpY6RWw/GwV1Kx/JHZf5tBBLbvsqwia80UKFe7teg7swml2Tfb2M71U
         Z3q7qcrLqSkqyLIgxARbR/Oww1THN8sFvKjpfs6Vf3bntD+UC25xFHu6qrlm/B0zhwkC
         mIjtuMP9xfFKhAhG4llI8ikc5fVbShBnvkIlv7mmJZvTnZH0BRTc5bVHViPlU95D8HjY
         iBLw==
X-Gm-Message-State: AGi0PuZeWp0mL3RTm7Lgp0qEWjLAewW0pLU80H0VKYZJ1jy9rKP1wsvN
        4uxad/4Hf4CyIN3cD9XXfdoPTwX8Ty0=
X-Google-Smtp-Source: APiQypIRSrwfLCjYAx/A4M9Z+W4kxxBBTuChM5qGK4ot/fYvO0XMZhpIi1tW82c3DkcclU3A8gc05g==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr10401504wro.266.1588443788022;
        Sat, 02 May 2020 11:23:08 -0700 (PDT)
Received: from ASUS (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id j13sm10074077wro.51.2020.05.02.11.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 11:23:07 -0700 (PDT)
Date:   Sat, 2 May 2020 20:23:03 +0200
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200502202303.04fadd85@ASUS>
In-Reply-To: <20200502182837.3b254abc@coco.lan>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
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
        <20200502162951.0ad8a080@ASUS>
        <20200502182837.3b254abc@coco.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2 May 2020 18:28:37 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Sat, 2 May 2020 16:29:51 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> 
> > On Sat, 2 May 2020 11:34:14 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >    
>  [...]  
> > 
> > Below the result from the test with
> > irci_stable_bw10p_0518_20150801_0537 - looks like it loaded the
> > firmare; I got an a message when the file was not present, or the
> > version did not add up. I tried to cleanup the dmesg output a little
> > (removed what was unrelated to atom-isp):  
> 
> > [   10.089196] ------------[ cut here ]------------
> > [   10.093225] WARNING: CPU: 1 PID: 503 at drivers/media/v4l2-core/v4l2-dev.c:885 __video_register_device+0x93e/0x1120 [videodev]  
> 
> That's due to a change at the media core that added this test:
> 
> 	/* the device_caps field MUST be set for all but subdevs */
> 	if (WARN_ON(type != VFL_TYPE_SUBDEV && !vdev->device_caps))
> 		return -EINVAL;
> 
> Added on this patch:
> 
> 	commit 3c1350501c21db8e3b1a38d9e97db29694305c3b
> 	Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 	Date:   Tue Jul 23 04:21:25 2019 -0400
> 
> 	    media: v4l2-dev/ioctl: require non-zero device_caps, verify sane querycap results
>     
> 	    Now that all V4L2 drivers set device_caps in struct video_device, we can add
> 	    a check for this to ensure all future drivers fill this in.
> 
> Fixing it is simple. Just sent a patch.

I applied your patch; here the resulting messages (did not compile full kernel, but only the module):
[    9.261205] kernel: videodev: Linux video capture interface: v2.00
[    9.285172] kernel: atomisp_ov2680: loading out-of-tree module taints kernel.
[    9.287930] kernel: atomisp_ov2680: module is from the staging directory, the quality is unknown, you have been warned.
[    9.337584] kernel: ov2680 i2c-OVTI2680:00: gmin: initializing atomisp module subdev data.PMIC ID 1
[    9.342193] kernel: ov2680 i2c-OVTI2680:00: supply V1P2A not found, using dummy regulator
[    9.346278] kernel: ov2680 i2c-OVTI2680:00: supply VPROG4B not found, using dummy regulator
[    9.350419] kernel: ov2680 i2c-OVTI2680:00: supply Regulator1p8v not found, using dummy regulator
[    9.354530] kernel: ov2680 i2c-OVTI2680:00: supply Regulator2p8v not found, using dummy regulator
[    9.375913] kernel: proc_thermal 0000:00:0b.0: enabling device (0000 -> 0002)
[    9.405529] kernel: ov2680 i2c-OVTI2680:00: unable to set PMC rate 1
[    9.427136] kernel: atomisp: module is from the staging directory, the quality is unknown, you have been warned.
[    9.433835] kernel: ov2680 i2c-OVTI2680:00: camera pdata: port: 1 lanes: 1 order: 00000002
[    9.438446] kernel: ov2680 i2c-OVTI2680:00: sensor_revision id = 0x2680, rev= 0
[    9.441739] kernel: ov2680 i2c-OVTI2680:00: register atomisp i2c module type 1
[    9.544474] kernel: atomisp-isp2 0000:00:03.0: enabling device (0000 -> 0002)
[    9.573919] kernel: atomisp-isp2 0000:00:03.0: ISP HPLL frequency base = 1600 MHz
[    9.829161] kernel: atomisp-isp2 0000:00:03.0: Subdev OVTI2680:00 successfully register
[    9.833264] kernel: atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port0 was not initialized!
[    9.852847] kernel: atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port1 was not initialized!
[    9.894230] kernel: atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port2 was not initialized!
[    9.899609] kernel: atomisp-isp2 0000:00:03.0: Entity type for entity file_input_subdev was not initialized!
[    9.909981] kernel: atomisp-isp2 0000:00:03.0: Entity type for entity tpg_subdev was not initialized!
[    9.914186] kernel: atomisp-isp2 0000:00:03.0: Entity type for entity ATOMISP_SUBDEV_0 was not initialized!
[    9.941592] kernel: ------------[ cut here ]------------
[    9.945885] kernel: WARNING: CPU: 2 PID: 515 at drivers/media/v4l2-core/v4l2-dev.c:885 __video_register_device+0x93e/0x1120 [videodev]
[    9.950250] kernel: Modules linked in: irqbypass snd_seq_midi punit_atom_debug snd_compress intel_cstate ac97_bus mac80211(+) snd_pcm_dmaengine snd_seq_midi_event asus_nb_wmi snd_rawmidi snd_hdmi_lpe_audio(+) efi_pstore hid_sensor_gyro_3d hid_sensor_accel_3d intel_chtdc_ti_pwrbtn hid_sensor_trigger industrialio_triggered_buffer kfifo_buf snd_pcm snd_seq hid_multitouch(+) cfg80211 hid_sensor_iio_common atomisp(CO+) industrialio mei_txe videobuf_vmalloc snd_seq_device processor_thermal_device intel_rapl_common libarc4 videobuf_core cros_ec_ishtp snd_timer intel_soc_dts_iosf intel_xhci_usb_role_switch cros_ec mei atomisp_ov2680(CO) roles videodev snd spi_pxa2xx_platform mc intel_hid 8250_dw dw_dmac soundcore dw_dmac_core int3400_thermal soc_button_array int3403_thermal acpi_thermal_rel intel_int0002_vgpio int3406_thermal int340x_thermal_zone acpi_pad mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables autofs4 hid_sensor_custom hid_sensor_hub intel_ishtp_loader intel_i
 shtp_hid hid_asus
[    9.950303] kernel:  asus_wmi sparse_keymap crct10dif_pclmul crc32_pclmul ghash_clmulni_intel i915 hid_generic mmc_block i2c_algo_bit aesni_intel drm_kms_helper crypto_simd syscopyarea sysfillrect sysimgblt cryptd fb_sys_fops glue_helper cec usbhid intel_ish_ipc drm wmi lpc_ich intel_ishtp video i2c_hid intel_soc_pmic_chtdc_ti hid sdhci_acpi sdhci
[    9.999137] kernel: CPU: 2 PID: 515 Comm: systemd-udevd Tainted: G         C O      5.7.0-rc1+ #2
[   10.004479] kernel: Hardware name: ASUSTeK COMPUTER INC. T101HA/T101HA, BIOS T101HA.305 01/24/2018
[   10.009868] kernel: RIP: 0010:__video_register_device+0x93e/0x1120 [videodev]
[   10.015264] kernel: Code: 00 76 54 83 f8 04 0f 84 b9 06 00 00 0f 82 9b 00 00 00 83 f8 05 0f 85 ee 00 00 00 c7 43 2c 01 00 01 00 41 bc 05 02 00 00 eb 4b <0f> 0b 41 bd ea ff ff ff 48 8b 7d d0 65 48 33 3c 25 28 00 00 00 44
[   10.026427] kernel: RSP: 0018:ffffb3fe00713940 EFLAGS: 00010246
[   10.032023] kernel: RAX: ffff94f8e9eb4028 RBX: ffff94f8ed863310 RCX: 0000000000000000
[   10.037660] kernel: RDX: 00000000ffffffff RSI: 0000000000000000 RDI: ffff94f8ed863310
[   10.043308] kernel: RBP: ffffb3fe00713990 R08: ffffffffc07c4f40 R09: ffff94f8fb403500
[   10.048952] kernel: R10: ffffffffffffe002 R11: 0000000000000000 R12: 00000000ffffffff
[   10.054589] kernel: R13: ffffffffc07c4f40 R14: 0000000000000000 R15: 0000000000000001
[   10.060175] kernel: FS:  00007f0f204f6880(0000) GS:ffff94f8fbf00000(0000) knlGS:0000000000000000
[   10.065821] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.071389] kernel: CR2: 00007f0f20aee421 CR3: 000000016b600000 CR4: 00000000001006e0
[   10.076891] kernel: Call Trace:
[   10.082382] kernel:  atomisp_acc_register+0x33/0x50 [atomisp]
[   10.087791] kernel:  atomisp_subdev_register_entities+0x91/0xd0 [atomisp]
[   10.093106] kernel:  atomisp_pci_probe.cold.19+0x71a/0x116f [atomisp]
[   10.098279] kernel:  local_pci_probe+0x47/0x80
[   10.103406] kernel:  pci_device_probe+0xff/0x1b0
[   10.108443] kernel:  really_probe+0x1c8/0x3e0
[   10.113376] kernel:  driver_probe_device+0xd9/0x120
[   10.118297] kernel:  device_driver_attach+0x58/0x60
[   10.123219] kernel:  __driver_attach+0x8f/0x150
[   10.128146] kernel:  ? device_driver_attach+0x60/0x60
[   10.132994] kernel:  ? device_driver_attach+0x60/0x60
[   10.137715] kernel:  bus_for_each_dev+0x79/0xc0
[   10.142440] kernel:  ? kmem_cache_alloc_trace+0x167/0x230
[   10.147147] kernel:  driver_attach+0x1e/0x20
[   10.151807] kernel:  bus_add_driver+0x154/0x1f0
[   10.156372] kernel:  ? 0xffffffffc07ff000
[   10.160844] kernel:  driver_register+0x70/0xc0
[   10.165248] kernel:  ? 0xffffffffc07ff000
[   10.169579] kernel:  __pci_register_driver+0x54/0x60
[   10.173966] kernel:  atomisp_pci_driver_init+0x23/0x1000 [atomisp]
[   10.178334] kernel:  do_one_initcall+0x4a/0x200
[   10.182676] kernel:  ? kfree+0x22e/0x250
[   10.186913] kernel:  ? _cond_resched+0x19/0x30
[   10.191055] kernel:  ? kmem_cache_alloc_trace+0x167/0x230
[   10.195131] kernel:  do_init_module+0x60/0x230
[   10.199083] kernel:  load_module+0x224a/0x24e0
[   10.201809] kernel: hid-multitouch 0018:0457:11ED.0003: input,hidraw2: I2C HID v1.00 Device [SIS0457:00 0457:11ED] on i2c-SIS0457:00
[   10.202893] kernel:  __do_sys_finit_module+0xbd/0x120
[   10.210562] kernel:  ? __do_sys_finit_module+0xbd/0x120
[   10.214169] kernel:  __x64_sys_finit_module+0x1a/0x20
[   10.217634] kernel:  do_syscall_64+0x57/0x1b0
[   10.220961] kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   10.224188] kernel: RIP: 0033:0x7f0f20a6a94d
[   10.227270] kernel: Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 13 e5 0c 00 f7 d8 64 89 01 48
[   10.233595] kernel: RSP: 002b:00007fff22cf5488 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   10.236770] kernel: RAX: ffffffffffffffda RBX: 00005599a433b560 RCX: 00007f0f20a6a94d
[   10.239918] kernel: RDX: 0000000000000000 RSI: 00007f0f20947cad RDI: 0000000000000010
[   10.242986] kernel: RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000000
[   10.242988] kernel: R10: 0000000000000010 R11: 0000000000000246 R12: 00007f0f20947cad
[   10.242990] kernel: R13: 0000000000000000 R14: 00005599a43820d0 R15: 00005599a433b560
[   10.243000] kernel: ---[ end trace c4f253dd02f49f40 ]---
[   10.254587] kernel: atomisp-isp2 0000:00:03.0: atomisp_acc_register: could not register video device (-22)

I always fear I load the wrong version. Is there a way I could add a
version (which I would increase for each patch) that then can be
checked, e.g. by modinfo?

> 
>  [...]  
> > 
> > The statement to read the supply_map did return nothing, as you'd
> > expected.  
> 
> Ok. That explains why register_get() failed ;-)
> 
> If this time the probing part works, I guess the next step would
> be to use some tools from https://git.linuxtv.org/v4l-utils.git/,
> in order to test the stuff that doesn't depend on the sensors,
> as, without the regulator settings, it won't be turned on.
> 
> The simplest test would be to run:
> 
> 	$ v4l2-ctl --all -d /dev/video0
> 
> (and the same for the other /dev/video? nodes created by the driver)
> 

Unfortunately I'm not sure if the driver already creates the devices, 
"$ ls /dev | grep video" did not return anything. Anyway - I'll download
the tools to be prepared. I will try your command - maybe I
misunderstand and the ctl call creates the device nodes.

> -
> 
> A more complete test would be to run v4l2-compliance (without
> enabling streaming), but let's first check if v4l2-ctl won't
> hit any Kernel bugs.
> 
> Thanks,
> Mauro

with kind regards,
Patrik

