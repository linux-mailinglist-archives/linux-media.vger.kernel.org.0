Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45B8B4C54CB
	for <lists+linux-media@lfdr.de>; Sat, 26 Feb 2022 10:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbiBZJOS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Feb 2022 04:14:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiBZJOS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Feb 2022 04:14:18 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E410824448A
        for <linux-media@vger.kernel.org>; Sat, 26 Feb 2022 01:13:43 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 47227101C95; Sat, 26 Feb 2022 09:13:42 +0000 (UTC)
Date:   Sat, 26 Feb 2022 09:13:42 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.18] rc core fixes
Message-ID: <YhnvRkCPUT4TScA/@gofer.mess.org>
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

Hi Mauro,

It would be great if the gpio-ir-tx fix could make it to v5.18, this is
affecting users.

Thanks,

Sean

The following changes since commit 2881ca629984b949ec9ac2e8ba1e64a2f0b66e8b:

  media: Makefiles: sort entries where it fits (2022-02-22 08:27:40 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.18c

for you to fetch changes up to 717c0e6d223bee3e86cf99fba32ea2e2f37cef32:

  media: gpio-ir-tx: fix transmit with long spaces on Orange Pi PC (2022-02-25 11:21:24 +0000)

----------------------------------------------------------------
v5.18c

----------------------------------------------------------------
Sean Young (2):
      media: lirc: remove unused feature LIRC_CAN_SET_REC_DUTY_CYCLE
      media: gpio-ir-tx: fix transmit with long spaces on Orange Pi PC

 .../userspace-api/media/lirc.h.rst.exceptions      |  1 -
 drivers/media/rc/gpio-ir-tx.c                      | 28 ++++++++++++++++------
 include/uapi/linux/lirc.h                          |  1 -
 3 files changed, 21 insertions(+), 9 deletions(-)
