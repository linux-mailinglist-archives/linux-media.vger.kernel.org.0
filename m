Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04202A6060
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 10:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728612AbgKDJQZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 4 Nov 2020 04:16:25 -0500
Received: from www.linuxtv.org ([130.149.80.248]:48668 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728508AbgKDJQY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 04:16:24 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kaEtv-00ELIw-41; Wed, 04 Nov 2020 09:16:19 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kaEwt-0003Hl-62; Wed, 04 Nov 2020 09:19:24 +0000
Date:   Wed, 4 Nov 2020 09:19:23 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <655715789.25.1604481563179@builder.linuxtv.org>
In-Reply-To: <1447631724.24.1604395162027@builder.linuxtv.org>
References: <1447631724.24.1604395162027@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3276
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

See <https://builder.linuxtv.org/job/media-build/3276/display/redirect>

Changes:


------------------------------------------
[...truncated 4.29 KB...]
     0K .......... .......... .......... .......... ..........  0% 80.7K 86s
    50K .......... .......... .......... .......... ..........  1%  107K 75s
   100K .......... .......... .......... .......... ..........  2%  108K 71s
   150K .......... .......... .......... .......... ..........  2%  161K 63s
   200K .......... .......... .......... .......... ..........  3%  161K 59s
   250K .......... .......... .......... .......... ..........  4%  162K 56s
   300K .......... .......... .......... .......... ..........  4%  161K 53s
   350K .......... .......... .......... .......... ..........  5%  256K 49s
   400K .......... .......... .......... .......... ..........  6%  162K 48s
   450K .......... .......... .......... .......... ..........  7%  321K 45s
   500K .......... .......... .......... .......... ..........  7%  185K 44s
   550K .......... .......... .......... .......... ..........  8%  322K 41s
   600K .......... .......... .......... .......... ..........  9%  322K 39s
   650K .......... .......... .......... .......... ..........  9%  323K 38s
   700K .......... .......... .......... .......... .......... 10%  323K 36s
   750K .......... .......... .......... .......... .......... 11%  323K 35s
   800K .......... .......... .......... .......... .......... 12%  322K 34s
   850K .......... .......... .......... .......... .......... 12%  613K 32s
   900K .......... .......... .......... .......... .......... 13%  447K 31s
   950K .......... .......... .......... .......... .......... 14%  428K 30s
  1000K .......... .......... .......... .......... .......... 14%  614K 29s
  1050K .......... .......... .......... .......... .......... 15%  450K 28s
  1100K .......... .......... .......... .......... .......... 16%  429K 27s
  1150K .......... .......... .......... .......... .......... 17% 1.26M 26s
  1200K .......... .......... .......... .......... .......... 17%  416K 25s
  1250K .......... .......... .......... .......... .......... 18% 1.38M 24s
  1300K .......... .......... .......... .......... .......... 19%  419K 23s
  1350K .......... .......... .......... .......... .......... 19% 1.38M 23s
  1400K .......... .......... .......... .......... .......... 20%  428K 22s
  1450K .......... .......... .......... .......... .......... 21% 1.30M 21s
  1500K .......... .......... .......... .......... .......... 22%  428K 21s
  1550K .......... .......... .......... .......... .......... 22% 1.29M 20s
  1600K .......... .......... .......... .......... .......... 23%  430K 20s
  1650K .......... .......... .......... .......... .......... 24% 12.6M 19s
  1700K .......... .......... .......... .......... .......... 24% 1.34M 18s
  1750K .......... .......... .......... .......... .......... 25%  434K 18s
  1800K .......... .......... .......... .......... .......... 26% 1.13M 17s
  1850K .......... .......... .......... .......... .......... 27%  314K 17s
  1900K .......... .......... .......... .......... .......... 27%  126M 17s
  1950K .......... .......... .......... .......... .......... 28%  123M 16s
  2000K .......... .......... .......... .......... .......... 29%  467K 16s
  2050K .......... .......... .......... .......... .......... 29% 1.11M 15s
  2100K .......... .......... .......... .......... .......... 30%  453K 15s
  2150K .......... .......... .......... .......... .......... 31% 1.11M 15s
  2200K .......... .......... .......... .......... .......... 32%  632K 14s
  2250K .......... .......... .......... .......... .......... 32%  661K 14s
  2300K .......... .......... .......... .......... .......... 33% 18.4M 14s
  2350K .......... .......... .......... .......... .......... 34%  451K 13s
  2400K .......... .......... .......... .......... .......... 34% 1.11M 13s
  2450K .......... .......... .......... .......... .......... 35%  454K 13s
  2500K .......... .......... .......... .......... .......... 36% 1.14M 13s
  2550K .......... .......... .......... .......... .......... 37%  454K 12s
  2600K .......... .......... .......... .......... .......... 37% 1.12M 12s
  2650K .......... .......... .......... .......... .......... 38% 20.1M 12s
  2700K .......... .......... .......... .......... .......... 39%  455K 12s
  2750K .......... .......... .......... .......... .......... 39% 1.13M 11s
  2800K .......... .......... .......... .......... .......... 40%  452K 11s
  2850K .......... .......... .......... .......... .......... 41% 1.12M 11s
  2900K .......... .......... .......... .......... .......... 42% 22.5M 11s
  2950K .......... .......... .......... .......... .......... 42%  453K 10s
  3000K .......... .......... .......... .......... .......... 43% 1.13M 10s
  3050K .......... .......... .......... .......... .......... 44%  634K 10s
  3100K .......... .......... .......... .......... .......... 44% 1.44M 10s
  3150K .......... .......... .......... .......... .......... 45% 1.13M 9s
  3200K .......... .......... .......... .......... .......... 46%  456K 9s
  3250K .......... .......... .......... .......... .......... 47% 1.13M 9s
  3300K .......... .......... .......... .......... .......... 47% 1.29M 9s
  3350K .......... .......... .......... .......... .......... 48%  676K 9s
  3400K .......... .......... .......... .......... .......... 49% 1.13M 9s
  3450K .......... .......... .......... .......... .......... 49%  642K 8s
  3500K .......... .......... .......... .......... .......... 50% 1.41M 8s
  3550K .......... .......... .......... .......... .......... 51% 1.14M 8s
  3600K .......... .......... .......... .......... .......... 52%  454K 8s
  3650K .......... .......... .......... .......... .......... 52% 1.12M 8s
  3700K .......... .......... .......... .......... .......... 53% 21.0M 7s
  3750K .......... .......... .......... .......... .......... 54%  454K 7s
  3800K .......... .......... .......... .......... .......... 54% 1.15M 7s
  3850K .......... .......... .......... .......... .......... 55% 22.9M 7s
  3900K .......... .......... .......... .......... .......... 56%  453K 7s
  3950K .......... .......... .......... .......... .......... 57% 1.15M 7s
  4000K .......... .......... .......... .......... .......... 57%  636K 7s
  4050K .......... .......... .......... .......... .......... 58% 1.43M 6s
  4100K .......... .......... .......... .......... .......... 59% 1.14M 6s
  4150K .......... .......... .......... .......... .......... 59%  642K 6s
  4200K .......... .......... .......... .......... .......... 60% 1.43M 6s
  4250K .......... .......... .......... .......... .......... 61% 1.14M 6s
  4300K .......... .......... .......... .......... .......... 61%  643K 6s
  4350K .......... .......... .......... .......... .......... 62% 1.43M 6s
  4400K .......... .......... .......... .......... .......... 63% 1.12M 5s
  4450K .......... .......... .......... .......... .......... 64%  645K 5s
  4500K .......... .......... .......... .......... .......... 64%  663K 5s
  4550K .......... .......... .......... .......... .......... 65% 27.5M 5s
  4600K .......... .......... .......... .......... .......... 66%  643K 5s
  4650K .......... .......... .......... .......... .......... 66% 1.42M 5s
  4700K .......... .......... .......... .......... .......... 67% 1.15M 5s
  4750K .......... .......... .......... .......... .......... 68%  643K 4s
  4800K .......... .......... .......... .......... .......... 69%  660K 4s
  4850K .......... .......... .......... .......... .......... 69% 1.25M 4s
  4900K .......... .......... .......... .......... .......... 70%  685K 4s
  4950K .......... .......... .......... .......... .......... 71% 1.13M 4s
  5000K .......... .......... .......... .......... .......... 71% 1.26M 4s
  5050K .......... .......... .......... .......... .......... 72%  688K 4s
  5100K .......... .......... .......... .......... .......... 73% 1.12M 4s
  5150K .......... .......... .......... .......... .......... 74% 1.26M 4s
  5200K .......... .......... .......... .......... .......... 74%  686K 3s
  5250K .......... .......... .......... .......... .......... 75% 1.11M 3s
  5300K .......... .......... .......... .......... .......... 76%  649K 3s
  5350K .......... .......... .......... .......... .......... 76% 1.45M 3s
  5400K .......... .......... .......... .......... .......... 77% 1.10M 3s
  5450K .......... .......... .......... .......... .......... 78%  648K 3s
  5500K .......... .......... .......... .......... .......... 79% 1.46M 3s
  5550K .......... .......... .......... .......... .......... 79% 1.10M 3s
  5600K .......... .......... .......... .......... .......... 80%  643K 3s
  5650K .......... .......... .......... .......... .......... 81% 1.45M 2s
  5700K .......... .......... .......... .......... .......... 81% 1.11M 2s
  5750K .......... .......... .......... .......... .......... 82%  649K 2s
  5800K .......... .......... .......... .......... .......... 83% 1.43M 2s
  5850K .......... .......... .......... .......... .......... 84% 1.09M 2s
  5900K .......... .......... .......... .......... .......... 84%  655K 2s
  5950K .......... .......... .......... .......... .......... 85% 1.45M 2s
  6000K .......... .......... .......... .......... .......... 86%  612K 2s
  6050K .......... .......... .......... .......... .......... 86%  706K 2s
  6100K .......... .......... .......... .......... .......... 87% 1.09M 2s
  6150K .......... .......... .......... .......... .......... 88% 1.24M 1s
  6200K .......... .......... .......... .......... .......... 89%  704K 1s
  6250K .......... .......... .......... .......... .......... 89% 1.09M 1s
  6300K .......... .......... .......... .......... .......... 90% 1.24M 1s
  6350K .......... .......... .......... .......... .......... 91%  707K 1s
  6400K .......... .......... .......... .......... .......... 91% 1.07M 1s
  6450K .......... .......... .......... .......... .......... 92%  655K 1s
  6500K .......... .......... .......... .......... .......... 93% 1.47M 1s
  6550K .......... .......... .......... .......... .......... 94% 1.07M 1s
  6600K .......... .......... .......... .......... .......... 94%  656K 1s
  6650K .......... .......... .......... .......... .......... 95% 1.46M 1s
  6700K .......... .......... .......... .......... .......... 96% 1.08M 0s
  6750K .......... .......... .......... .......... .......... 96%  656K 0s
  6800K .......... .......... .......... .......... .......... 97% 1.42M 0s
  6850K .......... .......... .......... .......... .......... 98% 1.09M 0s
  6900K .......... .......... .......... .......... .......... 99%  657K 0s
  6950K .......... .......... .......... .......... .......... 99% 1.46M 0s
  7000K .......... ......                                     100% 21.7M=12s

2020-11-04 09:19:20 (581 KB/s) - ‘linux-media.tar.bz2’ saved [7185081/7185081]

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
