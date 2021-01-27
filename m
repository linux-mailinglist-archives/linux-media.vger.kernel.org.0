Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E084A3056AE
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 10:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbhA0JTL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 27 Jan 2021 04:19:11 -0500
Received: from www.linuxtv.org ([130.149.80.248]:47404 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234909AbhA0JQU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 04:16:20 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l4gvI-00Fzld-Kh; Wed, 27 Jan 2021 09:15:36 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l4gyp-00019i-Cp; Wed, 27 Jan 2021 09:19:15 +0000
Date:   Wed, 27 Jan 2021 09:19:15 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1425076717.3.1611739155389@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3378
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

See <https://builder.linuxtv.org/job/media-build/3378/display/redirect>

Changes:


------------------------------------------
[...truncated 5.11 KB...]

     0K .......... .......... .......... .......... ..........  0%  162K 43s
    50K .......... .......... .......... .......... ..........  1%  325K 32s
   100K .......... .......... .......... .......... ..........  2% 15.5M 22s
   150K .......... .......... .......... .......... ..........  2% 13.5M 16s
   200K .......... .......... .......... .......... ..........  3%  334K 17s
   250K .......... .......... .......... .......... ..........  4% 13.4M 14s
   300K .......... .......... .......... .......... ..........  4% 12.0M 12s
   350K .......... .......... .......... .......... ..........  5%  348K 13s
   400K .......... .......... .......... .......... ..........  6% 9.35M 11s
   450K .......... .......... .......... .......... ..........  7% 13.3M 10s
   500K .......... .......... .......... .......... ..........  7% 12.8M 9s
   550K .......... .......... .......... .......... ..........  8%  349K 10s
   600K .......... .......... .......... .......... ..........  9% 13.2M 9s
   650K .......... .......... .......... .......... ..........  9% 14.1M 9s
   700K .......... .......... .......... .......... .......... 10% 13.6M 8s
   750K .......... .......... .......... .......... .......... 11%  347K 9s
   800K .......... .......... .......... .......... .......... 11% 10.7M 8s
   850K .......... .......... .......... .......... .......... 12% 13.5M 7s
   900K .......... .......... .......... .......... .......... 13%  349K 8s
   950K .......... .......... .......... .......... .......... 14% 12.0M 8s
  1000K .......... .......... .......... .......... .......... 14% 12.0M 7s
  1050K .......... .......... .......... .......... .......... 15% 11.8M 7s
  1100K .......... .......... .......... .......... .......... 16% 13.9M 6s
  1150K .......... .......... .......... .......... .......... 16%  354K 7s
  1200K .......... .......... .......... .......... .......... 17% 10.1M 7s
  1250K .......... .......... .......... .......... .......... 18% 14.4M 6s
  1300K .......... .......... .......... .......... .......... 19% 13.6M 6s
  1350K .......... .......... .......... .......... .......... 19%  355K 6s
  1400K .......... .......... .......... .......... .......... 20% 12.5M 6s
  1450K .......... .......... .......... .......... .......... 21% 13.6M 6s
  1500K .......... .......... .......... .......... .......... 21% 13.4M 6s
  1550K .......... .......... .......... .......... .......... 22% 12.9M 5s
  1600K .......... .......... .......... .......... .......... 23%  354K 6s
  1650K .......... .......... .......... .......... .......... 23% 14.2M 5s
  1700K .......... .......... .......... .......... .......... 24% 15.6M 5s
  1750K .......... .......... .......... .......... .......... 25% 13.5M 5s
  1800K .......... .......... .......... .......... .......... 26%  354K 5s
  1850K .......... .......... .......... .......... .......... 26% 14.0M 5s
  1900K .......... .......... .......... .......... .......... 27% 13.1M 5s
  1950K .......... .......... .......... .......... .......... 28% 13.8M 5s
  2000K .......... .......... .......... .......... .......... 28% 10.9M 5s
  2050K .......... .......... .......... .......... .......... 29%  360K 5s
  2100K .......... .......... .......... .......... .......... 30% 12.4M 5s
  2150K .......... .......... .......... .......... .......... 31% 12.1M 4s
  2200K .......... .......... .......... .......... .......... 31% 13.4M 4s
  2250K .......... .......... .......... .......... .......... 32% 15.6M 4s
  2300K .......... .......... .......... .......... .......... 33% 1.12M 4s
  2350K .......... .......... .......... .......... .......... 33%  512K 4s
  2400K .......... .......... .......... .......... .......... 34% 8.94M 4s
  2450K .......... .......... .......... .......... .......... 35% 14.9M 4s
  2500K .......... .......... .......... .......... .......... 35% 12.0M 4s
  2550K .......... .......... .......... .......... .......... 36% 15.2M 4s
  2600K .......... .......... .......... .......... .......... 37%  365K 4s
  2650K .......... .......... .......... .......... .......... 38% 15.2M 4s
  2700K .......... .......... .......... .......... .......... 38% 12.8M 4s
  2750K .......... .......... .......... .......... .......... 39% 15.8M 4s
  2800K .......... .......... .......... .......... .......... 40% 9.93M 3s
  2850K .......... .......... .......... .......... .......... 40% 1.16M 3s
  2900K .......... .......... .......... .......... .......... 41%  513K 3s
  2950K .......... .......... .......... .......... .......... 42% 15.6M 3s
  3000K .......... .......... .......... .......... .......... 42% 12.9M 3s
  3050K .......... .......... .......... .......... .......... 43% 14.6M 3s
  3100K .......... .......... .......... .......... .......... 44% 12.8M 3s
  3150K .......... .......... .......... .......... .......... 45% 15.3M 3s
  3200K .......... .......... .......... .......... .......... 45%  365K 3s
  3250K .......... .......... .......... .......... .......... 46% 14.2M 3s
  3300K .......... .......... .......... .......... .......... 47% 14.6M 3s
  3350K .......... .......... .......... .......... .......... 47% 13.6M 3s
  3400K .......... .......... .......... .......... .......... 48% 13.0M 3s
  3450K .......... .......... .......... .......... .......... 49% 15.0M 3s
  3500K .......... .......... .......... .......... .......... 50%  370K 3s
  3550K .......... .......... .......... .......... .......... 50% 15.1M 3s
  3600K .......... .......... .......... .......... .......... 51% 11.4M 3s
  3650K .......... .......... .......... .......... .......... 52% 15.5M 3s
  3700K .......... .......... .......... .......... .......... 52% 14.0M 2s
  3750K .......... .......... .......... .......... .......... 53% 15.5M 2s
  3800K .......... .......... .......... .......... .......... 54% 1.20M 2s
  3850K .......... .......... .......... .......... .......... 54%  513K 2s
  3900K .......... .......... .......... .......... .......... 55% 13.9M 2s
  3950K .......... .......... .......... .......... .......... 56% 14.4M 2s
  4000K .......... .......... .......... .......... .......... 57% 11.0M 2s
  4050K .......... .......... .......... .......... .......... 57% 13.8M 2s
  4100K .......... .......... .......... .......... .......... 58% 13.8M 2s
  4150K .......... .......... .......... .......... .......... 59%  649K 2s
  4200K .......... .......... .......... .......... .......... 59%  843K 2s
  4250K .......... .......... .......... .......... .......... 60% 16.4M 2s
  4300K .......... .......... .......... .......... .......... 61% 14.7M 2s
  4350K .......... .......... .......... .......... .......... 62% 15.6M 2s
  4400K .......... .......... .......... .......... .......... 62% 11.0M 2s
  4450K .......... .......... .......... .......... .......... 63% 16.0M 2s
  4500K .......... .......... .......... .......... .......... 64%  646K 2s
  4550K .......... .......... .......... .......... .......... 64%  849K 2s
  4600K .......... .......... .......... .......... .......... 65% 16.3M 2s
  4650K .......... .......... .......... .......... .......... 66% 14.8M 2s
  4700K .......... .......... .......... .......... .......... 66% 16.1M 2s
  4750K .......... .......... .......... .......... .......... 67% 14.8M 2s
  4800K .......... .......... .......... .......... .......... 68% 10.8M 2s
  4850K .......... .......... .......... .......... .......... 69% 14.2M 1s
  4900K .......... .......... .......... .......... .......... 69%  378K 1s
  4950K .......... .......... .......... .......... .......... 70% 15.2M 1s
  5000K .......... .......... .......... .......... .......... 71% 15.6M 1s
  5050K .......... .......... .......... .......... .......... 71% 15.1M 1s
  5100K .......... .......... .......... .......... .......... 72% 15.7M 1s
  5150K .......... .......... .......... .......... .......... 73% 16.2M 1s
  5200K .......... .......... .......... .......... .......... 73% 11.8M 1s
  5250K .......... .......... .......... .......... .......... 74% 15.5M 1s
  5300K .......... .......... .......... .......... .......... 75%  378K 1s
  5350K .......... .......... .......... .......... .......... 76% 16.3M 1s
  5400K .......... .......... .......... .......... .......... 76% 13.1M 1s
  5450K .......... .......... .......... .......... .......... 77% 15.2M 1s
  5500K .......... .......... .......... .......... .......... 78% 14.9M 1s
  5550K .......... .......... .......... .......... .......... 78% 15.6M 1s
  5600K .......... .......... .......... .......... .......... 79% 11.8M 1s
  5650K .......... .......... .......... .......... .......... 80% 14.4M 1s
  5700K .......... .......... .......... .......... .......... 81%  386K 1s
  5750K .......... .......... .......... .......... .......... 81% 15.3M 1s
  5800K .......... .......... .......... .......... .......... 82% 14.0M 1s
  5850K .......... .......... .......... .......... .......... 83% 15.5M 1s
  5900K .......... .......... .......... .......... .......... 83% 14.2M 1s
  5950K .......... .......... .......... .......... .......... 84% 15.0M 1s
  6000K .......... .......... .......... .......... .......... 85% 11.8M 1s
  6050K .......... .......... .......... .......... .......... 85% 15.4M 1s
  6100K .......... .......... .......... .......... .......... 86%  685K 1s
  6150K .......... .......... .......... .......... .......... 87%  852K 1s
  6200K .......... .......... .......... .......... .......... 88% 14.4M 1s
  6250K .......... .......... .......... .......... .......... 88% 14.9M 0s
  6300K .......... .......... .......... .......... .......... 89% 15.4M 0s
  6350K .......... .......... .......... .......... .......... 90% 16.4M 0s
  6400K .......... .......... .......... .......... .......... 90% 11.4M 0s
  6450K .......... .......... .......... .......... .......... 91% 15.4M 0s
  6500K .......... .......... .......... .......... .......... 92% 16.0M 0s
  6550K .......... .......... .......... .......... .......... 93%  390K 0s
  6600K .......... .......... .......... .......... .......... 93% 17.0M 0s
  6650K .......... .......... .......... .......... .......... 94% 15.1M 0s
  6700K .......... .......... .......... .......... .......... 95% 15.0M 0s
  6750K .......... .......... .......... .......... .......... 95% 14.3M 0s
  6800K .......... .......... .......... .......... .......... 96% 12.2M 0s
  6850K .......... .......... .......... .......... .......... 97% 11.5M 0s
  6900K .......... .......... .......... .......... .......... 97% 20.5M 0s
  6950K .......... .......... .......... .......... .......... 98% 13.3M 0s
  7000K .......... .......... .......... .......... .......... 99%  708K 0s
  7050K .......... .......... .......... .......... ......    100%  797K=4.2s

2021-01-27 09:16:08 (1.67 MB/s) - ‘linux-media.tar.bz2’ saved [7266597/7266597]

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
