Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5CD1EDA4B
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 03:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgFDBPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 21:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgFDBPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jun 2020 21:15:25 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8ED2C03E96D;
        Wed,  3 Jun 2020 18:15:23 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id y5so4469234iob.12;
        Wed, 03 Jun 2020 18:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=22mBwwL3Af84B+46QCFvojw9HgGM8Bpgp74aGnCRTo4=;
        b=YvQBe66t26+KTDji6jjLr7Iko+t2EALlweEk1/MeZ0eJqs5+ZIfxHbWYLLzIrhRzUP
         P94Z6GSKCWRER2xRtH8D6/V64he4ALSWJ7s2g52uUEfy1l1tCP7xINtt1lt92RZakdAn
         qbwXvzv46H3lYh3bBcoZ5Jgf8Yl50RZxv8hJMDs8kYEC4z+UAiZhfw1+8pK5SKkiMQPy
         kTU+/MFzPfWMsBaFYWG/otFsNmOC2jFnDGsT1f8irs3/WwE6ET1aCPmGeVwzPRa9fATY
         7oGtoewtPgKKZr2TKJ+EfhV23WKaCyOoSZUT2413YsfkLVRCr+SoQZ93ZmeTLCuySCFp
         E4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=22mBwwL3Af84B+46QCFvojw9HgGM8Bpgp74aGnCRTo4=;
        b=Q0L/gQH5muNcBrt5ZS2jRys+YXcinjQLxbQZ6c+A+JBvgjoQxl9JQKTZ2ZYcI+awOK
         CXHTJ0D1Bm3009cO8GNhsdYqXP3y5JrDPCfXWk1w+Irkj6pUb6yQ2uUsnr3guZwTOTnc
         k8ioSyp8DSEJNA4yfUYSUYRW0wFEcz2KnhbFVDTfnOFfHPPL6+Bx5/0oTbM/uFDp37ew
         9EavhgLgKA92jr0NrunzjhvkCqujsHEKRBzxrqAEY2sFErbgZcvTegyvGJWDwzDGpN67
         ZQ1E34+sBR/VXa947dcCKwrftaeSrCf4UOKbiAx8FVLngrTwkWqvn+kv4KZOIWtbl6vs
         qAcQ==
X-Gm-Message-State: AOAM5322yDjsF5ApU9e/Dt12lp0KJR0NLNwX69LQBtaTsIRVkA3r+P+p
        K+eZSwl81IgFJ2tEWDhE/UGstjQ8DhjLXXpBmL7rCyHp
X-Google-Smtp-Source: ABdhPJzDlAGyWXh6I03PLrxSNXrhVPEwBRqLPqk5Y1d5tMkef05RAimwG+OIaOfLkb2u82swodkVFTuSZerlKsQ7hkc=
X-Received: by 2002:a05:6602:2437:: with SMTP id g23mr2149465iob.5.1591233322441;
 Wed, 03 Jun 2020 18:15:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:d54a:0:0:0:0:0 with HTTP; Wed, 3 Jun 2020 18:15:21 -0700 (PDT)
From:   youling 257 <youling257@gmail.com>
Date:   Thu, 4 Jun 2020 09:15:21 +0800
Message-ID: <CAOzgRdbv2LvGv4H5qqNyjLBZ9gAk3r8JNLrGt+_YqgzsShJ5KA@mail.gmail.com>
Subject: media: atomisp RIP: 0010:gmin_subdev_add.cold+0x318/0x327
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I test linux next kernel atomisp driver,
i have RIP: 0010:gmin_subdev_add.cold+0x318/0x327
[atomisp_gmin_platform] problem.


