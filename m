Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53D745D010
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 23:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344454AbhKXW2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 17:28:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344009AbhKXW2m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 17:28:42 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1F7C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 14:25:31 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id w1so16943391edc.6
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 14:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OM+Bt0jurGFJx99me/ntkFCi3Kp9bDnkL01v69NNRek=;
        b=hqQ/+qo8arS9AP17amb6Rarjrtm80fbeHcBDx0qqDC7zMoGHz4bxPwBOMTrSG4xg4k
         nwNhMqezSkj4SnwAeoaU70tbnE2pvSnqYU0G46De4xVBB5CTsDPZQFycvCA/YJ5swRJz
         fv4ZJSweVUKMC+d7JEADQjWoHI3lZiYnHBCXBKbMYIQNwr3R8iLechF87Mbj+zi1JUEa
         G97qwH4dbMEA6uQJO5IrG0miOG+QkclNpqEHD2DZvcDyqn9/zsy77TLrG2zOgwCPyVih
         s49ZQpQSWezft9OzD1wu9MTC711ieA6rzagf9klC+uwZxpg3JXpwZAzJM04GvQN7w98f
         r0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OM+Bt0jurGFJx99me/ntkFCi3Kp9bDnkL01v69NNRek=;
        b=xF5ULQUfZe1ijPKt4RcoAICFlsZ4ghiLcSvTgTFA79HIUsQPpvCFVAZAvya0HixJG9
         +hQvpGKrPYRO6UtELAVg3m+JSSRT7hFX3h/ME3Mh5Vq9NzbEuhT/+QD5dW7YKvC3Cak/
         hfrv0SWDXAgyNA9q8rZzPt4zVOxuh9tRPG9hX6tQAASGKznD+qYIuuQh32ME1uFHGpqR
         3HgoeXb+97DCJk5Ltj2239kF558VJSAjWZhZZFL91f2fPISQ0CRVGBHiKAJguO2U4cJr
         HLK+qBSTbMfLBJfgIzvMDM9M0Fm++qfrPx3UbiEuQruENmtaiJmWvsKx52zcwZKl9uU1
         EjCQ==
X-Gm-Message-State: AOAM532AveZjgJq58yN/hShN6ON6xTYv2v8EFDkKnHglUi+qHLbnwxES
        YAymS8SvX/RRqI3V8mFFtncxUUedVQzWNA==
X-Google-Smtp-Source: ABdhPJwn6CYd7h6d4aBmqc7GXEUky6q9og+WHe+no+HLLKpn+8I6LjFrJakJHgbiWSmr62dLxYhiDA==
X-Received: by 2002:a05:6402:5208:: with SMTP id s8mr31179314edd.394.1637792730090;
        Wed, 24 Nov 2021 14:25:30 -0800 (PST)
Received: from localhost.localdomain (hst-208-203.medicom.bg. [84.238.208.203])
        by smtp.gmail.com with ESMTPSA id mp5sm571570ejc.68.2021.11.24.14.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:25:29 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: core: Fix kerneldoc warnings
Date:   Thu, 25 Nov 2021 00:25:12 +0200
Message-Id: <20211124222512.1223462-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Describe missing structure members:

core.h: warning: Function parameter or member
'sys_err_done' not described in 'venus_core'
'fw_min_cnt' not described in 'venus_inst'
'flags' not described in 'venus_inst'
'dpb_ids' not described in 'venus_inst'

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7c3bac01cd49..c3023340d95c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -127,6 +127,7 @@ struct venus_format {
  * @done:	a completion for sync HFI operations
  * @error:	an error returned during last HFI sync operations
  * @sys_error:	an error flag that signal system error event
+ * @sys_err_done: a waitqueue to wait for system error recovery end
  * @core_ops:	the core operations
  * @pm_ops:	a pointer to pm operations
  * @pm_lock:	a lock for PM operations
@@ -346,6 +347,7 @@ enum venus_inst_modes {
  * @width:	current capture width
  * @height:	current capture height
  * @crop:	current crop rectangle
+ * @fw_min_cnt:	 firmware minimum buffer count
  * @out_width:	current output width
  * @out_height:	current output height
  * @colorspace:	current color space
@@ -390,6 +392,8 @@ enum venus_inst_modes {
  * @pic_struct:		bitstream progressive vs interlaced
  * @next_buf_last: a flag to mark next queued capture buffer as last
  * @drain_active:	Drain sequence is in progress
+ * @flags:	bitmask flags describing current instance mode
+ * @dpb_ids:	DPB buffer ID's
  */
 struct venus_inst {
 	struct list_head list;
-- 
2.25.1

