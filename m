Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F916265C51
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 11:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgIKJQe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 11 Sep 2020 05:16:34 -0400
Received: from www.linuxtv.org ([130.149.80.248]:43674 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725835AbgIKJQa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 05:16:30 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kGf4W-005JUa-Oq; Fri, 11 Sep 2020 09:10:21 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kGfD6-0003xu-GF; Fri, 11 Sep 2020 09:19:12 +0000
Date:   Fri, 11 Sep 2020 09:19:12 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <2041009865.0.1599815952475@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3213
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/3213/display/redirect>

Changes:


------------------------------------------
[...truncated 4.00 KB...]
Resolving linuxtv.org (linuxtv.org)... 130.149.80.248
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2 [following]
--2020-09-11 09:17:07--  https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7090959 (6.8M) [application/x-bzip2]
Saving to: ‘linux-media.tar.bz2’

     0K .......... .......... .......... .......... ..........  0%  160K 43s
    50K .......... .......... .......... .......... ..........  1%  322K 32s
   100K .......... .......... .......... .......... ..........  2% 19.6M 21s
   150K .......... .......... .......... .......... ..........  2%  328K 21s
   200K .......... .......... .......... .......... ..........  3% 21.5M 17s
   250K .......... .......... .......... .......... ..........  4% 21.5M 14s
   300K .......... .......... .......... .......... ..........  5% 19.8M 12s
   350K .......... .......... .......... .......... ..........  5% 21.9M 10s
   400K .......... .......... .......... .......... ..........  6%  336K 11s
   450K .......... .......... .......... .......... ..........  7% 22.8M 10s
   500K .......... .......... .......... .......... ..........  7% 21.3M 9s
   550K .......... .......... .......... .......... ..........  8% 21.3M 8s
   600K .......... .......... .......... .......... ..........  9% 22.1M 8s
   650K .......... .......... .......... .......... .......... 10% 20.0M 7s
   700K .......... .......... .......... .......... .......... 10% 25.9M 7s
   750K .......... .......... .......... .......... .......... 11% 22.5M 6s
   800K .......... .......... .......... .......... .......... 12%  362K 7s
   850K .......... .......... .......... .......... .......... 12% 18.8M 6s
   900K .......... .......... .......... .......... .......... 13% 19.5M 6s
   950K .......... .......... .......... .......... .......... 14% 20.0M 6s
  1000K .......... .......... .......... .......... .......... 15% 20.2M 5s
  1050K .......... .......... .......... .......... .......... 15% 20.8M 5s
  1100K .......... .......... .......... .......... .......... 16% 21.6M 5s
  1150K .......... .......... .......... .......... .......... 17% 20.7M 5s
  1200K .......... .......... .......... .......... .......... 18% 17.5M 4s
  1250K .......... .......... .......... .......... .......... 18% 22.2M 4s
  1300K .......... .......... .......... .......... .......... 19% 20.6M 4s
  1350K .......... .......... .......... .......... .......... 20% 20.7M 4s
  1400K .......... .......... .......... .......... .......... 20% 18.6M 4s
  1450K .......... .......... .......... .......... .......... 21% 19.9M 3s
  1500K .......... .......... .......... .......... .......... 22% 23.6M 3s
  1550K .......... .......... .......... .......... .......... 23% 16.3M 3s
  1600K .......... .......... .......... .......... .......... 23% 5.62M 3s
  1650K .......... .......... .......... .......... .......... 24%  452K 3s
  1700K .......... .......... .......... .......... .......... 25% 86.2M 3s
  1750K .......... .......... .......... .......... .......... 25% 28.8M 3s
  1800K .......... .......... .......... .......... .......... 26% 41.3M 3s
  1850K .......... .......... .......... .......... .......... 27% 22.2M 3s
  1900K .......... .......... .......... .......... .......... 28% 51.2M 3s
  1950K .......... .......... .......... .......... .......... 28%  110M 3s
  2000K .......... .......... .......... .......... .......... 29% 18.2M 3s
  2050K .......... .......... .......... .......... .......... 30%  104M 3s
  2100K .......... .......... .......... .......... .......... 31%  101M 2s
  2150K .......... .......... .......... .......... .......... 31% 27.9M 2s
  2200K .......... .......... .......... .......... .......... 32% 15.0M 2s
  2250K .......... .......... .......... .......... .......... 33% 30.5M 2s
  2300K .......... .......... .......... .......... .......... 33%  106M 2s
  2350K .......... .......... .......... .......... .......... 34%  112M 2s
  2400K .......... .......... .......... .......... .......... 35% 12.2M 2s
  2450K .......... .......... .......... .......... .......... 36% 44.4M 2s
  2500K .......... .......... .......... .......... .......... 36% 18.0M 2s
  2550K .......... .......... .......... .......... .......... 37% 24.1M 2s
  2600K .......... .......... .......... .......... .......... 38% 17.9M 2s
  2650K .......... .......... .......... .......... .......... 38% 16.9M 2s
  2700K .......... .......... .......... .......... .......... 39% 19.5M 2s
  2750K .......... .......... .......... .......... .......... 40% 17.9M 2s
  2800K .......... .......... .......... .......... .......... 41% 15.2M 2s
  2850K .......... .......... .......... .......... .......... 41% 18.0M 2s
  2900K .......... .......... .......... .......... .......... 42% 17.4M 2s
  2950K .......... .......... .......... .......... .......... 43% 17.4M 1s
  3000K .......... .......... .......... .......... .......... 44% 15.4M 1s
  3050K .......... .......... .......... .......... .......... 44% 16.3M 1s
  3100K .......... .......... .......... .......... .......... 45% 19.9M 1s
  3150K .......... .......... .......... .......... .......... 46% 4.57M 1s
  3200K .......... .......... .......... .......... .......... 46% 15.8M 1s
  3250K .......... .......... .......... .......... .......... 47% 13.8M 1s
  3300K .......... .......... .......... .......... .......... 48% 21.9M 1s
  3350K .......... .......... .......... .......... .......... 49%  656K 1s
  3400K .......... .......... .......... .......... .......... 49% 33.2M 1s
  3450K .......... .......... .......... .......... .......... 50% 15.1M 1s
  3500K .......... .......... .......... .......... .......... 51% 79.7M 1s
  3550K .......... .......... .......... .......... .......... 51%  107M 1s
  3600K .......... .......... .......... .......... .......... 52% 43.8M 1s
  3650K .......... .......... .......... .......... .......... 53%  156M 1s
  3700K .......... .......... .......... .......... .......... 54% 9.80M 1s
  3750K .......... .......... .......... .......... .......... 54% 24.9M 1s
  3800K .......... .......... .......... .......... .......... 55% 52.1M 1s
  3850K .......... .......... .......... .......... .......... 56% 90.0M 1s
  3900K .......... .......... .......... .......... .......... 57% 96.5M 1s
  3950K .......... .......... .......... .......... .......... 57% 97.2M 1s
  4000K .......... .......... .......... .......... .......... 58% 87.3M 1s
  4050K .......... .......... .......... .......... .......... 59%  123M 1s
  4100K .......... .......... .......... .......... .......... 59%  144M 1s
  4150K .......... .......... .......... .......... .......... 60%  145M 1s
  4200K .......... .......... .......... .......... .......... 61% 72.2M 1s
  4250K .......... .......... .......... .......... .......... 62%  110M 1s
  4300K .......... .......... .......... .......... .......... 62% 57.2M 1s
  4350K .......... .......... .......... .......... .......... 63% 58.2M 1s
  4400K .......... .......... .......... .......... .......... 64% 35.2M 1s
  4450K .......... .......... .......... .......... .......... 64% 41.5M 1s
  4500K .......... .......... .......... .......... .......... 65% 70.0M 1s
  4550K .......... .......... .......... .......... .......... 66% 53.1M 1s
  4600K .......... .......... .......... .......... .......... 67% 42.8M 1s
  4650K .......... .......... .......... .......... .......... 67% 51.5M 1s
  4700K .......... .......... .......... .......... .......... 68% 62.7M 1s
  4750K .......... .......... .......... .......... .......... 69% 47.1M 1s
  4800K .......... .......... .......... .......... .......... 70% 39.5M 1s
  4850K .......... .......... .......... .......... .......... 70% 62.2M 1s
  4900K .......... .......... .......... .......... .......... 71% 54.7M 1s
  4950K .......... .......... .......... .......... .......... 72% 49.5M 0s
  5000K .......... .......... .......... .......... .......... 72% 53.7M 0s
  5050K .......... .......... .......... .......... .......... 73% 61.4M 0s
  5100K .......... .......... .......... .......... .......... 74% 44.2M 0s
  5150K .......... .......... .......... .......... .......... 75% 49.1M 0s
  5200K .......... .......... .......... .......... .......... 75% 37.1M 0s
  5250K .......... .......... .......... .......... .......... 76% 50.8M 0s
  5300K .......... .......... .......... .......... .......... 77% 41.5M 0s
  5350K .......... .......... .......... .......... .......... 77% 46.2M 0s
  5400K .......... .......... .......... .......... .......... 78% 15.8M 0s
  5450K .......... .......... .......... .......... .......... 79% 23.5M 0s
  5500K .......... .......... .......... .......... .......... 80% 17.4M 0s
  5550K .......... .......... .......... .......... .......... 80% 19.1M 0s
  5600K .......... .......... .......... .......... .......... 81% 14.6M 0s
  5650K .......... .......... .......... .......... .......... 82% 18.9M 0s
  5700K .......... .......... .......... .......... .......... 83% 19.4M 0s
  5750K .......... .......... .......... .......... .......... 83% 20.8M 0s
  5800K .......... .......... .......... .......... .......... 84% 20.3M 0s
  5850K .......... .......... .......... .......... .......... 85% 20.0M 0s
  5900K .......... .......... .......... .......... .......... 85% 19.8M 0s
  5950K .......... .......... .......... .......... .......... 86% 18.9M 0s
  6000K .......... .......... .......... .......... .......... 87% 15.7M 0s
  6050K .......... .......... .......... .......... .......... 88% 19.7M 0s
  6100K .......... .......... .......... .......... .......... 88% 19.3M 0s
  6150K .......... .......... .......... .......... .......... 89% 21.1M 0s
  6200K .......... .......... .......... .......... .......... 90% 20.8M 0s
  6250K .......... .......... .......... .......... .......... 90% 21.4M 0s
  6300K .......... .......... .......... .......... .......... 91% 20.9M 0s
  6350K .......... .......... .......... .......... .......... 92% 20.7M 0s
  6400K .......... .......... .......... .......... .......... 93% 14.7M 0s
  6450K .......... .......... .......... .......... .......... 93%  814K 0s
  6500K .......... .......... .......... .......... .......... 94% 21.7M 0s
  6550K .......... .......... .......... .......... .......... 95% 30.2M 0s
  6600K .......... .......... .......... .......... .......... 96% 45.4M 0s
  6650K .......... .......... .......... .......... .......... 96% 55.2M 0s
  6700K .......... .......... .......... .......... .......... 97% 68.4M 0s
  6750K .......... .......... .......... .......... .......... 98% 27.2M 0s
  6800K .......... .......... .......... .......... .......... 98% 11.0M 0s
  6850K .......... .......... .......... .......... .......... 99% 60.8M 0s
  6900K .......... .......... ....                            100%  205M=1.4s

2020-09-11 09:17:09 (4.78 MB/s) - ‘linux-media.tar.bz2’ saved [7090959/7090959]

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
patch -s -f -N -p1 -i ../backports/v5.6_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.6_const_fb_ops.patch
patch -s -f -N -p1 -i ../backports/v5.6_pm_runtime_get_if_active.patch
patch -s -f -N -p1 -i ../backports/v5.5_alsa_pcm_api_updates.patch
patch -s -f -N -p1 -i ../backports/v5.5_memtype_h.patch
patch -s -f -N -p1 -i ../backports/v5.4_revert_spi_transfer.patch
patch -s -f -N -p1 -i ../backports/v5.1_vm_map_pages.patch
patch -s -f -N -p1 -i ../backports/v5.1_devm_i2c_new_dummy_device.patch
patch -s -f -N -p1 -i ../backports/v5.0_ipu3-cio2.patch
2 out of 2 hunks FAILED
make[2]: *** [Makefile:132: apply_patches] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make[1]: *** [Makefile:378: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
