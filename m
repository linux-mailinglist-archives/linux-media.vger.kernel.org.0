Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A33C7844D1
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 16:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236990AbjHVO4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 10:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233629AbjHVO4r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 10:56:47 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4FFF10B
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 07:56:45 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 90E1C1000CD; Tue, 22 Aug 2023 15:56:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1692716204; bh=0lg45wJN9lEMYRlnX07xO4Dxkqqhisqepb91ZHzs5qs=;
        h=From:To:Subject:Date:From;
        b=ov5nKaxVItIZV8Tqk5oQ4K24esOUc2XnQJQVCd9b1hMX0VKY5+nykaP3ACrmzww3G
         ZwXE/v1LGKC3pTXjPhcOt65S1hQCojsQtjPUQ/7iRcw0Yta2b6FYaQ1KbR42XwxuZX
         +Mek/sjqzSDj02TLQnn2sZrHBDufDPYUYczjUpPv+fGfcw32aq4umm0GlLkyJ7cgZC
         kPZIj5yEgyrg/yKOHJ1ULsinf3YPhk4Dmxur2ywDnsWm8Atqc4gF0uqZUv2TDQu8/W
         +aWA1NVsmzr9+fOGsK39wMyOOj0Y184G5wglPyWrokns8gF8BnhNOyivHRpK85Fmew
         sJCNjvLAItTjQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] Remove ir-rx51 driver
Date:   Tue, 22 Aug 2023 15:56:42 +0100
Message-Id: <20230822145644.213589-1-sean@mess.org>
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
 v2:
  - Fixed issues with pwm-ir-tx.yaml

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

