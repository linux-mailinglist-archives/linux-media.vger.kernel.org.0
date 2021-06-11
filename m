Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96253A46F0
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 18:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhFKQs4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 12:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbhFKQsV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 12:48:21 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA4CC0611C2
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 09:45:49 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l1so2948748pgm.1
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 09:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4FAw0Y408/GW16INGdGrUyYUhwwlSZWDWf9EgAdzhyw=;
        b=gOQjR5WP7wfb8+2sNOuS69skWJUYVio9j4Eh1YLrf7vG8BBoFxoCm9zezw6jhRwkYk
         3+VYfWFhkhFM+arqcUhUy5TdSp7AIJ4K3dtpBfJi2KxVrUAY2BfOEpvq3RTJko/gYbNX
         teXLkGU50vlNNMagHG5hqxI5UuoEsic2sRKdyu3ferdpwiEDsH8LXwMhBiseUOxnt/h4
         BewgoMiWY5SibmZow/pAON35FuPpjV0JDS0skQZD2wipD26S2HgWJmHO8M9jd3vzP/L1
         LH8xykHREYF0gnyjFyS5z5Tzz6sJYHRVJLpGW9uLHmYbhAaFfFQeRBueFZCB3cR4+ibR
         cpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4FAw0Y408/GW16INGdGrUyYUhwwlSZWDWf9EgAdzhyw=;
        b=rnEvLgyW/scJk+0TMmraAyaBqOw7a412FRN1UrQ9RKZYxdUtHnMb0QkGx4ej9A0mn+
         xaFd3XsuqRMMD/8KB41rhiqiwcwdKXP0Q8lSr98jCjYvdpFsgGsZFyeefB/ow6yHoJgh
         QilLUAap8p+IHULsrsbvhopvNOh+S8dhWPqf8ARANwiP2G1o8UfOwEW+TNPaoI8arWOR
         4vvpIIULCWc9lOvXILbxM0VQcVdLYLx59WCjCWYZ0IcHj7lp8ghCB4FteqhElKpN3bny
         /mkH2nBM8Z/JDeLGiidjAu0mfNo/JH67YsFPXYRmF93BfAD2L1uj+pvSE1LHZnJ4J83E
         OQXg==
X-Gm-Message-State: AOAM530QB98x3pTy6h5TzUv766SB0N89KoF3boowZ+wDuT/RoQu/iuRX
        72pxRQk6GK/ZaRzNVpeeLgws6oHeDa0Uww==
X-Google-Smtp-Source: ABdhPJy8qc7yB1Addoc9zjT59QL0SvvdaHDbTcCW12yPXzCClepyCbR5eCwnZE4T7KDydlkgfXZzSQ==
X-Received: by 2002:a65:64c4:: with SMTP id t4mr4539367pgv.222.1623429949576;
        Fri, 11 Jun 2021 09:45:49 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id z17sm5815254pfq.218.2021.06.11.09.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:45:49 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v7 3/3] cec-compliance: remove Deck Status test
Date:   Fri, 11 Jun 2021 09:45:27 -0700
Message-Id: <078f90aad584801f8da7b1be118bda4085764d44.1623428727.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623428727.git.deborahbrouwer3563@gmail.com>
References: <cover.1623428727.git.deborahbrouwer3563@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the Deck Status message test because invalid Deck Status messages
are already captured by cec-compliance in other tests.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index d463ffa4..dac188ba 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -696,23 +696,6 @@ static int deck_ctl_give_status_invalid(struct node *node, unsigned me, unsigned
 	return OK;
 }
 
-static int deck_ctl_deck_status(struct node *node, unsigned me, unsigned la, bool interactive)
-{
-	struct cec_msg msg = {};
-
-	cec_msg_init(&msg, me, la);
-	cec_msg_deck_status(&msg, CEC_OP_DECK_INFO_STOP);
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
 static int deck_ctl_deck_ctl(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
@@ -893,7 +876,6 @@ static const vec_remote_subtests deck_ctl_subtests{
 		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
 		deck_ctl_give_status_invalid,
 	},
-	{ "Deck Status", CEC_LOG_ADDR_MASK_ALL, deck_ctl_deck_status },
 	{
 		"Deck Control",
 		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
-- 
2.25.1

