Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 711BB521E00
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 17:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345198AbiEJPWm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 11:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345595AbiEJPUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 11:20:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F1F53B6C
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 08:00:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 944D2B81B89
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 15:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5536C385A6
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 15:00:24 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/7] CEC framework fixes
Date:   Tue, 10 May 2022 17:00:15 +0200
Message-Id: <20220510150022.1787112-1-hverkuil-cisco@xs4all.nl>
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

When testing what happens when randomly configuring and unconfiguring
a CEC adapter, and simultaneously setting an invalidating the physical
address, and starting and stopping monitoring and pin monitoring using
two cec-gpio instances, a whole bunch of race conditions were found.

This patch series addresses them.

Hans Verkuil (7):
  cec-pin: disabling the adapter cannot call kthread_stop
  cec-pin: don't zero work_pin_num_events in adap_enable
  cec-adap.c: don't unconfigure if already unconfigured
  cec-adap.c: stop trying LAs on CEC_TX_STATUS_TIMEOUT
  cec-adap.c: fix is_configuring state
  cec-adap.c: reconfigure if the PA changes during configuration
  cec-adap: drop activate_cnt, use state info instead

 drivers/media/cec/core/cec-adap.c | 188 ++++++++++++++----------------
 drivers/media/cec/core/cec-pin.c  |  57 +++++----
 include/media/cec.h               |   6 +-
 3 files changed, 124 insertions(+), 127 deletions(-)

-- 
2.34.1

