Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7826841306E
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 10:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbhIUIvE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 21 Sep 2021 04:51:04 -0400
Received: from www.linuxtv.org ([130.149.80.248]:52598 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231268AbhIUIvC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 04:51:02 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mSbT3-001gAs-1Q; Tue, 21 Sep 2021 08:49:33 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mSbT1-002PlQ-Fj; Tue, 21 Sep 2021 08:49:30 +0000
Date:   Tue, 21 Sep 2021 08:49:29 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <656726190.0.1632214170111@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3636
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

See <https://builder.linuxtv.org/job/media-build/3636/display/redirect?page=changes>

Changes:

[hverkuil-cisco] Add compat support for dma_vmap_noncontiguous

[hverkuil-cisco] Update backports/v5.10_vb2_dma_buf_map.patch

[hverkuil-cisco] Update backports/v5.1_vm_map_pages.patch

[hverkuil-cisco] Update backports/v4.8_dma_map_resource.patch

[hverkuil-cisco] Update backports/v4.7_dma_attrs.patch

[hverkuil-cisco] VIDEO_OV13B10 needs probe_new

[hverkuil-cisco] Add backports/v4.9_vivid_ktime.patch


------------------------------------------
[...truncated 5.24 KB...]
--2021-09-21 08:49:23--  http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Resolving linuxtv.org (linuxtv.org)... 130.149.80.248
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2 [following]
--2021-09-21 08:49:23--  https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7334433 (7.0M) [application/x-bzip2]
Saving to: ‘linux-media.tar.bz2’

     0K .......... .......... .......... .......... ..........  0%  156K 46s
    50K .......... .......... .......... .......... ..........  1%  313K 34s
   100K .......... .......... .......... .......... ..........  2% 27.7M 23s
   150K .......... .......... .......... .......... ..........  2%  315K 22s
   200K .......... .......... .......... .......... ..........  3% 28.3M 18s
   250K .......... .......... .......... .......... ..........  4% 24.2M 15s
   300K .......... .......... .......... .......... ..........  4% 25.0M 13s
   350K .......... .......... .......... .......... ..........  5% 24.5M 11s
   400K .......... .......... .......... .......... ..........  6%  324K 12s
   450K .......... .......... .......... .......... ..........  6% 24.1M 11s
   500K .......... .......... .......... .......... ..........  7% 28.8M 10s
   550K .......... .......... .......... .......... ..........  8% 28.1M 9s
   600K .......... .......... .......... .......... ..........  9% 27.6M 8s
   650K .......... .......... .......... .......... ..........  9% 27.9M 8s
   700K .......... .......... .......... .......... .......... 10% 27.3M 7s
   750K .......... .......... .......... .......... .......... 11% 29.5M 6s
   800K .......... .......... .......... .......... .......... 11%  339K 7s
   850K .......... .......... .......... .......... .......... 12% 28.3M 7s
   900K .......... .......... .......... .......... .......... 13% 28.2M 6s
   950K .......... .......... .......... .......... .......... 13% 26.1M 6s
  1000K .......... .......... .......... .......... .......... 14% 25.5M 6s
  1050K .......... .......... .......... .......... .......... 15% 27.2M 5s
  1100K .......... .......... .......... .......... .......... 16% 23.6M 5s
  1150K .......... .......... .......... .......... .......... 16% 26.7M 5s
  1200K .......... .......... .......... .......... .......... 17% 20.8M 5s
  1250K .......... .......... .......... .......... .......... 18% 28.1M 4s
  1300K .......... .......... .......... .......... .......... 18% 25.6M 4s
  1350K .......... .......... .......... .......... .......... 19% 27.8M 4s
  1400K .......... .......... .......... .......... .......... 20% 27.0M 4s
  1450K .......... .......... .......... .......... .......... 20% 27.8M 4s
  1500K .......... .......... .......... .......... .......... 21% 28.7M 4s
  1550K .......... .......... .......... .......... .......... 22% 27.6M 3s
  1600K .......... .......... .......... .......... .......... 23% 3.39M 3s
  1650K .......... .......... .......... .......... .......... 23%  422K 4s
  1700K .......... .......... .......... .......... .......... 24% 83.1M 3s
  1750K .......... .......... .......... .......... .......... 25% 53.2M 3s
  1800K .......... .......... .......... .......... .......... 25% 40.7M 3s
  1850K .......... .......... .......... .......... .......... 26% 77.9M 3s
  1900K .......... .......... .......... .......... .......... 27% 55.7M 3s
  1950K .......... .......... .......... .......... .......... 27% 60.9M 3s
  2000K .......... .......... .......... .......... .......... 28% 44.5M 3s
  2050K .......... .......... .......... .......... .......... 29% 51.8M 3s
  2100K .......... .......... .......... .......... .......... 30% 59.1M 3s
  2150K .......... .......... .......... .......... .......... 30% 48.6M 3s
  2200K .......... .......... .......... .......... .......... 31% 42.1M 2s
  2250K .......... .......... .......... .......... .......... 32% 22.6M 2s
  2300K .......... .......... .......... .......... .......... 32% 27.8M 2s
  2350K .......... .......... .......... .......... .......... 33% 26.9M 2s
  2400K .......... .......... .......... .......... .......... 34% 21.4M 2s
  2450K .......... .......... .......... .......... .......... 34% 27.2M 2s
  2500K .......... .......... .......... .......... .......... 35% 27.3M 2s
  2550K .......... .......... .......... .......... .......... 36% 28.5M 2s
  2600K .......... .......... .......... .......... .......... 36% 20.8M 2s
  2650K .......... .......... .......... .......... .......... 37% 28.0M 2s
  2700K .......... .......... .......... .......... .......... 38% 28.2M 2s
  2750K .......... .......... .......... .......... .......... 39% 30.0M 2s
  2800K .......... .......... .......... .......... .......... 39% 20.8M 2s
  2850K .......... .......... .......... .......... .......... 40% 28.7M 2s
  2900K .......... .......... .......... .......... .......... 41% 29.3M 2s
  2950K .......... .......... .......... .......... .......... 41% 28.2M 2s
  3000K .......... .......... .......... .......... .......... 42% 27.7M 2s
  3050K .......... .......... .......... .......... .......... 43% 34.6M 2s
  3100K .......... .......... .......... .......... .......... 43% 25.4M 1s
  3150K .......... .......... .......... .......... .......... 44% 29.5M 1s
  3200K .......... .......... .......... .......... .......... 45% 21.4M 1s
  3250K .......... .......... .......... .......... .......... 46% 28.5M 1s
  3300K .......... .......... .......... .......... .......... 46% 26.7M 1s
  3350K .......... .......... .......... .......... .......... 47%  458K 1s
  3400K .......... .......... .......... .......... .......... 48% 43.6M 1s
  3450K .......... .......... .......... .......... .......... 48% 72.1M 1s
  3500K .......... .......... .......... .......... .......... 49% 72.2M 1s
  3550K .......... .......... .......... .......... .......... 50% 49.5M 1s
  3600K .......... .......... .......... .......... .......... 50% 49.4M 1s
  3650K .......... .......... .......... .......... .......... 51% 61.7M 1s
  3700K .......... .......... .......... .......... .......... 52% 66.4M 1s
  3750K .......... .......... .......... .......... .......... 53% 59.9M 1s
  3800K .......... .......... .......... .......... .......... 53% 61.0M 1s
  3850K .......... .......... .......... .......... .......... 54% 60.1M 1s
  3900K .......... .......... .......... .......... .......... 55% 64.2M 1s
  3950K .......... .......... .......... .......... .......... 55% 66.3M 1s
  4000K .......... .......... .......... .......... .......... 56% 51.6M 1s
  4050K .......... .......... .......... .......... .......... 57% 55.9M 1s
  4100K .......... .......... .......... .......... .......... 57% 63.4M 1s
  4150K .......... .......... .......... .......... .......... 58% 73.4M 1s
  4200K .......... .......... .......... .......... .......... 59% 58.4M 1s
  4250K .......... .......... .......... .......... .......... 60% 58.4M 1s
  4300K .......... .......... .......... .......... .......... 60% 67.4M 1s
  4350K .......... .......... .......... .......... .......... 61% 29.5M 1s
  4400K .......... .......... .......... .......... .......... 62%  157M 1s
  4450K .......... .......... .......... .......... .......... 62%  127M 1s
  4500K .......... .......... .......... .......... .......... 63% 51.2M 1s
  4550K .......... .......... .......... .......... .......... 64% 57.4M 1s
  4600K .......... .......... .......... .......... .......... 64% 59.5M 1s
  4650K .......... .......... .......... .......... .......... 65% 32.5M 1s
  4700K .......... .......... .......... .......... .......... 66%  206M 1s
  4750K .......... .......... .......... .......... .......... 67% 58.2M 1s
  4800K .......... .......... .......... .......... .......... 67% 46.2M 1s
  4850K .......... .......... .......... .......... .......... 68% 66.6M 1s
  4900K .......... .......... .......... .......... .......... 69% 47.6M 1s
  4950K .......... .......... .......... .......... .......... 69% 63.3M 1s
  5000K .......... .......... .......... .......... .......... 70% 54.9M 1s
  5050K .......... .......... .......... .......... .......... 71% 59.3M 1s
  5100K .......... .......... .......... .......... .......... 71% 51.4M 1s
  5150K .......... .......... .......... .......... .......... 72% 64.7M 0s
  5200K .......... .......... .......... .......... .......... 73% 32.4M 0s
  5250K .......... .......... .......... .......... .......... 73%  127M 0s
  5300K .......... .......... .......... .......... .......... 74% 54.6M 0s
  5350K .......... .......... .......... .......... .......... 75% 49.4M 0s
  5400K .......... .......... .......... .......... .......... 76% 53.3M 0s
  5450K .......... .......... .......... .......... .......... 76% 56.4M 0s
  5500K .......... .......... .......... .......... .......... 77% 66.9M 0s
  5550K .......... .......... .......... .......... .......... 78% 40.4M 0s
  5600K .......... .......... .......... .......... .......... 78% 20.2M 0s
  5650K .......... .......... .......... .......... .......... 79% 27.1M 0s
  5700K .......... .......... .......... .......... .......... 80% 28.0M 0s
  5750K .......... .......... .......... .......... .......... 80% 28.6M 0s
  5800K .......... .......... .......... .......... .......... 81% 27.1M 0s
  5850K .......... .......... .......... .......... .......... 82% 27.1M 0s
  5900K .......... .......... .......... .......... .......... 83% 28.3M 0s
  5950K .......... .......... .......... .......... .......... 83% 28.8M 0s
  6000K .......... .......... .......... .......... .......... 84% 23.4M 0s
  6050K .......... .......... .......... .......... .......... 85% 28.4M 0s
  6100K .......... .......... .......... .......... .......... 85% 30.5M 0s
  6150K .......... .......... .......... .......... .......... 86% 28.5M 0s
  6200K .......... .......... .......... .......... .......... 87% 27.2M 0s
  6250K .......... .......... .......... .......... .......... 87% 28.9M 0s
  6300K .......... .......... .......... .......... .......... 88% 30.3M 0s
  6350K .......... .......... .......... .......... .......... 89% 28.1M 0s
  6400K .......... .......... .......... .......... .......... 90%  531K 0s
  6450K .......... .......... .......... .......... .......... 90% 27.4M 0s
  6500K .......... .......... .......... .......... .......... 91% 19.5M 0s
  6550K .......... .......... .......... .......... .......... 92% 33.6M 0s
  6600K .......... .......... .......... .......... .......... 92% 28.3M 0s
  6650K .......... .......... .......... .......... .......... 93% 28.6M 0s
  6700K .......... .......... .......... .......... .......... 94% 29.4M 0s
  6750K .......... .......... .......... .......... .......... 94% 29.5M 0s
  6800K .......... .......... .......... .......... .......... 95% 22.1M 0s
  6850K .......... .......... .......... .......... .......... 96% 29.0M 0s
  6900K .......... .......... .......... .......... .......... 97% 28.1M 0s
  6950K .......... .......... .......... .......... .......... 97% 28.4M 0s
  7000K .......... .......... .......... .......... .......... 98% 28.4M 0s
  7050K .......... .......... .......... .......... .......... 99% 28.4M 0s
  7100K .......... .......... .......... .......... .......... 99% 27.2M 0s
  7150K .......... ..                                         100% 45.0M=1.5s

2021-09-21 08:49:25 (4.76 MB/s) - ‘linux-media.tar.bz2’ saved [7334433/7334433]

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
No version yet, using 5.10.0-8-amd64
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Applying patches for kernel 5.10.0-8-amd64
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
patch -s -f -N -p1 -i ../backports/debug.patch
patch -s -f -N -p1 -i ../backports/drx39xxj.patch
patch -s -f -N -p1 -i ../backports/ccs.patch
patch -s -f -N -p1 -i ../backports/rc-cec.patch
patch -s -f -N -p1 -i ../backports/v5.14_bus_void_return.patch
patch -s -f -N -p1 -i ../backports/v5.12_uvc.patch
patch -s -f -N -p1 -i ../backports/v5.11_isa.patch
patch -s -f -N -p1 -i ../backports/v5.10_vb2_dma_buf_map.patch
2 out of 5 hunks FAILED
make[2]: *** [Makefile:132: apply_patches] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make[1]: *** [Makefile:366: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
