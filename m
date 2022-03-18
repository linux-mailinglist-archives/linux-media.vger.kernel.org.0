Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD4A84DD9A6
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 13:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236157AbiCRMUQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 08:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236180AbiCRMUO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 08:20:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82819129246
        for <linux-media@vger.kernel.org>; Fri, 18 Mar 2022 05:18:50 -0700 (PDT)
Received: from perceval.ideasonboard.com (unknown [103.251.226.137])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88AA3EE;
        Fri, 18 Mar 2022 13:18:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647605928;
        bh=XP7aULoA2tQrmCCRBmDld8u5TjF7Spl85xESGlZNnZk=;
        h=From:To:Cc:Subject:Date:From;
        b=bLIQiKDxdltNKEoQGBLzjP5EQg43t1w7k8WqUKVGZpkiKn6opDztQbzELo03fdN1X
         Xa+uJeuzJxc0wv018Fe36aOUXSNoKttkGK23GT+hmOii9JesE+VMk7GT1q6pvj+x4n
         rQIsWh12ZYEN83lKHFJ8tCATqq9xwKTp5ErW3B38=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        libcamera-devel@lists.libcamera.org,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/2] media: ipu3: Sequence number fix and improvements
Date:   Fri, 18 Mar 2022 17:48:24 +0530
Message-Id: <20220318121826.877187-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The patch (1/2) fixes the issue where sequence number of buffers keep
on incrementing during consecutive stream on/off cycles. The sequence
number should be reset to 0, on every stream (re)start.

Patch 2/2 is a just a drive-by patch while exploring ipu3-imgu driver
codebase.

Umang Jain (2):
  media: staging/intel-ipu3: Reset imgu_video_device sequence
  media: staging/intel-ipu3: Cleanup dummy buffers via helper

 drivers/staging/media/ipu3/ipu3-v4l2.c |  1 +
 drivers/staging/media/ipu3/ipu3.c      | 25 +++++++++++--------------
 2 files changed, 12 insertions(+), 14 deletions(-)

-- 
2.31.1

