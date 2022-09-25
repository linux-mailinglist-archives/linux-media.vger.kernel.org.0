Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB1B65E9717
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 02:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbiIZAMw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Sep 2022 20:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiIZAMv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Sep 2022 20:12:51 -0400
X-Greylist: delayed 3611 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 25 Sep 2022 17:12:44 PDT
Received: from mx.fenrir.org.uk (host-92-27-96-141.static.as13285.net [92.27.96.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF60255B7
        for <linux-media@vger.kernel.org>; Sun, 25 Sep 2022 17:12:44 -0700 (PDT)
Received: from [10.0.0.3] (helo=deangelis.fenrir.org.uk)
        (TLS1.3:TLS_AES_256_GCM_SHA384:256)
        by mx.fenrir.org.uk with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1ocanX-000wFs-0k
        for <linux-media@vger.kernel.org>;
        Mon, 26 Sep 2022 00:12:31 +0100
Date:   Mon, 26 Sep 2022 00:12:30 +0100
From:   Brian Morrison <bdm@fenrir.org.uk>
To:     linux-media@vger.kernel.org
Subject: Foscam W21 webcam not working in Fedora 37 with kernel-5.19.11
Message-ID: <20220926001230.65b0683c@deangelis.fenrir.org.uk>
Organization: The Fool and Bladder Face-Jumping Team
X-Mailer: Claws Mail 4.1.0git1370 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Face:   iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEU8PDpvaFEREREpKiXCwsD//////v6hSyaYAAABLElEQVQ4jZ3TwW7DIAwAUFOqnbFCf4DtA5K62jloTu+VWs6rFPL/nzAgWUY7qNb5EqInY8dW4FIJ+C84X4GRR+apCGgRNR/vge0WERvN/g5QiQhSiCGDkSclAQAboajzObCSJgRtOqLhmgqB44nZzmDMK5H+OCzAETY0iyHs33y6amLNFjaGliTQVh9TDRf6Adgb00I0AIU4JLCoIEmo0Yb2Quc6AXPIAJD7+arYOM7tohUxJwZReszgJhYINyGWkZzXjDtwqTyI8EnLaV2UjXfpdBzZ4u5ntbGz7fdLWOgKrpd0+L3BECei7jk4E7VlkES+BC7A8BRcmgewK0L/AF5q8F6ET8qHlcGpCjIfVgbnB9BWwZfgdlj57ww1UPlM/gR97SqLXOzqNqrwBbAjNHgb3BUMAAAAAElFTkSuQmCC
X-PGP-KeyID: DE32E5C5
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/H+2j5/PCAoAGHH0VE8fQxEM"
X-Clacks-Overhead: GNU Terry Pratchett
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--MP_/H+2j5/PCAoAGHH0VE8fQxEM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi

I have a webcam which claims to work on Linux, but I cannot get it to
do anything although with some extra packages installed (v4l2 related)
I did at least get uvcvideo and related modules loaded and a /dev/video0
device to appear, unfortunately that's it, no available video or audio
in guvcview, OBS or cheese.

v4l2 --list-device shows this:

OBS Virtual Camera (platform:v4l2loopback-000):
	/dev/video0

v4l2-ctl --list-formats-ext shows this:

ioctl: VIDIOC_ENUM_FMT
	Type: Video Capture

I have attached dmesg and lsusb logs as requested.

Please would someone have a look at this and see whether it is lack of
device recognition in the uvcvideo driver or other kernel-related
problem.

Thanks!

-- 

Brian Morrison


--MP_/H+2j5/PCAoAGHH0VE8fQxEM
Content-Type: text/x-log
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=dmesg.log

[    0.000000] microcode: microcode updated early to revision 0xf0, date = 2021-11-16
[    0.000000] Linux version 5.19.11-300.fc37.x86_64 (mockbuild@bkernel01.iad2.fedoraproject.org) (gcc (GCC) 12.2.1 20220819 (Red Hat 12.2.1-2), GNU ld version 2.38-24.fc37) #1 SMP PREEMPT_DYNAMIC Fri Sep 23 15:16:45 UTC 2022
[    0.000000] Command line: BOOT_IMAGE=(hd3,gpt2)/vmlinuz-5.19.11-300.fc37.x86_64 root=UUID=b7fdf8a0-5165-4827-95b0-81daa13e43aa ro rootflags=subvol=root resume=/dev/mapper/fedora_localhost--live-swap rd.luks.uuid=luks-8f7e929f-c3f1-4a33-8e54-dc87f811fe2a rd.lvm.lv=fedora_localhost-live/swap rhgb quiet
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'compacted' format.
[    0.000000] signal: max sigframe size: 2032
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000884bafff] usable
[    0.000000] BIOS-e820: [mem 0x00000000884bb000-0x000000008a0c3fff] reserved
[    0.000000] BIOS-e820: [mem 0x000000008a0c4000-0x000000008a141fff] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000008a142000-0x000000008a2a9fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000008a2aa000-0x000000008ac0dfff] reserved
[    0.000000] BIOS-e820: [mem 0x000000008ac0e000-0x000000008ac0efff] usable
[    0.000000] BIOS-e820: [mem 0x000000008ac0f000-0x000000008fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed03fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000106dffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0x7661b018-0x7662be57] usable ==> usable
[    0.000000] e820: update [mem 0x7661b018-0x7662be57] usable ==> usable
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009efff] usable
[    0.000000] reserve setup_data: [mem 0x000000000009f000-0x00000000000fffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x000000007661b017] usable
[    0.000000] reserve setup_data: [mem 0x000000007661b018-0x000000007662be57] usable
[    0.000000] reserve setup_data: [mem 0x000000007662be58-0x00000000884bafff] usable
[    0.000000] reserve setup_data: [mem 0x00000000884bb000-0x000000008a0c3fff] reserved
[    0.000000] reserve setup_data: [mem 0x000000008a0c4000-0x000000008a141fff] ACPI data
[    0.000000] reserve setup_data: [mem 0x000000008a142000-0x000000008a2a9fff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000008a2aa000-0x000000008ac0dfff] reserved
[    0.000000] reserve setup_data: [mem 0x000000008ac0e000-0x000000008ac0efff] usable
[    0.000000] reserve setup_data: [mem 0x000000008ac0f000-0x000000008fffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed00000-0x00000000fed03fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000106dffffff] usable
[    0.000000] efi: EFI v2.70 by American Megatrends
[    0.000000] efi: ACPI 2.0=0x8a0de000 ACPI=0x8a0de000 TPMFinalLog=0x8a234000 SMBIOS=0x8a9a8000 SMBIOS 3.0=0x8a9a7000 MEMATTR=0x83221018 ESRT=0x86011b18 MOKvar=0x8a9d8000 RNG=0x8a9c1f98 TPMEventLog=0x7662c018 
[    0.000000] efi: seeding entropy pool
[    0.000000] random: crng init done
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.2.1 present.
[    0.000000] DMI: ASUS System Product Name/PRIME H370M-PLUS, BIOS 3201 09/08/2021
[    0.000000] tsc: Detected 3000.000 MHz processor
[    0.000006] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000009] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000017] last_pfn = 0x106e000 max_arch_pfn = 0x400000000
[    0.000112] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.000592] last_pfn = 0x8ac0f max_arch_pfn = 0x400000000
[    0.008513] esrt: Reserving ESRT space from 0x0000000086011b18 to 0x0000000086011b50.
[    0.008517] e820: update [mem 0x86011000-0x86011fff] usable ==> reserved
[    0.008533] Using GB pages for direct mapping
[    0.009137] secureboot: Secure boot disabled
[    0.009138] RAMDISK: [mem 0x76637000-0x78ca7fff]
[    0.009143] ACPI: Early table checksum verification disabled
[    0.009145] ACPI: RSDP 0x000000008A0DE000 000024 (v02 ALASKA)
[    0.009148] ACPI: XSDT 0x000000008A0DE0B0 0000D4 (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.009153] ACPI: FACP 0x000000008A120458 000114 (v06 ALASKA A M I    01072009 AMI  00010013)
[    0.009157] ACPI: DSDT 0x000000008A0DE218 042240 (v02 ALASKA A M I    01072009 INTL 20160527)
[    0.009160] ACPI: FACS 0x000000008A2A9080 000040
[    0.009162] ACPI: APIC 0x000000008A120570 0000BC (v04 ALASKA A M I    01072009 AMI  00010013)
[    0.009165] ACPI: FPDT 0x000000008A120630 000044 (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.009167] ACPI: FIDT 0x000000008A120678 00009C (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.009170] ACPI: MCFG 0x000000008A120718 00003C (v01 ALASKA A M I    01072009 MSFT 00000097)
[    0.009173] ACPI: WSMT 0x000000008A12EF68 000028 (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.009175] ACPI: SSDT 0x000000008A1207B0 001B60 (v02 CpuRef CpuSsdt  00003000 INTL 20160527)
[    0.009178] ACPI: SSDT 0x000000008A122310 003099 (v02 SaSsdt SaSsdt   00003000 INTL 20160527)
[    0.009181] ACPI: HPET 0x000000008A1253B0 000038 (v01 ALASKA A M I    00000002      01000013)
[    0.009183] ACPI: SSDT 0x000000008A1253E8 000FAE (v02 ALASKA Ther_Rvp 00001000 INTL 20160527)
[    0.009186] ACPI: SSDT 0x000000008A126398 002FCF (v02 INTEL  xh_cfsd4 00000000 INTL 20160527)
[    0.009188] ACPI: UEFI 0x000000008A129368 000042 (v01 ALASKA A M I    00000002      01000013)
[    0.009191] ACPI: LPIT 0x000000008A1293B0 000094 (v01 ALASKA A M I    00000002      01000013)
[    0.009193] ACPI: SSDT 0x000000008A129448 0027DE (v02 ALASKA PtidDevc 00001000 INTL 20160527)
[    0.009196] ACPI: SSDT 0x000000008A12BC28 0014E2 (v02 ALASKA TbtTypeC 00000000 INTL 20160527)
[    0.009199] ACPI: DBGP 0x000000008A12D110 000034 (v01 ALASKA A M I    00000002      01000013)
[    0.009201] ACPI: DBG2 0x000000008A12D148 000054 (v00 ALASKA A M I    00000002      01000013)
[    0.009204] ACPI: SSDT 0x000000008A12D1A0 001B67 (v02 ALASKA UsbCTabl 00001000 INTL 20160527)
[    0.009206] ACPI: DMAR 0x000000008A12ED08 0000A8 (v01 INTEL  EDK2     00000002      01000013)
[    0.009209] ACPI: SSDT 0x000000008A12EDB0 000144 (v02 Intel  ADebTabl 00001000 INTL 20160527)
[    0.009211] ACPI: BGRT 0x000000008A12EEF8 000038 (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.009214] ACPI: TPM2 0x000000008A12EF30 000034 (v04 ALASKA A M I    00000001 AMI  00000000)
[    0.009216] ACPI: Reserving FACP table memory at [mem 0x8a120458-0x8a12056b]
[    0.009217] ACPI: Reserving DSDT table memory at [mem 0x8a0de218-0x8a120457]
[    0.009218] ACPI: Reserving FACS table memory at [mem 0x8a2a9080-0x8a2a90bf]
[    0.009219] ACPI: Reserving APIC table memory at [mem 0x8a120570-0x8a12062b]
[    0.009220] ACPI: Reserving FPDT table memory at [mem 0x8a120630-0x8a120673]
[    0.009221] ACPI: Reserving FIDT table memory at [mem 0x8a120678-0x8a120713]
[    0.009222] ACPI: Reserving MCFG table memory at [mem 0x8a120718-0x8a120753]
[    0.009223] ACPI: Reserving WSMT table memory at [mem 0x8a12ef68-0x8a12ef8f]
[    0.009224] ACPI: Reserving SSDT table memory at [mem 0x8a1207b0-0x8a12230f]
[    0.009225] ACPI: Reserving SSDT table memory at [mem 0x8a122310-0x8a1253a8]
[    0.009225] ACPI: Reserving HPET table memory at [mem 0x8a1253b0-0x8a1253e7]
[    0.009226] ACPI: Reserving SSDT table memory at [mem 0x8a1253e8-0x8a126395]
[    0.009227] ACPI: Reserving SSDT table memory at [mem 0x8a126398-0x8a129366]
[    0.009228] ACPI: Reserving UEFI table memory at [mem 0x8a129368-0x8a1293a9]
[    0.009229] ACPI: Reserving LPIT table memory at [mem 0x8a1293b0-0x8a129443]
[    0.009230] ACPI: Reserving SSDT table memory at [mem 0x8a129448-0x8a12bc25]
[    0.009231] ACPI: Reserving SSDT table memory at [mem 0x8a12bc28-0x8a12d109]
[    0.009232] ACPI: Reserving DBGP table memory at [mem 0x8a12d110-0x8a12d143]
[    0.009233] ACPI: Reserving DBG2 table memory at [mem 0x8a12d148-0x8a12d19b]
[    0.009234] ACPI: Reserving SSDT table memory at [mem 0x8a12d1a0-0x8a12ed06]
[    0.009235] ACPI: Reserving DMAR table memory at [mem 0x8a12ed08-0x8a12edaf]
[    0.009236] ACPI: Reserving SSDT table memory at [mem 0x8a12edb0-0x8a12eef3]
[    0.009237] ACPI: Reserving BGRT table memory at [mem 0x8a12eef8-0x8a12ef2f]
[    0.009238] ACPI: Reserving TPM2 table memory at [mem 0x8a12ef30-0x8a12ef63]
[    0.009392] No NUMA configuration found
[    0.009392] Faking a node at [mem 0x0000000000000000-0x000000106dffffff]
[    0.009401] NODE_DATA(0) allocated [mem 0x106dfd5000-0x106dffffff]
[    0.089554] Zone ranges:
[    0.089555]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.089557]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.089558]   Normal   [mem 0x0000000100000000-0x000000106dffffff]
[    0.089560]   Device   empty
[    0.089560] Movable zone start for each node
[    0.089563] Early memory node ranges
[    0.089563]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.089564]   node   0: [mem 0x0000000000100000-0x00000000884bafff]
[    0.089566]   node   0: [mem 0x000000008ac0e000-0x000000008ac0efff]
[    0.089566]   node   0: [mem 0x0000000100000000-0x000000106dffffff]
[    0.089573] Initmem setup node 0 [mem 0x0000000000001000-0x000000106dffffff]
[    0.089577] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.089599] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.092677] On node 0, zone DMA32: 10067 pages in unavailable ranges
[    0.181329] On node 0, zone Normal: 21489 pages in unavailable ranges
[    0.181427] On node 0, zone Normal: 8192 pages in unavailable ranges
[    0.181442] Reserving Intel graphics memory at [mem 0x8c000000-0x8fffffff]
[    0.181707] ACPI: PM-Timer IO Port: 0x1808
[    0.181713] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.181714] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.181715] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.181716] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.181717] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.181718] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.181718] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.181719] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.181753] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.181755] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.181757] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.181760] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.181762] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.181767] e820: update [mem 0x83be0000-0x83cd3fff] usable ==> reserved
[    0.181778] TSC deadline timer available
[    0.181779] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.181795] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.181797] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
[    0.181799] PM: hibernation: Registered nosave memory: [mem 0x7661b000-0x7661bfff]
[    0.181801] PM: hibernation: Registered nosave memory: [mem 0x7662b000-0x7662bfff]
[    0.181802] PM: hibernation: Registered nosave memory: [mem 0x83be0000-0x83cd3fff]
[    0.181804] PM: hibernation: Registered nosave memory: [mem 0x86011000-0x86011fff]
[    0.181806] PM: hibernation: Registered nosave memory: [mem 0x884bb000-0x8a0c3fff]
[    0.181806] PM: hibernation: Registered nosave memory: [mem 0x8a0c4000-0x8a141fff]
[    0.181807] PM: hibernation: Registered nosave memory: [mem 0x8a142000-0x8a2a9fff]
[    0.181808] PM: hibernation: Registered nosave memory: [mem 0x8a2aa000-0x8ac0dfff]
[    0.181809] PM: hibernation: Registered nosave memory: [mem 0x8ac0f000-0x8fffffff]
[    0.181810] PM: hibernation: Registered nosave memory: [mem 0x90000000-0xdfffffff]
[    0.181811] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.181811] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0xfdffffff]
[    0.181812] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.181813] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.181814] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.181814] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0xfecfffff]
[    0.181815] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0xfed03fff]
[    0.181816] PM: hibernation: Registered nosave memory: [mem 0xfed04000-0xfedfffff]
[    0.181816] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.181817] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xfeffffff]
[    0.181818] PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.181819] [mem 0x90000000-0xdfffffff] available for PCI devices
[    0.181820] Booting paravirtualized kernel on bare hardware
[    0.181822] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.187644] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
[    0.187807] percpu: Embedded 61 pages/cpu s212992 r8192 d28672 u262144
[    0.187814] pcpu-alloc: s212992 r8192 d28672 u262144 alloc=1*2097152
[    0.187816] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.187844] Fallback order for Node 0: 0 
[    0.187847] Built 1 zonelists, mobility grouping on.  Total pages: 16475689
[    0.187848] Policy zone: Normal
[    0.187849] Kernel command line: BOOT_IMAGE=(hd3,gpt2)/vmlinuz-5.19.11-300.fc37.x86_64 root=UUID=b7fdf8a0-5165-4827-95b0-81daa13e43aa ro rootflags=subvol=root resume=/dev/mapper/fedora_localhost--live-swap rd.luks.uuid=luks-8f7e929f-c3f1-4a33-8e54-dc87f811fe2a rd.lvm.lv=fedora_localhost-live/swap rhgb quiet
[    0.187962] Unknown kernel command line parameters "rhgb BOOT_IMAGE=(hd3,gpt2)/vmlinuz-5.19.11-300.fc37.x86_64", will be passed to user space.
[    0.190768] Dentry cache hash table entries: 8388608 (order: 14, 67108864 bytes, linear)
[    0.192183] Inode-cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.192346] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.311283] Memory: 65573856K/66949480K available (16393K kernel code, 3177K rwdata, 11412K rodata, 3004K init, 4816K bss, 1375364K reserved, 0K cma-reserved)
[    0.311392] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.311404] ftrace: allocating 50352 entries in 197 pages
[    0.319660] ftrace: allocated 197 pages with 4 groups
[    0.320418] Dynamic Preempt: voluntary
[    0.320444] rcu: Preemptible hierarchical RCU implementation.
[    0.320444] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=8.
[    0.320446] 	Trampoline variant of Tasks RCU enabled.
[    0.320446] 	Rude variant of Tasks RCU enabled.
[    0.320446] 	Tracing variant of Tasks RCU enabled.
[    0.320447] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.320448] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.325075] NR_IRQS: 524544, nr_irqs: 2048, preallocated irqs: 16
[    0.325329] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.325529] kfence: initialized - using 2097152 bytes for 255 objects at 0x0000000044435ea2-0x0000000017cce43f
[    0.325576] Console: colour dummy device 80x25
[    0.325593] printk: console [tty0] enabled
[    0.325611] ACPI: Core revision 20220331
[    0.325951] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[    0.326040] APIC: Switch to symmetric I/O mode setup
[    0.326042] DMAR: Host address width 39
[    0.326043] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.326047] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 19e2ff0505e
[    0.326050] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.326052] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.326054] DMAR: RMRR base: 0x0000003e2e0000 end: 0x0000003e2fffff
[    0.326056] DMAR: [Firmware Bug]: No firmware reserved region can cover this RMRR [0x000000003e2e0000-0x000000003e2fffff], contact BIOS vendor for fixes
[    0.326057] DMAR: [Firmware Bug]: Your BIOS is broken; bad RMRR [0x000000003e2e0000-0x000000003e2fffff]
               BIOS vendor: American Megatrends Inc.; Ver: 3201; Product Version: System Version
