Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3BCB50D0F8
	for <lists+linux-media@lfdr.de>; Sun, 24 Apr 2022 12:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238971AbiDXKDK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Apr 2022 06:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236724AbiDXKDJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Apr 2022 06:03:09 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF1619C0B
        for <linux-media@vger.kernel.org>; Sun, 24 Apr 2022 03:00:07 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 88BA01002D8; Sun, 24 Apr 2022 11:00:05 +0100 (BST)
Date:   Sun, 24 Apr 2022 11:00:05 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.19] Minor gpio-ir-tx improvement
Message-ID: <YmUfpX07uQc2+uPi@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit d0c19bed8cd3d005739c0a6374118c553564ef10:

  media: platform: imx-mipi-csis: Remove unneeded 'default n' (2022-04-24 09:07:31 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.19b

for you to fetch changes up to 25d705d78d2cf65c5a88560150bf17124753c249:

  media: gpio-ir-tx: simplify wait logic (2022-04-24 10:57:49 +0100)

----------------------------------------------------------------
v5.19b

----------------------------------------------------------------
Sean Young (1):
      media: gpio-ir-tx: simplify wait logic

 drivers/media/rc/gpio-ir-tx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
