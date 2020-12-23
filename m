Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55922E1A78
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 10:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgLWJQb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 23 Dec 2020 04:16:31 -0500
Received: from www.linuxtv.org ([130.149.80.248]:49476 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727892AbgLWJQb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 04:16:31 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ks0FI-00HTPm-2M; Wed, 23 Dec 2020 09:15:48 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ks0Ia-00014q-8G; Wed, 23 Dec 2020 09:19:12 +0000
Date:   Wed, 23 Dec 2020 09:19:11 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1724535824.21.1608715152247@builder.linuxtv.org>
In-Reply-To: <1156307820.20.1608628751858@builder.linuxtv.org>
References: <1156307820.20.1608628751858@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3336
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

See <https://builder.linuxtv.org/job/media-build/3336/display/redirect>

Changes:


------------------------------------------
[...truncated 3.63 KB...]
Saving to: ‘linux-media.tar.bz2.md5.tmp’

     0K                                                       100%  149M=0s

2020-12-23 09:16:40 (149 MB/s) - ‘linux-media.tar.bz2.md5.tmp’ saved [105/105]

--2020-12-23 09:16:40--  http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Resolving linuxtv.org (linuxtv.org)... 130.149.80.248
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2 [following]
--2020-12-23 09:16:40--  https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7186707 (6.9M) [application/x-bzip2]
Saving to: ‘linux-media.tar.bz2’

     0K .......... .......... .......... .......... ..........  0%  162K 43s
    50K .......... .......... .......... .......... ..........  1%  326K 32s
   100K .......... .......... .......... .......... ..........  2% 17.1M 21s
   150K .......... .......... .......... .......... ..........  2% 14.5M 16s
   200K .......... .......... .......... .......... ..........  3%  334K 17s
   250K .......... .......... .......... .......... ..........  4% 16.7M 14s
   300K .......... .......... .......... .......... ..........  4% 16.9M 12s
   350K .......... .......... .......... .......... ..........  5% 14.9M 10s
   400K .......... .......... .......... .......... ..........  6%  348K 11s
   450K .......... .......... .......... .......... ..........  7% 16.0M 10s
   500K .......... .......... .......... .......... ..........  7% 19.1M 9s
   550K .......... .......... .......... .......... ..........  8% 20.8M 8s
   600K .......... .......... .......... .......... ..........  9% 19.3M 8s
   650K .......... .......... .......... .......... ..........  9% 22.7M 7s
   700K .......... .......... .......... .......... .......... 10% 23.5M 7s
   750K .......... .......... .......... .......... .......... 11% 23.6M 6s
   800K .......... .......... .......... .......... .......... 12% 17.6M 6s
   850K .......... .......... .......... .......... .......... 12%  375K 6s
   900K .......... .......... .......... .......... .......... 13% 22.4M 6s
   950K .......... .......... .......... .......... .......... 14% 25.1M 6s
  1000K .......... .......... .......... .......... .......... 14% 22.9M 5s
  1050K .......... .......... .......... .......... .......... 15% 25.2M 5s
  1100K .......... .......... .......... .......... .......... 16% 26.2M 5s
  1150K .......... .......... .......... .......... .......... 17% 24.5M 5s
  1200K .......... .......... .......... .......... .......... 17% 13.9M 4s
  1250K .......... .......... .......... .......... .......... 18% 23.1M 4s
  1300K .......... .......... .......... .......... .......... 19% 23.5M 4s
  1350K .......... .......... .......... .......... .......... 19% 17.9M 4s
  1400K .......... .......... .......... .......... .......... 20% 25.9M 4s
  1450K .......... .......... .......... .......... .......... 21% 29.8M 3s
  1500K .......... .......... .......... .......... .......... 22% 28.4M 3s
  1550K .......... .......... .......... .......... .......... 22% 25.3M 3s
  1600K .......... .......... .......... .......... .......... 23% 21.6M 3s
  1650K .......... .......... .......... .......... .......... 24% 29.6M 3s
  1700K .......... .......... .......... .......... .......... 24% 31.1M 3s
  1750K .......... .......... .......... .......... .......... 25%  422K 3s
  1800K .......... .......... .......... .......... .......... 26% 47.7M 3s
  1850K .......... .......... .......... .......... .......... 27% 39.9M 3s
  1900K .......... .......... .......... .......... .......... 27% 40.3M 3s
  1950K .......... .......... .......... .......... .......... 28% 54.7M 3s
  2000K .......... .......... .......... .......... .......... 29% 32.1M 3s
  2050K .......... .......... .......... .......... .......... 29% 40.6M 3s
  2100K .......... .......... .......... .......... .......... 30% 41.5M 2s
  2150K .......... .......... .......... .......... .......... 31% 55.4M 2s
  2200K .......... .......... .......... .......... .......... 32% 37.2M 2s
  2250K .......... .......... .......... .......... .......... 32% 64.9M 2s
  2300K .......... .......... .......... .......... .......... 33% 62.5M 2s
  2350K .......... .......... .......... .......... .......... 34% 36.0M 2s
  2400K .......... .......... .......... .......... .......... 34% 18.0M 2s
  2450K .......... .......... .......... .......... .......... 35% 23.5M 2s
  2500K .......... .......... .......... .......... .......... 36% 23.2M 2s
  2550K .......... .......... .......... .......... .......... 37% 25.1M 2s
  2600K .......... .......... .......... .......... .......... 37% 22.9M 2s
  2650K .......... .......... .......... .......... .......... 38% 23.4M 2s
  2700K .......... .......... .......... .......... .......... 39% 24.3M 2s
  2750K .......... .......... .......... .......... .......... 39% 24.0M 2s
  2800K .......... .......... .......... .......... .......... 40% 17.9M 2s
  2850K .......... .......... .......... .......... .......... 41% 23.9M 2s
  2900K .......... .......... .......... .......... .......... 42% 25.0M 2s
  2950K .......... .......... .......... .......... .......... 42% 25.9M 1s
  3000K .......... .......... .......... .......... .......... 43% 25.8M 1s
  3050K .......... .......... .......... .......... .......... 44% 25.1M 1s
  3100K .......... .......... .......... .......... .......... 44% 25.4M 1s
  3150K .......... .......... .......... .......... .......... 45% 23.9M 1s
  3200K .......... .......... .......... .......... .......... 46% 20.3M 1s
  3250K .......... .......... .......... .......... .......... 47% 20.7M 1s
  3300K .......... .......... .......... .......... .......... 47% 20.2M 1s
  3350K .......... .......... .......... .......... .......... 48% 22.5M 1s
  3400K .......... .......... .......... .......... .......... 49% 25.3M 1s
  3450K .......... .......... .......... .......... .......... 49% 25.5M 1s
  3500K .......... .......... .......... .......... .......... 50% 26.0M 1s
  3550K .......... .......... .......... .......... .......... 51%  545K 1s
  3600K .......... .......... .......... .......... .......... 52% 47.5M 1s
  3650K .......... .......... .......... .......... .......... 52% 56.0M 1s
  3700K .......... .......... .......... .......... .......... 53% 47.8M 1s
  3750K .......... .......... .......... .......... .......... 54% 58.8M 1s
  3800K .......... .......... .......... .......... .......... 54% 51.6M 1s
  3850K .......... .......... .......... .......... .......... 55% 49.4M 1s
  3900K .......... .......... .......... .......... .......... 56% 49.7M 1s
  3950K .......... .......... .......... .......... .......... 56% 37.6M 1s
  4000K .......... .......... .......... .......... .......... 57% 38.1M 1s
  4050K .......... .......... .......... .......... .......... 58% 54.4M 1s
  4100K .......... .......... .......... .......... .......... 59% 89.5M 1s
  4150K .......... .......... .......... .......... .......... 59%  104M 1s
  4200K .......... .......... .......... .......... .......... 60% 62.1M 1s
  4250K .......... .......... .......... .......... .......... 61% 51.3M 1s
  4300K .......... .......... .......... .......... .......... 61% 49.6M 1s
  4350K .......... .......... .......... .......... .......... 62% 46.9M 1s
  4400K .......... .......... .......... .......... .......... 63% 36.0M 1s
  4450K .......... .......... .......... .......... .......... 64%  132M 1s
  4500K .......... .......... .......... .......... .......... 64% 56.3M 1s
  4550K .......... .......... .......... .......... .......... 65% 53.0M 1s
  4600K .......... .......... .......... .......... .......... 66% 53.8M 1s
  4650K .......... .......... .......... .......... .......... 66% 60.6M 1s
  4700K .......... .......... .......... .......... .......... 67% 53.1M 1s
  4750K .......... .......... .......... .......... .......... 68% 58.2M 1s
  4800K .......... .......... .......... .......... .......... 69% 45.7M 1s
  4850K .......... .......... .......... .......... .......... 69% 9.14M 1s
  4900K .......... .......... .......... .......... .......... 70%  139M 1s
  4950K .......... .......... .......... .......... .......... 71%  244M 1s
  5000K .......... .......... .......... .......... .......... 71%  178M 0s
  5050K .......... .......... .......... .......... .......... 72%  196M 0s
  5100K .......... .......... .......... .......... .......... 73%  189M 0s
  5150K .......... .......... .......... .......... .......... 74%  223M 0s
  5200K .......... .......... .......... .......... .......... 74%  173M 0s
  5250K .......... .......... .......... .......... .......... 75%  203M 0s
  5300K .......... .......... .......... .......... .......... 76% 63.5M 0s
  5350K .......... .......... .......... .......... .......... 76% 25.2M 0s
  5400K .......... .......... .......... .......... .......... 77%  164M 0s
  5450K .......... .......... .......... .......... .......... 78%  153M 0s
  5500K .......... .......... .......... .......... .......... 79% 59.2M 0s
  5550K .......... .......... .......... .......... .......... 79% 54.9M 0s
  5600K .......... .......... .......... .......... .......... 80% 46.7M 0s
  5650K .......... .......... .......... .......... .......... 81% 68.3M 0s
  5700K .......... .......... .......... .......... .......... 81% 5.65M 0s
  5750K .......... .......... .......... .......... .......... 82% 22.3M 0s
  5800K .......... .......... .......... .......... .......... 83% 22.4M 0s
  5850K .......... .......... .......... .......... .......... 84% 20.9M 0s
  5900K .......... .......... .......... .......... .......... 84% 7.38M 0s
  5950K .......... .......... .......... .......... .......... 85%  213M 0s
  6000K .......... .......... .......... .......... .......... 86% 69.3M 0s
  6050K .......... .......... .......... .......... .......... 86% 21.6M 0s
  6100K .......... .......... .......... .......... .......... 87% 21.9M 0s
  6150K .......... .......... .......... .......... .......... 88% 23.5M 0s
  6200K .......... .......... .......... .......... .......... 89% 23.0M 0s
  6250K .......... .......... .......... .......... .......... 89% 24.9M 0s
  6300K .......... .......... .......... .......... .......... 90% 24.4M 0s
  6350K .......... .......... .......... .......... .......... 91% 22.7M 0s
  6400K .......... .......... .......... .......... .......... 91% 19.0M 0s
  6450K .......... .......... .......... .......... .......... 92% 23.5M 0s
  6500K .......... .......... .......... .......... .......... 93% 24.0M 0s
  6550K .......... .......... .......... .......... .......... 94% 22.4M 0s
  6600K .......... .......... .......... .......... .......... 94% 22.8M 0s
  6650K .......... .......... .......... .......... .......... 95%  721K 0s
  6700K .......... .......... .......... .......... .......... 96% 45.3M 0s
  6750K .......... .......... .......... .......... .......... 96% 56.1M 0s
  6800K .......... .......... .......... .......... .......... 97% 38.7M 0s
  6850K .......... .......... .......... .......... .......... 98% 66.5M 0s
  6900K .......... .......... .......... .......... .......... 99% 54.7M 0s
  6950K .......... .......... .......... .......... .......... 99% 25.8M 0s
  7000K .......... ........                                   100%  101M=1.4s

2020-12-23 09:16:42 (4.92 MB/s) - ‘linux-media.tar.bz2’ saved [7186707/7186707]

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
