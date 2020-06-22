Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C9320368B
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 14:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgFVMQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 08:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbgFVMQJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 08:16:09 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1216C061797
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 05:16:07 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n24so17802090ejd.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 05:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=o/ro2YmLKE6FM1LgS90pHWONDXbjsAavRPCkFKtA03s=;
        b=NP4UNvpq7Uxbc5NBFE80rgGELfOHDtsI0Xk2SNh+FKY3LF7EZoPKpWNh9Q8lkQNQVi
         RnaVYrG+H6Xf1MUvNOKHyMVU4SiS4b1Jj1GMUQW4TmZefePwEBMrbNrrYzKorvpfCUsi
         r241VlNH+JLY9T+RqnGrwF4LdTvZVZh6vi+nvvg/ffBUxY0hSndxnTFcVzhh0PaC2dm7
         Ts6Q8yXGInXa0wQR6gD21WbiHZm2HuYecRRq3yPD425fZURj6FU8OI8CA9wBBE0OQ13S
         9thLoTAEVAQXx0FBf/vuDImJktf+5evv/EoXqqxsLzy72BuiDta4GRtDs1lhATCjgkiZ
         xjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=o/ro2YmLKE6FM1LgS90pHWONDXbjsAavRPCkFKtA03s=;
        b=qSh1pXw0eZi5HzTa/ib62Ahxc7vPrQV97P5hLx0JMscXHW1PHLX3X0+bU32bpgKT3h
         dKNWNvdr8ADFQpXQM8lzXnzCDiY263NUOA9IUnjPr2Zd2O1CBo4LyCaNrC5GW0yQwm6k
         9AAayC7OXskAh2MXaeSkV0qJ79irJeQNKNIw9ad819yANacVFtMzESbuiQofRtMD8Y0z
         df6N8iIE1Jvjzw9cQBMpuCFT2HYdb8YGBjH6fXNfdHnAkKZuUxkvXC1APAt6HUeSRHZu
         WDA91L+lPjWiPN3VVUfiUTPeZX3StxZ+n/Yi7k6yojvu1x7aRz4oLy3W1J7FJUkzmBP7
         tl1w==
X-Gm-Message-State: AOAM533drWumfea9gL+3XhoZlkBO26T3InNb4lDvvKinCqAlOG24gDjM
        Gn5LKMn8r/1UVemXHfnm0vS7WJAwsWLDZg==
X-Google-Smtp-Source: ABdhPJxt8NMIIKopS3nj+aVADQxXOK9EER2n4UrtIrDoBU2g6DLdTa7cqzPgBvQcCBoTW72bgrkmCQ==
X-Received: by 2002:a17:907:209b:: with SMTP id pv27mr9071317ejb.501.1592828166101;
        Mon, 22 Jun 2020 05:16:06 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-237.ip.btc-net.bg. [212.5.158.237])
        by smtp.gmail.com with ESMTPSA id q21sm11228417ejd.30.2020.06.22.05.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 05:16:05 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     dianders@chromium.org, mansur@codeaurora.org,
        stable@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3] venus: fix multiple encoder crash
Date:   Mon, 22 Jun 2020 15:15:48 +0300
Message-Id: <20200622121548.27882-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mansur Alisha Shaik <mansur@codeaurora.org>

Currently we are considering the instances which are available
in core->inst list for load calculation in min_loaded_core()
function, but this is incorrect because by the time we call
decide_core() for second instance, the third instance not
filled yet codec_freq_data pointer.

Solve this by considering the instances whose session has started.

Cc: stable@vger.kernel.org # v5.7+
Fixes: 4ebf969375bc ("media: venus: introduce core selection")
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---

v3: Cc stable and add Fixes tag.

 drivers/media/platform/qcom/venus/pm_helpers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index abf93158857b..531e7a41658f 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -496,6 +496,10 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load)
 	list_for_each_entry(inst_pos, &core->instances, list) {
 		if (inst_pos == inst)
 			continue;
+
+		if (inst_pos->state != INST_START)
+			continue;
+
 		vpp_freq = inst_pos->clk_data.codec_freq_data->vpp_freq;
 		coreid = inst_pos->clk_data.core_id;
 
-- 
2.17.1

