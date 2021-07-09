Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3183C2396
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 14:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbhGIMm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 08:42:27 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:35444
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231252AbhGIMm0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Jul 2021 08:42:26 -0400
X-Greylist: delayed 557 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Jul 2021 08:42:26 EDT
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 9E669401BE;
        Fri,  9 Jul 2021 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1625833825;
        bh=7DIMw7gcT9RZtVRuhmo1ekcgPYs2ZhAhj5BeekhHQlA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=XAzVQQPLTZ8Dpwm2dBhXdyuzdwjTpLdLOt56pTkg53wNNoYfJtgUi4ibX2ZnadA57
         TS5hWfdWx0EY8/15NhWFtyZPidkLhjNTMXZXBaFHvqhNmMjY0lDThzCqKJ5JkjTZaE
         fLFyjGxu3zT2KNUOoIq3pvIlQwV2UBGwlDf85jR+xb5S8nJBCk3Bb9d0gDq76APW9r
         THueWmF9wCcImJ23Sgq78nVTIWsTgVbzckChU7q5U9YlZ08JuATp9TVJvN4nRpEOkk
         zHVXdWUxuCH/+VW9NpjIDFIBAKnQCQk687JKmMNkJtfq1CcWYgB7Eqcex8V9dNte0P
         FunWrlDcdbHbw==
From:   Colin King <colin.king@canonical.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: venus: venc: Fix potential null pointer dereference on pointer fmt
Date:   Fri,  9 Jul 2021 13:30:25 +0100
Message-Id: <20210709123025.456006-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the call to find_format can potentially return a NULL to
fmt and the nullpointer is later dereferenced on the assignment of
pixmp->num_planes = fmt->num_planes.  Fix this by adding a NULL pointer
check and returning NULL for the failure case.

Addresses-Coverity: ("Dereference null return")
Fixes: aaaa93eda64b ("[media] media: venus: venc: add video encoder files")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/qcom/venus/venc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 8dd49d4f124c..1d62e38065d6 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -183,6 +183,8 @@ venc_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
 		else
 			return NULL;
 		fmt = find_format(inst, pixmp->pixelformat, f->type);
+		if (!fmt)
+			return NULL;
 	}
 
 	pixmp->width = clamp(pixmp->width, frame_width_min(inst),
-- 
2.31.1

