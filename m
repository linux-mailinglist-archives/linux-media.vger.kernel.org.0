Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 833706D5A15
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 09:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233976AbjDDH4b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 03:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233478AbjDDH43 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 03:56:29 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325B3198A
        for <linux-media@vger.kernel.org>; Tue,  4 Apr 2023 00:56:29 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 89AC0100092; Tue,  4 Apr 2023 08:56:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1680594987; bh=14HcKGWs2p7eJ0m1oIADMapALBwwRuRh/chM0leRdvE=;
        h=Date:From:To:Cc:Subject:From;
        b=XG4iZLFboz9sBlyHE0hMmw3SDd88SAvkCgd/qDF8weGnZ+bgY72deCrbKFlztVIJR
         zrhxf9q7v14lpSlbPzjWoXou7ERsnwjLhBDAfn+lz9t67N4HqU18/eNnt0PJ2dvjqX
         VKAlISRVgRbeUxNQVMuKq12b9q5QKYJLLngYr5YPhPzOOuX6rSxdHXFfqixbaXD8G0
         qvVBOi8kNpiJBHdFh/e2Z3Ty4BYOhMH9oZCHqHQJi/s1OkVNh8m6sJbxPDenGdD/f2
         Rew6TBBdEtQ/Yovj09YuP5ggfM21wwv1Vnco5s1EsceLhf1peU4XRjIKVG+WSFlGDX
         vB53VSgzbMHvQ==
Date:   Tue, 4 Apr 2023 08:56:27 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>
Subject: [GIT PULL FOR v6.4] gpio-ir-recv wakeup
Message-ID: <ZCvYK3gpMw25Zz+u@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:

  media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.4b

for you to fetch changes up to 7e33c69171894426e4c30f376571fd482ce410f5:

  media: rc: gpio-ir-recv: Fix support for wake-up (2023-04-04 08:44:54 +0100)

----------------------------------------------------------------
v6.4b

----------------------------------------------------------------
Florian Fainelli (2):
      dt-bindings: media: gpio-ir-receiver: Document wakeup-souce property
      media: rc: gpio-ir-recv: Fix support for wake-up

 Documentation/devicetree/bindings/media/gpio-ir-receiver.yaml | 3 +++
 drivers/media/rc/gpio-ir-recv.c                               | 2 ++
 2 files changed, 5 insertions(+)
