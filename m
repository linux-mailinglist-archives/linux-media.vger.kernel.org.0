Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B442A1CC8
	for <lists+linux-media@lfdr.de>; Sun,  1 Nov 2020 10:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgKAJQR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 1 Nov 2020 04:16:17 -0500
Received: from www.linuxtv.org ([130.149.80.248]:43092 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726117AbgKAJQN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 04:16:13 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kZ9T7-00A0Pb-1B; Sun, 01 Nov 2020 09:16:09 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kZ9W5-0006RY-Bz; Sun, 01 Nov 2020 09:19:13 +0000
Date:   Sun, 1 Nov 2020 09:19:13 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1918716411.21.1604222353354@builder.linuxtv.org>
In-Reply-To: <1827839544.20.1604135953013@builder.linuxtv.org>
References: <1827839544.20.1604135953013@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3272
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

See <https://builder.linuxtv.org/job/media-build/3272/display/redirect>

Changes:


------------------------------------------
[...truncated 4.27 KB...]
     0K .......... .......... .......... .......... ..........  0%  161K 43s
    50K .......... .......... .......... .......... ..........  1%  324K 32s
   100K .......... .......... .......... .......... ..........  2% 12.9M 21s
   150K .......... .......... .......... .......... ..........  2% 12.4M 16s
   200K .......... .......... .......... .......... ..........  3%  335K 17s
   250K .......... .......... .......... .......... ..........  4% 12.7M 14s
   300K .......... .......... .......... .......... ..........  4% 12.7M 12s
   350K .......... .......... .......... .......... ..........  5% 12.5M 10s
   400K .......... .......... .......... .......... ..........  6%  353K 11s
   450K .......... .......... .......... .......... ..........  7% 12.9M 10s
   500K .......... .......... .......... .......... ..........  7% 15.2M 9s
   550K .......... .......... .......... .......... ..........  8% 17.6M 8s
   600K .......... .......... .......... .......... ..........  9% 15.5M 8s
   650K .......... .......... .......... .......... ..........  9% 18.7M 7s
   700K .......... .......... .......... .......... .......... 10% 19.9M 7s
   750K .......... .......... .......... .......... .......... 11% 19.7M 6s
   800K .......... .......... .......... .......... .......... 12% 15.9M 6s
   850K .......... .......... .......... .......... .......... 12%  383K 6s
   900K .......... .......... .......... .......... .......... 13% 21.1M 6s
   950K .......... .......... .......... .......... .......... 14% 20.8M 6s
  1000K .......... .......... .......... .......... .......... 14% 19.8M 5s
  1050K .......... .......... .......... .......... .......... 15% 17.9M 5s
  1100K .......... .......... .......... .......... .......... 16% 17.9M 5s
  1150K .......... .......... .......... .......... .......... 17% 19.2M 5s
  1200K .......... .......... .......... .......... .......... 17% 13.6M 4s
  1250K .......... .......... .......... .......... .......... 18% 20.2M 4s
  1300K .......... .......... .......... .......... .......... 19% 22.1M 4s
  1350K .......... .......... .......... .......... .......... 19% 23.6M 4s
  1400K .......... .......... .......... .......... .......... 20% 22.6M 4s
  1450K .......... .......... .......... .......... .......... 21% 21.1M 4s
  1500K .......... .......... .......... .......... .......... 22% 23.1M 3s
  1550K .......... .......... .......... .......... .......... 22% 3.83M 3s
  1600K .......... .......... .......... .......... .......... 23% 17.0M 3s
  1650K .......... .......... .......... .......... .......... 24% 21.1M 3s
  1700K .......... .......... .......... .......... .......... 24% 21.7M 3s
  1750K .......... .......... .......... .......... .......... 25%  488K 3s
  1800K .......... .......... .......... .......... .......... 26% 26.6M 3s
  1850K .......... .......... .......... .......... .......... 27% 24.9M 3s
  1900K .......... .......... .......... .......... .......... 27% 28.6M 3s
  1950K .......... .......... .......... .......... .......... 28% 23.8M 3s
  2000K .......... .......... .......... .......... .......... 29% 21.9M 3s
  2050K .......... .......... .......... .......... .......... 29% 30.5M 3s
  2100K .......... .......... .......... .......... .......... 30% 24.8M 2s
  2150K .......... .......... .......... .......... .......... 31% 25.2M 2s
  2200K .......... .......... .......... .......... .......... 32% 27.0M 2s
  2250K .......... .......... .......... .......... .......... 32% 29.2M 2s
  2300K .......... .......... .......... .......... .......... 33% 36.4M 2s
  2350K .......... .......... .......... .......... .......... 34% 29.7M 2s
  2400K .......... .......... .......... .......... .......... 34% 22.0M 2s
  2450K .......... .......... .......... .......... .......... 35% 28.3M 2s
  2500K .......... .......... .......... .......... .......... 36% 33.4M 2s
  2550K .......... .......... .......... .......... .......... 37% 21.7M 2s
  2600K .......... .......... .......... .......... .......... 37% 20.8M 2s
  2650K .......... .......... .......... .......... .......... 38% 8.19M 2s
  2700K .......... .......... .......... .......... .......... 39% 5.70M 2s
  2750K .......... .......... .......... .......... .......... 39% 27.2M 2s
  2800K .......... .......... .......... .......... .......... 40% 16.3M 2s
  2850K .......... .......... .......... .......... .......... 41% 23.0M 2s
  2900K .......... .......... .......... .......... .......... 42%  489K 2s
  2950K .......... .......... .......... .......... .......... 42% 27.8M 2s
  3000K .......... .......... .......... .......... .......... 43% 28.6M 2s
  3050K .......... .......... .......... .......... .......... 44% 31.6M 2s
  3100K .......... .......... .......... .......... .......... 44% 25.0M 2s
  3150K .......... .......... .......... .......... .......... 45% 25.7M 1s
  3200K .......... .......... .......... .......... .......... 46% 25.9M 1s
  3250K .......... .......... .......... .......... .......... 47% 28.8M 1s
  3300K .......... .......... .......... .......... .......... 47% 9.86M 1s
  3350K .......... .......... .......... .......... .......... 48%  114M 1s
  3400K .......... .......... .......... .......... .......... 49% 94.3M 1s
  3450K .......... .......... .......... .......... .......... 49% 73.5M 1s
  3500K .......... .......... .......... .......... .......... 50% 28.1M 1s
  3550K .......... .......... .......... .......... .......... 51% 30.7M 1s
  3600K .......... .......... .......... .......... .......... 52% 24.1M 1s
  3650K .......... .......... .......... .......... .......... 52% 31.0M 1s
  3700K .......... .......... .......... .......... .......... 53% 27.5M 1s
  3750K .......... .......... .......... .......... .......... 54% 28.3M 1s
  3800K .......... .......... .......... .......... .......... 54% 6.42M 1s
  3850K .......... .......... .......... .......... .......... 55% 6.58M 1s
  3900K .......... .......... .......... .......... .......... 56% 22.8M 1s
  3950K .......... .......... .......... .......... .......... 57% 29.8M 1s
  4000K .......... .......... .......... .......... .......... 57% 16.9M 1s
  4050K .......... .......... .......... .......... .......... 58%  487K 1s
  4100K .......... .......... .......... .......... .......... 59% 45.4M 1s
  4150K .......... .......... .......... .......... .......... 59% 28.8M 1s
  4200K .......... .......... .......... .......... .......... 60% 30.0M 1s
  4250K .......... .......... .......... .......... .......... 61% 33.2M 1s
  4300K .......... .......... .......... .......... .......... 61% 23.9M 1s
  4350K .......... .......... .......... .......... .......... 62% 30.9M 1s
  4400K .......... .......... .......... .......... .......... 63% 21.2M 1s
  4450K .......... .......... .......... .......... .......... 64% 20.6M 1s
  4500K .......... .......... .......... .......... .......... 64% 12.2M 1s
  4550K .......... .......... .......... .......... .......... 65% 24.5M 1s
  4600K .......... .......... .......... .......... .......... 66% 22.0M 1s
  4650K .......... .......... .......... .......... .......... 66% 22.9M 1s
  4700K .......... .......... .......... .......... .......... 67% 20.1M 1s
  4750K .......... .......... .......... .......... .......... 68% 30.5M 1s
  4800K .......... .......... .......... .......... .......... 69% 17.5M 1s
  4850K .......... .......... .......... .......... .......... 69% 32.1M 1s
  4900K .......... .......... .......... .......... .......... 70% 32.5M 1s
  4950K .......... .......... .......... .......... .......... 71% 30.6M 1s
  5000K .......... .......... .......... .......... .......... 71% 28.1M 1s
  5050K .......... .......... .......... .......... .......... 72% 33.7M 1s
  5100K .......... .......... .......... .......... .......... 73% 7.28M 1s
  5150K .......... .......... .......... .......... .......... 74% 25.8M 1s
  5200K .......... .......... .......... .......... .......... 74% 23.7M 0s
  5250K .......... .......... .......... .......... .......... 75% 22.3M 0s
  5300K .......... .......... .......... .......... .......... 76%  885K 0s
  5350K .......... .......... .......... .......... .......... 76% 1.03M 0s
  5400K .......... .......... .......... .......... .......... 77% 28.0M 0s
  5450K .......... .......... .......... .......... .......... 78% 32.9M 0s
  5500K .......... .......... .......... .......... .......... 79% 33.8M 0s
  5550K .......... .......... .......... .......... .......... 79% 30.5M 0s
  5600K .......... .......... .......... .......... .......... 80% 23.7M 0s
  5650K .......... .......... .......... .......... .......... 81% 29.0M 0s
  5700K .......... .......... .......... .......... .......... 81% 25.7M 0s
  5750K .......... .......... .......... .......... .......... 82% 28.1M 0s
  5800K .......... .......... .......... .......... .......... 83% 11.2M 0s
  5850K .......... .......... .......... .......... .......... 84% 28.3M 0s
  5900K .......... .......... .......... .......... .......... 84% 21.6M 0s
  5950K .......... .......... .......... .......... .......... 85% 21.6M 0s
  6000K .......... .......... .......... .......... .......... 86% 21.3M 0s
  6050K .......... .......... .......... .......... .......... 86% 24.7M 0s
  6100K .......... .......... .......... .......... .......... 87% 27.1M 0s
  6150K .......... .......... .......... .......... .......... 88% 32.9M 0s
  6200K .......... .......... .......... .......... .......... 89% 30.0M 0s
  6250K .......... .......... .......... .......... .......... 89% 42.2M 0s
  6300K .......... .......... .......... .......... .......... 90% 24.2M 0s
  6350K .......... .......... .......... .......... .......... 91% 41.0M 0s
  6400K .......... .......... .......... .......... .......... 91% 6.82M 0s
  6450K .......... .......... .......... .......... .......... 92% 33.9M 0s
  6500K .......... .......... .......... .......... .......... 93% 24.8M 0s
  6550K .......... .......... .......... .......... .......... 94% 6.32M 0s
  6600K .......... .......... .......... .......... .......... 94% 5.68M 0s
  6650K .......... .......... .......... .......... .......... 95%  558K 0s
  6700K .......... .......... .......... .......... .......... 96% 31.5M 0s
  6750K .......... .......... .......... .......... .......... 96% 34.9M 0s
  6800K .......... .......... .......... .......... .......... 97% 25.0M 0s
  6850K .......... .......... .......... .......... .......... 98% 31.6M 0s
  6900K .......... .......... .......... .......... .......... 99% 39.2M 0s
  6950K .......... .......... .......... .......... .......... 99% 40.1M 0s
  7000K .......... ......                                     100% 37.1M=1.7s

2020-11-01 09:19:10 (4.00 MB/s) - ‘linux-media.tar.bz2’ saved [7185093/7185093]

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
