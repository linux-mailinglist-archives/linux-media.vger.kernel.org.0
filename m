Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9624BBAE5A
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 09:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390679AbfIWHRe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 03:17:34 -0400
Received: from mail3.siteparc.fr ([158.255.101.105]:54966 "EHLO
        mail3.siteparc.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729404AbfIWHRe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 03:17:34 -0400
Received: from [192.168.144.238] (83-144-78-62.static.chello.pl [83.144.78.62]) by mail3.siteparc.fr with SMTP
        (version=Tls12
        cipher=Aes256 bits=256);
   Mon, 23 Sep 2019 09:17:21 +0200
Subject: Re: [Bug report] CX2388x based card - adapter0 lacking when resuming
 from S3 - "i2c i/o error" from kernel
From:   Frederic Dumas <f.dumas@ellis.siteparc.fr>
To:     LMML <linux-media@vger.kernel.org>
References: <4cf86b49-1398-79e7-0edb-7e27cab3df94@ellis.siteparc.fr>
Message-ID: <5c4b5a16-045b-228b-7d91-ad3511d9ad76@ellis.siteparc.fr>
Date:   Mon, 23 Sep 2019 09:17:22 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4cf86b49-1398-79e7-0edb-7e27cab3df94@ellis.siteparc.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Exim-Id: 5c4b5a16-045b-228b-7d91-ad3511d9ad76
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hello,

In August, my bug report about the Hauppauge WinTV-HVR-4000 card went 
unnoticed.

I have since gathered additional observations from tests that can 
perhaps tell us more about the issue.

After having booted the HTPC (Linux Mint + TVheadend + Kodi), it is 
enough to unload the cx88_dvb module

# modprobe -r cx88_dvb

then to load it back

# modprobe cx88_dvb

to fix the problem.

I mean, the /dev/dvb/adapter0/ will now survive all the next 
suspend-to-RAM -> resume cycles.


Next problem comes with TVheadend, which won't be able to open the (now 
resilient) ~/adpater0/frontend0 tuner, after a resume from 
suspend-to-RAM. Each time I resume the HTPC, TVheadend sees the adapter 
as "busy".

It is enough to restart TVheadend to fix the problem.

# systemctl restart tvheadend

Now TVheadend can access to the tuner... until the next suspend-to-RAM.


The additional trouble with TVHeadend is likely not an issue to be 
addressed on the Linux Media mailing list. I quoted it to give the 
context, nothing more.


I hope that the additional test and partial workaround that I found, may 
help to get the bug investigated and fixed by someone here.


As I wrote in August, I am willing to provide additional information 
that may help (for instance, debug level logs). Please ask for it.


Thank you.

Frédéric.

--
Frederic Dumas
f.dumas@ellis.siteparc.fr




