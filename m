Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6270757DE75
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 11:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236572AbiGVJbA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 22 Jul 2022 05:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236579AbiGVJaF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 05:30:05 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B93A20F5F
        for <linux-media@vger.kernel.org>; Fri, 22 Jul 2022 02:19:34 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oEoom-003oq5-Hp; Fri, 22 Jul 2022 09:19:32 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oEook-00CoWv-Pe; Fri, 22 Jul 2022 09:19:30 +0000
Date:   Fri, 22 Jul 2022 09:19:30 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <982251498.0.1658481570128@builder.linuxtv.org>
In-Reply-To: <1433021147.0.1658395154452@builder.linuxtv.org>
References: <1433021147.0.1658395154452@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3967
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

See <https://builder.linuxtv.org/job/media-build/3967/display/redirect>

Changes:


------------------------------------------
[...truncated 5.67 KB...]

2022-07-22 09:19:14 (92.5 MB/s) - ‘linux-media.tar.bz2.md5.tmp’ saved [105/105]

--2022-07-22 09:19:14--  http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Resolving linuxtv.org (linuxtv.org)... 130.149.80.248
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2 [following]
--2022-07-22 09:19:14--  https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7537137 (7.2M) [application/x-bzip2]
Saving to: ‘linux-media.tar.bz2’

     0K .......... .......... .......... .......... ..........  0% 96.8K 76s
    50K .......... .......... .......... .......... ..........  1%  145K 62s
   100K .......... .......... .......... .......... ..........  2%  145K 58s
   150K .......... .......... .......... .......... ..........  2%  145K 55s
   200K .......... .......... .......... .......... ..........  3%  287K 49s
   250K .......... .......... .......... .......... ..........  4%  146K 49s
   300K .......... .......... .......... .......... ..........  4%  288K 45s
   350K .......... .......... .......... .......... ..........  5%  146K 45s
   400K .......... .......... .......... .......... ..........  6%  289K 42s
   450K .......... .......... .......... .......... ..........  6%  236K 41s
   500K .......... .......... .......... .......... ..........  7%  231K 39s
   550K .......... .......... .......... .......... ..........  8%  291K 38s
   600K .......... .......... .......... .......... ..........  8%  290K 36s
   650K .......... .......... .......... .......... ..........  9%  391K 35s
   700K .......... .......... .......... .......... .......... 10%  291K 34s
   750K .......... .......... .......... .......... .......... 10%  376K 32s
   800K .......... .......... .......... .......... .......... 11%  237K 32s
   850K .......... .......... .......... .......... .......... 12%  376K 31s
   900K .......... .......... .......... .......... .......... 12%  290K 30s
   950K .......... .......... .......... .......... .......... 13%  397K 29s
  1000K .......... .......... .......... .......... .......... 14% 1.03M 28s
  1050K .......... .......... .......... .......... .......... 14%  293K 27s
  1100K .......... .......... .......... .......... .......... 15%  603K 26s
  1150K .......... .......... .......... .......... .......... 16%  548K 26s
  1200K .......... .......... .......... .......... .......... 16%  295K 25s
  1250K .......... .......... .......... .......... .......... 17% 1.23M 24s
  1300K .......... .......... .......... .......... .......... 18%  377K 24s
  1350K .......... .......... .......... .......... .......... 19% 1.24M 23s
  1400K .......... .......... .......... .......... .......... 19%  376K 22s
  1450K .......... .......... .......... .......... .......... 20% 1.25M 22s
  1500K .......... .......... .......... .......... .......... 21%  378K 21s
  1550K .......... .......... .......... .......... .......... 21% 18.4M 20s
  1600K .......... .......... .......... .......... .......... 22%  296K 20s
  1650K .......... .......... .......... .......... .......... 23% 18.8M 19s
  1700K .......... .......... .......... .......... .......... 23%  615K 19s
  1750K .......... .......... .......... .......... .......... 24%  559K 19s
  1800K .......... .......... .......... .......... .......... 25% 20.9M 18s
  1850K .......... .......... .......... .......... .......... 25%  404K 18s
  1900K .......... .......... .......... .......... .......... 26% 1.05M 17s
  1950K .......... .......... .......... .......... .......... 27% 19.0M 17s
  2000K .......... .......... .......... .......... .......... 27%  298K 17s
  2050K .......... .......... .......... .......... .......... 28% 21.8M 16s
  2100K .......... .......... .......... .......... .......... 29% 1.30M 16s
  2150K .......... .......... .......... .......... .......... 29%  379K 15s
  2200K .......... .......... .......... .......... .......... 30% 22.8M 15s
  2250K .......... .......... .......... .......... .......... 31% 15.4M 14s
  2300K .......... .......... .......... .......... .......... 31%  627K 14s
  2350K .......... .......... .......... .......... .......... 32%  565K 14s
  2400K .......... .......... .......... .......... .......... 33% 15.6M 13s
  2450K .......... .......... .......... .......... .......... 33% 1.34M 13s
  2500K .......... .......... .......... .......... .......... 34%  378K 13s
  2550K .......... .......... .......... .......... .......... 35% 22.6M 13s
  2600K .......... .......... .......... .......... .......... 36% 25.0M 12s
  2650K .......... .......... .......... .......... .......... 36% 1.36M 12s
  2700K .......... .......... .......... .......... .......... 37%  379K 12s
  2750K .......... .......... .......... .......... .......... 38% 27.6M 11s
  2800K .......... .......... .......... .......... .......... 38% 18.7M 11s
  2850K .......... .......... .......... .......... .......... 39% 1.35M 11s
  2900K .......... .......... .......... .......... .......... 40%  380K 11s
  2950K .......... .......... .......... .......... .......... 40% 22.5M 11s
  3000K .......... .......... .......... .......... .......... 41% 24.0M 10s
  3050K .......... .......... .......... .......... .......... 42% 1.39M 10s
  3100K .......... .......... .......... .......... .......... 42%  569K 10s
  3150K .......... .......... .......... .......... .......... 43% 1.05M 10s
  3200K .......... .......... .......... .......... .......... 44% 21.8M 9s
  3250K .......... .......... .......... .......... .......... 44% 1.38M 9s
  3300K .......... .......... .......... .......... .......... 45% 1.08M 9s
  3350K .......... .......... .......... .......... .......... 46%  567K 9s
  3400K .......... .......... .......... .......... .......... 46% 19.8M 9s
  3450K .......... .......... .......... .......... .......... 47% 21.4M 8s
  3500K .......... .......... .......... .......... .......... 48% 1.43M 8s
  3550K .......... .......... .......... .......... .......... 48% 19.4M 8s
  3600K .......... .......... .......... .......... .......... 49%  381K 8s
  3650K .......... .......... .......... .......... .......... 50% 21.2M 8s
  3700K .......... .......... .......... .......... .......... 50% 21.0M 7s
  3750K .......... .......... .......... .......... .......... 51% 1.45M 7s
  3800K .......... .......... .......... .......... .......... 52% 19.2M 7s
  3850K .......... .......... .......... .......... .......... 52%  386K 7s
  3900K .......... .......... .......... .......... .......... 53% 16.7M 7s
  3950K .......... .......... .......... .......... .......... 54% 20.6M 7s
  4000K .......... .......... .......... .......... .......... 55% 13.9M 6s
  4050K .......... .......... .......... .......... .......... 55% 1.51M 6s
  4100K .......... .......... .......... .......... .......... 56% 1.08M 6s
  4150K .......... .......... .......... .......... .......... 57%  575K 6s
  4200K .......... .......... .......... .......... .......... 57% 17.3M 6s
  4250K .......... .......... .......... .......... .......... 58% 18.8M 6s
  4300K .......... .......... .......... .......... .......... 59% 19.8M 6s
  4350K .......... .......... .......... .......... .......... 59% 1.50M 5s
  4400K .......... .......... .......... .......... .......... 60%  578K 5s
  4450K .......... .......... .......... .......... .......... 61% 1.06M 5s
  4500K .......... .......... .......... .......... .......... 61% 22.0M 5s
  4550K .......... .......... .......... .......... .......... 62% 19.6M 5s
  4600K .......... .......... .......... .......... .......... 63% 17.8M 5s
  4650K .......... .......... .......... .......... .......... 63% 1.51M 5s
  4700K .......... .......... .......... .......... .......... 64% 1.11M 5s
  4750K .......... .......... .......... .......... .......... 65%  572K 4s
  4800K .......... .......... .......... .......... .......... 65% 18.8M 4s
  4850K .......... .......... .......... .......... .......... 66% 20.0M 4s
  4900K .......... .......... .......... .......... .......... 67% 23.0M 4s
  4950K .......... .......... .......... .......... .......... 67% 1.52M 4s
  5000K .......... .......... .......... .......... .......... 68% 18.9M 4s
  5050K .......... .......... .......... .......... .......... 69%  588K 4s
  5100K .......... .......... .......... .......... .......... 69% 1.06M 4s
  5150K .......... .......... .......... .......... .......... 70% 29.5M 4s
  5200K .......... .......... .......... .......... .......... 71% 17.1M 3s
  5250K .......... .......... .......... .......... .......... 72% 24.0M 3s
  5300K .......... .......... .......... .......... .......... 72% 1.52M 3s
  5350K .......... .......... .......... .......... .......... 73% 15.7M 3s
  5400K .......... .......... .......... .......... .......... 74%  594K 3s
  5450K .......... .......... .......... .......... .......... 74% 1.05M 3s
  5500K .......... .......... .......... .......... .......... 75% 28.4M 3s
  5550K .......... .......... .......... .......... .......... 76% 23.5M 3s
  5600K .......... .......... .......... .......... .......... 76% 19.4M 3s
  5650K .......... .......... .......... .......... .......... 77% 1.54M 3s
  5700K .......... .......... .......... .......... .......... 78% 17.4M 2s
  5750K .......... .......... .......... .......... .......... 78% 1.13M 2s
  5800K .......... .......... .......... .......... .......... 79%  574K 2s
  5850K .......... .......... .......... .......... .......... 80% 22.7M 2s
  5900K .......... .......... .......... .......... .......... 80% 24.2M 2s
  5950K .......... .......... .......... .......... .......... 81% 25.6M 2s
  6000K .......... .......... .......... .......... .......... 82% 19.7M 2s
  6050K .......... .......... .......... .......... .......... 82% 1.58M 2s
  6100K .......... .......... .......... .......... .......... 83% 18.4M 2s
  6150K .......... .......... .......... .......... .......... 84% 1.12M 2s
  6200K .......... .......... .......... .......... .......... 84%  575K 2s
  6250K .......... .......... .......... .......... .......... 85% 23.7M 2s
  6300K .......... .......... .......... .......... .......... 86% 26.9M 1s
  6350K .......... .......... .......... .......... .......... 86% 26.2M 1s
  6400K .......... .......... .......... .......... .......... 87% 18.1M 1s
  6450K .......... .......... .......... .......... .......... 88% 1.65M 1s
  6500K .......... .......... .......... .......... .......... 88% 17.5M 1s
  6550K .......... .......... .......... .......... .......... 89% 1.10M 1s
  6600K .......... .......... .......... .......... .......... 90%  581K 1s
  6650K .......... .......... .......... .......... .......... 91% 21.1M 1s
  6700K .......... .......... .......... .......... .......... 91% 24.7M 1s
  6750K .......... .......... .......... .......... .......... 92% 24.7M 1s
  6800K .......... .......... .......... .......... .......... 93% 19.9M 1s
  6850K .......... .......... .......... .......... .......... 93% 24.5M 1s
  6900K .......... .......... .......... .......... .......... 94% 1.69M 1s
  6950K .......... .......... .......... .......... .......... 95% 18.0M 0s
  7000K .......... .......... .......... .......... .......... 95% 1.11M 0s
  7050K .......... .......... .......... .......... .......... 96%  582K 0s
  7100K .......... .......... .......... .......... .......... 97% 21.0M 0s
  7150K .......... .......... .......... .......... .......... 97% 21.4M 0s
  7200K .......... .......... .......... .......... .......... 98% 20.4M 0s
  7250K .......... .......... .......... .......... .......... 99% 19.3M 0s
  7300K .......... .......... .......... .......... .......... 99% 31.6M 0s
  7350K ..........                                            100% 53.6M=9.5s

2022-07-22 09:19:24 (776 KB/s) - ‘linux-media.tar.bz2’ saved [7537137/7537137]

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
