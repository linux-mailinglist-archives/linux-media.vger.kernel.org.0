Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D18F3B0004
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 11:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbhFVJRA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 22 Jun 2021 05:17:00 -0400
Received: from www.linuxtv.org ([130.149.80.248]:37618 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229486AbhFVJRA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 05:17:00 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lvcUV-00B0Rf-9R; Tue, 22 Jun 2021 09:14:43 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lvcZ0-0006pk-F7; Tue, 22 Jun 2021 09:19:22 +0000
Date:   Tue, 22 Jun 2021 09:19:22 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <919682668.0.1624353562436@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3540
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

See <https://builder.linuxtv.org/job/media-build/3540/display/redirect>

Changes:


------------------------------------------
[...truncated 5.66 KB...]
   350K .......... .......... .......... .......... ..........  5% 13.9M 11s
   400K .......... .......... .......... .......... ..........  6%  352K 11s
   450K .......... .......... .......... .......... ..........  7% 15.6M 10s
   500K .......... .......... .......... .......... ..........  7% 18.1M 9s
   550K .......... .......... .......... .......... ..........  8% 21.5M 8s
   600K .......... .......... .......... .......... ..........  9% 19.5M 8s
   650K .......... .......... .......... .......... ..........  9% 21.4M 7s
   700K .......... .......... .......... .......... .......... 10% 25.5M 7s
   750K .......... .......... .......... .......... .......... 11% 25.0M 6s
   800K .......... .......... .......... .......... .......... 11% 19.1M 6s
   850K .......... .......... .......... .......... .......... 12%  376K 6s
   900K .......... .......... .......... .......... .......... 13% 22.6M 6s
   950K .......... .......... .......... .......... .......... 14% 27.2M 6s
  1000K .......... .......... .......... .......... .......... 14% 23.8M 5s
  1050K .......... .......... .......... .......... .......... 15% 31.3M 5s
  1100K .......... .......... .......... .......... .......... 16% 29.2M 5s
  1150K .......... .......... .......... .......... .......... 16% 24.5M 5s
  1200K .......... .......... .......... .......... .......... 17% 19.4M 4s
  1250K .......... .......... .......... .......... .......... 18% 26.3M 4s
  1300K .......... .......... .......... .......... .......... 18% 25.9M 4s
  1350K .......... .......... .......... .......... .......... 19% 26.7M 4s
  1400K .......... .......... .......... .......... .......... 20% 26.3M 4s
  1450K .......... .......... .......... .......... .......... 21% 26.0M 4s
  1500K .......... .......... .......... .......... .......... 21% 26.3M 3s
  1550K .......... .......... .......... .......... .......... 22% 27.5M 3s
  1600K .......... .......... .......... .......... .......... 23% 17.4M 3s
  1650K .......... .......... .......... .......... .......... 23% 12.6M 3s
  1700K .......... .......... .......... .......... .......... 24% 17.3M 3s
  1750K .......... .......... .......... .......... .......... 25%  429K 3s
  1800K .......... .......... .......... .......... .......... 25% 47.7M 3s
  1850K .......... .......... .......... .......... .......... 26% 37.9M 3s
  1900K .......... .......... .......... .......... .......... 27% 62.3M 3s
  1950K .......... .......... .......... .......... .......... 28% 46.0M 3s
  2000K .......... .......... .......... .......... .......... 28% 37.9M 3s
  2050K .......... .......... .......... .......... .......... 29% 41.7M 3s
  2100K .......... .......... .......... .......... .......... 30% 55.3M 2s
  2150K .......... .......... .......... .......... .......... 30% 43.6M 2s
  2200K .......... .......... .......... .......... .......... 31% 46.3M 2s
  2250K .......... .......... .......... .......... .......... 32% 54.1M 2s
  2300K .......... .......... .......... .......... .......... 32% 54.1M 2s
  2350K .......... .......... .......... .......... .......... 33% 47.7M 2s
  2400K .......... .......... .......... .......... .......... 34% 40.0M 2s
  2450K .......... .......... .......... .......... .......... 35% 45.2M 2s
  2500K .......... .......... .......... .......... .......... 35% 52.9M 2s
  2550K .......... .......... .......... .......... .......... 36% 48.7M 2s
  2600K .......... .......... .......... .......... .......... 37% 46.8M 2s
  2650K .......... .......... .......... .......... .......... 37% 52.6M 2s
  2700K .......... .......... .......... .......... .......... 38% 55.3M 2s
  2750K .......... .......... .......... .......... .......... 39% 48.3M 2s
  2800K .......... .......... .......... .......... .......... 39% 43.4M 2s
  2850K .......... .......... .......... .......... .......... 40% 60.7M 2s
  2900K .......... .......... .......... .......... .......... 41% 58.7M 2s
  2950K .......... .......... .......... .......... .......... 42% 62.9M 2s
  3000K .......... .......... .......... .......... .......... 42% 48.1M 1s
  3050K .......... .......... .......... .......... .......... 43% 50.2M 1s
  3100K .......... .......... .......... .......... .......... 44% 63.5M 1s
  3150K .......... .......... .......... .......... .......... 44% 69.8M 1s
  3200K .......... .......... .......... .......... .......... 45% 37.9M 1s
  3250K .......... .......... .......... .......... .......... 46% 59.6M 1s
  3300K .......... .......... .......... .......... .......... 46% 45.4M 1s
  3350K .......... .......... .......... .......... .......... 47% 46.7M 1s
  3400K .......... .......... .......... .......... .......... 48% 20.5M 1s
  3450K .......... .......... .......... .......... .......... 49% 59.1M 1s
  3500K .......... .......... .......... .......... .......... 49% 50.0M 1s
  3550K .......... .......... .......... .......... .......... 50%  427K 1s
  3600K .......... .......... .......... .......... .......... 51% 70.6M 1s
  3650K .......... .......... .......... .......... .......... 51% 47.5M 1s
  3700K .......... .......... .......... .......... .......... 52% 61.1M 1s
  3750K .......... .......... .......... .......... .......... 53% 44.1M 1s
  3800K .......... .......... .......... .......... .......... 53% 49.1M 1s
  3850K .......... .......... .......... .......... .......... 54% 36.7M 1s
  3900K .......... .......... .......... .......... .......... 55% 24.4M 1s
  3950K .......... .......... .......... .......... .......... 56% 26.9M 1s
  4000K .......... .......... .......... .......... .......... 56% 19.9M 1s
  4050K .......... .......... .......... .......... .......... 57% 24.1M 1s
  4100K .......... .......... .......... .......... .......... 58% 46.4M 1s
  4150K .......... .......... .......... .......... .......... 58% 56.2M 1s
  4200K .......... .......... .......... .......... .......... 59% 30.5M 1s
  4250K .......... .......... .......... .......... .......... 60%  128M 1s
  4300K .......... .......... .......... .......... .......... 60% 50.4M 1s
  4350K .......... .......... .......... .......... .......... 61% 75.4M 1s
  4400K .......... .......... .......... .......... .......... 62% 90.1M 1s
  4450K .......... .......... .......... .......... .......... 63% 98.8M 1s
  4500K .......... .......... .......... .......... .......... 63% 62.9M 1s
  4550K .......... .......... .......... .......... .......... 64% 79.0M 1s
  4600K .......... .......... .......... .......... .......... 65% 54.0M 1s
  4650K .......... .......... .......... .......... .......... 65% 35.2M 1s
  4700K .......... .......... .......... .......... .......... 66% 31.8M 1s
  4750K .......... .......... .......... .......... .......... 67% 26.3M 1s
  4800K .......... .......... .......... .......... .......... 67% 20.7M 1s
  4850K .......... .......... .......... .......... .......... 68% 27.5M 1s
  4900K .......... .......... .......... .......... .......... 69% 26.3M 1s
  4950K .......... .......... .......... .......... .......... 70% 27.1M 1s
  5000K .......... .......... .......... .......... .......... 70% 25.9M 1s
  5050K .......... .......... .......... .......... .......... 71% 27.7M 1s
  5100K .......... .......... .......... .......... .......... 72% 31.6M 0s
  5150K .......... .......... .......... .......... .......... 72% 24.4M 0s
  5200K .......... .......... .......... .......... .......... 73% 21.3M 0s
  5250K .......... .......... .......... .......... .......... 74% 27.0M 0s
  5300K .......... .......... .......... .......... .......... 74% 27.2M 0s
  5350K .......... .......... .......... .......... .......... 75% 27.6M 0s
  5400K .......... .......... .......... .......... .......... 76% 25.1M 0s
  5450K .......... .......... .......... .......... .......... 77% 28.5M 0s
  5500K .......... .......... .......... .......... .......... 77% 28.6M 0s
  5550K .......... .......... .......... .......... .......... 78% 18.4M 0s
  5600K .......... .......... .......... .......... .......... 79% 32.4M 0s
  5650K .......... .......... .......... .......... .......... 79% 27.9M 0s
  5700K .......... .......... .......... .......... .......... 80% 28.5M 0s
  5750K .......... .......... .......... .......... .......... 81% 22.4M 0s
  5800K .......... .......... .......... .......... .......... 82% 30.6M 0s
  5850K .......... .......... .......... .......... .......... 82% 27.6M 0s
  5900K .......... .......... .......... .......... .......... 83% 26.5M 0s
  5950K .......... .......... .......... .......... .......... 84% 27.4M 0s
  6000K .......... .......... .......... .......... .......... 84% 13.4M 0s
  6050K .......... .......... .......... .......... .......... 85% 95.6M 0s
  6100K .......... .......... .......... .......... .......... 86% 27.4M 0s
  6150K .......... .......... .......... .......... .......... 86% 26.0M 0s
  6200K .......... .......... .......... .......... .......... 87% 25.2M 0s
  6250K .......... .......... .......... .......... .......... 88% 19.2M 0s
  6300K .......... .......... .......... .......... .......... 89% 25.2M 0s
  6350K .......... .......... .......... .......... .......... 89% 32.4M 0s
  6400K .......... .......... .......... .......... .......... 90% 20.9M 0s
  6450K .......... .......... .......... .......... .......... 91% 26.3M 0s
  6500K .......... .......... .......... .......... .......... 91% 24.0M 0s
  6550K .......... .......... .......... .......... .......... 92% 30.3M 0s
  6600K .......... .......... .......... .......... .......... 93% 22.3M 0s
  6650K .......... .......... .......... .......... .......... 93%  901K 0s
  6700K .......... .......... .......... .......... .......... 94% 33.6M 0s
  6750K .......... .......... .......... .......... .......... 95% 46.2M 0s
  6800K .......... .......... .......... .......... .......... 96% 49.3M 0s
  6850K .......... .......... .......... .......... .......... 96% 64.7M 0s
  6900K .......... .......... .......... .......... .......... 97% 52.7M 0s
  6950K .......... .......... .......... .......... .......... 98% 26.7M 0s
  7000K .......... .......... .......... .......... .......... 98% 24.7M 0s
  7050K .......... .......... .......... .......... .......... 99% 31.5M 0s
  7100K .......... .......... .......... ...                  100% 20.8M=1.4s

2021-06-22 09:15:25 (5.01 MB/s) - ‘linux-media.tar.bz2’ saved [7304647/7304647]

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
No version yet, using 4.19.0-12-amd64
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Applying patches for kernel 4.19.0-12-amd64
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
patch -s -f -N -p1 -i ../backports/debug.patch
patch -s -f -N -p1 -i ../backports/drx39xxj.patch
patch -s -f -N -p1 -i ../backports/ccs.patch
patch -s -f -N -p1 -i ../backports/rc-cec.patch
patch -s -f -N -p1 -i ../backports/v5.12_uvc.patch
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
patch -s -f -N -p1 -i ../backports/v5.0_ipu3-cio2.patch
patch -s -f -N -p1 -i ../backports/v5.0_time32.patch
3 out of 4 hunks FAILED
1 out of 2 hunks FAILED
make[2]: *** [Makefile:131: apply_patches] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make[1]: *** [Makefile:366: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
