Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A007E3ED14B
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 11:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235406AbhHPJuW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 16 Aug 2021 05:50:22 -0400
Received: from www.linuxtv.org ([130.149.80.248]:37446 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235368AbhHPJuV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 05:50:21 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFZFd-0017DW-27; Mon, 16 Aug 2021 09:49:49 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFZFb-0001Sc-2f; Mon, 16 Aug 2021 09:49:47 +0000
Date:   Mon, 16 Aug 2021 09:49:46 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <75044628.0.1629107387048@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3596
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

See <https://builder.linuxtv.org/job/media-build/3596/display/redirect>

Changes:


------------------------------------------
[...truncated 6.77 KB...]
   650K .......... .......... .......... .......... ..........  9% 28.9M 7s
   700K .......... .......... .......... .......... .......... 10% 28.7M 7s
   750K .......... .......... .......... .......... .......... 11% 29.4M 6s
   800K .......... .......... .......... .......... .......... 11%  357K 7s
   850K .......... .......... .......... .......... .......... 12% 26.3M 6s
   900K .......... .......... .......... .......... .......... 13% 31.4M 6s
   950K .......... .......... .......... .......... .......... 13% 28.9M 6s
  1000K .......... .......... .......... .......... .......... 14% 29.0M 5s
  1050K .......... .......... .......... .......... .......... 15% 29.3M 5s
  1100K .......... .......... .......... .......... .......... 16% 26.3M 5s
  1150K .......... .......... .......... .......... .......... 16% 24.7M 5s
  1200K .......... .......... .......... .......... .......... 17% 13.0M 4s
  1250K .......... .......... .......... .......... .......... 18%  236M 4s
  1300K .......... .......... .......... .......... .......... 18% 29.1M 4s
  1350K .......... .......... .......... .......... .......... 19% 30.8M 4s
  1400K .......... .......... .......... .......... .......... 20% 29.6M 4s
  1450K .......... .......... .......... .......... .......... 20% 28.9M 4s
  1500K .......... .......... .......... .......... .......... 21% 29.3M 3s
  1550K .......... .......... .......... .......... .......... 22% 28.7M 3s
  1600K .......... .......... .......... .......... .......... 23% 22.2M 3s
  1650K .......... .......... .......... .......... .......... 23%  402K 3s
  1700K .......... .......... .......... .......... .......... 24% 30.4M 3s
  1750K .......... .......... .......... .......... .......... 25% 29.6M 3s
  1800K .......... .......... .......... .......... .......... 25% 26.2M 3s
  1850K .......... .......... .......... .......... .......... 26% 27.2M 3s
  1900K .......... .......... .......... .......... .......... 27% 31.1M 3s
  1950K .......... .......... .......... .......... .......... 27% 29.2M 3s
  2000K .......... .......... .......... .......... .......... 28% 22.6M 3s
  2050K .......... .......... .......... .......... .......... 29% 27.3M 3s
  2100K .......... .......... .......... .......... .......... 30% 33.9M 3s
  2150K .......... .......... .......... .......... .......... 30% 32.9M 2s
  2200K .......... .......... .......... .......... .......... 31% 28.6M 2s
  2250K .......... .......... .......... .......... .......... 32% 27.1M 2s
  2300K .......... .......... .......... .......... .......... 32% 26.0M 2s
  2350K .......... .......... .......... .......... .......... 33% 26.3M 2s
  2400K .......... .......... .......... .......... .......... 34% 20.3M 2s
  2450K .......... .......... .......... .......... .......... 34% 27.0M 2s
  2500K .......... .......... .......... .......... .......... 35% 28.4M 2s
  2550K .......... .......... .......... .......... .......... 36% 28.5M 2s
  2600K .......... .......... .......... .......... .......... 36% 29.0M 2s
  2650K .......... .......... .......... .......... .......... 37% 29.5M 2s
  2700K .......... .......... .......... .......... .......... 38% 27.7M 2s
  2750K .......... .......... .......... .......... .......... 39% 29.9M 2s
  2800K .......... .......... .......... .......... .......... 39% 22.2M 2s
  2850K .......... .......... .......... .......... .......... 40% 28.1M 2s
  2900K .......... .......... .......... .......... .......... 41% 28.9M 2s
  2950K .......... .......... .......... .......... .......... 41% 25.0M 2s
  3000K .......... .......... .......... .......... .......... 42% 29.5M 2s
  3050K .......... .......... .......... .......... .......... 43% 27.8M 1s
  3100K .......... .......... .......... .......... .......... 43% 29.8M 1s
  3150K .......... .......... .......... .......... .......... 44% 28.3M 1s
  3200K .......... .......... .......... .......... .......... 45% 23.1M 1s
  3250K .......... .......... .......... .......... .......... 46% 27.4M 1s
  3300K .......... .......... .......... .......... .......... 46% 27.7M 1s
  3350K .......... .......... .......... .......... .......... 47%  529K 1s
  3400K .......... .......... .......... .......... .......... 48% 71.3M 1s
  3450K .......... .......... .......... .......... .......... 48% 54.5M 1s
  3500K .......... .......... .......... .......... .......... 49% 58.7M 1s
  3550K .......... .......... .......... .......... .......... 50% 54.1M 1s
  3600K .......... .......... .......... .......... .......... 50% 45.6M 1s
  3650K .......... .......... .......... .......... .......... 51% 64.7M 1s
  3700K .......... .......... .......... .......... .......... 52% 53.6M 1s
  3750K .......... .......... .......... .......... .......... 53% 53.6M 1s
  3800K .......... .......... .......... .......... .......... 53% 36.4M 1s
  3850K .......... .......... .......... .......... .......... 54% 23.5M 1s
  3900K .......... .......... .......... .......... .......... 55% 28.5M 1s
  3950K .......... .......... .......... .......... .......... 55% 29.3M 1s
  4000K .......... .......... .......... .......... .......... 56% 21.7M 1s
  4050K .......... .......... .......... .......... .......... 57% 30.2M 1s
  4100K .......... .......... .......... .......... .......... 57% 27.7M 1s
  4150K .......... .......... .......... .......... .......... 58% 26.2M 1s
  4200K .......... .......... .......... .......... .......... 59% 26.7M 1s
  4250K .......... .......... .......... .......... .......... 60%  322K 1s
  4300K .......... .......... .......... .......... .......... 60% 45.8M 1s
  4350K .......... .......... .......... .......... .......... 61%  185M 1s
  4400K .......... .......... .......... .......... .......... 62%  197M 1s
  4450K .......... .......... .......... .......... .......... 62%  203M 1s
  4500K .......... .......... .......... .......... .......... 63%  140M 1s
  4550K .......... .......... .......... .......... .......... 64%  169M 1s
  4600K .......... .......... .......... .......... .......... 64%  135M 1s
  4650K .......... .......... .......... .......... .......... 65%  146M 1s
  4700K .......... .......... .......... .......... .......... 66%  171M 1s
  4750K .......... .......... .......... .......... .......... 66%  161M 1s
  4800K .......... .......... .......... .......... .......... 67%  135M 1s
  4850K .......... .......... .......... .......... .......... 68%  170M 1s
  4900K .......... .......... .......... .......... .......... 69%  157M 1s
  4950K .......... .......... .......... .......... .......... 69%  166M 1s
  5000K .......... .......... .......... .......... .......... 70%  130M 1s
  5050K .......... .......... .......... .......... .......... 71%  181M 1s
  5100K .......... .......... .......... .......... .......... 71%  179M 1s
  5150K .......... .......... .......... .......... .......... 72%  179M 1s
  5200K .......... .......... .......... .......... .......... 73%  136M 1s
  5250K .......... .......... .......... .......... .......... 73%  155M 0s
  5300K .......... .......... .......... .......... .......... 74%  154M 0s
  5350K .......... .......... .......... .......... .......... 75%  152M 0s
  5400K .......... .......... .......... .......... .......... 76%  148M 0s
  5450K .......... .......... .......... .......... .......... 76%  180M 0s
  5500K .......... .......... .......... .......... .......... 77%  180M 0s
  5550K .......... .......... .......... .......... .......... 78%  141M 0s
  5600K .......... .......... .......... .......... .......... 78%  134M 0s
  5650K .......... .......... .......... .......... .......... 79%  164M 0s
  5700K .......... .......... .......... .......... .......... 80%  159M 0s
  5750K .......... .......... .......... .......... .......... 80%  178M 0s
  5800K .......... .......... .......... .......... .......... 81%  144M 0s
  5850K .......... .......... .......... .......... .......... 82%  147M 0s
  5900K .......... .......... .......... .......... .......... 83%  136M 0s
  5950K .......... .......... .......... .......... .......... 83%  174M 0s
  6000K .......... .......... .......... .......... .......... 84%  139M 0s
  6050K .......... .......... .......... .......... .......... 85%  162M 0s
  6100K .......... .......... .......... .......... .......... 85%  175M 0s
  6150K .......... .......... .......... .......... .......... 86%  162M 0s
  6200K .......... .......... .......... .......... .......... 87%  139M 0s
  6250K .......... .......... .......... .......... .......... 87%  172M 0s
  6300K .......... .......... .......... .......... .......... 88%  103M 0s
  6350K .......... .......... .......... .......... .......... 89%  169M 0s
  6400K .......... .......... .......... .......... .......... 90%  150M 0s
  6450K .......... .......... .......... .......... .......... 90%  192M 0s
  6500K .......... .......... .......... .......... .......... 91%  161M 0s
  6550K .......... .......... .......... .......... .......... 92%  119M 0s
  6600K .......... .......... .......... .......... .......... 92%  150M 0s
  6650K .......... .......... .......... .......... .......... 93%  114M 0s
  6700K .......... .......... .......... .......... .......... 94%  182M 0s
  6750K .......... .......... .......... .......... .......... 94%  182M 0s
  6800K .......... .......... .......... .......... .......... 95%  143M 0s
  6850K .......... .......... .......... .......... .......... 96%  162M 0s
  6900K .......... .......... .......... .......... .......... 97%  137M 0s
  6950K .......... .......... .......... .......... .......... 97%  179M 0s
  7000K .......... .......... .......... .......... .......... 98%  136M 0s
  7050K .......... .......... .......... .......... .......... 99%  178M 0s
  7100K .......... .......... .......... .......... .......... 99%  129M 0s
  7150K .......... ....                                       100%  130M=1.4s

2021-08-16 09:49:39 (4.92 MB/s) - ‘linux-media.tar.bz2’ saved [7336808/7336808]

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
