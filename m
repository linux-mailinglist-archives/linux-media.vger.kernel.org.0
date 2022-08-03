Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0535558893D
	for <lists+linux-media@lfdr.de>; Wed,  3 Aug 2022 11:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235195AbiHCJTi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 3 Aug 2022 05:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234654AbiHCJTg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Aug 2022 05:19:36 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1E42654E
        for <linux-media@vger.kernel.org>; Wed,  3 Aug 2022 02:19:34 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oJAXM-001pY7-DQ; Wed, 03 Aug 2022 09:19:32 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oJAXK-00EtWI-Oa; Wed, 03 Aug 2022 09:19:30 +0000
Date:   Wed, 3 Aug 2022 09:19:29 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <394181139.0.1659518369844@builder.linuxtv.org>
In-Reply-To: <503008048.0.1659431955337@builder.linuxtv.org>
References: <503008048.0.1659431955337@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3979
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

See <https://builder.linuxtv.org/job/media-build/3979/display/redirect>

Changes:


------------------------------------------
[...truncated 5.67 KB...]

2022-08-03 09:19:14 (112 MB/s) - ‘linux-media.tar.bz2.md5.tmp’ saved [105/105]

--2022-08-03 09:19:14--  http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Resolving linuxtv.org (linuxtv.org)... 130.149.80.248
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2 [following]
--2022-08-03 09:19:14--  https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7537575 (7.2M) [application/x-bzip2]
Saving to: ‘linux-media.tar.bz2’

     0K .......... .......... .......... .......... ..........  0% 75.5K 97s
    50K .......... .......... .......... .......... ..........  1%  101K 84s
   100K .......... .......... .......... .......... ..........  2%  101K 80s
   150K .......... .......... .......... .......... ..........  2%  135K 73s
   200K .......... .......... .......... .......... ..........  3%  151K 67s
   250K .......... .......... .......... .......... ..........  4%  151K 63s
   300K .......... .......... .......... .......... ..........  4%  299K 57s
   350K .......... .......... .......... .......... ..........  5%  151K 55s
   400K .......... .......... .......... .......... ..........  6%  151K 54s
   450K .......... .......... .......... .......... ..........  6%  300K 51s
   500K .......... .......... .......... .......... ..........  7%  301K 48s
   550K .......... .......... .......... .......... ..........  8%  301K 45s
   600K .......... .......... .......... .......... ..........  8%  301K 43s
   650K .......... .......... .......... .......... ..........  9%  302K 41s
   700K .......... .......... .......... .......... .......... 10%  302K 40s
   750K .......... .......... .......... .......... .......... 10%  303K 38s
   800K .......... .......... .......... .......... .......... 11%  302K 37s
   850K .......... .......... .......... .......... .......... 12% 1.20M 35s
   900K .......... .......... .......... .......... .......... 12%  396K 34s
   950K .......... .......... .......... .......... .......... 13%  305K 33s
  1000K .......... .......... .......... .......... .......... 14% 18.7M 31s
  1050K .......... .......... .......... .......... .......... 14%  303K 30s
  1100K .......... .......... .......... .......... .......... 15% 31.9M 29s
  1150K .......... .......... .......... .......... .......... 16%  304K 28s
  1200K .......... .......... .......... .......... .......... 16% 1.25M 27s
  1250K .......... .......... .......... .......... .......... 17%  394K 26s
  1300K .......... .......... .......... .......... .......... 18% 1.27M 25s
  1350K .......... .......... .......... .......... .......... 19%  394K 25s
  1400K .......... .......... .......... .......... .......... 19% 18.4M 24s
  1450K .......... .......... .......... .......... .......... 20%  309K 23s
  1500K .......... .......... .......... .......... .......... 21% 18.5M 23s
  1550K .......... .......... .......... .......... .......... 21% 1.30M 22s
  1600K .......... .......... .......... .......... .......... 22%  392K 21s
  1650K .......... .......... .......... .......... .......... 23% 22.2M 21s
  1700K .......... .......... .......... .......... .......... 23%  406K 20s
  1750K .......... .......... .......... .......... .......... 24% 1.20M 20s
  1800K .......... .......... .......... .......... .......... 25% 20.8M 19s
  1850K .......... .......... .......... .......... .......... 25%  408K 19s
  1900K .......... .......... .......... .......... .......... 26% 1.21M 18s
  1950K .......... .......... .......... .......... .......... 27% 22.1M 17s
  2000K .......... .......... .......... .......... .......... 27%  406K 17s
  2050K .......... .......... .......... .......... .......... 28% 1.20M 17s
  2100K .......... .......... .......... .......... .......... 29% 20.6M 16s
  2150K .......... .......... .......... .......... .......... 29%  642K 16s
  2200K .......... .......... .......... .......... .......... 30%  589K 16s
  2250K .......... .......... .......... .......... .......... 31% 20.6M 15s
  2300K .......... .......... .......... .......... .......... 31% 25.9M 15s
  2350K .......... .......... .......... .......... .......... 32%  647K 14s
  2400K .......... .......... .......... .......... .......... 33%  582K 14s
  2450K .......... .......... .......... .......... .......... 33% 19.8M 14s
  2500K .......... .......... .......... .......... .......... 34% 1.40M 13s
  2550K .......... .......... .......... .......... .......... 35%  398K 13s
  2600K .......... .......... .......... .......... .......... 36% 18.6M 13s
  2650K .......... .......... .......... .......... .......... 36% 20.8M 12s
  2700K .......... .......... .......... .......... .......... 37% 22.5M 12s
  2750K .......... .......... .......... .......... .......... 38%  419K 12s
  2800K .......... .......... .......... .......... .......... 38% 1.17M 12s
  2850K .......... .......... .......... .......... .......... 39% 21.6M 11s
  2900K .......... .......... .......... .......... .......... 40% 24.8M 11s
  2950K .......... .......... .......... .......... .......... 40%  662K 11s
  3000K .......... .......... .......... .......... .......... 41%  592K 11s
  3050K .......... .......... .......... .......... .......... 42% 19.7M 10s
  3100K .......... .......... .......... .......... .......... 42% 20.2M 10s
  3150K .......... .......... .......... .......... .......... 43% 24.9M 10s
  3200K .......... .......... .......... .......... .......... 44%  316K 10s
  3250K .......... .......... .......... .......... .......... 44% 16.2M 9s
  3300K .......... .......... .......... .......... .......... 45% 17.9M 9s
  3350K .......... .......... .......... .......... .......... 46% 17.1M 9s
  3400K .......... .......... .......... .......... .......... 46% 1.53M 9s
  3450K .......... .......... .......... .......... .......... 47%  581K 9s
  3500K .......... .......... .......... .......... .......... 48% 1.16M 8s
  3550K .......... .......... .......... .......... .......... 48% 20.8M 8s
  3600K .......... .......... .......... .......... .......... 49% 14.1M 8s
  3650K .......... .......... .......... .......... .......... 50% 1.55M 8s
  3700K .......... .......... .......... .......... .......... 50% 1.12M 8s
  3750K .......... .......... .......... .......... .......... 51%  594K 7s
  3800K .......... .......... .......... .......... .......... 52% 20.4M 7s
  3850K .......... .......... .......... .......... .......... 52% 22.4M 7s
  3900K .......... .......... .......... .......... .......... 53% 20.4M 7s
  3950K .......... .......... .......... .......... .......... 54% 1.54M 7s
  4000K .......... .......... .......... .......... .......... 55%  398K 7s
  4050K .......... .......... .......... .......... .......... 55% 17.8M 6s
  4100K .......... .......... .......... .......... .......... 56% 17.1M 6s
  4150K .......... .......... .......... .......... .......... 57% 18.3M 6s
  4200K .......... .......... .......... .......... .......... 57% 17.2M 6s
  4250K .......... .......... .......... .......... .......... 58%  705K 6s
  4300K .......... .......... .......... .......... .......... 59%  600K 6s
  4350K .......... .......... .......... .......... .......... 59% 19.0M 6s
  4400K .......... .......... .......... .......... .......... 60% 14.9M 5s
  4450K .......... .......... .......... .......... .......... 61% 18.4M 5s
  4500K .......... .......... .......... .......... .......... 61% 19.3M 5s
  4550K .......... .......... .......... .......... .......... 62% 1.66M 5s
  4600K .......... .......... .......... .......... .......... 63%  582K 5s
  4650K .......... .......... .......... .......... .......... 63% 1.18M 5s
  4700K .......... .......... .......... .......... .......... 64% 21.7M 5s
  4750K .......... .......... .......... .......... .......... 65% 20.7M 5s
  4800K .......... .......... .......... .......... .......... 65% 14.8M 4s
  4850K .......... .......... .......... .......... .......... 66% 23.3M 4s
  4900K .......... .......... .......... .......... .......... 67%  703K 4s
  4950K .......... .......... .......... .......... .......... 67%  605K 4s
  5000K .......... .......... .......... .......... .......... 68% 18.2M 4s
  5050K .......... .......... .......... .......... .......... 69% 24.8M 4s
  5100K .......... .......... .......... .......... .......... 69% 21.4M 4s
  5150K .......... .......... .......... .......... .......... 70% 22.7M 4s
  5200K .......... .......... .......... .......... .......... 71% 15.1M 3s
  5250K .......... .......... .......... .......... .......... 72%  700K 3s
  5300K .......... .......... .......... .......... .......... 72%  611K 3s
  5350K .......... .......... .......... .......... .......... 73% 22.0M 3s
  5400K .......... .......... .......... .......... .......... 74% 21.6M 3s
  5450K .......... .......... .......... .......... .......... 74% 20.6M 3s
  5500K .......... .......... .......... .......... .......... 75% 24.9M 3s
  5550K .......... .......... .......... .......... .......... 76% 20.5M 3s
  5600K .......... .......... .......... .......... .......... 76%  713K 3s
  5650K .......... .......... .......... .......... .......... 77% 1.08M 3s
  5700K .......... .......... .......... .......... .......... 78% 1.19M 3s
  5750K .......... .......... .......... .......... .......... 78% 18.5M 2s
  5800K .......... .......... .......... .......... .......... 79% 13.5M 2s
  5850K .......... .......... .......... .......... .......... 80% 23.8M 2s
  5900K .......... .......... .......... .......... .......... 80% 18.9M 2s
  5950K .......... .......... .......... .......... .......... 81% 32.0M 2s
  6000K .......... .......... .......... .......... .......... 82%  723K 2s
  6050K .......... .......... .......... .......... .......... 82% 1.12M 2s
  6100K .......... .......... .......... .......... .......... 83% 1.18M 2s
  6150K .......... .......... .......... .......... .......... 84% 24.9M 2s
  6200K .......... .......... .......... .......... .......... 84% 16.4M 2s
  6250K .......... .......... .......... .......... .......... 85% 20.1M 2s
  6300K .......... .......... .......... .......... .......... 86% 19.3M 1s
  6350K .......... .......... .......... .......... .......... 86% 25.2M 1s
  6400K .......... .......... .......... .......... .......... 87% 1.83M 1s
  6450K .......... .......... .......... .......... .......... 88% 1.11M 1s
  6500K .......... .......... .......... .......... .......... 88%  610K 1s
  6550K .......... .......... .......... .......... .......... 89% 17.7M 1s
  6600K .......... .......... .......... .......... .......... 90% 16.3M 1s
  6650K .......... .......... .......... .......... .......... 91% 17.5M 1s
  6700K .......... .......... .......... .......... .......... 91% 19.5M 1s
  6750K .......... .......... .......... .......... .......... 92% 19.0M 1s
  6800K .......... .......... .......... .......... .......... 93% 14.3M 1s
  6850K .......... .......... .......... .......... .......... 93%  771K 1s
  6900K .......... .......... .......... .......... .......... 94% 1.13M 1s
  6950K .......... .......... .......... .......... .......... 95% 1.18M 0s
  7000K .......... .......... .......... .......... .......... 95% 21.5M 0s
  7050K .......... .......... .......... .......... .......... 96% 20.3M 0s
  7100K .......... .......... .......... .......... .......... 97% 20.7M 0s
  7150K .......... .......... .......... .......... .......... 97% 17.9M 0s
  7200K .......... .......... .......... .......... .......... 98% 15.1M 0s
  7250K .......... .......... .......... .......... .......... 99% 18.0M 0s
  7300K .......... .......... .......... .......... .......... 99% 2.13M 0s
  7350K ..........                                            100% 24.2M=9.5s

2022-08-03 09:19:24 (772 KB/s) - ‘linux-media.tar.bz2’ saved [7537575/7537575]

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