[    0.326059] DMAR: RMRR base: 0x0000008b800000 end: 0x0000008fffffff
[    0.326061] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.326062] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.326063] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.327916] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.327918] x2apic enabled
[    0.327942] Switched APIC routing to cluster x2apic.
[    0.333093] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.338006] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2b3e459bf4c, max_idle_ns: 440795289890 ns
[    0.338010] Calibrating delay loop (skipped), value calculated using timer frequency.. 6000.00 BogoMIPS (lpj=3000000)
[    0.338013] pid_max: default: 32768 minimum: 301
[    0.341043] LSM: Security Framework initializing
[    0.341053] Yama: becoming mindful.
[    0.341057] SELinux:  Initializing.
[    0.341078] LSM support for eBPF active
[    0.341080] landlock: Up and running.
[    0.341177] Mount-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.341257] Mountpoint-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.341434] x86/cpu: VMX (outside TXT) disabled by BIOS
[    0.341436] x86/cpu: SGX disabled by BIOS.
[    0.341440] CPU0: Thermal monitoring enabled (TM1)
[    0.341498] process: using mwait in idle threads
[    0.341500] Last level iTLB entries: 4KB 128, 2MB 8, 4MB 8
[    0.341501] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.341506] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.341508] Spectre V2 : Mitigation: Enhanced IBRS
[    0.341509] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.341509] Spectre V2 : Spectre v2 / PBRSB-eIBRS: Retire a single CALL on VMEXIT
[    0.341510] RETBleed: Mitigation: Enhanced IBRS
[    0.341512] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.341513] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.341517] TAA: Mitigation: TSX disabled
[    0.341517] MMIO Stale Data: Mitigation: Clear CPU buffers
[    0.341518] SRBDS: Mitigation: Microcode
[    0.359666] Freeing SMP alternatives memory: 44K
[    0.360009] smpboot: CPU0: Intel(R) Core(TM) i7-9700 CPU @ 3.00GHz (family: 0x6, model: 0x9e, stepping: 0xd)
[    0.360009] cblist_init_generic: Setting adjustable number of callback queues.
[    0.360009] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.360009] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.360009] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.360009] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.360009] ... version:                4
[    0.360009] ... bit width:              48
[    0.360009] ... generic registers:      8
[    0.360009] ... value mask:             0000ffffffffffff
[    0.360009] ... max period:             00007fffffffffff
[    0.360009] ... fixed-purpose events:   3
[    0.360009] ... event mask:             00000007000000ff
[    0.360009] Estimated ratio of average max frequency by base frequency (times 1024): 1570
[    0.360009] rcu: Hierarchical SRCU implementation.
[    0.360009] rcu: 	Max phase no-delay instances is 400.
[    0.360009] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.360009] smp: Bringing up secondary CPUs ...
[    0.360037] x86: Booting SMP configuration:
[    0.360037] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
[    0.373411] smp: Brought up 1 node, 8 CPUs
[    0.373411] smpboot: Max logical packages: 1
[    0.373411] smpboot: Total of 8 processors activated (48000.00 BogoMIPS)
[    0.375663] devtmpfs: initialized
[    0.375663] x86/mm: Memory block size: 2048MB
[    0.376116] ACPI: PM: Registering ACPI NVS region [mem 0x8a142000-0x8a2a9fff] (1474560 bytes)
[    0.376162] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.376165] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.376208] pinctrl core: initialized pinctrl subsystem
[    0.376432] PM: RTC time: 21:22:16, date: 2022-09-25
[    0.376637] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.376740] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.376747] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.376752] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.376761] audit: initializing netlink subsys (disabled)
[    0.376790] audit: type=2000 audit(1664140936.045:1): state=initialized audit_enabled=0 res=1
[    0.376849] thermal_sys: Registered thermal governor 'fair_share'
[    0.376850] thermal_sys: Registered thermal governor 'bang_bang'
[    0.376851] thermal_sys: Registered thermal governor 'step_wise'
[    0.376852] thermal_sys: Registered thermal governor 'user_space'
[    0.376861] cpuidle: using governor menu
[    0.376903] HugeTLB: can optimize 4095 vmemmap pages for hugepages-1048576kB
[    0.376903] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.376903] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.376903] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.377011] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.377025] PCI: Using configuration type 1 for base access
[    0.377213] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.378634] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.387028] HugeTLB: can optimize 7 vmemmap pages for hugepages-2048kB
[    0.387028] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.387028] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.387044] cryptd: max_cpu_qlen set to 1000
[    0.387050] raid6: skipped pq benchmark and selected avx2x4
[    0.387050] raid6: using avx2x2 recovery algorithm
[    0.387066] ACPI: Added _OSI(Module Device)
[    0.387067] ACPI: Added _OSI(Processor Device)
[    0.387068] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.387069] ACPI: Added _OSI(Processor Aggregator Device)
[    0.387070] ACPI: Added _OSI(Linux-Dell-Video)
[    0.387071] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.387072] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.442645] ACPI: 9 ACPI AML tables successfully acquired and loaded
[    0.448253] ACPI: Dynamic OEM Table Load:
[    0.448258] ACPI: SSDT 0xFFFFA084402BC400 0000F4 (v02 PmRef  Cpu0Psd  00003000 INTL 20160527)
[    0.449082] ACPI: \_SB_.PR00: _OSC native thermal LVT Acked
[    0.450282] ACPI: Dynamic OEM Table Load:
[    0.450287] ACPI: SSDT 0xFFFFA084415E0800 000400 (v02 PmRef  Cpu0Cst  00003001 INTL 20160527)
[    0.451186] ACPI: Dynamic OEM Table Load:
[    0.451191] ACPI: SSDT 0xFFFFA084415EC800 000605 (v02 PmRef  Cpu0Ist  00003000 INTL 20160527)
[    0.452156] ACPI: Dynamic OEM Table Load:
[    0.452160] ACPI: SSDT 0xFFFFA08440216200 000161 (v02 PmRef  Cpu0Hwp  00003000 INTL 20160527)
[    0.452973] ACPI: Dynamic OEM Table Load:
[    0.452978] ACPI: SSDT 0xFFFFA084415EA800 000724 (v02 PmRef  HwpLvt   00003000 INTL 20160527)
[    0.454002] ACPI: Dynamic OEM Table Load:
[    0.454007] ACPI: SSDT 0xFFFFA084415EC000 0005FC (v02 PmRef  ApIst    00003000 INTL 20160527)
[    0.454946] ACPI: Dynamic OEM Table Load:
[    0.454950] ACPI: SSDT 0xFFFFA084415E6800 000317 (v02 PmRef  ApHwp    00003000 INTL 20160527)
[    0.455884] ACPI: Dynamic OEM Table Load:
[    0.455889] ACPI: SSDT 0xFFFFA0844007F000 000AB0 (v02 PmRef  ApPsd    00003000 INTL 20160527)
[    0.457199] ACPI: Dynamic OEM Table Load:
[    0.457204] ACPI: SSDT 0xFFFFA084415E2C00 00030A (v02 PmRef  ApCst    00003000 INTL 20160527)
[    0.461396] ACPI: Interpreter enabled
[    0.461435] ACPI: PM: (supports S0 S3 S4 S5)
[    0.461436] ACPI: Using IOAPIC for interrupt routing
[    0.461471] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.461472] PCI: Using E820 reservations for host bridge windows
[    0.462349] ACPI: Enabled 10 GPEs in block 00 to 7F
[    0.474409] ACPI: PM: Power Resource [USBC]
[    0.476839] ACPI: PM: Power Resource [V0PR]
[    0.477192] ACPI: PM: Power Resource [V1PR]
[    0.477529] ACPI: PM: Power Resource [V2PR]
[    0.482573] ACPI: PM: Power Resource [WRST]
[    0.485767] ACPI: PM: Power Resource [FN00]
[    0.485823] ACPI: PM: Power Resource [FN01]
[    0.485876] ACPI: PM: Power Resource [FN02]
[    0.485927] ACPI: PM: Power Resource [FN03]
[    0.485977] ACPI: PM: Power Resource [FN04]
[    0.486507] ACPI: PM: Power Resource [PIN]
[    0.486879] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.486885] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    0.486960] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug SHPCHotplug PME]
[    0.487104] acpi PNP0A08:00: _OSC: OS now controls [AER PCIeCapability LTR DPC]
[    0.487105] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.487831] PCI host bridge to bus 0000:00
[    0.487833] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.487835] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.487836] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.487838] pci_bus 0000:00: root bus resource [mem 0x90000000-0xdfffffff window]
[    0.487839] pci_bus 0000:00: root bus resource [mem 0xfc800000-0xfe7fffff window]
[    0.487840] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.487917] pci 0000:00:00.0: [8086:3e30] type 00 class 0x060000
[    0.487980] pci 0000:00:02.0: [8086:3e98] type 00 class 0x030000
[    0.487987] pci 0000:00:02.0: reg 0x10: [mem 0xa0000000-0xa0ffffff 64bit]
[    0.487992] pci 0000:00:02.0: reg 0x18: [mem 0x90000000-0x9fffffff 64bit pref]
[    0.487995] pci 0000:00:02.0: reg 0x20: [io  0x3000-0x303f]
[    0.488008] pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.488012] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.488220] pci 0000:00:14.0: [8086:a36d] type 00 class 0x0c0330
[    0.488234] pci 0000:00:14.0: reg 0x10: [mem 0xa1320000-0xa132ffff 64bit]
[    0.488288] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.489836] pci 0000:00:14.2: [8086:a36f] type 00 class 0x050000
[    0.489852] pci 0000:00:14.2: reg 0x10: [mem 0xa1336000-0xa1337fff 64bit]
[    0.489862] pci 0000:00:14.2: reg 0x18: [mem 0xa133c000-0xa133cfff 64bit]
[    0.489968] pci 0000:00:16.0: [8086:a360] type 00 class 0x078000
[    0.489987] pci 0000:00:16.0: reg 0x10: [mem 0xa133b000-0xa133bfff 64bit]
[    0.490056] pci 0000:00:16.0: PME# supported from D3hot
[    0.490497] pci 0000:00:17.0: [8086:a352] type 00 class 0x010601
[    0.490508] pci 0000:00:17.0: reg 0x10: [mem 0xa1334000-0xa1335fff]
[    0.490515] pci 0000:00:17.0: reg 0x14: [mem 0xa133a000-0xa133a0ff]
[    0.490521] pci 0000:00:17.0: reg 0x18: [io  0x3090-0x3097]
[    0.490528] pci 0000:00:17.0: reg 0x1c: [io  0x3080-0x3083]
[    0.490534] pci 0000:00:17.0: reg 0x20: [io  0x3060-0x307f]
[    0.490540] pci 0000:00:17.0: reg 0x24: [mem 0xa1339000-0xa13397ff]
[    0.490574] pci 0000:00:17.0: PME# supported from D3hot
[    0.490850] pci 0000:00:1b.0: [8086:a32c] type 01 class 0x060400
[    0.490923] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.490946] pci 0000:00:1b.0: PTM enabled (root), 4ns granularity
[    0.491549] pci 0000:00:1c.0: [8086:a33a] type 01 class 0x060400
[    0.491623] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.492204] pci 0000:00:1d.0: [8086:a330] type 01 class 0x060400
[    0.492266] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.492817] pci 0000:00:1d.2: [8086:a332] type 01 class 0x060400
[    0.492889] pci 0000:00:1d.2: PME# supported from D0 D3hot D3cold
[    0.492912] pci 0000:00:1d.2: PTM enabled (root), 4ns granularity
[    0.493498] pci 0000:00:1f.0: [8086:a304] type 00 class 0x060100
[    0.493862] pci 0000:00:1f.3: [8086:a348] type 00 class 0x040300
[    0.493891] pci 0000:00:1f.3: reg 0x10: [mem 0xa1330000-0xa1333fff 64bit]
[    0.493928] pci 0000:00:1f.3: reg 0x20: [mem 0xa1000000-0xa10fffff 64bit]
[    0.494001] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.497106] pci 0000:00:1f.4: [8086:a323] type 00 class 0x0c0500
[    0.497130] pci 0000:00:1f.4: reg 0x10: [mem 0xa1338000-0xa13380ff 64bit]
[    0.497156] pci 0000:00:1f.4: reg 0x20: [io  0xefa0-0xefbf]
[    0.497386] pci 0000:00:1f.5: [8086:a324] type 00 class 0x0c8000
[    0.497400] pci 0000:00:1f.5: reg 0x10: [mem 0xfe010000-0xfe010fff]
[    0.497500] pci 0000:00:1f.6: [8086:15bc] type 00 class 0x020000
[    0.497526] pci 0000:00:1f.6: reg 0x10: [mem 0xa1300000-0xa131ffff]
[    0.497667] pci 0000:00:1f.6: PME# supported from D0 D3hot D3cold
[    0.497800] pci 0000:01:00.0: [144d:a809] type 00 class 0x010802
[    0.497819] pci 0000:01:00.0: reg 0x10: [mem 0xa1200000-0xa1203fff 64bit]
[    0.498050] pci 0000:00:1b.0: PCI bridge to [bus 01]
[    0.498054] pci 0000:00:1b.0:   bridge window [mem 0xa1200000-0xa12fffff]
[    0.498123] acpiphp: Slot [1] registered
[    0.498130] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.498190] acpiphp: Slot [1-1] registered
[    0.498193] pci 0000:00:1d.0: PCI bridge to [bus 03]
[    0.498276] pci 0000:04:00.0: [1912:0014] type 00 class 0x0c0330
[    0.498309] pci 0000:04:00.0: reg 0x10: [mem 0xa1100000-0xa1101fff 64bit]
[    0.498476] pci 0000:04:00.0: PME# supported from D0 D3hot D3cold
[    0.498599] pci 0000:00:1d.2: PCI bridge to [bus 04]
[    0.498603] pci 0000:00:1d.2:   bridge window [mem 0xa1100000-0xa11fffff]
[    0.499775] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.499847] ACPI: PCI: Interrupt link LNKB configured for IRQ 1
[    0.499916] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.499986] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.500057] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.500126] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.500195] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.500264] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.505280] iommu: Default domain type: Translated 
[    0.505280] iommu: DMA domain TLB invalidation policy: lazy mode 
[    0.505280] SCSI subsystem initialized
[    0.505280] libata version 3.00 loaded.
[    0.505280] ACPI: bus type USB registered
[    0.505280] usbcore: registered new interface driver usbfs
[    0.505280] usbcore: registered new interface driver hub
[    0.505280] usbcore: registered new device driver usb
[    0.505280] pps_core: LinuxPPS API ver. 1 registered
[    0.505280] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.505280] PTP clock support registered
[    0.505280] EDAC MC: Ver: 3.0.0
[    0.505280] Registered efivars operations
[    0.505280] NetLabel: Initializing
[    0.505280] NetLabel:  domain hash size = 128
[    0.505280] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.505280] NetLabel:  unlabeled traffic allowed by default
[    0.505280] mctp: management component transport protocol core
[    0.505280] NET: Registered PF_MCTP protocol family
[    0.505280] PCI: Using ACPI for IRQ routing
[    0.548660] PCI: pci_cache_line_size set to 64 bytes
[    0.548731] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.548733] e820: reserve RAM buffer [mem 0x7661b018-0x77ffffff]
[    0.548734] e820: reserve RAM buffer [mem 0x83be0000-0x83ffffff]
[    0.548735] e820: reserve RAM buffer [mem 0x86011000-0x87ffffff]
[    0.548736] e820: reserve RAM buffer [mem 0x884bb000-0x8bffffff]
[    0.548737] e820: reserve RAM buffer [mem 0x8ac0f000-0x8bffffff]
[    0.548738] e820: reserve RAM buffer [mem 0x106e000000-0x106fffffff]
[    0.548748] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.548748] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.548748] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.548748] vgaarb: loaded
[    0.548748] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.548748] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.550032] clocksource: Switched to clocksource tsc-early
[    0.558835] VFS: Disk quotas dquot_6.6.0
[    0.558844] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.558891] pnp: PnP ACPI init
[    0.558947] system 00:00: [mem 0x40000000-0x403fffff] could not be reserved
[    0.559103] system 00:01: [io  0x0290-0x029f] has been reserved
[    0.559501] pnp 00:02: [dma 0 disabled]
[    0.559622] system 00:03: [io  0x0680-0x069f] has been reserved
[    0.559723] system 00:04: [io  0x1854-0x1857] has been reserved
[    0.559861] system 00:05: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.559863] system 00:05: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.559865] system 00:05: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.559867] system 00:05: [mem 0xe0000000-0xefffffff] has been reserved
[    0.559868] system 00:05: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.559870] system 00:05: [mem 0xfed90000-0xfed93fff] could not be reserved
[    0.559871] system 00:05: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.559872] system 00:05: [mem 0xfee00000-0xfeefffff] could not be reserved
[    0.560077] system 00:06: [io  0x1800-0x18fe] could not be reserved
[    0.560079] system 00:06: [mem 0xfd000000-0xfd69ffff] has been reserved
[    0.560081] system 00:06: [mem 0xfd6c0000-0xfd6cffff] has been reserved
[    0.560082] system 00:06: [mem 0xfd6f0000-0xfdffffff] has been reserved
[    0.560084] system 00:06: [mem 0xfe000000-0xfe01ffff] could not be reserved
[    0.560085] system 00:06: [mem 0xfe200000-0xfe7fffff] has been reserved
[    0.560088] system 00:06: [mem 0xff000000-0xffffffff] has been reserved
[    0.560353] system 00:07: [io  0x2000-0x20fe] has been reserved
[    0.561378] system 00:08: [mem 0xfd6e0000-0xfd6effff] has been reserved
[    0.561380] system 00:08: [mem 0xfd6d0000-0xfd6dffff] has been reserved
[    0.561382] system 00:08: [mem 0xfd6b0000-0xfd6bffff] has been reserved
[    0.561383] system 00:08: [mem 0xfd6a0000-0xfd6affff] has been reserved
[    0.562234] pnp: PnP ACPI: found 9 devices
[    0.567635] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.567679] NET: Registered PF_INET protocol family
[    0.567804] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.570467] tcp_listen_portaddr_hash hash table entries: 32768 (order: 7, 524288 bytes, linear)
[    0.570507] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.570517] TCP established hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.570898] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    0.570976] TCP: Hash tables configured (established 524288 bind 65536)
[    0.571130] MPTCP token hash table entries: 65536 (order: 8, 1572864 bytes, linear)
[    0.571251] UDP hash table entries: 32768 (order: 8, 1048576 bytes, linear)
[    0.571344] UDP-Lite hash table entries: 32768 (order: 8, 1048576 bytes, linear)
[    0.571456] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.571460] NET: Registered PF_XDP protocol family
[    0.571464] pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to [bus 02] add_size 1000
[    0.571467] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 02] add_size 200000 add_align 100000
[    0.571469] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff] to [bus 02] add_size 200000 add_align 100000
[    0.571474] clipped [mem size 0x00020000] to [mem size 0xfffffffffffc0000] for e820 entry [mem 0x0009f000-0x000fffff]
[    0.571478] pci 0000:00:1c.0: BAR 14: assigned [mem 0xa1400000-0xa15fffff]
[    0.571480] clipped [mem size 0x00000000 64bit pref] to [mem size 0xfffffffffffa0000 64bit pref] for e820 entry [mem 0x0009f000-0x000fffff]
[    0.571483] clipped [mem size 0x00020000 64bit pref] to [mem size 0xfffffffffffc0000 64bit pref] for e820 entry [mem 0x0009f000-0x000fffff]
[    0.571485] pci 0000:00:1c.0: BAR 15: assigned [mem 0xa1600000-0xa17fffff 64bit pref]
[    0.571487] pci 0000:00:1c.0: BAR 13: assigned [io  0x4000-0x4fff]
[    0.571490] pci 0000:00:1b.0: PCI bridge to [bus 01]
[    0.571498] pci 0000:00:1b.0:   bridge window [mem 0xa1200000-0xa12fffff]
[    0.571504] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.571507] pci 0000:00:1c.0:   bridge window [io  0x4000-0x4fff]
[    0.571510] pci 0000:00:1c.0:   bridge window [mem 0xa1400000-0xa15fffff]
[    0.571513] pci 0000:00:1c.0:   bridge window [mem 0xa1600000-0xa17fffff 64bit pref]
[    0.571517] pci 0000:00:1d.0: PCI bridge to [bus 03]
[    0.571524] pci 0000:00:1d.2: PCI bridge to [bus 04]
[    0.571527] pci 0000:00:1d.2:   bridge window [mem 0xa1100000-0xa11fffff]
[    0.571532] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.571534] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.571535] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.571536] pci_bus 0000:00: resource 7 [mem 0x90000000-0xdfffffff window]
[    0.571537] pci_bus 0000:00: resource 8 [mem 0xfc800000-0xfe7fffff window]
[    0.571539] pci_bus 0000:01: resource 1 [mem 0xa1200000-0xa12fffff]
[    0.571540] pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
[    0.571541] pci_bus 0000:02: resource 1 [mem 0xa1400000-0xa15fffff]
[    0.571542] pci_bus 0000:02: resource 2 [mem 0xa1600000-0xa17fffff 64bit pref]
[    0.571543] pci_bus 0000:04: resource 1 [mem 0xa1100000-0xa11fffff]
[    0.572034] PCI: CLS 64 bytes, default 64
[    0.572045] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.572046] software IO TLB: mapped [mem 0x000000007f221000-0x0000000083221000] (64MB)
[    0.572061] Trying to unpack rootfs image as initramfs...
[    0.572118] platform rtc_cmos: registered platform RTC device (no PNP device found)
[    0.572848] Initialise system trusted keyrings
[    0.572855] Key type blacklist registered
[    0.572885] workingset: timestamp_bits=36 max_order=24 bucket_order=0
[    0.574190] zbud: loaded
[    0.574696] integrity: Platform Keyring initialized
[    0.574699] integrity: Machine keyring initialized
[    0.582295] NET: Registered PF_ALG protocol family
[    0.582296] xor: automatically using best checksumming function   avx       
[    0.582297] Key type asymmetric registered
[    0.582298] Asymmetric key parser 'x509' registered
[    1.031200] Freeing initrd memory: 39364K
[    1.034153] alg: self-tests for CTR-KDF (hmac(sha256)) passed
[    1.034177] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    1.034202] io scheduler mq-deadline registered
[    1.034203] io scheduler kyber registered
[    1.034229] io scheduler bfq registered
[    1.035595] atomic64_test: passed for x86-64 platform with CX8 and with SSE
[    1.036067] pcieport 0000:00:1b.0: AER: enabled with IRQ 122
[    1.036103] pcieport 0000:00:1b.0: DPC: enabled with IRQ 122
[    1.036104] pcieport 0000:00:1b.0: DPC: error containment capabilities: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 4, DL_ActiveErr+
[    1.036380] pcieport 0000:00:1d.2: AER: enabled with IRQ 125
[    1.036416] pcieport 0000:00:1d.2: DPC: enabled with IRQ 125
[    1.036417] pcieport 0000:00:1d.2: DPC: error containment capabilities: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 4, DL_ActiveErr+
[    1.036500] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    1.036991] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0
[    1.037009] ACPI: button: Sleep Button [SLPB]
[    1.037033] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
[    1.037049] ACPI: button: Power Button [PWRB]
[    1.037069] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
[    1.037092] ACPI: button: Power Button [PWRF]
[    1.038314] thermal LNXTHERM:00: registered as thermal_zone0
[    1.038316] ACPI: thermal: Thermal Zone [TZ00] (28 C)
[    1.038544] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    1.038615] 00:02: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    1.040968] Non-volatile memory driver v1.3
[    1.040973] Linux agpgart interface v0.103
[    1.048140] ACPI: bus type drm_connector registered
[    1.049782] ahci 0000:00:17.0: version 3.0
[    1.060113] ahci 0000:00:17.0: AHCI 0001.0301 32 slots 6 ports 6 Gbps 0x3f impl SATA mode
[    1.060117] ahci 0000:00:17.0: flags: 64bit ncq sntf led clo only pio slum part ems deso sadm sds apst 
[    1.075570] scsi host0: ahci
[    1.075877] scsi host1: ahci
[    1.076147] scsi host2: ahci
[    1.076365] scsi host3: ahci
[    1.076487] scsi host4: ahci
[    1.076583] scsi host5: ahci
[    1.076613] ata1: SATA max UDMA/133 abar m2048@0xa1339000 port 0xa1339100 irq 126
[    1.076615] ata2: SATA max UDMA/133 abar m2048@0xa1339000 port 0xa1339180 irq 126
[    1.076617] ata3: SATA max UDMA/133 abar m2048@0xa1339000 port 0xa1339200 irq 126
[    1.076618] ata4: SATA max UDMA/133 abar m2048@0xa1339000 port 0xa1339280 irq 126
[    1.076619] ata5: SATA max UDMA/133 abar m2048@0xa1339000 port 0xa1339300 irq 126
[    1.076621] ata6: SATA max UDMA/133 abar m2048@0xa1339000 port 0xa1339380 irq 126
[    1.076819] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.076821] ehci-pci: EHCI PCI platform driver
[    1.076828] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.076830] ohci-pci: OHCI PCI platform driver
[    1.076836] uhci_hcd: USB Universal Host Controller Interface driver
[    1.076964] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.077025] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    1.078098] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x110 quirks 0x0000000000009810
[    1.078282] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.078336] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    1.078338] xhci_hcd 0000:00:14.0: Host supports USB 3.1 Enhanced SuperSpeed
[    1.078366] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.19
[    1.078369] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.078370] usb usb1: Product: xHCI Host Controller
[    1.078371] usb usb1: Manufacturer: Linux 5.19.11-300.fc37.x86_64 xhci-hcd
[    1.078372] usb usb1: SerialNumber: 0000:00:14.0
[    1.078481] hub 1-0:1.0: USB hub found
[    1.078496] hub 1-0:1.0: 16 ports detected
[    1.080115] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.19
[    1.080118] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.080119] usb usb2: Product: xHCI Host Controller
[    1.080120] usb usb2: Manufacturer: Linux 5.19.11-300.fc37.x86_64 xhci-hcd
[    1.080121] usb usb2: SerialNumber: 0000:00:14.0
[    1.080214] hub 2-0:1.0: USB hub found
[    1.080225] hub 2-0:1.0: 8 ports detected
[    1.081219] xhci_hcd 0000:04:00.0: failed to load firmware renesas_usb_fw.mem, fallback to ROM
[    1.081284] xhci_hcd 0000:04:00.0: xHCI Host Controller
[    1.081341] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 3
[    1.086687] xhci_hcd 0000:04:00.0: hcc params 0x014051cf hci version 0x100 quirks 0x0000001100000410
[    1.086950] xhci_hcd 0000:04:00.0: xHCI Host Controller
[    1.087003] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 4
[    1.087005] xhci_hcd 0000:04:00.0: Host supports USB 3.0 SuperSpeed
[    1.090309] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.19
[    1.090311] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.090313] usb usb3: Product: xHCI Host Controller
[    1.090314] usb usb3: Manufacturer: Linux 5.19.11-300.fc37.x86_64 xhci-hcd
[    1.090314] usb usb3: SerialNumber: 0000:04:00.0
[    1.090406] hub 3-0:1.0: USB hub found
[    1.090421] hub 3-0:1.0: 4 ports detected
[    1.090526] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.090539] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.19
[    1.090541] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.090542] usb usb4: Product: xHCI Host Controller
[    1.090543] usb usb4: Manufacturer: Linux 5.19.11-300.fc37.x86_64 xhci-hcd
[    1.090544] usb usb4: SerialNumber: 0000:04:00.0
[    1.090630] hub 4-0:1.0: USB hub found
[    1.090645] hub 4-0:1.0: 4 ports detected
[    1.090763] usbcore: registered new interface driver usbserial_generic
[    1.090767] usbserial: USB Serial support registered for generic
[    1.090779] i8042: PNP: No PS/2 controller found.
[    1.090831] mousedev: PS/2 mouse device common for all mice
[    1.090940] rtc_cmos rtc_cmos: RTC can wake from S4
[    1.091796] rtc_cmos rtc_cmos: registered as rtc0
[    1.091965] rtc_cmos rtc_cmos: setting system clock to 2022-09-25T21:22:17 UTC (1664140937)
[    1.091974] rtc_cmos rtc_cmos: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    1.092277] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[    1.092289] device-mapper: uevent: version 1.0.3
[    1.092362] device-mapper: ioctl: 4.47.0-ioctl (2022-07-28) initialised: dm-devel@redhat.com
[    1.092473] intel_pstate: Intel P-state driver initializing
[    1.092976] intel_pstate: Disabling energy efficiency optimization
[    1.092976] intel_pstate: HWP enabled
[    1.093223] [drm] Initialized simpledrm 1.0.0 20200625 for simple-framebuffer.0 on minor 0
[    1.093654] fbcon: Deferring console take-over
[    1.093655] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledrmdrmfb frame buffer device
[    1.093673] hid: raw HID events driver (C) Jiri Kosina
[    1.093688] usbcore: registered new interface driver usbhid
[    1.093689] usbhid: USB HID core driver
[    1.093713] intel_pmc_core INT33A1:00:  initialized
[    1.093800] drop_monitor: Initializing network drop monitor service
[    1.101488] Initializing XFRM netlink socket
[    1.101543] NET: Registered PF_INET6 protocol family
[    1.104135] Segment Routing with IPv6
[    1.104136] RPL Segment Routing with IPv6
[    1.104140] In-situ OAM (IOAM) with IPv6
[    1.104154] mip6: Mobile IPv6
[    1.104155] NET: Registered PF_PACKET protocol family
[    1.104955] microcode: sig=0x906ed, pf=0x2, revision=0xf0
[    1.105147] microcode: Microcode Update Driver: v2.2.
[    1.105151] IPI shorthand broadcast: enabled
[    1.105168] AVX2 version of gcm_enc/dec engaged.
[    1.105571] AES CTR mode by8 optimization enabled
[    1.105734] sched_clock: Marking stable (1100169579, 5554384)->(1110126322, -4402359)
[    1.105875] registered taskstats version 1
[    1.106001] Loading compiled-in X.509 certificates
[    1.123321] Loaded X.509 cert 'Fedora kernel signing key: 2e6616f55eaaeac21f909fe4f915ebd6154c8e2a'
[    1.123598] zswap: loaded using pool lzo/zbud
[    1.123845] page_owner is disabled
[    1.123900] Key type ._fscrypt registered
[    1.123900] Key type .fscrypt registered
[    1.123901] Key type fscrypt-provisioning registered
[    1.124148] Btrfs loaded, crc32c=crc32c-generic, zoned=yes, fsverity=yes
[    1.124158] Key type big_key registered
[    1.124932] Key type trusted registered
[    1.126853] Key type encrypted registered
[    1.127933] integrity: Loading X.509 certificate: UEFI:db
[    1.144416] integrity: Loaded X.509 cert 'ASUSTeK MotherBoard SW Key Certificate: da83b990422ebc8c441f8d8b039a65a2'
[    1.144417] integrity: Loading X.509 certificate: UEFI:db
[    1.144515] integrity: Loaded X.509 cert 'ASUSTeK Notebook SW Key Certificate: b8e581e4df77a5bb4282d5ccfc00c071'
[    1.144515] integrity: Loading X.509 certificate: UEFI:db
[    1.144526] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    1.144527] integrity: Loading X.509 certificate: UEFI:db
[    1.144536] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    1.144536] integrity: Loading X.509 certificate: UEFI:db
[    1.144633] integrity: Loaded X.509 cert 'Canonical Ltd. Master Certificate Authority: ad91990bc22ab1f517048c23b6655a268e345a63'
[    1.145734] Loading compiled-in module X.509 certificates
[    1.146037] Loaded X.509 cert 'Fedora kernel signing key: 2e6616f55eaaeac21f909fe4f915ebd6154c8e2a'
[    1.146039] ima: Allocated hash algorithm: sha256
[    1.164832] ima: No architecture policies found
[    1.164841] evm: Initialising EVM extended attributes:
[    1.164841] evm: security.selinux
[    1.164842] evm: security.SMACK64 (disabled)
[    1.164842] evm: security.SMACK64EXEC (disabled)
[    1.164843] evm: security.SMACK64TRANSMUTE (disabled)
[    1.164843] evm: security.SMACK64MMAP (disabled)
[    1.164843] evm: security.apparmor (disabled)
[    1.164844] evm: security.ima
[    1.164844] evm: security.capability
[    1.164845] evm: HMAC attrs: 0x1
[    1.198364] alg: No test for 842 (842-scomp)
[    1.198378] alg: No test for 842 (842-generic)
[    1.269385] PM:   Magic number: 6:948:399
[    1.269465] RAS: Correctable Errors collector initialized.
[    1.316129] usb 1-5: new full-speed USB device number 2 using xhci_hcd
[    1.332093] usb 3-1: new full-speed USB device number 2 using xhci_hcd
[    1.384241] ata3: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.384323] ata6: SATA link down (SStatus 4 SControl 300)
[    1.384357] ata4: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    1.384388] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.384417] ata1: SATA link down (SStatus 4 SControl 300)
[    1.384443] ata5: SATA link down (SStatus 4 SControl 300)
[    1.386371] ata4.00: ATAPI: ASUS    BW-16D1HT, 3.10, max UDMA/133
[    1.386642] ata2.00: supports DRM functions and may not be fully accessible
[    1.386649] ata2.00: ATA-11: Samsung SSD 860 EVO M.2 500GB, RVT24B6Q, max UDMA/133
[    1.387257] ata2.00: 976773168 sectors, multi 1: LBA48 NCQ (depth 32), AA
[    1.389324] ata4.00: configured for UDMA/133
[    1.389832] ata2.00: Features: Trust Dev-Sleep NCQ-sndrcv
[    1.390369] ata2.00: supports DRM functions and may not be fully accessible
[    1.393603] ata2.00: configured for UDMA/133
[    1.394005] scsi 1:0:0:0: Direct-Access     ATA      Samsung SSD 860  4B6Q PQ: 0 ANSI: 5
[    1.395181] sd 1:0:0:0: Attached scsi generic sg0 type 0
[    1.395302] ata2.00: Enabling discard_zeroes_data
[    1.395395] sd 1:0:0:0: [sda] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    1.395500] sd 1:0:0:0: [sda] Write Protect is off
[    1.395509] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.395693] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.396035] sd 1:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[    1.396719] ata2.00: Enabling discard_zeroes_data
[    1.408041]  sda: sda1 sda2 sda3
[    1.409441] sd 1:0:0:0: [sda] supports TCG Opal
[    1.409448] sd 1:0:0:0: [sda] Attached SCSI disk
[    1.412912] ata3.00: ATA-10: ST4000DM004-2CV104, 0001, max UDMA/133
[    1.422029] ata3.00: 7814037168 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    1.451200] usb 1-5: New USB device found, idVendor=0a12, idProduct=1004, bcdDevice=34.49
[    1.451212] usb 1-5: New USB device strings: Mfr=0, Product=2, SerialNumber=0
[    1.451218] usb 1-5: Product: Avantree DG80
[    1.456920] input: Avantree DG80 Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.3/0003:0A12:1004.0001/input/input3
[    1.472143] ata3.00: configured for UDMA/133
[    1.472477] scsi 2:0:0:0: Direct-Access     ATA      ST4000DM004-2CV1 0001 PQ: 0 ANSI: 5
[    1.473889] sd 2:0:0:0: Attached scsi generic sg1 type 0
[    1.474055] sd 2:0:0:0: [sdb] 7814037168 512-byte logical blocks: (4.00 TB/3.64 TiB)
[    1.474064] sd 2:0:0:0: [sdb] 4096-byte physical blocks
[    1.474154] sd 2:0:0:0: [sdb] Write Protect is off
[    1.474163] sd 2:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    1.474304] sd 2:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.474578] sd 2:0:0:0: [sdb] Preferred minimum I/O size 4096 bytes
[    1.476197] scsi 3:0:0:0: CD-ROM            ASUS     BW-16D1HT        3.10 PQ: 0 ANSI: 5
[    1.478400] usb 3-1: New USB device found, idVendor=0451, idProduct=2046, bcdDevice= 1.25
[    1.478411] usb 3-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    1.485529] hub 3-1:1.0: USB hub found
[    1.489387] hub 3-1:1.0: 4 ports detected
[    1.508357] input: Avantree DG80 as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.3/0003:0A12:1004.0001/input/input4
[    1.508917] hid-generic 0003:0A12:1004.0001: input,hiddev96,hidraw0: USB HID v1.11 Device [Avantree DG80] on usb-0000:00:14.0-5/input3
[    1.526216] sr 3:0:0:0: [sr0] scsi3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form2 cdda tray
[    1.526224] cdrom: Uniform CD-ROM driver Revision: 3.20
[    1.545438] sr 3:0:0:0: Attached scsi CD-ROM sr0
[    1.545654] sr 3:0:0:0: Attached scsi generic sg2 type 5
[    1.561375]  sdb: sdb1
[    1.561665] sd 2:0:0:0: [sdb] Attached SCSI disk
[    1.564710] Freeing unused decrypted memory: 2036K
[    1.566022] Freeing unused kernel image (initmem) memory: 3004K
[    1.571134] Write protecting the kernel read-only data: 30720k
[    1.572675] Freeing unused kernel image (text/rodata gap) memory: 2036K
[    1.573176] Freeing unused kernel image (rodata/data gap) memory: 876K
[    1.578105] tsc: Refined TSC clocksource calibration: 3000.000 MHz
[    1.578121] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2b3e459bf4c, max_idle_ns: 440795289890 ns
[    1.588916] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.588918] rodata_test: all tests were successful
[    1.588923] clocksource: Switched to clocksource tsc
[    1.588925] Run /init as init process
[    1.588926]   with arguments:
[    1.588927]     /init
[    1.588927]     rhgb
[    1.588928]   with environment:
[    1.588928]     HOME=/
[    1.588929]     TERM=linux
[    1.588929]     BOOT_IMAGE=(hd3,gpt2)/vmlinuz-5.19.11-300.fc37.x86_64
[    1.620113] usb 3-2: new full-speed USB device number 3 using xhci_hcd
[    1.624205] usb 1-6: new high-speed USB device number 3 using xhci_hcd
[    1.662910] systemd[1]: systemd 251.4-53.fc37 running in system mode (+PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP -GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
[    1.662913] systemd[1]: Detected architecture x86-64.
[    1.662914] systemd[1]: Running in initial RAM disk.
[    1.662939] systemd[1]: Hostname set to <deangelis.fenrir.org.uk>.
[    1.779387] usb 3-2: New USB device found, idVendor=0d8c, idProduct=0135, bcdDevice= 1.00
[    1.779398] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    1.779404] usb 3-2: Product: Q9-1
[    1.779407] usb 3-2: Manufacturer: CMEDIA
[    1.791643] hid-generic 0003:0D8C:0135.0002: No inputs registered, leaving
[    1.791813] hid-generic 0003:0D8C:0135.0002: hidraw1: USB HID v1.11 Device [CMEDIA Q9-1] on usb-0000:04:00.0-2/input2
[    1.832118] usb 3-1.1: new full-speed USB device number 4 using xhci_hcd
[    1.942152] systemd[1]: bpf-lsm: LSM BPF program attached
[    1.955364] usb 3-1.1: New USB device found, idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
[    1.955366] usb 3-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    1.955367] usb 3-1.1: Product: CP2102 USB to UART Bridge Controller
[    1.955368] usb 3-1.1: Manufacturer: Silicon Labs
[    1.955369] usb 3-1.1: SerialNumber: IC-7300 03004412
[    1.983751] systemd[1]: Queued start job for default target initrd.target.
[    1.984680] systemd[1]: Created slice system-systemd\x2dcryptsetup.slice - Slice /system/systemd-cryptsetup.
[    1.984747] systemd[1]: Started clevis-luks-askpass.path - Forward Password Requests to Clevis Directory Watch.
[    1.984775] systemd[1]: Reached target cryptsetup-pre.target - Local Encrypted Volumes (Pre).
[    1.984795] systemd[1]: Reached target initrd-usr-fs.target - Initrd /usr File System.
[    1.984806] systemd[1]: Reached target local-fs.target - Local File Systems.
[    1.984821] systemd[1]: Reached target slices.target - Slice Units.
[    1.984833] systemd[1]: Reached target swap.target - Swaps.
[    1.984842] systemd[1]: Reached target timers.target - Timer Units.
[    1.984911] systemd[1]: Listening on dbus.socket - D-Bus System Message Bus Socket.
[    1.985014] systemd[1]: Listening on systemd-journald-audit.socket - Journal Audit Socket.
[    1.985089] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[    1.985165] systemd[1]: Listening on systemd-journald.socket - Journal Socket.
[    1.985243] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[    1.985298] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[    1.985309] systemd[1]: Reached target sockets.target - Socket Units.
[    1.985848] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
[    1.985905] systemd[1]: memstrack.service - Memstrack Anylazing Service was skipped because all trigger condition checks failed.
[    1.986410] systemd[1]: Started rngd.service - Hardware RNG Entropy Gatherer Daemon.
[    1.987478] systemd[1]: Starting systemd-journald.service - Journal Service...
[    1.988085] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
[    1.988598] systemd[1]: Starting systemd-sysusers.service - Create System Users...
[    1.989120] systemd[1]: Starting systemd-vconsole-setup.service - Setup Virtual Console...
[    1.992808] i2c_dev: i2c /dev entries driver
[    1.998199] systemd[1]: Finished kmod-static-nodes.service - Create List of Static Device Nodes.
[    1.998269] audit: type=1130 audit(1664140938.405:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=kmod-static-nodes comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.002920] usb 1-6: New USB device found, idVendor=0bda, idProduct=4e22, bcdDevice= 0.01
[    2.002924] usb 1-6: New USB device strings: Mfr=3, Product=1, SerialNumber=0
[    2.002925] usb 1-6: Product: Realtek USB2.0 Audio
[    2.002926] usb 1-6: Manufacturer: Generic
[    2.004676] fuse: init (API version 7.36)
[    2.007221] systemd[1]: Finished systemd-sysusers.service - Create System Users.
[    2.007253] audit: type=1130 audit(1664140938.414:3): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-sysusers comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.007827] systemd[1]: Starting systemd-tmpfiles-setup-dev.service - Create Static Device Nodes in /dev...
[    2.013806] input: Generic Realtek USB2.0 Audio Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-6/1-6:1.2/0003:0BDA:4E22.0003/input/input6
[    2.017091] systemd[1]: Finished systemd-tmpfiles-setup-dev.service - Create Static Device Nodes in /dev.
[    2.017145] audit: type=1130 audit(1664140938.424:4): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-tmpfiles-setup-dev comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.017518] alua: device handler registered
[    2.018745] emc: device handler registered
[    2.020119] rdac: device handler registered
[    2.033128] systemd[1]: Finished systemd-modules-load.service - Load Kernel Modules.
[    2.033176] audit: type=1130 audit(1664140938.440:5): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-modules-load comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.033211] systemd[1]: Started systemd-journald.service - Journal Service.
[    2.033274] audit: type=1130 audit(1664140938.440:6): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.041185] audit: type=1130 audit(1664140938.448:7): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-vconsole-setup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.050153] audit: type=1130 audit(1664140938.457:8): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-tmpfiles-setup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.051015] usb 3-3: new high-speed USB device number 5 using xhci_hcd
[    2.057196] audit: type=1130 audit(1664140938.464:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-cmdline-ask comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.065058] input: Generic Realtek USB2.0 Audio as /devices/pci0000:00/0000:00:14.0/usb1/1-6/1-6:1.2/0003:0BDA:4E22.0003/input/input7
[    2.065576] hid-generic 0003:0BDA:4E22.0003: input,hiddev97,hidraw2: USB HID v1.11 Device [Generic Realtek USB2.0 Audio] on usb-0000:00:14.0-6/input2
[    2.074170] audit: type=1130 audit(1664140938.481:10): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.179052] usb 1-9: new low-speed USB device number 4 using xhci_hcd
[    2.239163] usb 3-3: New USB device found, idVendor=0c45, idProduct=636b, bcdDevice= 1.00
[    2.239166] usb 3-3: New USB device strings: Mfr=2, Product=1, SerialNumber=3
[    2.239168] usb 3-3: Product: USB 2.0 Camera
[    2.239169] usb 3-3: Manufacturer: Sonix Technology Co., Ltd.
[    2.239170] usb 3-3: SerialNumber: SN0001
[    2.250016] usb 3-1.4: new full-speed USB device number 6 using xhci_hcd
[    2.275209] acpi PNP0C14:01: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    2.275266] acpi PNP0C14:02: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    2.275332] acpi PNP0C14:03: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
[    2.311312] usb 1-9: New USB device found, idVendor=046d, idProduct=c077, bcdDevice=72.00
[    2.311315] usb 1-9: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    2.311316] usb 1-9: Product: USB Optical Mouse
[    2.311317] usb 1-9: Manufacturer: Logitech
[    2.313340] input: Logitech USB Optical Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-9/1-9:1.0/0003:046D:C077.0004/input/input8
[    2.313379] hid-generic 0003:046D:C077.0004: input,hidraw3: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-0000:00:14.0-9/input0
[    2.314461] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    2.314493] nvme nvme0: pci function 0000:01:00.0
[    2.314780] e1000e: Intel(R) PRO/1000 Network Driver
[    2.314781] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    2.315043] e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
[    2.328950] nvme nvme0: Shutdown timeout set to 8 seconds
[    2.347761] nvme nvme0: allocated 64 MiB host memory buffer.
[    2.389516] nvme nvme0: 8/0/0 default/read/poll queues
[    2.395522]  nvme0n1: p1 p2 p3
[    2.427015] usb 1-10: new low-speed USB device number 5 using xhci_hcd
[    2.458013] usb 3-4: new high-speed USB device number 7 using xhci_hcd
[    2.521303] usb 3-1.4: New USB device found, idVendor=08bb, idProduct=2901, bcdDevice= 1.00
[    2.521306] usb 3-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    2.521307] usb 3-1.4: Product: USB Audio CODEC 
[    2.521308] usb 3-1.4: Manufacturer: Burr-Brown from TI              
[    2.536389] input: Burr-Brown from TI               USB Audio CODEC  as /devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-1/3-1.4/3-1.4:1.3/0003:08BB:2901.0005/input/input9
[    2.554216] i915 0000:00:02.0: vgaarb: deactivate vga console
[    2.555156] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    2.556168] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)
[    2.559634] usb 1-10: New USB device found, idVendor=045e, idProduct=07f8, bcdDevice= 3.00
[    2.559637] usb 1-10: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    2.559638] usb 1-10: Product: Wired Keyboard 600
[    2.559639] usb 1-10: Manufacturer: Microsoft
[    2.562962] input: Microsoft Wired Keyboard 600 as /devices/pci0000:00/0000:00:14.0/usb1/1-10/1-10:1.0/0003:045E:07F8.0006/input/input10
[    2.587195] usb 3-4: New USB device found, idVendor=0424, idProduct=2514, bcdDevice= b.b3
[    2.587197] usb 3-4: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.588103] hid-generic 0003:08BB:2901.0005: input,hidraw4: USB HID v1.00 Device [Burr-Brown from TI               USB Audio CODEC ] on usb-0000:04:00.0-1.4/input3
[    2.591337] hub 3-4:1.0: USB hub found
[    2.591728] hub 3-4:1.0: 4 ports detected
[    2.592318] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on minor 1
[    2.593737] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    2.593897] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input11
[    2.640128] hid-generic 0003:045E:07F8.0006: input,hidraw5: USB HID v1.11 Keyboard [Microsoft Wired Keyboard 600] on usb-0000:00:14.0-10/input0
[    2.642070] input: Microsoft Wired Keyboard 600 Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-10/1-10:1.1/0003:045E:07F8.0007/input/input12
[    2.676792] fbcon: i915drmfb (fb0) is primary device
[    2.676793] fbcon: Deferring console take-over
[    2.676794] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    2.694067] input: Microsoft Wired Keyboard 600 System Control as /devices/pci0000:00/0000:00:14.0/usb1/1-10/1-10:1.1/0003:045E:07F8.0007/input/input13
[    2.694093] hid-generic 0003:045E:07F8.0007: input,hidraw6: USB HID v1.11 Device [Microsoft Wired Keyboard 600] on usb-0000:00:14.0-10/input1
[    2.702919] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): registered PHC clock
[    2.773252] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1) d4:5d:64:1e:40:1e
[    2.773256] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connection
[    2.773359] e1000e 0000:00:1f.6 eth0: MAC: 13, PHY: 12, PBA No: FFFFFF-0FF
[    2.774043] e1000e 0000:00:1f.6 eno1: renamed from eth0
[    2.808059] usb 1-12: new full-speed USB device number 6 using xhci_hcd
[    2.887054] usb 3-4.1: new full-speed USB device number 8 using xhci_hcd
[    2.935941] usb 1-12: New USB device found, idVendor=1130, idProduct=1620, bcdDevice= 1.87
[    2.935943] usb 1-12: New USB device strings: Mfr=0, Product=2, SerialNumber=0
[    2.935944] usb 1-12: Product: USB  AUDIO  
[    2.937176] input: USB  AUDIO   as /devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.2/0003:1130:1620.0008/input/input14
[    2.987822] usb 3-4.1: New USB device found, idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
[    2.987824] usb 3-4.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    2.987826] usb 3-4.1: Product: CP2102N USB to UART Bridge Controller
[    2.987826] usb 3-4.1: Manufacturer: Silicon Labs
[    2.987827] usb 3-4.1: SerialNumber: 363265f85ee6e811ae7760964b629a73
[    2.989094] hid-generic 0003:1130:1620.0008: input,hidraw7: USB HID v1.10 Device [USB  AUDIO  ] on usb-0000:00:14.0-12/input2
[    3.073062] usb 3-4.2: new full-speed USB device number 9 using xhci_hcd
[    3.173825] usb 3-4.2: New USB device found, idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
[    3.173828] usb 3-4.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    3.173829] usb 3-4.2: Product: CP2102N USB to UART Bridge Controller
[    3.173830] usb 3-4.2: Manufacturer: Silicon Labs
[    3.173831] usb 3-4.2: SerialNumber: 06f9183839e6e8119d205f964b629a73
[    3.257046] usb 3-4.4: new full-speed USB device number 10 using xhci_hcd
[    3.394829] usb 3-4.4: New USB device found, idVendor=08bb, idProduct=29c3, bcdDevice= 1.00
[    3.394831] usb 3-4.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    3.394832] usb 3-4.4: Product: USB AUDIO  CODEC
[    3.394833] usb 3-4.4: Manufacturer: BurrBrown from Texas Instruments
[    3.402022] input: BurrBrown from Texas Instruments USB AUDIO  CODEC as /devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-4/3-4.4/3-4.4:1.3/0003:08BB:29C3.0009/input/input15
[    3.454151] hid-generic 0003:08BB:29C3.0009: input,hidraw8: USB HID v1.00 Device [BurrBrown from Texas Instruments USB AUDIO  CODEC] on usb-0000:04:00.0-4.4/input3
[   13.794271] kauditd_printk_skb: 22 callbacks suppressed
[   13.794273] audit: type=1131 audit(1664140950.201:33): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=clevis-luks-askpass comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   15.690794] audit: type=1338 audit(1664140952.097:34): module=crypt op=ctr ppid=1 pid=562 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="systemd-cryptse" exe="/usr/lib/systemd/systemd-cryptsetup" subj=kernel dev=253:0 error_msg='success' res=1
[   15.690955] audit: type=1300 audit(1664140952.097:34): arch=c000003e syscall=16 success=yes exit=0 a0=4 a1=c138fd09 a2=55c82e08efc0 a3=0 items=6 ppid=1 pid=562 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="systemd-cryptse" exe="/usr/lib/systemd/systemd-cryptsetup" subj=kernel key=(null)
[   15.690957] audit: type=1307 audit(1664140952.097:34): cwd="/"
[   15.690958] audit: type=1302 audit(1664140952.097:34): item=0 name=(null) inode=1025 dev=00:07 mode=040755 ouid=0 ogid=0 rdev=00:00 obj=unlabeled nametype=PARENT cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0 cap_frootid=0
[   15.690960] audit: type=1302 audit(1664140952.097:34): item=1 name=(null) inode=293 dev=00:07 mode=040755 ouid=0 ogid=0 rdev=00:00 obj=unlabeled nametype=CREATE cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0 cap_frootid=0
[   15.690961] audit: type=1302 audit(1664140952.097:34): item=2 name=(null) inode=23 dev=00:07 mode=040755 ouid=0 ogid=0 rdev=00:00 obj=unlabeled nametype=PARENT cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0 cap_frootid=0
[   15.690962] audit: type=1302 audit(1664140952.097:34): item=3 name=(null) inode=294 dev=00:07 mode=040755 ouid=0 ogid=0 rdev=00:00 obj=unlabeled nametype=CREATE cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0 cap_frootid=0
[   15.690963] audit: type=1302 audit(1664140952.097:34): item=4 name=(null) inode=294 dev=00:07 mode=040755 ouid=0 ogid=0 rdev=00:00 obj=unlabeled nametype=PARENT cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0 cap_frootid=0
[   15.690965] audit: type=1302 audit(1664140952.097:34): item=5 name=(null) inode=295 dev=00:07 mode=0100444 ouid=0 ogid=0 rdev=00:00 obj=unlabeled nametype=CREATE cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0 cap_frootid=0
[   15.697400] BTRFS: device label fedora_localhost-live00 devid 1 transid 1951265 /dev/dm-0 scanned by systemd-udevd (1797)
[   15.920137] BTRFS info (device dm-0): disk space caching is enabled
[   15.920148] BTRFS info (device dm-0): has skinny extents
[   15.975166] BTRFS info (device dm-0): enabling ssd optimizations
[   16.508647] systemd-journald[295]: Received SIGTERM from PID 1 (systemd).
[   16.625699] SELinux:  policy capability network_peer_controls=1
[   16.625701] SELinux:  policy capability open_perms=1
[   16.625702] SELinux:  policy capability extended_socket_class=1
[   16.625702] SELinux:  policy capability always_check_network=0
[   16.625703] SELinux:  policy capability cgroup_seclabel=1
[   16.625703] SELinux:  policy capability nnp_nosuid_transition=1
[   16.625704] SELinux:  policy capability genfs_seclabel_symlinks=1
[   16.625704] SELinux:  policy capability ioctl_skip_cloexec=0
[   16.656546] systemd[1]: Successfully loaded SELinux policy in 60.825ms.
[   16.687399] systemd[1]: Relabelled /dev, /dev/shm, /run, /sys/fs/cgroup in 25.950ms.
[   16.690840] systemd[1]: systemd 251.4-53.fc37 running in system mode (+PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP -GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
[   16.690843] systemd[1]: Detected architecture x86-64.
[   17.094154] systemd[1]: bpf-lsm: LSM BPF program attached
[   17.340499] systemd-sysv-generator[1917]: SysV service '/etc/rc.d/init.d/livesys' lacks a native systemd unit file. Automatically generating a unit file for compatibility. Please update package to include a native systemd unit file, in order to make it more safe and robust.
[   17.340532] systemd-sysv-generator[1917]: SysV service '/etc/rc.d/init.d/livesys-late' lacks a native systemd unit file. Automatically generating a unit file for compatibility. Please update package to include a native systemd unit file, in order to make it more safe and robust.
[   17.340645] systemd-gpt-auto-generator[1911]: Failed to dissect: Permission denied
[   17.355539] zram: Added device: zram0
[   17.356033] systemd[1895]: /usr/lib/systemd/system-generators/systemd-gpt-auto-generator failed with exit status 1.
[   17.491561] systemd[1]: initrd-switch-root.service: Deactivated successfully.
[   17.500689] systemd[1]: Stopped initrd-switch-root.service - Switch Root.
[   17.500981] systemd[1]: systemd-journald.service: Scheduled restart job, restart counter is at 1.
[   17.501190] systemd[1]: Created slice machine.slice - Virtual Machine and Container Slice.
[   17.501404] systemd[1]: Created slice system-akmods\x2dkeygen.slice - Slice /system/akmods-keygen.
[   17.501609] systemd[1]: Created slice system-getty.slice - Slice /system/getty.
[   17.501811] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
[   17.502019] systemd[1]: Created slice system-sshd\x2dkeygen.slice - Slice /system/sshd-keygen.
[   17.502232] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
[   17.502439] systemd[1]: Created slice system-systemd\x2dzram\x2dsetup.slice - Slice /system/systemd-zram-setup.
[   17.502600] systemd[1]: Created slice user.slice - User and Session Slice.
[   17.502675] systemd[1]: Started clevis-luks-askpass.path - Forward Password Requests to Clevis Directory Watch.
[   17.502694] systemd[1]: systemd-ask-password-console.path - Dispatch Password Requests to Console Directory Watch was skipped because of a failed condition check (ConditionPathExists=!/run/plymouth/pid).
[   17.502751] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
[   17.502970] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
[   17.503002] systemd[1]: Reached target blockdev@dev-mapper-luks\x2d8f7e929f\x2dc3f1\x2d4a33\x2d8e54\x2ddc87f811fe2a.target - Block Device Preparation for /dev/mapper/luks-8f7e929f-c3f1-4a33-8e54-dc87f811fe2a.
[   17.503020] systemd[1]: Reached target cryptsetup-pre.target - Local Encrypted Volumes (Pre).
[   17.503033] systemd[1]: Reached target cryptsetup.target - Local Encrypted Volumes.
[   17.503047] systemd[1]: Reached target getty.target - Login Prompts.
[   17.503086] systemd[1]: Stopped target initrd-switch-root.target - Switch Root.
[   17.503113] systemd[1]: Stopped target initrd-fs.target - Initrd File Systems.
[   17.503124] systemd[1]: Stopped target initrd-root-fs.target - Initrd Root File System.
[   17.503136] systemd[1]: Reached target integritysetup.target - Local Integrity Protected Volumes.
[   17.503166] systemd[1]: Reached target slices.target - Slice Units.
[   17.503191] systemd[1]: Reached target veritysetup.target - Local Verity Protected Volumes.
[   17.503430] systemd[1]: Listening on dm-event.socket - Device-mapper event daemon FIFOs.
[   17.504299] systemd[1]: Listening on lvm2-lvmpolld.socket - LVM2 poll daemon socket.
[   17.504351] systemd[1]: multipathd.socket - multipathd control socket was skipped because of a failed condition check (ConditionPathExists=/etc/multipath.conf).
[   17.505180] systemd[1]: Listening on systemd-coredump.socket - Process Core Dump Socket.
[   17.505255] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
[   17.505547] systemd[1]: Listening on systemd-oomd.socket - Userspace Out-Of-Memory (OOM) Killer Socket.
[   17.506217] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[   17.506375] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[   17.506633] systemd[1]: Listening on systemd-userdbd.socket - User Database Manager Socket.
[   17.507310] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File System...
[   17.508004] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
[   17.508776] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
[   17.509394] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[   17.509525] systemd[1]: auth-rpcgss-module.service - Kernel Module supporting RPCSEC_GSS was skipped because of a failed condition check (ConditionPathExists=/etc/krb5.keytab).
[   17.510296] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
[   17.510899] systemd[1]: Starting lvm2-monitor.service - Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[   17.511531] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
[   17.512203] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
[   17.512855] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
[   17.512930] systemd[1]: plymouth-switch-root.service: Deactivated successfully.
[   17.522285] systemd[1]: Stopped plymouth-switch-root.service - Plymouth switch root service.
[   17.522468] systemd[1]: Stopped systemd-journald.service - Journal Service.
[   17.523763] systemd[1]: Starting systemd-journald.service - Journal Service...
[   17.524681] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
[   17.525407] systemd[1]: Starting systemd-remount-fs.service - Remount Root and Kernel File Systems...
[   17.525472] systemd[1]: systemd-repart.service - Repartition Root Disk was skipped because all trigger condition checks failed.
[   17.526149] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[   17.527265] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File System.
[   17.527407] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue File System.
[   17.527528] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug File System.
[   17.527646] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace File System.
[   17.529145] BTRFS info (device dm-0: state M): use zstd compression, level 1
[   17.529148] BTRFS info (device dm-0: state M): disk space caching is enabled
[   17.532271] mc: Linux media interface: v0.10
[   17.539170] systemd[1]: Finished kmod-static-nodes.service - Create List of Static Device Nodes.
[   17.539821] systemd[1]: Started systemd-journald.service - Journal Service.
[   17.545262] videodev: Linux video capture interface: v2.00
[   17.547619] v4l2loopback: loading out-of-tree module taints kernel.
[   17.547634] v4l2loopback: module verification failed: signature and/or required key missing - tainting kernel
[   17.547980] v4l2loopback driver version 0.12.7 loaded
[   17.589974] systemd-journald[1937]: Received client request to flush runtime journal.
[   17.771344] BTRFS info: devid 1 device path /dev/mapper/luks-8f7e929f-c3f1-4a33-8e54-dc87f811fe2a changed to /dev/dm-0 scanned by systemd-udevd (1961)
[   17.772068] BTRFS info: devid 1 device path /dev/dm-0 changed to /dev/mapper/luks-8f7e929f-c3f1-4a33-8e54-dc87f811fe2a scanned by systemd-udevd (1961)
[   17.800716] zram0: detected capacity change from 0 to 16777216
[   17.865414] Adding 8388604k swap on /dev/zram0.  Priority:100 extents:1 across:8388604k SSDscFS
[   17.897919] EDAC ie31200: No ECC support
[   17.897938] EDAC ie31200: No ECC support
[   17.940339] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[   18.032466] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[   18.032529] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[   18.033479] i2c i2c-5: 4/4 memory slots populated (from DMI)
[   18.036109] i2c i2c-5: Successfully instantiated SPD at 0x50
[   18.036521] i2c i2c-5: Successfully instantiated SPD at 0x51
[   18.036928] i2c i2c-5: Successfully instantiated SPD at 0x52
[   18.037345] i2c i2c-5: Successfully instantiated SPD at 0x53
[   18.063181] usbcore: registered new interface driver cp210x
[   18.063187] usbserial: USB Serial support registered for cp210x
[   18.063201] cp210x 3-1.1:1.0: cp210x converter detected
[   18.070738] usb 3-1.1: cp210x converter now attached to ttyUSB0
[   18.070766] cp210x 3-4.1:1.0: cp210x converter detected
[   18.075657] usb 3-4.1: cp210x converter now attached to ttyUSB1
[   18.075673] cp210x 3-4.2:1.0: cp210x converter detected
[   18.080709] usb 3-4.2: cp210x converter now attached to ttyUSB2
[   18.096330] input: PC Speaker as /devices/platform/pcspkr/input/input16
[   18.099892] usb 3-3: Found UVC 1.00 device USB 2.0 Camera (0c45:636b)
[   18.117404] RAPL PMU: API unit is 2^-32 Joules, 4 fixed counters, 655360 ms ovfl timer
[   18.117406] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[   18.117407] RAPL PMU: hw unit of domain package 2^-14 Joules
[   18.117407] RAPL PMU: hw unit of domain dram 2^-14 Joules
[   18.117408] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[   18.127583] usb 1-5: 2:1: cannot set freq 48000 to ep 0x3
[   18.128824] input: USB 2.0 Camera: USB Camera as /devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/3-3:1.0/input/input17
[   18.128863] usbcore: registered new interface driver uvcvideo
[   18.132516] asus_wmi: ASUS WMI generic driver loaded
[   18.134376] asus_wmi: Initialization: 0x0
[   18.134390] asus_wmi: BIOS WMI version: 0.9
[   18.134442] asus_wmi: SFUN value: 0x0
[   18.134443] eeepc-wmi eeepc-wmi: Detected ASUSWMI, use DCTS
[   18.134678] input: Eee PC WMI hotkeys as /devices/platform/eeepc-wmi/input/input18
[   18.136180] intel_tcc_cooling: Programmable TCC Offset detected
[   18.136983] asus_wmi: fan_curve_get_factory_default (0x00110024) failed: -61
[   18.137007] asus_wmi: fan_curve_get_factory_default (0x00110025) failed: -61
[   18.145779] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[   18.145896] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[   18.168111] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[   18.169949] iTCO_vendor_support: vendor-support=0
[   18.171716] ee1004 5-0050: 512 byte EE1004-compliant SPD EEPROM, read-only
[   18.171729] ee1004 5-0051: 512 byte EE1004-compliant SPD EEPROM, read-only
[   18.171735] ee1004 5-0052: 512 byte EE1004-compliant SPD EEPROM, read-only
[   18.171741] ee1004 5-0053: 512 byte EE1004-compliant SPD EEPROM, read-only
[   18.172766] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=6, TCOBASE=0x0400)
[   18.172853] iTCO_wdt iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[   18.197305] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC887-VD: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:line
[   18.197308] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=1 (0x1a/0x0/0x0/0x0/0x0)
[   18.197310] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
[   18.197311] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
[   18.197311] snd_hda_codec_realtek hdaudioC1D0:    dig-out=0x11/0x0
[   18.197312] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[   18.197313] snd_hda_codec_realtek hdaudioC1D0:      Rear Mic=0x18
[   18.197314] snd_hda_codec_realtek hdaudioC1D0:      Front Mic=0x19
[   18.197314] snd_hda_codec_realtek hdaudioC1D0:      Line=0x15
[   18.238323] input: HDA Intel PCH Rear Mic as /devices/pci0000:00/0000:00:1f.3/sound/card1/input19
[   18.238353] input: HDA Intel PCH Front Mic as /devices/pci0000:00/0000:00:1f.3/sound/card1/input20
[   18.238382] input: HDA Intel PCH Line as /devices/pci0000:00/0000:00:1f.3/sound/card1/input21
[   18.238413] input: HDA Intel PCH Line Out as /devices/pci0000:00/0000:00:1f.3/sound/card1/input22
[   18.238440] input: HDA Intel PCH Front Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card1/input23
[   18.238464] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card1/input24
[   18.238484] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card1/input25
[   18.238511] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card1/input26
[   18.238567] intel_rapl_common: Found RAPL domain package
[   18.238569] intel_rapl_common: Found RAPL domain core
[   18.238570] intel_rapl_common: Found RAPL domain uncore
[   18.238570] intel_rapl_common: Found RAPL domain dram
[   18.279456] loop: module loaded
[   18.279960] loop0: detected capacity change from 0 to 8
[   18.280303] loop1: detected capacity change from 0 to 337424
[   18.280370] loop2: detected capacity change from 0 to 198224
[   18.282690] loop4: detected capacity change from 0 to 113696
[   18.282880] loop5: detected capacity change from 0 to 133552
[   18.285170] loop3: detected capacity change from 0 to 91496
[   18.285545] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[   18.545685] EXT4-fs (nvme0n1p2): mounted filesystem with ordered data mode. Quota mode: none.
[   18.836372] kauditd_printk_skb: 143 callbacks suppressed
[   18.836373] audit: type=1130 audit(1664140955.243:173): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-tmpfiles-setup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   18.838970] audit: type=1334 audit(1664140955.245:174): prog-id=69 op=LOAD
[   18.838999] audit: type=1334 audit(1664140955.245:175): prog-id=70 op=LOAD
[   18.839083] audit: type=1334 audit(1664140955.246:176): prog-id=71 op=LOAD
[   18.840043] audit: type=1334 audit(1664140955.246:177): prog-id=72 op=LOAD
[   18.849677] audit: type=1305 audit(1664140955.256:178): op=set audit_enabled=1 old=1 auid=4294967295 ses=4294967295 subj=system_u:system_r:auditd_t:s0 res=1
[   18.849680] audit: type=1300 audit(1664140955.256:178): arch=c000003e syscall=44 success=yes exit=60 a0=3 a1=7ffdefbaa100 a2=3c a3=0 items=0 ppid=2571 pid=2577 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="auditd" exe="/usr/sbin/auditd" subj=system_u:system_r:auditd_t:s0 key=(null)
[   18.849681] audit: type=1327 audit(1664140955.256:178): proctitle="/sbin/auditd"
[   18.882312] RPC: Registered named UNIX socket transport module.
[   18.882313] RPC: Registered udp transport module.
[   18.882314] RPC: Registered tcp transport module.
[   18.882314] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   19.291171] NET: Registered PF_QIPCRTR protocol family
[   19.848416] ahci 0000:00:17.0: port does not support device sleep
[   20.938156] usb 3-3: 3:1: cannot get freq at ep 0x84
[   21.346632] usbcore: registered new interface driver snd-usb-audio
[   22.475803] e1000e 0000:00:1f.6 eno1: NIC Link is Up 1000 Mbps Full Duplex, Flow Control: Rx/Tx
[   22.475854] IPv6: ADDRCONF(NETDEV_CHANGE): eno1: link becomes ready
[   22.676728] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
[   24.088598] ahci 0000:00:17.0: port does not support device sleep
[   24.230783] rfkill: input handler disabled
[   34.672446] rfkill: input handler enabled
[   35.981586] rfkill: input handler disabled
[   65.081940] process 'root/usr/bin/jt9' started with executable stack
[ 3847.092723] snd_hda_codec_hdmi hdaudioC1D2: HDMI: pin NID 0x7 not registered
[ 5147.654716] snd_hda_codec_hdmi hdaudioC1D2: HDMI: pin NID 0x7 not registered

