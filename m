Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4845576CC0
	for <lists+linux-media@lfdr.de>; Sat, 16 Jul 2022 11:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbiGPJTg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 16 Jul 2022 05:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiGPJTf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jul 2022 05:19:35 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0C3EE28
        for <linux-media@vger.kernel.org>; Sat, 16 Jul 2022 02:19:33 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oCdxT-00D9do-8P; Sat, 16 Jul 2022 09:19:31 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oCdxR-000Zp5-Dz; Sat, 16 Jul 2022 09:19:28 +0000
Date:   Sat, 16 Jul 2022 09:19:28 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1440674595.0.1657963168764@builder.linuxtv.org>
In-Reply-To: <1438375724.0.1657876757338@builder.linuxtv.org>
References: <1438375724.0.1657876757338@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3961
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/3961/display/redirect>

Changes:


------------------------------------------
[...truncated 5.67 KB...]

2022-07-16 09:19:13 (68.3 MB/s) - ‘linux-media.tar.bz2.md5.tmp’ saved [105/105]

--2022-07-16 09:19:13--  http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Resolving linuxtv.org (linuxtv.org)... 130.149.80.248
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2 [following]
--2022-07-16 09:19:14--  https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7539499 (7.2M) [application/x-bzip2]
Saving to: ‘linux-media.tar.bz2’

     0K .......... .......... .......... .......... ..........  0% 96.6K 76s
    50K .......... .......... .......... .......... ..........  1% 96.8K 75s
   100K .......... .......... .......... .......... ..........  2%  145K 66s
   150K .......... .......... .......... .......... ..........  2%  145K 62s
   200K .......... .......... .......... .......... ..........  3%  147K 59s
   250K .......... .......... .......... .......... ..........  4%  283K 53s
   300K .......... .......... .......... .......... ..........  4%  146K 52s
   350K .......... .......... .......... .......... ..........  5%  290K 48s
   400K .......... .......... .......... .......... ..........  6%  145K 48s
   450K .......... .......... .......... .......... ..........  6%  289K 45s
   500K .......... .......... .......... .......... ..........  7%  290K 43s
   550K .......... .......... .......... .......... ..........  8%  289K 41s
   600K .......... .......... .......... .......... ..........  8%  290K 39s
   650K .......... .......... .......... .......... ..........  9%  290K 38s
   700K .......... .......... .......... .......... .......... 10%  292K 36s
   750K .......... .......... .......... .......... .......... 10%  291K 35s
   800K .......... .......... .......... .......... .......... 11%  291K 34s
   850K .......... .......... .......... .......... .......... 12%  291K 33s
   900K .......... .......... .......... .......... .......... 12%  301K 33s
   950K .......... .......... .......... .......... .......... 13% 5.97M 31s
  1000K .......... .......... .......... .......... .......... 14%  293K 30s
  1050K .......... .......... .......... .......... .......... 14% 9.86M 28s
  1100K .......... .......... .......... .......... .......... 15%  298K 28s
  1150K .......... .......... .......... .......... .......... 16% 1.06M 27s
  1200K .......... .......... .......... .......... .......... 16%  388K 26s
  1250K .......... .......... .......... .......... .......... 17%  297K 26s
  1300K .......... .......... .......... .......... .......... 18% 12.7M 25s
  1350K .......... .......... .......... .......... .......... 19%  298K 24s
  1400K .......... .......... .......... .......... .......... 19% 18.8M 23s
  1450K .......... .......... .......... .......... .......... 20% 1.07M 22s
  1500K .......... .......... .......... .......... .......... 21%  398K 22s
  1550K .......... .......... .......... .......... .......... 21% 11.1M 21s
  1600K .......... .......... .......... .......... .......... 22%  298K 21s
  1650K .......... .......... .......... .......... .......... 23% 8.46M 20s
  1700K .......... .......... .......... .......... .......... 23%  313K 20s
  1750K .......... .......... .......... .......... .......... 24% 6.83M 19s
  1800K .......... .......... .......... .......... .......... 25% 7.76M 18s
  1850K .......... .......... .......... .......... .......... 25%  306K 18s
  1900K .......... .......... .......... .......... .......... 26% 18.0M 18s
  1950K .......... .......... .......... .......... .......... 27% 5.26M 17s
  2000K .......... .......... .......... .......... .......... 27%  305K 17s
  2050K .......... .......... .......... .......... .......... 28% 70.0M 16s
  2100K .......... .......... .......... .......... .......... 29% 3.89M 16s
  2150K .......... .......... .......... .......... .......... 29% 1.55M 15s
  2200K .......... .......... .......... .......... .......... 30%  385K 15s
  2250K .......... .......... .......... .......... .......... 31% 6.40M 15s
  2300K .......... .......... .......... .......... .......... 31% 8.21M 14s
  2350K .......... .......... .......... .......... .......... 32%  317K 14s
  2400K .......... .......... .......... .......... .......... 33% 10.9M 14s
  2450K .......... .......... .......... .......... .......... 33% 5.83M 13s
  2500K .......... .......... .......... .......... .......... 34% 1.66M 13s
  2550K .......... .......... .......... .......... .......... 35%  366K 13s
  2600K .......... .......... .......... .......... .......... 35%  142M 13s
  2650K .......... .......... .......... .......... .......... 36% 8.72M 12s
  2700K .......... .......... .......... .......... .......... 37% 18.7M 12s
  2750K .......... .......... .......... .......... .......... 38%  310K 12s
  2800K .......... .......... .......... .......... .......... 38% 13.5M 11s
  2850K .......... .......... .......... .......... .......... 39% 11.5M 11s
  2900K .......... .......... .......... .......... .......... 40% 15.0M 11s
  2950K .......... .......... .......... .......... .......... 40%  311K 11s
  3000K .......... .......... .......... .......... .......... 41% 16.4M 10s
  3050K .......... .......... .......... .......... .......... 42% 24.8M 10s
  3100K .......... .......... .......... .......... .......... 42% 7.98M 10s
  3150K .......... .......... .......... .......... .......... 43% 1.79M 10s
  3200K .......... .......... .......... .......... .......... 44%  371K 10s
  3250K .......... .......... .......... .......... .......... 44% 16.9M 9s
  3300K .......... .......... .......... .......... .......... 45% 11.0M 9s
  3350K .......... .......... .......... .......... .......... 46% 14.9M 9s
  3400K .......... .......... .......... .......... .......... 46%  717K 9s
  3450K .......... .......... .......... .......... .......... 47%  543K 9s
  3500K .......... .......... .......... .......... .......... 48% 22.7M 8s
  3550K .......... .......... .......... .......... .......... 48% 8.55M 8s
  3600K .......... .......... .......... .......... .......... 49% 15.6M 8s
  3650K .......... .......... .......... .......... .......... 50%  683K 8s
  3700K .......... .......... .......... .......... .......... 50%  572K 8s
  3750K .......... .......... .......... .......... .......... 51% 20.5M 7s
  3800K .......... .......... .......... .......... .......... 52% 9.67M 7s
  3850K .......... .......... .......... .......... .......... 52% 9.79M 7s
  3900K .......... .......... .......... .......... .......... 53% 88.4M 7s
  3950K .......... .......... .......... .......... .......... 54%  316K 7s
  4000K .......... .......... .......... .......... .......... 55% 23.3M 7s
  4050K .......... .......... .......... .......... .......... 55% 19.7M 6s
  4100K .......... .......... .......... .......... .......... 56% 5.72M 6s
  4150K .......... .......... .......... .......... .......... 57% 29.3M 6s
  4200K .......... .......... .......... .......... .......... 57% 24.1M 6s
  4250K .......... .......... .......... .......... .......... 58%  322K 6s
  4300K .......... .......... .......... .......... .......... 59% 23.8M 6s
  4350K .......... .......... .......... .......... .......... 59% 27.2M 6s
  4400K .......... .......... .......... .......... .......... 60% 5.03M 5s
  4450K .......... .......... .......... .......... .......... 61% 12.2M 5s
  4500K .......... .......... .......... .......... .......... 61%  126M 5s
  4550K .......... .......... .......... .......... .......... 62%  325K 5s
  4600K .......... .......... .......... .......... .......... 63% 21.6M 5s
  4650K .......... .......... .......... .......... .......... 63% 24.9M 5s
  4700K .......... .......... .......... .......... .......... 64% 11.0M 5s
  4750K .......... .......... .......... .......... .......... 65% 7.18M 5s
  4800K .......... .......... .......... .......... .......... 65% 7.36M 4s
  4850K .......... .......... .......... .......... .......... 66% 2.96M 4s
  4900K .......... .......... .......... .......... .......... 67%  372K 4s
  4950K .......... .......... .......... .......... .......... 67% 29.1M 4s
  5000K .......... .......... .......... .......... .......... 68% 18.1M 4s
  5050K .......... .......... .......... .......... .......... 69% 9.31M 4s
  5100K .......... .......... .......... .......... .......... 69% 9.25M 4s
  5150K .......... .......... .......... .......... .......... 70% 7.70M 4s
  5200K .......... .......... .......... .......... .......... 71% 2.99M 3s
  5250K .......... .......... .......... .......... .......... 71%  372K 3s
  5300K .......... .......... .......... .......... .......... 72% 24.2M 3s
  5350K .......... .......... .......... .......... .......... 73% 17.3M 3s
  5400K .......... .......... .......... .......... .......... 74% 19.7M 3s
  5450K .......... .......... .......... .......... .......... 74% 6.47M 3s
  5500K .......... .......... .......... .......... .......... 75% 9.27M 3s
  5550K .......... .......... .......... .......... .......... 76% 6.81M 3s
  5600K .......... .......... .......... .......... .......... 76%  348K 3s
  5650K .......... .......... .......... .......... .......... 77% 19.1M 3s
  5700K .......... .......... .......... .......... .......... 78% 23.2M 3s
  5750K .......... .......... .......... .......... .......... 78% 27.2M 2s
  5800K .......... .......... .......... .......... .......... 79% 10.7M 2s
  5850K .......... .......... .......... .......... .......... 80% 6.85M 2s
  5900K .......... .......... .......... .......... .......... 80% 12.0M 2s
  5950K .......... .......... .......... .......... .......... 81% 4.53M 2s
  6000K .......... .......... .......... .......... .......... 82%  359K 2s
  6050K .......... .......... .......... .......... .......... 82% 21.4M 2s
  6100K .......... .......... .......... .......... .......... 83% 22.4M 2s
  6150K .......... .......... .......... .......... .......... 84% 23.9M 2s
  6200K .......... .......... .......... .......... .......... 84% 10.7M 2s
  6250K .......... .......... .......... .......... .......... 85% 7.03M 2s
  6300K .......... .......... .......... .......... .......... 86% 14.2M 1s
  6350K .......... .......... .......... .......... .......... 86% 4.61M 1s
  6400K .......... .......... .......... .......... .......... 87%  358K 1s
  6450K .......... .......... .......... .......... .......... 88% 21.4M 1s
  6500K .......... .......... .......... .......... .......... 88% 33.5M 1s
  6550K .......... .......... .......... .......... .......... 89% 16.5M 1s
  6600K .......... .......... .......... .......... .......... 90% 25.1M 1s
  6650K .......... .......... .......... .......... .......... 90% 10.2M 1s
  6700K .......... .......... .......... .......... .......... 91% 9.06M 1s
  6750K .......... .......... .......... .......... .......... 92% 14.2M 1s
  6800K .......... .......... .......... .......... .......... 93% 3.15M 1s
  6850K .......... .......... .......... .......... .......... 93%  371K 1s
  6900K .......... .......... .......... .......... .......... 94% 22.6M 1s
  6950K .......... .......... .......... .......... .......... 95% 21.2M 0s
  7000K .......... .......... .......... .......... .......... 95% 21.5M 0s
  7050K .......... .......... .......... .......... .......... 96% 26.5M 0s
  7100K .......... .......... .......... .......... .......... 97% 12.3M 0s
  7150K .......... .......... .......... .......... .......... 97% 8.40M 0s
  7200K .......... .......... .......... .......... .......... 98% 5.76M 0s
  7250K .......... .......... .......... .......... .......... 99% 8.10M 0s
  7300K .......... .......... .......... .......... .......... 99%  936K 0s
  7350K .......... ..                                         100% 51.2M=9.6s

2022-07-16 09:19:24 (770 KB/s) - ‘linux-media.tar.bz2’ saved [7539499/7539499]

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
No version yet, using 5.10.0-14-amd64
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Applying patches for kernel 5.10.0-14-amd64
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
1 out of 1 hunk FAILED
1 out of 1 hunk FAILED
make[2]: *** [Makefile:132: apply_patches] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make[1]: *** [Makefile:366: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
