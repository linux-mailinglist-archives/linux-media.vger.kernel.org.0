Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0225D2A7A45
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 10:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgKEJQg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 5 Nov 2020 04:16:36 -0500
Received: from www.linuxtv.org ([130.149.80.248]:54672 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgKEJQf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 04:16:35 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kabNg-00Fnro-H5; Thu, 05 Nov 2020 09:16:32 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kabQf-00039k-PC; Thu, 05 Nov 2020 09:19:38 +0000
Date:   Thu, 5 Nov 2020 09:19:37 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <2111941664.26.1604567977773@builder.linuxtv.org>
In-Reply-To: <655715789.25.1604481563179@builder.linuxtv.org>
References: <655715789.25.1604481563179@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3277
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/3277/display/redirect>

Changes:


------------------------------------------
[...truncated 4.29 KB...]
     0K .......... .......... .......... .......... ..........  0% 80.4K 87s
    50K .......... .......... .......... .......... ..........  1%  107K 75s
   100K .......... .......... .......... .......... ..........  2%  107K 71s
   150K .......... .......... .......... .......... ..........  2%  160K 64s
   200K .......... .......... .......... .......... ..........  3%  160K 59s
   250K .......... .......... .......... .......... ..........  4%  160K 56s
   300K .......... .......... .......... .......... ..........  4%  160K 53s
   350K .......... .......... .......... .......... ..........  5%  141K 52s
   400K .......... .......... .......... .......... ..........  6%  118K 52s
   450K .......... .......... .......... .......... ..........  7%  249K 49s
   500K .......... .......... .......... .......... ..........  7%  160K 48s
   550K .......... .......... .......... .......... ..........  8%  188K 47s
   600K .......... .......... .......... .......... ..........  9%  248K 45s
   650K .......... .......... .......... .......... ..........  9%  162K 44s
   700K .......... .......... .......... .......... .......... 10%  186K 43s
   750K .......... .......... .......... .......... .......... 11%  207K 42s
   800K .......... .......... .......... .......... .......... 12%  161K 41s
   850K .......... .......... .......... .......... .......... 12%  187K 41s
   900K .......... .......... .......... .......... .......... 13%  245K 39s
   950K .......... .......... .......... .......... .......... 14%  226K 38s
  1000K .......... .......... .......... .......... .......... 14%  208K 38s
  1050K .......... .......... .......... .......... .......... 15%  221K 37s
  1100K .......... .......... .......... .......... .......... 16%  253K 36s
  1150K .......... .......... .......... .......... .......... 17%  320K 35s
  1200K .......... .......... .......... .......... .......... 17%  161K 35s
  1250K .......... .......... .......... .......... .......... 18%  318K 34s
  1300K .......... .......... .......... .......... .......... 19%  254K 33s
  1350K .......... .......... .......... .......... .......... 19%  321K 32s
  1400K .......... .......... .......... .......... .......... 20%  241K 32s
  1450K .......... .......... .......... .......... .......... 21%  287K 31s
  1500K .......... .......... .......... .......... .......... 22%  321K 30s
  1550K .......... .......... .......... .......... .......... 22%  322K 30s
  1600K .......... .......... .......... .......... .......... 23%  250K 29s
  1650K .......... .......... .......... .......... .......... 24%  322K 28s
  1700K .......... .......... .......... .......... .......... 24%  187K 28s
  1750K .......... .......... .......... .......... .......... 25% 41.4M 27s
  1800K .......... .......... .......... .......... .......... 26%  206K 27s
  1850K .......... .......... .......... .......... .......... 27%  321K 26s
  1900K .......... .......... .......... .......... .......... 27%  321K 26s
  1950K .......... .......... .......... .......... .......... 28%  321K 25s
  2000K .......... .......... .......... .......... .......... 29%  240K 25s
  2050K .......... .......... .......... .......... .......... 29%  321K 24s
  2100K .......... .......... .......... .......... .......... 30%  482K 24s
  2150K .......... .......... .......... .......... .......... 31%  322K 23s
  2200K .......... .......... .......... .......... .......... 32%  321K 23s
  2250K .......... .......... .......... .......... .......... 32%  434K 22s
  2300K .......... .......... .......... .......... .......... 33%  468K 22s
  2350K .......... .......... .......... .......... .......... 34%  321K 22s
  2400K .......... .......... .......... .......... .......... 34%  320K 21s
  2450K .......... .......... .......... .......... .......... 35%  351K 21s
  2500K .......... .......... .......... .......... .......... 36%  296K 20s
  2550K .......... .......... .......... .......... .......... 37%  350K 20s
  2600K .......... .......... .......... .......... .......... 37%  294K 20s
  2650K .......... .......... .......... .......... .......... 38%  321K 19s
  2700K .......... .......... .......... .......... .......... 39%  322K 19s
  2750K .......... .......... .......... .......... .......... 39%  321K 19s
  2800K .......... .......... .......... .......... .......... 40%  173K 19s
  2850K .......... .......... .......... .......... .......... 41%  280K 18s
  2900K .......... .......... .......... .......... .......... 42%  249K 18s
  2950K .......... .......... .......... .......... .......... 42%  250K 18s
  3000K .......... .......... .......... .......... .......... 43%  248K 18s
  3050K .......... .......... .......... .......... .......... 44%  310K 17s
  3100K .......... .......... .......... .......... .......... 44%  319K 17s
  3150K .......... .......... .......... .......... .......... 45%  293K 17s
  3200K .......... .......... .......... .......... .......... 46%  175K 17s
  3250K .......... .......... .......... .......... .......... 47%  314K 16s
  3300K .......... .......... .......... .......... .......... 47%  320K 16s
  3350K .......... .......... .......... .......... .......... 48%  310K 16s
  3400K .......... .......... .......... .......... .......... 49%  320K 15s
  3450K .......... .......... .......... .......... .......... 49%  293K 15s
  3500K .......... .......... .......... .......... .......... 50%  251K 15s
  3550K .......... .......... .......... .......... .......... 51%  321K 15s
  3600K .......... .......... .......... .......... .......... 52%  204K 14s
  3650K .......... .......... .......... .......... .......... 52%  321K 14s
  3700K .......... .......... .......... .......... .......... 53%  321K 14s
  3750K .......... .......... .......... .......... .......... 54%  224K 14s
  3800K .......... .......... .......... .......... .......... 54%  523K 13s
  3850K .......... .......... .......... .......... .......... 55%  232K 13s
  3900K .......... .......... .......... .......... .......... 56%  245K 13s
  3950K .......... .......... .......... .......... .......... 57%  252K 13s
  4000K .......... .......... .......... .......... .......... 57%  227K 13s
  4050K .......... .......... .......... .......... .......... 58%  321K 12s
  4100K .......... .......... .......... .......... .......... 59%  245K 12s
  4150K .......... .......... .......... .......... .......... 59%  321K 12s
  4200K .......... .......... .......... .......... .......... 60%  321K 12s
  4250K .......... .......... .......... .......... .......... 61%  321K 11s
  4300K .......... .......... .......... .......... .......... 61%  321K 11s
  4350K .......... .......... .......... .......... .......... 62%  321K 11s
  4400K .......... .......... .......... .......... .......... 63%  246K 11s
  4450K .......... .......... .......... .......... .......... 64%  189K 11s
  4500K .......... .......... .......... .......... .......... 64%  320K 10s
  4550K .......... .......... .......... .......... .......... 65%  249K 10s
  4600K .......... .......... .......... .......... .......... 66%  287K 10s
  4650K .......... .......... .......... .......... .......... 66%  253K 10s
  4700K .......... .......... .......... .......... .......... 67%  321K 9s
  4750K .......... .......... .......... .......... .......... 68%  321K 9s
  4800K .......... .......... .......... .......... .......... 69%  241K 9s
  4850K .......... .......... .......... .......... .......... 69%  321K 9s
  4900K .......... .......... .......... .......... .......... 70%  321K 8s
  4950K .......... .......... .......... .......... .......... 71%  322K 8s
  5000K .......... .......... .......... .......... .......... 71%  321K 8s
  5050K .......... .......... .......... .......... .......... 72%  322K 8s
  5100K .......... .......... .......... .......... .......... 73%  322K 8s
  5150K .......... .......... .......... .......... .......... 74%  322K 7s
  5200K .......... .......... .......... .......... .......... 74%  252K 7s
  5250K .......... .......... .......... .......... .......... 75%  322K 7s
  5300K .......... .......... .......... .......... .......... 76%  323K 7s
  5350K .......... .......... .......... .......... .......... 76%  321K 7s
  5400K .......... .......... .......... .......... .......... 77%  321K 6s
  5450K .......... .......... .......... .......... .......... 78%  321K 6s
  5500K .......... .......... .......... .......... .......... 79%  321K 6s
  5550K .......... .......... .......... .......... .......... 79%  442K 6s
  5600K .......... .......... .......... .......... .......... 80%  192K 5s
  5650K .......... .......... .......... .......... .......... 81%  452K 5s
  5700K .......... .......... .......... .......... .......... 81%  322K 5s
  5750K .......... .......... .......... .......... .......... 82%  361K 5s
  5800K .......... .......... .......... .......... .......... 83%  320K 5s
  5850K .......... .......... .......... .......... .......... 84%  447K 4s
  5900K .......... .......... .......... .......... .......... 84%  323K 4s
  5950K .......... .......... .......... .......... .......... 85%  323K 4s
  6000K .......... .......... .......... .......... .......... 86%  319K 4s
  6050K .......... .......... .......... .......... .......... 86%  323K 4s
  6100K .......... .......... .......... .......... .......... 87%  334K 3s
  6150K .......... .......... .......... .......... .......... 88%  436K 3s
  6200K .......... .......... .......... .......... .......... 89%  456K 3s
  6250K .......... .......... .......... .......... .......... 89%  362K 3s
  6300K .......... .......... .......... .......... .......... 90%  452K 3s
  6350K .......... .......... .......... .......... .......... 91%  332K 2s
  6400K .......... .......... .......... .......... .......... 91%  322K 2s
  6450K .......... .......... .......... .......... .......... 92%  438K 2s
  6500K .......... .......... .......... .......... .......... 93%  548K 2s
  6550K .......... .......... .......... .......... .......... 94%  455K 2s
  6600K .......... .......... .......... .......... .......... 94%  450K 1s
  6650K .......... .......... .......... .......... .......... 95%  554K 1s
  6700K .......... .......... .......... .......... .......... 96%  459K 1s
  6750K .......... .......... .......... .......... .......... 96%  447K 1s
  6800K .......... .......... .......... .......... .......... 97%  556K 1s
  6850K .......... .......... .......... .......... .......... 98%  459K 0s
  6900K .......... .......... .......... .......... .......... 99%  251K 0s
  6950K .......... .......... .......... .......... .......... 99% 42.5M 0s
  7000K .......... ......                                     100% 8.66M=26s

2020-11-05 09:19:34 (270 KB/s) - ‘linux-media.tar.bz2’ saved [7185110/7185110]

make: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
tar xfj linux-media.tar.bz2
rm -f .patches_applied .linked_dir .git_log.md5
make: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
**********************************************************
* Downloading firmwares from linuxtv.org.                *
**********************************************************
firmware/dvb-usb-vp702x-01.fw
firmware/dvb-usb-vp7045-01.fw
firmware/dvb-fe-bcm3510-01.fw
firmware/as102_data2_st.hex
firmware/dvb-usb-terratec-h7-drxk.fw
firmware/isdbt_nova_12mhz.inp
firmware/Boot.S
firmware/dvb_nova_12mhz_b0.inp
firmware/dvb-fe-xc4000-1.4.1.fw
firmware/sms1xxx-hcw-55xxx-isdbt-02.fw
firmware/sms1xxx-nova-a-dvbt-01.fw
firmware/dvb-usb-avertv-a800-02.fw
firmware/cmmb_venice_12mhz.inp
firmware/dvb-fe-xc5000c-4.1.30.7.fw
firmware/v4l-cx23418-cpu.fw
firmware/v4l-cx23885-enc-broken.fw
firmware/dvb-fe-drxj-mc-vsb-1.0.8.fw
firmware/dvb_nova_12mhz.inp
firmware/dvb-usb-dib0700-1.20.fw
firmware/tdmb_nova_12mhz.inp
firmware/as102_data1_st.hex
firmware/dvb-fe-or51132-vsb.fw
firmware/dvb-usb-it9135-02.fw
firmware/v4l-cx23418-apu.fw
firmware/dvb-ttpci-01.fw-261f
firmware/v4l-cx23418-dig.fw
firmware/dvb-ttpci-01.fw-261c
firmware/dvb-usb-bluebird-01.fw
firmware/dvb-fe-or51211.fw
firmware/dvb-fe-or51132-qam.fw
firmware/sms1xxx-stellar-dvbt-01.fw
firmware/dvb-usb-dibusb-5.0.0.11.fw
firmware/dvb-fe-drxj-mc-vsb-qam-1.0.8.fw
firmware/dvb-usb-terratec-h5-drxk.fw
firmware/dvb-usb-wt220u-02.fw
firmware/v4l-cx23885-enc.fw
firmware/dvb-ttpci-01.fw-2622
firmware/dvb-usb-wt220u-01.fw
firmware/v4l-cx25840.fw
firmware/dvb-fe-drxj-mc-1.0.8.fw
firmware/v4l-cx231xx-avcore-01.fw
firmware/dvb-usb-dtt200u-01.fw
firmware/dvb-usb-dibusb-6.0.0.8.fw
firmware/sms1xxx-nova-b-dvbt-01.fw
firmware/dvb-fe-xc5000-1.6.114.fw
firmware/cmmb_vega_12mhz.inp
firmware/dvb-usb-it9135-01.fw
firmware/isdbt_nova_12mhz_b0.inp
firmware/dvb-ttpci-01.fw-261a
firmware/dvb-ttpci-01.fw-261b
firmware/dvb-ttpci-01.fw-261d
firmware/README
firmware/isdbt_rio.inp
firmware/dvb-usb-umt-010-02.fw
firmware/sms1xxx-hcw-55xxx-dvbt-02.fw
firmware/dvb-usb-terratec-h7-az6007.fw
firmware/v4l-cx23885-avcore-01.fw
******************
* Start building *
******************
make -C <https://builder.linuxtv.org/job/media-build/ws/v4l> allyesconfig
make[1]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Applying patches for kernel 4.19.0-12-amd64
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
patch -s -f -N -p1 -i ../backports/debug.patch
patch -s -f -N -p1 -i ../backports/drx39xxj.patch
patch -s -f -N -p1 -i ../backports/v5.9_tasklet.patch
patch -s -f -N -p1 -i ../backports/v5.7_mmap_read_lock.patch
patch -s -f -N -p1 -i ../backports/v5.7_vm_map_ram.patch
patch -s -f -N -p1 -i ../backports/v5.7_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.6_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.6_const_fb_ops.patch
patch -s -f -N -p1 -i ../backports/v5.6_pm_runtime_get_if_active.patch
patch -s -f -N -p1 -i ../backports/v5.5_alsa_pcm_api_updates.patch
patch -s -f -N -p1 -i ../backports/v5.5_memtype_h.patch
patch -s -f -N -p1 -i ../backports/v5.5_dev_printk_h.patch
patch -s -f -N -p1 -i ../backports/v5.4_revert_spi_transfer.patch
patch -s -f -N -p1 -i ../backports/v5.4_dma_buf.patch
patch -s -f -N -p1 -i ../backports/v5.1_vm_map_pages.patch
patch -s -f -N -p1 -i ../backports/v5.1_devm_i2c_new_dummy_device.patch
patch -s -f -N -p1 -i ../backports/v5.0_ipu3-cio2.patch
patch -s -f -N -p1 -i ../backports/v5.0_time32.patch
patch -s -f -N -p1 -i ../backports/v4.20_access_ok.patch
Patched drivers/media/dvb-core/dvbdev.c
Patched drivers/media/v4l2-core/v4l2-dev.c
Patched drivers/media/rc/rc-main.c
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
./scripts/make_kconfig.pl /lib/modules/4.19.0-12-amd64/build /lib/modules/4.19.0-12-amd64/build 1
File not found: /lib/modules/4.19.0-12-amd64/build/.config at ./scripts/make_kconfig.pl line 33, <IN> line 4.
Preparing to compile for kernel version 4.19.0
make[1]: *** [Makefile:379: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
