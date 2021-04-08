Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C07CF357D77
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 09:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhDHHkY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 03:40:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:53598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229552AbhDHHkT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 03:40:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55E876112F;
        Thu,  8 Apr 2021 07:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617867608;
        bh=y57fIwlyMrn2CnQYSm8siNOcNXcLbOUgCH/0pOaQr5c=;
        h=From:To:Cc:Subject:Date:From;
        b=Skr3M7CHSEt0MCeIVZsPTDsIVgN2tRvFikbyxlnePxaMmV2vezyo93lEUf97RXt6Z
         T394i9HSWZ6uL82Dh9kuM0USz+Ws2rNfQZrTAy0w8taPqnBqVOgqfQA+M3hnvfX/Ew
         /r9YqOhco2mDoLQKxibdpSzfLkJJE0JOY+tfYaBDsgQcU/YxkNr+Y5tnOgFM37Ze2D
         rSW2r3p4xLvuyd+zNe1ON1uVSJXAU+5CdMJbJfmCVKTG5Z76w+I4iVHqQb+vjE4aVD
         zTIvU2i5dABRKl8lJgkv85LqZBx8aAM3nR/fRLR1nnmETrBf8EVT8myxjLnx9bk092
         OC8403Xt84nHQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lUPGn-000jTx-UH; Thu, 08 Apr 2021 09:40:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 1/3] media: venus: use NULL instead of zero for pointers
Date:   Thu,  8 Apr 2021 09:40:02 +0200
Message-Id: <b6f139947e93fec1ade5faf3517dfb2b3b9bcd41.1617867599.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As reported by sparse:

	drivers/media/platform/qcom/venus/core.c:227:41: warning: Using plain integer as NULL pointer
	drivers/media/platform/qcom/venus/core.c:228:34: warning: Using plain integer as NULL pointer

Two vars are using zero instead of NULL for pointers. Not really
an issue, but using NULL makes it clearer that the init data is
expecting a pointer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/qcom/venus/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index f5b88b96f5f7..4451e3c11bc0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -224,8 +224,8 @@ static void venus_assign_register_offsets(struct venus_core *core)
 		core->cpu_cs_base = core->base + CPU_CS_BASE;
 		core->cpu_ic_base = core->base + CPU_IC_BASE;
 		core->wrapper_base = core->base + WRAPPER_BASE;
-		core->wrapper_tz_base = 0;
-		core->aon_base = 0;
+		core->wrapper_tz_base = NULL;
+		core->aon_base = NULL;
 	}
 }
 
-- 
2.30.2

