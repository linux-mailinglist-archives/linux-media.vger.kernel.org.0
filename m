Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 331245B3866
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 15:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiIIM77 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 08:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiIIM74 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 08:59:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E5F47BB0
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 05:59:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 137BD61FD1
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 12:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC18C433D6;
        Fri,  9 Sep 2022 12:59:53 +0000 (UTC)
Message-ID: <66dd9fe2-4b8b-40c2-cd2c-48ffb4029ad2@xs4all.nl>
Date:   Fri, 9 Sep 2022 14:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.1] Two sunxi error handling fixes
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

The following changes since commit fbb6c848dd89786fe24856ee6b5e773910ded29c:

  media: destage Hantro VPU driver (2022-08-31 10:23:50 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1p

for you to fetch changes up to 7283191f30c5f17bcafb4c4059f5df5590cf7ce9:

  media: sunxi: Fix some error handling path of sun6i_mipi_csi2_probe() (2022-09-09 14:46:22 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Christophe JAILLET (2):
      media: sunxi: Fix some error handling path of sun8i_a83t_mipi_csi2_probe()
      media: sunxi: Fix some error handling path of sun6i_mipi_csi2_probe()

 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c           | 20 ++++++++++++++++----
 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c | 23 ++++++++++++++++++-----
 2 files changed, 34 insertions(+), 9 deletions(-)
