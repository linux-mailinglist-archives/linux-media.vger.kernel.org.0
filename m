Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3F8632191
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 13:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbiKUMGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 07:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbiKUMGv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 07:06:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA1A1EC6E
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 04:06:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4660BB80EFD
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 12:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887DFC433C1;
        Mon, 21 Nov 2022 12:06:44 +0000 (UTC)
Message-ID: <12b88956-dc33-5a38-9553-ca2f7ebd0bab@xs4all.nl>
Date:   Mon, 21 Nov 2022 13:06:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.2] Convert most i2c media drivers to use probe_new
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This PR merges in most of the media patchs from Uwe's
"[PATCH 000/606] i2c: Complete conversion to i2c_probe_new" patch series.

I omitted those drivers that use the new i2c_client_get_device_id() function
until that is merged, so once v6.2.0-rc1 is available I'll make a PR for the
remainder.

It's all trivial stuff, but it is good to get this done.

Regards,

	Hans

The following changes since commit a7bab6f8b73fe15a6181673149734a2756845dae:

Merge tag 'br-v6.2e' of git://linuxtv.org/hverkuil/media_tree into media_stage (2022-11-15 11:55:54 +0000)

are available in the Git repository at:

git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.2g

for you to fetch changes up to 76ad5c0a4546d38afe9ebdccbe6dd49f2a79cb71:

media: v4l2-core/tuner-core: Convert to i2c's .probe_new() (2022-11-21 11:04:46 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Uwe Kleine-König (96):
media: dvb-frontends/a8293: Convert to i2c's .probe_new()
media: dvb-frontends/af9013: Convert to i2c's .probe_new()
media: dvb-frontends/af9033: Convert to i2c's .probe_new()
media: dvb-frontends/au8522_decoder: Convert to i2c's .probe_new()
media: dvb-frontends/cxd2099: Convert to i2c's .probe_new()
media: dvb-frontends/cxd2820r_core: Convert to i2c's .probe_new()
media: dvb-frontends/helene: Convert to i2c's .probe_new()
media: dvb-frontends/lgdt3306a: Convert to i2c's .probe_new()
media: dvb-frontends/lgdt330x: Convert to i2c's .probe_new()
media: dvb-frontends/mn88472: Convert to i2c's .probe_new()
media: dvb-frontends/mn88473: Convert to i2c's .probe_new()
media: dvb-frontends/mxl692: Convert to i2c's .probe_new()
media: dvb-frontends/rtl2830: Convert to i2c's .probe_new()
media: dvb-frontends/rtl2832: Convert to i2c's .probe_new()
media: dvb-frontends/si2165: Convert to i2c's .probe_new()
media: dvb-frontends/si2168: Convert to i2c's .probe_new()
media: dvb-frontends/sp2: Convert to i2c's .probe_new()
media: dvb-frontends/stv090x: Convert to i2c's .probe_new()
media: dvb-frontends/stv6110x: Convert to i2c's .probe_new()
media: dvb-frontends/tda10071: Convert to i2c's .probe_new()
media: dvb-frontends/ts2020: Convert to i2c's .probe_new()
media: i2c/ad5820: Convert to i2c's .probe_new()
media: i2c/ad9389b: Convert to i2c's .probe_new()
media: i2c/adp1653: Convert to i2c's .probe_new()
media: i2c/adv7170: Convert to i2c's .probe_new()
media: i2c/adv7175: Convert to i2c's .probe_new()
media: i2c/adv7183: Convert to i2c's .probe_new()
media: i2c/adv7393: Convert to i2c's .probe_new()
media: i2c/adv7511-v4l2: Convert to i2c's .probe_new()
media: i2c/adv7842: Convert to i2c's .probe_new()
media: i2c/ak881x: Convert to i2c's .probe_new()
media: i2c/bt819: Convert to i2c's .probe_new()
media: i2c/bt856: Convert to i2c's .probe_new()
media: i2c/bt866: Convert to i2c's .probe_new()
media: i2c/cs3308: Convert to i2c's .probe_new()
media: i2c/cs5345: Convert to i2c's .probe_new()
media: cx25840: Convert to i2c's .probe_new()
media: i2c/ks0127: Convert to i2c's .probe_new()
media: i2c/lm3560: Convert to i2c's .probe_new()
media: i2c/lm3646: Convert to i2c's .probe_new()
media: i2c/m52790: Convert to i2c's .probe_new()
media: m5mols: Convert to i2c's .probe_new()
media: i2c/ml86v7667: Convert to i2c's .probe_new()
media: i2c/mt9m032: Convert to i2c's .probe_new()
media: i2c/mt9t001: Convert to i2c's .probe_new()
media: i2c/mt9t112: Convert to i2c's .probe_new()
media: i2c/mt9v011: Convert to i2c's .probe_new()
media: i2c/noon010pc30: Convert to i2c's .probe_new()
media: i2c/ov13858: Convert to i2c's .probe_new()
media: i2c/ov6650: Convert to i2c's .probe_new()
media: i2c/ov7640: Convert to i2c's .probe_new()
media: i2c/ov9640: Convert to i2c's .probe_new()
media: i2c/rj54n1cb0c: Convert to i2c's .probe_new()
media: i2c/s5k4ecgx: Convert to i2c's .probe_new()
media: i2c/s5k6aa: Convert to i2c's .probe_new()
media: i2c/saa6588: Convert to i2c's .probe_new()
media: i2c/saa6752hs: Convert to i2c's .probe_new()
media: i2c/saa7110: Convert to i2c's .probe_new()
media: i2c/saa717x: Convert to i2c's .probe_new()
media: i2c/saa7185: Convert to i2c's .probe_new()
media: i2c/sony-btf-mpx: Convert to i2c's .probe_new()
media: i2c/sr030pc30: Convert to i2c's .probe_new()
media: i2c/tda7432: Convert to i2c's .probe_new()
media: i2c/tda9840: Convert to i2c's .probe_new()
media: i2c/tea6415c: Convert to i2c's .probe_new()
media: i2c/tea6420: Convert to i2c's .probe_new()
media: i2c/ths7303: Convert to i2c's .probe_new()
media: i2c/tlv320aic23b: Convert to i2c's .probe_new()
media: i2c/tw2804: Convert to i2c's .probe_new()
media: i2c/tw9903: Convert to i2c's .probe_new()
media: i2c/tw9906: Convert to i2c's .probe_new()
media: i2c/tw9910: Convert to i2c's .probe_new()
media: i2c/uda1342: Convert to i2c's .probe_new()
media: i2c/upd64031a: Convert to i2c's .probe_new()
media: i2c/upd64083: Convert to i2c's .probe_new()
media: i2c/vp27smpx: Convert to i2c's .probe_new()
media: i2c/vpx3220: Convert to i2c's .probe_new()
media: i2c/vs6624: Convert to i2c's .probe_new()
media: i2c/wm8739: Convert to i2c's .probe_new()
media: i2c/wm8775: Convert to i2c's .probe_new()
media: radio/radio-tea5764: Convert to i2c's .probe_new()
media: radio/saa7706h: Convert to i2c's .probe_new()
media: radio/tef6862: Convert to i2c's .probe_new()
media: vidtv: Convert to i2c's .probe_new()
media: tuners/e4000: Convert to i2c's .probe_new()
media: tuners/fc2580: Convert to i2c's .probe_new()
media: tuners/m88rs6000t: Convert to i2c's .probe_new()
media: tuners/mt2060: Convert to i2c's .probe_new()
media: tuners/mxl301rf: Convert to i2c's .probe_new()
media: tuners/qm1d1b0004: Convert to i2c's .probe_new()
media: tuners/qm1d1c0042: Convert to i2c's .probe_new()
media: tuners/tda18212: Convert to i2c's .probe_new()
media: tuners/tda18250: Convert to i2c's .probe_new()
media: tuners/tua9001: Convert to i2c's .probe_new()
media: usb: go7007: s2250-board: Convert to i2c's .probe_new()
media: v4l2-core/tuner-core: Convert to i2c's .probe_new()

