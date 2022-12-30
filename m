Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 830C7659771
	for <lists+linux-media@lfdr.de>; Fri, 30 Dec 2022 11:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbiL3KuM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Dec 2022 05:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiL3KuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Dec 2022 05:50:12 -0500
X-Greylist: delayed 322 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Dec 2022 02:50:11 PST
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3206D1A06D
        for <linux-media@vger.kernel.org>; Fri, 30 Dec 2022 02:50:10 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9A20710005E; Fri, 30 Dec 2022 10:44:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1672397084; bh=5lBSF3ReS/fIxoeacRlOTVYo7hn5qGU77wTIOtPVUE0=;
        h=Date:From:To:Subject:From;
        b=I28bU6rSuaR9UClDOpn8+pJi9NgUFKS66PTBvq+cJ75NY2DSwSJZj1hpW+Hx3XXmw
         UO2Se71wUrjFAme51hrTLsKk6C7gElKp7YY8WTE87cEPdEwos5ZHRfhiPXE89EP3Dd
         XioxJi76QzQgSBIvgapA/Axd4FX9QXeUrWz7Zcrjdg5RiQC1qtumkRmA8PvmqkLzL5
         dn+GZ/467pmv17/qC7gXTy3LHmldah6mMjQJyjDgFyjd4akg9m+IcRExwPGswEuEeB
         1jPuR6qSK+G9I3gtgGVIh0CSRXPnSKMEYExl7l4dbAI+WjQalCjC4ZooA7fXvAr7OZ
         wDU5WSNyxboMQ==
Date:   Fri, 30 Dec 2022 10:44:44 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.3] RC fixes
Message-ID: <Y67BHLQFLve0XaqV@gofer.mess.org>
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

The following changes since commit 6599e683db1bf22fee74302c47e31b9a42a1c3d2:

  Merge tag 'v6.2-rc1' into media_tree (2022-12-28 16:07:44 +0000)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.3a

for you to fetch changes up to c97681e2217576f44974c1eed189c69c0eda9da8:

  media: rc/ir-rx51: Drop empty platform remove function (2022-12-30 09:25:52 +0000)

----------------------------------------------------------------
v6.3a

----------------------------------------------------------------
Jean Delvare (1):
      media: rc: Drop obsolete dependencies on COMPILE_TEST

Uwe Kleine-König (1):
      media: rc/ir-rx51: Drop empty platform remove function

 drivers/media/rc/Kconfig     | 4 ++--
 drivers/media/rc/ir-rx51.c   | 6 ------
 drivers/media/rc/pwm-ir-tx.c | 2 +-
 3 files changed, 3 insertions(+), 9 deletions(-)
