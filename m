Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25AF5522CE2
	for <lists+linux-media@lfdr.de>; Wed, 11 May 2022 09:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234682AbiEKHKv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 May 2022 03:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbiEKHKu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 May 2022 03:10:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D33A1AD9C
        for <linux-media@vger.kernel.org>; Wed, 11 May 2022 00:10:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CAE166175E
        for <linux-media@vger.kernel.org>; Wed, 11 May 2022 07:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10E7C385A7
        for <linux-media@vger.kernel.org>; Wed, 11 May 2022 07:10:44 +0000 (UTC)
Message-ID: <334ab2d5-7de3-b596-077a-26c21b96650c@xs4all.nl>
Date:   Wed, 11 May 2022 09:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.19] Various CEC fixes for 5.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit be938c70e292731f81226917fc214683e66da577:

  media: uvcvideo: Add UVC_GUID_FORMAT_H265 (2022-05-08 07:10:51 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.19i

for you to fetch changes up to f2c6c22d5970b82c47e95352a0980dde34431592:

  cec-adap.c: drop activate_cnt, use state info instead (2022-05-11 08:24:41 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (7):
      cec-pin.c: disabling the adapter cannot call kthread_stop
      cec-pin.c: don't zero work_pin_num_events in adap_enable
      cec-adap.c: don't unconfigure if already unconfigured
      cec-adap.c: stop trying LAs on CEC_TX_STATUS_TIMEOUT
      cec-adap.c: fix is_configuring state
      cec-adap.c: reconfigure if the PA changes during configuration
      cec-adap.c: drop activate_cnt, use state info instead

 drivers/media/cec/core/cec-adap.c | 188 +++++++++++++++++++++++++++++++++++++------------------------------------------
 drivers/media/cec/core/cec-pin.c  |  57 ++++++++++++++----------
 include/media/cec.h               |   6 ++-
 3 files changed, 124 insertions(+), 127 deletions(-)
