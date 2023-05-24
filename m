Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0F0A70F5F4
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 14:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbjEXMMF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 08:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbjEXMMB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 08:12:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478F495
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 05:12:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 25CE063C96
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 12:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29D7C4339C;
        Wed, 24 May 2023 12:11:58 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH 6/8] media: mediatek: vpu: add missing clk_unprepare
Date:   Wed, 24 May 2023 14:11:48 +0200
Message-Id: <20230524121150.435736-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
References: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If vpu_clock_enable() fails, then call clk_unprepare().

This fixes this smatch warning:

drivers/media/platform/mediatek/vpu/mtk_vpu.c:1031 mtk_vpu_resume() warn: 'vpu->clk' from clk_prepare() not released on lines: 1020.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 1a95958a1f90..4c8f5296d120 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -1018,6 +1018,7 @@ static int mtk_vpu_resume(struct device *dev)
 	clk_prepare(vpu->clk);
 	ret = vpu_clock_enable(vpu);
 	if (ret) {
+		clk_unprepare(vpu->clk);
 		dev_err(dev, "failed to enable vpu clock\n");
 		return ret;
 	}
-- 
2.39.2

