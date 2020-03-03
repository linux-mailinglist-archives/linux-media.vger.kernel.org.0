Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8215177534
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 12:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgCCLVl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 06:21:41 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40451 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727738AbgCCLVl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 06:21:41 -0500
Received: by mail-lf1-f68.google.com with SMTP id p5so2395440lfc.7
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 03:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Z9DWskfrxN510kT2nDFNeo3FmuDfIOSYFWtjcC2Z2io=;
        b=i36hUghTffUCixsQo9U1M7qqxI4DyHCLjJcbrCCgK3PLp1rx+5BoaKXgqtb2oWf9Ay
         GoE50hZqNiwsPWneB/DgeDaBaGV04LDw6f4dfR13FGH5nGT8aq6qDfndQUOrlDIZVTOq
         ukV1ft4K9mGbQRM5vSA/3UdGq4Wfxk8d3gJtwLOPQdujCeo5BccAzY9F9XHA2p3lkH4k
         ceP/TNj7jFb95ZGQMpCIGkLij6HiYYzZQXIRCHSNjeJbh7dxvNUEmhU484V9rgZilhP0
         BpGVWkK3zMNrKzWIbbaRIBTarTqMN1fg1DPsIQR2juujmuZBBmn9umg6OGwT39+0LF9S
         RVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Z9DWskfrxN510kT2nDFNeo3FmuDfIOSYFWtjcC2Z2io=;
        b=TyVbmwJNLxmdkl1fi0dR75t5MWnRkqBqfCwM4yCpeDklTgJ+ksaom9mTOM/zpRE7ca
         bkAQsTfyJffAFL0rr0x0tlzvlNMDw4CFYo74n2WmybrC4SJNkz8RHiygmiPirAQtFitm
         dTBeYW7KTwYXrxSXV/ZTyzmiKzDKUlQ01CJVkqth9vhhq2Z/MzWiGP+OdNSYZcB0umoE
         qPQasoQ2J/UvZ5cKb0EXYXLDqEpZXunrPoTwc1oBxBzvGqaxeO7V/mVrkQ6Sh068ZhZz
         EBqN9xYR/i0GApxp9l4JDT2VFGqMM96/VZAHeoDYXUnPM2b2Xtha2oUsX2zuSMKiNypk
         ckYA==
X-Gm-Message-State: ANhLgQ024OywUqIl0pcO20fQY5zIacFsdE+WI9McDLECf14ou7pYFT7B
        4ClrKncJl3bnjjg1VcU+0kOfj4yuq0g=
X-Google-Smtp-Source: ADFU+vvFFn+cpuj6BsJ/NJdrpMNLLJCzE54Tmg3NRmBx2DuRZFHJenzxJHi2tiCpDkhpQ74vWdgp/Q==
X-Received: by 2002:ac2:4826:: with SMTP id 6mr2539866lft.198.1583234497713;
        Tue, 03 Mar 2020 03:21:37 -0800 (PST)
Received: from localhost.localdomain (212-5-158-124.ip.btc-net.bg. [212.5.158.124])
        by smtp.gmail.com with ESMTPSA id l26sm1499505ljb.84.2020.03.03.03.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 03:21:36 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: vdec: Fix smatch warning in start streaming
Date:   Tue,  3 Mar 2020 13:21:22 +0200
Message-Id: <20200303112122.28703-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This fixes the following smatch warning in the error path:

drivers/media/platform/qcom/venus/vdec.c:968 vdec_start_streaming()
 warn: inconsistent returns 'mutex:&inst->lock'.
  Locked on:   line 952
  Unlocked on: line 963
               line 968

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index f349201c0f0d..4ed2628585a1 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -949,7 +949,7 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	ret = venus_pm_acquire_core(inst);
 	if (ret)
-		return ret;
+		goto error;
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
 		ret = vdec_start_capture(inst);
-- 
2.17.1