<4>[   14.682805] atomisp_gmin_platform: module is from the staging
directory, the quality is unknown, you have been warned.
<4>[   14.689979] atomisp_ov2680: module is from the staging
directory, the quality is unknown, you have been warned.
<6>[   14.731837] Bluetooth: hci0: BCM: chip id 94
<6>[   14.755073] Bluetooth: hci0: BCM: features 0x2e
<6>[   14.773197] ov2680 i2c-OVTI2680:00: ov2680_probe: ACPI detected
it on bus ID=CAMF, HID=OVTI2680
<6>[   14.785846] Bluetooth: hci0: 4343A0
<6>[   14.792137] ov2680 i2c-OVTI2680:00: gmin: power management
provided via XPower AXP288 PMIC (i2c addr 0x34)
<6>[   14.802327] Bluetooth: hci0: BCM4343A0 (001.001.034) build 0000
<4>[   14.807641] ov2680 i2c-OVTI2680:00: Failed to find variable
OVTI2680:00_CamClk
<4>[   14.817816] ov2680 i2c-OVTI2680:00: Failed to find variable
OVTI2680:00_ClkSrc
<4>[   14.823406] ov2680 i2c-OVTI2680:00: Failed to find variable
OVTI2680:00_CsiPort
<4>[   14.828612] ov2680 i2c-OVTI2680:00: Failed to find variable
OVTI2680:00_CsiLanes
<4>[   14.834398] ov2680 i2c-OVTI2680:00: Failed to find variable
OVTI2680:00_eldo1_1p8v
<4>[   14.840137] ov2680 i2c-OVTI2680:00: Failed to find variable
OVTI2680:00_eldo1_sel_reg
<4>[   14.845688] ov2680 i2c-OVTI2680:00: Failed to find variable
OVTI2680:00_eldo1_ctrl_shift
<4>[   14.851015] ov2680 i2c-OVTI2680:00: Failed to find variable
OVTI2680:00_eldo2_1p8v
<4>[   14.855670] ov2680 i2c-OVTI2680:00: Failed to find variable
OVTI2680:00_eldo2_sel_reg
<4>[   14.860492] ov2680 i2c-OVTI2680:00: Failed to find variable
OVTI2680:00_eldo2_ctrl_shift
<4>[   14.865530] ov2680 i2c-OVTI2680:00: Failed to find gmin variable
gmin_V1P8GPIO
<4>[   14.870561] ov2680 i2c-OVTI2680:00: Failed to find gmin variable
gmin_V2P8GPIO
<6>[   14.964566] ov2680 i2c-OVTI2680:00: camera pdata: port: 0 lanes:
1 order: 00000002
<6>[   14.981483] ov2680 i2c-OVTI2680:00: sensor_revision id = 0x2680, rev= 0
<6>[   14.992912] ov2680 i2c-OVTI2680:00: register atomisp i2c module type 1
<6>[   15.076738] ov2680 i2c-OVTI2680:01: ov2680_probe: ACPI detected
it on bus ID=CAMC, HID=OVTI2680
<6>[   15.087549] ov2680 i2c-OVTI2680:01: gmin: power management
provided via XPower AXP288 PMIC
<4>[   15.092635] ov2680 i2c-OVTI2680:01: Failed to find variable
OVTI2680:01_CamClk
<4>[   15.097714] ov2680 i2c-OVTI2680:01: Failed to find variable
OVTI2680:01_ClkSrc
<4>[   15.102945] ov2680 i2c-OVTI2680:01: Failed to find variable
OVTI2680:01_CsiPort
<4>[   15.106725] ov2680 i2c-OVTI2680:01: Failed to find variable
OVTI2680:01_CsiLanes
<4>[   15.110626] ov2680 i2c-OVTI2680:01: Failed to find variable
OVTI2680:01_eldo1_1p8v
<4>[   15.114341] ov2680 i2c-OVTI2680:01: Failed to find variable
OVTI2680:01_eldo1_sel_reg
<4>[   15.118499] ov2680 i2c-OVTI2680:01: Failed to find variable
OVTI2680:01_eldo1_ctrl_shift
<4>[   15.122227] ov2680 i2c-OVTI2680:01: Failed to find variable
OVTI2680:01_eldo2_1p8v
<4>[   15.125832] ov2680 i2c-OVTI2680:01: Failed to find variable
OVTI2680:01_eldo2_sel_reg
<4>[   15.129543] ov2680 i2c-OVTI2680:01: Failed to find variable
OVTI2680:01_eldo2_ctrl_shift
<1>[   15.132560] BUG: kernel NULL pointer dereference, address:
0000000000000002
<1>[   15.135250] #PF: supervisor read access in kernel mode
<1>[   15.138090] #PF: error_code(0x0000) - not-present page
<6>[   15.140878] PGD 80000001387db067 P4D 80000001387db067 PUD 1387c4067 PMD 0
<4>[   15.143686] Oops: 0000 [#1] PREEMPT SMP PTI
<4>[   15.146471] CPU: 3 PID: 1498 Comm: ueventd Tainted: G         C
      5.7.0-android-x86_64+ #2
<4>[   15.149315] Hardware name: jumper EZpad/EZpad, BIOS
Jumper8.S106x.A00C.1066 12/22/2015
<4>[   15.152258] RIP: 0010:gmin_subdev_add.cold+0x318/0x327
[atomisp_gmin_platform]
<4>[   15.155193] Code: 73 f1 ff ff b9 01 00 00 00 31 f6 4c 89 ef 48
c7 c2 e9 d6 3f c0 89 83 94 0b 40 c0 e8 57 f1 ff ff 89 83 9c 0b 40 c0
48 8b 04 24 <0f> b7 40 02 88 83 84 0b 40 c0 e9 9b fe ff ff 45 31 f6 49
8d 7d 20
<4>[   15.158259] RSP: 0018:ffffb16dc0423a68 EFLAGS: 00010282
<4>[   15.161534] RAX: 0000000000000000 RBX: 0000000000000080 RCX:
0000000000001933
<4>[   15.164648] RDX: 000000000000192b RSI: 3702d5d18502d9c4 RDI:
000000000002e700
<4>[   15.167667] RBP: 0000000000000001 R08: 00000000fffffffe R09:
003900ab007100bd
<4>[   15.170659] R10: 00bd008900b80057 R11: 001200c500900010 R12:
ffff8fcdb7e9ea20
<4>[   15.173689] R13: ffff8fcdb96d9820 R14: ffffffffc0400ba0 R15:
ffff8fcdb7e9ea20
<4>[   15.176728] FS:  0000000000000000(0000)
GS:ffff8fcdbad80000(0063) knlGS:00000000081cd0b4
<4>[   15.179781] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
<4>[   15.183054] CR2: 0000000000000002 CR3: 0000000139418000 CR4:
00000000001006e0
<4>[   15.186172] Call Trace:
<4>[   15.189322]  gmin_camera_platform_data+0x2f/0x60 [atomisp_gmin_platform]
<4>[   15.192520]  ov2680_probe+0x104/0x40a [atomisp_ov2680]
<4>[   15.195758]  ? acpi_device_wakeup_disable+0x15/0x50
<4>[   15.198976]  i2c_device_probe+0x9d/0x270
<4>[   15.202203]  really_probe+0xfa/0x3c0
<4>[   15.205768]  driver_probe_device+0x5d/0x100
<4>[   15.208924]  device_driver_attach+0x53/0x60
<4>[   15.212074]  __driver_attach+0x96/0x140
<4>[   15.215157]  ? device_driver_attach+0x60/0x60
<4>[   15.218258]  ? device_driver_attach+0x60/0x60
<4>[   15.221350]  bus_for_each_dev+0x78/0xc0
<4>[   15.224620]  bus_add_driver+0x184/0x1f0
<4>[   15.227817]  driver_register+0x6c/0xc0
<4>[   15.230795]  i2c_register_driver+0x3e/0x90
<4>[   15.233683]  ? 0xffffffffc03a8000
<4>[   15.236506]  do_one_initcall+0x4f/0x230
<4>[   15.239372]  ? free_vmap_area_noflush+0x97/0xf0
<4>[   15.242181]  ? kmem_cache_alloc_trace+0x27/0x230
<4>[   15.244940]  do_init_module+0x5c/0x230
<4>[   15.247842]  load_module+0x268b/0x2910
<4>[   15.250509]  ? vfs_read+0x129/0x150
<4>[   15.253121]  ? __do_sys_finit_module+0xd2/0x110
<4>[   15.255790]  __do_sys_finit_module+0xd2/0x110
<4>[   15.258666]  do_fast_syscall_32+0x8e/0x280
<4>[   15.261375]  entry_SYSENTER_compat+0x7c/0x8e
<4>[   15.264082] Modules linked in: atomisp_ov2680(C+)
atomisp_gmin_platform(C) bmc150_accel_i2c bmc150_accel_core
industrialio_triggered_buffer kfifo_buf hci_uart btintel btqca btbcm
btrtl bluetooth ecdh_generic ecc 8250_dw dwc3 ulpi dwc3_pci axp20x_pek
extcon_axp288 roles axp288_adc industrialio axp20x_i2c axp20x lpc_ich
efi_pstore efivars gpio_keys soc_button_array sdcardfs
<4>[   15.270350] CR2: 0000000000000002
<4>[   15.273539] ---[ end trace 0a1f800ffb2b1049 ]---
<4>[   15.282452] RIP: 0010:gmin_subdev_add.cold+0x318/0x327
[atomisp_gmin_platform]
<4>[   15.285758] Code: 73 f1 ff ff b9 01 00 00 00 31 f6 4c 89 ef 48
c7 c2 e9 d6 3f c0 89 83 94 0b 40 c0 e8 57 f1 ff ff 89 83 9c 0b 40 c0
48 8b 04 24 <0f> b7 40 02 88 83 84 0b 40 c0 e9 9b fe ff ff 45 31 f6 49
8d 7d 20
<4>[   15.289313] RSP: 0018:ffffb16dc0423a68 EFLAGS: 00010282
<4>[   15.292991] RAX: 0000000000000000 RBX: 0000000000000080 RCX:
0000000000001933
<4>[   15.296583] RDX: 000000000000192b RSI: 3702d5d18502d9c4 RDI:
000000000002e700
<4>[   15.300123] RBP: 0000000000000001 R08: 00000000fffffffe R09:
003900ab007100bd
<4>[   15.303643] R10: 00bd008900b80057 R11: 001200c500900010 R12:
ffff8fcdb7e9ea20
<4>[   15.307181] R13: ffff8fcdb96d9820 R14: ffffffffc0400ba0 R15:
ffff8fcdb7e9ea20
<4>[   15.310663] FS:  0000000000000000(0000)
GS:ffff8fcdbad80000(0063) knlGS:00000000081cd0b4
<4>[   15.314202] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
<4>[   15.317761] CR2: 0000000000000002 CR3: 0000000139418000 CR4:
00000000001006e0
