Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E337A5BE3AD
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 12:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbiITKoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 06:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiITKnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 06:43:53 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81ACA5F9B
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 03:43:52 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0941A10005D; Tue, 20 Sep 2022 11:43:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1663670631; bh=wJTVOihJyX1DjaMm75CvT928Z7A1BLvxbcdKmtw2CnI=;
        h=Date:From:To:Subject:From;
        b=shtszLGCVOa6QDAhBZURl3TCCS+IldctEwSBXQDeKe5HOOr2kg0pD85CV+MPBHdhM
         EwEMIidqdEMWvVeTbjceVcHwgaLrOe/jsjA6Ovn8rQ0ZhZFitPsmSbDaJm/LMAmMG4
         qT2acQwTPGh2+Hm9tIAKw3vIpbOP0axK9DXXF33EpJatoGWhlwbD4nFhf68/66IWHh
         g37X5MHoluAHxn0hu7k+wiSoESRhE0A42BcB3zPDUjE2CDnEpNwTbCkSWbrqABH9yb
         0GpAZrX9sHCIRIF6ExclxtBUmd98izeOKp/AVfgn1RWMI3YLEzGLGKGcZ7Kk3aQri8
         NAkLjmPnJqRMQ==
Date:   Tue, 20 Sep 2022 11:43:50 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.1] Add IR remote support for NotOnlyTV LV3H
Message-ID: <YymZZluLr++s1ARe@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit f7ec3f62d7736ed14050716943a9562879155fcc:

  media: remove reference to CONFIG_EMBEDDED in MEDIA_SUPPORT_FILTER (2022-09-08 18:19:29 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.1b

for you to fetch changes up to e57802b508f49b16cd15f9ec7a69c45e0c9562a0:

  media: cx88: add IR remote support for NotOnlyTV LV3H (2022-09-19 12:13:47 +0100)

----------------------------------------------------------------
v6.1b

----------------------------------------------------------------
Daniel González Cabanelas (1):
      media: cx88: add IR remote support for NotOnlyTV LV3H

 drivers/media/i2c/ir-kbd-i2c.c      | 47 +++++++++++++++++++++++++++++++++++++
 drivers/media/pci/cx88/cx88-input.c |  2 +-
 drivers/media/pci/cx88/cx88-video.c |  1 +
 include/media/i2c/ir-kbd-i2c.h      |  1 +
 4 files changed, 50 insertions(+), 1 deletion(-)
