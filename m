Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4AE2A91F7
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 10:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgKFJB0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 6 Nov 2020 04:01:26 -0500
Received: from www.linuxtv.org ([130.149.80.248]:45364 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726543AbgKFJBZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Nov 2020 04:01:25 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kaxcY-00HMtx-9P; Fri, 06 Nov 2020 09:01:22 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kaxfY-0004f6-DN; Fri, 06 Nov 2020 09:04:28 +0000
Date:   Fri, 6 Nov 2020 09:04:28 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <73422485.27.1604653468406@builder.linuxtv.org>
In-Reply-To: <2111941664.26.1604567977773@builder.linuxtv.org>
References: <2111941664.26.1604567977773@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3278
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

See <https://builder.linuxtv.org/job/media-build/3278/display/redirect?page=changes>

Changes:

[hverkuil-cisco] Add patch to revert DEFINE_SEQ_ATTRIBUTE

[hverkuil-cisco] Update backports/v5.0_time32.patch

[hverkuil-cisco] IMX274 needs devm_clk_get_optional

[hverkuil-cisco] Update backports/v4.20_access_ok.patch

[hverkuil-cisco] Update backports/v4.6_i2c_mux.patch

[hverkuil-cisco] v4l/compat.h: add support for in_compat_syscall


------------------------------------------
[...truncated 4.31 KB...]
    50K .......... .......... .......... .......... ..........  1%  322K 32s
   100K .......... .......... .......... .......... ..........  2%  321K 29s
   150K .......... .......... .......... .......... ..........  2%  322K 27s
   200K .......... .......... .......... .......... ..........  3%  323K 25s
   250K .......... .......... .......... .......... ..........  4% 1.08M 22s
   300K .......... .......... .......... .......... ..........  4%  445K 21s
   350K .......... .......... .......... .......... ..........  5%  323K 21s
   400K .......... .......... .......... .......... ..........  6%  322K 20s
   450K .......... .......... .......... .......... ..........  7%  324K 20s
   500K .......... .......... .......... .......... ..........  7% 20.8M 18s
   550K .......... .......... .......... .......... ..........  8%  324K 18s
   600K .......... .......... .......... .......... ..........  9%  323K 18s
   650K .......... .......... .......... .......... ..........  9% 26.2M 17s
   700K .......... .......... .......... .......... .......... 10%  324K 17s
   750K .......... .......... .......... .......... .......... 11% 16.8M 16s
   800K .......... .......... .......... .......... .......... 12%  324K 16s
   850K .......... .......... .......... .......... .......... 12%  325K 16s
   900K .......... .......... .......... .......... .......... 13% 24.2M 15s
   950K .......... .......... .......... .......... .......... 14%  326K 15s
  1000K .......... .......... .......... .......... .......... 14% 24.4M 14s
  1050K .......... .......... .......... .......... .......... 15%  325K 14s
  1100K .......... .......... .......... .......... .......... 16% 23.1M 14s
  1150K .......... .......... .......... .......... .......... 17%  326K 14s
  1200K .......... .......... .......... .......... .......... 17% 19.4M 13s
  1250K .......... .......... .......... .......... .......... 18%  326K 13s
  1300K .......... .......... .......... .......... .......... 19% 26.1M 12s
  1350K .......... .......... .......... .......... .......... 19% 1.16M 12s
  1400K .......... .......... .......... .......... .......... 20%  442K 12s
  1450K .......... .......... .......... .......... .......... 21% 1.19M 12s
  1500K .......... .......... .......... .......... .......... 22%  439K 12s
  1550K .......... .......... .......... .......... .......... 22% 23.0M 11s
  1600K .......... .......... .......... .......... .......... 23%  326K 11s
  1650K .......... .......... .......... .......... .......... 24% 22.7M 11s
  1700K .......... .......... .......... .......... .......... 24% 1.22M 10s
  1750K .......... .......... .......... .......... .......... 25%  439K 10s
  1800K .......... .......... .......... .......... .......... 26% 20.9M 10s
  1850K .......... .......... .......... .......... .......... 27% 1.23M 10s
  1900K .......... .......... .......... .......... .......... 27%  438K 10s
  1950K .......... .......... .......... .......... .......... 28% 20.6M 9s
  2000K .......... .......... .......... .......... .......... 29%  329K 9s
  2050K .......... .......... .......... .......... .......... 29% 23.4M 9s
  2100K .......... .......... .......... .......... .......... 30% 23.3M 9s
  2150K .......... .......... .......... .......... .......... 31%  330K 9s
  2200K .......... .......... .......... .......... .......... 32% 20.6M 9s
  2250K .......... .......... .......... .......... .......... 32% 22.2M 8s
  2300K .......... .......... .......... .......... .......... 33% 1.24M 8s
  2350K .......... .......... .......... .......... .......... 34%  441K 8s
  2400K .......... .......... .......... .......... .......... 34% 18.1M 8s
  2450K .......... .......... .......... .......... .......... 35% 1.25M 8s
  2500K .......... .......... .......... .......... .......... 36%  440K 8s
  2550K .......... .......... .......... .......... .......... 37% 21.8M 7s
  2600K .......... .......... .......... .......... .......... 37% 1.26M 7s
  2650K .......... .......... .......... .......... .......... 38%  439K 7s
  2700K .......... .......... .......... .......... .......... 39% 26.0M 7s
  2750K .......... .......... .......... .......... .......... 39% 22.1M 7s
  2800K .......... .......... .......... .......... .......... 40% 1.26M 7s
  2850K .......... .......... .......... .......... .......... 41%  440K 7s
  2900K .......... .......... .......... .......... .......... 42% 21.7M 6s
  2950K .......... .......... .......... .......... .......... 42% 22.5M 6s
  3000K .......... .......... .......... .......... .......... 43% 1.26M 6s
  3050K .......... .......... .......... .......... .......... 44%  444K 6s
  3100K .......... .......... .......... .......... .......... 44% 24.0M 6s
  3150K .......... .......... .......... .......... .......... 45% 24.7M 6s
  3200K .......... .......... .......... .......... .......... 46%  635K 6s
  3250K .......... .......... .......... .......... .......... 47%  680K 6s
  3300K .......... .......... .......... .......... .......... 47% 25.4M 5s
  3350K .......... .......... .......... .......... .......... 48% 22.9M 5s
  3400K .......... .......... .......... .......... .......... 49% 1.29M 5s
  3450K .......... .......... .......... .......... .......... 49%  439K 5s
  3500K .......... .......... .......... .......... .......... 50% 17.7M 5s
  3550K .......... .......... .......... .......... .......... 51% 18.3M 5s
  3600K .......... .......... .......... .......... .......... 52% 1.34M 5s
  3650K .......... .......... .......... .......... .......... 52%  444K 5s
  3700K .......... .......... .......... .......... .......... 53% 16.5M 5s
  3750K .......... .......... .......... .......... .......... 54% 15.6M 4s
  3800K .......... .......... .......... .......... .......... 54% 21.8M 4s
  3850K .......... .......... .......... .......... .......... 55% 1.38M 4s
  3900K .......... .......... .......... .......... .......... 56%  444K 4s
  3950K .......... .......... .......... .......... .......... 57% 16.1M 4s
  4000K .......... .......... .......... .......... .......... 57% 13.8M 4s
  4050K .......... .......... .......... .......... .......... 58% 1.40M 4s
  4100K .......... .......... .......... .......... .......... 59% 23.4M 4s
  4150K .......... .......... .......... .......... .......... 59%  443K 4s
  4200K .......... .......... .......... .......... .......... 60% 17.7M 4s
  4250K .......... .......... .......... .......... .......... 61% 19.7M 4s
  4300K .......... .......... .......... .......... .......... 61% 17.8M 3s
  4350K .......... .......... .......... .......... .......... 62% 1.42M 3s
  4400K .......... .......... .......... .......... .......... 63%  442K 3s
  4450K .......... .......... .......... .......... .......... 64% 20.8M 3s
  4500K .......... .......... .......... .......... .......... 64% 19.9M 3s
  4550K .......... .......... .......... .......... .......... 65% 16.7M 3s
  4600K .......... .......... .......... .......... .......... 66% 1.41M 3s
  4650K .......... .......... .......... .......... .......... 66%  444K 3s
  4700K .......... .......... .......... .......... .......... 67% 20.6M 3s
  4750K .......... .......... .......... .......... .......... 68% 17.7M 3s
  4800K .......... .......... .......... .......... .......... 69% 12.4M 3s
  4850K .......... .......... .......... .......... .......... 69% 1.50M 3s
  4900K .......... .......... .......... .......... .......... 70% 19.8M 2s
  4950K .......... .......... .......... .......... .......... 71%  445K 2s
  5000K .......... .......... .......... .......... .......... 71% 17.5M 2s
  5050K .......... .......... .......... .......... .......... 72% 18.1M 2s
  5100K .......... .......... .......... .......... .......... 73% 19.6M 2s
  5150K .......... .......... .......... .......... .......... 74% 1.48M 2s
  5200K .......... .......... .......... .......... .......... 74% 1.18M 2s
  5250K .......... .......... .......... .......... .......... 75%  673K 2s
  5300K .......... .......... .......... .......... .......... 76% 18.0M 2s
  5350K .......... .......... .......... .......... .......... 76% 17.3M 2s
  5400K .......... .......... .......... .......... .......... 77% 18.6M 2s
  5450K .......... .......... .......... .......... .......... 78% 1.52M 2s
  5500K .......... .......... .......... .......... .......... 79% 19.1M 2s
  5550K .......... .......... .......... .......... .......... 79%  447K 2s
  5600K .......... .......... .......... .......... .......... 80% 15.0M 2s
  5650K .......... .......... .......... .......... .......... 81% 17.8M 1s
  5700K .......... .......... .......... .......... .......... 81% 20.1M 1s
  5750K .......... .......... .......... .......... .......... 82% 22.9M 1s
  5800K .......... .......... .......... .......... .......... 83% 1.53M 1s
  5850K .......... .......... .......... .......... .......... 84% 1.20M 1s
  5900K .......... .......... .......... .......... .......... 84%  678K 1s
  5950K .......... .......... .......... .......... .......... 85% 18.8M 1s
  6000K .......... .......... .......... .......... .......... 86% 14.8M 1s
  6050K .......... .......... .......... .......... .......... 86% 23.3M 1s
  6100K .......... .......... .......... .......... .......... 87% 1.53M 1s
  6150K .......... .......... .......... .......... .......... 88% 21.8M 1s
  6200K .......... .......... .......... .......... .......... 89%  448K 1s
  6250K .......... .......... .......... .......... .......... 89% 19.7M 1s
  6300K .......... .......... .......... .......... .......... 90% 20.8M 1s
  6350K .......... .......... .......... .......... .......... 91% 19.7M 1s
  6400K .......... .......... .......... .......... .......... 91% 18.7M 1s
  6450K .......... .......... .......... .......... .......... 92% 1.54M 1s
  6500K .......... .......... .......... .......... .......... 93% 22.7M 0s
  6550K .......... .......... .......... .......... .......... 94% 1.22M 0s
  6600K .......... .......... .......... .......... .......... 94%  677K 0s
  6650K .......... .......... .......... .......... .......... 95% 19.5M 0s
  6700K .......... .......... .......... .......... .......... 96% 20.6M 0s
  6750K .......... .......... .......... .......... .......... 96% 21.6M 0s
  6800K .......... .......... .......... .......... .......... 97% 16.8M 0s
  6850K .......... .......... .......... .......... .......... 98% 1.56M 0s
  6900K .......... .......... .......... .......... .......... 99% 22.5M 0s
  6950K .......... .......... .......... .......... .......... 99%  451K 0s
  7000K .......... ......                                     100% 34.4M=7.0s

2020-11-06 09:04:25 (1001 KB/s) - ‘linux-media.tar.bz2’ saved [7184914/7184914]

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
Applying patches for kernel 4.19.0-12-amd64
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
patch -s -f -N -p1 -i ../backports/debug.patch
patch -s -f -N -p1 -i ../backports/drx39xxj.patch
patch -s -f -N -p1 -i ../backports/v5.9_tasklet.patch
patch -s -f -N -p1 -i ../backports/v5.7_mmap_read_lock.patch
patch -s -f -N -p1 -i ../backports/v5.7_vm_map_ram.patch
patch -s -f -N -p1 -i ../backports/v5.7_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.7_define_seq_attribute.patch
patch -s -f -N -p1 -i ../backports/v5.6_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.6_const_fb_ops.patch
patch -s -f -N -p1 -i ../backports/v5.6_pm_runtime_get_if_active.patch
patch -s -f -N -p1 -i ../backports/v5.5_alsa_pcm_api_updates.patch
patch -s -f -N -p1 -i ../backports/v5.5_memtype_h.patch
patch -s -f -N -p1 -i ../backports/v5.5_dev_printk_h.patch
patch -s -f -N -p1 -i ../backports/v5.4_revert_spi_transfer.patch
patch -s -f -N -p1 -i ../backports/v5.4_dma_buf.patch
patch -s -f -N -p1 -i ../backports/v5.1_vm_map_pages.patch
patch -s -f -N -p1 -i ../backports/v5.1_devm_i2c_new_dummy_device.patch
patch -s -f -N -p1 -i ../backports/v5.0_ipu3-cio2.patch
patch -s -f -N -p1 -i ../backports/v5.0_time32.patch
patch -s -f -N -p1 -i ../backports/v4.20_access_ok.patch
Patched drivers/media/dvb-core/dvbdev.c
Patched drivers/media/v4l2-core/v4l2-dev.c
Patched drivers/media/rc/rc-main.c
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
./scripts/make_kconfig.pl /lib/modules/4.19.0-12-amd64/build /lib/modules/4.19.0-12-amd64/build 1
File not found: /lib/modules/4.19.0-12-amd64/build/.config at ./scripts/make_kconfig.pl line 33, <IN> line 4.
Preparing to compile for kernel version 4.19.0
make[1]: *** [Makefile:379: allyesconfig] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: allyesconfig] Error 2
can't select all drivers at ./build line 531
Build step 'Execute shell' marked build as failure
