Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D03442E775A
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 10:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgL3JQb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 30 Dec 2020 04:16:31 -0500
Received: from www.linuxtv.org ([130.149.80.248]:33586 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725814AbgL3JQb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 04:16:31 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kuXa6-009wAV-5H; Wed, 30 Dec 2020 09:15:46 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kuXdQ-0002XS-NM; Wed, 30 Dec 2020 09:19:12 +0000
Date:   Wed, 30 Dec 2020 09:19:12 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1732032616.28.1609319952715@builder.linuxtv.org>
In-Reply-To: <1122230278.27.1609233551858@builder.linuxtv.org>
References: <1122230278.27.1609233551858@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3343
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

See <https://builder.linuxtv.org/job/media-build/3343/display/redirect>

Changes:


------------------------------------------
[...truncated 3.63 KB...]
Saving to: ‘linux-media.tar.bz2.md5.tmp’

     0K                                                       100%  154M=0s

2020-12-30 09:16:38 (154 MB/s) - ‘linux-media.tar.bz2.md5.tmp’ saved [105/105]

--2020-12-30 09:16:38--  http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Resolving linuxtv.org (linuxtv.org)... 130.149.80.248
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2 [following]
--2020-12-30 09:16:39--  https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7186861 (6.9M) [application/x-bzip2]
Saving to: ‘linux-media.tar.bz2’

     0K .......... .......... .......... .......... ..........  0%  161K 43s
    50K .......... .......... .......... .......... ..........  1%  324K 32s
   100K .......... .......... .......... .......... ..........  2% 12.9M 21s
   150K .......... .......... .......... .......... ..........  2% 10.8M 16s
   200K .......... .......... .......... .......... ..........  3%  337K 17s
   250K .......... .......... .......... .......... ..........  4% 14.3M 14s
   300K .......... .......... .......... .......... ..........  4% 13.8M 12s
   350K .......... .......... .......... .......... ..........  5% 13.3M 10s
   400K .......... .......... .......... .......... ..........  6%  351K 11s
   450K .......... .......... .......... .......... ..........  7% 14.6M 10s
   500K .......... .......... .......... .......... ..........  7% 14.5M 9s
   550K .......... .......... .......... .......... ..........  8% 18.0M 8s
   600K .......... .......... .......... .......... ..........  9% 18.0M 8s
   650K .......... .......... .......... .......... ..........  9% 21.0M 7s
   700K .......... .......... .......... .......... .......... 10% 22.8M 7s
   750K .......... .......... .......... .......... .......... 11% 20.6M 6s
   800K .......... .......... .......... .......... .......... 12% 17.3M 6s
   850K .......... .......... .......... .......... .......... 12%  379K 6s
   900K .......... .......... .......... .......... .......... 13% 27.1M 6s
   950K .......... .......... .......... .......... .......... 14% 22.8M 6s
  1000K .......... .......... .......... .......... .......... 14% 23.2M 5s
  1050K .......... .......... .......... .......... .......... 15% 29.7M 5s
  1100K .......... .......... .......... .......... .......... 16% 24.5M 5s
  1150K .......... .......... .......... .......... .......... 17% 22.1M 5s
  1200K .......... .......... .......... .......... .......... 17% 17.1M 4s
  1250K .......... .......... .......... .......... .......... 18% 23.4M 4s
  1300K .......... .......... .......... .......... .......... 19% 22.8M 4s
  1350K .......... .......... .......... .......... .......... 19% 22.6M 4s
  1400K .......... .......... .......... .......... .......... 20% 21.7M 4s
  1450K .......... .......... .......... .......... .......... 21% 24.5M 4s
  1500K .......... .......... .......... .......... .......... 22% 22.3M 3s
  1550K .......... .......... .......... .......... .......... 22% 36.3M 3s
  1600K .......... .......... .......... .......... .......... 23% 19.0M 3s
  1650K .......... .......... .......... .......... .......... 24% 25.1M 3s
  1700K .......... .......... .......... .......... .......... 24% 25.9M 3s
  1750K .......... .......... .......... .......... .......... 25%  421K 3s
  1800K .......... .......... .......... .......... .......... 26% 33.2M 3s
  1850K .......... .......... .......... .......... .......... 27% 36.8M 3s
  1900K .......... .......... .......... .......... .......... 27% 44.6M 3s
  1950K .......... .......... .......... .......... .......... 28% 30.6M 3s
  2000K .......... .......... .......... .......... .......... 29% 39.2M 3s
  2050K .......... .......... .......... .......... .......... 29% 32.8M 3s
  2100K .......... .......... .......... .......... .......... 30% 39.5M 2s
  2150K .......... .......... .......... .......... .......... 31% 42.0M 2s
  2200K .......... .......... .......... .......... .......... 32% 26.0M 2s
  2250K .......... .......... .......... .......... .......... 32% 22.4M 2s
  2300K .......... .......... .......... .......... .......... 33% 23.0M 2s
  2350K .......... .......... .......... .......... .......... 34% 22.6M 2s
  2400K .......... .......... .......... .......... .......... 34% 16.0M 2s
  2450K .......... .......... .......... .......... .......... 35% 20.8M 2s
  2500K .......... .......... .......... .......... .......... 36% 22.2M 2s
  2550K .......... .......... .......... .......... .......... 37% 21.6M 2s
  2600K .......... .......... .......... .......... .......... 37% 21.0M 2s
  2650K .......... .......... .......... .......... .......... 38% 21.5M 2s
  2700K .......... .......... .......... .......... .......... 39% 22.5M 2s
  2750K .......... .......... .......... .......... .......... 39% 21.2M 2s
  2800K .......... .......... .......... .......... .......... 40% 18.0M 2s
  2850K .......... .......... .......... .......... .......... 41% 22.9M 2s
  2900K .......... .......... .......... .......... .......... 42% 22.2M 2s
  2950K .......... .......... .......... .......... .......... 42% 22.2M 2s
  3000K .......... .......... .......... .......... .......... 43% 21.0M 1s
  3050K .......... .......... .......... .......... .......... 44% 22.4M 1s
  3100K .......... .......... .......... .......... .......... 44% 21.3M 1s
  3150K .......... .......... .......... .......... .......... 45% 23.6M 1s
  3200K .......... .......... .......... .......... .......... 46% 17.4M 1s
  3250K .......... .......... .......... .......... .......... 47% 23.0M 1s
  3300K .......... .......... .......... .......... .......... 47% 23.1M 1s
  3350K .......... .......... .......... .......... .......... 48% 22.1M 1s
  3400K .......... .......... .......... .......... .......... 49% 21.7M 1s
  3450K .......... .......... .......... .......... .......... 49% 23.9M 1s
  3500K .......... .......... .......... .......... .......... 50% 22.6M 1s
  3550K .......... .......... .......... .......... .......... 51%  604K 1s
  3600K .......... .......... .......... .......... .......... 52% 39.4M 1s
  3650K .......... .......... .......... .......... .......... 52% 45.1M 1s
  3700K .......... .......... .......... .......... .......... 53% 39.7M 1s
  3750K .......... .......... .......... .......... .......... 54% 48.2M 1s
  3800K .......... .......... .......... .......... .......... 54% 34.6M 1s
  3850K .......... .......... .......... .......... .......... 55% 49.5M 1s
  3900K .......... .......... .......... .......... .......... 56% 44.2M 1s
  3950K .......... .......... .......... .......... .......... 56% 70.4M 1s
  4000K .......... .......... .......... .......... .......... 57% 32.5M 1s
  4050K .......... .......... .......... .......... .......... 58% 45.8M 1s
  4100K .......... .......... .......... .......... .......... 59% 50.5M 1s
  4150K .......... .......... .......... .......... .......... 59% 40.9M 1s
  4200K .......... .......... .......... .......... .......... 60% 43.3M 1s
  4250K .......... .......... .......... .......... .......... 61% 48.2M 1s
  4300K .......... .......... .......... .......... .......... 61% 43.7M 1s
  4350K .......... .......... .......... .......... .......... 62% 51.3M 1s
  4400K .......... .......... .......... .......... .......... 63% 38.4M 1s
  4450K .......... .......... .......... .......... .......... 64% 48.7M 1s
  4500K .......... .......... .......... .......... .......... 64% 47.8M 1s
  4550K .......... .......... .......... .......... .......... 65% 52.7M 1s
  4600K .......... .......... .......... .......... .......... 66% 40.9M 1s
  4650K .......... .......... .......... .......... .......... 66% 49.2M 1s
  4700K .......... .......... .......... .......... .......... 67% 45.2M 1s
  4750K .......... .......... .......... .......... .......... 68% 50.2M 1s
  4800K .......... .......... .......... .......... .......... 69% 39.3M 1s
  4850K .......... .......... .......... .......... .......... 69% 40.8M 1s
  4900K .......... .......... .......... .......... .......... 70% 51.5M 1s
  4950K .......... .......... .......... .......... .......... 71% 48.3M 1s
  5000K .......... .......... .......... .......... .......... 71% 52.5M 0s
  5050K .......... .......... .......... .......... .......... 72% 49.6M 0s
  5100K .......... .......... .......... .......... .......... 73% 54.2M 0s
  5150K .......... .......... .......... .......... .......... 74% 51.3M 0s
  5200K .......... .......... .......... .......... .......... 74% 38.8M 0s
  5250K .......... .......... .......... .......... .......... 75% 53.0M 0s
  5300K .......... .......... .......... .......... .......... 76% 43.1M 0s
  5350K .......... .......... .......... .......... .......... 76% 53.6M 0s
  5400K .......... .......... .......... .......... .......... 77% 50.1M 0s
  5450K .......... .......... .......... .......... .......... 78% 37.0M 0s
  5500K .......... .......... .......... .......... .......... 79% 52.2M 0s
  5550K .......... .......... .......... .......... .......... 79% 53.5M 0s
  5600K .......... .......... .......... .......... .......... 80% 31.1M 0s
  5650K .......... .......... .......... .......... .......... 81% 5.57M 0s
  5700K .......... .......... .......... .......... .......... 81% 23.8M 0s
  5750K .......... .......... .......... .......... .......... 82% 18.3M 0s
  5800K .......... .......... .......... .......... .......... 83% 21.0M 0s
  5850K .......... .......... .......... .......... .......... 84% 20.3M 0s
  5900K .......... .......... .......... .......... .......... 84% 16.8M 0s
  5950K .......... .......... .......... .......... .......... 85% 21.0M 0s
  6000K .......... .......... .......... .......... .......... 86% 15.3M 0s
  6050K .......... .......... .......... .......... .......... 86% 21.7M 0s
  6100K .......... .......... .......... .......... .......... 87% 22.0M 0s
  6150K .......... .......... .......... .......... .......... 88% 22.5M 0s
  6200K .......... .......... .......... .......... .......... 89% 20.9M 0s
  6250K .......... .......... .......... .......... .......... 89% 22.6M 0s
  6300K .......... .......... .......... .......... .......... 90% 21.7M 0s
  6350K .......... .......... .......... .......... .......... 91% 13.6M 0s
  6400K .......... .......... .......... .......... .......... 91% 26.9M 0s
  6450K .......... .......... .......... .......... .......... 92% 26.3M 0s
  6500K .......... .......... .......... .......... .......... 93% 20.5M 0s
  6550K .......... .......... .......... .......... .......... 94% 22.5M 0s
  6600K .......... .......... .......... .......... .......... 94% 6.23M 0s
  6650K .......... .......... .......... .......... .......... 95%  955K 0s
  6700K .......... .......... .......... .......... .......... 96% 30.5M 0s
  6750K .......... .......... .......... .......... .......... 96% 55.9M 0s
  6800K .......... .......... .......... .......... .......... 97% 30.6M 0s
  6850K .......... .......... .......... .......... .......... 98% 53.3M 0s
  6900K .......... .......... .......... .......... .......... 99% 39.7M 0s
  6950K .......... .......... .......... .......... .......... 99% 40.1M 0s
  7000K .......... ........                                   100% 40.1M=1.4s

2020-12-30 09:16:41 (4.89 MB/s) - ‘linux-media.tar.bz2’ saved [7186861/7186861]

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
