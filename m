Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622292A1497
	for <lists+linux-media@lfdr.de>; Sat, 31 Oct 2020 10:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgJaJQO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 31 Oct 2020 05:16:14 -0400
Received: from www.linuxtv.org ([130.149.80.248]:42602 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbgJaJQN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 05:16:13 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kYmzZ-008UaL-Dz; Sat, 31 Oct 2020 09:16:09 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kYn2X-0006ya-0h; Sat, 31 Oct 2020 09:19:13 +0000
Date:   Sat, 31 Oct 2020 09:19:12 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1827839544.20.1604135953013@builder.linuxtv.org>
In-Reply-To: <1831193995.19.1604049551559@builder.linuxtv.org>
References: <1831193995.19.1604049551559@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3271
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

See <https://builder.linuxtv.org/job/media-build/3271/display/redirect>

Changes:


------------------------------------------
[...truncated 4.28 KB...]
     0K .......... .......... .......... .......... ..........  0%  162K 43s
    50K .......... .......... .......... .......... ..........  1%  326K 32s
   100K .......... .......... .......... .......... ..........  2% 13.9M 21s
   150K .......... .......... .......... .......... ..........  2% 12.7M 16s
   200K .......... .......... .......... .......... ..........  3%  335K 17s
   250K .......... .......... .......... .......... ..........  4% 14.5M 14s
   300K .......... .......... .......... .......... ..........  4% 13.7M 12s
   350K .......... .......... .......... .......... ..........  5% 12.6M 10s
   400K .......... .......... .......... .......... ..........  6%  353K 11s
   450K .......... .......... .......... .......... ..........  7% 13.7M 10s
   500K .......... .......... .......... .......... ..........  7% 15.2M 9s
   550K .......... .......... .......... .......... ..........  8% 18.0M 8s
   600K .......... .......... .......... .......... ..........  9% 18.7M 8s
   650K .......... .......... .......... .......... ..........  9% 17.7M 7s
   700K .......... .......... .......... .......... .......... 10% 23.5M 7s
   750K .......... .......... .......... .......... .......... 11% 21.3M 6s
   800K .......... .......... .......... .......... .......... 12% 16.9M 6s
   850K .......... .......... .......... .......... .......... 12%  382K 6s
   900K .......... .......... .......... .......... .......... 13% 24.3M 6s
   950K .......... .......... .......... .......... .......... 14% 20.3M 6s
  1000K .......... .......... .......... .......... .......... 14% 23.3M 5s
  1050K .......... .......... .......... .......... .......... 15% 20.7M 5s
  1100K .......... .......... .......... .......... .......... 16% 16.7M 5s
  1150K .......... .......... .......... .......... .......... 17% 20.9M 5s
  1200K .......... .......... .......... .......... .......... 17% 14.0M 4s
  1250K .......... .......... .......... .......... .......... 18% 21.4M 4s
  1300K .......... .......... .......... .......... .......... 19% 21.6M 4s
  1350K .......... .......... .......... .......... .......... 19% 19.9M 4s
  1400K .......... .......... .......... .......... .......... 20% 21.8M 4s
  1450K .......... .......... .......... .......... .......... 21% 20.0M 4s
  1500K .......... .......... .......... .......... .......... 22% 20.6M 3s
  1550K .......... .......... .......... .......... .......... 22% 22.7M 3s
  1600K .......... .......... .......... .......... .......... 23% 6.81M 3s
  1650K .......... .......... .......... .......... .......... 24% 21.5M 3s
  1700K .......... .......... .......... .......... .......... 24% 21.9M 3s
  1750K .......... .......... .......... .......... .......... 25%  463K 3s
  1800K .......... .......... .......... .......... .......... 26% 26.2M 3s
  1850K .......... .......... .......... .......... .......... 27% 23.4M 3s
  1900K .......... .......... .......... .......... .......... 27% 28.9M 3s
  1950K .......... .......... .......... .......... .......... 28% 25.7M 3s
  2000K .......... .......... .......... .......... .......... 29% 24.6M 3s
  2050K .......... .......... .......... .......... .......... 29% 26.0M 3s
  2100K .......... .......... .......... .......... .......... 30% 28.8M 2s
  2150K .......... .......... .......... .......... .......... 31% 33.9M 2s
  2200K .......... .......... .......... .......... .......... 32% 30.6M 2s
  2250K .......... .......... .......... .......... .......... 32% 33.1M 2s
  2300K .......... .......... .......... .......... .......... 33% 30.0M 2s
  2350K .......... .......... .......... .......... .......... 34% 27.1M 2s
  2400K .......... .......... .......... .......... .......... 34% 20.9M 2s
  2450K .......... .......... .......... .......... .......... 35% 27.3M 2s
  2500K .......... .......... .......... .......... .......... 36% 27.1M 2s
  2550K .......... .......... .......... .......... .......... 37% 7.28M 2s
  2600K .......... .......... .......... .......... .......... 37% 27.1M 2s
  2650K .......... .......... .......... .......... .......... 38% 24.8M 2s
  2700K .......... .......... .......... .......... .......... 39% 25.0M 2s
  2750K .......... .......... .......... .......... .......... 39% 20.1M 2s
  2800K .......... .......... .......... .......... .......... 40% 18.7M 2s
  2850K .......... .......... .......... .......... .......... 41% 19.5M 2s
  2900K .......... .......... .......... .......... .......... 42%  465K 2s
  2950K .......... .......... .......... .......... .......... 42% 27.9M 2s
  3000K .......... .......... .......... .......... .......... 43% 23.2M 2s
  3050K .......... .......... .......... .......... .......... 44% 26.7M 2s
  3100K .......... .......... .......... .......... .......... 44% 27.9M 2s
  3150K .......... .......... .......... .......... .......... 45% 21.0M 1s
  3200K .......... .......... .......... .......... .......... 46% 18.0M 1s
  3250K .......... .......... .......... .......... .......... 47% 22.2M 1s
  3300K .......... .......... .......... .......... .......... 47% 19.6M 1s
  3350K .......... .......... .......... .......... .......... 48% 30.5M 1s
  3400K .......... .......... .......... .......... .......... 49% 21.4M 1s
  3450K .......... .......... .......... .......... .......... 49% 21.8M 1s
  3500K .......... .......... .......... .......... .......... 50% 21.7M 1s
  3550K .......... .......... .......... .......... .......... 51% 20.8M 1s
  3600K .......... .......... .......... .......... .......... 52% 19.8M 1s
  3650K .......... .......... .......... .......... .......... 52% 21.6M 1s
  3700K .......... .......... .......... .......... .......... 53% 28.9M 1s
  3750K .......... .......... .......... .......... .......... 54% 12.4M 1s
  3800K .......... .......... .......... .......... .......... 54% 90.0M 1s
  3850K .......... .......... .......... .......... .......... 55% 40.2M 1s
  3900K .......... .......... .......... .......... .......... 56% 26.6M 1s
  3950K .......... .......... .......... .......... .......... 57% 21.4M 1s
  4000K .......... .......... .......... .......... .......... 57% 11.7M 1s
  4050K .......... .......... .......... .......... .......... 58%  478K 1s
  4100K .......... .......... .......... .......... .......... 59% 30.9M 1s
  4150K .......... .......... .......... .......... .......... 59% 26.6M 1s
  4200K .......... .......... .......... .......... .......... 60% 30.7M 1s
  4250K .......... .......... .......... .......... .......... 61% 26.4M 1s
  4300K .......... .......... .......... .......... .......... 61% 26.6M 1s
  4350K .......... .......... .......... .......... .......... 62% 21.7M 1s
  4400K .......... .......... .......... .......... .......... 63% 18.9M 1s
  4450K .......... .......... .......... .......... .......... 64% 25.1M 1s
  4500K .......... .......... .......... .......... .......... 64% 19.4M 1s
  4550K .......... .......... .......... .......... .......... 65% 35.4M 1s
  4600K .......... .......... .......... .......... .......... 66% 22.9M 1s
  4650K .......... .......... .......... .......... .......... 66% 23.6M 1s
  4700K .......... .......... .......... .......... .......... 67% 19.6M 1s
  4750K .......... .......... .......... .......... .......... 68% 26.9M 1s
  4800K .......... .......... .......... .......... .......... 69% 19.0M 1s
  4850K .......... .......... .......... .......... .......... 69% 7.26M 1s
  4900K .......... .......... .......... .......... .......... 70%  148M 1s
  4950K .......... .......... .......... .......... .......... 71%  166M 1s
  5000K .......... .......... .......... .......... .......... 71% 19.5M 1s
  5050K .......... .......... .......... .......... .......... 72% 34.7M 1s
  5100K .......... .......... .......... .......... .......... 73% 32.8M 1s
  5150K .......... .......... .......... .......... .......... 74% 30.3M 0s
  5200K .......... .......... .......... .......... .......... 74% 22.9M 0s
  5250K .......... .......... .......... .......... .......... 75% 16.0M 0s
  5300K .......... .......... .......... .......... .......... 76%  479K 0s
  5350K .......... .......... .......... .......... .......... 76% 37.5M 0s
  5400K .......... .......... .......... .......... .......... 77% 23.7M 0s
  5450K .......... .......... .......... .......... .......... 78% 60.9M 0s
  5500K .......... .......... .......... .......... .......... 79% 24.3M 0s
  5550K .......... .......... .......... .......... .......... 79% 21.7M 0s
  5600K .......... .......... .......... .......... .......... 80% 16.7M 0s
  5650K .......... .......... .......... .......... .......... 81% 8.15M 0s
  5700K .......... .......... .......... .......... .......... 81%  101M 0s
  5750K .......... .......... .......... .......... .......... 82% 66.1M 0s
  5800K .......... .......... .......... .......... .......... 83% 83.9M 0s
  5850K .......... .......... .......... .......... .......... 84% 35.8M 0s
  5900K .......... .......... .......... .......... .......... 84% 30.4M 0s
  5950K .......... .......... .......... .......... .......... 85% 28.4M 0s
  6000K .......... .......... .......... .......... .......... 86% 18.3M 0s
  6050K .......... .......... .......... .......... .......... 86% 13.9M 0s
  6100K .......... .......... .......... .......... .......... 87% 75.4M 0s
  6150K .......... .......... .......... .......... .......... 88% 4.14M 0s
  6200K .......... .......... .......... .......... .......... 89%  134M 0s
  6250K .......... .......... .......... .......... .......... 89%  150M 0s
  6300K .......... .......... .......... .......... .......... 90%  131M 0s
  6350K .......... .......... .......... .......... .......... 91%  147M 0s
  6400K .......... .......... .......... .......... .......... 91% 29.2M 0s
  6450K .......... .......... .......... .......... .......... 92% 34.8M 0s
  6500K .......... .......... .......... .......... .......... 93% 34.2M 0s
  6550K .......... .......... .......... .......... .......... 94% 30.0M 0s
  6600K .......... .......... .......... .......... .......... 94% 1.15M 0s
  6650K .......... .......... .......... .......... .......... 95%  793K 0s
  6700K .......... .......... .......... .......... .......... 96% 21.4M 0s
  6750K .......... .......... .......... .......... .......... 96% 28.3M 0s
  6800K .......... .......... .......... .......... .......... 97% 26.4M 0s
  6850K .......... .......... .......... .......... .......... 98% 33.1M 0s
  6900K .......... .......... .......... .......... .......... 99% 39.9M 0s
  6950K .......... .......... .......... .......... .......... 99% 22.0M 0s
  7000K .......... ......                                     100%  104M=1.7s

2020-10-31 09:19:10 (4.02 MB/s) - ‘linux-media.tar.bz2’ saved [7185115/7185115]

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
