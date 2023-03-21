Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 301386C3571
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 16:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbjCUPSs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 11:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbjCUPSp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 11:18:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C47515F1
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 08:18:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 870D2B8128A
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 15:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E9BC433D2;
        Tue, 21 Mar 2023 15:17:49 +0000 (UTC)
Message-ID: <49bb0b6a-e669-d4e7-d742-a19d2763e947@xs4all.nl>
Date:   Tue, 21 Mar 2023 16:17:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] Various fixes/enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:

  media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4g

for you to fetch changes up to dacc09862467123c7e5ac45b131e77aafa54fe96:

  media: au0828: remove unnecessary (void*) conversions (2023-03-21 15:49:12 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Milen Mitkov (4):
      media: camss: sm8250: Virtual channels for CSID
      media: camss: vfe: Reserve VFE lines on stream start and link to CSID
      media: camss: vfe-480: Multiple outputs support for SM8250
      media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels

Niklas Söderlund (3):
      media: i2c: adv748x: Fix lookup of DV timings
      media: i2c: adv748x: Write initial DV timings to device
      media: i2c: adv748x: Report correct DV timings for pattern generator

Oliver Neukum (1):
      usbtv: usbtv_set_regs: the pipe is output

Yang Li (1):
      media: atmel: atmel-isc: Use devm_platform_ioremap_resource()

Yu Zhe (1):
      media: au0828: remove unnecessary (void*) conversions

Zheng Wang (2):
      media: dm1105: Fix use after free bug in dm1105_remove due to race condition
      media: saa7134: fix use after free bug in saa7134_finidev due to race condition

 drivers/media/i2c/adv748x/adv748x-hdmi.c                   | 21 +++++++++++++++------
 drivers/media/pci/dm1105/dm1105.c                          |  1 +
 drivers/media/pci/saa7134/saa7134-ts.c                     |  1 +
 drivers/media/pci/saa7134/saa7134-vbi.c                    |  1 +
 drivers/media/pci/saa7134/saa7134-video.c                  |  1 +
 drivers/media/platform/qcom/camss/camss-csid-gen2.c        | 54 ++++++++++++++++++++++++++++++++++--------------------
 drivers/media/platform/qcom/camss/camss-csid.c             | 44 +++++++++++++++++++++++++++++++-------------
 drivers/media/platform/qcom/camss/camss-csid.h             | 11 +++++++++--
 drivers/media/platform/qcom/camss/camss-vfe-170.c          |  4 ++--
 drivers/media/platform/qcom/camss/camss-vfe-480.c          | 61 ++++++++++++++++++++++++++++++++++++++++---------------------
 drivers/media/platform/qcom/camss/camss-vfe-gen1.c         |  4 ++--
 drivers/media/platform/qcom/camss/camss-vfe.c              |  1 +
 drivers/media/platform/qcom/camss/camss-video.c            | 21 ++++++++++++++++++---
 drivers/media/platform/qcom/camss/camss.c                  |  2 +-
 drivers/media/usb/au0828/au0828-core.c                     |  2 +-
 drivers/media/usb/au0828/au0828-dvb.c                      |  4 ++--
 drivers/media/usb/usbtv/usbtv-core.c                       |  2 +-
 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c |  4 +---
 drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c |  4 +---
 19 files changed, 163 insertions(+), 80 deletions(-)
