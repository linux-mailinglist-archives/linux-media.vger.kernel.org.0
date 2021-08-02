Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1003DD5EB
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 14:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbhHBMoW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 2 Aug 2021 08:44:22 -0400
Received: from www.linuxtv.org ([130.149.80.248]:40004 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233645AbhHBMoW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Aug 2021 08:44:22 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mAXIh-00Ffjg-6t; Mon, 02 Aug 2021 12:44:11 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mAXIf-0000Hm-6N; Mon, 02 Aug 2021 12:44:09 +0000
Date:   Mon, 2 Aug 2021 12:44:09 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1859950080.1.1627908249190@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3584
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

See <https://builder.linuxtv.org/job/media-build/3584/display/redirect>

Changes:


------------------------------------------
[...truncated 9.83 KB...]
  2800K .......... .......... .......... .......... .......... 39% 1.33M 6s
  2850K .......... .......... .......... .......... .......... 40%  440K 6s
  2900K .......... .......... .......... .......... .......... 41% 14.9M 6s
  2950K .......... .......... .......... .......... .......... 42% 16.0M 6s
  3000K .......... .......... .......... .......... .......... 42% 1.41M 6s
  3050K .......... .......... .......... .......... .......... 43%  442K 6s
  3100K .......... .......... .......... .......... .......... 44% 15.3M 6s
  3150K .......... .......... .......... .......... .......... 44% 16.3M 6s
  3200K .......... .......... .......... .......... .......... 45% 1.38M 5s
  3250K .......... .......... .......... .......... .......... 46%  440K 5s
  3300K .......... .......... .......... .......... .......... 46% 17.5M 5s
  3350K .......... .......... .......... .......... .......... 47% 9.86M 5s
  3400K .......... .......... .......... .......... .......... 48% 1.53M 5s
  3450K .......... .......... .......... .......... .......... 49%  444K 5s
  3500K .......... .......... .......... .......... .......... 49% 14.4M 5s
  3550K .......... .......... .......... .......... .......... 50% 7.72M 5s
  3600K .......... .......... .......... .......... .......... 51% 12.0M 5s
  3650K .......... .......... .......... .......... .......... 51%  700K 5s
  3700K .......... .......... .......... .......... .......... 52%  686K 4s
  3750K .......... .......... .......... .......... .......... 53% 25.3M 4s
  3800K .......... .......... .......... .......... .......... 53% 8.16M 4s
  3850K .......... .......... .......... .......... .......... 54% 1.66M 4s
  3900K .......... .......... .......... .......... .......... 55% 1.10M 4s
  3950K .......... .......... .......... .......... .......... 56%  677K 4s
  4000K .......... .......... .......... .......... .......... 56% 12.5M 4s
  4050K .......... .......... .......... .......... .......... 57% 13.6M 4s
  4100K .......... .......... .......... .......... .......... 58% 1.68M 4s
  4150K .......... .......... .......... .......... .......... 58%  563K 4s
  4200K .......... .......... .......... .......... .......... 59% 1.65M 4s
  4250K .......... .......... .......... .......... .......... 60% 16.5M 3s
  4300K .......... .......... .......... .......... .......... 60% 16.2M 3s
  4350K .......... .......... .......... .......... .......... 61% 14.9M 3s
  4400K .......... .......... .......... .......... .......... 62%  701K 3s
  4450K .......... .......... .......... .......... .......... 63%  681K 3s
  4500K .......... .......... .......... .......... .......... 63% 14.5M 3s
  4550K .......... .......... .......... .......... .......... 64% 14.6M 3s
  4600K .......... .......... .......... .......... .......... 65% 15.4M 3s
  4650K .......... .......... .......... .......... .......... 65% 1.75M 3s
  4700K .......... .......... .......... .......... .......... 66%  446K 3s
  4750K .......... .......... .......... .......... .......... 67% 4.26M 3s
  4800K .......... .......... .......... .......... .......... 67%  109M 3s
  4850K .......... .......... .......... .......... .......... 68% 71.2M 3s
  4900K .......... .......... .......... .......... .......... 69% 16.8M 2s
  4950K .......... .......... .......... .......... .......... 70% 1.74M 2s
  5000K .......... .......... .......... .......... .......... 70%  448K 2s
  5050K .......... .......... .......... .......... .......... 71% 4.17M 2s
  5100K .......... .......... .......... .......... .......... 72% 14.6M 2s
  5150K .......... .......... .......... .......... .......... 72% 15.3M 2s
  5200K .......... .......... .......... .......... .......... 73% 12.2M 2s
  5250K .......... .......... .......... .......... .......... 74% 2.37M 2s
  5300K .......... .......... .......... .......... .......... 74%  447K 2s
  5350K .......... .......... .......... .......... .......... 75% 4.25M 2s
  5400K .......... .......... .......... .......... .......... 76% 12.3M 2s
  5450K .......... .......... .......... .......... .......... 77% 13.8M 2s
  5500K .......... .......... .......... .......... .......... 77% 16.8M 2s
  5550K .......... .......... .......... .......... .......... 78% 2.54M 2s
  5600K .......... .......... .......... .......... .......... 79%  446K 2s
  5650K .......... .......... .......... .......... .......... 79% 4.18M 2s
  5700K .......... .......... .......... .......... .......... 80% 13.5M 1s
  5750K .......... .......... .......... .......... .......... 81% 14.6M 1s
  5800K .......... .......... .......... .......... .......... 81% 14.7M 1s
  5850K .......... .......... .......... .......... .......... 82% 16.6M 1s
  5900K .......... .......... .......... .......... .......... 83% 2.56M 1s
  5950K .......... .......... .......... .......... .......... 84%  451K 1s
  6000K .......... .......... .......... .......... .......... 84% 4.01M 1s
  6050K .......... .......... .......... .......... .......... 85% 13.6M 1s
  6100K .......... .......... .......... .......... .......... 86% 15.2M 1s
  6150K .......... .......... .......... .......... .......... 86% 15.4M 1s
  6200K .......... .......... .......... .......... .......... 87% 17.4M 1s
  6250K .......... .......... .......... .......... .......... 88% 2.59M 1s
  6300K .......... .......... .......... .......... .......... 88%  452K 1s
  6350K .......... .......... .......... .......... .......... 89% 9.49M 1s
  6400K .......... .......... .......... .......... .......... 90% 4.88M 1s
  6450K .......... .......... .......... .......... .......... 91% 13.9M 1s
  6500K .......... .......... .......... .......... .......... 91% 16.1M 1s
  6550K .......... .......... .......... .......... .......... 92% 17.2M 1s
  6600K .......... .......... .......... .......... .......... 93% 2.66M 0s
  6650K .......... .......... .......... .......... .......... 93% 1.12M 0s
  6700K .......... .......... .......... .......... .......... 94%  713K 0s
  6750K .......... .......... .......... .......... .......... 95% 4.56M 0s
  6800K .......... .......... .......... .......... .......... 95% 10.9M 0s
  6850K .......... .......... .......... .......... .......... 96% 17.6M 0s
  6900K .......... .......... .......... .......... .......... 97% 14.1M 0s
  6950K .......... .......... .......... .......... .......... 98% 18.3M 0s
  7000K .......... .......... .......... .......... .......... 98% 2.73M 0s
  7050K .......... .......... .......... .......... .......... 99%  573K 0s
  7100K .......... .......... .......... ........             100% 1.48M=6.6s

2021-08-02 12:44:02 (1.05 MB/s) - ‘linux-media.tar.bz2’ saved [7309791/7309791]

make: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
tar xfj linux-media.tar.bz2
rm -f .patches_applied .linked_dir .git_log.md5
make: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
**********************************************************
* Downloading firmwares from linuxtv.org.                *
**********************************************************
--2021-08-02 12:44:04--  http://www.linuxtv.org/downloads/firmware//dvb-firmwares.tar.bz2
Resolving www.linuxtv.org (www.linuxtv.org)... 130.149.80.248
Connecting to www.linuxtv.org (www.linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://www.linuxtv.org/downloads/firmware/dvb-firmwares.tar.bz2 [following]
--2021-08-02 12:44:04--  https://www.linuxtv.org/downloads/firmware/dvb-firmwares.tar.bz2
Connecting to www.linuxtv.org (www.linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1519951 (1.4M) [application/x-bzip2]
Saving to: ‘dvb-firmwares.tar.bz2’

     0K .......... .......... .......... .......... ..........  3%  154K 9s
    50K .......... .......... .......... .......... ..........  6%  310K 7s
   100K .......... .......... .......... .......... .......... 10%  311K 6s
   150K .......... .......... .......... .......... .......... 13% 20.5M 4s
   200K .......... .......... .......... .......... .......... 16%  309K 4s
   250K .......... .......... .......... .......... .......... 20%  311K 4s
   300K .......... .......... .......... .......... .......... 23%  311K 4s
   350K .......... .......... .......... .......... .......... 26% 19.2M 3s
   400K .......... .......... .......... .......... .......... 30%  309K 3s
   450K .......... .......... .......... .......... .......... 33%  313K 3s
   500K .......... .......... .......... .......... .......... 37% 15.6M 2s
   550K .......... .......... .......... .......... .......... 40%  313K 2s
   600K .......... .......... .......... .......... .......... 43% 16.5M 2s
   650K .......... .......... .......... .......... .......... 47%  314K 2s
   700K .......... .......... .......... .......... .......... 50%  314K 2s
   750K .......... .......... .......... .......... .......... 53% 17.0M 2s
   800K .......... .......... .......... .......... .......... 57%  312K 2s
   850K .......... .......... .......... .......... .......... 60% 19.1M 1s
   900K .......... .......... .......... .......... .......... 64%  315K 1s
   950K .......... .......... .......... .......... .......... 67% 17.5M 1s
  1000K .......... .......... .......... .......... .......... 70%  322K 1s
  1050K .......... .......... .......... .......... .......... 74% 15.4M 1s
  1100K .......... .......... .......... .......... .......... 77%  332K 1s
  1150K .......... .......... .......... .......... .......... 80% 16.9M 1s
  1200K .......... .......... .......... .......... .......... 84%  328K 1s
  1250K .......... .......... .......... .......... .......... 87% 17.9M 0s
  1300K .......... .......... .......... .......... .......... 90% 17.7M 0s
  1350K .......... .......... .......... .......... .......... 94%  333K 0s
  1400K .......... .......... .......... .......... .......... 97% 16.3M 0s
  1450K .......... .......... .......... ....                 100%  774K=2.9s

2021-08-02 12:44:08 (506 KB/s) - ‘dvb-firmwares.tar.bz2’ saved [1519951/1519951]

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
No version yet, using 4.19.0-17-amd64
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Applying patches for kernel 4.19.0-17-amd64
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
patch -s -f -N -p1 -i ../backports/v5.0_gpio.patch
patch -s -f -N -p1 -i ../backports/v4.20_access_ok.patch
Patched drivers/media/dvb-core/dvbdev.c
Patched drivers/media/v4l2-core/v4l2-dev.c
Patched drivers/media/rc/rc-main.c
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
./scripts/make_kconfig.pl /lib/modules/4.19.0-17-amd64/build /lib/modules/4.19.0-17-amd64/build 1
File not found: /lib/modules/4.19.0-17-amd64/build/.config at ./scripts/make_kconfig.pl line 33, <IN> line 4.
Preparing to compile for kernel version 4.19.0
make[1]: *** [Makefile:367: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
