Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1202E355A
	for <lists+linux-media@lfdr.de>; Mon, 28 Dec 2020 10:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgL1JQa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Dec 2020 04:16:30 -0500
Received: from www.linuxtv.org ([130.149.80.248]:34194 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbgL1JQa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Dec 2020 04:16:30 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ktod0-00754W-Lz; Mon, 28 Dec 2020 09:15:46 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ktogK-00068X-Es; Mon, 28 Dec 2020 09:19:12 +0000
Date:   Mon, 28 Dec 2020 09:19:12 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <2121139525.26.1609147152451@builder.linuxtv.org>
In-Reply-To: <1034479656.25.1609060752200@builder.linuxtv.org>
References: <1034479656.25.1609060752200@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3341
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

See <https://builder.linuxtv.org/job/media-build/3341/display/redirect>

Changes:


------------------------------------------
[...truncated 3.63 KB...]
Saving to: ‘linux-media.tar.bz2.md5.tmp’

     0K                                                       100%  164M=0s

2020-12-28 09:16:39 (164 MB/s) - ‘linux-media.tar.bz2.md5.tmp’ saved [105/105]

--2020-12-28 09:16:39--  http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Resolving linuxtv.org (linuxtv.org)... 130.149.80.248
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2 [following]
--2020-12-28 09:16:39--  https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7186884 (6.9M) [application/x-bzip2]
Saving to: ‘linux-media.tar.bz2’

     0K .......... .......... .......... .......... ..........  0%  162K 43s
    50K .......... .......... .......... .......... ..........  1%  326K 32s
   100K .......... .......... .......... .......... ..........  2% 15.1M 21s
   150K .......... .......... .......... .......... ..........  2% 15.8M 16s
   200K .......... .......... .......... .......... ..........  3%  334K 17s
   250K .......... .......... .......... .......... ..........  4% 15.1M 14s
   300K .......... .......... .......... .......... ..........  4% 16.9M 12s
   350K .......... .......... .......... .......... ..........  5% 15.2M 10s
   400K .......... .......... .......... .......... ..........  6%  349K 11s
   450K .......... .......... .......... .......... ..........  7% 14.8M 10s
   500K .......... .......... .......... .......... ..........  7% 18.1M 9s
   550K .......... .......... .......... .......... ..........  8% 19.7M 8s
   600K .......... .......... .......... .......... ..........  9% 18.9M 8s
   650K .......... .......... .......... .......... ..........  9% 20.7M 7s
   700K .......... .......... .......... .......... .......... 10% 23.0M 7s
   750K .......... .......... .......... .......... .......... 11% 25.8M 6s
   800K .......... .......... .......... .......... .......... 12% 18.4M 6s
   850K .......... .......... .......... .......... .......... 12%  376K 6s
   900K .......... .......... .......... .......... .......... 13% 27.2M 6s
   950K .......... .......... .......... .......... .......... 14% 22.9M 6s
  1000K .......... .......... .......... .......... .......... 14% 27.1M 5s
  1050K .......... .......... .......... .......... .......... 15% 24.6M 5s
  1100K .......... .......... .......... .......... .......... 16% 25.3M 5s
  1150K .......... .......... .......... .......... .......... 17% 23.9M 5s
  1200K .......... .......... .......... .......... .......... 17% 17.2M 4s
  1250K .......... .......... .......... .......... .......... 18% 23.7M 4s
  1300K .......... .......... .......... .......... .......... 19% 7.74M 4s
  1350K .......... .......... .......... .......... .......... 19% 91.0M 4s
  1400K .......... .......... .......... .......... .......... 20% 42.3M 4s
  1450K .......... .......... .......... .......... .......... 21% 51.3M 3s
  1500K .......... .......... .......... .......... .......... 22% 42.6M 3s
  1550K .......... .......... .......... .......... .......... 22% 21.7M 3s
  1600K .......... .......... .......... .......... .......... 23% 23.8M 3s
  1650K .......... .......... .......... .......... .......... 24% 28.3M 3s
  1700K .......... .......... .......... .......... .......... 24% 26.3M 3s
  1750K .......... .......... .......... .......... .......... 25%  420K 3s
  1800K .......... .......... .......... .......... .......... 26% 36.8M 3s
  1850K .......... .......... .......... .......... .......... 27% 29.3M 3s
  1900K .......... .......... .......... .......... .......... 27% 53.2M 3s
  1950K .......... .......... .......... .......... .......... 28% 42.7M 3s
  2000K .......... .......... .......... .......... .......... 29% 21.8M 3s
  2050K .......... .......... .......... .......... .......... 29% 67.2M 3s
  2100K .......... .......... .......... .......... .......... 30% 49.9M 2s
  2150K .......... .......... .......... .......... .......... 31% 46.3M 2s
  2200K .......... .......... .......... .......... .......... 32% 40.9M 2s
  2250K .......... .......... .......... .......... .......... 32% 45.9M 2s
  2300K .......... .......... .......... .......... .......... 33% 25.4M 2s
  2350K .......... .......... .......... .......... .......... 34% 22.8M 2s
  2400K .......... .......... .......... .......... .......... 34% 18.0M 2s
  2450K .......... .......... .......... .......... .......... 35% 24.1M 2s
  2500K .......... .......... .......... .......... .......... 36% 25.0M 2s
  2550K .......... .......... .......... .......... .......... 37% 21.7M 2s
  2600K .......... .......... .......... .......... .......... 37% 23.0M 2s
  2650K .......... .......... .......... .......... .......... 38% 24.0M 2s
  2700K .......... .......... .......... .......... .......... 39% 23.3M 2s
  2750K .......... .......... .......... .......... .......... 39% 26.0M 2s
  2800K .......... .......... .......... .......... .......... 40% 17.2M 2s
  2850K .......... .......... .......... .......... .......... 41% 25.9M 2s
  2900K .......... .......... .......... .......... .......... 42% 24.7M 2s
  2950K .......... .......... .......... .......... .......... 42% 25.9M 1s
  3000K .......... .......... .......... .......... .......... 43% 24.0M 1s
  3050K .......... .......... .......... .......... .......... 44% 24.1M 1s
  3100K .......... .......... .......... .......... .......... 44% 21.3M 1s
  3150K .......... .......... .......... .......... .......... 45% 31.3M 1s
  3200K .......... .......... .......... .......... .......... 46% 17.8M 1s
  3250K .......... .......... .......... .......... .......... 47% 24.1M 1s
  3300K .......... .......... .......... .......... .......... 47% 25.2M 1s
  3350K .......... .......... .......... .......... .......... 48% 25.1M 1s
  3400K .......... .......... .......... .......... .......... 49% 24.2M 1s
  3450K .......... .......... .......... .......... .......... 49% 26.3M 1s
  3500K .......... .......... .......... .......... .......... 50% 20.6M 1s
  3550K .......... .......... .......... .......... .......... 51%  561K 1s
  3600K .......... .......... .......... .......... .......... 52% 62.1M 1s
  3650K .......... .......... .......... .......... .......... 52% 35.5M 1s
  3700K .......... .......... .......... .......... .......... 53% 28.4M 1s
  3750K .......... .......... .......... .......... .......... 54% 17.9M 1s
  3800K .......... .......... .......... .......... .......... 54% 24.7M 1s
  3850K .......... .......... .......... .......... .......... 55% 35.5M 1s
  3900K .......... .......... .......... .......... .......... 56% 98.7M 1s
  3950K .......... .......... .......... .......... .......... 56% 23.6M 1s
  4000K .......... .......... .......... .......... .......... 57% 16.0M 1s
  4050K .......... .......... .......... .......... .......... 58% 32.0M 1s
  4100K .......... .......... .......... .......... .......... 59% 30.2M 1s
  4150K .......... .......... .......... .......... .......... 59% 37.3M 1s
  4200K .......... .......... .......... .......... .......... 60% 29.7M 1s
  4250K .......... .......... .......... .......... .......... 61% 87.2M 1s
  4300K .......... .......... .......... .......... .......... 61%  115M 1s
  4350K .......... .......... .......... .......... .......... 62%  118M 1s
  4400K .......... .......... .......... .......... .......... 63% 74.2M 1s
  4450K .......... .......... .......... .......... .......... 64% 38.1M 1s
  4500K .......... .......... .......... .......... .......... 64% 20.5M 1s
  4550K .......... .......... .......... .......... .......... 65% 15.8M 1s
  4600K .......... .......... .......... .......... .......... 66% 29.9M 1s
  4650K .......... .......... .......... .......... .......... 66% 57.4M 1s
  4700K .......... .......... .......... .......... .......... 67% 36.6M 1s
  4750K .......... .......... .......... .......... .......... 68% 44.5M 1s
  4800K .......... .......... .......... .......... .......... 69% 45.2M 1s
  4850K .......... .......... .......... .......... .......... 69% 97.1M 1s
  4900K .......... .......... .......... .......... .......... 70% 41.3M 1s
  4950K .......... .......... .......... .......... .......... 71% 37.5M 1s
  5000K .......... .......... .......... .......... .......... 71% 52.1M 0s
  5050K .......... .......... .......... .......... .......... 72% 62.6M 0s
  5100K .......... .......... .......... .......... .......... 73% 97.5M 0s
  5150K .......... .......... .......... .......... .......... 74% 73.3M 0s
  5200K .......... .......... .......... .......... .......... 74% 50.7M 0s
  5250K .......... .......... .......... .......... .......... 75% 48.8M 0s
  5300K .......... .......... .......... .......... .......... 76% 51.1M 0s
  5350K .......... .......... .......... .......... .......... 76% 59.9M 0s
  5400K .......... .......... .......... .......... .......... 77% 20.3M 0s
  5450K .......... .......... .......... .......... .......... 78%  118M 0s
  5500K .......... .......... .......... .......... .......... 79% 43.5M 0s
  5550K .......... .......... .......... .......... .......... 79% 71.8M 0s
  5600K .......... .......... .......... .......... .......... 80% 78.1M 0s
  5650K .......... .......... .......... .......... .......... 81% 43.1M 0s
  5700K .......... .......... .......... .......... .......... 81% 40.3M 0s
  5750K .......... .......... .......... .......... .......... 82% 53.2M 0s
  5800K .......... .......... .......... .......... .......... 83% 43.8M 0s
  5850K .......... .......... .......... .......... .......... 84% 23.6M 0s
  5900K .......... .......... .......... .......... .......... 84% 57.3M 0s
  5950K .......... .......... .......... .......... .......... 85% 24.2M 0s
  6000K .......... .......... .......... .......... .......... 86% 17.6M 0s
  6050K .......... .......... .......... .......... .......... 86% 20.1M 0s
  6100K .......... .......... .......... .......... .......... 87% 24.0M 0s
  6150K .......... .......... .......... .......... .......... 88% 24.4M 0s
  6200K .......... .......... .......... .......... .......... 89% 19.1M 0s
  6250K .......... .......... .......... .......... .......... 89% 23.9M 0s
  6300K .......... .......... .......... .......... .......... 90% 9.79M 0s
  6350K .......... .......... .......... .......... .......... 91% 65.7M 0s
  6400K .......... .......... .......... .......... .......... 91% 23.5M 0s
  6450K .......... .......... .......... .......... .......... 92% 83.3M 0s
  6500K .......... .......... .......... .......... .......... 93%  166M 0s
  6550K .......... .......... .......... .......... .......... 94% 58.1M 0s
  6600K .......... .......... .......... .......... .......... 94% 2.90M 0s
  6650K .......... .......... .......... .......... .......... 95%  920K 0s
  6700K .......... .......... .......... .......... .......... 96% 23.6M 0s
  6750K .......... .......... .......... .......... .......... 96% 55.6M 0s
  6800K .......... .......... .......... .......... .......... 97% 32.2M 0s
  6850K .......... .......... .......... .......... .......... 98% 29.5M 0s
  6900K .......... .......... .......... .......... .......... 99% 23.9M 0s
  6950K .......... .......... .......... .......... .......... 99% 47.5M 0s
  7000K .......... ........                                   100% 33.2M=1.4s

2020-12-28 09:16:41 (4.91 MB/s) - ‘linux-media.tar.bz2’ saved [7186884/7186884]

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
patch -s -f -N -p1 -i ../backports/ccs.patch
patch -s -f -N -p1 -i ../backports/v5.9_tasklet.patch
patch -s -f -N -p1 -i ../backports/v5.7_mmap_read_lock.patch
patch -s -f -N -p1 -i ../backports/v5.7_vm_map_ram.patch
1 out of 1 hunk FAILED
make[2]: *** [Makefile:132: apply_patches] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make[1]: *** [Makefile:378: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
