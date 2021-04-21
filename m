Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE03336669C
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 10:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbhDUIBx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 21 Apr 2021 04:01:53 -0400
Received: from www.linuxtv.org ([130.149.80.248]:39410 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234101AbhDUIBw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 04:01:52 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lZ7nS-000dLS-R3; Wed, 21 Apr 2021 08:01:19 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lZ7rX-0006Ex-W6; Wed, 21 Apr 2021 08:05:32 +0000
Date:   Wed, 21 Apr 2021 08:05:31 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1617802693.1.1618992331987@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3471
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

See <https://builder.linuxtv.org/job/media-build/3471/display/redirect>

Changes:


------------------------------------------
[...truncated 9.34 KB...]
  2700K .......... .......... .......... .......... .......... 38% 18.4M 6s
  2750K .......... .......... .......... .......... .......... 39% 14.8M 6s
  2800K .......... .......... .......... .......... .......... 40% 1.16M 6s
  2850K .......... .......... .......... .......... .......... 40%  469K 6s
  2900K .......... .......... .......... .......... .......... 41% 16.3M 6s
  2950K .......... .......... .......... .......... .......... 42% 16.2M 6s
  3000K .......... .......... .......... .......... .......... 42% 1.22M 6s
  3050K .......... .......... .......... .......... .......... 43%  470K 6s
  3100K .......... .......... .......... .......... .......... 44% 15.2M 5s
  3150K .......... .......... .......... .......... .......... 44% 15.0M 5s
  3200K .......... .......... .......... .......... .......... 45% 1.21M 5s
  3250K .......... .......... .......... .......... .......... 46%  467K 5s
  3300K .......... .......... .......... .......... .......... 47% 4.43M 5s
  3350K .......... .......... .......... .......... .......... 47% 53.5M 5s
  3400K .......... .......... .......... .......... .......... 48%  159M 5s
  3450K .......... .......... .......... .......... .......... 49%  361K 5s
  3500K .......... .......... .......... .......... .......... 49% 11.6M 5s
  3550K .......... .......... .......... .......... .......... 50% 3.71M 5s
  3600K .......... .......... .......... .......... .......... 51% 4.66M 4s
  3650K .......... .......... .......... .......... .......... 52% 2.31M 4s
  3700K .......... .......... .......... .......... .......... 52%  464K 4s
  3750K .......... .......... .......... .......... .......... 53% 3.79M 4s
  3800K .......... .......... .......... .......... .......... 54% 3.92M 4s
  3850K .......... .......... .......... .......... .......... 54% 16.5M 4s
  3900K .......... .......... .......... .......... .......... 55% 2.79M 4s
  3950K .......... .......... .......... .......... .......... 56%  467K 4s
  4000K .......... .......... .......... .......... .......... 56% 3.51M 4s
  4050K .......... .......... .......... .......... .......... 57% 3.98M 4s
  4100K .......... .......... .......... .......... .......... 58% 15.9M 4s
  4150K .......... .......... .......... .......... .......... 59%  785K 3s
  4200K .......... .......... .......... .......... .......... 59%  827K 3s
  4250K .......... .......... .......... .......... .......... 60% 4.25M 3s
  4300K .......... .......... .......... .......... .......... 61% 2.49M 3s
  4350K .......... .......... .......... .......... .......... 61%  124M 3s
  4400K .......... .......... .......... .......... .......... 62% 2.41M 3s
  4450K .......... .......... .......... .......... .......... 63%  499K 3s
  4500K .......... .......... .......... .......... .......... 63% 4.03M 3s
  4550K .......... .......... .......... .......... .......... 64% 3.75M 3s
  4600K .......... .......... .......... .......... .......... 65% 5.25M 3s
  4650K .......... .......... .......... .......... .......... 66% 15.4M 3s
  4700K .......... .......... .......... .......... .......... 66%  442K 3s
  4750K .......... .......... .......... .......... .......... 67% 15.0M 3s
  4800K .......... .......... .......... .......... .......... 68% 3.64M 3s
  4850K .......... .......... .......... .......... .......... 68% 2.62M 2s
  4900K .......... .......... .......... .......... .......... 69% 16.8M 2s
  4950K .......... .......... .......... .......... .......... 70% 15.9M 2s
  5000K .......... .......... .......... .......... .......... 71%  444K 2s
  5050K .......... .......... .......... .......... .......... 71% 14.6M 2s
  5100K .......... .......... .......... .......... .......... 72% 3.99M 2s
  5150K .......... .......... .......... .......... .......... 73% 4.10M 2s
  5200K .......... .......... .......... .......... .......... 73% 4.38M 2s
  5250K .......... .......... .......... .......... .......... 74% 5.51M 2s
  5300K .......... .......... .......... .......... .......... 75%  472K 2s
  5350K .......... .......... .......... .......... .......... 75% 12.9M 2s
  5400K .......... .......... .......... .......... .......... 76% 4.62M 2s
  5450K .......... .......... .......... .......... .......... 77% 3.86M 2s
  5500K .......... .......... .......... .......... .......... 78% 5.00M 2s
  5550K .......... .......... .......... .......... .......... 78% 17.1M 2s
  5600K .......... .......... .......... .......... .......... 79%  444K 2s
  5650K .......... .......... .......... .......... .......... 80% 13.2M 1s
  5700K .......... .......... .......... .......... .......... 80% 4.61M 1s
  5750K .......... .......... .......... .......... .......... 81% 13.1M 1s
  5800K .......... .......... .......... .......... .......... 82% 2.61M 1s
  5850K .......... .......... .......... .......... .......... 82% 13.0M 1s
  5900K .......... .......... .......... .......... .......... 83% 17.8M 1s
  5950K .......... .......... .......... .......... .......... 84%  155K 1s
  6000K .......... .......... .......... .......... .......... 85% 19.2M 1s
  6050K .......... .......... .......... .......... .......... 85% 29.5M 1s
  6100K .......... .......... .......... .......... .......... 86% 60.8M 1s
  6150K .......... .......... .......... .......... .......... 87% 54.0M 1s
  6200K .......... .......... .......... .......... .......... 87% 56.1M 1s
  6250K .......... .......... .......... .......... .......... 88% 62.5M 1s
  6300K .......... .......... .......... .......... .......... 89% 60.9M 1s
  6350K .......... .......... .......... .......... .......... 89% 61.5M 1s
  6400K .......... .......... .......... .......... .......... 90% 51.9M 1s
  6450K .......... .......... .......... .......... .......... 91% 58.5M 1s
  6500K .......... .......... .......... .......... .......... 92% 5.88M 1s
  6550K .......... .......... .......... .......... .......... 92% 15.2M 0s
  6600K .......... .......... .......... .......... .......... 93% 15.0M 0s
  6650K .......... .......... .......... .......... .......... 94% 16.3M 0s
  6700K .......... .......... .......... .......... .......... 94%  481K 0s
  6750K .......... .......... .......... .......... .......... 95% 3.15M 0s
  6800K .......... .......... .......... .......... .......... 96% 6.81M 0s
  6850K .......... .......... .......... .......... .......... 97% 15.8M 0s
  6900K .......... .......... .......... .......... .......... 97% 3.18M 0s
  6950K .......... .......... .......... .......... .......... 98% 15.9M 0s
  7000K .......... .......... .......... .......... .......... 99% 15.0M 0s
  7050K .......... .......... .......... .......... .......... 99%  731K 0s
  7100K .......... .                                          100%  318K=6.5s

2021-04-21 08:05:25 (1.07 MB/s) - ‘linux-media.tar.bz2’ saved [7281901/7281901]

make: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
tar xfj linux-media.tar.bz2
rm -f .patches_applied .linked_dir .git_log.md5
make: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
**********************************************************
* Downloading firmwares from linuxtv.org.                *
**********************************************************
--2021-04-21 08:05:26--  http://www.linuxtv.org/downloads/firmware//dvb-firmwares.tar.bz2
Resolving www.linuxtv.org (www.linuxtv.org)... 130.149.80.248
Connecting to www.linuxtv.org (www.linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://www.linuxtv.org/downloads/firmware/dvb-firmwares.tar.bz2 [following]
--2021-04-21 08:05:26--  https://www.linuxtv.org/downloads/firmware/dvb-firmwares.tar.bz2
Connecting to www.linuxtv.org (www.linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1519951 (1.4M) [application/x-bzip2]
Saving to: ‘dvb-firmwares.tar.bz2’

     0K .......... .......... .......... .......... ..........  3%  161K 9s
    50K .......... .......... .......... .......... ..........  6%  322K 6s
   100K .......... .......... .......... .......... .......... 10%  327K 5s
   150K .......... .......... .......... .......... .......... 13% 3.67M 4s
   200K .......... .......... .......... .......... .......... 16%  345K 4s
   250K .......... .......... .......... .......... .......... 20%  330K 4s
   300K .......... .......... .......... .......... .......... 23% 3.73M 3s
   350K .......... .......... .......... .......... .......... 26%  346K 3s
   400K .......... .......... .......... .......... .......... 30%  326K 3s
   450K .......... .......... .......... .......... .......... 33% 4.29M 2s
   500K .......... .......... .......... .......... .......... 37%  347K 2s
   550K .......... .......... .......... .......... .......... 40% 4.36M 2s
   600K .......... .......... .......... .......... .......... 43%  336K 2s
   650K .......... .......... .......... .......... .......... 47% 1.02M 2s
   700K .......... .......... .......... .......... .......... 50%  467K 2s
   750K .......... .......... .......... .......... .......... 53% 1.02M 2s
   800K .......... .......... .......... .......... .......... 57%  449K 1s
   850K .......... .......... .......... .......... .......... 60%  349K 1s
   900K .......... .......... .......... .......... .......... 64% 4.45M 1s
   950K .......... .......... .......... .......... .......... 67%  352K 1s
  1000K .......... .......... .......... .......... .......... 70% 5.73M 1s
  1050K .......... .......... .......... .......... .......... 74% 1.02M 1s
  1100K .......... .......... .......... .......... .......... 77%  494K 1s
  1150K .......... .......... .......... .......... .......... 80% 4.55M 1s
  1200K .......... .......... .......... .......... .......... 84%  347K 0s
  1250K .......... .......... .......... .......... .......... 87% 4.72M 0s
  1300K .......... .......... .......... .......... .......... 90%  351K 0s
  1350K .......... .......... .......... .......... .......... 94% 4.47M 0s
  1400K .......... .......... .......... .......... .......... 97% 16.1M 0s
  1450K .......... .......... .......... ....                 100%  244K=2.8s

2021-04-21 08:05:30 (533 KB/s) - ‘dvb-firmwares.tar.bz2’ saved [1519951/1519951]

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
patch -s -f -N -p1 -i ../backports/v5.0_gpio.patch
patch -s -f -N -p1 -i ../backports/v4.20_access_ok.patch
Patched drivers/media/dvb-core/dvbdev.c
Patched drivers/media/v4l2-core/v4l2-dev.c
Patched drivers/media/rc/rc-main.c
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
./scripts/make_kconfig.pl /lib/modules/4.19.0-12-amd64/build /lib/modules/4.19.0-12-amd64/build 1
File not found: /lib/modules/4.19.0-12-amd64/build/.config at ./scripts/make_kconfig.pl line 33, <IN> line 4.
Preparing to compile for kernel version 4.19.0
make[1]: *** [Makefile:367: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
