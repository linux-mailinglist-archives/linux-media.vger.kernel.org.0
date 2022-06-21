Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0D93552E19
	for <lists+linux-media@lfdr.de>; Tue, 21 Jun 2022 11:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347172AbiFUJTn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 21 Jun 2022 05:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236786AbiFUJTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jun 2022 05:19:42 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0CC1AD95
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 02:19:40 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o3a2s-00D3Go-Sh; Tue, 21 Jun 2022 09:19:39 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o3a2q-00FCMB-PX; Tue, 21 Jun 2022 09:19:36 +0000
Date:   Tue, 21 Jun 2022 09:19:35 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <29174447.0.1655803176082@builder.linuxtv.org>
In-Reply-To: <1515961026.0.1655716823737@builder.linuxtv.org>
References: <1515961026.0.1655716823737@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3936
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

See <https://builder.linuxtv.org/job/media-build/3936/display/redirect>

Changes:


------------------------------------------
[...truncated 5.67 KB...]

2022-06-21 09:19:23 (131 MB/s) - ‘linux-media.tar.bz2.md5.tmp’ saved [105/105]

--2022-06-21 09:19:23--  http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Resolving linuxtv.org (linuxtv.org)... 130.149.80.248
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2 [following]
--2022-06-21 09:19:23--  https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7527087 (7.2M) [application/x-bzip2]
Saving to: ‘linux-media.tar.bz2’

     0K .......... .......... .......... .......... ..........  0%  145K 50s
    50K .......... .......... .......... .......... ..........  1%  291K 37s
   100K .......... .......... .......... .......... ..........  2% 26.1M 25s
   150K .......... .......... .......... .......... ..........  2%  294K 25s
   200K .......... .......... .......... .......... ..........  3% 24.2M 20s
   250K .......... .......... .......... .......... ..........  4%  294K 20s
   300K .......... .......... .......... .......... ..........  4% 23.4M 17s
   350K .......... .......... .......... .......... ..........  5%  295K 18s
   400K .......... .......... .......... .......... ..........  6% 18.9M 16s
   450K .......... .......... .......... .......... ..........  6%  295K 16s
   500K .......... .......... .......... .......... ..........  7% 24.0M 15s
   550K .......... .......... .......... .......... ..........  8%  295K 15s
   600K .......... .......... .......... .......... ..........  8% 27.2M 14s
   650K .......... .......... .......... .......... ..........  9% 26.7M 13s
   700K .......... .......... .......... .......... .......... 10%  295K 14s
   750K .......... .......... .......... .......... .......... 10% 23.7M 13s
   800K .......... .......... .......... .......... .......... 11%  295K 13s
   850K .......... .......... .......... .......... .......... 12% 26.3M 12s
   900K .......... .......... .......... .......... .......... 12% 21.7M 12s
   950K .......... .......... .......... .......... .......... 13%  297K 12s
  1000K .......... .......... .......... .......... .......... 14% 25.0M 11s
  1050K .......... .......... .......... .......... .......... 14% 1.14M 11s
  1100K .......... .......... .......... .......... .......... 15%  391K 11s
  1150K .......... .......... .......... .......... .......... 16% 21.2M 11s
  1200K .......... .......... .......... .......... .......... 17%  296K 11s
  1250K .......... .......... .......... .......... .......... 17% 30.8M 10s
  1300K .......... .......... .......... .......... .......... 18% 22.7M 10s
  1350K .......... .......... .......... .......... .......... 19%  298K 10s
  1400K .......... .......... .......... .......... .......... 19% 22.4M 10s
  1450K .......... .......... .......... .......... .......... 20% 29.0M 9s
  1500K .......... .......... .......... .......... .......... 21% 1.19M 9s
  1550K .......... .......... .......... .......... .......... 21%  390K 9s
  1600K .......... .......... .......... .......... .......... 22% 19.3M 9s
  1650K .......... .......... .......... .......... .......... 23% 25.0M 9s
  1700K .......... .......... .......... .......... .......... 23%  299K 9s
  1750K .......... .......... .......... .......... .......... 24% 22.6M 8s
  1800K .......... .......... .......... .......... .......... 25% 17.3M 8s
  1850K .......... .......... .......... .......... .......... 25%  300K 8s
  1900K .......... .......... .......... .......... .......... 26% 32.2M 8s
  1950K .......... .......... .......... .......... .......... 27% 24.2M 8s
  2000K .......... .......... .......... .......... .......... 27% 16.0M 8s
  2050K .......... .......... .......... .......... .......... 28%  301K 8s
  2100K .......... .......... .......... .......... .......... 29% 25.0M 7s
  2150K .......... .......... .......... .......... .......... 29% 25.7M 7s
  2200K .......... .......... .......... .......... .......... 30% 1.22M 7s
  2250K .......... .......... .......... .......... .......... 31%  388K 7s
  2300K .......... .......... .......... .......... .......... 31% 24.5M 7s
  2350K .......... .......... .......... .......... .......... 32% 27.4M 7s
  2400K .......... .......... .......... .......... .......... 33% 1.24M 7s
  2450K .......... .......... .......... .......... .......... 34%  387K 7s
  2500K .......... .......... .......... .......... .......... 34% 23.1M 6s
  2550K .......... .......... .......... .......... .......... 35% 32.8M 6s
  2600K .......... .......... .......... .......... .......... 36% 25.1M 6s
  2650K .......... .......... .......... .......... .......... 36%  302K 6s
  2700K .......... .......... .......... .......... .......... 37% 17.1M 6s
  2750K .......... .......... .......... .......... .......... 38% 26.6M 6s
  2800K .......... .......... .......... .......... .......... 38% 20.1M 6s
  2850K .......... .......... .......... .......... .......... 39%  304K 6s
  2900K .......... .......... .......... .......... .......... 40% 23.5M 6s
  2950K .......... .......... .......... .......... .......... 40% 12.4M 5s
  3000K .......... .......... .......... .......... .......... 41% 28.6M 5s
  3050K .......... .......... .......... .......... .......... 42% 27.5M 5s
  3100K .......... .......... .......... .......... .......... 42%  307K 5s
  3150K .......... .......... .......... .......... .......... 43% 15.6M 5s
  3200K .......... .......... .......... .......... .......... 44% 13.9M 5s
  3250K .......... .......... .......... .......... .......... 44% 24.5M 5s
  3300K .......... .......... .......... .......... .......... 45% 1.40M 5s
  3350K .......... .......... .......... .......... .......... 46%  388K 5s
  3400K .......... .......... .......... .......... .......... 46% 15.9M 5s
  3450K .......... .......... .......... .......... .......... 47% 18.0M 5s
  3500K .......... .......... .......... .......... .......... 48% 22.1M 4s
  3550K .......... .......... .......... .......... .......... 48% 25.2M 4s
  3600K .......... .......... .......... .......... .......... 49%  308K 4s
  3650K .......... .......... .......... .......... .......... 50% 18.9M 4s
  3700K .......... .......... .......... .......... .......... 51% 19.9M 4s
  3750K .......... .......... .......... .......... .......... 51% 19.6M 4s
  3800K .......... .......... .......... .......... .......... 52% 22.7M 4s
  3850K .......... .......... .......... .......... .......... 53%  310K 4s
  3900K .......... .......... .......... .......... .......... 53% 26.3M 4s
  3950K .......... .......... .......... .......... .......... 54% 19.7M 4s
  4000K .......... .......... .......... .......... .......... 55% 15.0M 4s
  4050K .......... .......... .......... .......... .......... 55% 23.6M 4s
  4100K .......... .......... .......... .......... .......... 56% 1.45M 3s
  4150K .......... .......... .......... .......... .......... 57%  384K 3s
  4200K .......... .......... .......... .......... .......... 57% 26.8M 3s
  4250K .......... .......... .......... .......... .......... 58% 24.7M 3s
  4300K .......... .......... .......... .......... .......... 59% 21.6M 3s
  4350K .......... .......... .......... .......... .......... 59% 23.5M 3s
  4400K .......... .......... .......... .......... .......... 60%  623K 3s
  4450K .......... .......... .......... .......... .......... 61%  595K 3s
  4500K .......... .......... .......... .......... .......... 61% 27.1M 3s
  4550K .......... .......... .......... .......... .......... 62% 25.4M 3s
  4600K .......... .......... .......... .......... .......... 63% 25.9M 3s
  4650K .......... .......... .......... .......... .......... 63% 22.9M 3s
  4700K .......... .......... .......... .......... .......... 64% 25.3M 3s
  4750K .......... .......... .......... .......... .......... 65%  310K 3s
  4800K .......... .......... .......... .......... .......... 65% 17.6M 3s
  4850K .......... .......... .......... .......... .......... 66% 27.3M 2s
  4900K .......... .......... .......... .......... .......... 67% 26.1M 2s
  4950K .......... .......... .......... .......... .......... 68% 27.1M 2s
  5000K .......... .......... .......... .......... .......... 68% 24.0M 2s
  5050K .......... .......... .......... .......... .......... 69%  310K 2s
  5100K .......... .......... .......... .......... .......... 70% 20.2M 2s
  5150K .......... .......... .......... .......... .......... 70% 26.6M 2s
  5200K .......... .......... .......... .......... .......... 71% 20.2M 2s
  5250K .......... .......... .......... .......... .......... 72% 25.0M 2s
  5300K .......... .......... .......... .......... .......... 72% 25.3M 2s
  5350K .......... .......... .......... .......... .......... 73% 21.8M 2s
  5400K .......... .......... .......... .......... .......... 74%  313K 2s
  5450K .......... .......... .......... .......... .......... 74% 20.5M 2s
  5500K .......... .......... .......... .......... .......... 75% 25.0M 2s
  5550K .......... .......... .......... .......... .......... 76% 25.8M 2s
  5600K .......... .......... .......... .......... .......... 76% 20.4M 2s
  5650K .......... .......... .......... .......... .......... 77% 24.0M 2s
  5700K .......... .......... .......... .......... .......... 78% 25.2M 1s
  5750K .......... .......... .......... .......... .......... 78%  314K 1s
  5800K .......... .......... .......... .......... .......... 79% 21.0M 1s
  5850K .......... .......... .......... .......... .......... 80% 21.6M 1s
  5900K .......... .......... .......... .......... .......... 80% 30.1M 1s
  5950K .......... .......... .......... .......... .......... 81% 24.6M 1s
  6000K .......... .......... .......... .......... .......... 82% 20.2M 1s
  6050K .......... .......... .......... .......... .......... 82% 24.0M 1s
  6100K .......... .......... .......... .......... .......... 83%  422K 1s
  6150K .......... .......... .......... .......... .......... 84% 1.16M 1s
  6200K .......... .......... .......... .......... .......... 85% 21.5M 1s
  6250K .......... .......... .......... .......... .......... 85% 26.7M 1s
  6300K .......... .......... .......... .......... .......... 86% 24.7M 1s
  6350K .......... .......... .......... .......... .......... 87% 29.3M 1s
  6400K .......... .......... .......... .......... .......... 87% 18.2M 1s
  6450K .......... .......... .......... .......... .......... 88% 26.8M 1s
  6500K .......... .......... .......... .......... .......... 89%  316K 1s
  6550K .......... .......... .......... .......... .......... 89% 24.8M 1s
  6600K .......... .......... .......... .......... .......... 90% 19.8M 1s
  6650K .......... .......... .......... .......... .......... 91% 19.8M 1s
  6700K .......... .......... .......... .......... .......... 91% 32.5M 1s
  6750K .......... .......... .......... .......... .......... 92% 24.8M 0s
  6800K .......... .......... .......... .......... .......... 93% 20.2M 0s
  6850K .......... .......... .......... .......... .......... 93% 28.3M 0s
  6900K .......... .......... .......... .......... .......... 94%  668K 0s
  6950K .......... .......... .......... .......... .......... 95%  592K 0s
  7000K .......... .......... .......... .......... .......... 95% 22.9M 0s
  7050K .......... .......... .......... .......... .......... 96% 25.0M 0s
  7100K .......... .......... .......... .......... .......... 97% 25.9M 0s
  7150K .......... .......... .......... .......... .......... 97% 24.4M 0s
  7200K .......... .......... .......... .......... .......... 98% 19.8M 0s
  7250K .......... .......... .......... .......... .......... 99% 25.7M 0s
  7300K .......... .......... .......... .......... .......... 99% 29.7M 0s
  7350K                                                       100% 1.25T=6.0s

2022-06-21 09:19:30 (1.19 MB/s) - ‘linux-media.tar.bz2’ saved [7527087/7527087]

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
