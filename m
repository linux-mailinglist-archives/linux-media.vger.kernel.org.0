Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3A475A788
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 09:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjGTHQJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 03:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjGTHQG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 03:16:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02003269D
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 00:16:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D087618EC
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 07:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B458C433C7
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 07:16:02 +0000 (UTC)
Message-ID: <50f929e7-17b3-0584-5f7f-ecafdcde9540@xs4all.nl>
Date:   Thu, 20 Jul 2023 09:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.6] v2: Various cec fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Even though two of the patches have a Fixes tag, there is nothing here that
is important for 6.5.

Changes since v1: updated the first patch, fixing a sparse warning

Regards,

	Hans

The following changes since commit 28999781d15f94046e6c23a9a7d92ad28a436abf:

  media: i2c: ov01a10: Switch back to use struct i2c_driver::probe (2023-07-19 12:57:51 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.6b

for you to fetch changes up to 0751a3785e893fdb53523cca0c43783ccd3d1f74:

  cec-pin: only enable interrupts when monitoring the CEC pin (2023-07-20 08:49:25 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (7):
      media: cec: core: add adap_nb_transmit_canceled() callback
      media: cec: core: add adap_unconfigured() callback
      Documentation: media: cec: describe new callbacks
      cec-gpio: specify IRQF_NO_AUTOEN when requesting irq
      cec-pin: improve interrupt handling
      cec-gpio: drop the cec_gpio_free callback
      cec-pin: only enable interrupts when monitoring the CEC pin

 Documentation/driver-api/media/cec-core.rst    | 44 ++++++++++++++++++++++++++++++++++----------
 drivers/media/cec/core/cec-adap.c              |  8 ++++----
 drivers/media/cec/core/cec-pin-priv.h          |  1 +
 drivers/media/cec/core/cec-pin.c               | 32 ++++++++++++++++++++++----------
 drivers/media/cec/platform/cec-gpio/cec-gpio.c | 10 +---------
 include/media/cec.h                            | 11 +++++++----
 6 files changed, 69 insertions(+), 37 deletions(-)
