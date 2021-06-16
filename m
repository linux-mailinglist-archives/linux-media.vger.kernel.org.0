Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1124E3AA251
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 19:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhFPRW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 13:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhFPRWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 13:22:25 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF41C061574
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 10:20:19 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso3972593pjx.1
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 10:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yXf5GGb1e+m6tN1Pfs1rS1mDflyfBHLvMWVyhgwSuCw=;
        b=l6ovhOfA/SMa6lAEHjMrtxr3BNwGae53dw5e7zMxh+0queOIxWphGDcwX3jpYdIzwH
         Mw+JfrSmTlfuwQslLNMLVI8OKhc8iootFcytToc/FJ2S2RvGMv3vncRr/q42gBL8tl5S
         GgRKPF/m10kDBkQR1RgkDw3rJJWFU5CgQ2G85+Coe16bS3JMacC4aP1E/3qlXbSz8AyV
         WKenT7ZQGH8QK8UYFYpYx0wMjNSfZ0iu8TpiOqy6yoCGR+fjzvAJGCU86D70WOUc6y7X
         Hf0uiWYjktSe80sBSE/BIAsjTV53vbhwh8rd7+Gfr+Yyzsthrdnzciz9RFbtjpLYOInz
         5bYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yXf5GGb1e+m6tN1Pfs1rS1mDflyfBHLvMWVyhgwSuCw=;
        b=TMtUxCln8Nf2X5HRIyg9bApEDvweqw7qz3DYQQgasVVR1LeyRveYqtvE2MJ5gpJY68
         h8uhzKqA+7nzC09PphywW+ANABEtIV8DGeJYu1qBOs3xdjKxUbCcuAxUfzesPErk/Pay
         ei1oF89cYCykOFLMVvQm58Xzani3RaTOqXsDDS2SnLCi9tgBXIvQm3Yg8+nV8qRJA0W6
         FQoAuNxj2rGSY56asa9AVClPw74zN3wP8FZPYYoWQ72vfPo52xN+TuMCafDO/JhQTDAN
         +uOwcahKd1McNuvwG2fuKsgBmy9blVCzJqaaX9k1La43bYBDaQFHLR/4vHgX5lKwA1kL
         imgg==
X-Gm-Message-State: AOAM5300P9JUVWAAS7ABXsGjIrg/NYYQtkTao/dhNifWcWm8yW8YJGe5
        9kJfe/3WQRsaHDgtg00tO1Hia7joRHTLiw==
X-Google-Smtp-Source: ABdhPJz6wESLZ22bTondiTvWp7uGmts5Anno6zXjvayc9DM9Stph9mPINTIO30kly31N5pO0JnRSOQ==
X-Received: by 2002:a17:902:ea92:b029:103:a022:c545 with SMTP id x18-20020a170902ea92b0290103a022c545mr519458plb.43.1623864018878;
        Wed, 16 Jun 2021 10:20:18 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id k13sm2708673pfh.68.2021.06.16.10.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:20:18 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH] cec-compliance: remove One Touch Record Status test
Date:   Wed, 16 Jun 2021 10:19:52 -0700
Message-Id: <20210616171952.9420-1-deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the Record Status test for One Touch Record because the follower
sends these kinds of messages in response to Record On.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
This is part of an Outreachy project to expand the testing of
One Touch Record messages as handled by CEC adapters.

 utils/cec-compliance/cec-test.cpp | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index d28642d7..40d8369d 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -1221,28 +1221,10 @@ static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool i
 	return 0;
 }
 
-static int one_touch_rec_status(struct node *node, unsigned me, unsigned la, bool interactive)
-{
-	struct cec_msg msg;
-
-	cec_msg_init(&msg, me, la);
-	cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_DIG_SERVICE);
-	fail_on_test(!transmit_timeout(node, &msg));
-	if (unrecognized_op(&msg))
-		return OK_NOT_SUPPORTED;
-	if (refused(&msg))
-		return OK_REFUSED;
-	if (cec_msg_status_is_abort(&msg))
-		return OK_PRESUMED;
-
-	return 0;
-}
-
 static const vec_remote_subtests one_touch_rec_subtests{
 	{ "Record TV Screen", CEC_LOG_ADDR_MASK_TV, one_touch_rec_tv_screen },
 	{ "Record On", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_on },
 	{ "Record Off", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_off },
-	{ "Record Status", CEC_LOG_ADDR_MASK_ALL, one_touch_rec_status },
 };
 
 /* Timer Programming */
-- 
2.25.1

