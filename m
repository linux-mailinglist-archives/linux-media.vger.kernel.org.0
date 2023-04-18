Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8656E5A01
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 09:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbjDRHCw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 03:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjDRHCv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 03:02:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3EDB10F8
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 00:02:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F79D62D61
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 07:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4615AC433EF;
        Tue, 18 Apr 2023 07:02:48 +0000 (UTC)
Message-ID: <c5e2368b-a283-a2a3-33ef-acc7581fca50@xs4all.nl>
Date:   Tue, 18 Apr 2023 09:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Arnd Bergmann <arnd@arndb.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] imx8-isi and rcar-vin fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mauro,

I'll push these myself to staging.

Regards,

	Hans

The following changes since commit 20af6be6bee4c3af80aac9b44b3d32d89824dde7:

  media: nxp: imx8-isi: Remove 300ms sleep after enabling channel (2023-04-16 07:38:01 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4q

for you to fetch changes up to 1ddaeb8cd9457034aa7c8ec7760e3758f41f91c2:

  media: nxp: imx8-isi: fix buiding on 32-bit (2023-04-18 08:53:41 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (1):
      media: nxp: imx8-isi: fix buiding on 32-bit

Niklas Söderlund (3):
      media: rcar-vin: Gen3 can not scale NV12
      media: rcar-vin: Fix NV12 size alignment
      media: rcar-vin: Select correct interrupt mode for V4L2_FIELD_ALTERNATE

 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 41 +++++++++++++++++++++--------------------
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 21 +++++++++++++++------
 2 files changed, 36 insertions(+), 26 deletions(-)
