Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19B3E74AFB4
	for <lists+linux-media@lfdr.de>; Fri,  7 Jul 2023 13:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjGGL1J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 07:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjGGL0r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 07:26:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0601FF7
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 04:26:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A193861275
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 11:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B1FC433C8
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 11:26:43 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/4] cec-pin/cec-gpio: improve irq handling
Date:   Fri,  7 Jul 2023 13:26:37 +0200
Message-Id: <20230707112641.338232-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CEC interrupt is really only needed when the CEC device
is unconfigured and you want to monitor the CEC pin with
high precision.

The current code enables the irq for a short period when it
is first requested, and for a short while just before the
CEC device is configured. None of this is needed, so rework
the code to ensure it is only enabled when it is really needed.

In addition, the pin framework will now log the interrupt state
in the debugfs status file.

Hans Verkuil (4):
  cec-gpio: specify IRQF_NO_AUTOEN when requesting irq
  cec-pin: improve interrupt handling
  cec-gpio: drop the cec_gpio_free callback
  cec-pin: only enable interrupts when monitoring the CEC pin

 drivers/media/cec/core/cec-pin-priv.h         |  1 +
 drivers/media/cec/core/cec-pin.c              | 32 +++++++++++++------
 .../media/cec/platform/cec-gpio/cec-gpio.c    | 10 +-----
 3 files changed, 24 insertions(+), 19 deletions(-)

-- 
2.39.2

