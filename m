Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAAF1783C9A
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 11:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234207AbjHVJMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 05:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234202AbjHVJMv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 05:12:51 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16461B2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 02:12:46 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 77A2E1000CD; Tue, 22 Aug 2023 10:12:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1692695565; bh=c3Mq1lE4kQi1Ql5c+hWwwnAjvCQXigiVlIdrJPb4x+0=;
        h=From:To:Subject:Date:From;
        b=UWDCW66nYCryLJ5nqVKNEMxhLNK/93JwZjDqNjms/po+Cz20gGpT4LbZiCx5DRaAp
         kQvuq5FiaVpypJlYXb/ND9FEwYHAeWAEg0GqKjElmhQgCry9dPlVNqHzWoPuU49DCl
         QJoa7Zhjog6sHVD545AAguDqYu0vjA1aOcq8HyRPqTE6T8/YwH62Whner24lrQED9N
         705UC0LKIo7x+FGbYUd6IPlw5rMbl3LDmsFy17K7yNaOzM5CmUMBi1FbjeJ3tTrYK/
         Gtyoj0hCIlGn59qDoGbQ1ZrPj5ZJxW68ysMlU+7/Kre+EEPfsaUaxQU9sVOcSvl3bB
         m6RKu8kcQ9QMg==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] Remove ir-rx51 driver
Date:   Tue, 22 Aug 2023 10:12:43 +0100
Message-Id: <20230822091245.209539-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ir-rx51 driver is no longer necessary, pwm-ir-tx does the same job
and is more generic.

changes:
 v1:
  - Made pwm-ir-tx compatible with nokia,n900-ir rather than changing
    the n900 devicetree

Sean Young (2):
  media: rc: remove ir-rx51 in favour of generic pwm-ir-tx
  media: dt-bindings: media: remove nokia,n900-ir as pwm-ir-tx is
    compatible

 .../bindings/leds/irled/pwm-ir-tx.yaml        |   4 +-
 .../devicetree/bindings/media/nokia,n900-ir   |  20 --
 arch/arm/configs/omap2plus_defconfig          |   1 -
 drivers/media/rc/Kconfig                      |  10 -
 drivers/media/rc/Makefile                     |   1 -
 drivers/media/rc/ir-rx51.c                    | 285 ------------------
 drivers/media/rc/pwm-ir-tx.c                  |   1 +
 7 files changed, 4 insertions(+), 318 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/nokia,n900-ir
 delete mode 100644 drivers/media/rc/ir-rx51.c

-- 
2.41.0