Le 25/08/2019 à 11:12, Frederic Dumas a écrit :
> 
> Hello,
> 
> Here is a report for a trouble observed with the Hauppauge 
> WinTV-HVR-4000 cards. The trouble has been reproduced identically with 
> two different HVR-4000 cards, slotted one by one in the same host.
> 
> I failed to find a similar trouble reported earlier in LMML archives.
> 
> 
> 1. What happens:
> 
> After having booted the HTPC (configuration detailed at the end), there 
> is no problem to tune in DVB-S/S2 TV channels. /dev/dvb/adapter0/ is 
> created.
> 
> After putting the host in suspend to ram state, then resuming it, it is 
> not possible to tune to any DVB-S/S2 channels. /dev/dvb/adapter0/ does 
> not exist any more. DVB-T has not been tested.
> 
> After the resume has occurred, the kernel sends to the log the following 
> messages:
> 
>   tda9887 1-0043: i2c i/o error: rc == -6 (should be 4)
>   tda9887 1-0043: i2c i/o error: rc == -6 (should be 4)
>   tuner-simple 1-0061: i2c i/o error: rc == -6 (should be 4)
> 
> and later:
> 
>   cx24116_firmware_ondemand: Waiting for firmware upload 
> (dvb-fe-cx24116.fw)...
>   cx24116_firmware_ondemand: Waiting for firmware upload(2)...
>   cx24116_load_firmware: FW version 1.26.90.0
>   cx24116_firmware_ondemand: Firmware upload complete
>   cx88xx: cx88_print_irqbits: core:irq mpeg  [0x100000] ts_err?*
>   cx8802: cx8802_mpeg_irq: mpeg:general errors: 0x00100000
> 
> 
> 2. How to reproduce:
> 
> 2.1 Switching the power on and booting the OS
> 2.2 Waiting for the HTPC to launch
> 2.3 Waiting for the PVR to initialise in the background
> 2.4 Opening whatever previously scanned DVB-S/S2 TV channel
> 2.5 --> The chosen DVB stream plays on screen
> 2.6 Stopping the DVB stream
> 2.7 Quitting the HTPC application
> 2.6 Putting the host in standby mode (Suspend to Ram - S3),
> 2.6.1 : either from the desktop menu
> 2.6.2 : or by pressing the power button on the case
> 2.7 Waiting for the fans and lights to actually turn off
> 2.8 Resuming the host by pressing its power button
> 2.9 Launching the HTPC application
> 2.10 Opening the same or another previously scanned DVB-S/S2 TV channel
> 2.11 Waiting for the message "no DVB adapter available" from the PVR
> 2.12 --> No DVB stream plays, the screen is "black"
> 2.13 Looking at the logs
> 
> 
>   - 3 - Environment:
> 
> OS: Linux Mint 19.1 x86 with kernel 4.15.0-58-generic 32-bit
> Firmware dvb-fe-cx24116.fw version 1.26.90.0
> PVR: TVHeadend 4.2.8-31
> Player: Kodi 18.3
> 
> 
>   - 4 - Additional information
> 
> I attach in post-scriptum:
> 
>   - a partial dmesg output, before and after going to S3
>   - a few relevant messages added to syslog by tvheadend
>   - output of lsmod
>   - output of lspci -vnn
> 
> In case additional information may help (for instance, debug level 
> logs), I may provide them. I just need guidance on how-to gather the 
> required information.
> 
> 
> Regards.
> 
> 
> Frédéric.
> 
> -- 
> Frédéric Dumas
> f.dumas@ellis.siteparc.fr
> 
> 
> 
> 
> dmesg output before suspending to ram
> 
> 
> 
> [   15.039468] cx88_audio 0000:00:13.1: enabling device (0014 -> 0016)
> [   15.039643] cx88xx: subsystem: 0070:6902, board: Hauppauge 
> WinTV-HVR4000 DVB-S/S2/T/Hybrid [card=68,autodetected], frontend(s): 2
> [   15.176904] input: HDA NVidia HDMI/DP,pcm=3 as 
> /devices/pci0000:00/0000:00:0e.0/0000:02:00.1/sound/card1/input5
> [   15.177139] input: HDA NVidia HDMI/DP,pcm=7 as 
> /devices/pci0000:00/0000:00:0e.0/0000:02:00.1/sound/card1/input6
> [   15.177306] input: HDA NVidia HDMI/DP,pcm=8 as 
> /devices/pci0000:00/0000:00:0e.0/0000:02:00.1/sound/card1/input7
> [   15.177468] input: HDA NVidia HDMI/DP,pcm=9 as 
> /devices/pci0000:00/0000:00:0e.0/0000:02:00.1/sound/card1/input8
> [   15.375170] cx88xx: i2c init: enabling analog demod on 
> HVR1300/3000/4000 tuner
> [   16.145372] tda9887 1-0043: creating new instance
> [   16.145376] tda9887 1-0043: tda988[5/6/7] found
> [   16.146167] tuner: 1-0043: Tuner 74 found with type(s) Radio TV.
> [   16.372573] tuner: 1-0061: Tuner -1 found with type(s) Radio TV.
> [   16.410641] tveeprom: Hauppauge model 69009, rev B2D3, 
> serial#<sanitized>
> [   16.410644] tveeprom: MAC address is 00:0d:fe:32:95:9f
> [   16.410645] tveeprom: tuner model is Philips FMD1216MEX (idx 133, 
> type 78)
> [   16.410647] tveeprom: TV standards PAL(B/G) PAL(I) SECAM(L/L') 
> PAL(D/D1/K) ATSC/DVB Digital (eeprom 0xf4)
> [   16.410648] tveeprom: audio processor is CX882 (idx 33)
> [   16.410649] tveeprom: decoder processor is CX882 (idx 25)
> [   16.410651] tveeprom: has radio, has IR receiver, has no IR transmitter
> [   16.410652] cx88xx: hauppauge eeprom: model=69009
> [   18.004820] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> [   18.024933] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> [   19.502481] pcmcia_socket pcmcia_socket0: cs: IO port probe 0x100-0x3af:
> [   19.503597]  excluding 0x170-0x177 0x1f0-0x1f7 0x290-0x297 0x370-0x377
> [   19.514176] pcmcia_socket pcmcia_socket0: cs: IO port probe 0x3e0-0x4ff:
> [   19.514562]  excluding 0x3f0-0x3ff 0x480-0x48f 0x4d0-0x4d7
> [   19.522961] pcmcia_socket pcmcia_socket0: cs: IO port probe 0x820-0x8ff:
> [   19.523610]  clean
> [   19.523643] pcmcia_socket pcmcia_socket0: cs: IO port probe 0xc00-0xcf7:
> [   19.544493]  clean
> [   19.544614] pcmcia_socket pcmcia_socket0: cs: memory probe 
> 0x0c0000-0x0fffff:
> [   19.544621]  excluding 0xc0000-0xcffff 0xe0000-0xfffff
> [   19.544666] pcmcia_socket pcmcia_socket0: cs: memory probe 
> 0xa0000000-0xa0ffffff:
> [   19.544684]  clean
> [   19.544715] pcmcia_socket pcmcia_socket0: cs: memory probe 
> 0x60000000-0x60ffffff:
> [   19.544727]  excluding 0x60000000-0x60ffffff
> [   19.544761] pcmcia_socket pcmcia_socket0: cs: IO port probe 0xa00-0xaff:
> [   19.570773]  clean
> [   19.570872] pcmcia_socket pcmcia_socket0: cs: memory probe 
> 0xa0000000-0xa0ffffff:
> [   19.590960]  clean
> [   19.591248] pcmcia 0.0: pcmcia: registering new device pcmcia0.0 
> (IRQ: 3)
> [   19.687857] tuner-simple 1-0061: creating new instance
> [   19.687862] tuner-simple 1-0061: type set to 78 (Philips FMD1216MEX 
> MK3 Hybrid Tuner)
> [   19.790219] lirc_dev: IR Remote Control driver registered, major 244
> [   19.824929] IR LIRC bridge handler initialized
> [   20.516097] Registered IR keymap rc-hauppauge
> [   20.561427] IR RC5(x/sz) protocol handler initialized
> [   20.608225] rc rc0: cx88 IR (Hauppauge WinTV-HVR400 as 
> /devices/pci0000:00/0000:00:13.1/rc/rc0
> [   20.608303] input: cx88 IR (Hauppauge WinTV-HVR400 as 
> /devices/pci0000:00/0000:00:13.1/rc/rc0/input9
> [   20.612228] lirc lirc0: lirc_dev: driver ir-lirc-codec (cx88xx) 
> registered at minor = 0
> [   20.612273] cx88_alsa: cx88[0]: alsa: CX88x/0: ALSA support for 
> cx2388x boards
> [   20.612861] cx8802: cx2388x 8802 Driver Manager
> [   20.612875] cx88-mpeg driver manager 0000:00:13.2: enabling device 
> (0014 -> 0016)
> [   20.613018] cx8802: found at 0000:00:13.2, rev: 5, irq: 18, latency: 
> 32, mmio: 0xdd000000
> [   20.616389] cx8800 0000:00:13.0: enabling device (0014 -> 0016)
> [   20.616523] cx8800: found at 0000:00:13.0, rev: 5, irq: 18, latency: 
> 32, mmio: 0xdf000000
> [   20.813677] cx88_dvb: cx2388x dvb driver version 1.0.0 loaded
> [   20.813680] cx8802: registering cx8802 driver, type: dvb access: shared
> [   20.813683] cx8802: subsystem: 0070:6902, board: Hauppauge 
> WinTV-HVR4000 DVB-S/S2/T/Hybrid [card=68]
> [   20.813685] cx88_dvb: cx2388x based DVB/ATSC card
> [   20.813686] cx88_dvb: cx8802_alloc_frontends: allocating 2 frontend(s)
> [   20.832217] b44 ssb0:0 eth0: Link is up at 100 Mbps, full duplex
> [   20.832220] b44 ssb0:0 eth0: Flow control is off for TX and off for RX
> [   20.836271] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> [   20.935292] wm8775 1-001b: chip found @ 0x36 (cx88[0])
> [   21.001171] tuner-simple 1-0061: attaching existing instance
> [   21.001175] tuner-simple 1-0061: couldn't set type to 63. Using 78 
> (Philips FMD1216MEX MK3 Hybrid Tuner) instead
> [   21.006858] nvidia_uvm: Loaded the UVM driver, major device number 243
> [   21.016853] dvbdev: DVB: registering new adapter (cx88[0])
> [   21.016865] cx88-mpeg driver manager 0000:00:13.2: DVB: registering 
> adapter 0 frontend 0 (Conexant CX24116/CX24118)...
> [   21.020006] cx88-mpeg driver manager 0000:00:13.2: DVB: registering 
> adapter 0 frontend 1 (Conexant CX22702 DVB-T)...
> [   21.605645] cx8800: registered device video0 [v4l2]
> [   21.605990] cx8800: registered device vbi0
> [   21.606273] cx8800: registered device radio0
> [   21.870620] serial_cs 0.0: trying to set up [0x0157:0x0100] (pfc: 0, 
> multi: 1, quirk:   (null))
> [   21.870660] serial_cs 0.0: speaker requested, but PRESENT_STATUS not 
> set!
> [   22.218851] 0.0: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is 
> a 16450
> [   23.036831] resource sanity check: requesting [mem 
> 0x000c0000-0x000fffff], which spans more than PCI Bus 0000:00 [mem 
> 0x000d0000-0x000dffff window]
> [   23.037147] caller os_map_kernel_space+0xc9/0x120 [nvidia] mapping 
> multiple BARs
> [   23.786503] cx24116_firmware_ondemand: Waiting for firmware upload 
> (dvb-fe-cx24116.fw)...
> [   23.794497] cx24116_firmware_ondemand: Waiting for firmware upload(2)...
> [   28.760620] clocksource: timekeeping watchdog on CPU0: Marking 
> clocksource 'tsc' as unstable because the skew is too large:
> [   28.760622] clocksource:                       'acpi_pm' wd_now: 
> 765036 wd_last: d42b71 mask: ffffff
> [   28.760624] clocksource:                       'tsc' cs_now: 
> 1c4ee45970 cs_last: 1a303fd258 mask: ffffffffffffffff
> [   28.760629] tsc: Marking TSC unstable due to clocksource watchdog
> [   28.763160] TSC found unstable after boot, most likely due to broken 
> BIOS. Use 'tsc=unstable'.
> [   28.763164] sched_clock: Marking unstable (28763151408, 
> 5623)<-(28835973366, -72816256)
> [   28.772110] clocksource: Switched to clocksource acpi_pm
> [   29.648442] NVRM: Your system is not currently configured to drive a 
> VGA console
> [   29.648446] NVRM: on the primary VGA device. The NVIDIA Linux 
> graphics driver
> [   29.648477] NVRM: requires the use of a text-mode VGA console. Use of 
> other console
> [   29.648478] NVRM: drivers including, but not limited to, vesafb, may 
> result in
> [   29.648479] NVRM: corruption and stability problems, and is not 
> supported.
> [   29.659525] cx24116_load_firmware: FW version 1.26.90.0
> [   29.659539] cx24116_firmware_ondemand: Firmware upload complete
> [   29.880968] cx88-mpeg driver manager 0000:00:13.2: DVB: adapter 0 
> frontend 0 frequency 0 out of range (950000..2150000)
> [   72.405614] random: crng init done
> [   72.405619] random: 7 urandom warning(s) missed due to ratelimiting
> [  110.361271] b44 ssb0:0 eth0: powering down PHY
> [  110.469623] PM: suspend entry (deep)
> [  110.469629] PM: Syncing filesystems ... done.
> [  112.361293] Freezing user space processes ... (elapsed 0.005 seconds) 
> done.
> [  112.366386] OOM killer disabled.
> [  112.366388] Freezing remaining freezable tasks ... (elapsed 0.634 
> seconds) done.
> [  113.000835] Suspending console(s) (use no_console_suspend to debug)
> [  113.003646] serial 00:06: disabled
> [  113.041924] sd 2:0:0:0: [sdb] Synchronizing SCSI cache
> [  113.044204] sd 0:0:0:0: [sda] Synchronizing SCSI cache
> [  113.044395] sd 0:0:0:0: [sda] Stopping disk
> [  115.360205] ACPI: Preparing to enter system sleep state S3
> [  115.360742] PM: Saving platform NVS memory
> [  115.360748] Disabling non-boot CPUs ...
> 
> 
> 
> dmesg output when resuming from S3
> 
> 
> 
> [  115.360748] ACPI: Low-level resume complete
> [  115.360748] PM: Restoring platform NVS memory
> [  115.360748] ACPI: Waking up from system sleep state S3
> [  115.360748] pci 0000:00:02.0: Enabling SiS 96x SMBus
> [  115.402391] nvidia 0000:02:00.0: Enabling HDA controller
> [  116.294764] ata2: port disabled--ignoring
> [  116.297085] rtc_cmos 00:05: Alarms can be up to one month in the future
> [  116.298010] serial 00:06: activated
> [  116.343372] sd 0:0:0:0: [sda] Starting disk
> [  116.993996] tda9887 1-0043: i2c i/o error: rc == -6 (should be 4)
> [  116.994743] tda9887 1-0043: i2c i/o error: rc == -6 (should be 4)
> [  116.995483] tuner-simple 1-0061: i2c i/o error: rc == -6 (should be 4)
> [  116.995506] serial_cs 0.0: speaker requested, but PRESENT_STATUS not 
> set!
> [  117.116028] usb 1-4: reset high-speed USB device number 3 using ehci-pci
> [  117.180041] usb 2-1: reset full-speed USB device number 2 using ohci-pci
> [  117.413212] OOM killer enabled.
> [  117.413214] Restarting tasks ... done.
> [  117.448372] PM: suspend exit
> [  117.856377] ata1.01: ACPI cmd ef/03:44:00:00:00:b0 (SET FEATURES) 
> filtered out
> [  117.856382] ata1.01: ACPI cmd ef/03:0c:00:00:00:b0 (SET FEATURES) 
> filtered out
> [  117.856739] ata1.00: ACPI cmd ef/03:46:00:00:00:a0 (SET FEATURES) 
> filtered out
> [  117.856742] ata1.00: ACPI cmd ef/03:0c:00:00:00:a0 (SET FEATURES) 
> filtered out
> [  117.863803] ata1.00: configured for UDMA/133
> [  117.904041] ata1.01: configured for UDMA/66
> [  117.918798] ata1.00: Enabling discard_zeroes_data
> [  117.940247] ata1.00: Enabling discard_zeroes_data
> [  118.200432] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> [  118.220939] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> [  121.824183] b44 ssb0:0 eth0: Link is up at 100 Mbps, full duplex
> [  121.824187] b44 ssb0:0 eth0: Flow control is off for TX and off for RX
> [  121.824370] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> [  219.439091] cx24116_firmware_ondemand: Waiting for firmware upload 
> (dvb-fe-cx24116.fw)...
> [  219.439220] cx24116_firmware_ondemand: Waiting for firmware upload(2)...
> [  224.455452] cx24116_load_firmware: FW version 1.26.90.0
> [  224.455479] cx24116_firmware_ondemand: Firmware upload complete
> [  225.193814] cx88xx: cx88_print_irqbits: core:irq mpeg  [0x100000] 
> ts_err?*
> [  225.193826] cx8802: cx8802_mpeg_irq: mpeg:general errors: 0x00100000
> 
> 
> 
> Tvheadend messages after resuming from S3:
> 
> 
> 
> Aug 23 08:36:29 localhost tvheadend[917]: START: HTS Tvheadend version 
> 4.2.8-31~g0a60f73ee started, running as PID:917 UID:122 GID:44, CWD:/ 
> CNF:/home/hts/.hts/tvheadend
> Aug 23 08:36:29 localhost tvheadend[917]: htsp: Got connection from 
> 127.0.0.1
> Aug 23 08:36:29 localhost tvheadend[917]: htsp: 127.0.0.1: Welcomed 
> client software: Kodi Media Center (HTSPv34)
> Aug 23 08:36:29 localhost tvheadend[917]: htsp: 127.0.0.1 [ Kodi Media 
> Center ]: Disconnected
> Aug 23 08:36:29 localhost tvheadend[917]: htsp: Got connection from 
> 127.0.0.1
> Aug 23 08:36:29 localhost tvheadend[917]: htsp: 127.0.0.1: Welcomed 
> client software: Kodi Media Center (HTSPv34)
> Aug 23 08:36:29 localhost tvheadend[917]: htsp: 127.0.0.1 [ Kodi Media 
> Center ]: Disconnected
> Aug 23 08:36:30 localhost tvheadend[917]: avahi: Service 'Tvheadend' 
> successfully established.
> Aug 23 08:36:41 localhost tvheadend[917]: htsp: Got connection from 
> 127.0.0.1
> Aug 23 08:36:41 localhost tvheadend[917]: htsp: 127.0.0.1: Welcomed 
> client software: Kodi Media Center (HTSPv34)
> Aug 23 08:36:41 localhost tvheadend[917]: htsp: 127.0.0.1 [ Kodi Media 
> Center ]: Identified as user 'hts'
> Aug 23 08:36:41 localhost tvheadend[917]: htsp: 127.0.0.1 [ hts | Kodi 
> Media Center ]: Privileges updated
> Aug 23 08:36:44 localhost tvheadend[917]: mpegts: 11526H in DVB-S - Hot 
> Bird 13E - tuning on Conexant CX24116/CX24118 #0 : DVB-S #0
> Aug 23 08:36:44 localhost tvheadend[917]: diseqc: failed to disable tone
> Aug 23 08:36:44 localhost tvheadend[917]: mpegts: 11538V in DVB-S - 
> Astra 19.2E - tuning on Conexant CX24116/CX24118 #0 : DVB-S #0
> Aug 23 08:36:45 localhost tvheadend[917]: diseqc: failed to disable tone
> Aug 23 08:36:53 localhost tvheadend[917]: mpegts: 12207V in DVB-S - 
> Astra 19.2E - tuning on Conexant CX24116/CX24118 #0 : DVB-S #0
> Aug 23 08:36:54 localhost tvheadend[917]: diseqc: failed to disable tone
> Aug 23 08:36:57 localhost tvheadend[917]: subscription: 0003: No input 
> source available for subscription "127.0.0.1 [ hts | Kodi Media Center 
> ]" to channel "LCI"
> Aug 23 08:37:07 localhost tvheadend[917]: message repeated 5 times: [ 
> subscription: 0003: No input source available for subscription 
> "127.0.0.1 [ hts | Kodi Media Center ]" to channel "LCI"]
> Aug 23 08:37:08 localhost tvheadend[917]: subscription: 0003: "127.0.0.1 
> [ hts | Kodi Media Center ]" unsubscribing from "LCI", 
> hostname="127.0.0.1", username="hts", client="Kodi Media Center"
> Aug 23 08:37:10 localhost tvheadend[917]: htsp: 127.0.0.1 [ hts | Kodi 
> Media Center ]: Disconnected
> Aug 23 08:37:50 localhost tvheadend[917]: mpegts: 11538V in DVB-S - 
> Astra 19.2E - tuning on Conexant CX24116/CX24118 #0 : DVB-S #0
> Aug 23 08:37:50 localhost tvheadend[917]: diseqc: failed to disable tone
> Aug 23 08:37:50 localhost tvheadend[917]: mpegts: 11526H in DVB-S - Hot 
> Bird 13E - tuning on Conexant CX24116/CX24118 #0 : DVB-S #0
> Aug 23 08:37:56 localhost tvheadend[917]: subscription: 0005: "epggrab" 
> subscribing to mux "11526H", weight: 4, adapter: "Conexant 
> CX24116/CX24118 #0 : DVB-S #0", network: "DVB-S - Hot Bird 13E", 
> service: "Raw PID Subscription"
> Aug 23 08:37:57 localhost tvheadend[917]: linuxdvb: Conexant 
> CX24116/CX24118 #0 : DVB-S #0 - poll TIMEOUT
> Aug 23 08:37:57 localhost tvheadend[917]: linuxdvb: Conexant 
> CX24116/CX24118 #0 : DVB-S #0 - retune nodata
> Aug 23 08:38:05 localhost tvheadend[917]: linuxdvb: Conexant 
> CX24116/CX24118 #0 : DVB-S #0 - poll TIMEOUT
> Aug 23 08:38:05 localhost tvheadend[917]: linuxdvb: Conexant 
> CX24116/CX24118 #0 : DVB-S #0 - retune nodata
> Aug 23 08:38:12 localhost tvheadend[917]: linuxdvb: Conexant 
> CX24116/CX24118 #0 : DVB-S #0 - poll TIMEOUT
> Aug 23 08:38:13 localhost tvheadend[917]: linuxdvb: Conexant 
> CX24116/CX24118 #0 : DVB-S #0 - retune nodata
> Aug 23 08:38:20 localhost tvheadend[917]: linuxdvb: Conexant 
> CX24116/CX24118 #0 : DVB-S #0 - poll TIMEOUT
> Aug 23 08:38:20 localhost tvheadend[917]: linuxdvb: Conexant 
> CX24116/CX24118 #0 : DVB-S #0 - retune nodata
> Aug 23 08:38:28 localhost tvheadend[917]: linuxdvb: Conexant 
> CX24116/CX24118 #0 : DVB-S #0 - poll TIMEOUT
> Aug 23 08:38:29 localhost tvheadend[917]: linuxdvb: Conexant 
> CX24116/CX24118 #0 : DVB-S #0 - retune nodata
> Aug 23 08:38:30 localhost systemd[1]: Started Session 2 of user golffies.
> Aug 23 08:38:35 localhost tvheadend[917]: linuxdvb: Conexant 
> CX24116/CX24118 #0 : DVB-S #0 - poll TIMEOUT
> Aug 23 08:38:36 localhost tvheadend[917]: linuxdvb: Conexant 
> CX24116/CX24118 #0 : DVB-S #0 - retune nodata
> Aug 23 08:38:36 localhost tvheadend[917]: subscription: 0005: "epggrab" 
> unsubscribing
> Aug 23 08:38:37 localhost tvheadend[917]: mpegts: 11681H in DVB-S - Hot 
> Bird 13E - tuning on Conexant CX24116/CX24118 #0 : DVB-S #0
> Aug 23 08:38:38 localhost tvheadend[917]: subscription: 0007: "epggrab" 
> subscribing to mux "11681H", weight: 4, adapter: "Conexant 
> CX24116/CX24118 #0 : DVB-S #0", network: "DVB-S - Hot Bird 13E", 
> service: "Raw PID Subscription"
> 
> 
> 
> lsmod output:
> 
> 
> 
> $ lsmod
> Module                  Size  Used by
> serial_cs              24576  1
> nvidia_uvm             36864  0
> cx22702                16384  1
> isl6421                16384  1
> cx24116                20480  1
> cx88_dvb               36864  11
> cx88_vp3054_i2c        16384  1 cx88_dvb
> videobuf2_dvb          16384  1 cx88_dvb
> dvb_core              106496  2 videobuf2_dvb,cx88_dvb
> snd_soc_wm8776         20480  0
> snd_soc_core          204800  1 snd_soc_wm8776
> snd_compress           20480  1 snd_soc_core
> snd_pcm_dmaengine      16384  1 snd_soc_core
> wm8775                 16384  1
> ir_rc5_decoder         16384  0
> rc_hauppauge           16384  0
> ir_lirc_codec          16384  0
> lirc_dev               16384  2 ir_lirc_codec
> tuner_simple           20480  2
> tuner_types            20480  1 tuner_simple
> tda9887                16384  1
> snd_hda_codec_hdmi     45056  4
> tda8290                24576  0
> tuner                  28672  2
> snd_hda_intel          36864  1
> serio_raw              16384  0
> cx8802                 20480  1 cx88_dvb
> cx8800                 28672  0
> snd_hda_codec         106496  2 snd_hda_intel,snd_hda_codec_hdmi
> cx88_alsa              20480  1
> joydev                 20480  0
> cx88xx                 81920  4 cx88_alsa,cx88_dvb,cx8802,cx8800
> snd_intel8x0           36864  3
> input_leds             16384  0
> snd_hda_core           65536  3 
> snd_hda_intel,snd_hda_codec,snd_hda_codec_hdmi
> videobuf2_dma_sg       16384  2 cx88_dvb,cx8800
> tveeprom               20480  1 cx88xx
> snd_ac97_codec        106496  1 snd_intel8x0
> rc_core                32768  6 
> rc_hauppauge,ir_lirc_codec,lirc_dev,cx88xx,ir_rc5_decoder
> videobuf2_memops       16384  1 videobuf2_dma_sg
> snd_hwdep              16384  1 snd_hda_codec
> v4l2_common            16384  4 tuner,wm8775,cx88xx,cx8800
> ac97_bus               16384  2 snd_ac97_codec,snd_soc_core
> videobuf2_v4l2         20480  2 cx88_dvb,cx8800
> xpad                   32768  0
> videobuf2_core         36864  6 
> videobuf2_dvb,cx88_dvb,cx8802,cx88xx,videobuf2_v4l2,cx8800
> snd_pcm                86016  11 
> snd_hda_intel,snd_soc_wm8776,snd_hda_codec,cx88_alsa,snd_pcm_dmaengine,snd_hda_core,snd_ac97_codec,snd_hda_codec_hdmi,snd_intel8x0,snd_soc_core 
> 
> ff_memless             16384  1 xpad
> nvidia               9535488  72 nvidia_uvm
> snd_seq_midi           16384  0
> videodev              155648  8 
> tuner,v4l2_common,cx88_alsa,wm8775,videobuf2_core,cx88xx,videobuf2_v4l2,cx8800 
> 
> snd_seq_midi_event     16384  1 snd_seq_midi
> media                  32768  2 tuner,videodev
> snd_rawmidi            28672  1 snd_seq_midi
> i2c_algo_bit           16384  2 cx88_vp3054_i2c,cx88xx
> snd_seq                57344  2 snd_seq_midi_event,snd_seq_midi
> snd_seq_device         16384  3 snd_seq,snd_rawmidi,snd_seq_midi
> pcmcia                 57344  1 serial_cs
> drm                   344064  3 nvidia
> snd_timer              28672  2 snd_seq,snd_pcm
> yenta_socket           40960  0
> snd                    69632  23 
> snd_compress,snd_hda_intel,snd_hwdep,snd_seq,snd_hda_codec,cx88_alsa,snd_ac97_codec,snd_timer,snd_rawmidi,snd_hda_codec_hdmi,snd_intel8x0,snd_seq_device,snd_soc_core,snd_pcm 
> 
> pcmcia_rsrc            20480  1 yenta_socket
> pcmcia_core            24576  3 yenta_socket,pcmcia,pcmcia_rsrc
> soundcore              16384  1 snd
> shpchp                 32768  0
> mac_hid                16384  0
> sch_fq_codel           20480  2
> parport_pc             32768  0
> ppdev                  20480  0
> lp                     20480  0
> parport                45056  3 lp,parport_pc,ppdev
> ip_tables              20480  0
> x_tables               28672  1 ip_tables
> autofs4                40960  2
> btrfs                1089536  1
> xor                    28672  1 btrfs
> zstd_compress         151552  1 btrfs
> raid6_pq              106496  1 btrfs
> dm_mirror              24576  0
> dm_region_hash         20480  1 dm_mirror
> dm_log                 20480  2 dm_mirror,dm_region_hash
> uas                    20480  0
> usb_storage            57344  1 uas
> hid_generic            16384  0
> usbhid                 49152  0
> hid                    98304  2 hid_generic,usbhid
> cb710_mmc              20480  0
> b44                    36864  0
> psmouse               131072  0
> cb710                  16384  1 cb710_mmc
> ssb                    57344  1 b44
> mii                    16384  1 b44
> sis_agp                16384  1
> pata_acpi              16384  0
> i2c_sis96x             16384  0
> 
> 
> 
> lspci -vnn output:
> 
> 
> 
> 00:13.0 Multimedia video controller [0400]: Conexant Systems, Inc. 
> CX23880/1/2/3 PCI Video and Audio Decoder [14f1:8800] (rev 05)
>      Subsystem: Hauppauge computer works Inc. WinTV HVR-4000-HD [0070:6902]
>      Flags: bus master, medium devsel, latency 32, IRQ 18
>      Memory at df000000 (32-bit, non-prefetchable) [size=16M]
>      Capabilities: [44] Vital Product Data
>      Capabilities: [4c] Power Management version 2
>      Kernel driver in use: cx8800
>      Kernel modules: cx8800
> 
> 00:13.1 Multimedia controller [0480]: Conexant Systems, Inc. 
> CX23880/1/2/3 PCI Video and Audio Decoder [Audio Port] [14f1:8811] (rev 05)
>      Subsystem: Hauppauge computer works Inc. WinTV HVR-4000-HD [0070:6902]
>      Flags: bus master, medium devsel, latency 32, IRQ 18
>      Memory at de000000 (32-bit, non-prefetchable) [size=16M]
>      Capabilities: [4c] Power Management version 2
>      Kernel driver in use: cx88_audio
>      Kernel modules: cx88_alsa
> 
> 00:13.2 Multimedia controller [0480]: Conexant Systems, Inc. 
> CX23880/1/2/3 PCI Video and Audio Decoder [MPEG Port] [14f1:8802] (rev 05)
>      Subsystem: Hauppauge computer works Inc. WinTV HVR-4000-HD [0070:6902]
>      Flags: bus master, medium devsel, latency 32, IRQ 18
>      Memory at dd000000 (32-bit, non-prefetchable) [size=16M]
>      Capabilities: [4c] Power Management version 2
>      Kernel driver in use: cx88-mpeg driver manager
>      Kernel modules: cx8802
> 
> 00:13.4 Multimedia controller [0480]: Conexant Systems, Inc. 
> CX23880/1/2/3 PCI Video and Audio Decoder [IR Port] [14f1:8804] (rev 05)
>      Subsystem: Hauppauge computer works Inc. WinTV HVR-4000-HD [0070:6902]
>      Flags: bus master, medium devsel, latency 32, IRQ 255
>      Memory at dc000000 (32-bit, non-prefetchable) [disabled] [size=16M]
>      Capabilities: [4c] Power Management version 2






