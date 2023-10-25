Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 685537D6895
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 12:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234781AbjJYKdP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 06:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234404AbjJYKdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 06:33:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0460993
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 03:33:13 -0700 (PDT)
Received: from umang.jain (unknown [103.251.226.9])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19FF5EF2;
        Wed, 25 Oct 2023 12:32:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698229980;
        bh=lN/b6aBQlp0QJ2/bKG+wfQaYXsqIJPtPWZLmBnXQuiI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DOn2lz3WYp55/+mOCeR5fxgCT8m4Wo34DWUe5MsErrp552yrvALfsTb82mD826qmy
         QbaD3Vn+Kq9hAZdH0urr6LRzGFYF25nDWkKEGiSBdJbCQpawJILIPTqmbkGypLzCOq
         GldqMDWPDOH4IOV3vsZ2PegQBTkigPHW4Me/Xw2A=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 2/2] staging: vc04_services: Drop completed TODO item
Date:   Wed, 25 Oct 2023 06:33:00 -0400
Message-ID: <20231025103300.340572-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025103300.340572-1-umang.jain@ideasonboard.com>
References: <20231025103300.340572-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Memory barries and remote_event_*() are documented.
Drop the TODO item related to them.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 9c79ed549831..2d51f6928e0f 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -33,13 +33,6 @@ such as dev_info, dev_dbg, and friends.
 A short top-down description of this driver's architecture (function of
 kthreads, userspace, limitations) could be very helpful for reviewers.
 
-* Review and comment memory barriers
-
-There is a heavy use of memory barriers in this driver, it would be very
-beneficial to go over all of them and, if correct, comment on their merits.
-Extra points to whomever confidently reviews the remote_event_*() family of
-functions.
-
 * Reformat core code with more sane indentations
 
 The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
-- 
2.41.0

