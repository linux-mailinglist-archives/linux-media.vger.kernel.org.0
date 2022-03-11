Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAC44D5F6A
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 11:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239701AbiCKK03 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 05:26:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237406AbiCKK02 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 05:26:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58D660DBF
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 02:25:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5531761526
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 10:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB5CC340E9
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 10:25:24 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCHv2 0/6] cec: various fixes and enhancements
Date:   Fri, 11 Mar 2022 11:25:16 +0100
Message-Id: <20220311102522.1991113-1-hverkuil-cisco@xs4all.nl>
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

The last two patches add new features that are needed for an
out-of-tree CEC driver:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=extron

This is still work in progress, so these patches will probably
be included in the submission of that driver.

Regards,

	Hans

Changes since v1:

- replace bool by int in the public cec.h header for the new
  helper functions
- rework "cec: call enable_adap on s_log_addrs": it did not take
  monitoring into account (while monitoring the CEC adapter has
  to be enabled, even when unconfigured) and the needs_hpd case
  wasn't handled quite right either.

Hans Verkuil (6):
  cec: call enable_adap on s_log_addrs
  cec: abort if the current transmit was canceled
  cec: correctly pass on reply results
  cec.h: add cec_msg_recv_is_rx/tx_result helpers
  cec: add xfer_timeout_ms field
  cec: add optional adap_configured callback

 Documentation/driver-api/media/cec-core.rst |  13 +-
 drivers/media/cec/core/cec-adap.c           | 252 +++++++++++++-------
 drivers/media/cec/core/cec-api.c            |  18 +-
 drivers/media/cec/core/cec-core.c           |  14 ++
 include/media/cec.h                         |  12 +
 include/uapi/linux/cec.h                    |  20 ++
 6 files changed, 230 insertions(+), 99 deletions(-)

-- 
2.34.1

