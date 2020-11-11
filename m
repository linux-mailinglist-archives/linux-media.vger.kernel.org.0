Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D6A2AF3D9
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 15:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgKKOkU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 09:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbgKKOie (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 09:38:34 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364B9C061A4C
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 06:38:29 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id p8so2760530wrx.5
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 06:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2CVxiw78RvuEwO3JJMPL80Z3ql7fTAJblZZgActuTxc=;
        b=GnjXvNlHccEzofSPCStx3HQZTpOGU9JVteupoMiWdOT7dr0PNDBfdvXpyggaGk9Qmj
         xLs+EmoFXmagv5kyKvDL+eCltQJBGxRTSxKsqyjW51wE8GCj8Nqlmni7ziIgF+4uQHCo
         elNLwXhQJa/CrMhLSHNY+pJc3UINTByhv6tiU+81lrtzWbsyVolO8QbFQafwaPnlI7fp
         RXDAuV5tLxFog2a63wkAk4hgCQqDddb8Q2Dtj4ggKKu6diUbSRE/kpYV1IYd6ShmA86k
         QAO13s0JvSL58opvp7GVWl7xQIbRJ6zZ3g9cDuAkrL3W8apbqertuGQZUFwQERhvWSGU
         TCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2CVxiw78RvuEwO3JJMPL80Z3ql7fTAJblZZgActuTxc=;
        b=EXxVflrzJY/Ljy+uAHzA79/zyWZ99rcVZhBkXEuULMYegk1CODrTbNwbk641xf6uLO
         +6Y8r1X8+kKo9H3IawJmnug6HXO7WBuc2g9ySBtkqrBcepOc6ncTXegaKcItB/VUcXPc
         eck5ob+j84Wm8gCRCECN95Qxw9icdHFt/y5pTKOMD2TluTVzELO5PxaJBLcyahhXy9c3
         3a8PkOcH6V/Os77euBauoqBtBK90trVEyGFk38rOjKhGA2ulEMcrV/TwB6R1h6dOAPFs
         odQG0VUt9vJIZ+ljs4t0v4V6X13AKA4WqZmd3EG+gLmtsaT3yl/MXXJNM97BToghS6XS
         kJrA==
X-Gm-Message-State: AOAM531Yw2aTHQYAwpfFmIUaIJwq3w76lkPAv2VJbndH7nrtvUKnwUM4
        293s0W5aRnx+DlsF/ZxHQ7EI8wEVieqYDXVi
X-Google-Smtp-Source: ABdhPJzgjpuQevq0D98kNNwBGspcXhVbH+57+WmmTaTWnZpt8ijERz1XuF3zP4/d5nVBNug9DDgoBw==
X-Received: by 2002:a5d:4883:: with SMTP id g3mr30509001wrq.19.1605105507679;
        Wed, 11 Nov 2020 06:38:27 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id b8sm2991405wrv.57.2020.11.11.06.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 06:38:27 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 3/8] venus: hfi_cmds: Allow null buffer address on encoder input
Date:   Wed, 11 Nov 2020 16:37:50 +0200
Message-Id: <20201111143755.24541-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allow null buffer address for encoder input buffers. This will
be used to send null input buffers to signal end-of-stream.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 4f7565834469..2affaa2ed70f 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -278,7 +278,7 @@ int pkt_session_etb_encoder(
 		struct hfi_session_empty_buffer_uncompressed_plane0_pkt *pkt,
 		void *cookie, struct hfi_frame_data *in_frame)
 {
-	if (!cookie || !in_frame->device_addr)
+	if (!cookie)
 		return -EINVAL;
 
 	pkt->shdr.hdr.size = sizeof(*pkt);
-- 
2.17.1

