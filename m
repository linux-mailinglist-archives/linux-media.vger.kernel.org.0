Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92DC1EC582
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 01:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgFBXN0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 19:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbgFBXNZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 19:13:25 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E583C08C5C1
        for <linux-media@vger.kernel.org>; Tue,  2 Jun 2020 16:13:25 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id g25so308450otp.13
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2020 16:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PyDZGl1QvB0sq7F+6xQypHMZ7RS5F4VpQQ/yBKLxG98=;
        b=frBfd4bY9RpZUiZVTm5UaMbdsUOczNFmr17lj1W2TqmZGW7SZMBNDVG5RREMaV2n1a
         yKF05um1OXTKeaINnJUZZMAfZvKo9bapjCQ3sB7PLN6J//4oXuieNnaX7S1YJluMVpu4
         scWd8ZzyPQdIxbtM7lf9vVmysD+AtstAB8Y9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PyDZGl1QvB0sq7F+6xQypHMZ7RS5F4VpQQ/yBKLxG98=;
        b=i/GRDTIKK7IP5dnFhHEnTt8STuf2ELZ7NM11bzcVqYwDZbQGW3oJVu99ALeWlbN8iy
         TDuW+Vh6iaGTmp5SrYifHf4Xj2B237H/rlMZDb89C4I2Yzc5QXA8zUj+LkmiKRYXKJ+6
         2dcG9BdutjV9hT5YOH5XpHK8YV0tSOa0gRPcWhpOM5d0Jy0qOKfQxI8BPy2xoUBoZp9l
         DKZGkKKbBqtjZkWu0AteT35j81yP8aFes7vV5w3C8oQY1MferI0ffH4Z7k3XLjSWgNsm
         3WdOqhpzb9zcMGGPDe14QIEJNTb8GPSijebuFxIs6U1MwwnzKn+nbLcpC2CkSFgrODOa
         RrwQ==
X-Gm-Message-State: AOAM532xL4/p1nwe/5z5maVKucMcuLmmZIqQNH7XZyvT0r/sWGramvwK
        2NwXajvQ71czrKYCbuZEC7u4kg==
X-Google-Smtp-Source: ABdhPJzFW59mEp9xZuOCDvq+bJb0VwtLnT6VhWAi8wo7cXQ3nwdp8M1VLskAeRQUhN3cxv2tuQVMJA==
X-Received: by 2002:a9d:6f12:: with SMTP id n18mr1256608otq.100.1591139604106;
        Tue, 02 Jun 2020 16:13:24 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c22sm140709oic.20.2020.06.02.16.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 16:13:23 -0700 (PDT)
Subject: Re: [RFC, WIP, v6 04/10] media: vidtv: add a bridge driver
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
 <20200520070334.1778751-5-dwlsalmeida@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7c31a037-6e19-c19f-0e41-5b8a96546581@linuxfoundation.org>
Date:   Tue, 2 Jun 2020 17:13:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520070334.1778751-5-dwlsalmeida@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On 5/20/20 1:03 AM, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Digital TV devices consist of several independent hardware components which
> are controlled by different drivers.
> Each media device is controlled by a group of cooperating drivers with the
> bridge driver as the main driver.
> 
> This patch adds a bridge driver for the Virtual Digital TV driver [vidtv].
> 
> The bridge driver binds to the other drivers, that is, vidtv_tuner and
> vidtv_demod and implements the digital demux logic, providing userspace
> with a MPEG Transport Stream.
> 
> Move config structs to a common header so they can be used by the bridge
> driver and by their respective drivers.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
> BRIDGE WIP
> ---
>   arch/Kconfig                                  |   2 +-
>   drivers/media/dvb-core/dvbdev.c               |   1 +
>   drivers/media/test-drivers/vidtv/Makefile     |   4 +-
>   .../media/test-drivers/vidtv/vidtv_bridge.c   | 435 ++++++++++++++++++
>   .../media/test-drivers/vidtv/vidtv_bridge.h   |  39 ++
>   5 files changed, 479 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.h
> 

I ran a test and does't look like you are releasing demod and tuner
module when removing dvb_vidtv_bridge. Probe for these happens when

