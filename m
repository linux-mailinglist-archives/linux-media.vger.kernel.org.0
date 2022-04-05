Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71D1D4F2F1E
	for <lists+linux-media@lfdr.de>; Tue,  5 Apr 2022 14:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239403AbiDEJfO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 05:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344108AbiDEJSO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 05:18:14 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C4421E1D
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 02:04:10 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DB029100093; Tue,  5 Apr 2022 09:04:08 +0000 (UTC)
Date:   Tue, 5 Apr 2022 10:04:08 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.19] Minor meson fix
Message-ID: <YkwGCEgFfSjz1stk@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 2afc1933fbc688f4ffbbdfc85126ac9b68c7e0b6:

  media: dvb-usb: dib0700_devices: use an enum for the device number (2022-04-04 23:06:01 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.19a

for you to fetch changes up to 4f7358b732e06afe7b926f09fc26d81c5414372b:

  media: meson-ir-tx: remove superfluous dev_err() (2022-04-05 09:48:30 +0100)

----------------------------------------------------------------
v5.19a

----------------------------------------------------------------
Yihao Han (1):
      media: meson-ir-tx: remove superfluous dev_err()

 drivers/media/rc/meson-ir-tx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
