Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1295E571788
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 12:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbiGLKrV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 06:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiGLKrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 06:47:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1539DADD6A
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 03:47:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D08D7B817B9
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 10:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0719DC3411C;
        Tue, 12 Jul 2022 10:47:16 +0000 (UTC)
Message-ID: <d9184cd6-6cef-0df4-5247-8119d7bdb25b@xs4all.nl>
Date:   Tue, 12 Jul 2022 12:47:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2] media: venus: venus_helper_get_bufreq(): req is never NULL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a smatch error:

drivers/media/platform/qcom/venus/helpers.c: drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)

After checking how venus_helper_get_bufreq() is called it is clear that
req is never NULL, so just drop the checks.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/qcom/venus/helpers.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 5c1104379c49..60de4200375d 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -671,8 +671,7 @@ int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
 	unsigned int i;
 	int ret;
 
-	if (req)
-		memset(req, 0, sizeof(*req));
+	memset(req, 0, sizeof(*req));
 
 	if (type == HFI_BUFFER_OUTPUT || type == HFI_BUFFER_OUTPUT2)
 		req->count_min = inst->fw_min_cnt;
@@ -694,8 +693,7 @@ int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
 		if (hprop.bufreq[i].type != type)
 			continue;
 
-		if (req)
-			memcpy(req, &hprop.bufreq[i], sizeof(*req));
+		memcpy(req, &hprop.bufreq[i], sizeof(*req));
 		ret = 0;
 		break;
 	}
-- 
2.35.1

