Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6D559C57
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 15:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfF1NAf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 09:00:35 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34087 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbfF1NAd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 09:00:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id k11so6231387wrl.1
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 06:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VYK6CuTcwUpXBzrv+57CELDw4v8ANQ9M8j2TEI8QevU=;
        b=OIaKx5bzcFJ9iQHFSo+vkoZWC/Js1VgIC5YdEtJwkq7wImjmgHDI3Uzb744irl1vpQ
         lSddEYDCwDSh34+o4ro84ykmsc9xLCAayQqTNUgOTO6rqSUotym41jym5H/msjWYLD3l
         kJHcPqhpcmB23hEAcomtgsmv89peFjdasBXG9H3Ajmt1aENoGFFc/V1RnUzHCoNTR9fD
         zBO62HZL75a3W5rtJ785/KdQG9CPnx03rCAAk525/vZK4LHr+b/HBGU+7E4EQS6GZ8R9
         LjE0IN3KSd4yjsSa1QhUIwN74CjyczAOVlT/xu/Pih7CgJTXqMyMKTQkZw5htQgLQLLY
         QuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VYK6CuTcwUpXBzrv+57CELDw4v8ANQ9M8j2TEI8QevU=;
        b=HdVq0Q1PoxkD3rFsUM4EqDIHEv/a4dvU4/7QYhPb3JMbW+TcR131tL1vgww6f+2Fjz
         3/4kx2+J+NltnuEV3q2T/rWwMhlAnSfJOfUIK32MXP1bIfOohWt8RQvtlyllPXgCcn5c
         gk0eJ0SRkc5orEMQsFOyuoYUm55KLxsYz+Nm2dAvAThOkj4jjAlYsWnCoK/lRnr1JaTP
         azM2azg17HmrovGoArYWtVsSHNnM/n72wCt7qvdwGfoHq8pmH33ERLki8FtppKOF3HZS
         gpCmIiFhxN7gwNN8D1jyu96ySqpjOFQNgqTlLdJI6U2FLQ6zhn6r2dz/J75ohUXEGJd5
         CyKw==
X-Gm-Message-State: APjAAAWWK9IHjRnX26z8HKFGG0bpy1WUvyC8sSYGCNq05xGO7N4VPJG5
        0kHu13TPgs4HKDsRfNM4/B2LonAC05M=
X-Google-Smtp-Source: APXvYqxPm7/w3dC2Be75DCjYjTGgOTR+ITso4/oe/Ozp4FTCj2vyklT8/WnkYPF9RrqfphHcRujieQ==
X-Received: by 2002:adf:ee03:: with SMTP id y3mr3958702wrn.128.1561726831149;
        Fri, 28 Jun 2019 06:00:31 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id w20sm3717174wra.96.2019.06.28.06.00.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 06:00:30 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 04/11] venus: hfi: export few HFI functions
Date:   Fri, 28 Jun 2019 15:59:55 +0300
Message-Id: <20190628130002.24293-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Export few HFI functions to use them from decoder to implement
more granular control needed for stateful Codec API compliance.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index 7c5bf5cb32de..82eb889ab541 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -276,6 +276,7 @@ int hfi_session_start(struct venus_inst *inst)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(hfi_session_start);
 
 int hfi_session_stop(struct venus_inst *inst)
 {
@@ -299,6 +300,7 @@ int hfi_session_stop(struct venus_inst *inst)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(hfi_session_stop);
 
 int hfi_session_continue(struct venus_inst *inst)
 {
@@ -328,6 +330,7 @@ int hfi_session_abort(struct venus_inst *inst)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(hfi_session_abort);
 
 int hfi_session_load_res(struct venus_inst *inst)
 {
@@ -374,6 +377,7 @@ int hfi_session_unload_res(struct venus_inst *inst)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(hfi_session_unload_res);
 
 int hfi_session_flush(struct venus_inst *inst, u32 type)
 {
-- 
2.17.1

