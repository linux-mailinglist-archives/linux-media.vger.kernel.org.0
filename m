Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82DCD3072AB
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 10:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbhA1JUR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 28 Jan 2021 04:20:17 -0500
Received: from www.linuxtv.org ([130.149.80.248]:44496 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232381AbhA1JQU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 04:16:20 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l53Op-00HYJ5-OS; Thu, 28 Jan 2021 09:15:36 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l53SM-0000nQ-Jx; Thu, 28 Jan 2021 09:19:14 +0000
Date:   Thu, 28 Jan 2021 09:19:14 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1317668450.4.1611825554611@builder.linuxtv.org>
In-Reply-To: <1425076717.3.1611739155389@builder.linuxtv.org>
References: <1425076717.3.1611739155389@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3379
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

See <https://builder.linuxtv.org/job/media-build/3379/display/redirect>

Changes:


------------------------------------------
[...truncated 5.11 KB...]

     0K .......... .......... .......... .......... ..........  0%  163K 43s
    50K .......... .......... .......... .......... ..........  1%  328K 32s
   100K .......... .......... .......... .......... ..........  2% 8.29M 22s
   150K .......... .......... .......... .......... ..........  2% 1.09M 18s
   200K .......... .......... .......... .......... ..........  3%  474K 17s
   250K .......... .......... .......... .......... ..........  4% 10.7M 14s
   300K .......... .......... .......... .......... ..........  4% 10.1M 12s
   350K .......... .......... .......... .......... ..........  5%  355K 13s
   400K .......... .......... .......... .......... ..........  6% 8.79M 11s
   450K .......... .......... .......... .......... ..........  7% 8.95M 10s
   500K .......... .......... .......... .......... ..........  7% 1.23M 10s
   550K .......... .......... .......... .......... ..........  8%  477K 10s
   600K .......... .......... .......... .......... ..........  9% 11.0M 9s
   650K .......... .......... .......... .......... ..........  9% 9.51M 8s
   700K .......... .......... .......... .......... .......... 10% 1.25M 8s
   750K .......... .......... .......... .......... .......... 11%  476K 8s
   800K .......... .......... .......... .......... .......... 11% 8.43M 8s
   850K .......... .......... .......... .......... .......... 12% 9.87M 7s
   900K .......... .......... .......... .......... .......... 13%  360K 8s
   950K .......... .......... .......... .......... .......... 14% 10.7M 7s
  1000K .......... .......... .......... .......... .......... 14% 8.24M 7s
  1050K .......... .......... .......... .......... .......... 15% 3.31M 7s
  1100K .......... .......... .......... .......... .......... 16% 1.85M 7s
  1150K .......... .......... .......... .......... .......... 16%  480K 7s
  1200K .......... .......... .......... .......... .......... 17% 7.42M 6s
  1250K .......... .......... .......... .......... .......... 18% 3.40M 6s
  1300K .......... .......... .......... .......... .......... 19% 7.56M 6s
  1350K .......... .......... .......... .......... .......... 19%  402K 6s
  1400K .......... .......... .......... .......... .......... 20% 11.1M 6s
  1450K .......... .......... .......... .......... .......... 21% 9.84M 6s
  1500K .......... .......... .......... .......... .......... 21% 3.37M 6s
  1550K .......... .......... .......... .......... .......... 22% 1.85M 5s
  1600K .......... .......... .......... .......... .......... 23%  477K 6s
  1650K .......... .......... .......... .......... .......... 23% 11.4M 5s
  1700K .......... .......... .......... .......... .......... 24% 2.99M 5s
  1750K .......... .......... .......... .......... .......... 25% 9.37M 5s
  1800K .......... .......... .......... .......... .......... 26%  753K 5s
  1850K .......... .......... .......... .......... .......... 26%  821K 5s
  1900K .......... .......... .......... .......... .......... 27% 13.1M 5s
  1950K .......... .......... .......... .......... .......... 28% 3.10M 5s
  2000K .......... .......... .......... .......... .......... 28% 7.62M 5s
  2050K .......... .......... .......... .......... .......... 29%  755K 5s
  2100K .......... .......... .......... .......... .......... 30%  803K 5s
  2150K .......... .......... .......... .......... .......... 31% 11.3M 4s
  2200K .......... .......... .......... .......... .......... 31% 11.5M 4s
  2250K .......... .......... .......... .......... .......... 32% 3.49M 4s
  2300K .......... .......... .......... .......... .......... 33% 12.0M 4s
  2350K .......... .......... .......... .......... .......... 33%  406K 4s
  2400K .......... .......... .......... .......... .......... 34% 7.91M 4s
  2450K .......... .......... .......... .......... .......... 35% 11.0M 4s
  2500K .......... .......... .......... .......... .......... 35% 3.78M 4s
  2550K .......... .......... .......... .......... .......... 36% 10.3M 4s
  2600K .......... .......... .......... .......... .......... 37%  759K 4s
  2650K .......... .......... .......... .......... .......... 38%  812K 4s
  2700K .......... .......... .......... .......... .......... 38% 12.6M 4s
  2750K .......... .......... .......... .......... .......... 39% 12.1M 4s
  2800K .......... .......... .......... .......... .......... 40% 3.47M 3s
  2850K .......... .......... .......... .......... .......... 40% 10.5M 3s
  2900K .......... .......... .......... .......... .......... 41%  473K 3s
  2950K .......... .......... .......... .......... .......... 42% 2.30M 3s
  3000K .......... .......... .......... .......... .......... 43% 11.6M 3s
  3050K .......... .......... .......... .......... .......... 43% 12.5M 3s
  3100K .......... .......... .......... .......... .......... 44% 3.85M 3s
  3150K .......... .......... .......... .......... .......... 45% 10.7M 3s
  3200K .......... .......... .......... .......... .......... 45%  752K 3s
  3250K .......... .......... .......... .......... .......... 46%  826K 3s
  3300K .......... .......... .......... .......... .......... 47% 11.3M 3s
  3350K .......... .......... .......... .......... .......... 47% 12.1M 3s
  3400K .......... .......... .......... .......... .......... 48% 4.39M 3s
  3450K .......... .......... .......... .......... .......... 49% 9.32M 3s
  3500K .......... .......... .......... .......... .......... 50% 11.4M 3s
  3550K .......... .......... .......... .......... .......... 50%  415K 3s
  3600K .......... .......... .......... .......... .......... 51% 7.33M 3s
  3650K .......... .......... .......... .......... .......... 52% 9.27M 3s
  3700K .......... .......... .......... .......... .......... 52% 8.87M 2s
  3750K .......... .......... .......... .......... .......... 53% 6.39M 2s
  3800K .......... .......... .......... .......... .......... 54% 10.3M 2s
  3850K .......... .......... .......... .......... .......... 54% 2.23M 2s
  3900K .......... .......... .......... .......... .......... 55%  492K 2s
  3950K .......... .......... .......... .......... .......... 56% 9.62M 2s
  4000K .......... .......... .......... .......... .......... 57% 6.91M 2s
  4050K .......... .......... .......... .......... .......... 57% 9.74M 2s
  4100K .......... .......... .......... .......... .......... 58% 5.78M 2s
  4150K .......... .......... .......... .......... .......... 59% 9.90M 2s
  4200K .......... .......... .......... .......... .......... 59% 2.37M 2s
  4250K .......... .......... .......... .......... .......... 60%  493K 2s
  4300K .......... .......... .......... .......... .......... 61% 10.4M 2s
  4350K .......... .......... .......... .......... .......... 62% 8.80M 2s
  4400K .......... .......... .......... .......... .......... 62% 8.20M 2s
  4450K .......... .......... .......... .......... .......... 63% 6.15M 2s
  4500K .......... .......... .......... .......... .......... 64% 9.88M 2s
  4550K .......... .......... .......... .......... .......... 64% 10.6M 2s
  4600K .......... .......... .......... .......... .......... 65% 2.17M 2s
  4650K .......... .......... .......... .......... .......... 66%  502K 2s
  4700K .......... .......... .......... .......... .......... 66% 9.21M 2s
  4750K .......... .......... .......... .......... .......... 67% 8.98M 2s
  4800K .......... .......... .......... .......... .......... 68% 7.32M 1s
  4850K .......... .......... .......... .......... .......... 69% 8.55M 1s
  4900K .......... .......... .......... .......... .......... 69% 9.02M 1s
  4950K .......... .......... .......... .......... .......... 70% 8.32M 1s
  5000K .......... .......... .......... .......... .......... 71%  843K 1s
  5050K .......... .......... .......... .......... .......... 71%  837K 1s
  5100K .......... .......... .......... .......... .......... 72% 8.89M 1s
  5150K .......... .......... .......... .......... .......... 73% 10.0M 1s
  5200K .......... .......... .......... .......... .......... 74% 8.42M 1s
  5250K .......... .......... .......... .......... .......... 74% 8.07M 1s
  5300K .......... .......... .......... .......... .......... 75% 9.88M 1s
  5350K .......... .......... .......... .......... .......... 76% 9.97M 1s
  5400K .......... .......... .......... .......... .......... 76% 2.42M 1s
  5450K .......... .......... .......... .......... .......... 77%  501K 1s
  5500K .......... .......... .......... .......... .......... 78% 9.03M 1s
  5550K .......... .......... .......... .......... .......... 78% 11.2M 1s
  5600K .......... .......... .......... .......... .......... 79% 7.76M 1s
  5650K .......... .......... .......... .......... .......... 80% 11.1M 1s
  5700K .......... .......... .......... .......... .......... 81% 8.71M 1s
  5750K .......... .......... .......... .......... .......... 81% 11.2M 1s
  5800K .......... .......... .......... .......... .......... 82% 9.46M 1s
  5850K .......... .......... .......... .......... .......... 83%  846K 1s
  5900K .......... .......... .......... .......... .......... 83%  825K 1s
  5950K .......... .......... .......... .......... .......... 84% 10.4M 1s
  6000K .......... .......... .......... .......... .......... 85% 7.17M 1s
  6050K .......... .......... .......... .......... .......... 86% 8.34M 1s
  6100K .......... .......... .......... .......... .......... 86% 11.6M 1s
  6150K .......... .......... .......... .......... .......... 87% 12.9M 1s
  6200K .......... .......... .......... .......... .......... 88% 12.3M 0s
  6250K .......... .......... .......... .......... .......... 88% 9.16M 0s
  6300K .......... .......... .......... .......... .......... 89% 2.78M 0s
  6350K .......... .......... .......... .......... .......... 90%  501K 0s
  6400K .......... .......... .......... .......... .......... 90% 7.20M 0s
  6450K .......... .......... .......... .......... .......... 91% 10.1M 0s
  6500K .......... .......... .......... .......... .......... 92% 9.44M 0s
  6550K .......... .......... .......... .......... .......... 93% 10.9M 0s
  6600K .......... .......... .......... .......... .......... 93% 11.5M 0s
  6650K .......... .......... .......... .......... .......... 94% 12.5M 0s
  6700K .......... .......... .......... .......... .......... 95% 6.26M 0s
  6750K .......... .......... .......... .......... .......... 95% 10.4M 0s
  6800K .......... .......... .......... .......... .......... 96%  459K 0s
  6850K .......... .......... .......... .......... .......... 97% 8.76M 0s
  6900K .......... .......... .......... .......... .......... 98% 9.52M 0s
  6950K .......... .......... .......... .......... .......... 98% 11.6M 0s
  7000K .......... .......... .......... .......... .......... 99% 9.35M 0s
  7050K .......... .......... .......... ..........           100% 12.2M=4.0s

2021-01-28 09:16:08 (1.73 MB/s) - ‘linux-media.tar.bz2’ saved [7261183/7261183]

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
patch -s -f -N -p1 -i ../backports/v5.1_vm_map_pages.patch
patch -s -f -N -p1 -i ../backports/v5.1_devm_i2c_new_dummy_device.patch
patch -s -f -N -p1 -i ../backports/v5.0_ipu3-cio2.patch
2 out of 2 hunks FAILED
make[2]: *** [Makefile:131: apply_patches] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make[1]: *** [Makefile:378: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
