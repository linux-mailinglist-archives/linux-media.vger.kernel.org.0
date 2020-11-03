Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DA62A3FC8
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 10:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgKCJQY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 3 Nov 2020 04:16:24 -0500
Received: from www.linuxtv.org ([130.149.80.248]:57916 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgKCJQV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 04:16:21 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kZsQL-00Cvuy-B9; Tue, 03 Nov 2020 09:16:17 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kZsTK-0005r5-19; Tue, 03 Nov 2020 09:19:22 +0000
Date:   Tue, 3 Nov 2020 09:19:21 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1447631724.24.1604395162027@builder.linuxtv.org>
In-Reply-To: <1249773766.23.1604308749743@builder.linuxtv.org>
References: <1249773766.23.1604308749743@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3275
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

See <https://builder.linuxtv.org/job/media-build/3275/display/redirect>

Changes:


------------------------------------------
[...truncated 4.29 KB...]
     0K .......... .......... .......... .......... ..........  0% 80.6K 86s
    50K .......... .......... .......... .......... ..........  1%  108K 75s
   100K .......... .......... .......... .......... ..........  2%  108K 71s
   150K .......... .......... .......... .......... ..........  2%  161K 63s
   200K .......... .......... .......... .......... ..........  3%  161K 59s
   250K .......... .......... .......... .......... ..........  4%  161K 56s
   300K .......... .......... .......... .......... ..........  4%  179K 53s
   350K .......... .......... .......... .......... ..........  5%  220K 49s
   400K .......... .......... .......... .......... ..........  6%  186K 48s
   450K .......... .......... .......... .......... ..........  7%  255K 45s
   500K .......... .......... .......... .......... ..........  7%  186K 44s
   550K .......... .......... .......... .......... ..........  8%  321K 41s
   600K .......... .......... .......... .......... ..........  9%  321K 39s
   650K .......... .......... .......... .......... ..........  9%  321K 38s
   700K .......... .......... .......... .......... .......... 10%  323K 36s
   750K .......... .......... .......... .......... .......... 11%  323K 35s
   800K .......... .......... .......... .......... .......... 12%  318K 34s
   850K .......... .......... .......... .......... .......... 12%  409K 32s
   900K .......... .......... .......... .......... .......... 13%  670K 31s
   950K .......... .......... .......... .......... .......... 14%  434K 30s
  1000K .......... .......... .......... .......... .......... 14%  625K 29s
  1050K .......... .......... .......... .......... .......... 15%  437K 28s
  1100K .......... .......... .......... .......... .......... 16%  435K 27s
  1150K .......... .......... .......... .......... .......... 17% 1.19M 26s
  1200K .......... .......... .......... .......... .......... 17%  434K 25s
  1250K .......... .......... .......... .......... .......... 18% 1.20M 24s
  1300K .......... .......... .......... .......... .......... 19%  437K 23s
  1350K .......... .......... .......... .......... .......... 19% 1.20M 23s
  1400K .......... .......... .......... .......... .......... 20%  437K 22s
  1450K .......... .......... .......... .......... .......... 21% 1.23M 21s
  1500K .......... .......... .......... .......... .......... 22%  436K 21s
  1550K .......... .......... .......... .......... .......... 22% 24.1M 20s
  1600K .......... .......... .......... .......... .......... 23%  420K 20s
  1650K .......... .......... .......... .......... .......... 24% 1.35M 19s
  1700K .......... .......... .......... .......... .......... 24% 1.25M 18s
  1750K .......... .......... .......... .......... .......... 25%  440K 18s
  1800K .......... .......... .......... .......... .......... 26% 1.23M 17s
  1850K .......... .......... .......... .......... .......... 27% 19.2M 17s
  1900K .......... .......... .......... .......... .......... 27%  441K 17s
  1950K .......... .......... .......... .......... .......... 28% 1.25M 16s
  2000K .......... .......... .......... .......... .......... 29% 1.17M 16s
  2050K .......... .......... .......... .......... .......... 29%  672K 15s
  2100K .......... .......... .......... .......... .......... 30% 1.23M 15s
  2150K .......... .......... .......... .......... .......... 31% 24.9M 14s
  2200K .......... .......... .......... .......... .......... 32%  443K 14s
  2250K .......... .......... .......... .......... .......... 32% 19.0M 14s
  2300K .......... .......... .......... .......... .......... 33% 1.25M 13s
  2350K .......... .......... .......... .......... .......... 34%  627K 13s
  2400K .......... .......... .......... .......... .......... 34% 1.37M 13s
  2450K .......... .......... .......... .......... .......... 35% 1.29M 12s
  2500K .......... .......... .......... .......... .......... 36% 1.20M 12s
  2550K .......... .......... .......... .......... .......... 37%  671K 12s
  2600K .......... .......... .......... .......... .......... 37% 14.9M 12s
  2650K .......... .......... .......... .......... .......... 38% 1.31M 11s
  2700K .......... .......... .......... .......... .......... 39% 1.21M 11s
  2750K .......... .......... .......... .......... .......... 39%  670K 11s
  2800K .......... .......... .......... .......... .......... 40% 13.5M 10s
  2850K .......... .......... .......... .......... .......... 41% 1.32M 10s
  2900K .......... .......... .......... .......... .......... 42% 1.22M 10s
  2950K .......... .......... .......... .......... .......... 42%  671K 10s
  3000K .......... .......... .......... .......... .......... 43% 20.1M 9s
  3050K .......... .......... .......... .......... .......... 44% 1.31M 9s
  3100K .......... .......... .......... .......... .......... 44% 19.5M 9s
  3150K .......... .......... .......... .......... .......... 45%  627K 9s
  3200K .......... .......... .......... .......... .......... 46% 1.40M 9s
  3250K .......... .......... .......... .......... .......... 47% 1.31M 8s
  3300K .......... .......... .......... .......... .......... 47% 25.5M 8s
  3350K .......... .......... .......... .......... .......... 48%  624K 8s
  3400K .......... .......... .......... .......... .......... 49% 1.44M 8s
  3450K .......... .......... .......... .......... .......... 49% 19.1M 8s
  3500K .......... .......... .......... .......... .......... 50% 1.32M 7s
  3550K .......... .......... .......... .......... .......... 51% 24.4M 7s
  3600K .......... .......... .......... .......... .......... 52%  624K 7s
  3650K .......... .......... .......... .......... .......... 52% 1.45M 7s
  3700K .......... .......... .......... .......... .......... 53% 21.1M 7s
  3750K .......... .......... .......... .......... .......... 54% 1.31M 7s
  3800K .......... .......... .......... .......... .......... 54% 20.8M 6s
  3850K .......... .......... .......... .......... .......... 55% 1.26M 6s
  3900K .......... .......... .......... .......... .......... 56%  679K 6s
  3950K .......... .......... .......... .......... .......... 57% 21.7M 6s
  4000K .......... .......... .......... .......... .......... 57% 1.32M 6s
  4050K .......... .......... .......... .......... .......... 58% 15.2M 6s
  4100K .......... .......... .......... .......... .......... 59% 1.27M 6s
  4150K .......... .......... .......... .......... .......... 59% 1.16M 5s
  4200K .......... .......... .......... .......... .......... 60% 1.47M 5s
  4250K .......... .......... .......... .......... .......... 61% 19.7M 5s
  4300K .......... .......... .......... .......... .......... 61% 1.34M 5s
  4350K .......... .......... .......... .......... .......... 62% 17.0M 5s
  4400K .......... .......... .......... .......... .......... 63% 1.26M 5s
  4450K .......... .......... .......... .......... .......... 64%  686K 5s
  4500K .......... .......... .......... .......... .......... 64% 15.9M 4s
  4550K .......... .......... .......... .......... .......... 65% 15.6M 4s
  4600K .......... .......... .......... .......... .......... 66% 1.42M 4s
  4650K .......... .......... .......... .......... .......... 66% 13.6M 4s
  4700K .......... .......... .......... .......... .......... 67% 1.29M 4s
  4750K .......... .......... .......... .......... .......... 68% 1.16M 4s
  4800K .......... .......... .......... .......... .......... 69% 1.40M 4s
  4850K .......... .......... .......... .......... .......... 69% 21.0M 4s
  4900K .......... .......... .......... .......... .......... 70% 1.44M 4s
  4950K .......... .......... .......... .......... .......... 71% 18.7M 3s
  5000K .......... .......... .......... .......... .......... 71% 14.2M 3s
  5050K .......... .......... .......... .......... .......... 72%  653K 3s
  5100K .......... .......... .......... .......... .......... 73% 1.47M 3s
  5150K .......... .......... .......... .......... .......... 74% 14.4M 3s
  5200K .......... .......... .......... .......... .......... 74% 15.7M 3s
  5250K .......... .......... .......... .......... .......... 75% 1.45M 3s
  5300K .......... .......... .......... .......... .......... 76% 15.6M 3s
  5350K .......... .......... .......... .......... .......... 76% 1.31M 3s
  5400K .......... .......... .......... .......... .......... 77% 1.16M 2s
  5450K .......... .......... .......... .......... .......... 78% 1.48M 2s
  5500K .......... .......... .......... .......... .......... 79% 15.7M 2s
  5550K .......... .......... .......... .......... .......... 79% 20.6M 2s
  5600K .......... .......... .......... .......... .......... 80% 1.42M 2s
  5650K .......... .......... .......... .......... .......... 81% 14.9M 2s
  5700K .......... .......... .......... .......... .......... 81% 1.34M 2s
  5750K .......... .......... .......... .......... .......... 82% 1.15M 2s
  5800K .......... .......... .......... .......... .......... 83% 1.51M 2s
  5850K .......... .......... .......... .......... .......... 84% 20.0M 2s
  5900K .......... .......... .......... .......... .......... 84% 16.5M 2s
  5950K .......... .......... .......... .......... .......... 85% 1.42M 2s
  6000K .......... .......... .......... .......... .......... 86% 17.4M 1s
  6050K .......... .......... .......... .......... .......... 86% 19.0M 1s
  6100K .......... .......... .......... .......... .......... 87%  662K 1s
  6150K .......... .......... .......... .......... .......... 88% 13.7M 1s
  6200K .......... .......... .......... .......... .......... 89% 1.53M 1s
  6250K .......... .......... .......... .......... .......... 89% 16.4M 1s
  6300K .......... .......... .......... .......... .......... 90% 25.0M 1s
  6350K .......... .......... .......... .......... .......... 91% 1.42M 1s
  6400K .......... .......... .......... .......... .......... 91% 15.0M 1s
  6450K .......... .......... .......... .......... .......... 92% 18.9M 1s
  6500K .......... .......... .......... .......... .......... 93%  669K 1s
  6550K .......... .......... .......... .......... .......... 94% 1.50M 1s
  6600K .......... .......... .......... .......... .......... 94% 15.0M 1s
  6650K .......... .......... .......... .......... .......... 95% 16.0M 0s
  6700K .......... .......... .......... .......... .......... 96% 19.3M 0s
  6750K .......... .......... .......... .......... .......... 96% 1.50M 0s
  6800K .......... .......... .......... .......... .......... 97% 11.7M 0s
  6850K .......... .......... .......... .......... .......... 98% 17.2M 0s
  6900K .......... .......... .......... .......... .......... 99% 1.40M 0s
  6950K .......... .......... .......... .......... .......... 99% 1.17M 0s
  7000K .......... ......                                     100% 32.1M=9.3s

2020-11-03 09:19:18 (756 KB/s) - ‘linux-media.tar.bz2’ saved [7185148/7185148]

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
