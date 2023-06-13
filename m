Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C47472DE50
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 11:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239393AbjFMJyn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 05:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234722AbjFMJym (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 05:54:42 -0400
X-Greylist: delayed 473 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 13 Jun 2023 02:54:40 PDT
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA05190
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 02:54:40 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 812B01000B2; Tue, 13 Jun 2023 10:46:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1686649602; bh=/kkXwmrlbQyn1OaMZazY9VDwwCAZ878jBKkeHDNx64o=;
        h=Date:From:To:Cc:Subject:From;
        b=nt5d/ueEVXMq8ucoL8dA7LscTXsKHOVKHfLmXA5evI1z/i0rQ38DpvUMZBSE/V2Zf
         OvO+eS3TJFzJWegM1irNmOzy+RgcwOchTOy7YV78M7YtJmiUtDqudje2WbCkMfTUvn
         i+p3TS/bUUiFc3m7PN9pmLH9lOEazlWQMKBxOT7eSHxoLF+nOh1R2svHUjsuOnuA9+
         dMvNkuQI4yL46CJldvbuIBnJ7rnU2eeVX3OZyL2OGCNvbs/OhpBUpLqjy1QUQeTSJ/
         ezxuc9y1ZrNj2m+zVRVZffZDieqpClI+jXLVzulKZLc/NKGbfPHfvFOIROWNhh2F5k
         3b11QLW0wo8gw==
Date:   Tue, 13 Jun 2023 10:46:42 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Zelong Dong <zelong.dong@amlogic.com>
Subject: [GIT PULL FOR v6.5] Convert meson-ir to regmap
Message-ID: <ZIg7ArgcYAry4E3y@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This might be on the late side for v6.5 but it would be nice to have it merged.

Thanks
Sean

The following changes since commit d78b9d6671decdaedb539635b1d0a34f8f5934f8:

  media: mediatek: vcodec: Add dbgfs help function (2023-06-09 16:38:52 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.5a

for you to fetch changes up to 9e5ee4930a2dec3975405bf5f11542c8859aa402:

  media: rc: meson-ir: support MMIO regmaps to access registers (2023-06-13 09:30:17 +0100)

----------------------------------------------------------------
v6.5a

----------------------------------------------------------------
Zelong Dong (3):
      media: rc: meson-ir: sort Meson IR Controller register macros
      media: rc: meson-ir: rename Meson IR Controller register macros
      media: rc: meson-ir: support MMIO regmaps to access registers

 drivers/media/rc/Kconfig    |   1 +
 drivers/media/rc/meson-ir.c | 120 ++++++++++++++++++++++----------------------
 2 files changed, 60 insertions(+), 61 deletions(-)
