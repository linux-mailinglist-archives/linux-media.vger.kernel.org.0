Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21ECD44700
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 18:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729976AbfFMQ4W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 12:56:22 -0400
Received: from jp.dhs.org ([62.251.46.73]:43070 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729974AbfFMBpf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 21:45:35 -0400
Received: from localhost ([127.0.0.1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hbEo1-00049y-UI; Thu, 13 Jun 2019 03:45:33 +0200
Subject: Re: [PATCH] dvb_usb_dvbsky: Mygica T230C2 add support for T230C hw
 version 2
To:     Antti Palosaari <crope@iki.fi>,
        Frantisek Rysanek <Frantisek.Rysanek@post.cz>,
        linux-media@vger.kernel.org
References: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
 <8982b6eb-c9b1-2f41-ed80-c435b999333c@iki.fi>
 <5D015B88.14600.5E1D99A@Frantisek.Rysanek.post.cz>
 <38d8a697-3e3d-68e5-f3c6-e82588515f8b@iki.fi>
 <d60a351b-9bed-fbf7-b164-70337ec73a66@jpvw.nl>
 <38250cff-c758-cac8-64bf-dce679e7c826@jpvw.nl>
 <ca1eada3-82bd-f03a-9441-4e494899ec04@iki.fi>
From:   JP <jp@jpvw.nl>
Message-ID: <ea0569b4-1925-405d-5836-2bab162b2cf1@jpvw.nl>
Date:   Thu, 13 Jun 2019 03:45:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ca1eada3-82bd-f03a-9441-4e494899ec04@iki.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/13/19 3:23 AM, Antti Palosaari wrote:
> On 6/13/19 4:15 AM, JP wrote:
>>>> And according to old usb sniffs from pctv 292e [Si2168B] default 
>>>> manual ts clock is set to 7.2MHz, which means 57.6Mbit/s datarate, 
>>>> it should be quite optimal for DVB-T2 max. In theory it could be a 
>>>> little higher only when 10MHz channel bandwidth and most less error 
>>>> correction FEC in use. And currently driver is using some config 
>>>> that uses dynamic ts clock which clocks only when there is data to 
>>>> feed. For some reason, usb-ts-bridge does not understand that and 
>>>> manual configuration is needed (ts valid or ts-sync connection?). 
>>>> If possible use 7.2MHz, if not: set to 10MHz.
>>>>
>>> That's perfectly alright with me. I'm now testing that 7.2Mhz value. 
>>> Hold on.
>> The driver crashes with the 7.2Mhz value! That was totally not what I 
>> ever expected.
>> Recompiled the whole kernel: crashes again. Then tried on debian 
>> kernel 4.19: same thing.
>> Food for thought?
>
> It should sure never crash the kernel. Changing a ts bitrate no, no, 
> no, you trapped a hidden bug. Found where it is :]
>
You mean an eastern egg? :-) The receiver did not do anything so I 
plugged in the other onbe, a T230. That did not work either so I checked 
dmesg. It never crashed before, only does that when you unpluf the 
reveiver when it's live. This is the dmesg:

[   50.344868] usb 1-1.4: new high-speed USB device number 6 using ehci-pci
[   50.454022] usb 1-1.4: New USB device found, idVendor=0572, 
idProduct=c68a, bcdDevice= 8.00
[   50.454028] usb 1-1.4: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[   50.454030] usb 1-1.4: Product: EyeTV Stick
[   50.454033] usb 1-1.4: Manufacturer: Geniatech
[   50.454035] usb 1-1.4: SerialNumber: 161206
[   50.684044] usb 1-1.4: dvb_usb_v2: found a 'MyGica Mini DVB-T2 USB 
Stick T230C2' in warm state
[   50.684112] usb 1-1.4: dvb_usb_v2: will pass the complete MPEG2 
transport stream to the software demuxer
[   50.684123] dvbdev: DVB: registering new adapter (MyGica Mini DVB-T2 
USB Stick T230C2)
[   50.696300] i2c i2c-9: Added multiplexed i2c bus 10
[   50.696304] si2168 9-0064: Silicon Labs Si2168-D60 successfully 
identified
[   50.696305] si2168 9-0064: firmware version: D 6.0.1
[   50.702845] media: Linux media interface: v0.10
[   50.706831] si2157 10-0060: Silicon Labs Si2141 successfully attached
[   50.706853] usb 1-1.4: DVB: registering adapter 0 frontend 0 (Silicon 
Labs Si2168)...
[   50.735813] Registered IR keymap rc-total-media-in-hand-02
[   50.735874] rc rc0: MyGica Mini DVB-T2 USB Stick T230C2 as 
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.4/rc/rc0
[   50.735927] input: MyGica Mini DVB-T2 USB Stick T230C2 as 
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.4/rc/rc0/input17
[   50.736035] rc rc0: lirc_dev: driver dvb_usb_dvbsky registered at 
minor = 0, scancode receiver, no transmitter
[   50.736040] usb 1-1.4: dvb_usb_v2: schedule remote query interval to 
300 msecs
[   50.736044] usb 1-1.4: dvb_usb_v2: 'MyGica Mini DVB-T2 USB Stick 
T230C2' successfully initialized and connected
[   50.736085] usbcore: registered new interface driver dvb_usb_dvbsky
[   56.814537] si2168 9-0064: firmware: direct-loading firmware 
dvb-demod-si2168-d60-01.fw
[   56.814571] si2168 9-0064: downloading firmware from file 
'dvb-demod-si2168-d60-01.fw'
[   58.055976] si2168 9-0064: firmware version: D 6.0.13
[   58.076459] si2157 10-0060: found a 'Silicon Labs Si2141-A10'
[   58.077184] si2157 10-0060: firmware: direct-loading firmware 
dvb-tuner-si2141-a10-01.fw
[   58.077190] si2157 10-0060: downloading firmware from file 
'dvb-tuner-si2141-a10-01.fw'
[   58.717062] si2157 10-0060: firmware version: 1.1.11
[   87.099502] usb 1-1.4: USB disconnect, device number 6
[   87.152325] dvb_usb_v2: 'MyGica Mini DVB-T2 USB Stick T230C2:1-1.4' 
successfully deinitialized and disconnected
[  111.898328] usb 1-1.4: new high-speed USB device number 7 using ehci-pci
[  112.006849] usb 1-1.4: config 1 interface 0 altsetting 0 bulk 
endpoint 0x86 has invalid maxpacket 188
[  112.007909] usb 1-1.4: language id specifier not provided by device, 
defaulting to English
[  112.010160] usb 1-1.4: New USB device found, idVendor=0572, 
idProduct=c688, bcdDevice= 8.00
[  112.010166] usb 1-1.4: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[  112.032174] dvb-usb: found a 'Mygica T230 DVB-T/T2/C' in warm state.
[  112.274391] dvb-usb: will pass the complete MPEG2 transport stream to 
the software demuxer.
[  112.274588] dvbdev: DVB: registering new adapter (Mygica T230 DVB-T/T2/C)
[  112.284279] i2c i2c-9: Added multiplexed i2c bus 10
[  112.284287] si2168 9-0064: Silicon Labs Si2168-B40 successfully 
identified
[  112.284292] si2168 9-0064: firmware version: B 4.0.2
[  112.288819] si2157 10-0060: Silicon Labs Si2147/2148/2157/2158 
successfully attached
[  112.288867] usb 1-1.4: DVB: registering adapter 0 frontend 0 (Silicon 
Labs Si2168)...
[  112.288891] sysfs: cannot create duplicate filename 
'/class/dvb/dvb0.frontend0'
[  112.288897] CPU: 1 PID: 1545 Comm: systemd-udevd Not tainted 4.19.37 #1
[  112.288901] Hardware name: MSI MS-7733/B75IA-E33 (MS-7733), BIOS 
V17.6 10/30/2013
[  112.288904] Call Trace:
[  112.288919]  dump_stack+0x5c/0x80
[  112.288926]  sysfs_warn_dup.cold.4+0x17/0x2a
[  112.288932]  sysfs_do_create_link_sd.isra.2+0xa1/0xb0
[  112.288938]  device_add+0x296/0x690
[  112.288943]  device_create_groups_vargs+0xd1/0xf0
[  112.288951]  device_create+0x49/0x60
[  112.288958]  ? kmem_cache_alloc_trace+0x155/0x1d0
[  112.288972]  dvb_register_device+0x229/0x2c0 [dvb_core]
[  112.288985]  dvb_register_frontend+0x17b/0x210 [dvb_core]
[  112.288994]  ? dvb_usb_start_feed+0x10/0x10 [dvb_usb]
[  112.289000]  ? dvb_usb_fe_sleep+0x50/0x50 [dvb_usb]
[  112.289006]  dvb_usb_adapter_frontend_init+0xa5/0x120 [dvb_usb]
[  112.289014]  dvb_usb_device_init.cold.7+0x4c8/0x52b [dvb_usb]
[  112.289024]  cxusb_probe+0x1ed/0x200 [dvb_usb_cxusb]
[  112.289047]  usb_probe_interface+0xe4/0x2f0 [usbcore]
[  112.289054]  really_probe+0x235/0x3a0
[  112.289060]  driver_probe_device+0xb3/0xf0
[  112.289065]  __driver_attach+0xdd/0x110
[  112.289070]  ? driver_probe_device+0xf0/0xf0
[  112.289075]  bus_for_each_dev+0x77/0xc0
[  112.289080]  ? klist_add_tail+0x3b/0x70
[  112.289085]  bus_add_driver+0x152/0x230
[  112.289091]  driver_register+0x6b/0xb0
[  112.289109]  usb_register_driver+0x7a/0x130 [usbcore]
[  112.289115]  ? 0xffffffffc0d5d000
[  112.289122]  do_one_initcall+0x46/0x1c3
[  112.289127]  ? free_unref_page_commit+0x91/0x100
[  112.289132]  ? _cond_resched+0x15/0x30
[  112.289137]  ? kmem_cache_alloc_trace+0x155/0x1d0
[  112.289144]  do_init_module+0x5a/0x210
[  112.289150]  load_module+0x211b/0x2390
[  112.289159]  ? __do_sys_finit_module+0xad/0x110
[  112.289163]  __do_sys_finit_module+0xad/0x110
[  112.289171]  do_syscall_64+0x53/0x110
[  112.289178]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  112.289183] RIP: 0033:0x7f63cb867f59
[  112.289188] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01 48
[  112.289192] RSP: 002b:00007fff2d68dbb8 EFLAGS: 00000246 ORIG_RAX: 
0000000000000139
[  112.289198] RAX: ffffffffffffffda RBX: 000055d88500f880 RCX: 
00007f63cb867f59
[  112.289201] RDX: 0000000000000000 RSI: 00007f63cb76ccad RDI: 
0000000000000010
[  112.289205] RBP: 00007f63cb76ccad R08: 0000000000000000 R09: 
0000000000000000
[  112.289208] R10: 0000000000000010 R11: 0000000000000246 R12: 
0000000000000000
[  112.289211] R13: 000055d885047a80 R14: 0000000000020000 R15: 
000055d88500f880
[  112.289246] dvbdev: dvb_register_device: failed to create device 
dvb0.frontend0 (-17)
[  112.318307] Registered IR keymap rc-d680-dmb
[  112.318369] rc rc0: Mygica T230 DVB-T/T2/C as 
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.4/rc/rc0
[  112.318448] input: Mygica T230 DVB-T/T2/C as 
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.4/rc/rc0/input18
[  112.318725] rc rc0: lirc_dev: driver dvb_usb_cxusb registered at 
minor = 0, scancode receiver, no transmitter
[  112.318730] dvb-usb: schedule remote query interval to 100 msecs.
[  112.318791] dvb-usb: Mygica T230 DVB-T/T2/C successfully initialized 
and connected.
[  112.318852] usbcore: registered new interface driver dvb_usb_cxusb
[  117.788649] general protection fault: 0000 [#1] SMP PTI
[  117.788657] CPU: 2 PID: 1586 Comm: kdvb-ad-0-fe-0 Not tainted 4.19.37 #1
[  117.788659] Hardware name: MSI MS-7733/B75IA-E33 (MS-7733), BIOS 
V17.6 10/30/2013
[  117.788679] RIP: 0010:dvb_usbv2_device_power_ctrl+0x2a/0xc0 [dvb_usb_v2]
[  117.788683] Code: 66 66 66 66 90 8b 47 60 85 f6 74 6b 83 c0 01 89 47 
60 83 f8 01 77 68 55 89 f5 53 48 89 fb 48 83 ec 08 66 66 66 66 90 48 8b 
03 <48> 8b 80 b8 00 00 00 48 85 c0 74 0e 89 ee 48 89 df e8 f0 f5 4d c7
[  117.788686] RSP: 0018:ffffbec8c1d5be48 EFLAGS: 00010296
[  117.788691] RAX: 9863dd3bfc5d93f6 RBX: ffff968f8e2bc000 RCX: 
0000000000000000
[  117.788694] RDX: ffff968f8e2bc498 RSI: 0000000000000001 RDI: 
ffff968f8e2bc000
[  117.788696] RBP: 0000000000000001 R08: 0000000000000000 R09: 
0000000000000000
[  117.788699] R10: 0000000000000000 R11: ffff968f96520c28 R12: 
ffff968f953d5828
[  117.788702] R13: ffff968f8e2bc000 R14: ffff968f953d5828 R15: 
ffff968f94371db8
[  117.788706] FS:  0000000000000000(0000) GS:ffff968f96500000(0000) 
knlGS:0000000000000000
[  117.788709] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  117.788711] CR2: 00007ffa8c010578 CR3: 0000000157a0a001 CR4: 
00000000000606e0
[  117.788714] Call Trace:
[  117.788727]  ? __switch_to_asm+0x34/0x70
[  117.788734]  dvb_usb_fe_init+0x68/0x150 [dvb_usb_v2]
[  117.788745]  dvb_frontend_init+0x22/0xb0 [dvb_core]
[  117.788755]  dvb_frontend_thread+0x7c/0x6b0 [dvb_core]
[  117.788763]  ? dvb_frontend_swzigzag+0x390/0x390 [dvb_core]
[  117.788769]  kthread+0x112/0x130
[  117.788774]  ? kthread_bind+0x30/0x30
[  117.788778]  ret_from_fork+0x35/0x40
[  117.788783] Modules linked in: rc_d680_dmb dvb_usb_cxusb dib0070 
dvb_usb rc_total_media_in_hand_02 si2157 media si2168 dvb_usb_dvbsky 
dvb_usb_v2 m88ds3103 i2c_mux dvb_core rc_core rpcsec_gss_krb5 
auth_rpcgss nfsv4 dns_resolver nfs uinput lockd grace fscache 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
cpufreq_powersave cpufreq_userspace cpufreq_conservative joydev 
intel_rapl x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel 
hid_generic i915 kvm usbhid irqbypass hid crct10dif_pclmul crc32_pclmul 
mei_wdt drm_kms_helper drm ghash_clmulni_intel intel_cstate i2c_algo_bit 
ax88179_178a snd_hda_intel intel_uncore snd_hda_codec usbnet 
intel_rapl_perf mii snd_hda_core pcspkr snd_hwdep snd_pcm iTCO_wdt 
mei_me iTCO_vendor_support mei snd_timer snd soundcore evdev pcc_cpufreq 
sunrpc ip_tables
[  117.788852]  x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic 
fscrypto ecb crypto_simd cryptd glue_helper aes_x86_64 ahci libahci 
libata nvme scsi_mod xhci_pci nvme_core xhci_hcd crc32c_intel ehci_pci 
i2c_i801 ehci_hcd lpc_ich usbcore r8169 realtek libphy usb_common wmi 
fan thermal video button
[  117.788881] ---[ end trace 9b8aaeb232cb57d4 ]---
[  117.788887] RIP: 0010:dvb_usbv2_device_power_ctrl+0x2a/0xc0 [dvb_usb_v2]
[  117.788890] Code: 66 66 66 66 90 8b 47 60 85 f6 74 6b 83 c0 01 89 47 
60 83 f8 01 77 68 55 89 f5 53 48 89 fb 48 83 ec 08 66 66 66 66 90 48 8b 
03 <48> 8b 80 b8 00 00 00 48 85 c0 74 0e 89 ee 48 89 df e8 f0 f5 4d c7
[  117.788892] RSP: 0018:ffffbec8c1d5be48 EFLAGS: 00010296
[  117.788895] RAX: 9863dd3bfc5d93f6 RBX: ffff968f8e2bc000 RCX: 
0000000000000000
[  117.788897] RDX: ffff968f8e2bc498 RSI: 0000000000000001 RDI: 
ffff968f8e2bc000
[  117.788899] RBP: 0000000000000001 R08: 0000000000000000 R09: 
0000000000000000
[  117.788901] R10: 0000000000000000 R11: ffff968f96520c28 R12: 
ffff968f953d5828
[  117.788903] R13: ffff968f8e2bc000 R14: ffff968f953d5828 R15: 
ffff968f94371db8
[  117.788905] FS:  0000000000000000(0000) GS:ffff968f96500000(0000) 
knlGS:0000000000000000
[  117.788908] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  117.788910] CR2: 00007ffa8c010578 CR3: 0000000157a0a001 CR4: 
00000000000606e0
[  199.911431] dvb-usb: bulk message failed: -71 (1/0)

> regards
> Antti
>

