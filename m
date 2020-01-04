Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4082130196
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 10:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgADJS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Jan 2020 04:18:56 -0500
Received: from www.linuxtv.org ([130.149.80.248]:33522 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726133AbgADJS4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 Jan 2020 04:18:56 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1infZP-00BNmy-DR; Sat, 04 Jan 2020 09:18:07 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1infbA-00017g-Jr; Sat, 04 Jan 2020 09:19:56 +0000
Date:   Sat, 4 Jan 2020 09:19:56 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1459554354.11.1578129596606.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #2922
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/2922/display/redirect>

Changes:


------------------------------------------
[...truncated 29.25 KB...]
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb-pll.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0299.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stb0899_drv.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stb0899_algo.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stb6100.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sp8870.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx22700.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s5h1432.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx24110.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda8083.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/l64781.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dib3000mb.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dib3000mc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dibx000_common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dib7000m.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dib7000p.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dib8000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dib9000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mt312.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ves1820.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ves1x93.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda1004x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sp887x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/nxt6000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mt352.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/zl10036.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/zl10039.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/zl10353.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx22702.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxd_firm.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxd_hard.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda10021.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda10023.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0297.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/nxt200x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/or51211.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/or51132.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/bcm3510.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s5h1420.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/lgdt330x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/lgdt3305.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/lgdt3306a.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/lg2160.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx24123.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/lnbh25.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/lnbh29.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/lnbp21.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/lnbp22.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/isl6405.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/isl6421.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda10086.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda826x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda8261.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dib0070.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dib0090.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tua6100.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s5h1409.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/itd1000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/au8522_common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/au8522_dig.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/au8522_decoder.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda10048.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx24113.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s5h1411.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/lgs8gl5.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda665x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/lgs8gxx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/atbm8830.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_dummy_fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/af9013.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx24116.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx24117.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx24120.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/si21xx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/si2168.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0288.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stb6000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/s921.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv6110.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0900_core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0900_sw.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv090x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv6110x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m88ds3103.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mn88472.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mn88473.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/isl6423.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ec100.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ds3000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ts2020.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mb86a16.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxj.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mb86a20s.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ix2505v.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0367.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r_core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r_c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r_t.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2820r_t2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2841er.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/drxk_hard.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18271c2dd.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv0910.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/stv6111.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxl5xx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/si2165.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/a8293.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sp2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda10071.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rtl2830.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rtl2832.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/rtl2832_sdr.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m88rs2000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/af9033.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/as102_fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/gp8psk-fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tc90522.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mn88443x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/horus3a.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ascot2e.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/helene.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/zd1301_demod.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2099.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_devio_spi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_integ.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_io.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_spi_device.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_tnrdmd.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_tnrdmd_dvbt2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_tnrdmd_dvbt2_mon.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_tnrdmd_dvbt.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_tnrdmd_dvbt_mon.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_tnrdmd_mon.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cxd2880_top.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mc-device.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mc-devnode.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mc-entity.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mc-request.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-fwnode.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-dev.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-ioctl.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-device.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-fh.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-event.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-ctrls.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-subdev.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-clk.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-async.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-trace.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-mc.o>
In file included from /usr/src/linux-headers-4.19.0-5-common/include/linux/printk.h:7,
                 from /usr/src/linux-headers-4.19.0-5-common/include/linux/kernel.h:14,
                 from /usr/src/linux-headers-4.19.0-5-common/include/asm-generic/bug.h:18,
                 from /usr/src/linux-headers-4.19.0-5-common/arch/x86/include/asm/bug.h:83,
                 from /usr/src/linux-headers-4.19.0-5-common/include/linux/bug.h:5,
                 from /usr/src/linux-headers-4.19.0-5-common/include/linux/mmdebug.h:5,
                 from <https://builder.linuxtv.org/job/media-build/ws/v4l/config-compat.h>:12,
                 from <https://builder.linuxtv.org/job/media-build/ws/v4l/compat.h>:10,
                 from <command-line>:
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-ioctl.c>: In function 'v4l_print_event':
/usr/src/linux-headers-4.19.0-5-common/include/linux/kern_levels.h:5:18: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type '__kernel_time_t' {aka 'const long int'} [-Wformat=]
 #define KERN_SOH "\001"  /* ASCII Start Of Header */
                  ^~~~~~
/usr/src/linux-headers-4.19.0-5-common/include/linux/kern_levels.h:24:19: note: in expansion of macro 'KERN_SOH'
 #define KERN_CONT KERN_SOH "c"
                   ^~~~~~~~
/usr/src/linux-headers-4.19.0-5-common/include/linux/printk.h:322:9: note: in expansion of macro 'KERN_CONT'
  printk(KERN_CONT fmt, ##__VA_ARGS__)
         ^~~~~~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-ioctl.c>:824:2: note: in expansion of macro 'pr_cont'
  pr_cont("type=0x%x, pending=%u, sequence=%u, id=%u, timestamp=%llu.%9.9llu\n",
  ^~~~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-ioctl.c>:824:67: note: format string is defined here
  pr_cont("type=0x%x, pending=%u, sequence=%u, id=%u, timestamp=%llu.%9.9llu\n",
                                                                ~~~^
                                                                %lu
In file included from /usr/src/linux-headers-4.19.0-5-common/include/linux/printk.h:7,
                 from /usr/src/linux-headers-4.19.0-5-common/include/linux/kernel.h:14,
                 from /usr/src/linux-headers-4.19.0-5-common/include/asm-generic/bug.h:18,
                 from /usr/src/linux-headers-4.19.0-5-common/arch/x86/include/asm/bug.h:83,
                 from /usr/src/linux-headers-4.19.0-5-common/include/linux/bug.h:5,
                 from /usr/src/linux-headers-4.19.0-5-common/include/linux/mmdebug.h:5,
                 from <https://builder.linuxtv.org/job/media-build/ws/v4l/config-compat.h>:12,
                 from <https://builder.linuxtv.org/job/media-build/ws/v4l/compat.h>:10,
                 from <command-line>:
/usr/src/linux-headers-4.19.0-5-common/include/linux/kern_levels.h:5:18: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 7 has type 'long int' [-Wformat=]
 #define KERN_SOH "\001"  /* ASCII Start Of Header */
                  ^~~~~~
/usr/src/linux-headers-4.19.0-5-common/include/linux/kern_levels.h:24:19: note: in expansion of macro 'KERN_SOH'
 #define KERN_CONT KERN_SOH "c"
                   ^~~~~~~~
/usr/src/linux-headers-4.19.0-5-common/include/linux/printk.h:322:9: note: in expansion of macro 'KERN_CONT'
  printk(KERN_CONT fmt, ##__VA_ARGS__)
         ^~~~~~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-ioctl.c>:824:2: note: in expansion of macro 'pr_cont'
  pr_cont("type=0x%x, pending=%u, sequence=%u, id=%u, timestamp=%llu.%9.9llu\n",
  ^~~~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-ioctl.c>:824:75: note: format string is defined here
  pr_cont("type=0x%x, pending=%u, sequence=%u, id=%u, timestamp=%llu.%9.9llu\n",
                                                                     ~~~~~~^
                                                                     %9.9lu
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-spi.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>: In function 'bufsize_v4l2_buffer_time32':
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>:619:34: error: macro "access_ok" requires 3 arguments, but only 2 given
  if (!access_ok(p32, sizeof(*p32)) ||
                                  ^
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>:619:7: error: 'access_ok' undeclared (first use in this function)
  if (!access_ok(p32, sizeof(*p32)) ||
       ^~~~~~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>:619:7: note: each undeclared identifier is reported only once for each function it appears in
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>: In function 'get_v4l2_buffer32_time32':
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>:752:34: error: macro "access_ok" requires 3 arguments, but only 2 given
  if (!access_ok(p32, sizeof(*p32)) ||
                                  ^
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>:752:7: error: 'access_ok' undeclared (first use in this function)
  if (!access_ok(p32, sizeof(*p32)) ||
       ^~~~~~~~~
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-i2c.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>:792:41: error: macro "access_ok" requires 3 arguments, but only 2 given
           num_planes * sizeof(*uplane32)))
                                         ^
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>: In function 'put_v4l2_buffer32_time32':
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>:930:34: error: macro "access_ok" requires 3 arguments, but only 2 given
  if (!access_ok(p32, sizeof(*p32)) ||
                                  ^
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>:930:7: error: 'access_ok' undeclared (first use in this function)
  if (!access_ok(p32, sizeof(*p32)) ||
       ^~~~~~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>: In function 'put_v4l2_event32_time32':
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>:1323:34: error: macro "access_ok" requires 3 arguments, but only 2 given
  if (!access_ok(p32, sizeof(*p32)) ||
                                  ^
<https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.c>:1323:7: error: 'access_ok' undeclared (first use in this function)
  if (!access_ok(p32, sizeof(*p32)) ||
       ^~~~~~~~~
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:309: <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-compat-ioctl32.o]> Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [/usr/src/linux-headers-4.19.0-5-common/Makefile:1539: _module_<https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[3]: *** [Makefile:146: sub-make] Error 2
make[2]: *** [Makefile:8: all] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.19.0-5-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 526
Build step 'Execute shell' marked build as failure