drivers/media/dvb-frontends/a8293.c            | 5 ++---
drivers/media/dvb-frontends/af9013.c           | 5 ++---
drivers/media/dvb-frontends/af9033.c           | 5 ++---
drivers/media/dvb-frontends/au8522_decoder.c   | 5 ++---
drivers/media/dvb-frontends/cxd2099.c          | 5 ++---
drivers/media/dvb-frontends/cxd2820r_core.c    | 5 ++---
drivers/media/dvb-frontends/helene.c           | 5 ++---
drivers/media/dvb-frontends/lgdt3306a.c        | 5 ++---
drivers/media/dvb-frontends/lgdt330x.c         | 5 ++---
drivers/media/dvb-frontends/mn88472.c          | 5 ++---
drivers/media/dvb-frontends/mn88473.c          | 5 ++---
drivers/media/dvb-frontends/mxl692.c           | 5 ++---
drivers/media/dvb-frontends/rtl2830.c          | 5 ++---
drivers/media/dvb-frontends/rtl2832.c          | 5 ++---
drivers/media/dvb-frontends/si2165.c           | 5 ++---
drivers/media/dvb-frontends/si2168.c           | 5 ++---
drivers/media/dvb-frontends/sp2.c              | 5 ++---
drivers/media/dvb-frontends/stv090x.c          | 5 ++---
drivers/media/dvb-frontends/stv6110x.c         | 5 ++---
drivers/media/dvb-frontends/tda10071.c         | 5 ++---
drivers/media/dvb-frontends/ts2020.c           | 5 ++---
drivers/media/i2c/ad5820.c                     | 5 ++---
drivers/media/i2c/ad9389b.c                    | 4 ++--
drivers/media/i2c/adp1653.c                    | 5 ++---
drivers/media/i2c/adv7170.c                    | 5 ++---
drivers/media/i2c/adv7175.c                    | 5 ++---
drivers/media/i2c/adv7183.c                    | 5 ++---
drivers/media/i2c/adv7393.c                    | 5 ++---
drivers/media/i2c/adv7511-v4l2.c               | 4 ++--
drivers/media/i2c/adv7842.c                    | 5 ++---
drivers/media/i2c/ak881x.c                     | 5 ++---
drivers/media/i2c/bt819.c                      | 5 ++---
drivers/media/i2c/bt856.c                      | 5 ++---
drivers/media/i2c/bt866.c                      | 5 ++---
drivers/media/i2c/cs3308.c                     | 5 ++---
drivers/media/i2c/cs5345.c                     | 5 ++---
drivers/media/i2c/cx25840/cx25840-core.c       | 5 ++---
drivers/media/i2c/ks0127.c                     | 4 ++--
drivers/media/i2c/lm3560.c                     | 5 ++---
drivers/media/i2c/lm3646.c                     | 5 ++---
drivers/media/i2c/m52790.c                     | 5 ++---
drivers/media/i2c/m5mols/m5mols_core.c         | 5 ++---
drivers/media/i2c/ml86v7667.c                  | 5 ++---
drivers/media/i2c/mt9m032.c                    | 5 ++---
drivers/media/i2c/mt9t001.c                    | 5 ++---
drivers/media/i2c/mt9t112.c                    | 5 ++---
drivers/media/i2c/mt9v011.c                    | 5 ++---
drivers/media/i2c/noon010pc30.c                | 5 ++---
drivers/media/i2c/ov13858.c                    | 5 ++---
drivers/media/i2c/ov6650.c                     | 5 ++---
drivers/media/i2c/ov7640.c                     | 5 ++---
drivers/media/i2c/ov9640.c                     | 5 ++---
drivers/media/i2c/rj54n1cb0c.c                 | 5 ++---
drivers/media/i2c/s5k4ecgx.c                   | 5 ++---
drivers/media/i2c/s5k6aa.c                     | 5 ++---
drivers/media/i2c/saa6588.c                    | 5 ++---
drivers/media/i2c/saa6752hs.c                  | 5 ++---
drivers/media/i2c/saa7110.c                    | 5 ++---
drivers/media/i2c/saa717x.c                    | 5 ++---
drivers/media/i2c/saa7185.c                    | 5 ++---
drivers/media/i2c/sony-btf-mpx.c               | 5 ++---
drivers/media/i2c/sr030pc30.c                  | 5 ++---
drivers/media/i2c/tda7432.c                    | 5 ++---
drivers/media/i2c/tda9840.c                    | 5 ++---
drivers/media/i2c/tea6415c.c                   | 5 ++---
drivers/media/i2c/tea6420.c                    | 5 ++---
drivers/media/i2c/ths7303.c                    | 5 ++---
drivers/media/i2c/tlv320aic23b.c               | 5 ++---
drivers/media/i2c/tw2804.c                     | 5 ++---
drivers/media/i2c/tw9903.c                     | 5 ++---
drivers/media/i2c/tw9906.c                     | 5 ++---
drivers/media/i2c/tw9910.c                     | 5 ++---
drivers/media/i2c/uda1342.c                    | 5 ++---
drivers/media/i2c/upd64031a.c                  | 5 ++---
drivers/media/i2c/upd64083.c                   | 5 ++---
drivers/media/i2c/vp27smpx.c                   | 5 ++---
drivers/media/i2c/vpx3220.c                    | 5 ++---
drivers/media/i2c/vs6624.c                     | 5 ++---
drivers/media/i2c/wm8739.c                     | 5 ++---
drivers/media/i2c/wm8775.c                     | 5 ++---
drivers/media/radio/radio-tea5764.c            | 5 ++---
drivers/media/radio/saa7706h.c                 | 5 ++---
drivers/media/radio/tef6862.c                  | 5 ++---
drivers/media/test-drivers/vidtv/vidtv_demod.c | 5 ++---
drivers/media/test-drivers/vidtv/vidtv_tuner.c | 5 ++---
drivers/media/tuners/e4000.c                   | 5 ++---
drivers/media/tuners/fc2580.c                  | 5 ++---
drivers/media/tuners/m88rs6000t.c              | 5 ++---
drivers/media/tuners/mt2060.c                  | 5 ++---
drivers/media/tuners/mxl301rf.c                | 5 ++---
drivers/media/tuners/qm1d1b0004.c              | 4 ++--
drivers/media/tuners/qm1d1c0042.c              | 5 ++---
drivers/media/tuners/tda18212.c                | 5 ++---
drivers/media/tuners/tda18250.c                | 5 ++---
drivers/media/tuners/tua9001.c                 | 5 ++---
drivers/media/usb/go7007/s2250-board.c         | 5 ++---
drivers/media/v4l2-core/tuner-core.c           | 6 ++----
97 files changed, 194 insertions(+), 288 deletions(-)
