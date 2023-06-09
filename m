Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF177295F0
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 11:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241828AbjFIJxt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 05:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241827AbjFIJxD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 05:53:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA343C07
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 02:45:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 60785612DC
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 09:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A103C433D2
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 09:45:12 +0000 (UTC)
Message-ID: <3ba0c0ef-cb63-5cb1-fe0a-a053019da9b6@xs4all.nl>
Date:   Fri, 9 Jun 2023 11:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.5] smatch fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This cleans up some of the reported smatch issues.

Regards,

	Hans

The following changes since commit aafeeaf3d2a8a91a5407c774c578abec79dcff00:

  media: video-mux: update driver to active state (2023-05-26 10:58:18 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.5j

for you to fetch changes up to dbe155da8e6c4ee23adad83f0cd38530c6de63b0:

  media: pci: tw686x: no need to check 'next' (2023-06-09 08:36:34 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (6):
      media: rockchip: rga: fix clock cleanup
      media: usb: as102: drop as102_dev NULL check
      media: platform: renesas-ceu: drop buf NULL check
      media: platform: mediatek: vpu: fix NULL ptr dereference
      media: mediatek: vpu: add missing clk_unprepare
      media: pci: tw686x: no need to check 'next'

 drivers/media/pci/tw686x/tw686x-audio.c       | 2 +-
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 7 +++++--
 drivers/media/platform/renesas/renesas-ceu.c  | 9 ---------
 drivers/media/platform/rockchip/rga/rga.c     | 4 ++--
 drivers/media/usb/as102/as102_usb_drv.c       | 6 ++----
 5 files changed, 10 insertions(+), 18 deletions(-)
