Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9CD35AC4D
	for <lists+linux-media@lfdr.de>; Sat, 10 Apr 2021 11:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhDJJP1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 10 Apr 2021 05:15:27 -0400
Received: from www.linuxtv.org ([130.149.80.248]:38710 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhDJJP0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Apr 2021 05:15:26 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lV9hs-002PzO-Mm; Sat, 10 Apr 2021 09:15:09 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lV9lu-0000uA-37; Sat, 10 Apr 2021 09:19:18 +0000
Date:   Sat, 10 Apr 2021 09:19:17 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1341968573.6.1618046358048@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3459
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

See <https://builder.linuxtv.org/job/media-build/3459/display/redirect>

Changes:


------------------------------------------
[...truncated 5.15 KB...]
    50K .......... .......... .......... .......... ..........  1%  324K 33s
   100K .......... .......... .......... .......... ..........  2% 14.1M 22s
   150K .......... .......... .......... .......... ..........  2% 1.27M 18s
   200K .......... .......... .......... .......... ..........  3%  434K 17s
   250K .......... .......... .......... .......... ..........  4% 16.3M 14s
   300K .......... .......... .......... .......... ..........  4% 17.4M 12s
   350K .......... .......... .......... .......... ..........  5% 11.5M 11s
   400K .......... .......... .......... .......... ..........  6%  349K 11s
   450K .......... .......... .......... .......... ..........  7% 17.0M 10s
   500K .......... .......... .......... .......... ..........  7% 18.1M 9s
   550K .......... .......... .......... .......... ..........  8% 24.0M 8s
   600K .......... .......... .......... .......... ..........  9% 21.4M 8s
   650K .......... .......... .......... .......... ..........  9% 20.8M 7s
   700K .......... .......... .......... .......... .......... 10% 19.7M 7s
   750K .......... .......... .......... .......... .......... 11% 19.3M 6s
   800K .......... .......... .......... .......... .......... 11% 2.06M 6s
   850K .......... .......... .......... .......... .......... 12%  442K 6s
   900K .......... .......... .......... .......... .......... 13% 25.7M 6s
   950K .......... .......... .......... .......... .......... 14% 24.7M 6s
  1000K .......... .......... .......... .......... .......... 14% 22.7M 5s
  1050K .......... .......... .......... .......... .......... 15% 36.8M 5s
  1100K .......... .......... .......... .......... .......... 16% 31.7M 5s
  1150K .......... .......... .......... .......... .......... 16% 31.1M 5s
  1200K .......... .......... .......... .......... .......... 17% 21.1M 4s
  1250K .......... .......... .......... .......... .......... 18% 35.4M 4s
  1300K .......... .......... .......... .......... .......... 18% 34.5M 4s
  1350K .......... .......... .......... .......... .......... 19% 26.6M 4s
  1400K .......... .......... .......... .......... .......... 20% 26.2M 4s
  1450K .......... .......... .......... .......... .......... 21% 29.3M 4s
  1500K .......... .......... .......... .......... .......... 21% 27.1M 3s
  1550K .......... .......... .......... .......... .......... 22% 26.2M 3s
  1600K .......... .......... .......... .......... .......... 23% 24.6M 3s
  1650K .......... .......... .......... .......... .......... 23% 29.1M 3s
  1700K .......... .......... .......... .......... .......... 24% 3.55M 3s
  1750K .......... .......... .......... .......... .......... 25%  447K 3s
  1800K .......... .......... .......... .......... .......... 26% 35.7M 3s
  1850K .......... .......... .......... .......... .......... 26% 43.5M 3s
  1900K .......... .......... .......... .......... .......... 27% 46.1M 3s
  1950K .......... .......... .......... .......... .......... 28% 46.2M 3s
  2000K .......... .......... .......... .......... .......... 28% 30.5M 3s
  2050K .......... .......... .......... .......... .......... 29% 38.0M 3s
  2100K .......... .......... .......... .......... .......... 30% 44.5M 3s
  2150K .......... .......... .......... .......... .......... 30% 44.8M 2s
  2200K .......... .......... .......... .......... .......... 31% 47.6M 2s
  2250K .......... .......... .......... .......... .......... 32% 43.5M 2s
  2300K .......... .......... .......... .......... .......... 33% 51.3M 2s
  2350K .......... .......... .......... .......... .......... 33% 38.4M 2s
  2400K .......... .......... .......... .......... .......... 34% 38.5M 2s
  2450K .......... .......... .......... .......... .......... 35% 43.8M 2s
  2500K .......... .......... .......... .......... .......... 35% 39.9M 2s
  2550K .......... .......... .......... .......... .......... 36% 56.7M 2s
  2600K .......... .......... .......... .......... .......... 37% 38.4M 2s
  2650K .......... .......... .......... .......... .......... 37% 66.8M 2s
  2700K .......... .......... .......... .......... .......... 38% 34.9M 2s
  2750K .......... .......... .......... .......... .......... 39% 26.8M 2s
  2800K .......... .......... .......... .......... .......... 40% 19.7M 2s
  2850K .......... .......... .......... .......... .......... 40% 60.0M 2s
  2900K .......... .......... .......... .......... .......... 41% 44.7M 2s
  2950K .......... .......... .......... .......... .......... 42% 77.9M 2s
  3000K .......... .......... .......... .......... .......... 42% 55.0M 1s
  3050K .......... .......... .......... .......... .......... 43% 48.6M 1s
  3100K .......... .......... .......... .......... .......... 44% 53.3M 1s
  3150K .......... .......... .......... .......... .......... 45% 59.7M 1s
  3200K .......... .......... .......... .......... .......... 45% 37.1M 1s
  3250K .......... .......... .......... .......... .......... 46% 65.7M 1s
  3300K .......... .......... .......... .......... .......... 47% 39.0M 1s
  3350K .......... .......... .......... .......... .......... 47% 82.9M 1s
  3400K .......... .......... .......... .......... .......... 48% 49.2M 1s
  3450K .......... .......... .......... .......... .......... 49% 8.70M 1s
  3500K .......... .......... .......... .......... .......... 49% 58.8M 1s
  3550K .......... .......... .......... .......... .......... 50%  451K 1s
  3600K .......... .......... .......... .......... .......... 51% 50.4M 1s
  3650K .......... .......... .......... .......... .......... 52% 62.7M 1s
  3700K .......... .......... .......... .......... .......... 52% 36.6M 1s
  3750K .......... .......... .......... .......... .......... 53% 27.1M 1s
  3800K .......... .......... .......... .......... .......... 54% 26.8M 1s
  3850K .......... .......... .......... .......... .......... 54% 27.4M 1s
  3900K .......... .......... .......... .......... .......... 55% 29.8M 1s
  3950K .......... .......... .......... .......... .......... 56% 28.9M 1s
  4000K .......... .......... .......... .......... .......... 56% 17.3M 1s
  4050K .......... .......... .......... .......... .......... 57% 18.6M 1s
  4100K .......... .......... .......... .......... .......... 58% 17.6M 1s
  4150K .......... .......... .......... .......... .......... 59% 24.3M 1s
  4200K .......... .......... .......... .......... .......... 59% 29.1M 1s
  4250K .......... .......... .......... .......... .......... 60% 27.8M 1s
  4300K .......... .......... .......... .......... .......... 61% 28.4M 1s
  4350K .......... .......... .......... .......... .......... 61% 27.0M 1s
  4400K .......... .......... .......... .......... .......... 62% 22.0M 1s
  4450K .......... .......... .......... .......... .......... 63% 28.3M 1s
  4500K .......... .......... .......... .......... .......... 63% 20.3M 1s
  4550K .......... .......... .......... .......... .......... 64% 20.3M 1s
  4600K .......... .......... .......... .......... .......... 65% 20.8M 1s
  4650K .......... .......... .......... .......... .......... 66% 19.9M 1s
  4700K .......... .......... .......... .......... .......... 66% 19.8M 1s
  4750K .......... .......... .......... .......... .......... 67% 21.1M 1s
  4800K .......... .......... .......... .......... .......... 68% 15.7M 1s
  4850K .......... .......... .......... .......... .......... 68% 23.9M 1s
  4900K .......... .......... .......... .......... .......... 69% 24.3M 1s
  4950K .......... .......... .......... .......... .......... 70% 18.1M 1s
  5000K .......... .......... .......... .......... .......... 71% 26.0M 1s
  5050K .......... .......... .......... .......... .......... 71% 23.4M 1s
  5100K .......... .......... .......... .......... .......... 72% 24.4M 0s
  5150K .......... .......... .......... .......... .......... 73% 23.0M 0s
  5200K .......... .......... .......... .......... .......... 73% 18.3M 0s
  5250K .......... .......... .......... .......... .......... 74% 21.6M 0s
  5300K .......... .......... .......... .......... .......... 75% 24.1M 0s
  5350K .......... .......... .......... .......... .......... 75% 24.3M 0s
  5400K .......... .......... .......... .......... .......... 76% 24.1M 0s
  5450K .......... .......... .......... .......... .......... 77% 22.5M 0s
  5500K .......... .......... .......... .......... .......... 78% 21.3M 0s
  5550K .......... .......... .......... .......... .......... 78% 27.5M 0s
  5600K .......... .......... .......... .......... .......... 79% 19.0M 0s
  5650K .......... .......... .......... .......... .......... 80% 24.5M 0s
  5700K .......... .......... .......... .......... .......... 80% 25.9M 0s
  5750K .......... .......... .......... .......... .......... 81% 25.5M 0s
  5800K .......... .......... .......... .......... .......... 82% 23.5M 0s
  5850K .......... .......... .......... .......... .......... 82% 26.7M 0s
  5900K .......... .......... .......... .......... .......... 83% 28.7M 0s
  5950K .......... .......... .......... .......... .......... 84% 26.9M 0s
  6000K .......... .......... .......... .......... .......... 85% 15.6M 0s
  6050K .......... .......... .......... .......... .......... 85% 34.0M 0s
  6100K .......... .......... .......... .......... .......... 86% 28.9M 0s
  6150K .......... .......... .......... .......... .......... 87% 25.8M 0s
  6200K .......... .......... .......... .......... .......... 87% 24.8M 0s
  6250K .......... .......... .......... .......... .......... 88% 22.5M 0s
  6300K .......... .......... .......... .......... .......... 89% 30.8M 0s
  6350K .......... .......... .......... .......... .......... 90% 26.1M 0s
  6400K .......... .......... .......... .......... .......... 90% 20.2M 0s
  6450K .......... .......... .......... .......... .......... 91% 25.5M 0s
  6500K .......... .......... .......... .......... .......... 92% 26.2M 0s
  6550K .......... .......... .......... .......... .......... 92% 25.0M 0s
  6600K .......... .......... .......... .......... .......... 93% 22.4M 0s
  6650K .......... .......... .......... .......... .......... 94% 1.52M 0s
  6700K .......... .......... .......... .......... .......... 94% 70.2M 0s
  6750K .......... .......... .......... .......... .......... 95% 44.8M 0s
  6800K .......... .......... .......... .......... .......... 96% 28.1M 0s
  6850K .......... .......... .......... .......... .......... 97% 36.1M 0s
  6900K .......... .......... .......... .......... .......... 97% 23.8M 0s
  6950K .......... .......... .......... .......... .......... 98% 21.4M 0s
  7000K .......... .......... .......... .......... .......... 99% 24.1M 0s
  7050K .......... .......... .......... .......... .......... 99% 92.6M 0s
  7100K ..........                                            100%  111M=1.4s

2021-04-10 09:15:46 (4.94 MB/s) - ‘linux-media.tar.bz2’ saved [7280931/7280931]

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
patch -s -f -N -p1 -i ../backports/ccs.patch
patch -s -f -N -p1 -i ../backports/v5.11_isa.patch
patch -s -f -N -p1 -i ../backports/v5.10_vb2_dma_buf_map.patch
patch -s -f -N -p1 -i ../backports/v5.9_tasklet.patch
patch -s -f -N -p1 -i ../backports/v5.9_netup_unidvb_devm_revert.patch
patch -s -f -N -p1 -i ../backports/v5.7_mmap_read_lock.patch
patch -s -f -N -p1 -i ../backports/v5.7_vm_map_ram.patch
patch -s -f -N -p1 -i ../backports/v5.7_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.7_define_seq_attribute.patch
patch -s -f -N -p1 -i ../backports/v5.6_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.6_const_fb_ops.patch
patch -s -f -N -p1 -i ../backports/v5.6_pm_runtime_get_if_active.patch
patch -s -f -N -p1 -i ../backports/v5.5_alsa_pcm_api_updates.patch
patch -s -f -N -p1 -i ../backports/v5.5_memtype_h.patch
patch -s -f -N -p1 -i ../backports/v5.5_dev_printk_h.patch
patch -s -f -N -p1 -i ../backports/v5.5_vb2_kmap.patch
patch -s -f -N -p1 -i ../backports/v5.4_revert_spi_transfer.patch
patch -s -f -N -p1 -i ../backports/v5.4_async.patch
patch -s -f -N -p1 -i ../backports/v5.1_vm_map_pages.patch
patch -s -f -N -p1 -i ../backports/v5.1_devm_i2c_new_dummy_device.patch
1 out of 2 hunks FAILED
make[2]: *** [Makefile:131: apply_patches] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make[1]: *** [Makefile:366: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
