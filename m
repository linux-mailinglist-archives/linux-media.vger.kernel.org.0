Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 188D26E220F
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbjDNL2A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjDNL1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:27:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18705B93
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:27:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 93253646D9
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 11:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70210C4339C;
        Fri, 14 Apr 2023 11:27:52 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 08/18] media: common: saa7146: fix broken V4L2_PIX_FMT_YUV422P support
Date:   Fri, 14 Apr 2023 13:27:32 +0200
Message-Id: <20230414112742.27749-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
References: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
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

The U and V components were swapped. Drop the FORMAT_BYTE_SWAP
to fix this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index dd0d803c38cd..bc4e8d12873b 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -51,7 +51,7 @@ static struct saa7146_format formats[] = {
 		.pixelformat	= V4L2_PIX_FMT_YUV422P,
 		.trans		= YUV422_DECOMPOSED,
 		.depth		= 16,
-		.flags		= FORMAT_BYTE_SWAP|FORMAT_IS_PLANAR,
+		.flags		= FORMAT_IS_PLANAR,
 	}, {
 		.pixelformat	= V4L2_PIX_FMT_YVU420,
 		.trans		= YUV420_DECOMPOSED,
-- 
2.39.2

