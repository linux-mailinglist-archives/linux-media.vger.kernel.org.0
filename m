Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8C04F6198
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 16:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbiDFOg1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Apr 2022 10:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235216AbiDFOgQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Apr 2022 10:36:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D73F3BE60B
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 04:00:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CF7FFB81E4F
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 11:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E04C385A1
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 11:00:41 +0000 (UTC)
Message-ID: <3f54b8d2-9c26-1775-0cc9-688a677776eb@xs4all.nl>
Date:   Wed, 6 Apr 2022 13:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.19] cec: various fixes and enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The first two patches fix issues relating to a CEC adapter
being disabled while a transmit is still in progress at the
hardware level. Unless the hardware is really disabled (i.e.
loses power) the transmit should just continue in order to
keep the hardware and framework state in sync, and to avoid
half-written messages on the bus.

The third patch fixes a mismatch between the API documentation
and the actual code w.r.t. reporting the results of a non-blocking
transmit.

The fourth patch adds helpers to make it easier for both drivers
and userspace to detect if the received message contains the
result of a non-blocking transmit.

The fifth patch makes the framework more robust, preventing ops
from being called when the device is already unregistered.

The sixth patch allows drivers to override the transmit timeout
value. And the last patch adds a new callback so drivers can take
actual when an adapter is fully configured (i.e. all logical addresses
are claimed) or unconfigured.

Regards,

	Hans


The following changes since commit 535f49a9e1f99d0bacb5d492a9dd193c3affbfc0:

  media: platform: imx-mipi-csis: Add dependency on VIDEO_DEV (2022-04-05 16:12:30 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.19b

for you to fetch changes up to 7ebdf1f2e7b92536eb3ea7595a051057eec9ef1b:

  cec: add optional adap_configured callback (2022-04-06 10:31:05 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (7):
      cec: call enable_adap on s_log_addrs
      cec: abort if the current transmit was canceled
      cec: correctly pass on reply results
      cec.h: add cec_msg_recv_is_rx/tx_result helpers
      cec: use call_op and check for !unregistered
      cec: add xfer_timeout_ms field
      cec: add optional adap_configured callback

 Documentation/driver-api/media/cec-core.rst |  13 +++-
 drivers/media/cec/core/cec-adap.c           | 282 +++++++++++++++++++++++++++++++++++++++++++------------------------
 drivers/media/cec/core/cec-api.c            |  24 ++----
 drivers/media/cec/core/cec-core.c           |  18 ++++-
 drivers/media/cec/core/cec-pin-priv.h       |  11 +++
 drivers/media/cec/core/cec-pin.c            |  23 +++---
 drivers/media/cec/core/cec-priv.h           |  10 +++
 include/media/cec.h                         |  12 +++
 include/uapi/linux/cec.h                    |  20 +++++
 9 files changed, 278 insertions(+), 135 deletions(-)