After modprobe dvb_vidtv_bridge and lsmod shows all 3 modules.
dvb_vidtv_demod        16384  0
dvb_vidtv_bridge       45056  0
dvb_core              143360  1 dvb_vidtv_bridge

After rmmod dvb_vidtv_bridge, lsmod shows

dvb_vidtv_tuner        16384  0
dvb_vidtv_demod        16384  0

vidtv_bridge_remove() doesn't seem to cleaning up completely and
releasing thes modules vidtv_bridge_init() loads. Also it has to
delete i2c adapter that is added in vidtv_bridge_init(). Call
to i2c_del_adapter() is miising in vidtv_bridge_remove()

Please see commnets inline after vidtv_bridge_remove().

After a couple of modprobe and rmmods on dvb_vidtv_bridge, I see
paninc after modprobe.

[ 3651.863602] dvbdev: DVB: registering new adapter (dvb_vidtv_bridge)
[ 3821.179081] dvbdev: DVB: registering new adapter (dvb_vidtv_bridge)
[ 4087.198087] dvbdev: DVB: registering new adapter (dvb_vidtv_bridge)
[ 4087.202732] i2c i2c-10: DVB: registering adapter 0 frontend 0 (Dummy 
demod for DVB-T/T2/C/S/S2)...
[ 4087.203112] BUG: kernel NULL pointer dereference, address: 
0000000000000000
[ 4087.203140] #PF: supervisor read access in kernel mode
[ 4087.203142] #PF: error_code(0x0000) - not-present page
[ 4087.203144] PGD 0 P4D 0
[ 4087.203147] Oops: 0000 [#1] SMP NOPTI
[ 4087.203150] CPU: 6 PID: 1875 Comm: modprobe Not tainted 5.7.0+ #3
[ 4087.203151] Hardware name: LENOVO 10VGCTO1WW/3130, BIOS M1XKT45A 
08/21/2019
[ 4087.203157] RIP: 0010:strlen+0x0/0x20
[ 4087.203160] Code: 48 89 f9 74 09 48 83 c1 01 80 39 00 75 f7 31 d2 44 
0f b6 04 16 44 88 04 11 48 83 c2 01 45 84 c0 75 ee c3 0f 1f 80 00 00 00 
00 <80> 3f 00 74 10 48 89 f8 48 83 c0 01 80 38 00 75 f7 48 29 f8 c3 31
[ 4087.203162] RSP: 0018:ffffa604c090b940 EFLAGS: 00010246
[ 4087.203164] RAX: ffff9a5188735cc0 RBX: ffff9a5188735c40 RCX: 
0000000000000000
[ 4087.203165] RDX: 0000000000000000 RSI: ffffffffc10d4fd8 RDI: 
0000000000000000
[ 4087.203167] RBP: ffffa604c090b9b0 R08: ffff9a51b7bb20a0 R09: 
ffff9a51b6807640
[ 4087.203168] R10: 0000000000000000 R11: 0000000000000001 R12: 
ffff9a5188735cc0
[ 4087.203170] R13: 0000000000000000 R14: ffff9a51acd74710 R15: 
ffff9a519531f000
[ 4087.203172] FS:  00007fd38f2b1540(0000) GS:ffff9a51b7b80000(0000) 
knlGS:0000000000000000
[ 4087.203174] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4087.203175] CR2: 0000000000000000 CR3: 00000001ffc50000 CR4: 
00000000003406e0
[ 4087.203177] Call Trace:
[ 4087.203191]  ? vidtv_channels_init+0x79/0x130 [dvb_vidtv_bridge]
[ 4087.203197]  vidtv_mux_init+0xa6/0x1a0 [dvb_vidtv_bridge]
[ 4087.203201]  vidtv_bridge_probe+0x397/0x400 [dvb_vidtv_bridge]
[ 4087.203205]  ? vidtv_bridge_remove+0x80/0x80 [dvb_vidtv_bridge]
[ 4087.203210]  platform_drv_probe+0x3b/0x80
[ 4087.203213]  really_probe+0x2b3/0x3e0
[ 4087.203216]  driver_probe_device+0xbc/0x100
[ 4087.203218]  device_driver_attach+0x5d/0x70
[ 4087.203220]  __driver_attach+0x8f/0x150
[ 4087.203222]  ? device_driver_attach+0x70/0x70
[ 4087.203225]  bus_for_each_dev+0x7e/0xc0
[ 4087.203227]  driver_attach+0x1e/0x20
[ 4087.203229]  bus_add_driver+0x152/0x1f0
[ 4087.203232]  driver_register+0x74/0xd0
[ 4087.203234]  __platform_driver_register+0x36/0x40
[ 4087.203238]  vidtv_bridge_init+0x31/0x1000 [dvb_vidtv_bridge]
[ 4087.203240]  ? 0xffffffffc0a4a000
[ 4087.203245]  do_one_initcall+0x4a/0x200
[ 4087.203248]  ? kfree+0x231/0x250
[ 4087.203252]  ? _cond_resched+0x19/0x30
[ 4087.203254]  ? kmem_cache_alloc_trace+0x16c/0x240
[ 4087.203258]  do_init_module+0x62/0x250
[ 4087.203260]  load_module+0x2894/0x2af0
[ 4087.203264]  __do_sys_finit_module+0xbe/0x120
[ 4087.203266]  ? __do_sys_finit_module+0xbe/0x120
[ 4087.203269]  __x64_sys_finit_module+0x1a/0x20
[ 4087.203271]  do_syscall_64+0x57/0x1b0
[ 4087.203274]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 4087.203276] RIP: 0033:0x7fd38f3f670d
[ 4087.203278] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 53 f7 0c 00 f7 d8 64 89 01 48
[ 4087.203280] RSP: 002b:00007ffe35039d08 EFLAGS: 00000246 ORIG_RAX: 
0000000000000139
[ 4087.203282] RAX: ffffffffffffffda RBX: 000055933c9a7b50 RCX: 
00007fd38f3f670d
[ 4087.203284] RDX: 0000000000000000 RSI: 000055933bacf358 RDI: 
0000000000000003
[ 4087.203285] RBP: 0000000000040000 R08: 0000000000000000 R09: 
0000000000000000
[ 4087.203286] R10: 0000000000000003 R11: 0000000000000246 R12: 
000055933bacf358
[ 4087.203288] R13: 0000000000000000 R14: 000055933c9af3f0 R15: 
000055933c9a7b50
[ 4087.203290] Modules linked in: dvb_vidtv_bridge(+) dvb_vidtv_tuner 
dvb_vidtv_demod dvb_core rfcomm ccm cmac algif_hash algif_skcipher 
af_alg bnep binfmt_misc nls_iso8859_1 edac_mce_amd kvm_amd 
snd_hda_codec_realtek kvm snd_hda_codec_hdmi snd_hda_codec_generic 
ledtrig_audio irqbypass snd_hda_intel snd_intel_dspcfg snd_usb_audio 
amdgpu snd_hda_codec snd_usbmidi_lib mc snd_hda_core snd_hwdep snd_pcm 
snd_seq_midi snd_seq_midi_event btusb snd_rawmidi btrtl btbcm btintel 
bluetooth crct10dif_pclmul ath10k_pci ath10k_core snd_seq ath 
snd_seq_device amd_iommu_v2 snd_timer ghash_clmulni_intel ecdh_generic 
gpu_sched ttm mac80211 aesni_intel drm_kms_helper crypto_simd ecc pl2303 
cryptd glue_helper snd cec input_leds cfg80211 serio_raw i2c_algo_bit 
wmi_bmof fb_sys_fops efi_pstore syscopyarea sysfillrect snd_pci_acp3x 
k10temp ipmi_devintf sysimgblt ccp libarc4 soundcore ipmi_msghandler 
mac_hid sch_fq_codel parport_pc ppdev lp parport drm ip_tables x_tables 
autofs4 hid_generic usbhid hid crc32_pclmul
[ 4087.203325]  ahci psmouse i2c_piix4 libahci nvme nvme_core r8169 
realtek wmi video [last unloaded: dvb_vidtv_bridge]
[ 4087.203335] CR2: 0000000000000000
[ 4087.203337] ---[ end trace c8d767383a27d74e ]---
[ 4087.505440] RIP: 0010:strlen+0x0/0x20
[ 4087.505446] Code: 48 89 f9 74 09 48 83 c1 01 80 39 00 75 f7 31 d2 44 
0f b6 04 16 44 88 04 11 48 83 c2 01 45 84 c0 75 ee c3 0f 1f 80 00 00 00 
00 <80> 3f 00 74 10 48 89 f8 48 83 c0 01 80 38 00 75 f7 48 29 f8 c3 31
[ 4087.505448] RSP: 0018:ffffa604c090b940 EFLAGS: 00010246
[ 4087.505450] RAX: ffff9a5188735cc0 RBX: ffff9a5188735c40 RCX: 
0000000000000000
[ 4087.505452] RDX: 0000000000000000 RSI: ffffffffc10d4fd8 RDI: 
0000000000000000
[ 4087.505453] RBP: ffffa604c090b9b0 R08: ffff9a51b7bb20a0 R09: 
ffff9a51b6807640
[ 4087.505455] R10: 0000000000000000 R11: 0000000000000001 R12: 
ffff9a5188735cc0
[ 4087.505456] R13: 0000000000000000 R14: ffff9a51acd74710 R15: 
ffff9a519531f000
[ 4087.505458] FS:  00007fd38f2b1540(0000) GS:ffff9a51b7b80000(0000) 
knlGS:0000000000000000
[ 4087.505460] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4087.505461] CR2: 0000000000000000 CR3: 00000001ffc50000 CR4: 
00000000003406e0


