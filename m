Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFD007BB4DB
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 12:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231698AbjJFKJG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 06:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbjJFKJE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 06:09:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9A9100
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 03:09:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1E9C433C9;
        Fri,  6 Oct 2023 10:09:00 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Subject: [PATCH 6/9] media: qcom: venus: fix incorrect return value
Date:   Fri,  6 Oct 2023 12:08:47 +0200
Message-Id: <aca1fc4a0f8b503e77365bd7d7d06d2dfa2d7d91.1696586632.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
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

'pd' can be NULL, and in that case it shouldn't be passed to
PTR_ERR. Fixes a smatch warning:

drivers/media/platform/qcom/venus/pm_helpers.c:873 vcodec_domains_get() warn: passing zero to 'PTR_ERR'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 48c9084bb4db..a1b127caa90a 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -870,7 +870,7 @@ static int vcodec_domains_get(struct venus_core *core)
 		pd = dev_pm_domain_attach_by_name(dev,
 						  res->vcodec_pmdomains[i]);
 		if (IS_ERR_OR_NULL(pd))
-			return PTR_ERR(pd) ? : -ENODATA;
+			return pd ? PTR_ERR(pd) : -ENODATA;
 		core->pmdomains[i] = pd;
 	}
 
-- 
2.40.1

