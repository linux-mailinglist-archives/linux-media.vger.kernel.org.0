Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 989404BBA1B
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 14:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbiBRN1N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 08:27:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiBRN1M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 08:27:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911C2170D45
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 05:26:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 30793B825F7
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 13:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F8BC340EF
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 13:26:51 +0000 (UTC)
Message-ID: <7d90894e-1fb6-06c5-1c2c-67c81b4a34b2@xs4all.nl>
Date:   Fri, 18 Feb 2022 14:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] More fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 2b891d3980f6c255459d0e1c29ce2152ec7cf678:

  media: xilinx: csi2rxss: Use mipi-csi2.h (2022-02-17 10:32:26 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18n

for you to fetch changes up to dd025ebd015921ca2ecd37830a25c0319a817769:

  media: doc: pixfmt-rgb: Fix V4L2_PIX_FMT_BGR24 format description (2022-02-18 14:23:03 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Christophe JAILLET (1):
      media: Remove usage of the deprecated "pci-dma-compat.h" API

Colin Ian King (3):
      media: dvb_frontend: make static read-only array DIB3000MC_I2C_ADDRESS const
      media: dib7000p: make static read-only arrays notch and sine const
      media: dvb_frontends: make static read-only array fec_tab const

Lad Prabhakar (1):
      media: dt-bindings: media: renesas,csi2: Update data-lanes property

Laurent Pinchart (1):
      media: doc: pixfmt-rgb: Fix V4L2_PIX_FMT_BGR24 format description

Muhammad Usama Anjum (1):
      media: imx: imx8mq-mipi_csi2: Remove unneeded code

 Documentation/devicetree/bindings/media/renesas,csi2.yaml |  5 ++++-
 Documentation/userspace-api/media/v4l/pixfmt-rgb.rst      |  2 +-
 drivers/media/dvb-frontends/dib3000mc.c                   |  2 +-
 drivers/media/dvb-frontends/dib7000p.c                    |  4 ++--
 drivers/media/dvb-frontends/stv0299.c                     |  5 +++--
 drivers/media/pci/cx18/cx18-queue.h                       |  6 +++---
 drivers/media/pci/ivtv/ivtv-queue.h                       | 25 ++++++++++++++-----------
 drivers/media/pci/ivtv/ivtv-udma.h                        |  8 ++++----
 drivers/staging/media/imx/imx8mq-mipi-csi2.c              | 16 ++++------------
 9 files changed, 36 insertions(+), 37 deletions(-)
