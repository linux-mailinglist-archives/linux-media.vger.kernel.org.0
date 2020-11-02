Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD352A25C3
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 09:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbgKBIBY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 2 Nov 2020 03:01:24 -0500
Received: from www.linuxtv.org ([130.149.80.248]:56052 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727802AbgKBIBY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Nov 2020 03:01:24 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kZUmI-00BOeh-Gp; Mon, 02 Nov 2020 08:01:22 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kZUpG-0001GQ-WA; Mon, 02 Nov 2020 08:04:27 +0000
Date:   Mon, 2 Nov 2020 08:04:26 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1888550146.22.1604304266987@builder.linuxtv.org>
In-Reply-To: <1918716411.21.1604222353354@builder.linuxtv.org>
References: <1918716411.21.1604222353354@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3273
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

See <https://builder.linuxtv.org/job/media-build/3273/display/redirect?page=changes>

Changes:

[hverkuil-cisco] STACK_FRAME_NON_STANDARD is now in objtool.h


------------------------------------------
[...truncated 4.30 KB...]
     0K .......... .......... .......... .......... ..........  0%  108K 65s
    50K .......... .......... .......... .......... ..........  1%  162K 53s
   100K .......... .......... .......... .......... ..........  2%  255K 44s
   150K .......... .......... .......... .......... ..........  2%  187K 42s
   200K .......... .......... .......... .......... ..........  3%  163K 42s
   250K .......... .......... .......... .......... ..........  4%  321K 38s
   300K .......... .......... .......... .......... ..........  4%  255K 36s
   350K .......... .......... .......... .......... ..........  5%  209K 35s
   400K .......... .......... .......... .......... ..........  6%  271K 34s
   450K .......... .......... .......... .......... ..........  7%  323K 32s
   500K .......... .......... .......... .......... ..........  7%  260K 31s
   550K .......... .......... .......... .......... ..........  8%  324K 30s
   600K .......... .......... .......... .......... ..........  9%  324K 29s
   650K .......... .......... .......... .......... ..........  9%  428K 28s
   700K .......... .......... .......... .......... .......... 10%  326K 27s
   750K .......... .......... .......... .......... .......... 11%  326K 26s
   800K .......... .......... .......... .......... .......... 12%  325K 26s
   850K .......... .......... .......... .......... .......... 12%  404K 25s
   900K .......... .......... .......... .......... .......... 13%  450K 24s
   950K .......... .......... .......... .......... .......... 14%  671K 23s
  1000K .......... .......... .......... .......... .......... 14%  328K 23s
  1050K .......... .......... .......... .......... .......... 15%  610K 22s
  1100K .......... .......... .......... .......... .......... 16%  678K 21s
  1150K .......... .......... .......... .......... .......... 17%  329K 21s
  1200K .......... .......... .......... .......... .......... 17%  603K 20s
  1250K .......... .......... .......... .......... .......... 18%  683K 20s
  1300K .......... .......... .......... .......... .......... 19%  408K 19s
  1350K .......... .......... .......... .......... .......... 19%  719K 19s
  1400K .......... .......... .......... .......... .......... 20%  435K 18s
  1450K .......... .......... .......... .......... .......... 21% 1.21M 18s
  1500K .......... .......... .......... .......... .......... 22%  437K 17s
  1550K .......... .......... .......... .......... .......... 22% 1.23M 17s
  1600K .......... .......... .......... .......... .......... 23%  434K 17s
  1650K .......... .......... .......... .......... .......... 24%  625K 16s
  1700K .......... .......... .......... .......... .......... 24%  685K 16s
  1750K .......... .......... .......... .......... .......... 25% 1.23M 15s
  1800K .......... .......... .......... .......... .......... 26%  441K 15s
  1850K .......... .......... .......... .......... .......... 27% 1.22M 15s
  1900K .......... .......... .......... .......... .......... 27% 1.09M 14s
  1950K .......... .......... .......... .......... .......... 28%  677K 14s
  2000K .......... .......... .......... .......... .......... 29%  634K 14s
  2050K .......... .......... .......... .......... .......... 29%  682K 13s
  2100K .......... .......... .......... .......... .......... 30%  637K 13s
  2150K .......... .......... .......... .......... .......... 31%  692K 13s
  2200K .......... .......... .......... .......... .......... 32% 8.64M 12s
  2250K .......... .......... .......... .......... .......... 32%  636K 12s
  2300K .......... .......... .......... .......... .......... 33%  703K 12s
  2350K .......... .......... .......... .......... .......... 34% 1.22M 12s
  2400K .......... .......... .......... .......... .......... 34% 1.10M 11s
  2450K .......... .......... .......... .......... .......... 35%  709K 11s
  2500K .......... .......... .......... .......... .......... 36% 1.22M 11s
  2550K .......... .......... .......... .......... .......... 37% 1.12M 11s
  2600K .......... .......... .......... .......... .......... 37%  711K 10s
  2650K .......... .......... .......... .......... .......... 38% 1.20M 10s
  2700K .......... .......... .......... .......... .......... 39% 1.14M 10s
  2750K .......... .......... .......... .......... .......... 39%  732K 10s
  2800K .......... .......... .......... .......... .......... 40% 1.19M 10s
  2850K .......... .......... .......... .......... .......... 41% 1.13M 9s
  2900K .......... .......... .......... .......... .......... 42% 1.20M 9s
  2950K .......... .......... .......... .......... .......... 42% 1.47M 9s
  3000K .......... .......... .......... .......... .......... 43% 1.24M 9s
  3050K .......... .......... .......... .......... .......... 44% 1.14M 8s
  3100K .......... .......... .......... .......... .......... 44% 1.22M 8s
  3150K .......... .......... .......... .......... .......... 45% 1.49M 8s
  3200K .......... .......... .......... .......... .......... 46% 1.21M 8s
  3250K .......... .......... .......... .......... .......... 47% 1.15M 8s
  3300K .......... .......... .......... .......... .......... 47%  744K 8s
  3350K .......... .......... .......... .......... .......... 48% 10.6M 7s
  3400K .......... .......... .......... .......... .......... 49% 1.27M 7s
  3450K .......... .......... .......... .......... .......... 49% 1.12M 7s
  3500K .......... .......... .......... .......... .......... 50% 1.29M 7s
  3550K .......... .......... .......... .......... .......... 51% 1.47M 7s
  3600K .......... .......... .......... .......... .......... 52% 1.27M 7s
  3650K .......... .......... .......... .......... .......... 52% 1.14M 6s
  3700K .......... .......... .......... .......... .......... 53% 8.00M 6s
  3750K .......... .......... .......... .......... .......... 54%  765K 6s
  3800K .......... .......... .......... .......... .......... 54% 11.0M 6s
  3850K .......... .......... .......... .......... .......... 55% 1.30M 6s
  3900K .......... .......... .......... .......... .......... 56% 1.17M 6s
  3950K .......... .......... .......... .......... .......... 57% 1.29M 6s
  4000K .......... .......... .......... .......... .......... 57% 1.42M 5s
  4050K .......... .......... .......... .......... .......... 58% 1.35M 5s
  4100K .......... .......... .......... .......... .......... 59% 9.24M 5s
  4150K .......... .......... .......... .......... .......... 59% 1.16M 5s
  4200K .......... .......... .......... .......... .......... 60% 1.31M 5s
  4250K .......... .......... .......... .......... .......... 61% 1.45M 5s
  4300K .......... .......... .......... .......... .......... 61% 10.6M 5s
  4350K .......... .......... .......... .......... .......... 62% 1.39M 5s
  4400K .......... .......... .......... .......... .......... 63% 1.14M 4s
  4450K .......... .......... .......... .......... .......... 64% 1.33M 4s
  4500K .......... .......... .......... .......... .......... 64% 1.48M 4s
  4550K .......... .......... .......... .......... .......... 65% 5.54M 4s
  4600K .......... .......... .......... .......... .......... 66% 1.55M 4s
  4650K .......... .......... .......... .......... .......... 66% 1.21M 4s
  4700K .......... .......... .......... .......... .......... 67% 8.79M 4s
  4750K .......... .......... .......... .......... .......... 68% 1.34M 4s
  4800K .......... .......... .......... .......... .......... 69% 1.20M 4s
  4850K .......... .......... .......... .......... .......... 69% 1.79M 3s
  4900K .......... .......... .......... .......... .......... 70% 8.49M 3s
  4950K .......... .......... .......... .......... .......... 71% 1.25M 3s
  5000K .......... .......... .......... .......... .......... 71% 8.26M 3s
  5050K .......... .......... .......... .......... .......... 72%  792K 3s
  5100K .......... .......... .......... .......... .......... 73% 3.83M 3s
  5150K .......... .......... .......... .......... .......... 74% 10.7M 3s
  5200K .......... .......... .......... .......... .......... 74% 1.71M 3s
  5250K .......... .......... .......... .......... .......... 75% 1.26M 3s
  5300K .......... .......... .......... .......... .......... 76% 9.09M 3s
  5350K .......... .......... .......... .......... .......... 76%  777K 2s
  5400K .......... .......... .......... .......... .......... 77% 4.49M 2s
  5450K .......... .......... .......... .......... .......... 78% 9.03M 2s
  5500K .......... .......... .......... .......... .......... 79% 1.83M 2s
  5550K .......... .......... .......... .......... .......... 79% 13.1M 2s
  5600K .......... .......... .......... .......... .......... 80% 1.18M 2s
  5650K .......... .......... .......... .......... .......... 81% 1.36M 2s
  5700K .......... .......... .......... .......... .......... 81% 1.43M 2s
  5750K .......... .......... .......... .......... .......... 82% 5.40M 2s
  5800K .......... .......... .......... .......... .......... 83% 10.2M 2s
  5850K .......... .......... .......... .......... .......... 84% 1.74M 2s
  5900K .......... .......... .......... .......... .......... 84% 1.29M 2s
  5950K .......... .......... .......... .......... .......... 85% 11.8M 1s
  6000K .......... .......... .......... .......... .......... 86% 1.31M 1s
  6050K .......... .......... .......... .......... .......... 86% 1.45M 1s
  6100K .......... .......... .......... .......... .......... 87% 5.75M 1s
  6150K .......... .......... .......... .......... .......... 88% 10.2M 1s
  6200K .......... .......... .......... .......... .......... 89% 1.80M 1s
  6250K .......... .......... .......... .......... .......... 89% 1.28M 1s
  6300K .......... .......... .......... .......... .......... 90% 11.7M 1s
  6350K .......... .......... .......... .......... .......... 91% 10.7M 1s
  6400K .......... .......... .......... .......... .......... 91%  768K 1s
  6450K .......... .......... .......... .......... .......... 92% 5.45M 1s
  6500K .......... .......... .......... .......... .......... 93% 11.0M 1s
  6550K .......... .......... .......... .......... .......... 94% 1.88M 1s
  6600K .......... .......... .......... .......... .......... 94% 8.56M 0s
  6650K .......... .......... .......... .......... .......... 95% 1.31M 0s
  6700K .......... .......... .......... .......... .......... 96% 13.1M 0s
  6750K .......... .......... .......... .......... .......... 96% 1.37M 0s
  6800K .......... .......... .......... .......... .......... 97% 1.43M 0s
  6850K .......... .......... .......... .......... .......... 98% 6.22M 0s
  6900K .......... .......... .......... .......... .......... 99% 11.8M 0s
  6950K .......... .......... .......... .......... .......... 99% 1.86M 0s
  7000K .......... ......                                     100% 15.3M=8.8s

2020-11-02 08:04:24 (795 KB/s) - ‘linux-media.tar.bz2’ saved [7185096/7185096]

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
