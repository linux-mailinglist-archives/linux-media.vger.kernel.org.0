Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1CCB25663F
	for <lists+linux-media@lfdr.de>; Sat, 29 Aug 2020 11:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgH2JQt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 29 Aug 2020 05:16:49 -0400
Received: from www.linuxtv.org ([130.149.80.248]:57198 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbgH2JQs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Aug 2020 05:16:48 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBwst-006Tdy-S4; Sat, 29 Aug 2020 09:10:52 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBx19-0001ko-RP; Sat, 29 Aug 2020 09:19:23 +0000
Date:   Sat, 29 Aug 2020 09:19:23 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <156407873.0.1598692763801@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3198
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

See <https://builder.linuxtv.org/job/media-build/3198/display/redirect?page=changes>

Changes:

[hverkuil-cisco] Add backport patches to revert to old tasklet behavior


------------------------------------------
[...truncated 7.78 KB...]
  1900K .......... .......... .......... .......... .......... 28% 1.49M 4s
  1950K .......... .......... .......... .......... .......... 28%  454K 4s
  2000K .......... .......... .......... .......... .......... 29% 18.7M 4s
  2050K .......... .......... .......... .......... .......... 30% 14.6M 4s
  2100K .......... .......... .......... .......... .......... 30% 22.7M 4s
  2150K .......... .......... .......... .......... .......... 31% 18.1M 3s
  2200K .......... .......... .......... .......... .......... 32% 21.0M 3s
  2250K .......... .......... .......... .......... .......... 33% 1.52M 3s
  2300K .......... .......... .......... .......... .......... 33%  453K 3s
  2350K .......... .......... .......... .......... .......... 34% 17.6M 3s
  2400K .......... .......... .......... .......... .......... 35% 15.7M 3s
  2450K .......... .......... .......... .......... .......... 35% 10.8M 3s
  2500K .......... .......... .......... .......... .......... 36% 35.2M 3s
  2550K .......... .......... .......... .......... .......... 37% 19.8M 3s
  2600K .......... .......... .......... .......... .......... 38% 1.63M 3s
  2650K .......... .......... .......... .......... .......... 38% 1.03M 3s
  2700K .......... .......... .......... .......... .......... 39%  765K 3s
  2750K .......... .......... .......... .......... .......... 40% 23.0M 3s
  2800K .......... .......... .......... .......... .......... 40% 14.1M 3s
  2850K .......... .......... .......... .......... .......... 41% 11.0M 3s
  2900K .......... .......... .......... .......... .......... 42% 21.8M 3s
  2950K .......... .......... .......... .......... .......... 43% 22.4M 2s
  3000K .......... .......... .......... .......... .......... 43% 1.69M 2s
  3050K .......... .......... .......... .......... .......... 44%  453K 3s
  3100K .......... .......... .......... .......... .......... 45% 16.1M 2s
  3150K .......... .......... .......... .......... .......... 46% 20.8M 2s
  3200K .......... .......... .......... .......... .......... 46% 15.8M 2s
  3250K .......... .......... .......... .......... .......... 47% 14.6M 2s
  3300K .......... .......... .......... .......... .......... 48% 21.2M 2s
  3350K .......... .......... .......... .......... .......... 48% 20.1M 2s
  3400K .......... .......... .......... .......... .......... 49% 1.73M 2s
  3450K .......... .......... .......... .......... .......... 50% 23.1M 2s
  3500K .......... .......... .......... .......... .......... 51%  451K 2s
  3550K .......... .......... .......... .......... .......... 51% 15.5M 2s
  3600K .......... .......... .......... .......... .......... 52% 16.2M 2s
  3650K .......... .......... .......... .......... .......... 53% 20.6M 2s
  3700K .......... .......... .......... .......... .......... 53% 10.1M 2s
  3750K .......... .......... .......... .......... .......... 54%  178M 2s
  3800K .......... .......... .......... .......... .......... 55% 24.2M 2s
  3850K .......... .......... .......... .......... .......... 56% 1.77M 2s
  3900K .......... .......... .......... .......... .......... 56%  453K 2s
  3950K .......... .......... .......... .......... .......... 57% 17.0M 2s
  4000K .......... .......... .......... .......... .......... 58% 14.8M 2s
  4050K .......... .......... .......... .......... .......... 58% 20.2M 2s
  4100K .......... .......... .......... .......... .......... 59% 20.1M 2s
  4150K .......... .......... .......... .......... .......... 60% 10.3M 2s
  4200K .......... .......... .......... .......... .......... 61% 23.2M 1s
  4250K .......... .......... .......... .......... .......... 61% 21.9M 1s
  4300K .......... .......... .......... .......... .......... 62% 1.95M 1s
  4350K .......... .......... .......... .......... .......... 63% 1.08M 1s
  4400K .......... .......... .......... .......... .......... 63%  734K 1s
  4450K .......... .......... .......... .......... .......... 64% 17.2M 1s
  4500K .......... .......... .......... .......... .......... 65% 21.4M 1s
  4550K .......... .......... .......... .......... .......... 66% 22.9M 1s
  4600K .......... .......... .......... .......... .......... 66% 18.5M 1s
  4650K .......... .......... .......... .......... .......... 67% 10.1M 1s
  4700K .......... .......... .......... .......... .......... 68% 21.8M 1s
  4750K .......... .......... .......... .......... .......... 69% 21.6M 1s
  4800K .......... .......... .......... .......... .......... 69% 1.96M 1s
  4850K .......... .......... .......... .......... .......... 70%  455K 1s
  4900K .......... .......... .......... .......... .......... 71% 20.2M 1s
  4950K .......... .......... .......... .......... .......... 71% 20.1M 1s
  5000K .......... .......... .......... .......... .......... 72% 22.9M 1s
  5050K .......... .......... .......... .......... .......... 73% 20.1M 1s
  5100K .......... .......... .......... .......... .......... 74% 21.9M 1s
  5150K .......... .......... .......... .......... .......... 74% 10.5M 1s
  5200K .......... .......... .......... .......... .......... 75% 15.7M 1s
  5250K .......... .......... .......... .......... .......... 76% 2.06M 1s
  5300K .......... .......... .......... .......... .......... 76% 21.0M 1s
  5350K .......... .......... .......... .......... .......... 77%  456K 1s
  5400K .......... .......... .......... .......... .......... 78% 9.91M 1s
  5450K .......... .......... .......... .......... .......... 79%  111M 1s
  5500K .......... .......... .......... .......... .......... 79% 23.3M 1s
  5550K .......... .......... .......... .......... .......... 80% 19.2M 1s
  5600K .......... .......... .......... .......... .......... 81% 11.4M 1s
  5650K .......... .......... .......... .......... .......... 81% 19.3M 1s
  5700K .......... .......... .......... .......... .......... 82% 21.4M 1s
  5750K .......... .......... .......... .......... .......... 83% 23.7M 1s
  5800K .......... .......... .......... .......... .......... 84% 2.02M 1s
  5850K .......... .......... .......... .......... .......... 84% 1.10M 1s
  5900K .......... .......... .......... .......... .......... 85%  744K 1s
  5950K .......... .......... .......... .......... .......... 86% 9.37M 0s
  6000K .......... .......... .......... .......... .......... 86% 15.7M 0s
  6050K .......... .......... .......... .......... .......... 87% 34.5M 0s
  6100K .......... .......... .......... .......... .......... 88% 27.5M 0s
  6150K .......... .......... .......... .......... .......... 89% 25.9M 0s
  6200K .......... .......... .......... .......... .......... 89% 22.8M 0s
  6250K .......... .......... .......... .......... .......... 90% 21.5M 0s
  6300K .......... .......... .......... .......... .......... 91% 21.2M 0s
  6350K .......... .......... .......... .......... .......... 92% 2.09M 0s
  6400K .......... .......... .......... .......... .......... 92%  453K 0s
  6450K .......... .......... .......... .......... .......... 93% 8.81M 0s
  6500K .......... .......... .......... .......... .......... 94% 18.0M 0s
  6550K .......... .......... .......... .......... .......... 94% 25.4M 0s
  6600K .......... .......... .......... .......... .......... 95% 23.6M 0s
  6650K .......... .......... .......... .......... .......... 96% 31.0M 0s
  6700K .......... .......... .......... .......... .......... 97% 29.6M 0s
  6750K .......... .......... .......... .......... .......... 97% 29.9M 0s
  6800K .......... .......... .......... .......... .......... 98% 19.6M 0s
  6850K .......... .......... .......... .......... .......... 99% 24.9M 0s
  6900K .......... .......... .......... .......... .......... 99% 2.06M 0s
  6950K ......                                                100%  132M=3.2s

2020-08-29 09:16:55 (2.15 MB/s) - ‘linux-media.tar.bz2’ saved [7123349/7123349]

make: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
tar xfj linux-media.tar.bz2
rm -f .patches_applied .linked_dir .git_log.md5
make: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
**********************************************************
* Downloading firmwares from linuxtv.org.                *
**********************************************************
--2020-08-29 09:16:58--  http://www.linuxtv.org/downloads/firmware//dvb-firmwares.tar.bz2
Resolving www.linuxtv.org (www.linuxtv.org)... 130.149.80.248
Connecting to www.linuxtv.org (www.linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://www.linuxtv.org/downloads/firmware/dvb-firmwares.tar.bz2 [following]
--2020-08-29 09:16:58--  https://www.linuxtv.org/downloads/firmware/dvb-firmwares.tar.bz2
Connecting to www.linuxtv.org (www.linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1519951 (1.4M) [application/x-bzip2]
Saving to: ‘dvb-firmwares.tar.bz2’

     0K .......... .......... .......... .......... ..........  3%  161K 9s
    50K .......... .......... .......... .......... ..........  6%  324K 6s
   100K .......... .......... .......... .......... .......... 10% 23.0M 4s
   150K .......... .......... .......... .......... .......... 13%  328K 4s
   200K .......... .......... .......... .......... .......... 16% 16.6M 3s
   250K .......... .......... .......... .......... .......... 20% 33.8M 2s
   300K .......... .......... .......... .......... .......... 23% 24.8M 2s
   350K .......... .......... .......... .......... .......... 26% 11.3M 2s
   400K .......... .......... .......... .......... .......... 30%  342K 2s
   450K .......... .......... .......... .......... .......... 33% 16.4M 2s
   500K .......... .......... .......... .......... .......... 37% 28.4M 1s
   550K .......... .......... .......... .......... .......... 40% 21.9M 1s
   600K .......... .......... .......... .......... .......... 43% 19.8M 1s
   650K .......... .......... .......... .......... .......... 47%  347K 1s
   700K .......... .......... .......... .......... .......... 50% 13.9M 1s
   750K .......... .......... .......... .......... .......... 53% 15.5M 1s
   800K .......... .......... .......... .......... .......... 57% 11.6M 1s
   850K .......... .......... .......... .......... .......... 60% 16.5M 1s
   900K .......... .......... .......... .......... .......... 64% 12.9M 1s
   950K .......... .......... .......... .......... .......... 67%  359K 1s
  1000K .......... .......... .......... .......... .......... 70% 28.8M 0s
  1050K .......... .......... .......... .......... .......... 74% 17.9M 0s
  1100K .......... .......... .......... .......... .......... 77% 18.2M 0s
  1150K .......... .......... .......... .......... .......... 80% 15.7M 0s
  1200K .......... .......... .......... .......... .......... 84% 9.80M 0s
  1250K .......... .......... .......... .......... .......... 87%  357K 0s
  1300K .......... .......... .......... .......... .......... 90% 18.4M 0s
  1350K .......... .......... .......... .......... .......... 94% 18.2M 0s
  1400K .......... .......... .......... .......... .......... 97% 24.3M 0s
  1450K .......... .......... .......... ....                 100% 21.8M=1.3s

2020-08-29 09:17:00 (1.16 MB/s) - ‘dvb-firmwares.tar.bz2’ saved [1519951/1519951]

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
No version yet, using 4.19.0-6-amd64
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Applying patches for kernel 4.19.0-6-amd64
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
patch -s -f -N -p1 -i ../backports/debug.patch
patch -s -f -N -p1 -i ../backports/drx39xxj.patch
patch -s -f -N -p1 -i ../backports/v5.9_tasklet.patch
2 out of 2 hunks FAILED
1 out of 1 hunk FAILED
1 out of 1 hunk FAILED
1 out of 1 hunk FAILED
4 out of 4 hunks FAILED
2 out of 2 hunks FAILED
6 out of 6 hunks FAILED
4 out of 4 hunks FAILED
2 out of 2 hunks FAILED
3 out of 3 hunks FAILED
2 out of 2 hunks FAILED
2 out of 2 hunks FAILED
3 out of 3 hunks FAILED
4 out of 4 hunks FAILED
2 out of 2 hunks FAILED
make[2]: *** [Makefile:132: apply_patches] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make[1]: *** [Makefile:378: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