--MP_/H+2j5/PCAoAGHH0VE8fQxEM
Content-Type: text/x-log
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=lsusb.log


Bus 003 Device 005: ID 0c45:636b Microdia USB 2.0 Camera
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x0c45 Microdia
  idProduct          0x636b 
  bcdDevice            1.00
  iManufacturer           2 Sonix Technology Co., Ltd.
  iProduct                1 USB 2.0 Camera
  iSerial                 3 SN0001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x06a7
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               5 USB Camera
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              5 USB Camera
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x004f
        dwClockFrequency       15.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0 
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 3
        guidExtensionCode         {28f03370-6311-4a2e-ba2c-6890eb334016}
        bNumControls           24
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            3
        bmControls( 0)       0x9f
        bmControls( 1)       0x00
        bmControls( 2)       0x07
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0 
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x0000000e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier          0
        bControlSize            2
        bmControls     0x0000177f
          Brightness
          Contrast
          Hue
          Saturation
          Sharpness
          Gamma
          White Balance Temperature
          Backlight Compensation
          Gain
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0 
        bmVideoStandards     0x00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               6
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      VideoStreaming Interface Descriptor:
        bLength                            15
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         2
        wTotalLength                   0x0547
        bEndpointAddress                 0x81  EP 1 IN
        bmInfo                              0
        bTerminalLink                       4
        bStillCaptureMethod                 2
        bTriggerSupport                     1
        bTriggerUsage                       1
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        1
        bNumFrameDescriptors               14
        bFlags                              0
          Fixed-size samples: No
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 1 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                995328000
        dwMaxVideoFrameBufferSize     4147789
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                 98304000
        dwMaxBitRate                589824000
        dwMaxVideoFrameBufferSize     2458189
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                442368000
        dwMaxVideoFrameBufferSize     1843789
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                 47185920
        dwMaxBitRate                283115520
        dwMaxVideoFrameBufferSize     1180237
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                 41472000
        dwMaxBitRate                248832000
        dwMaxVideoFrameBufferSize     1037389
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 32563200
        dwMaxBitRate                195379200
        dwMaxVideoFrameBufferSize      814669
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 38400000
        dwMaxBitRate                230400000
        dwMaxVideoFrameBufferSize      960589
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614989
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      461389
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                  8110080
        dwMaxBitRate                 48660480
        dwMaxVideoFrameBufferSize      203341
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                  6144000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      154189
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            176
        wHeight                           144
        dwMinBitRate                  2027520
        dwMaxBitRate                 12165120
        dwMaxVideoFrameBufferSize       51277
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        13
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            160
        wHeight                           120
        dwMinBitRate                  1536000
        dwMaxBitRate                  9216000
        dwMaxVideoFrameBufferSize       38989
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        14
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                995328000
        dwMaxVideoFrameBufferSize     4147789
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
        bEndpointAddress                 0x00  EP 0 OUT
        bNumImageSizePatterns               7
        wWidth( 0)                       1920
        wHeight( 0)                      1080
        wWidth( 1)                       1280
        wHeight( 1)                       720
        wWidth( 2)                        800
        wHeight( 2)                       600
        wWidth( 3)                        640
        wHeight( 3)                       480
        wWidth( 4)                        640
        wHeight( 4)                       360
        wWidth( 5)                        320
        wHeight( 5)                       240
        wWidth( 6)                        320
        wHeight( 6)                       180
        bNumCompressionPatterns             0
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        2
        bNumFrameDescriptors               14
        guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                165888000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                 98304000
        dwMaxBitRate                 98304000
        dwMaxVideoFrameBufferSize     2457600
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                147456000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           1000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                 94371840
        dwMaxBitRate                 94371840
        dwMaxVideoFrameBufferSize     1179648
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           1000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                 82944000
        dwMaxBitRate                 82944000
        dwMaxVideoFrameBufferSize     1036800
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           1000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 65126400
        dwMaxBitRate                 65126400
        dwMaxVideoFrameBufferSize      814080
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           1000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 76800000
        dwMaxBitRate                 76800000
        dwMaxVideoFrameBufferSize      960000
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           1000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                  8110080
        dwMaxBitRate                 48660480
        dwMaxVideoFrameBufferSize      202752
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                  6144000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            176
        wHeight                           144
        dwMinBitRate                  2027520
        dwMaxBitRate                 12165120
        dwMaxVideoFrameBufferSize       50688
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        13
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            160
        wHeight                           120
        dwMinBitRate                  1536000
        dwMaxBitRate                  9216000
        dwMaxVideoFrameBufferSize       38400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        14
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                165888000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            18
        bDescriptorType                    36
        bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
        bEndpointAddress                 0x00  EP 0 OUT
        bNumImageSizePatterns               3
        wWidth( 0)                       1920
        wHeight( 0)                      1080
        wWidth( 1)                       1280
        wHeight( 1)                       720
        wWidth( 2)                        640
        wHeight( 2)                       480
        bNumCompressionPatterns             0
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0080  1x 128 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0100  1x 256 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0320  1x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0b20  2x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1320  3x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       6
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1400  3x 1024 bytes
        bInterval               1
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       0 
      bFunctionProtocol       0 
      iFunction               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0 
      iInterface              0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x002b
        bInCollection           1
        baInterfaceNr(0)        3
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0000
        iChannelNames           0 
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 2
        bSourceID               1
        bControlSize            2
        bmaControls(0)     0x0001
          Mute Control
        bmaControls(1)     0x0002
          Volume Control
        bmaControls(2)     0x0002
          Volume Control
        iFeature                0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               2
        iTerminal               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            7 Discrete
        tSamFreq[ 0]         8000
        tSamFreq[ 1]        11025
        tSamFreq[ 2]        16000
        tSamFreq[ 3]        22050
        tSamFreq[ 4]        24000
        tSamFreq[ 5]        44100
        tSamFreq[ 6]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0002
  (Bus Powered)
  Remote Wakeup Enabled

--MP_/H+2j5/PCAoAGHH0VE8fQxEM--
