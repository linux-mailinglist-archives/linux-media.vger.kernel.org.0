Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1681C4DE736
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 10:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237838AbiCSJU6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 19 Mar 2022 05:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234179AbiCSJU6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Mar 2022 05:20:58 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9695F4CB
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 02:19:36 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nVVFF-00EGFY-M0; Sat, 19 Mar 2022 09:19:34 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nVVFE-004AaO-B5; Sat, 19 Mar 2022 09:19:31 +0000
Date:   Sat, 19 Mar 2022 09:19:31 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1168748992.0.1647681571759@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3837
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/3837/display/redirect>

Changes:


------------------------------------------
[...truncated 5.81 KB...]
--2022-03-19 09:19:18--  http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Resolving linuxtv.org (linuxtv.org)... 130.149.80.248
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2 [following]
--2022-03-19 09:19:18--  https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7499093 (7.2M) [application/x-bzip2]
Saving to: ‘linux-media.tar.bz2’

     0K .......... .......... .......... .......... ..........  0%  148K 49s
    50K .......... .......... .......... .......... ..........  1%  295K 37s
   100K .......... .......... .......... .......... ..........  2%  150K 40s
   150K .......... .......... .......... .......... ..........  2%  295K 36s
   200K .......... .......... .......... .......... ..........  3%  293K 33s
   250K .......... .......... .......... .......... ..........  4%  298K 32s
   300K .......... .......... .......... .......... ..........  4%  299K 30s
   350K .......... .......... .......... .......... ..........  5%  296K 29s
   400K .......... .......... .......... .......... ..........  6%  295K 28s
   450K .......... .......... .......... .......... ..........  6%  298K 28s
   500K .......... .......... .......... .......... ..........  7% 1.11M 25s
   550K .......... .......... .......... .......... ..........  8%  393K 25s
   600K .......... .......... .......... .......... ..........  8%  297K 24s
   650K .......... .......... .......... .......... ..........  9%  390K 24s
   700K .......... .......... .......... .......... .......... 10% 1.18M 22s
   750K .......... .......... .......... .......... .......... 10%  297K 22s
   800K .......... .......... .......... .......... .......... 11%  300K 22s
   850K .......... .......... .......... .......... .......... 12% 1.13M 21s
   900K .......... .......... .......... .......... .......... 12%  392K 20s
   950K .......... .......... .......... .......... .......... 13%  391K 20s
  1000K .......... .......... .......... .......... .......... 14% 1.18M 19s
  1050K .......... .......... .......... .......... .......... 15%  301K 19s
  1100K .......... .......... .......... .......... .......... 15% 16.4M 18s
  1150K .......... .......... .......... .......... .......... 16%  301K 18s
  1200K .......... .......... .......... .......... .......... 17% 1.14M 17s
  1250K .......... .......... .......... .......... .......... 17%  394K 17s
  1300K .......... .......... .......... .......... .......... 18% 1.17M 17s
  1350K .......... .......... .......... .......... .......... 19%  395K 16s
  1400K .......... .......... .......... .......... .......... 19% 1.17M 16s
  1450K .......... .......... .......... .......... .......... 20%  397K 16s
  1500K .......... .......... .......... .......... .......... 21% 1.15M 15s
  1550K .......... .......... .......... .......... .......... 21%  398K 15s
  1600K .......... .......... .......... .......... .......... 22% 1.14M 15s
  1650K .......... .......... .......... .......... .......... 23%  399K 14s
  1700K .......... .......... .......... .......... .......... 23% 20.6M 14s
  1750K .......... .......... .......... .......... .......... 24% 1.18M 14s
  1800K .......... .......... .......... .......... .......... 25%  398K 13s
  1850K .......... .......... .......... .......... .......... 25% 1.16M 13s
  1900K .......... .......... .......... .......... .......... 26%  398K 13s
  1950K .......... .......... .......... .......... .......... 27% 32.9M 13s
  2000K .......... .......... .......... .......... .......... 27% 1.15M 12s
  2050K .......... .......... .......... .......... .......... 28%  399K 12s
  2100K .......... .......... .......... .......... .......... 29% 31.4M 12s
  2150K .......... .......... .......... .......... .......... 30%  601K 12s
  2200K .......... .......... .......... .......... .......... 30%  593K 11s
  2250K .......... .......... .......... .......... .......... 31% 28.8M 11s
  2300K .......... .......... .......... .......... .......... 32% 1.18M 11s
  2350K .......... .......... .......... .......... .......... 32%  398K 11s
  2400K .......... .......... .......... .......... .......... 33% 1.17M 10s
  2450K .......... .......... .......... .......... .......... 34%  572K 10s
  2500K .......... .......... .......... .......... .......... 34% 1.23M 10s
  2550K .......... .......... .......... .......... .......... 35% 26.3M 10s
  2600K .......... .......... .......... .......... .......... 36% 1.20M 10s
  2650K .......... .......... .......... .......... .......... 36%  398K 10s
  2700K .......... .......... .......... .......... .......... 37% 30.4M 9s
  2750K .......... .......... .......... .......... .......... 38% 1.20M 9s
  2800K .......... .......... .......... .......... .......... 38%  398K 9s
  2850K .......... .......... .......... .......... .......... 39% 31.0M 9s
  2900K .......... .......... .......... .......... .......... 40% 1.20M 9s
  2950K .......... .......... .......... .......... .......... 40%  584K 8s
  3000K .......... .......... .......... .......... .......... 41% 1.18M 8s
  3050K .......... .......... .......... .......... .......... 42% 29.7M 8s
  3100K .......... .......... .......... .......... .......... 43% 1.20M 8s
  3150K .......... .......... .......... .......... .......... 43%  575K 8s
  3200K .......... .......... .......... .......... .......... 44% 1.21M 8s
  3250K .......... .......... .......... .......... .......... 45% 30.1M 7s
  3300K .......... .......... .......... .......... .......... 45% 1.22M 7s
  3350K .......... .......... .......... .......... .......... 46%  399K 7s
  3400K .......... .......... .......... .......... .......... 47% 28.0M 7s
  3450K .......... .......... .......... .......... .......... 47% 31.5M 7s
  3500K .......... .......... .......... .......... .......... 48% 1.23M 7s
  3550K .......... .......... .......... .......... .......... 49%  397K 7s
  3600K .......... .......... .......... .......... .......... 49% 31.7M 6s
  3650K .......... .......... .......... .......... .......... 50% 32.8M 6s
  3700K .......... .......... .......... .......... .......... 51% 1.22M 6s
  3750K .......... .......... .......... .......... .......... 51%  574K 6s
  3800K .......... .......... .......... .......... .......... 52% 1.23M 6s
  3850K .......... .......... .......... .......... .......... 53% 30.3M 6s
  3900K .......... .......... .......... .......... .......... 53% 1.23M 6s
  3950K .......... .......... .......... .......... .......... 54% 42.6M 5s
  4000K .......... .......... .......... .......... .......... 55%  398K 5s
  4050K .......... .......... .......... .......... .......... 55% 30.4M 5s
  4100K .......... .......... .......... .......... .......... 56% 30.2M 5s
  4150K .......... .......... .......... .......... .......... 57% 1.24M 5s
  4200K .......... .......... .......... .......... .......... 58% 1.12M 5s
  4250K .......... .......... .......... .......... .......... 58%  601K 5s
  4300K .......... .......... .......... .......... .......... 59% 44.5M 5s
  4350K .......... .......... .......... .......... .......... 60% 36.0M 5s
  4400K .......... .......... .......... .......... .......... 60% 1.23M 4s
  4450K .......... .......... .......... .......... .......... 61%  575K 4s
  4500K .......... .......... .......... .......... .......... 62% 1.21M 4s
  4550K .......... .......... .......... .......... .......... 62% 30.5M 4s
  4600K .......... .......... .......... .......... .......... 63% 28.8M 4s
  4650K .......... .......... .......... .......... .......... 64% 1.30M 4s
  4700K .......... .......... .......... .......... .......... 64% 31.4M 4s
  4750K .......... .......... .......... .......... .......... 65%  398K 4s
  4800K .......... .......... .......... .......... .......... 66% 24.7M 4s
  4850K .......... .......... .......... .......... .......... 66% 31.7M 4s
  4900K .......... .......... .......... .......... .......... 67% 1.30M 3s
  4950K .......... .......... .......... .......... .......... 68% 33.6M 3s
  5000K .......... .......... .......... .......... .......... 68%  403K 3s
  5050K .......... .......... .......... .......... .......... 69% 16.2M 3s
  5100K .......... .......... .......... .......... .......... 70% 33.6M 3s
  5150K .......... .......... .......... .......... .......... 71% 28.6M 3s
  5200K .......... .......... .......... .......... .......... 71% 1.28M 3s
  5250K .......... .......... .......... .......... .......... 72% 38.7M 3s
  5300K .......... .......... .......... .......... .......... 73%  400K 3s
  5350K .......... .......... .......... .......... .......... 73% 34.3M 3s
  5400K .......... .......... .......... .......... .......... 74% 23.3M 3s
  5450K .......... .......... .......... .......... .......... 75% 35.7M 3s
  5500K .......... .......... .......... .......... .......... 75% 1.31M 2s
  5550K .......... .......... .......... .......... .......... 76% 28.3M 2s
  5600K .......... .......... .......... .......... .......... 77%  401K 2s
  5650K .......... .......... .......... .......... .......... 77% 28.4M 2s
  5700K .......... .......... .......... .......... .......... 78% 30.8M 2s
  5750K .......... .......... .......... .......... .......... 79% 27.4M 2s
  5800K .......... .......... .......... .......... .......... 79% 1.35M 2s
  5850K .......... .......... .......... .......... .......... 80% 22.2M 2s
  5900K .......... .......... .......... .......... .......... 81%  405K 2s
  5950K .......... .......... .......... .......... .......... 81% 20.3M 2s
  6000K .......... .......... .......... .......... .......... 82% 23.0M 2s
  6050K .......... .......... .......... .......... .......... 83% 31.0M 2s
  6100K .......... .......... .......... .......... .......... 83% 1.35M 2s
  6150K .......... .......... .......... .......... .......... 84% 25.2M 1s
  6200K .......... .......... .......... .......... .......... 85% 1.16M 1s
  6250K .......... .......... .......... .......... .......... 86%  600K 1s
  6300K .......... .......... .......... .......... .......... 86% 29.9M 1s
  6350K .......... .......... .......... .......... .......... 87% 30.5M 1s
  6400K .......... .......... .......... .......... .......... 88% 20.5M 1s
  6450K .......... .......... .......... .......... .......... 88% 1.37M 1s
  6500K .......... .......... .......... .......... .......... 89% 23.2M 1s
  6550K .......... .......... .......... .......... .......... 90%  596K 1s
  6600K .......... .......... .......... .......... .......... 90% 1.17M 1s
  6650K .......... .......... .......... .......... .......... 91% 29.9M 1s
  6700K .......... .......... .......... .......... .......... 92% 29.2M 1s
  6750K .......... .......... .......... .......... .......... 92% 30.3M 1s
  6800K .......... .......... .......... .......... .......... 93% 1.36M 1s
  6850K .......... .......... .......... .......... .......... 94% 28.7M 1s
  6900K .......... .......... .......... .......... .......... 94% 1.16M 0s
  6950K .......... .......... .......... .......... .......... 95%  600K 0s
  7000K .......... .......... .......... .......... .......... 96% 29.3M 0s
  7050K .......... .......... .......... .......... .......... 96% 32.4M 0s
  7100K .......... .......... .......... .......... .......... 97% 35.1M 0s
  7150K .......... .......... .......... .......... .......... 98% 27.7M 0s
  7200K .......... .......... .......... .......... .......... 98% 1.36M 0s
  7250K .......... .......... .......... .......... .......... 99% 33.8M 0s
  7300K .......... .......... ...                             100% 54.5M=8.5s

2022-03-19 09:19:27 (864 KB/s) - ‘linux-media.tar.bz2’ saved [7499093/7499093]

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
No version yet, using 5.10.0-9-amd64
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Applying patches for kernel 5.10.0-9-amd64
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
1 out of 1 hunk FAILED
1 out of 1 hunk FAILED
1 out of 1 hunk FAILED
1 out of 1 hunk FAILED
1 out of 1 hunk FAILED
1 out of 1 hunk FAILED
make[2]: *** [Makefile:132: apply_patches] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make[1]: *** [Makefile:366: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
