Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF54E56835D
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 11:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232078AbiGFJTj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Jul 2022 05:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbiGFJTi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 05:19:38 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9ED15727
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 02:19:35 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o91C1-00Gpqp-Cm; Wed, 06 Jul 2022 09:19:33 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o91Bz-00EWGv-Iz; Wed, 06 Jul 2022 09:19:31 +0000
Date:   Wed, 6 Jul 2022 09:19:30 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1782305645.0.1657099170862@builder.linuxtv.org>
In-Reply-To: <212546177.0.1657012753907@builder.linuxtv.org>
References: <212546177.0.1657012753907@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3951
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

See <https://builder.linuxtv.org/job/media-build/3951/display/redirect>

Changes:


------------------------------------------
[...truncated 5.67 KB...]

2022-07-06 09:19:14 (110 MB/s) - ‘linux-media.tar.bz2.md5.tmp’ saved [105/105]

--2022-07-06 09:19:14--  http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Resolving linuxtv.org (linuxtv.org)... 130.149.80.248
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2 [following]
--2022-07-06 09:19:15--  https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7527172 (7.2M) [application/x-bzip2]
Saving to: ‘linux-media.tar.bz2’

     0K .......... .......... .......... .......... ..........  0% 72.7K 1m40s
    50K .......... .......... .......... .......... ..........  1% 96.9K 87s
   100K .......... .......... .......... .......... ..........  2% 96.8K 83s
   150K .......... .......... .......... .......... ..........  2%  145K 74s
   200K .......... .......... .......... .......... ..........  3%  145K 68s
   250K .......... .......... .......... .......... ..........  4%  145K 65s
   300K .......... .......... .......... .......... ..........  4%  196K 60s
   350K .......... .......... .......... .......... ..........  5%  167K 57s
   400K .......... .......... .......... .......... ..........  6%  164K 55s
   450K .......... .......... .......... .......... ..........  6%  237K 52s
   500K .......... .......... .......... .......... ..........  7%  290K 49s
   550K .......... .......... .......... .......... ..........  8%  287K 47s
   600K .......... .......... .......... .......... ..........  8%  288K 45s
   650K .......... .......... .......... .......... ..........  9%  298K 43s
   700K .......... .......... .......... .......... .......... 10%  375K 41s
   750K .......... .......... .......... .......... .......... 10%  597K 39s
   800K .......... .......... .......... .......... .......... 11%  379K 37s
   850K .......... .......... .......... .......... .......... 12%  299K 36s
   900K .......... .......... .......... .......... .......... 12%  377K 35s
   950K .......... .......... .......... .......... .......... 13% 1.18M 33s
  1000K .......... .......... .......... .......... .......... 14%  377K 32s
  1050K .......... .......... .......... .......... .......... 14% 1.21M 31s
  1100K .......... .......... .......... .......... .......... 15%  379K 30s
  1150K .......... .......... .......... .......... .......... 16% 1.23M 28s
  1200K .......... .......... .......... .......... .......... 17%  296K 28s
  1250K .......... .......... .......... .......... .......... 17% 14.9M 27s
  1300K .......... .......... .......... .......... .......... 18%  381K 26s
  1350K .......... .......... .......... .......... .......... 19% 1.23M 25s
  1400K .......... .......... .......... .......... .......... 19%  394K 24s
  1450K .......... .......... .......... .......... .......... 20% 1.08M 24s
  1500K .......... .......... .......... .......... .......... 21% 38.4M 23s
  1550K .......... .......... .......... .......... .......... 21%  382K 22s
  1600K .......... .......... .......... .......... .......... 22% 1.20M 22s
  1650K .......... .......... .......... .......... .......... 23%  400K 21s
  1700K .......... .......... .......... .......... .......... 23% 7.05M 20s
  1750K .......... .......... .......... .......... .......... 24% 1.21M 20s
  1800K .......... .......... .......... .......... .......... 25%  592K 19s
  1850K .......... .......... .......... .......... .......... 25% 1.04M 19s
  1900K .......... .......... .......... .......... .......... 26% 1.23M 18s
  1950K .......... .......... .......... .......... .......... 27% 1.14M 18s
  2000K .......... .......... .......... .......... .......... 27%  560K 17s
  2050K .......... .......... .......... .......... .......... 28% 1.24M 17s
  2100K .......... .......... .......... .......... .......... 29% 22.7M 16s
  2150K .......... .......... .......... .......... .......... 29%  402K 16s
  2200K .......... .......... .......... .......... .......... 30% 1.12M 16s
  2250K .......... .......... .......... .......... .......... 31% 21.1M 15s
  2300K .......... .......... .......... .......... .......... 31% 1.13M 15s
  2350K .......... .......... .......... .......... .......... 32%  567K 15s
  2400K .......... .......... .......... .......... .......... 33% 1.24M 14s
  2450K .......... .......... .......... .......... .......... 34% 25.1M 14s
  2500K .......... .......... .......... .......... .......... 34% 1.14M 13s
  2550K .......... .......... .......... .......... .......... 35%  569K 13s
  2600K .......... .......... .......... .......... .......... 36% 1.26M 13s
  2650K .......... .......... .......... .......... .......... 36% 22.7M 13s
  2700K .......... .......... .......... .......... .......... 37% 30.0M 12s
  2750K .......... .......... .......... .......... .......... 38%  402K 12s
  2800K .......... .......... .......... .......... .......... 38% 1.13M 12s
  2850K .......... .......... .......... .......... .......... 39% 23.5M 11s
  2900K .......... .......... .......... .......... .......... 40% 26.4M 11s
  2950K .......... .......... .......... .......... .......... 40%  403K 11s
  3000K .......... .......... .......... .......... .......... 41% 7.94M 11s
  3050K .......... .......... .......... .......... .......... 42% 1.28M 10s
  3100K .......... .......... .......... .......... .......... 42% 22.9M 10s
  3150K .......... .......... .......... .......... .......... 43% 25.4M 10s
  3200K .......... .......... .......... .......... .......... 44%  402K 10s
  3250K .......... .......... .......... .......... .......... 44% 8.70M 10s
  3300K .......... .......... .......... .......... .......... 45% 1.28M 9s
  3350K .......... .......... .......... .......... .......... 46% 23.2M 9s
  3400K .......... .......... .......... .......... .......... 46% 23.6M 9s
  3450K .......... .......... .......... .......... .......... 47%  405K 9s
  3500K .......... .......... .......... .......... .......... 48% 8.93M 8s
  3550K .......... .......... .......... .......... .......... 48% 1.27M 8s
  3600K .......... .......... .......... .......... .......... 49% 19.7M 8s
  3650K .......... .......... .......... .......... .......... 50% 28.2M 8s
  3700K .......... .......... .......... .......... .......... 51% 1.17M 8s
  3750K .......... .......... .......... .......... .......... 51%  597K 8s
  3800K .......... .......... .......... .......... .......... 52% 9.04M 7s
  3850K .......... .......... .......... .......... .......... 53% 1.30M 7s
  3900K .......... .......... .......... .......... .......... 53% 25.4M 7s
  3950K .......... .......... .......... .......... .......... 54% 26.9M 7s
  4000K .......... .......... .......... .......... .......... 55%  402K 7s
  4050K .......... .......... .......... .......... .......... 55% 10.5M 7s
  4100K .......... .......... .......... .......... .......... 56% 22.0M 6s
  4150K .......... .......... .......... .......... .......... 57% 1.30M 6s
  4200K .......... .......... .......... .......... .......... 57% 24.5M 6s
  4250K .......... .......... .......... .......... .......... 58% 26.8M 6s
  4300K .......... .......... .......... .......... .......... 59% 1.18M 6s
  4350K .......... .......... .......... .......... .......... 59%  600K 6s
  4400K .......... .......... .......... .......... .......... 60% 9.40M 5s
  4450K .......... .......... .......... .......... .......... 61% 1.29M 5s
  4500K .......... .......... .......... .......... .......... 61% 25.3M 5s
  4550K .......... .......... .......... .......... .......... 62% 25.7M 5s
  4600K .......... .......... .......... .......... .......... 63% 1.19M 5s
  4650K .......... .......... .......... .......... .......... 63%  601K 5s
  4700K .......... .......... .......... .......... .......... 64% 11.2M 5s
  4750K .......... .......... .......... .......... .......... 65% 22.6M 5s
  4800K .......... .......... .......... .......... .......... 65% 1.29M 4s
  4850K .......... .......... .......... .......... .......... 66% 25.2M 4s
  4900K .......... .......... .......... .......... .......... 67% 23.8M 4s
  4950K .......... .......... .......... .......... .......... 68% 1.21M 4s
  5000K .......... .......... .......... .......... .......... 68%  600K 4s
  5050K .......... .......... .......... .......... .......... 69% 11.8M 4s
  5100K .......... .......... .......... .......... .......... 70% 23.9M 4s
  5150K .......... .......... .......... .......... .......... 70% 1.30M 4s
  5200K .......... .......... .......... .......... .......... 71% 20.9M 4s
  5250K .......... .......... .......... .......... .......... 72% 26.8M 3s
  5300K .......... .......... .......... .......... .......... 72% 26.5M 3s
  5350K .......... .......... .......... .......... .......... 73%  620K 3s
  5400K .......... .......... .......... .......... .......... 74% 1.14M 3s
  5450K .......... .......... .......... .......... .......... 74% 11.5M 3s
  5500K .......... .......... .......... .......... .......... 75% 25.8M 3s
  5550K .......... .......... .......... .......... .......... 76% 1.31M 3s
  5600K .......... .......... .......... .......... .......... 76% 21.5M 3s
  5650K .......... .......... .......... .......... .......... 77% 25.4M 3s
  5700K .......... .......... .......... .......... .......... 78% 1.23M 3s
  5750K .......... .......... .......... .......... .......... 78%  599K 2s
  5800K .......... .......... .......... .......... .......... 79% 21.3M 2s
  5850K .......... .......... .......... .......... .......... 80% 13.7M 2s
  5900K .......... .......... .......... .......... .......... 80% 1.32M 2s
  5950K .......... .......... .......... .......... .......... 81% 25.1M 2s
  6000K .......... .......... .......... .......... .......... 82% 18.9M 2s
  6050K .......... .......... .......... .......... .......... 82% 27.8M 2s
  6100K .......... .......... .......... .......... .......... 83% 25.6M 2s
  6150K .......... .......... .......... .......... .......... 84%  631K 2s
  6200K .......... .......... .......... .......... .......... 85% 1.13M 2s
  6250K .......... .......... .......... .......... .......... 85% 14.1M 2s
  6300K .......... .......... .......... .......... .......... 86% 28.3M 1s
  6350K .......... .......... .......... .......... .......... 87% 1.32M 1s
  6400K .......... .......... .......... .......... .......... 87% 22.5M 1s
  6450K .......... .......... .......... .......... .......... 88% 23.5M 1s
  6500K .......... .......... .......... .......... .......... 89% 22.3M 1s
  6550K .......... .......... .......... .......... .......... 89% 1.28M 1s
  6600K .......... .......... .......... .......... .......... 90%  598K 1s
  6650K .......... .......... .......... .......... .......... 91% 21.8M 1s
  6700K .......... .......... .......... .......... .......... 91% 14.7M 1s
  6750K .......... .......... .......... .......... .......... 92% 33.8M 1s
  6800K .......... .......... .......... .......... .......... 93% 1.29M 1s
  6850K .......... .......... .......... .......... .......... 93% 37.7M 1s
  6900K .......... .......... .......... .......... .......... 94% 20.6M 1s
  6950K .......... .......... .......... .......... .......... 95% 25.2M 0s
  7000K .......... .......... .......... .......... .......... 95% 1.29M 0s
  7050K .......... .......... .......... .......... .......... 96%  607K 0s
  7100K .......... .......... .......... .......... .......... 97% 16.0M 0s
  7150K .......... .......... .......... .......... .......... 97% 12.2M 0s
  7200K .......... .......... .......... .......... .......... 98% 17.7M 0s
  7250K .......... .......... .......... .......... .......... 99% 1.36M 0s
  7300K .......... .......... .......... .......... .......... 99% 64.3M 0s
  7350K                                                       100% 1.40T=9.7s

2022-07-06 09:19:25 (760 KB/s) - ‘linux-media.tar.bz2’ saved [7527172/7527172]

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
