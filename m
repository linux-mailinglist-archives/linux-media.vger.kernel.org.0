Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B286D70F5EE
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 14:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjEXML5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 08:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjEXMLz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 08:11:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF73130
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 05:11:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3C284632DF
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 12:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350ACC433D2
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 12:11:52 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/8] Various smatch/sparse fixes
Date:   Wed, 24 May 2023 14:11:42 +0200
Message-Id: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Various fixes to reduce the number of smatch/sparse warnings.

Hans Verkuil (8):
  staging: media: atomisp: initialize settings to 0
  media: rockchip: rga: fix clock cleanup
  media: usb: as102: drop as102_dev NULL check
  media: platform: renesas-ceu: drop buf NULL check
  media: platform: mediatek: vpu: fix NULL ptr dereference
  media: mediatek: vpu: add missing clk_unprepare
  media: pci: tw686x: no need to check 'next'
  staging: media: atomisp: move up sanity checks

 drivers/media/pci/tw686x/tw686x-audio.c           |  2 +-
 drivers/media/platform/mediatek/vpu/mtk_vpu.c     |  7 +++++--
 drivers/media/platform/renesas/renesas-ceu.c      |  9 ---------
 drivers/media/platform/rockchip/rga/rga.c         |  4 ++--
 drivers/media/usb/as102/as102_usb_drv.c           |  6 ++----
 .../media/atomisp/pci/atomisp_gmin_platform.c     |  2 +-
 .../staging/media/atomisp/pci/sh_css_firmware.c   | 15 ++++++++-------
 7 files changed, 19 insertions(+), 26 deletions(-)

-- 
2.39.2

