Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F85D2B7A2D
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 10:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgKRJQE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 18 Nov 2020 04:16:04 -0500
Received: from www.linuxtv.org ([130.149.80.248]:59476 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbgKRJQE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 04:16:04 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kfJZJ-00HLby-Js; Wed, 18 Nov 2020 09:16:01 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kfJcO-0002cl-Bh; Wed, 18 Nov 2020 09:19:12 +0000
Date:   Wed, 18 Nov 2020 09:19:11 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <685013533.2.1605691152345@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3295
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

See <https://builder.linuxtv.org/job/media-build/3295/display/redirect>

Changes:


------------------------------------------
[...truncated 4.22 KB...]
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7143448 (6.8M) [application/x-bzip2]
Saving to: ‘linux-media.tar.bz2’

     0K .......... .......... .......... .......... ..........  0%  161K 43s
    50K .......... .......... .......... .......... ..........  1%  324K 32s
   100K .......... .......... .......... .......... ..........  2% 15.3M 21s
   150K .......... .......... .......... .......... ..........  2% 1.15M 17s
   200K .......... .......... .......... .......... ..........  3%  449K 17s
   250K .......... .......... .......... .......... ..........  4% 15.9M 14s
   300K .......... .......... .......... .......... ..........  5% 14.4M 12s
   350K .......... .......... .......... .......... ..........  5% 13.6M 10s
   400K .......... .......... .......... .......... ..........  6%  348K 11s
   450K .......... .......... .......... .......... ..........  7% 14.6M 10s
   500K .......... .......... .......... .......... ..........  7% 16.3M 9s
   550K .......... .......... .......... .......... ..........  8% 20.0M 8s
   600K .......... .......... .......... .......... ..........  9% 21.4M 8s
   650K .......... .......... .......... .......... .......... 10% 20.3M 7s
   700K .......... .......... .......... .......... .......... 10% 18.8M 7s
   750K .......... .......... .......... .......... .......... 11% 18.5M 6s
   800K .......... .......... .......... .......... .......... 12% 13.4M 6s
   850K .......... .......... .......... .......... .......... 12%  380K 6s
   900K .......... .......... .......... .......... .......... 13% 28.4M 6s
   950K .......... .......... .......... .......... .......... 14% 19.4M 6s
  1000K .......... .......... .......... .......... .......... 15% 32.0M 5s
  1050K .......... .......... .......... .......... .......... 15% 23.0M 5s
  1100K .......... .......... .......... .......... .......... 16% 26.2M 5s
  1150K .......... .......... .......... .......... .......... 17% 24.9M 5s
  1200K .......... .......... .......... .......... .......... 17% 18.8M 4s
  1250K .......... .......... .......... .......... .......... 18% 25.7M 4s
  1300K .......... .......... .......... .......... .......... 19% 31.7M 4s
  1350K .......... .......... .......... .......... .......... 20% 24.5M 4s
  1400K .......... .......... .......... .......... .......... 20% 28.0M 4s
  1450K .......... .......... .......... .......... .......... 21% 30.5M 3s
  1500K .......... .......... .......... .......... .......... 22% 32.5M 3s
  1550K .......... .......... .......... .......... .......... 22% 25.9M 3s
  1600K .......... .......... .......... .......... .......... 23% 20.5M 3s
  1650K .......... .......... .......... .......... .......... 24% 25.7M 3s
  1700K .......... .......... .......... .......... .......... 25% 25.4M 3s
  1750K .......... .......... .......... .......... .......... 25%  411K 3s
  1800K .......... .......... .......... .......... .......... 26% 43.7M 3s
  1850K .......... .......... .......... .......... .......... 27% 44.4M 3s
  1900K .......... .......... .......... .......... .......... 27% 40.6M 3s
  1950K .......... .......... .......... .......... .......... 28% 45.2M 3s
  2000K .......... .......... .......... .......... .......... 29% 35.6M 3s
  2050K .......... .......... .......... .......... .......... 30% 42.1M 3s
  2100K .......... .......... .......... .......... .......... 30% 41.5M 2s
  2150K .......... .......... .......... .......... .......... 31% 40.3M 2s
  2200K .......... .......... .......... .......... .......... 32% 45.2M 2s
  2250K .......... .......... .......... .......... .......... 32% 44.7M 2s
  2300K .......... .......... .......... .......... .......... 33% 54.0M 2s
  2350K .......... .......... .......... .......... .......... 34% 27.4M 2s
  2400K .......... .......... .......... .......... .......... 35% 18.0M 2s
  2450K .......... .......... .......... .......... .......... 35% 24.0M 2s
  2500K .......... .......... .......... .......... .......... 36% 23.8M 2s
  2550K .......... .......... .......... .......... .......... 37% 23.5M 2s
  2600K .......... .......... .......... .......... .......... 37% 22.7M 2s
  2650K .......... .......... .......... .......... .......... 38% 24.0M 2s
  2700K .......... .......... .......... .......... .......... 39% 23.4M 2s
  2750K .......... .......... .......... .......... .......... 40% 25.7M 2s
  2800K .......... .......... .......... .......... .......... 40% 18.6M 2s
  2850K .......... .......... .......... .......... .......... 41% 26.8M 2s
  2900K .......... .......... .......... .......... .......... 42% 26.3M 2s
  2950K .......... .......... .......... .......... .......... 43% 25.5M 1s
  3000K .......... .......... .......... .......... .......... 43% 25.2M 1s
  3050K .......... .......... .......... .......... .......... 44% 27.0M 1s
  3100K .......... .......... .......... .......... .......... 45% 26.7M 1s
  3150K .......... .......... .......... .......... .......... 45% 25.4M 1s
  3200K .......... .......... .......... .......... .......... 46% 20.5M 1s
  3250K .......... .......... .......... .......... .......... 47% 26.5M 1s
  3300K .......... .......... .......... .......... .......... 48% 26.1M 1s
  3350K .......... .......... .......... .......... .......... 48% 24.7M 1s
  3400K .......... .......... .......... .......... .......... 49% 25.9M 1s
  3450K .......... .......... .......... .......... .......... 50% 26.8M 1s
  3500K .......... .......... .......... .......... .......... 50% 23.9M 1s
  3550K .......... .......... .......... .......... .......... 51%  532K 1s
  3600K .......... .......... .......... .......... .......... 52% 51.3M 1s
  3650K .......... .......... .......... .......... .......... 53% 46.1M 1s
  3700K .......... .......... .......... .......... .......... 53% 52.3M 1s
  3750K .......... .......... .......... .......... .......... 54% 49.2M 1s
  3800K .......... .......... .......... .......... .......... 55% 52.3M 1s
  3850K .......... .......... .......... .......... .......... 55% 47.4M 1s
  3900K .......... .......... .......... .......... .......... 56% 42.4M 1s
  3950K .......... .......... .......... .......... .......... 57% 52.4M 1s
  4000K .......... .......... .......... .......... .......... 58% 37.4M 1s
  4050K .......... .......... .......... .......... .......... 58% 56.6M 1s
  4100K .......... .......... .......... .......... .......... 59% 48.2M 1s
  4150K .......... .......... .......... .......... .......... 60% 51.9M 1s
  4200K .......... .......... .......... .......... .......... 60% 45.8M 1s
  4250K .......... .......... .......... .......... .......... 61% 38.1M 1s
  4300K .......... .......... .......... .......... .......... 62% 90.3M 1s
  4350K .......... .......... .......... .......... .......... 63% 50.6M 1s
  4400K .......... .......... .......... .......... .......... 63% 40.0M 1s
  4450K .......... .......... .......... .......... .......... 64% 62.2M 1s
  4500K .......... .......... .......... .......... .......... 65% 51.7M 1s
  4550K .......... .......... .......... .......... .......... 65% 60.1M 1s
  4600K .......... .......... .......... .......... .......... 66% 55.5M 1s
  4650K .......... .......... .......... .......... .......... 67% 58.0M 1s
  4700K .......... .......... .......... .......... .......... 68% 50.0M 1s
  4750K .......... .......... .......... .......... .......... 68% 60.5M 1s
  4800K .......... .......... .......... .......... .......... 69% 42.2M 1s
  4850K .......... .......... .......... .......... .......... 70% 62.2M 1s
  4900K .......... .......... .......... .......... .......... 70% 60.2M 1s
  4950K .......... .......... .......... .......... .......... 71% 52.7M 1s
  5000K .......... .......... .......... .......... .......... 72% 55.3M 0s
  5050K .......... .......... .......... .......... .......... 73% 53.4M 0s
  5100K .......... .......... .......... .......... .......... 73% 56.5M 0s
  5150K .......... .......... .......... .......... .......... 74% 49.1M 0s
  5200K .......... .......... .......... .......... .......... 75% 43.4M 0s
  5250K .......... .......... .......... .......... .......... 75% 56.7M 0s
  5300K .......... .......... .......... .......... .......... 76% 51.8M 0s
  5350K .......... .......... .......... .......... .......... 77% 55.9M 0s
  5400K .......... .......... .......... .......... .......... 78% 51.4M 0s
  5450K .......... .......... .......... .......... .......... 78% 58.1M 0s
  5500K .......... .......... .......... .......... .......... 79% 54.1M 0s
  5550K .......... .......... .......... .......... .......... 80% 70.5M 0s
  5600K .......... .......... .......... .......... .......... 80% 41.4M 0s
  5650K .......... .......... .......... .......... .......... 81% 8.74M 0s
  5700K .......... .......... .......... .......... .......... 82% 24.1M 0s
  5750K .......... .......... .......... .......... .......... 83% 21.6M 0s
  5800K .......... .......... .......... .......... .......... 83% 21.4M 0s
  5850K .......... .......... .......... .......... .......... 84% 21.3M 0s
  5900K .......... .......... .......... .......... .......... 85% 21.3M 0s
  5950K .......... .......... .......... .......... .......... 86% 21.6M 0s
  6000K .......... .......... .......... .......... .......... 86% 14.4M 0s
  6050K .......... .......... .......... .......... .......... 87% 22.6M 0s
  6100K .......... .......... .......... .......... .......... 88% 23.2M 0s
  6150K .......... .......... .......... .......... .......... 88% 22.7M 0s
  6200K .......... .......... .......... .......... .......... 89% 21.2M 0s
  6250K .......... .......... .......... .......... .......... 90% 23.2M 0s
  6300K .......... .......... .......... .......... .......... 91% 23.3M 0s
  6350K .......... .......... .......... .......... .......... 91% 23.3M 0s
  6400K .......... .......... .......... .......... .......... 92% 17.9M 0s
  6450K .......... .......... .......... .......... .......... 93% 24.2M 0s
  6500K .......... .......... .......... .......... .......... 93% 24.1M 0s
  6550K .......... .......... .......... .......... .......... 94% 28.9M 0s
  6600K .......... .......... .......... .......... .......... 95% 24.4M 0s
  6650K .......... .......... .......... .......... .......... 96%  719K 0s
  6700K .......... .......... .......... .......... .......... 96% 55.2M 0s
  6750K .......... .......... .......... .......... .......... 97% 59.8M 0s
  6800K .......... .......... .......... .......... .......... 98% 37.2M 0s
  6850K .......... .......... .......... .......... .......... 98% 60.4M 0s
  6900K .......... .......... .......... .......... .......... 99% 40.0M 0s
  6950K .......... .......... ......                          100% 36.9M=1.4s

2020-11-18 09:16:51 (4.86 MB/s) - ‘linux-media.tar.bz2’ saved [7143448/7143448]

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
Applying patches for kernel 4.19.0-5-amd64
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
patch -s -f -N -p1 -i ../backports/debug.patch
patch -s -f -N -p1 -i ../backports/drx39xxj.patch
patch -s -f -N -p1 -i ../backports/v5.9_tasklet.patch
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
patch -s -f -N -p1 -i ../backports/v5.4_revert_spi_transfer.patch
patch -s -f -N -p1 -i ../backports/v5.4_dma_buf.patch
patch -s -f -N -p1 -i ../backports/v5.1_vm_map_pages.patch
patch -s -f -N -p1 -i ../backports/v5.1_devm_i2c_new_dummy_device.patch
patch -s -f -N -p1 -i ../backports/v5.0_ipu3-cio2.patch
patch -s -f -N -p1 -i ../backports/v5.0_time32.patch
5 out of 14 hunks FAILED
make[2]: *** [Makefile:132: apply_patches] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make[1]: *** [Makefile:378: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
