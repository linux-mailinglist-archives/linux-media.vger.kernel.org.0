Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 768544F12F6
	for <lists+linux-media@lfdr.de>; Mon,  4 Apr 2022 12:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356978AbiDDKUO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Apr 2022 06:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242628AbiDDKUN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Apr 2022 06:20:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B3473C709
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 03:18:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2F0E9B80EA0
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 10:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCD1C2BBE4
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 10:18:13 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCHv4 0/7] cec: various fixes and enhancements
Date:   Mon,  4 Apr 2022 12:18:04 +0200
Message-Id: <20220404101811.3359944-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
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

The last two patches add new features that are needed for an
out-of-tree CEC driver:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=extron

This is still work in progress, so these patches will probably
be included in the submission of that driver.

Regards,

	Hans

Changes since v3:

- updated patch 2/7: if the adapter is disabled, then any
  ongoing transmit must be canceled. The hardware goes away,
  so the transmit really has to be aborted.

Changes since v2:

- added "cec: use call_op and check for !unregistered"

Changes since v1:

- replace bool by int in the public cec.h header for the new
  helper functions
- rework "cec: call enable_adap on s_log_addrs": it did not take
  monitoring into account (while monitoring the CEC adapter has
  to be enabled, even when unconfigured) and the needs_hpd case
  wasn't handled quite right either.

Hans Verkuil (7):
  cec: call enable_adap on s_log_addrs
  cec: abort if the current transmit was canceled
  cec: correctly pass on reply results
  cec.h: add cec_msg_recv_is_rx/tx_result helpers
  cec: use call_op and check for !unregistered
  cec: add xfer_timeout_ms field
  cec: add optional adap_configured callback

 Documentation/driver-api/media/cec-core.rst |  13 +-
 drivers/media/cec/core/cec-adap.c           | 282 +++++++++++++-------
 drivers/media/cec/core/cec-api.c            |  24 +-
 drivers/media/cec/core/cec-core.c           |  18 +-
 drivers/media/cec/core/cec-pin-priv.h       |  11 +
 drivers/media/cec/core/cec-pin.c            |  23 +-
 drivers/media/cec/core/cec-priv.h           |  10 +
 include/media/cec.h                         |  12 +
 include/uapi/linux/cec.h                    |  20 ++
 9 files changed, 278 insertions(+), 135 deletions(-)

-- 
2.34.1