> diff --git a/arch/Kconfig b/arch/Kconfig
> index 786a85d4ad40d..ddcb4a68ee940 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -868,7 +868,7 @@ config VMAP_STACK
>   	  be enabled.
>   
>   config ARCH_OPTIONAL_KERNEL_RWX
> -	def_bool n
> +	def_bool y
>   
>   config ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>   	def_bool n
> diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
> index 80b6a71aa33e4..38c8b848c921f 100644
> --- a/drivers/media/dvb-core/dvbdev.c
> +++ b/drivers/media/dvb-core/dvbdev.c
> @@ -962,6 +962,7 @@ int dvb_usercopy(struct file *file,
>   }
>   
>   #if IS_ENABLED(CONFIG_I2C)
> +#pragma clang optimize off
>   struct i2c_client *dvb_module_probe(const char *module_name,
>   				    const char *name,
>   				    struct i2c_adapter *adap,
> diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
> index 21e50c11c94d0..c99cd13f4adaf 100644
> --- a/drivers/media/test-drivers/vidtv/Makefile
> +++ b/drivers/media/test-drivers/vidtv/Makefile
> @@ -2,5 +2,7 @@
>   
>   dvb-vidtv-tuner-objs := vidtv_tuner.o
>   dvb-vidtv-demod-objs := vidtv_demod.o
> +dvb-vidtv-bridge-objs := vidtv_bridge.o
>   
> -obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o dvb-vidtv-demod.o
> +obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o dvb-vidtv-demod.o \
> +			   dvb-vidtv-bridge.o
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
> new file mode 100644
> index 0000000000000..bc1c612c23013
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
> @@ -0,0 +1,435 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * The Virtual DTV test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
> +
> +#include <linux/moduleparam.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +#include <linux/time.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#include "vidtv_bridge.h"
> +#include "vidtv_demod.h"
> +#include "vidtv_tuner.h"
> +
> +#define TUNER_DEFAULT_ADDR 0x68
> +#define DEMOD_DEFAULT_ADDR 0x60
> +
> +static unsigned int drop_tslock_prob_on_low_snr;
> +module_param(drop_tslock_prob_on_low_snr, uint, 0);
> +MODULE_PARM_DESC(drop_tslock_prob_on_low_snr,
> +		 "Probability of losing the TS lock if the signal quality is bad");
> +
> +static unsigned int recover_tslock_prob_on_good_snr;
> +module_param(recover_tslock_prob_on_good_snr, uint, 0);
> +MODULE_PARM_DESC(recover_tslock_prob_on_good_snr,
> +		 "Probability recovering the TS lock when the signal improves");
> +
> +static unsigned int mock_power_up_delay_msec;
> +module_param(mock_power_up_delay_msec, uint, 0);
> +MODULE_PARM_DESC(mock_power_up_delay_msec, "Simulate a power up delay");
> +
> +static unsigned int mock_tune_delay_msec;
> +module_param(mock_tune_delay_msec, uint, 0);
> +MODULE_PARM_DESC(mock_tune_delay_msec, "Simulate a tune delay");
> +
> +static unsigned int vidtv_valid_dvb_t_freqs[8];
> +module_param_array(vidtv_valid_dvb_t_freqs, uint, NULL, 0);
> +MODULE_PARM_DESC(vidtv_valid_dvb_t_freqs,
> +		 "Valid DVB-T frequencies to simulate");
> +
> +static unsigned int vidtv_valid_dvb_c_freqs[8];
> +module_param_array(vidtv_valid_dvb_c_freqs, uint, NULL, 0);
> +MODULE_PARM_DESC(vidtv_valid_dvb_c_freqs,
> +		 "Valid DVB-C frequencies to simulate");
> +
> +static unsigned int vidtv_valid_dvb_s_freqs[8];
> +module_param_array(vidtv_valid_dvb_s_freqs, uint, NULL, 0);
> +MODULE_PARM_DESC(vidtv_valid_dvb_s_freqs,
> +		 "Valid DVB-C frequencies to simulate");
> +
> +static unsigned int max_frequency_shift_hz;
> +module_param(max_frequency_shift_hz, uint, 0);
> +MODULE_PARM_DESC(max_frequency_shift_hz,
> +		 "Maximum shift in HZ allowed when tuning in a channel");
> +
> +DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nums);
> +
> +static int vidtv_start_streaming(struct vidtv_dvb *dvb)
> +{
> +	if (dvb->streaming) {
> +		pr_warn_ratelimited("Already streaming. Skipping.\n");
> +		return 0;
> +	}
> +
> +	dvb->streaming = true;
> +	return 0;
> +}
> +
> +static int vidtv_stop_streaming(struct vidtv_dvb *dvb)
> +{
> +	dvb->streaming = false;
> +
> +	return 0;
> +}
> +
> +static int vidtv_start_feed(struct dvb_demux_feed *feed)
> +{
> +	struct dvb_demux *demux = feed->demux;
> +	struct vidtv_dvb *dvb   = demux->priv;
> +	int rc;
> +	int ret;
> +
> +	if (!demux->dmx.frontend)
> +		return -EINVAL;
> +
> +	mutex_lock(&dvb->feed_lock);
> +
> +	dvb->nfeeds++;
> +	rc = dvb->nfeeds;
> +
> +	if (dvb->nfeeds == 1) {
> +		ret = vidtv_start_streaming(dvb);
> +		if (ret < 0)
> +			rc = ret;
> +	}
> +
> +	mutex_unlock(&dvb->feed_lock);
> +	return rc;
> +}
> +
> +static int vidtv_stop_feed(struct dvb_demux_feed *feed)
> +{
> +	struct dvb_demux *demux = feed->demux;
> +	struct vidtv_dvb *dvb   = demux->priv;
> +	int    err              = 0;
> +
> +	mutex_lock(&dvb->feed_lock);
> +	dvb->nfeeds--;
> +
> +	if (!dvb->nfeeds)
> +		err = vidtv_stop_streaming(dvb);
> +
> +	mutex_unlock(&dvb->feed_lock);
> +	return err;
> +}
> +
> +static struct dvb_frontend *vidtv_get_frontend_ptr(struct i2c_client *c)
> +{
> +	/* the demod will set this when its probe function runs */
> +	struct vidtv_demod_state *state = i2c_get_clientdata(c);
> +
> +	return &state->frontend;
> +}
> +
> +static int vidtv_master_xfer(struct i2c_adapter *i2c_adap,
> +			     struct i2c_msg msgs[],
> +			     int num)
> +{
> +	return 0;
> +}
> +
> +static u32 vidtv_i2c_func(struct i2c_adapter *adapter)
> +{
> +	return I2C_FUNC_I2C;
> +}
> +
> +static const struct i2c_algorithm vidtv_i2c_algorithm = {
> +	.master_xfer   = vidtv_master_xfer,
> +	.functionality = vidtv_i2c_func,
> +};
> +
> +static int vidtv_bridge_i2c_register_adap(struct vidtv_dvb *dvb)
> +{
> +	struct i2c_adapter *i2c_adapter = &dvb->i2c_adapter;
> +
> +	strscpy(i2c_adapter->name, "vidtv_i2c", sizeof(i2c_adapter->name));
> +	i2c_adapter->owner      = THIS_MODULE;
> +	i2c_adapter->algo       = &vidtv_i2c_algorithm;
> +	i2c_adapter->algo_data  = NULL;
> +	i2c_adapter->timeout    = 500;
> +	i2c_adapter->retries    = 3;
> +	i2c_adapter->dev.parent = &dvb->pdev->dev;
> +
> +	i2c_set_adapdata(i2c_adapter, dvb);
> +	return i2c_add_adapter(&dvb->i2c_adapter);
> +}
> +
> +static int vidtv_bridge_register_adap(struct vidtv_dvb *dvb)
> +{
> +	int ret = 0;
> +
> +	ret = dvb_register_adapter(&dvb->adapter,
> +				   KBUILD_MODNAME,
> +				   THIS_MODULE,
> +				   &dvb->i2c_adapter.dev,
> +				   adapter_nums);
> +
> +	return ret;
> +}
> +
> +static int vidtv_bridge_dmx_init(struct vidtv_dvb *dvb)
> +{
> +	dvb->demux.dmx.capabilities = DMX_TS_FILTERING |
> +				      DMX_SECTION_FILTERING;
> +
> +	dvb->demux.priv       = dvb;
> +	dvb->demux.filternum  = 256;
> +	dvb->demux.feednum    = 256;
> +	dvb->demux.start_feed = vidtv_start_feed;
> +	dvb->demux.stop_feed  = vidtv_stop_feed;
> +
> +	return dvb_dmx_init(&dvb->demux);
> +}
> +
> +static int vidtv_bridge_dmxdev_init(struct vidtv_dvb *dvb)
> +{
> +	dvb->dmx_dev.filternum    = 256;
> +	dvb->dmx_dev.demux        = &dvb->demux.dmx;
> +	dvb->dmx_dev.capabilities = 0;
> +
> +	return dvb_dmxdev_init(&dvb->dmx_dev, &dvb->adapter);
> +}
> +
> +static int vidtv_bridge_probe_demod(struct vidtv_dvb *dvb, u32 n)
> +{
> +	struct vidtv_demod_config cfg = {};
> +
> +	cfg.drop_tslock_prob_on_low_snr     = drop_tslock_prob_on_low_snr;
> +	cfg.recover_tslock_prob_on_good_snr = recover_tslock_prob_on_good_snr;
> +
> +	dvb->i2c_client_demod[n] = dvb_module_probe("vidtv_demod",
> +						    NULL,
> +						    &dvb->i2c_adapter,
> +						    DEMOD_DEFAULT_ADDR,
> +						    &cfg);
> +
> +	/* driver will not work anyways so bail out */
> +	if (!dvb->i2c_client_demod[n])
> +		return -ENODEV;
> +
> +	/* retrieve a ptr to the frontend state */
> +	dvb->fe[n] = vidtv_get_frontend_ptr(dvb->i2c_client_demod[n]);
> +
> +	return 0;
> +}
> +
> +static int vidtv_bridge_probe_tuner(struct vidtv_dvb *dvb, u32 n)
> +{
> +	struct vidtv_tuner_config cfg = {};
> +
> +	cfg.fe                       = dvb->fe[n];
> +	cfg.mock_power_up_delay_msec = mock_power_up_delay_msec;
> +	cfg.mock_tune_delay_msec     = mock_tune_delay_msec;
> +
> +	memcpy(cfg.vidtv_valid_dvb_t_freqs,
> +	       vidtv_valid_dvb_t_freqs,
> +	       sizeof(vidtv_valid_dvb_t_freqs));
> +
> +	memcpy(cfg.vidtv_valid_dvb_c_freqs,
> +	       vidtv_valid_dvb_c_freqs,
> +	       sizeof(vidtv_valid_dvb_c_freqs));
> +
> +	memcpy(cfg.vidtv_valid_dvb_s_freqs,
> +	       vidtv_valid_dvb_s_freqs,
> +	       sizeof(vidtv_valid_dvb_s_freqs));
> +
> +	cfg.max_frequency_shift_hz = max_frequency_shift_hz;
> +
> +	dvb->i2c_client_tuner[n] = dvb_module_probe("vidtv_tuner",
> +						    NULL,
> +						    &dvb->i2c_adapter,
> +						    TUNER_DEFAULT_ADDR,
> +						    &cfg);
> +
> +	return (dvb->i2c_client_tuner[n]) ? 0 : -ENODEV;
> +}
> +
> +static int vidtv_bridge_dvb_init(struct vidtv_dvb *dvb)
> +{
> +	int ret;
> +	int i;
> +	int j;
> +	int k;
> +	int w;
> +	int l;
> +
> +	ret = vidtv_bridge_i2c_register_adap(dvb);
> +	if (ret < 0)
> +		goto fail_i2c;
> +
> +	ret = vidtv_bridge_register_adap(dvb);
> +	if (ret < 0)
> +		goto fail_adapter;
> +
> +	for (i = 0; i < NUM_FE; ++i) {
> +		ret = vidtv_bridge_probe_demod(dvb, i);
> +		if (ret < 0)
> +			goto fail_demod_probe;
> +
> +		ret = vidtv_bridge_probe_tuner(dvb, i);
> +		if (ret < 0)
> +			goto fail_tuner_probe;
> +
> +		ret = dvb_register_frontend(&dvb->adapter, dvb->fe[i]);
> +		if (ret < 0)
> +			goto fail_fe;
> +	}
> +
> +	ret = vidtv_bridge_dmx_init(dvb);
> +	if (ret < 0)
> +		goto fail_dmx;
> +
> +	ret = vidtv_bridge_dmxdev_init(dvb);
> +	if (ret < 0)
> +		goto fail_dmx_dev;
> +
> +	for (j = 0; j < NUM_FE; ++j) {
> +		ret = dvb->demux.dmx.connect_frontend(&dvb->demux.dmx,
> +						      &dvb->dmx_fe[j]);
> +		if (ret < 0)
> +			goto fail_dmx_conn;
> +
> +		/*
> +		 * The source of the demux is a frontend connected
> +		 * to the demux.
> +		 */
> +		dvb->dmx_fe[j].source = DMX_FRONTEND_0;
> +	}
> +
> +	return ret;
> +
> +fail_dmx_conn:
> +	for (j = j - 1; j >= 0; --j)
> +		dvb->demux.dmx.remove_frontend(&dvb->demux.dmx,
> +					       &dvb->dmx_fe[j]);
> +fail_dmx_dev:
> +	dvb_dmxdev_release(&dvb->dmx_dev);
> +fail_dmx:
> +	dvb_dmx_release(&dvb->demux);
> +fail_fe:
> +	for (k = i; k >= 0; --k)
> +		dvb_unregister_frontend(dvb->fe[k]);
> +fail_tuner_probe:
> +	for (w = i; w >= 0; --w)
> +		dvb_module_release(dvb->i2c_client_tuner[w]);
> +
> +fail_demod_probe:
> +	for (l = i; l >= 0; --l)
> +		dvb_module_release(dvb->i2c_client_demod[l]);
> +
> +fail_adapter:
> +	dvb_unregister_adapter(&dvb->adapter);
> +
> +fail_i2c:
> +	i2c_del_adapter(&dvb->i2c_adapter);
> +
> +	return ret;
> +}
> +
> +static int vidtv_bridge_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct vidtv_dvb *dvb;
> +
> +	dvb = kzalloc(sizeof(*dvb), GFP_KERNEL);
> +	if (!dvb)
> +		return -ENOMEM;
> +
> +	dvb->pdev = pdev;
> +
> +	ret = vidtv_bridge_dvb_init(dvb);
> +	if (ret < 0)
> +		goto err_dvb;
> +
> +	mutex_init(&dvb->feed_lock);
> +
> +	platform_set_drvdata(pdev, dvb);
> +
> +	return ret;
> +
> +err_dvb:
> +	kfree(dvb);
> +	return ret;
> +}
> +
> +static int vidtv_bridge_remove(struct platform_device *pdev)
> +{
> +	struct vidtv_dvb *dvb;
> +	u32 i;
> +
> +	dvb = platform_get_drvdata(pdev);
> +
> +	mutex_destroy(&dvb->feed_lock);
> +
> +	for (i = 0; i < NUM_FE; ++i)

Using i++ is more common though

> +		dvb->demux.dmx.remove_frontend(&dvb->demux.dmx,
> +					       &dvb->dmx_fe[i]);
> +
> +	dvb_dmxdev_release(&dvb->dmx_dev);
> +	dvb_dmx_release(&dvb->demux);
> +
> +	for (i = 0; i < NUM_FE; ++i) {
> +		dvb_unregister_frontend(dvb->fe[i]);
> +		dvb_frontend_detach(dvb->fe[i]);
> +	}
> +

Where do you release tuner and demod? probe is happening
from vidtv_bridge_dvb_init(). Don't you have to do the
reverse here?

> +	dvb_unregister_adapter(&dvb->adapter);

Don't you have to do i2c_del_adapter() here?
> +
> +	return 0;
> +}
> +
> +static void vidtv_bridge_dev_release(struct device *dev)
> +{
> +}
> +
> +static struct platform_device vidtv_bridge_dev = {
> +	.name		= "vidtv_bridge",
> +	.dev.release	= vidtv_bridge_dev_release,
> +};
> +
> +static struct platform_driver vidtv_bridge_driver = {
> +	.driver = {
> +		.name                = "vidtv_bridge",
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe    = vidtv_bridge_probe,
> +	.remove   = vidtv_bridge_remove,
> +};
> +
> +static void __exit vidtv_bridge_exit(void)
> +{
> +	platform_driver_unregister(&vidtv_bridge_driver);
> +	platform_device_unregister(&vidtv_bridge_dev);
> +}
> +
> +static int __init vidtv_bridge_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_device_register(&vidtv_bridge_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&vidtv_bridge_driver);
> +	if (ret)
> +		platform_device_unregister(&vidtv_bridge_dev);
> +
> +	return ret;
> +}
> +
> +module_init(vidtv_bridge_init);
> +module_exit(vidtv_bridge_exit);
> +
> +MODULE_DESCRIPTION("Virtual Digital TV Test Driver");
> +MODULE_AUTHOR("Daniel W. S. Almeida");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
> new file mode 100644
> index 0000000000000..4931bfb73273c
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * The Virtual DTV test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#ifndef VIDTV_BRIDGE_H
> +#define VIDTV_BRIDGE_H
> +
> +#define NUM_FE 1
> +
> +#include <linux/i2c.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <media/dmxdev.h>
> +#include <media/dvb_demux.h>
> +#include <media/dvb_frontend.h>
> +
> +struct vidtv_dvb {
> +	struct platform_device *pdev;
> +	struct dvb_frontend *fe[NUM_FE];
> +	struct dvb_adapter adapter;
> +	struct dvb_demux demux;
> +	struct dmxdev dmx_dev;
> +	struct dmx_frontend dmx_fe[NUM_FE];
> +	struct i2c_adapter i2c_adapter;
> +	struct i2c_client *i2c_client_demod[NUM_FE];
> +	struct i2c_client *i2c_client_tuner[NUM_FE];
> +
> +	u32 nfeeds;
> +	struct mutex feed_lock; /* start/stop feed */
> +
> +	bool streaming;
> +};
> +
> +#endif // VIDTV_BRIDG_H
> 

thanks,
-- Shuah
