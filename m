Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A688629E6A3
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 09:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbgJ2Iwq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 29 Oct 2020 04:52:46 -0400
Received: from www.linuxtv.org ([130.149.80.248]:39096 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgJ2Iwq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 04:52:46 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kXhYz-003yXn-Om; Wed, 28 Oct 2020 09:16:14 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kXhbw-0004Ye-5R; Wed, 28 Oct 2020 09:19:16 +0000
Date:   Wed, 28 Oct 2020 09:19:16 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1295491111.4.1603876756162@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3267
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

See <https://builder.linuxtv.org/job/media-build/3267/display/redirect>

Changes:


------------------------------------------
[...truncated 7.77 KB...]
  2250K .......... .......... .......... .......... .......... 32% 25.8M 2s
  2300K .......... .......... .......... .......... .......... 33% 6.85M 2s
  2350K .......... .......... .......... .......... .......... 34%  122M 2s
  2400K .......... .......... .......... .......... .......... 34% 51.7M 2s
  2450K .......... .......... .......... .......... .......... 35%  160M 2s
  2500K .......... .......... .......... .......... .......... 36%  158M 2s
  2550K .......... .......... .......... .......... .......... 37%  166M 2s
  2600K .......... .......... .......... .......... .......... 37% 7.87M 2s
  2650K .......... .......... .......... .......... .......... 38% 38.0M 2s
  2700K .......... .......... .......... .......... .......... 39%  156M 2s
  2750K .......... .......... .......... .......... .......... 39%  147M 2s
  2800K .......... .......... .......... .......... .......... 40%  119M 2s
  2850K .......... .......... .......... .......... .......... 41%  165M 2s
  2900K .......... .......... .......... .......... .......... 42%  118M 2s
  2950K .......... .......... .......... .......... .......... 42% 33.5M 2s
  3000K .......... .......... .......... .......... .......... 43%  124M 1s
  3050K .......... .......... .......... .......... .......... 44% 16.8M 1s
  3100K .......... .......... .......... .......... .......... 44%  144M 1s
  3150K .......... .......... .......... .......... .......... 45% 81.2M 1s
  3200K .......... .......... .......... .......... .......... 46% 31.8M 1s
  3250K .......... .......... .......... .......... .......... 47% 28.4M 1s
  3300K .......... .......... .......... .......... .......... 47%  434K 1s
  3350K .......... .......... .......... .......... .......... 48% 20.0M 1s
  3400K .......... .......... .......... .......... .......... 49% 21.6M 1s
  3450K .......... .......... .......... .......... .......... 49% 27.8M 1s
  3500K .......... .......... .......... .......... .......... 50% 22.2M 1s
  3550K .......... .......... .......... .......... .......... 51% 21.8M 1s
  3600K .......... .......... .......... .......... .......... 52% 19.1M 1s
  3650K .......... .......... .......... .......... .......... 52% 24.0M 1s
  3700K .......... .......... .......... .......... .......... 53% 24.0M 1s
  3750K .......... .......... .......... .......... .......... 54% 23.0M 1s
  3800K .......... .......... .......... .......... .......... 54% 23.2M 1s
  3850K .......... .......... .......... .......... .......... 55% 24.6M 1s
  3900K .......... .......... .......... .......... .......... 56% 6.95M 1s
  3950K .......... .......... .......... .......... .......... 57%  134M 1s
  4000K .......... .......... .......... .......... .......... 57%  122M 1s
  4050K .......... .......... .......... .......... .......... 58% 45.4M 1s
  4100K .......... .......... .......... .......... .......... 59% 15.7M 1s
  4150K .......... .......... .......... .......... .......... 59% 12.4M 1s
  4200K .......... .......... .......... .......... .......... 60% 97.3M 1s
  4250K .......... .......... .......... .......... .......... 61% 58.1M 1s
  4300K .......... .......... .......... .......... .......... 61% 25.0M 1s
  4350K .......... .......... .......... .......... .......... 62% 23.4M 1s
  4400K .......... .......... .......... .......... .......... 63% 17.4M 1s
  4450K .......... .......... .......... .......... .......... 64% 22.6M 1s
  4500K .......... .......... .......... .......... .......... 64% 22.3M 1s
  4550K .......... .......... .......... .......... .......... 65% 7.09M 1s
  4600K .......... .......... .......... .......... .......... 66%  119M 1s
  4650K .......... .......... .......... .......... .......... 66%  106M 1s
  4700K .......... .......... .......... .......... .......... 67% 45.4M 1s
  4750K .......... .......... .......... .......... .......... 68% 22.4M 1s
  4800K .......... .......... .......... .......... .......... 69% 7.79M 1s
  4850K .......... .......... .......... .......... .......... 69%  116M 1s
  4900K .......... .......... .......... .......... .......... 70%  588K 1s
  4950K .......... .......... .......... .......... .......... 71% 26.4M 1s
  5000K .......... .......... .......... .......... .......... 71% 25.3M 1s
  5050K .......... .......... .......... .......... .......... 72% 16.8M 1s
  5100K .......... .......... .......... .......... .......... 73% 54.3M 1s
  5150K .......... .......... .......... .......... .......... 74% 25.4M 0s
  5200K .......... .......... .......... .......... .......... 74% 18.7M 0s
  5250K .......... .......... .......... .......... .......... 75% 22.6M 0s
  5300K .......... .......... .......... .......... .......... 76% 26.8M 0s
  5350K .......... .......... .......... .......... .......... 76% 25.1M 0s
  5400K .......... .......... .......... .......... .......... 77% 25.2M 0s
  5450K .......... .......... .......... .......... .......... 78% 21.9M 0s
  5500K .......... .......... .......... .......... .......... 79% 25.4M 0s
  5550K .......... .......... .......... .......... .......... 79% 6.29M 0s
  5600K .......... .......... .......... .......... .......... 80% 91.7M 0s
  5650K .......... .......... .......... .......... .......... 81% 43.0M 0s
  5700K .......... .......... .......... .......... .......... 81% 22.2M 0s
  5750K .......... .......... .......... .......... .......... 82% 4.60M 0s
  5800K .......... .......... .......... .......... .......... 83%  134M 0s
  5850K .......... .......... .......... .......... .......... 84%  146M 0s
  5900K .......... .......... .......... .......... .......... 84%  144M 0s
  5950K .......... .......... .......... .......... .......... 85%  141M 0s
  6000K .......... .......... .......... .......... .......... 86%  130M 0s
  6050K .......... .......... .......... .......... .......... 86%  130M 0s
  6100K .......... .......... .......... .......... .......... 87% 90.3M 0s
  6150K .......... .......... .......... .......... .......... 88% 19.2M 0s
  6200K .......... .......... .......... .......... .......... 89% 5.84M 0s
  6250K .......... .......... .......... .......... .......... 89% 23.1M 0s
  6300K .......... .......... .......... .......... .......... 90% 91.0M 0s
  6350K .......... .......... .......... .......... .......... 91% 87.9M 0s
  6400K .......... .......... .......... .......... .......... 91% 52.9M 0s
  6450K .......... .......... .......... .......... .......... 92% 9.71M 0s
  6500K .......... .......... .......... .......... .......... 93% 42.9M 0s
  6550K .......... .......... .......... .......... .......... 94% 37.8M 0s
  6600K .......... .......... .......... .......... .......... 94%  596K 0s
  6650K .......... .......... .......... .......... .......... 95% 53.0M 0s
  6700K .......... .......... .......... .......... .......... 96% 26.5M 0s
  6750K .......... .......... .......... .......... .......... 96% 18.5M 0s
  6800K .......... .......... .......... .......... .......... 97% 30.5M 0s
  6850K .......... .......... .......... .......... .......... 98% 33.0M 0s
  6900K .......... .......... .......... .......... .......... 99% 20.1M 0s
  6950K .......... .......... .......... .......... .......... 99% 31.6M 0s
  7000K .......... ......                                     100% 88.7M=1.6s

2020-10-28 09:19:12 (4.37 MB/s) - ‘linux-media.tar.bz2’ saved [7184997/7184997]

make: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
tar xfj linux-media.tar.bz2
rm -f .patches_applied .linked_dir .git_log.md5
make: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
**********************************************************
* Downloading firmwares from linuxtv.org.                *
**********************************************************
--2020-10-28 09:19:13--  http://www.linuxtv.org/downloads/firmware//dvb-firmwares.tar.bz2
Resolving www.linuxtv.org (www.linuxtv.org)... 130.149.80.248
Connecting to www.linuxtv.org (www.linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://www.linuxtv.org/downloads/firmware/dvb-firmwares.tar.bz2 [following]
--2020-10-28 09:19:13--  https://www.linuxtv.org/downloads/firmware/dvb-firmwares.tar.bz2
Connecting to www.linuxtv.org (www.linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1519951 (1.4M) [application/x-bzip2]
Saving to: ‘dvb-firmwares.tar.bz2’

     0K .......... .......... .......... .......... ..........  3%  161K 9s
    50K .......... .......... .......... .......... ..........  6%  323K 6s
   100K .......... .......... .......... .......... .......... 10% 13.1M 4s
   150K .......... .......... .......... .......... .......... 13% 1.26M 3s
   200K .......... .......... .......... .......... .......... 16%  435K 3s
   250K .......... .......... .......... .......... .......... 20% 12.9M 2s
   300K .......... .......... .......... .......... .......... 23% 13.1M 2s
   350K .......... .......... .......... .......... .......... 26% 13.3M 2s
   400K .......... .......... .......... .......... .......... 30%  351K 2s
   450K .......... .......... .......... .......... .......... 33% 15.3M 2s
   500K .......... .......... .......... .......... .......... 37% 15.8M 1s
   550K .......... .......... .......... .......... .......... 40% 22.6M 1s
   600K .......... .......... .......... .......... .......... 43% 17.7M 1s
   650K .......... .......... .......... .......... .......... 47% 21.6M 1s
   700K .......... .......... .......... .......... .......... 50% 11.3M 1s
   750K .......... .......... .......... .......... .......... 53% 37.3M 1s
   800K .......... .......... .......... .......... .......... 57% 2.22M 1s
   850K .......... .......... .......... .......... .......... 60%  441K 1s
   900K .......... .......... .......... .......... .......... 64% 16.1M 1s
   950K .......... .......... .......... .......... .......... 67% 26.0M 0s
  1000K .......... .......... .......... .......... .......... 70% 24.7M 0s
  1050K .......... .......... .......... .......... .......... 74% 28.1M 0s
  1100K .......... .......... .......... .......... .......... 77% 25.7M 0s
  1150K .......... .......... .......... .......... .......... 80% 31.7M 0s
  1200K .......... .......... .......... .......... .......... 84% 26.5M 0s
  1250K .......... .......... .......... .......... .......... 87% 30.9M 0s
  1300K .......... .......... .......... .......... .......... 90% 32.6M 0s
  1350K .......... .......... .......... .......... .......... 94% 26.7M 0s
  1400K .......... .......... .......... .......... .......... 97% 25.6M 0s
  1450K .......... .......... .......... ....                 100% 26.1M=1.0s

2020-10-28 09:19:15 (1.52 MB/s) - ‘dvb-firmwares.tar.bz2’ saved [1519951/1519951]

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
