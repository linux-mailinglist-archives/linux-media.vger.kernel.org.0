Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3B92759451
	for <lists+linux-media@lfdr.de>; Wed, 19 Jul 2023 13:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjGSLgu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jul 2023 07:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbjGSLgt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jul 2023 07:36:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2DB2133
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 04:36:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9A1E5615E4
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 11:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A8DC433C8
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 11:36:24 +0000 (UTC)
Message-ID: <c59cff3f-bdba-7f84-74d1-26b37d6cbeeb@xs4all.nl>
Date:   Wed, 19 Jul 2023 13:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.6] Various cec fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Even though two of the patches have a Fixes tag, there is nothing here that
is important for 6.5.

Regards,

	Hans

The following changes since commit 28999781d15f94046e6c23a9a7d92ad28a436abf:

  media: i2c: ov01a10: Switch back to use struct i2c_driver::probe (2023-07-19 12:57:51 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.6b

for you to fetch changes up to 0009a07acd07ee6231b731fc3030e3bbc450bee6:

  cec-pin: only enable interrupts when monitoring the CEC pin (2023-07-19 13:15:37 +0200)

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
