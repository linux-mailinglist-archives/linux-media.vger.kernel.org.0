Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671961FAC27
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 11:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgFPJRc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 05:17:32 -0400
Received: from www.linuxtv.org ([130.149.80.248]:36422 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgFPJRc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 05:17:32 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jl7ek-00EUJK-Rb; Tue, 16 Jun 2020 09:13:23 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jl7ks-0001hO-Hf; Tue, 16 Jun 2020 09:19:42 +0000
Date:   Tue, 16 Jun 2020 09:19:42 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <291823702.29.1592299182538.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <1385709022.28.1592212829113.JavaMail.jenkins@builder.linuxtv.org>
References: <1385709022.28.1592212829113.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3114
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

See <https://builder.linuxtv.org/job/media-build/3114/display/redirect>

Changes:


------------------------------------------
[...truncated 17.43 KB...]
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tuner-xc2028.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tuner-simple.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tuner-types.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mt20xx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda8290.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tea5767.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tea5761.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda9887.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda827x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18271-maps.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18271-common.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18271-fe.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/xc5000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/xc4000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/msi001.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mt2060.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mt2063.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mt2266.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/qt1010.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mt2131.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxl5005s.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxl5007t.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mc44s803.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/max2165.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18218.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18212.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/e4000.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/fc2580.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tua9001.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/si2157.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/fc0011.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/fc0012.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/fc0013.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/it913x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/r820t.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/mxl301rf.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/qm1d1c0042.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/qm1d1b0004.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m88rs6000t.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda18250.o>
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-spi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-i2c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-dv-timings.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tuner-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-mem2mem.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/v4l2-jpeg.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-dma-sg.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-dma-contig.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-vmalloc.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvbdev.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dmxdev.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_demux.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dvb_ca_en50221.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-dma-sg.c>:24:10: fatal error: linux/pgtable.h: No such file or directory
 #include <linux/pgtable.h>
          ^~~~~~~~~~~~~~~~~
compilation terminated.
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:314: <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-dma-sg.o]> Error 1
make[5]: *** Waiting for unfinished jobs....
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-vmalloc.c>:18:10: fatal error: linux/pgtable.h: No such file or directory
 #include <linux/pgtable.h>
          ^~~~~~~~~~~~~~~~~
compilation terminated.
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:314: <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-vmalloc.o]> Error 1
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-dma-contig.c>: In function 'videobuf_dma_contig_user_get':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-dma-contig.c>:172:2: error: implicit declaration of function 'mmap_read_lock'; did you mean '_raw_read_lock'? [-Werror=implicit-function-declaration]
  mmap_read_lock(mm);
  ^~~~~~~~~~~~~~
  _raw_read_lock
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-dma-contig.c>:204:2: error: implicit declaration of function 'mmap_read_unlock'; did you mean '_raw_read_unlock'? [-Werror=implicit-function-declaration]
  mmap_read_unlock(current->mm);
  ^~~~~~~~~~~~~~~~
  _raw_read_unlock
cc1: some warnings being treated as errors
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:314: <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-dma-contig.o]> Error 1
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-core.c>: In function 'videobuf_qbuf':
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-core.c>:538:3: error: implicit declaration of function 'mmap_read_lock'; did you mean '_raw_read_lock'? [-Werror=implicit-function-declaration]
   mmap_read_lock(current->mm);
   ^~~~~~~~~~~~~~
   _raw_read_lock
<https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-core.c>:625:3: error: implicit declaration of function 'mmap_read_unlock'; did you mean '_raw_read_unlock'? [-Werror=implicit-function-declaration]
   mmap_read_unlock(current->mm);
   ^~~~~~~~~~~~~~~~
   _raw_read_unlock
cc1: some warnings being treated as errors
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:314: <https://builder.linuxtv.org/job/media-build/ws/v4l/videobuf-core.o]> Error 1
make[4]: *** [/usr/src/linux-headers-4.19.0-5-common/Makefile:1539: _module_<https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[3]: *** [Makefile:146: sub-make] Error 2
make[2]: *** [Makefile:8: all] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.19.0-5-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 533
Build step 'Execute shell' marked build as failure
