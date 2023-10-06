Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F01F7BB4D6
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 12:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbjJFKI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 06:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231717AbjJFKI4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 06:08:56 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD4AFD
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 03:08:53 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF61C433C9
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 10:08:52 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/9] media: fix smatch warnings
Date:   Fri,  6 Oct 2023 12:08:41 +0200
Message-Id: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series fixes various smatch warnings. The build scripts
didn't call smatch with the -p=kernel option, so some warnings
were disabled. After fixing that new warnings appeared that are
fixed in this series.

A few warnings remain for false positives that would be very
painful to fix, and those are filtered by the build script so
that they don't pollute the output.

Note that the adp1653 patch is a v2 of the first attempt:

https://patchwork.linuxtv.org/project/linux-media/patch/da55b552-08ce-6bbe-c70b-eda6f53727f0@xs4all.nl/

I incorporated Sakari's suggestions in the v2.

Regards,

	Hans

Hans Verkuil (9):
  staging: media: atomisp: drop check for reentrant .s_stream()
  media: i2c: adp1653: don't reuse the same node pointer
  staging: media: atomisp: improve unwinding
  media: dvb-usb-v2: af9035: fix missing unlock
  media: nxp: imx-jpeg: use goto instead of return
  media: qcom: venus: fix incorrect return value
  media: i2c: tc358746: check fmt validity
  media: i2c: mt9m114: goto proper error path
  media: pci: mgb4: fix potential spectre vulnerability

 drivers/media/i2c/adp1653.c                   | 28 ++++++++++---------
 drivers/media/i2c/mt9m114.c                   |  4 +--
 drivers/media/i2c/tc358746.c                  |  6 +++-
 drivers/media/pci/mgb4/mgb4_sysfs_out.c       |  5 +++-
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    |  2 +-
 .../media/platform/qcom/venus/pm_helpers.c    |  2 +-
 drivers/media/usb/dvb-usb-v2/af9035.c         | 13 ++++++---
 .../media/atomisp/i2c/atomisp-gc0310.c        |  6 ----
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 18 ++++++++----
 9 files changed, 49 insertions(+), 35 deletions(-)

-- 
2.40.1

