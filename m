Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA8C54F371
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 10:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381359AbiFQIp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 04:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381413AbiFQIpj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 04:45:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3716A04B
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 01:45:28 -0700 (PDT)
Received: from tatooine.ideasonboard.com (unknown [IPv6:2a01:e0a:169:7140:28e5:dce:57ec:634e])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 222652A5;
        Fri, 17 Jun 2022 10:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655455527;
        bh=8fGsXJySfx/20YC9EMkhXuZx3a5LAzX5aBaucimZ4O4=;
        h=From:To:Cc:Subject:Date:From;
        b=FkLEWcn7W7/rKihafHx5k7MykmYd1qckMTQLNKQfjF4MoN1/G5FHRcTJjlPAY26GF
         K83F5YFwsm8cMJKuuoi9xvcvilsF445W+DMlqG2MOjUJHzHDwxgv9VjO5K+abGaC1e
         knoO74kJgMlI5ZwUJBrmDHRondp6Yohe+krFcvhk=
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, laurent.pinchart@ideasonboard.com,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: [PATCH] media: staging: ipu3-imgu: Fix BNR wb gain documentation
Date:   Fri, 17 Jun 2022 10:45:19 +0200
Message-Id: <20220617084519.32129-1-jeanmichel.hautbois@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

The documentation states that the BNR factor is a multiplier coded as
u3.13 and with a range of (0, 8). This is not correct, as the isp is
adding 1.0 to the gain applied, ie Pout = { Pin * (1 + Gx) }.

It means that a gain of 1.0 should be coded as 0.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
---
 drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index dbdd015ce220..caa358e0bae4 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -626,8 +626,11 @@ struct ipu3_uapi_stats_3a {
  * @b:	white balance gain for B channel.
  * @gb:	white balance gain for Gb channel.
  *
- * Precision u3.13, range [0, 8). White balance correction is done by applying
- * a multiplicative gain to each color channels prior to BNR.
+ * For BNR parameters WB gain factor for the three channels [Ggr, Ggb, Gb, Gr].
+ * Their precision is U3.13 and the range is (0, 8) and the actual gain is
+ * Gx + 1, it is typically Gx = 1.
+ *
+ * Pout = {Pin * (1 + Gx)}.
  */
 struct ipu3_uapi_bnr_static_config_wb_gains_config {
 	__u16 gr;
-- 
2.34.1

