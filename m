Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F346867CF33
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 16:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbjAZPHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 10:07:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbjAZPHG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 10:07:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68EA6B99F
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:07:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D7EA6188C
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C61C4339B;
        Thu, 26 Jan 2023 15:07:03 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 04/17] media: dvb-frontends: cxd2880: return 0 instead of 'ret'.
Date:   Thu, 26 Jan 2023 16:06:44 +0100
Message-Id: <20230126150657.367921-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since 'ret' is known to be 0, just return '0'. This fixes two smatch warnings:

cxd2880_tnrdmd.c:2165 cxd2880_tnrdmd_check_internal_cpu_status() warn: missing error code? 'ret'
cxd2880_tnrdmd.c:2169 cxd2880_tnrdmd_check_internal_cpu_status() warn: missing error code? 'ret'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd.c
index 4cf2d7cfd3f5..0a1f3899d72c 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd.c
@@ -2162,11 +2162,11 @@ int cxd2880_tnrdmd_check_internal_cpu_status(struct cxd2880_tnrdmd
 		else
 			*task_completed = 0;
 
-		return ret;
+		return 0;
 	}
 	if (cpu_status != 0) {
 		*task_completed = 0;
-		return ret;
+		return 0;
 	}
 
 	ret = cxd2880_tnrdmd_mon_internal_cpu_status_sub(tnr_dmd, &cpu_status);
-- 
2.39.0

